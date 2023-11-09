Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037F199C0
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dpufDYmy"
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFD7211F
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 02:39:06 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-408434ce195so1535515e9.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Nov 2023 02:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699526345; x=1700131145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmGbwmaXtBtukBQbSz5/AjnhxMx8QNKzqe9+KNioNp0=;
        b=dpufDYmyevNF6IVh+HAMmA+4yya5tgBTewSwwUyBn5wa3+qOROWDB9OVo/cyFtRViS
         kwr5rFV2cDJ7tvmbGW5Rbf1NgFE6pxZTd9TwEFpLwq1TohczHNnzCnTqAwzYzomxAu6v
         247To/UFiA5Mf05KYfpWKfXJM+n0P5XUFzWtMbvO3OWEHuvbmyCmo1sS6/rT0WZXN+hJ
         JdQJYfvNI+7UHrUcj8/rrEHSNe2S2EO7TA9qoFd62qQkTivnk7cEtFi3awafAXSNi9x2
         Wjd6co14z4Y7xZ6Pn6+RBE8gJjinzT9LHFJfeXRwuKOHymI4vDxPGDhc2IvznoVx7MyB
         KZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526345; x=1700131145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmGbwmaXtBtukBQbSz5/AjnhxMx8QNKzqe9+KNioNp0=;
        b=KKMpMBjBy+vjkL0UowcbTTXHDgBj80Igmkm5CtM2qV9rGV0gYgMIQC2aK6xJD4UABo
         rYdquFUjACR7cXj0mL1i/zTtgkeTfA1aaqeopmwkekDwvu2obaEPSz/iFTi6apv7Js3F
         wH2paxHysUqHuZ2khsVrshZzm279ENaB6YosmuCQIMdMmTPFMVsvclHXx/Jem67+KIZ8
         IeKaEurmgfBhSYF9KPhfGr7NYBooBIc5ID/clwjMeDD/G11R3I+1Ucla0sWM09pvFiZN
         IVAFUB0omx/rFAY9fee9GP/khilMfkGa9OUgVM2iTgv8WBakw2rKGM3+phld3jU3XNzF
         C/RA==
X-Gm-Message-State: AOJu0Yw4rYUGS4LcF6PGopvnhJ5jm+08sLagdqPX/guh9avJ6jnjDPim
	hKrZHkRVmEGGjkLfJPuuK3jQ6dufVtiJ0lnZqD5UPQ==
X-Google-Smtp-Source: AGHT+IGJDtJU0vy2RLytoP9NwcqdfAiEsZKNe2CEhkkrVnWPGJ8hlOjTlrHY/RwmZQGojP3I0Fa1xA==
X-Received: by 2002:a7b:c4d7:0:b0:408:3836:525f with SMTP id g23-20020a7bc4d7000000b004083836525fmr4014084wmk.1.1699526344873;
        Thu, 09 Nov 2023 02:39:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:87b4:87b9:6476:5df7? ([2a01:e0a:999:a3a0:87b4:87b9:6476:5df7])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b004080f0376a0sm1662458wmq.42.2023.11.09.02.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 02:39:04 -0800 (PST)
Message-ID: <fd022864-f276-4c4c-84ea-0752b915a9b3@rivosinc.com>
Date: Thu, 9 Nov 2023 11:39:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
Content-Language: en-US
To: Jerry Shih <jerry.shih@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
 <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
 <20231109-revolver-heat-9f4788c51bbf@wendy>
 <20231109-prevalent-serrated-d40eb5f71236@wendy>
 <F2C4CCA2-0513-4988-94C4-1ECEB9F1D578@sifive.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <F2C4CCA2-0513-4988-94C4-1ECEB9F1D578@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/11/2023 10:45, Jerry Shih wrote:
> On Nov 9, 2023, at 15:54, Conor Dooley <conor.dooley@microchip.com> wrote:
>> On Thu, Nov 09, 2023 at 07:44:46AM +0000, Conor Dooley wrote:
>>> On Thu, Nov 09, 2023 at 10:58:41AM +0800, Jerry Shih wrote:
>>>> On Nov 7, 2023, at 18:55, Clément Léger <cleger@rivosinc.com> wrote:
>>>> The Zvknha and Zvknhb are exclusive. It's not the superset relationship.
>>>>
>>>> Please check:
>>>> https://github.com/riscv/riscv-crypto/issues/364#issuecomment-1726782096
>>>
>>> You got a response to this on the previous version, but didn't engage
>>> with it:
>>> https://lore.kernel.org/all/c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc.com/#t
> 
> Reply for the thread:
> https://lore.kernel.org/all/c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc.com/#t

Hi Jerry,

Sorry for that, I actually thought my mailer was broken and fixed the
mail the first time I answered but not the second time...

> 
>> Yes, but for instance, what happens if the user query the zvknha (if it
>> only needs SHA256) but zvknhb is present. If we don't declare zvknha,
>> then it will fail but the support would actually be present due to
>> zvknhb being there.
> 
> If we needs SHA256 only, then we should check whether we have zvknha `or` zvknhb.
> https://github.com/openssl/openssl/blob/4d4657cb6ba364dfa60681948b0a30c40bee31ca/crypto/sha/sha_riscv.c#L24

Ok, and if there is already some userspace code that behaves like that,
let's go this way and do not treat that as a superset.

Thanks,

Clément

> 
>> Ahh, I now see what that happened. Your mailer is broken and puts the
>> message-id of what you are replying to in the In-Reply-To and Reply-To
>> headers. The former is correct, the latter is bogus & means you don't even
>> get delivered the response.
> 
> I use mac builtin `mail` client. And I think I put the `in-reply-to` address to
> the `reply to` field. Hope this one works well. Thank you for the thread forwarding.
> 
> -Jerry
