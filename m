Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882045;
	b=OBSsdBJSvDxCdyCoRwOrTs2NPR84HzfzlU9mwyEaxl7HrE1q8/LSFu6kjD27F7iYgUhu
	 3lg0tbMFfuMS9vSpJAfdqCXlpEaO33HJHcfAThgtX5/1/qgbMqwUxCVMrFKpltUy+LhJJ
	 XVPpeYGGlQk4EC/+Cd9tSIau1WhM2a6/oJwgw5Qs79XnTZliLPw1fSY4KsQZengIU53r/
	 Msvi7wNXu/G8RVMPURAeOkuNjpJ6UyGWaDDX2MpbYK3/Lnyi6XS9tRV9zOLsh1DyZmDsf
	 1Fogp4Gg5Jp/pP2deAUPATQxHBmIrpLXZ66spXp/cvO0o3X6hpybBgMFjuBpdj1zPvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
	b=tYHkQHWNfaYnMSkeKQTz9ZBx4lPgGoXzAboIa4tTac46OsTCLb9us8JIDjL1nKgx9JG/
	 LIMSqXz9faVsFS4ImChsNXMj4dotlWDSvKemgB3EUQJN/P3DUk7fxvnDFZGs/x4KXXwfJ
	 /VhEiPS79sBvcdP8IQ2osCaBWMAFjOXhBKl9vuEbNhhSqlh641Rbs9tgt3XzvlMD9mySb
	 dLGIejL/bXig12pa554L8baTx/kMAVvaOSndWWDMNyftYNkdw7za9JhFI4vCMYIETo72b
	 FpxVAetOJlJjBItMYY5Tf8QdVoCdFBjt0h4QFfaStUd88oY3Wup2o1F9BJpj0HyMNTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3Vf5145;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5252A606A328
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 12:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5252A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3Vf5145
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so7404725ad.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882044; x=1794486844; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
        b=y3Vf5145EHzu4zbvgwO0QD6W7gydOYBhVi3MiyOqswdv8uwxzrRkWQL7Nd3pcZDixk
         YCjQNgi/xe12Jt1UtiuQFHrtIA82ZZKW+I/it6tpUNbboj4AC+jdxvgVgGyswzR74T/L
         OfxxcZplcFEFfxfpGCQbK5UxMN95MKxhq87Vayogka6O5vmF/vDe8HI2bDB/Px5dcpIP
         itD+uNkK0pW6/g2M+zsIC/GaOIdOVjQ5zI7QZWEeyy6ioZVzkeLJ18TgvSnWloHieD13
         awyEDOG56YUU0/ITwJuCcvOAKjZKU3hZm/NAWXAjnwtPavmdadAVEtUR71dQPy1LV7Dp
         PkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882044; x=1794486844;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
        b=W+Xgyex/YFfI1kLh7oPdPnw35HOMiaLuIXycasEDC8u23wqWLHYYOqKLJZ107pxuvA
         Ex2ItWHGUl/jns1FeNfh2J1JY8dzw6VqoOeGfOd5fdxo/UBWwjOun9jMHNswTkq7HBYs
         eT8Ei9bCMzzcqqcDBxGKO/6CWDN64iaMkyHUxUmOxmxO9Wm5pXO3iGAjPk/UEDW8bhqk
         INhgOi28RpHk4LAiM+OSo4Y78+xX+5R2/98W3HH2d1eg8JXknz+Sa2t7sxx1so/M7R8y
         VEwxujTfgITW1Rn44KiMlxwcKQ8smhx7htc1Mas0Y1Ct0GYBasFbyZkAsrcCXMMDVqqi
         SX5w==
X-Forwarded-Encrypted: i=1; AKwUvBy3nacBRDaMzakerAhWd7HGN5KPZEPpexzxQjp2yHPoP00ykslZccATssVelkzRH6u9VIltIz24SXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V9srDGfIm95i1Qu263wvz7zC8xIcE1854ekkAl0LXG8LogO1j
	nqNeuSsF23F9ONZpT1zZpFJt1g49UDeTxPZcdDPYrCtJm/q8hoXDS61I
X-Gm-Gg: AYBFou08dxCSpUWwrIRwBYRkwQmGGEW+Ktua3lV8rSWsdgi0bx2DUaF/4F8IXE/vPrz
	PrKP2cSkOO1gxuOv69TUpZAO41UAdoHbuXFuV2WuJc2vIjbzKcMygc9iX+B/b54dehdNVLlvigh
	Lvbz4eY1KFiS173uUCGhHgpyA2rf47xABhIZdKVguL18G2aKHV26QKCt4kIq2sOpAI7jtMtLkCE
	qBOrXBibE98UtIbC8afAwzgGObd6yZ5/UD/AsQShKOJywhWV1LFbahv8i6IL3OVnYqmIP8Ftywn
	R1AsFjiOpz113YuyUBEqIKtA+DRlTxQ74u4IuwtRS4MhXS2zghiDPlSaIVJhAzl7ihXJevOSyeF
	AX9VpupCkHtVTC5UXKxbdifxA2m4RxwcBB+ZKcMdJPmAN+4E0VyJRQki7WmfLPhcF8vvhhIyyjL
	J9MF70tU3D6tGiOwfQL420e1vggxAtSI2yE+mCKgDqZ19swJLevu3nfjxUenrABqy7/mxBZ1mF5
	1p6Ile06N02GYbOeZePEs09dUi3K2dcPiOiwKMSaRg0PG/xq1R8WOzgUF1Ovtodaxa1gj/AMXGt
	uaaSPts/yJnHdoAB2k5HYsliPOKEZcWjwko0Pcohyr4SZ16LquN/75C9ljxUOML7HKn9g8KkkBX
	AGFNVgmkMSqfrFTp4sHDS2epKj7g=
X-Received: by 2002:a17:903:3910:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2eb3648b6aemr182844655ad.16.1793882043510;
        Thu, 05 Nov 2026 04:34:03 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe55bdsm17043995ad.15.2026.11.05.04.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:34:03 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v2 0/4] mm/damon: introduce age_ms damos core
 filter type
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 05 Nov 2026 23:31:53 +1100
Message-Id: <179388191315.401969.13923237674993632654.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261105044425.87142-1-sj@kernel.org>
References: <20261105044425.87142-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Wed, 04 Nov 2026 20:44:20 -0800 SJ Park wrote:

> One straightforward solution is extending the DAMOS access pattern for
> specific deterministic time based age specification.  However, DAMOS
> core filter is a better option.  It is playing a similar role in a more
> flexible way.

Makes sense.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
