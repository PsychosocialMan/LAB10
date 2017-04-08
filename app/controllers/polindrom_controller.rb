class PolindromController < ApplicationController
  def input
  end

  def output
    n = (buf = params[:n].to_f).zero? && !params[:n].eql?('0') ? -1 : buf
    @result_array = find_them_all(n)
    @num = @result_array.length

    respond_to do |format|
      format.html
      format.xml do
        render xml: {
            description: 'Ответ',
            result: { 
              number_of_palindromes: @num,
              array: to_a_of_obj(@result_array, @result_array.map{ |x| x**2 })
            }
        }
      end
    end
  end

  def find_them_all(n)
    0.upto(n).select do |x|
			(flag = is_palindrome?(x)) && flag == is_palindrome?(x**2)
    end
  end

  def is_palindrome?(num)
    num.to_s.eql?(num.to_s.reverse)
  end
  
  def to_a_of_obj(array_1, array_2)
    (0...array_1.length).each.map{ |i| {el: array_1[i], sqr_el: array_2[i]} }
  end

end
