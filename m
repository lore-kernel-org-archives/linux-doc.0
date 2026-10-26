Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013943;
	b=389j81y/joYnLJ0Eldbb0UKKV0untPLaFpXi9xbEDtL8nUvhcmi8yY3p5mO0RxT82Vc5
	 pNQ61vidJeblJhAGr0TLLEwiJJtahkg3KTHCc3StdueohejNMsohcirNEO3aA6Omy7sx1
	 ruZuFQ2h6wyNP3GT7Iil0NgDafWMcPn1ULbiHoNIj3J/nm6SuvBwdOMOaN3ih+mgWM2Zv
	 GJyj98PNujU+yj6X4NlSryCR6hWONcXlRYamvfy9ED4c8H7saQ0GB3UHwwVFA19fitgiK
	 1LJnwfzP3cz5PAz11dtyYl/UEvcUi2/ZfITPw9rvBiEV3D6PzhiL4kiAOl6V3E1rh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
	b=NKRD6ylPA3CF9r2f84tZaHwLX120/smsrpXqJ1uoM06XpcNXGhOKqxr4uvd3dpIDQgno
	 Zct/FGFTNywt1AwxeqlN+GCGPPg6IsBan1eRItXlE0rrXBuGkbBXc1OPF4VxdSR8X41ws
	 /t5FZn8PUBE968NCGqerJ3W/AcyHZXzfI+5iH3PEU+GouxhfBA9BeRUwx7jN+KGL95kFw
	 AWmRARJf3fkMQIFEtSmtm3aNsyQ17u1e93T3ETUHPg0vtBlMjsM/As/9VK3LHB62soje3
	 PfLWYBONHAnFyO5fMNCTSHCVSy0YTuoLl4Yb3qtWFZlZu9dXWApJ7iy/rULgXQ4q8YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eV5jybMS;
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D23606A31E
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D23606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eV5jybMS
Received: by mail-yx2-f4.google.com with SMTP id 00721157ae682-8b0dbcd4b6aso5329767b3.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013941; x=1793618741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
        b=eV5jybMSqOG9bpl2tJh0auk9VkaeAh9svu9HUTruj0TE6ut2p9ieQtaT4334wJijWQ
         j2OijJAAmWx+5EvpkGrgmmAdJy2eLkbVeOKuy9UDdGgvmdXb0o6hx2+gd2yCR1JVI7qg
         a/Ldlbva9AtFcMz/L3AtCnjN8Mtg9VBqhTq2HtkaFyxVFeLvTFMtOWXX1XIw4GfZK27e
         GdNhyZAMdopArMDhbBb5l3qliu+MA3NyZIAUJjn9S+5JpXKaAuWtmEjEEnaNLCiqi908
         xcW7Gq1PEIPwQTsWgFsWh2UKoIszphwpxcgTVAnJxXwhKbyINS9e6yxF1kQOZ2DgMrHo
         CJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013941; x=1793618741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
        b=j2sfD8svCE4TfgEVo+vbEJDEPOey6AAXEDVgnwZZuf9+xKnJVaxUYvAOYRAQOCBXD2
         xrVuyRbw8q7WhHPjgUwvimITYrNZj3fgKyMm3dWDlvsp5Qr/LQ15wz2dw80vHtSmUcQF
         w8DIuvJOJIW8vLD8a4UbZgDgZRvjpHbwU1wwhR9F4IxIkFjxh3QuDnb9MzGdGAuo/ZsO
         Xg1f3ge9MaMYnlWRIkZjBHF/BsU+pb5jwWYpkGfEol/YdncjYlkC8Rloxn3+lSAzCEKO
         OoIYD07SLUr7qoB/VBWYdc04FJDT3lDyH2rpbl4Y8Hy+0FY8xvF3JI4DUBxgkQSJvOPJ
         eLEA==
X-Forwarded-Encrypted: i=1; AKwUvBwZukejt8lZRYTCpLZaX/3/7j/+6zcXO9iMvl495WYfIf1+e0EVvUft0GKb/tR+iQ7HoCf0IvinxeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCWhH84ll6GgpNnS06HJNCUi6nIb8QkS1Jv50ALJ3fQsr1xpoV
	qkNDCPUGXj/MB/KSvClTO1lQa3EswbHS/AR3pN5OJ7FxfYPVy7yNH9Xg
