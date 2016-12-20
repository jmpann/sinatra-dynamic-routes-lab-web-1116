require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    params[:name].reverse
  end

  get '/square/:number' do
    bob = params[:number].to_i * params[:number].to_i
    "#{bob}"
  end

  get '/say/:number/:phrase' do
    num = params[:number].to_i
      num.times.map do |i|
        "#{params[:phrase]}\n"
          ###^you can pass arguement into a loop from outside the loop with interpolation
          ###^interpolation transcends the local scope of the 2nd do loop
      end.join
  end


  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
    #^don't need to concatenates with + when using interpolation
    ##it drops the word exactly into the concatenates and keeps all other characters within the quotation marks.
  end

  get  '/:operation/:number1/:number2' do
    operationalize(params)
  end

  def operationalize(operation,n1,n2)
    n1 = n1.to_i
    n2 = n2.to_i
    case operation
      when "add"
        answer = n1 + n2
      when "subtract"
        answer = n1 - n2
      when "multiply"
        answer = n1*n2
      when "divide"
        answer = n1/n2
      end
      answer
    end

end
