Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="EUHekREu"
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518F6A5
	for <linux-doc@vger.kernel.org>; Fri, 17 Nov 2023 09:37:10 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5098e423ba2so3206458e87.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Nov 2023 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1700242628; x=1700847428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPWfawxMvCCwqgwMcoz01kVUlEDZwsGaKlCMKco8RAs=;
        b=EUHekREu0jCPjysi23dKCma4wjjQv4tXXanOI7xgbWblA++fHFQ0InQxfh/3OGuUy+
         mgO/NfO3oC49RDpqkLjSJ0+FaLr74gQ+lbjuCsvkYtyAJL0Uhhg7huTZzyzNAAeAkBzy
         cIv3nvmf+JEHvtCsu4sg3h21Ma3C6YCnf9p4qs2RI/YkibdqPY+Z93eZCF8iYtqQ8qFQ
         5McSAU8KeTfaiUUAqIXr6eyYGdouB2EheCP/XunFKg79wdGFKk077ylOXp2TfY3Ms8w7
         /Ovdd6iRjz5D8TMzbtLGCPLY2rgbaVemqhZ7745y3vzPCW3I/f2XMWvpeyF9JKMrU3hn
         mRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700242628; x=1700847428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPWfawxMvCCwqgwMcoz01kVUlEDZwsGaKlCMKco8RAs=;
        b=UMabvEGqyn8GoQQoZECjZPyik+ys1EYT5z/BG02gqGL9zqWg6IDLIBN2vUgTHIwSe0
         lACflBMnsRrMkoKc33HIE3PZW135uGckAkWu2E7WC7w2mvBIyzTcnGxr5FTJGC6aa/xK
         xx2Z2VTjj9UTpFQHUgbp74AbhZYT9jsxgjyA96ii8G2QKAnURg/y4oA0Q8gPY/FSlAvb
         S0pmRX+otClMfsz5kIOu6vV26LAO0Ki5iTNWxQjpFCIxVk/XJjfq1WsDOWYR5OIGXqtG
         DqWUNT8AND/sh+sU8yaUBUCV4rpsqHGDg4CnaOYLPEHGhUvtSBikRX4nubQJld6Zkffu
         h9Fw==
X-Gm-Message-State: AOJu0YxUaZBaVUpfZAgTJmc1U9E8zWbmXkvV/JFVcCXvwGd2lKGuCrZV
	pZxRDfNTkqOkgEupUV21IWDlKQ==
X-Google-Smtp-Source: AGHT+IG8vNGCKqG775W9hqhVbWFrKq/2354SflCixUg3G4oiDXO4NcB1WZozj6WQ/9GOg8GMkwEY4A==
X-Received: by 2002:a05:6512:48d6:b0:509:49f1:b7c8 with SMTP id er22-20020a05651248d600b0050949f1b7c8mr211662lfb.21.1700242628451;
        Fri, 17 Nov 2023 09:37:08 -0800 (PST)
Received: from [10.83.37.178] ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d45c8000000b003142e438e8csm2918402wrs.26.2023.11.17.09.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 09:37:07 -0800 (PST)
Message-ID: <f41954c0-e303-4d6c-b308-d0dfd00ee251@arista.com>
Date: Fri, 17 Nov 2023 17:37:05 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 net-next 23/23] Documentation/tcp: Add TCP-AO
 documentation
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski
 <luto@amacapital.net>, Ard Biesheuvel <ardb@kernel.org>,
 Bob Gilligan <gilligan@arista.com>, Dan Carpenter <error27@gmail.com>,
 David Laight <David.Laight@aculab.com>, Dmitry Safonov
 <0x7f454c46@gmail.com>, Dominik Gaillardetz <dgaillar@ciena.com>,
 Donald Cassidy <dcassidy@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Francesco Ruggeri <fruggeri05@gmail.com>,
 Francois Tetreault <ftetreau@ciena.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>,
 Ivan Delalande <colona@arista.com>, Leonard Crestez <cdleonard@gmail.com>,
 Mohammad Nassiri <mnassiri@ciena.com>,
 Salam Noureddine <noureddine@arista.com>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231023192217.426455-24-dima@arista.com>
 <2745ab4e-acac-40d4-83bf-37f2600d0c3d@web.de>
From: Dmitry Safonov <dima@arista.com>
In-Reply-To: <2745ab4e-acac-40d4-83bf-37f2600d0c3d@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Markus,

On 11/17/23 13:07, Markus Elfring wrote:
> …
>> +++ b/Documentation/networking/tcp_ao.rst
>> @@ -0,0 +1,444 @@
> …
>> +                                          … failure. But sine keeping
> …
> 
> I find this wording improvable.
> How do you think about to use the word “since” here?

Nice, there are people who actually read the docs! :-)

I'll send a patch crediting you.

Thanks,
             Dmitry