X-Gm-Gg: AYBFou15ekBDkWUeFOMXRUa2SsOj1p0x7Z3TlyHwI4JwsWbLoDUl9xghLz36wbx8zyz
	zNrrRZElPWEsp7t/5T+pecVMJCbQhn2Xqd2ndZtUyAygMZUpXYR5bEvg8wcQy85+mQRBBt5jGiy
	X8JlHpH4sRxR7bZNd6qBxQvdJVMQHiG1rW3KQN+Y6d80tQCN0pnzaWHmrGPGWseBnh9LKMcVe3r
	MhiWoNwE9j3FKvOHUbocW44kROSxB5u5f8rpPS712NgOG0/9jwIIEZvi7x+kze9Xv+EcYqX12iN
	P6XXme3sAcHS2l/UKLKi2cHGERgeBow6OI/40SoKYqmykTHCPnEynQBKpX/0/zScNO8lkni7xlW
	fVfu0t/IaIfIUs6qqhXOyfGxMTMLbCIR8D1dHRQ8DEINsLUuNB56alm+b5R2QQW5HRRBcgyTAe2
	eiZEGSsD6SHWbF4b4xjuUlSI98DBQXaQcxheBtLjiVWfS3KRMzqxzaczYJdu0kAROnWN29HzE6k
	f5hUVaVGL5t49VY5mPzmW4WJFvDNYoN50c3Sqp32NO9DfjS7vJiV8m2u1OwwJD3
X-Received: by 2002:a05:690c:2788:b0:8b0:eab2:f502 with SMTP id 00721157ae682-8b166c93421mr38305577b3.61.1793013941439;
        Mon, 26 Oct 2026 04:25:41 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm29719597b3.5.2026.10.26.04.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:25:41 -0700 (PDT)
Message-ID: <c0c4dc10-8999-4c4b-977c-69beaae7bdcf@gmail.com>
Date: Mon, 26 Oct 2026 07:25:39 -0400
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 1/5] tls: add HKDF-Expand-Label for the TLS
 1.3 key schedule
To: Hannes Reinecke <hare@suse.de>, John Fastabend
 <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
 <20261025-keyupdate-rfc-v1-1-60b7756eccbd@gmail.com>
 <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/26/26 03:27, Hannes Reinecke wrote:
> On 10/26/26 1:36 AM, Martin Belanger via B4 Relay wrote:
>> From: Martin Belanger <martin.belanger@dell.com>
>>
>> A TLS 1.3 KeyUpdate derives the next traffic secret, key and IV with
>> HKDF-Expand-Label (RFC 9846, section 7.2). Add the helper for the
>> kernel to do this itself.
>>
>> Only the part of the key schedule after the handshake is needed. The
>> input is a traffic secret, which is already a pseudorandom key, so
>> HKDF-Extract is not needed. Each output is at most Hash.length bytes,
>> so each derivation is a single HMAC with the library SHA-256 or SHA-384
>> functions.
>>
>> Assisted-by: LLM
>> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
>> ---
>>   net/tls/Kconfig    |  2 ++
>>   net/tls/Makefile   |  2 +-
>>   net/tls/tls.h      |  2 ++
>>   net/tls/tls_hkdf.c | 82 
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 87 insertions(+), 1 deletion(-)
>>
> And another HKDF implementation. Maybe it's time to split if off (again).
> But anyway.
>
Yes. crypto/hkdf.c went away again in 6d888db2cfd9 ("crypto: remove
HKDF library"), when fscrypt and nvme-auth moved to the HMAC library.
tls_hkdf.c follows that pattern. It needs only HKDF-Expand-Label, which
is one HMAC here. If a shared helper is wanted again, I would do it in
a separate series.

Thanks for the review.

Martin

> Reviewed-by: Hannes Reinecke <hare@kernel.org>
>
> Cheers,
>
> Hannes
