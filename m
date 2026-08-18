Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5367943B3DA
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045041; cv=none; b=po0TYi+GGZ3+NWQ5htAI6ioQzi0qYGqAtToHAaQ42mIFQBZYLr3Q/FKqqxKs/wjTvrGNS8lFltHIf95Xu+TCueC+gw0TQEeNnB/GwYZYqPSw3/9yhmOUnE8HdN/h6YYmp0qXw0ZfcGEojTdy5Xw4mFWnjcI3Q/OBlZh7gp5RbbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045041; c=relaxed/simple;
	bh=vE/xkEkGu6LbVchHNZXfi5NIG/VHhVrL7aKGOH1km70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxiPP/f9EypQw1WY+yNf/S6nhKUjjaclczQ4gYzA2Z302ikdfSTFyk05tvr7cNPjev0lO5zG7kGk/yS78Y6bT4cUn+hfY/DjqDNhEXgFhS7Un04Xzqp5mdPUGUVTaw7shfqmcmrjc6f9YBDQzgPUtj5WuIFUihZkxmbO7DCn7hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eATEPCJH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eATEPCJH"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso2902826b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 02:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045040; x=1787649840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAclQ+/x9xbtM41ybYxzF9NMeuXpeQRhhxvWzgeGG3k=;
        b=eATEPCJHWWM2kUGQAZApM8P3hRgi/H1Uo2BGzd81GVi1udzGZo+1z8E6CeWRDjBuua
         FDkJ3bv4wQpLl0TtTdIYAlQkHWqm/BTSGPKUPNTliwfC0NkExKSImS1LxPvt13ooaW17
         d6QGwWTio4t6KgzoGyS366pGLny7C8W1OzlCAj5ATuyndGE7ymVJNvQzRrwsCCjgRHAz
         l/m5yX7Q5yDnvSiICP6pZgXGjDc4QDvZ69VgYSAM+USodOQs1FX4a7IG4X9Xd3RjuxrN
         c1ECdQPbGRlbrN0mV/T2H3dpPj+bTJ9e+mTy9+IApa95JcLed0R7EDAAvfEZjfsNO0G9
         5lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045040; x=1787649840;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAclQ+/x9xbtM41ybYxzF9NMeuXpeQRhhxvWzgeGG3k=;
        b=GSHEJUVqjx9RNglQMFcNBnPXpPqr1SVqajrx9x66Z4o9ztF13sgLQGkmxkJLYEKOhO
         eicykaV1Wocjp6RovruW1EyOndsK30jAW67p7mY7JR4jpjkr0NsiO1bslAk3XyXtQxK+
         y9GMN61WAQ5ZIa30R7bceSlczoOarrmqYxa5z7dOq/aJUlzt5jCrAPi9b1wBRklMzmKb
         s9WVwGRDLxbSF7/KwNKYnXsPhTzYiD3VfUDGhQdHtvrqBfKuCPRmx7T54aIIVrnXo2xR
         H7o1BRYaCJJ01KwBks+hCe7UxDrk5ApKURUkUAUfMf/REgjZEbh37az459e0x6XYQ+VE
         eH/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro07opKl0dGUNeUIz4KgYPWUh+N/yQE1mgfbjcoJbmfmWqPR6P8VnVjq7re5/bG6blDmlEAzLF2r2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+J4rQ3EjjjNCEQ8Le+Fp/T8Ho0aLvcvDJ9ICdbca6UzPBgWL
	497sLSqAargWAV5OorXEgVMxIa+kOlU5j7QbIum+ArhhbHVKjbWjAQdv
X-Gm-Gg: AR+sD12poWx4FQ7dH1jKSN1DzifW+ranu+9hrCFlifSHno+IjI+ApO5OPnfZE02v98P
	lj0O35AISiAbHGVxaQhhjB1P/Hf9NsGAAmwRQcTb6MIyNc2Pg8iKW/FoTcdfrB5saDejLdmgZiI
	ld+m6gfXBs/+BDNjvnr7Z4cZ9Piy28okg7Jsfe9Tz8vKOCH/W+q6Vq3sGVFCOkPp9Or6jnqdWa5
	ePBmIkxL4S7qqQMHdKpklj5RMiGz8tAhhED4E68ZAaXlxvYegxy4i8tqBFXp7KkSHcVtuToFYWv
	LnPzXm7qMXYDqNpSCdWKGwUzuHjQ+uIGc3slhFV/IFlzi2xbB9VOeV7sIfZbLoA5PrrbBOcao/u
	DQhxDvlg++8WCURfD57DyGOvq5DAzCYMfcRAckMoNNbHbF8MuvFihfIvGEyRT4AmJUMRehgCYX9
	nFx189OJNqSJ4oUDvRd0CvFqzC69titVaajcUXlU9v2XfTNBn2SisVRB7X7ZXc6H13iFjCmTDxY
	7h98XHwSMDnUr02i7TdUShtftPs1qo=
X-Received: by 2002:a05:6a21:504:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3ccda405880mr10398318637.5.1787045039635;
        Tue, 18 Aug 2026 02:23:59 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:5201:7af2:d284:f1f4:2fa7? ([240e:38b:e68:5201:7af2:d284:f1f4:2fa7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c036c50sm1855489a12.26.2026.08.18.02.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:23:58 -0700 (PDT)
Message-ID: <28579c35-cddc-4c9e-a83e-47867e4869a9@gmail.com>
Date: Tue, 18 Aug 2026 17:23:52 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] docs/zh_TW: localize terminology and sync
 process/ documents
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Weijie Yuan <wy@wyuan.org>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260806181949.65648-1-chenyou910331@gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260806181949.65648-1-chenyou910331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, thanks!

On 2026/8/7 02:19, Chen-Yu Yeh wrote:
> The zh_TW (Traditional Chinese) translations were originally converted
> from the zh_CN tree, so they still use mainland Chinese terminology
> (e.g. 內核, 軟件, 接口) that reads unnatural to Taiwanese readers, and
> most of the process/ documents have fallen behind their English
> originals.
> 
> This series localizes the terminology of the existing zh_TW process/
> documents to Taiwanese Mandarin and, in the same pass, syncs each
> document with its current English original, so that the "update to
> commit" markers stay honest for tools/docs/checktransupdate.py.
> 
> Each patch covers one document and does both the terminology
> localization and the content sync for it. Notable content syncs
> include:

