Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F99263F5B
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419163; cv=none; b=irJJhsCNipkk9aKQFaI0sDpTa/RxGLaEbl06W0+SDnrC4MGv7OunmS0PsQi/D9rKEdmJL4m8sp/eWJXoIg7KZnFzIfvsph5UQyue/9G+avr5CxGmCqVi41K5BYo2+uokCJ7znqdr5xJ9ALRPSeNv5yiNNfIWXJVjVEEnNYDS+J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419163; c=relaxed/simple;
	bh=44t3ugWo7s1SCo/oBsR2znowwvjzKypQDGEeVUKF6yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcoL6hj4kTDbs/5GaEAYwotApGfbehZURZ2qMeV4xSO4Zzbqmn8BXszDtMApdk+QvCyqY9EGtHXKbKgxy/oT2nxtZTqU/f1zdglHbgvMDedmWNiB0OvjyMP4uoOBVn9M1rvF0UxTIfMr1NckqRip48zwkp2cL600lqtY3jQ6TGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPh05XgE; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPh05XgE"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748e378ba4fso2202307b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750419161; x=1751023961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWcQYCAdjshBpZtgIJLvc14crsBwBdASu3siVNzi/Dk=;
        b=TPh05XgEBveNLyaqbLFmjvSMNexlLLmozaguQCvpJVOqU5OH1uvWwRxNkGcLiybMF3
         sLvWTv/+PJ7/e9ugDLZEf2xTfrxOqt3KUaKJw4rboFdy+bts4VEt4SWSeoqrCcWYQ6Ul
         6+cTak3LqUblUHcMhixLRBuv3xd+eJ9CHEQSrhSigRCh8FgDcKFUKRhK5/77Ya591l5Q
         NRCFFX8FOGjbWoe8oFbyfgQ/mlel1A1eYI/VH0fnHPYYSRiGBvIfOjOen91TWfWa1t+K
         SDVrBakP0yCbH9MOjdp8SZJ6w3y8vEmUrn8yX+Px6G93KlAHNxFfMohDti3flQdkyOtO
         AD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750419161; x=1751023961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWcQYCAdjshBpZtgIJLvc14crsBwBdASu3siVNzi/Dk=;
        b=QDWg6IlC6McDzQJvShtMIqAbxGkGmFZjdAvEsFygJyH8Wwd4KAEoA3f/odOcWWraM2
         dGW8a61UhJatr/Jx7FgqN5oysyMnXeO5VfLQFbpNeHAskPhOstb7oiLFTXwdpFcGLwPO
         G+pkfK+hTo1sIR4suthO3tY2vl6mSCh2euB/uQ7vpd6QMqIHb7/Jk+ngpZhvFhIwedY4
         U8gtI1/k3xU1nZ31U3KZEukKZxxKtKHpg6lAo5r5uzwpfAmHq8c+tZqmYIkzQAq479Bx
         9JptfFHvMcJURyCNwLK8cXMmK18c+W2gU84qTdzdEHO0Mx/lTXie9XIVN2O+/X9v0KcO
         hfaw==
X-Forwarded-Encrypted: i=1; AJvYcCU1DvLTBhQzflWJCGe+b5HajIrBsvLZAWlpHXJgBWBBW2T/hoMkETuCPuW46ur/3NEoh+34J1APJOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSRbC6cx0F+5se3q1Fa3wSj2aUNgfT4BdsIE5f43qfkHK+O6+O
	ZFmFyMtlQtwyuf9944LWxUS8E7EFFZZTUithsScHsDlyF6ki8zFDxjoajrAM5A==
X-Gm-Gg: ASbGnctoVirIizRMUutYz28WoS7edlRjks1raSGTP5Cr8Ks79RYKeruiQLM3vdvz1VV
	QBG1zxndRKvIqGzggWI1ONxZqIcBqv/iE2AjMMLGx6CBCw2V5r3eTqUBuEGAU4ziilv8SN7DUB3
	aKYEh2TbpYQNGWQOivB+AsHi74pqhxM0JlKzcHTjVWhXZjIokAdkSRv1Uf59cDBryZBxvSUDhWh
	b17YdZzLj2ARE9h3MKydgJF+oMrTVDljJt5LpyYZmh1rDAQWCI9Q0Jv92VdRuv+OKRWZBjLTQNe
	EUQasFZd5VMZ/H8eECxsuvnzf6fdqDucviOxcIWOKJvRKdJlAB5bDNmw5Y8yAI99QbyMJXWtpKw
	djmbGhoQfRSCfO33GveyV0CSTJeYRWFZq
X-Google-Smtp-Source: AGHT+IF4lOymlkBsZlLxejHDok/JDecpG6NIQTOyCVCyD9ng9iQUVDzHlIgIZXE78gH9mAUvCNqCFg==
X-Received: by 2002:a05:6a00:1493:b0:742:b3a6:db09 with SMTP id d2e1a72fcca58-7490d6317b9mr3367859b3a.16.1750419161480;
        Fri, 20 Jun 2025 04:32:41 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b071sm1847861b3a.33.2025.06.20.04.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:32:40 -0700 (PDT)
Message-ID: <528f0354-1869-4cfe-b71d-fe169b2bfc76@gmail.com>
Date: Fri, 20 Jun 2025 20:14:57 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs: sphinx: avoid using the deprecated node.set_class()
To: Mauro Carvalho Chehab <maurochehab@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
References: <87wm97fmn3.fsf@trenco.lwn.net>
 <03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
 <20250620094430.212779e5@foz.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250620094430.212779e5@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Mauro!

On Fri, 20 Jun 2025 09:44:30 +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 20 Jun 2025 11:22:48 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
[...]

> 
> I didn't test it yet, but yesterday I wrote a script which allows us to test
> for Sphinx version breakages on multiple versions in one go.
> 
> Using it (and again before this patch, but after my parser-yaml series), I 
> noticed that 6.0.1 with "-jauto" with those packages:

Why did you pick 6.0.1, which was in the middle of successive releases in
early 6.x days. 
No distro Sphinx packagers have picked this version.

Just see the release history:

[2022-10-16]  5.3.0  ### stable ###
[2022-12-29]  6.0.0
[2023-01-05]  6.0.1
[2023-01-05]  6.1.0  6.1.1 
[2023-01-07]  6.1.2
[2023-01-10]  6.1.3  ### stable ###
[2023-04-23]  6.2.0

The crash you observed is hardly related to this fix.

I'd ignore this report as a random noise.
My Tested-by: still stands.

Regards,
Akira

