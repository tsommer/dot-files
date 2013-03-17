Maid.rules do
  rule "Old files downloaded" do
    dir("~/Downloads/*").each do |path|
      if File.file?(path)
        trash(path) if 1.week.since?(accessed_at(path))
      else
        glob_path = path.gsub(/\[.+\]/, "*")
        files     = Dir[File.join(glob_path, "**/*.*")]

        trash(path) if files.all? { |file| 1.week.since?(accessed_at(file)) }
      end
    end
  end
end

