Rails.application.configure do
    config.baukis = {
        staff: {host: "baukis.example.com", path: ""}
        admin: {host: "example.com", path: "admin"}
        customoer: {host: "example.com", path: "mypage"}
    }
end