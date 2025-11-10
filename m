Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038A226B756
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772764; cv=none; b=nPJVQIvqXTsTPJHlmUIc//vr+4hJ50VX/svzpwyTefWgBDRc2jPd6YAycYyLugjMQA/7W5WxkaTmiUKanbt3+M36Mrf11ls8uHZDa6PRznMmEwl7oBBHh4jGbt/RD7QhPHrorXZfZOIrC3f3jB4eDsjUu+7toU5jLK5Cvy18Wik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772764; c=relaxed/simple;
	bh=dVLTdqS1CfGtAevTdZvRb0LRQaxFpvWWzfdJULBAkOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pveZDyoojnnEB8AK819nLdUJrwATnCehrN+6JIxR+XCtsTWINpkU294Bk1pfMOoUi9A4IJhXnevADbSbDxLhZxx6afUxBaiUkSNT8qVEFUYmGZOnKypiUVogFuCgCQOxMsJ6/cLdiFlhUpQP1NdYKpfSF4y8bFYpfZI89xZ4ZHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq4eJKGT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq4eJKGT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297eca3d0a3so19618055ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762772762; x=1763377562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xfmy4AOcEcUwtIeGJKyCn0Gi0Omh2sLDXhDiyPjpnMY=;
        b=Vq4eJKGTotDuwWE7Ws2h9ikQCrKCIhSBok2aa3SBRtjAT1nVy2ihGr7Y29s/qKKTuY
         stsKo71MwjADjkNn6dlI1pCQcQzW2xibrEO8DdGDzqoTziRbYbcGl79Fp92jfohg11fk
         ruWQNVlsrbbbRvdc+aKy/EtTT7CUy9Zzh4Kt9tj+t198DA4SZNq22lEJ+AQ4NbqKVAeE
         hTTloPWQNL2r2biFpNJuWaOX56ZKiLxYPucqO9XersbfkThQQ7rwAxv0dreqzdku6uTF
         crcyUofFX9B2qooEvm96qUtjiFS2i3rMY+vKDkV3S0sISPN7/tWqVEcCs4Gnpa/ufaIs
         2lEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772762; x=1763377562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfmy4AOcEcUwtIeGJKyCn0Gi0Omh2sLDXhDiyPjpnMY=;
        b=MTThqLRzgm20QeZIUAON4gsx/JsOfgCeaMPogSLATdGinUFa+NBDrxqyB1YBXH5PIJ
         agE32Qmlm4xEByPiSnmXsbvE/WH2bUpnIpVUk9p6Y5pO9+oeJoCMqnWGD3NjfVMkLuoP
         ZQozUfD06do5pv5F398N9g0TEzRmwoQVANgwLjRkFDMQ96f4WQGV0Kt36JxGaQVeTqSF
         sVh0mDG/69jpY/YAXcnA/JoHoVxzKjaYqF7q1css++M/yLaVqvCzDKRl98nmGkUxvwUV
         x5nf/2Nlud0NZSf9fol3xfqkLu0kLq7I3vb09RsXywwufVOItadrMHeABGU1Yc+Fqmw4
         Ztqw==
X-Forwarded-Encrypted: i=1; AJvYcCXTY1aCY87jxQLdvIz6fVLOOatIiWYoy2rRbEYKFW3+ANo0NcvdQWPKFQtvQanBywo7t9T2flWz+UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfzv1wH370ESgRvBINaVVW7zdGzJQsUzy0vs9NWPhL1nrShxV
	F3e1DkwJtgM+l4pKISiGOdr7oegc5MVNdnZ2/JhhGDYTcbQQZiU3e0SJaXD7FA==
X-Gm-Gg: ASbGnctASvv/HyF6oOn7cGGGYBfkNQNC77ZUzjS2LG2l1oSL3wgYSa+UYN1IF7jnXAw
	yGhTE62f+c6imIgi+d39H20G8+kDzdDgowthlc7HO2wXcnuI9KZlj/TAodirFCrv05xIrRM4lFj
	/I7XC8CDaf0e3MXKtZcTlGSm/TDXryL0xXBMhkk5lC7f1f7shMWoOFtnCqsCUrvW4eSZHSpsNqd
	pdaPZl7Vqk3kK7xD3ahBIcemSiG2p54y4kG5odtbm2kGfMjK5A38jmNvvTiyrtAYBD3xy/XQI20
	KgD79CuPXbgUY8BYOPzPP3x4UfsLzkAQXIoO/zUAhAjJoBJhoc5kc37kFsbPzObKLBtd+1rqryh
	pTit2sC7H+Yia5LrLtIk6u5wKsh9MXrfaeDHDiVECiz5ZDQBTt748CDNfopWKFMNFJ2NNneSl+d
	xh5l1xA8d4SiNO9T7qb0Y17lUmdigNGxayKfgDGQQvoUfE14OLHibs+ZPn
X-Google-Smtp-Source: AGHT+IETPwSFvBF+h3mhcNuk9Nh0peDzqVVkcPzV5KFTzK6WG3YF7+uplP0h/hnB4Bk+hLoz7SyK6A==
X-Received: by 2002:a17:902:f683:b0:297:e69d:86ac with SMTP id d9443c01a7336-297e69d86cemr114937165ad.39.1762772762130;
        Mon, 10 Nov 2025 03:06:02 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f797sm142617225ad.56.2025.11.10.03.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:06:01 -0800 (PST)
Message-ID: <bf2cb310-5546-46f9-b77f-0603f0cafe04@gmail.com>
Date: Mon, 10 Nov 2025 20:05:58 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: f2fs: wrap tables in literal code
 blocks
To: Masaharu Noguchi <nogunix@gmail.com>, jaegeuk@kernel.org, chao@kernel.org
Cc: corbet@lwn.net, linux-f2fs-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251109095416.2428351-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251109095416.2428351-1-nogunix@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Sun,  9 Nov 2025 18:54:16 +0900, Masaharu Noguchi wrote:
> Sphinx LaTeX builder fails with the following error when it tries to
> turn the ASCII tables in f2fs.rst into nested longtables:
> 
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
> 
> Wrap the tables in literal code blocks so that Sphinx renders them as
> verbatim text instead. This prevents the LaTeX builder from attempting
> unsupported table nesting and fixes the pdfdocs build.
> 
> Akira Yokosawa pointed out that the in-development Sphinx 8.3 latex
> builder already handles these nested tables. I still want to fix the
> current documentation because Sphinx 8.3 is not released yet, and the
> LaTeX build on the stable 8.2.x series (which also requires
> "docutils<0.22" for now) remains broken without this change.

I expected 8.3.0 would be released soon ...

With this change applied, in PDF output, due to the limited column width
available there, most of the nested literal tables are wrapped around
and hard to read.

But fixing latex builder's fatal error is much more important. So,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

> 
> Link: https://lore.kernel.org/lkml/20251011172415.114599-1-nogunix@gmail.com/
> Changes in v2:
>  - wrap the compression level table in a literal block and add the
>    missing blank lines so docutils no longer warns about malformed
>    tables
>  - consistently use ``.. code-block:: none`` for the other ASCII tables
>    that previously triggered the LaTeX error
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
>  1 file changed, 61 insertions(+), 54 deletions(-)
> 
[...]

