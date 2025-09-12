Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D122E0B58
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672150; cv=none; b=UHdk9odMKS4wn9tnzPwJdt+/K2iJ/QuYeiQAQLW/twjOUxXRIhCZKL7wqZ1EW+18sgEW1pg6Q14PVWxv4EU5xE5uzyZu3VMPGsOzN2RuW74KMf63bhTapRttwF3ZwEJdrCQv/3ixbWBdcS8ZhaEn9L3svDcTuiA+QLM4Tl4xdcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672150; c=relaxed/simple;
	bh=DgARuMX8C0O9vD2kEMxsJ443swuM1qSfJ7gGYtB/ZDI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hQnN/XaGDFsVUldrBEsov9k71BYgppXD+tyZ2g6Oytp0oVvx+FkFqOVDfdWVoTMUj53wdoe4AGjTp3723+toRoBXIT2KIRq/HVLTLxlCu+uwPQ2ZVYJ8loa+FZqUalEI97XDn/HDcIlXUJLFoufVaAJ03YtsYESs9n3aG7MUkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efqxVWK5; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efqxVWK5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32dc4faa0d7so1536721a91.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672148; x=1758276948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8NXrRzKlLIo7IaBcJ7TmPf9N4NNGYc7glWmcDTSRYnE=;
        b=efqxVWK5IZCYUif8/2oiuaWp8tQDSBiioh9/UuDY8MvjK0UeXWkXngk5YWvYidVn5F
         ZKHNsVF/E7vb/nE9CT0g0lrkm7d2OaElZqWGC4hzOMS9VdOUpKtjnsAYC0qCrtk3x4fA
         vUIzQhbA3ELiWRtwzc77gzWm7J1ZNKYhrWWYsclO1XtNABJm6ZdJZJZmGiuL8Yw5OxDH
         fCN40hGlEx7jjJ1GK8hSBtVmSmqg1htJPxvNcb1C7QAvfgWlYaFfS7pDTMuqPFuAtG3B
         agmeWWZVPS2UZSRCtMjjUnYqKU31O+bJpXfAd1Kv03rGUkA+2/Yc8eZe+hH57p46zx/n
         9xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672148; x=1758276948;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NXrRzKlLIo7IaBcJ7TmPf9N4NNGYc7glWmcDTSRYnE=;
        b=dK3w1Tw0U+hDzlJnznXGgFEyGkG65eM2cEITSHioG7kaJWEI50cS+kHYyBWwxGWz7t
         CjnWbRqal4oFUwvwN2GWT/nYmd5rJi5Gac0p+8VwG+5zni2qHmmTuLsiYRKvvvVUpiZf
         DgrdttFoOcNoft/9WMcZdDhL6qzawg34auiJjhS5V3b9A/mkaaulhpxeXB8u8Rgi3uak
         bfKHP2s4ZKDJB9mQLaswiRE7d/QY/3m9k7+706fX/0f7C/cCg9jmvLjWVMamAzPeHoVq
         yvJI06MXHPGKu+SCE6l/KKL7SuJAnK3WlYFemuOTxW9j6qGYIYVVXdsCdSdQ1bG8OsZZ
         xC4A==
X-Forwarded-Encrypted: i=1; AJvYcCVBrWI1LEvR9a/ZS/JZ8FFLbc50Ba3Y0XnU1WhN6OztKRN+JHyrd8MQm/a3zdCY9bcVfpyzSqBZBj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZhApCIMLfNKAU/IujgpaWGwKJrLDNmxXArTkhTE4hKRjmBbQq
	UM1cfOMjfesVAibMIxAkG0TzK10+Z1/gSREGiMSWOcMbDFHs7RqXl4HY
X-Gm-Gg: ASbGnctBzXBKGp7U5RWjfuYlWc+hiiTvPcG8iRdiqObIw69W1yj415gHloi8XyrkOKW
	FIc/glJRk61wEUpa9h676kRocvMva3LzDMunXXF49XLq4qTw6x6AjQp9pc0gToLu2QEOU3PLRfm
	6kG3MpZUyZKn6iYWPQSYiRYXKqmPGhqcfDYR0Zh6wB5XHK+Tr9Ki7td9nhSMXp/8g/SBkGXX8h5
	n3qT5rLb9P5BRV7pkDHDmxiIVBaaA+zxx6DRmN7Ajg07UElVW2vvS1jGpvYrq1fgYI7Yx4wg63Y
	o+HKrTeKavYeM1Rbl3OZTToW/X/el8rgMLI4FtT4S2zqQO10hpxHJD2PI3y5WGzpK497KG/AdCE
	MSQ09IRfV4SnIKBfvHOZ/BPanymN1dryIe05GL8UlkBL0iE3dNbtJnayYvrSww+ojlyZEEDlcc0
	YyQws=
X-Google-Smtp-Source: AGHT+IEP4elHK2bgf/EvKfPLSn4gKjTz8zosrFitg1+GsXCX0OcrjCDjoP/DIGJVbK6lII9nIYLyUg==
X-Received: by 2002:a17:90b:1b12:b0:32b:5d8b:ea43 with SMTP id 98e67ed59e1d1-32de4e7ba28mr2768770a91.6.1757672147574;
        Fri, 12 Sep 2025 03:15:47 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa9234sm4393676a12.54.2025.09.12.03.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:15:47 -0700 (PDT)
Message-ID: <28c45f53-a3ff-428f-ba99-ebb09e0581d3@gmail.com>
Date: Fri, 12 Sep 2025 19:15:44 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v4 08/19] tools/docs: sphinx-build-wrapper: add a wrapper
 for sphinx-build
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net, jani.nikula@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tmgross@umich.edu,
 Akira Yokosawa <akiyks@gmail.com>
References: <20250910153334.0b3e1440@foz.lan>
Content-Language: en-US
In-Reply-To: <20250910153334.0b3e1440@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[-CC: rust people and list]

OK, Looks like I have to bite.

On Wed, 10 Sep 2025 15:33:34 +0200, Mauro Carvalho Chehab wrote:
[...]

> The current approach of using LaTeX for PDF is dirty:
> 
> - Sphinx can't produce a LaTeX file from the Kernel trees without
>   hundreds of warnings;
> - latexmk hides some of them, but even it just one warning is reported,
>   the return status is not zero.

This sounds interesting to me.
As far I remember, I have never seen such strange results of latexmk
under build envs where all the necessary packages are properly installed.

I think what you are trying here is to paper over whatever bug in latexmk/
xelatex by always ignoring their exit status.  Am I guessing right?

If that is the case, I'd rather report such an issue at upstream
lagtexmk/xelatex.

Can you please provide a reproducer of such an issue?

Or you saw something while you were tackling issues you claimed in the
cover letter [1] of "Fix PDF doc builds on major distros" series?

[1]: https://lore.kernel.org/cover.1755763127.git.mchehab+huawei@kernel.org/

Thanks,
Akira
