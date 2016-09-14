module CertCheck
    class Check
        attr_reader :domain

        def initialize(params = {})
            @domain = params[:domain]
        end

        def run(params = {})
            Net::HTTP.start(domain, 443, :use_ssl => true) do |http|
                expiration = http.peer_cert.not_after
                now = Time.now

                expiration_days_away = ((expiration - now) / 86400).round(2)

                return expiration_days_away
            end
        end
    end
end
