class Chef
  module Zabbix
    class << self
      def default_download_url(branch, version)
        "http://downloads.sourceforge.net/project/zabbix/#{branch}/#{version}/zabbix-#{version}.tar.gz"
      end

      def php_packages(packages)
        if node['zabbix']['server']['php']['version'] != 'default'
          case node['platform']
            when 'redhat', 'centos', 'scientific', 'amazon', 'oracle'
              packages.map { |d| (d.start_with?('php-') || d == 'php') ? "php#{node['zabbix']['server']['php']['version']}-" + d : d}
          end
        end
      end
    end
  end
end
