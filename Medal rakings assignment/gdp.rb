module GDP

  filename = 'gdp.txt'
  GDP_HASH = Hash[*File.read(filename).split(/\t|\n/)]

  def get_gdp(key)
    abort("Error, program Aborted:GDP for this country is unknown") unless GDP_HASH.has_key?(key)
    GDP_HASH[key].to_f
  end

end