Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC4E4C9D
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764139252; cv=none; b=eehSwYYrTr2A3IVGcvpeuv8HhmUcqk+QgrcUcUwqasXm+mdw/xjhZaHwhHAmBeZpBB1Dc9bfk1DotianLyz7D5xXLPoe2ErSjaPvHeBBoeWwo1MkFBy/oMqir/fYM8d1Q1+j4Cjs+fo0pV5Sr7JKJ4PMJA5V8wn0a0zoxgPdI5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764139252; c=relaxed/simple;
	bh=G3Wmb5Bcrl87AmPDvgU1Nml/aijaHLU3e7QkkVNZG1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2B5O0KrHL1qKeHHDFttcadAy8BoBtHfnuN+BVsm8d940ptVMNKDfy8ZzyjgPLDMt2qrXQBgY7bS89MC1VK48IWvPoRZzIaAQ5Rmls2syliLdlvwGdUk2/czFhD86aRnf+IkXCjP1MCQVOw32pKBAYz9RtACacwRLXXJdIHKpH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eK2we0XB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eK2we0XB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2984dfae0acso99660675ad.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 22:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764139250; x=1764744050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgZDilUcU47TM23lY25/6sOO3zUBubQ/SLPjpM5WRLM=;
        b=eK2we0XBDq0aLKXtvzL84QUA65HxdthhsFAQyaNzkDxMTPs2jBUI48TmOn2Opsp4ej
         7e2t46PSvM7RzkKspmrwSB2JK4DleNr6GXjAITJmFvo73GBRpBMuh07hyoy1pv6+ejRx
         bARSQQcTo0n4hBr2eUJhbCb3H7U0DEXTpF7HqvvVt4XuXDp7SsTQLNZuiXVd9rNVFArE
         TlZpt4P45IzYiZ6OkudZkIuoqBsY8DBMJMrIIe1e02u2q7vd0X0I2RkGwkDhmVtRrIGI
         TjLIvWGvxiIFswG3ANEAXKMuYIxEFJtIoJcsYbCBXMXbuxUPptKyDW6WZpvEO2CXKQRM
         LR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139250; x=1764744050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgZDilUcU47TM23lY25/6sOO3zUBubQ/SLPjpM5WRLM=;
        b=RFBZG8+qxVJTjP1TbQ95YO3M4WLKdE21vSy2iAaZBem4iKMTzcaeR0w5FYT2gLuSEN
         s9OB2+kOMomaWF5NH1k1hJRu3romqZq771MsKlbBIWNyqhF80VGiPsV2Tqx0cRwPFuhB
         L1BP3A3bDkwqHULXxHbxR/sVm42qCBHYWdzKvDMqpPOatIuVtUAnSwkBdP+vNPfH6adl
         HjqSZ0QSv388dR/wsHCV4Yp+wrWsIz33eo0j3TAt7kVG9gjIwXHRnxL03LXUSycAfKtR
         OvE0qqZEFTJ/Dm2SSA4RJ0f/FlE5URQswZqs91d4VVvH2gBrzkJOzLU/nIY9GtNqfHOY
         EcHA==
X-Forwarded-Encrypted: i=1; AJvYcCVHd3vDWsGHoNIVk4qjjgbo9xNc0unjezX3qOWxFVW316e2S9wBDkXb8Q6xGqaPlss9+tqaUbt0Bag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtOcDagRtgAw/su+AxjOeffGy32f+cAGiwQ8ouNPv8cOXqlDI
	vYdLlndr2hhl4ozSVvAk6/iUZv70jHjXAv6OyZGdFuDzrYpVSfKzTyvk
X-Gm-Gg: ASbGncuwhNiV+21Ixp5nRJEZ2Bo0YK2Fkt/T32hswqj2+JS5G0JAPQgaQonWsWHzF2G
	hafjKCa5qPP6J/Y8pVAdALIkf+94wmr7+m4nKulKq3tJJ+oU9Up1mYM3tRVK8c30V/HnxWL5x3J
	YqO7CN0tSGMsfsLP+8HtxFED+0m+qP+Qjp5zFXiJHHL/DuAl5kFOXeDfiL3O0QavUfofuFEVYXj
	AEmN/2KgyB17Cg0mf83t2fYTOFWPrOCFETJoodUDGWvAgpctwiTrItlNSYvf5ntZmGC+8WbXwiU
	oQloK3Rl8dwzfmfNtRnZ1RM2lTUk/79hs2Vgv1YRO2Yho4NB+NS+443EKr3QHCsA2FzGFChe4QS
	URggwUvEf35YDZFTD+2sEg9jUlJtxbqrBrrHgcdjTg9Bbj1FwQMMGueCQ8fYRvgij69oOZ99GFo
	ou2Ft3SJxB
X-Google-Smtp-Source: AGHT+IG+LJjyn0YPkwMUMGuQRCwuJD2ciPomMK+g0iJgP4XpvfFjmTudN4ZLBZnkDftpm36EtldNNQ==
X-Received: by 2002:a17:903:3204:b0:298:2637:800b with SMTP id d9443c01a7336-29bab148a83mr65241735ad.31.1764139249822;
        Tue, 25 Nov 2025 22:40:49 -0800 (PST)
Received: from [192.168.2.226] ([114.92.45.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm181788965ad.25.2025.11.25.22.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 22:40:49 -0800 (PST)
Message-ID: <86fbcc36-f55d-4427-810e-475da55cb4b1@gmail.com>
Date: Wed, 26 Nov 2025 14:40:45 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] docs/zh_CN: Add translations for libsas and wd719x
To: Yujie Zhang <yjzhang@leap-io-kernel.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763964599.git.yjzhang@leap-io-kernel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <cover.1763964599.git.yjzhang@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Applied, Thanks

On 2025/11/24 14:28, Yujie Zhang wrote:
> This series adds Chinese translations for libsas.rst and wd719x.rst
> under docs/zh_CN.
> 
> Changes in v3:
>   - Fix extra '=' in heading
>   - Link to v2:https://lore.kernel.org/all/cover.1763886358.git.yjzhang@leap-io-kernel.com/
> 
> Changes in v2:
>   - Adjust document to follow RST syntax
>   - Link to v1:https://lore.kernel.org/all/cover.1763112421.git.yjzhang@leap-io-kernel.com/
> 
> Yujie Zhang (2):
>    docs/zh_CN: Add libsas.rst translation
>    docs/zh_CN: Add wd719x.rst translation
> 
>   .../translations/zh_CN/scsi/index.rst         |   4 +-
>   .../translations/zh_CN/scsi/libsas.rst        | 425 ++++++++++++++++++
>   .../translations/zh_CN/scsi/wd719x.rst        |  35 ++
>   3 files changed, 462 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/scsi/libsas.rst
>   create mode 100644 Documentation/translations/zh_CN/scsi/wd719x.rst
> 
> -- 2.25.1

