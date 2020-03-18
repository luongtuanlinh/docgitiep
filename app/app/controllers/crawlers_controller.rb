class CrawlersController < ApplicationController
  def alphabook_crawler
    agent = Mechanize.new
    # page = agent.get "http://news.google.com"
    book_list_page = agent.get "https://alphabooks.vn/alpha-biz"

    @book_array = []

    category_list = book_list_page.search "#categories_block_left li.list-item"

    category_list.each_with_index do |category, index|
      book_list_page = agent.click(category.at('a'))
      puts category.at('a').attributes["href"].text + ' (' + ((index+1)*100/category_list.count()).to_s + '%)'
      next if category.at('a').attributes["href"].text == '/combo-sach'
      while true
        book_list = book_list_page.search ".item-inner"

        book_list.each_with_index do |book|
          title = book.at("h3 a").text
          image = "https:" + book.at("img").attributes["src"].text
          @book_array << { name: title, image: image }
        end

        break unless book_list_page.at('.tzpagenavi-shop .fa-angle-right')
        book_list_page = agent.click(book_list_page.search('.tzpagenavi-shop a').last)
      end
    end

    #Update database
    # Book.delete_all

    # @book_array.each do |book|
    #   Book.create(book)
    # end

    render plain: @book_array
  end

  def tiki_crawler
    agent = Mechanize.new
    headers = {
      'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36'
    }
    agent.request_headers = headers

    ## Update database
    Book.delete_all
    Author.delete_all
    Subject.delete_all

    main_book_categories = [
      'https://tiki.vn/sach-truyen-tieng-viet/c316?_lc=Vk4wMzQwMjkwMDc%3D',
      'https://tiki.vn/sach-tieng-anh/c320?_lc=Vk4wMzQwMjkwMDc%3D'
    ]

    book_list_page = agent.get("https://tiki.vn/sach-truyen-tieng-viet/c316?_lc=Vk4wMzQwMjkwMDc%3D")

    @book_array = []
    @author_array = []
    @subject_array = []

    child_book_categories = book_list_page.search "#collapse-category .list-group-item.is-child"

    child_book_categories.each_with_index do |category, index|
      book_list_page = agent.click(category.at('a.list-group-item'))
      puts category.at('a.list-group-item').attributes["href"].text + ' (' + ((index+1)*100/child_book_categories.count()).to_s + '%)'
      while true
        book_list = book_list_page.search ".product-box-list .product-item"
        # binding.pry
        book_list.each do |book|
          title = book.attributes["data-title"].text
          image = book.at("img.product-image").attributes["src"].text
          subjects = book.attributes['data-category'].text.split('/');
          subjects.map! {|subject| subject.strip }

          # Access book detail
          book_detail = agent.click(book.at "a")
          description = book_detail.at("#gioi-thieu").inner_html
          author = book_detail.at('.product-brand-block').search('.brand-block-row').last().at('a').text

          book_data = { name: title, image: image, description: description }

          book = Book.new(book_data)

          author_id = @author_array.index{ |a| a.name == author }
          if (author_id.nil?)
            author_record = Author.create({ name: author })
            book.author = author_record
            @author_array << author_record
          else
            book.author = @author_array[author_id]
          end

          subjects.each do |subject|
            subject_id = @subject_array.index{ |subj| subj.name == subject }
            if (subject_id.nil?)
              subject_record = Subject.create({ name: subject })
              book.subjects << subject_record
              @subject_array << subject_record
            else
              book.subjects << @subject_array[subject_id]
            end
          end

          book.save
          @book_array << book_data
        end

        break unless book_list_page.at('.list-pager a.next')
        book_list_page = agent.click(book_list_page.at('.list-pager a.next'))
      end
    end

    render plain: @book_array
  end
end
