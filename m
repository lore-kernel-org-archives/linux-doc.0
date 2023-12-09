Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ekfKrsEp"
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B8510E6
	for <linux-doc@vger.kernel.org>; Sat,  9 Dec 2023 03:58:01 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54c5ed26cf6so3810829a12.3
        for <linux-doc@vger.kernel.org>; Sat, 09 Dec 2023 03:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702123080; x=1702727880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YxvYWbM0GztVORxWQCRKtFGI3P1vjafrMQXLrc8bXsU=;
        b=ekfKrsEp60iQDB80zAjyWsOnOerNrpjVtGmFIqdnqZuyc+/+t3IfYAEFZYeIcB/sx+
         GKhpvVFr6WenmEyWPA8c5Xhe6jIfvII7uIl/pmkSgOYDPP4PkagYoz6saXff0J7YEU9m
         MJS/MhK3NxH/ej3yA744hooHlTVEizUlFzJqTQG7tCV0cECD7vQFyfAXlEGL91e5aRIb
         Mr3Y3kE/rpCs1OarP13u+VwCgUzOLx1fIXz+ushU/4UztNzfivNw6lL54ZiF99Nv7Etk
         DQYASzUQlsJI58il4OfeojUFz3gnDpdQrGgb8lfA++dgKZXQb434P07K/jYyWeee2BTt
         W3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702123080; x=1702727880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxvYWbM0GztVORxWQCRKtFGI3P1vjafrMQXLrc8bXsU=;
        b=ElMFouo71KMw0ee+9m61glKnIEIrelVXnjOejbY0X87eBc9v+f6o6qgpPM04VpMlDa
         ta2rpGT33gLBDJXvJ5eSe9WS3see/AdYUuiytzRShi4RBsuZHdcFDJvMzC0vGa6+bG0/
         zqHfvp7KQDI5kSYElusiZ4+6UJs84N5Lbu7GQOOjDkm7F8L+FAzN7LdDMJLx9gJQXFxG
         S/jbHlZ4BItflr4UI5mHqbdLgjJ3RnzmUIUn5W44dUrwyo0qXqkxxM0RT28VpgktAmzD
         AUSwLneik/dEmZfTnkJLwx6fQqAnFy1DPKxu6anyMBYqCTnfHVTGzxOHf3LGtfb02AqC
         oyxw==
X-Gm-Message-State: AOJu0YxbRIHdDcacrlG4nn8TXywkgSf0G15kiI/uR7XEED5EXmgbCJIw
	O6x5OnGVBxl2t7Eq5bjpzOFYpseVuv6DfAbtFEntXw==
X-Google-Smtp-Source: AGHT+IH4nCKaVYLKMFZ8qImJzJYlbXcBHMs9wKrrNxbnEPBuO4YaD1OwSWZij8RLR5R+Nexd3aG0dw==
X-Received: by 2002:a17:907:7203:b0:a19:a19b:55e3 with SMTP id dr3-20020a170907720300b00a19a19b55e3mr889980ejc.115.1702123080035;
        Sat, 09 Dec 2023 03:58:00 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:731f:e6b0:e567:aab6:1db2? ([2a10:bac0:b000:731f:e6b0:e567:aab6:1db2])
        by smtp.gmail.com with ESMTPSA id mn6-20020a1709077b0600b00a18374ade6bsm2129793ejc.67.2023.12.09.03.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 03:57:59 -0800 (PST)
Message-ID: <301cd2d8-e798-41ff-9ae1-814566fe5a19@suse.com>
Date: Sat, 9 Dec 2023 13:57:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Remove reference to syscall trampoline in PTI
Content-Language: en-US
To: corbet@lwn.net
Cc: tglx@linutronix.de, bp@alien8.de, x86@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231102130204.41043-1-nik.borisov@suse.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20231102130204.41043-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.11.23 г. 15:02 ч., Nikolay Borisov wrote:
> Commit bf904d2762ee ("x86/pti/64: Remove the SYSCALL64 entry trampoline")
> removed the syscall trampoline and instead opted to enable using the
> default syscall64 entry point by mapping the percpu TSS. Unfortunately
> the PTI documentation wasn't updated when the respective changes were
> made, so let's bring the doc up to speed.
> 
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>

Ping?
