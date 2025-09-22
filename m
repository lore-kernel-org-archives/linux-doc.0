Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7F4A1E
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540646; cv=none; b=cEunL+9P0bfrZmfOex6LNWMrFXsvrLK3/DWWBlm737owxDrNdta6nlDDBzWnYVNNI/lZ+W4Qx2e8emxk2lhyd9D6pJ/2iJmjSXAwkF+RJLeKMZVH0hEqyobPoxFFXvEE3JrffWG0uNEeDMMthHp92k26oEs70E0FHbzGdLnKjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540646; c=relaxed/simple;
	bh=exJIaGVZRA41ft1d8kldxrGWTT6BfUiUQXmXRuV8u7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwpmWgjOCD7zeH9OGkLAznxD30voLiRnZiJHPNrHSDx23b/2Q5Ejdb2kL9uVgEp4R6+2LiPCa4lUwB3ZZECAOAEIFOaxAVXd1H/fOpB5aYf4++wWpexUjw3lch0cS15XinxuR9A2R6MhloU/pNZaNIx/Aj54mnuJHk8iNgbMuqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4AsqHM+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4AsqHM+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77f41086c11so602849b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758540644; x=1759145444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d19kgaF4cF7llUtlCB54elxTKW7Xa+l9+r8wNmLGWJc=;
        b=S4AsqHM+5vJgfCvIG50kpNj5WK9bfsWFJg3HYHbsOVzydDRH3dFyABCKqncyWEZADo
         j0r9J1bMGrywAWKaJjUELcjLDtwAPHlxTFvhlMbfuQ7PriBJfFT7/aoOEgGY77ydfUs6
         HIkDXl7EizSTWRQeQtiNS9FH4mATWvcLflZnCQyaYav+dlBq8v602PlihUzOPP2sBsmc
         dGtwJ50L+aF85IKldEpQtLJKVD5RFZJyBr6oAvHuDRWhJTal2uG8GBJnXh57s7/luke4
         Ic4H7CCWl6eSO4suZpNwvSNjJZQS/82UrBMKbuhsRNXKKmzXz2arpJE5dc3s+wWUxXg1
         4j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540644; x=1759145444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d19kgaF4cF7llUtlCB54elxTKW7Xa+l9+r8wNmLGWJc=;
        b=TGfxG7xOuYTPBKTJNNJSALp3HFaYyj49mQcM5ag1Z4xGV06FnaizDebnOJuqAQ5Bag
         cHwrC4j27yHi6fVRK+s5qeWeqhPP6sLxiNlD6SaaYceEEQW4HSVu3+VIIhu9yoD5aNHO
         IYxiJOr6v6DVU+puEAr02+MdbJy8MpiX568D32sYqWWxF4FyxAG3cI25/4qojtBqOvQX
         5qtYLysk4R2jy1G9IfDuAlkmCuUkkL4jNHinlHjItbTz3a74WLJ44C/aIMB+6X8BFrbo
         UQ51ifozU9LUdhks3v5YWMOVhh71f0eQPJxYUH7kBo1PV8CM+cF4lh07NhDh2+lpvSv1
         nxXw==
X-Forwarded-Encrypted: i=1; AJvYcCV8BFfvF3raf5nO4rwGSpJOd63Bg350qqCCF2+UYDMEFq9iDUAi1D09gpJZ1wzfuS1r8QQIhA20CB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgwDmHM6nQsucsNuf/DjjdkyZi0OB4F+haXqEQ4nKYzUvTLOWl
	YkiXd44ibjHzxCOGXetKKioeAwRT8tZpfpBHtUzMyUZNJ1CdifMBqNS3
X-Gm-Gg: ASbGncu1rPetUjEjIZGPi6wBjFkxxov0a3/j7O4upUeNYH/87TXpyPHJpOJeSzU7GrX
	72lp3aq9y6y32nOZ0u81BYH9VM0AXUPW3YFAQItzI1DfjsykdzJG9/klnW88WkIJ/1loo/z0T6P
	GYHmrqsaRQGYZhOrWbxu6XuGdFgBAjzg+RG/EZuVn7dGMxEj6dXf//GSUZ4vffgYxrIkekYW1an
	enwu1tm7ejBzTGHu6D6UZ8jf3f3tYcqa9vjvdA86EQ3ZhjoGlf89ugPRCllFkOgUm6IrOU4VTFO
	C/+HxtENaQfbErFZgtXDkhlZlSyOnko1deocaRMJMsed0FMvslb4KRE2nihqB6XzFVopUozlGFQ
	p8GKRj+xpZ/+L48YktBYT4guwd+gmMVMVJNSUG0dyIUPyetWFp/oaQkLWmsMZ6GLYz8ls
X-Google-Smtp-Source: AGHT+IEmGQ8ezO3TtOdftc+mCIAJ6aLgEsQSmxgVxjQfrvzQONfiVHgyQHAP9sLiLBgvDFkwTF21oA==
X-Received: by 2002:a17:902:ce12:b0:274:5030:2906 with SMTP id d9443c01a7336-27450302a03mr76858975ad.46.1758540643820;
        Mon, 22 Sep 2025 04:30:43 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df852sm131071645ad.87.2025.09.22.04.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:30:43 -0700 (PDT)
Message-ID: <f31c2169-cd0e-438a-9e59-d6ebd8eaea6e@gmail.com>
Date: Mon, 22 Sep 2025 20:30:40 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] sphinx-build-wrapper: add support for skipping
 sphinx-build
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1758444913.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <cover.1758444913.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, 21 Sep 2025 11:13:24 +0200, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> This patch adds support for not running sphinx-build at the wrapper
> tool. It was requested by Akira, who wanted to be able to ignore
> Sphinx errors during latex build and still try to build PDF.

Thank you for trying to figure out my intention.
However, you failed to see the point.

> 
> This patch is against docs/build-script and applies after the 3 patch
> series I sent yesterday:
> 
>     https://lore.kernel.org/linux-doc/cover.1758361087.git.mchehab+huawei@kernel.org/
> 
> 
> While Akira's original intention is to have pdfdocs target depend on
> latexdocs, IMO, this is overkill, as probably only Akira and a couple
> of other developers might want to have such behavior.

I think it is only you who don't want such behavior.

> 
> See, after all changes, the makefile rule for *all* doc build targets
> is simple:
> 
>         $(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
>         +$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
>                 --sphinxdirs="$(SPHINXDIRS)" $(RUSTDOC) \
>                 --builddir="$(BUILDDIR)" --deny-vf=$(FONTS_CONF_DENY_VF) \
>                 --theme=$(DOCS_THEME) --css=$(DOCS_CSS) --paper=$(PAPER)
> 
> After applying patch 1 from this series, it is really easy to replicate 
> "make -i" by writing a small script that does:
> 
> 	tools/docs/sphinx-pre-install --version-check	
> 	tools/docs/sphinx-build-wrapper latexdocs || echo "LaTeX build failed, but we'll try build PDF anyway"
> 	tools/docs/sphinx-build-wrapper -s pdfdocs
> 

Hello?

You are the one who is changing the way "make pdfdocs" behaves.
All I want is to restore the current behavior, without any need to
use such an ad-hoc script.

Sorry, but I think I have to NAK this.

Furthermore, your "cleanup" is obfuscating the very fact that "pdfdocs"
needs a successful "latexdocs" stage.

I believe Documentation/Makefile is the right place to describe it.

Good luck,
Akira

