Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3223B605
	for <linux-doc@vger.kernel.org>; Sat, 27 Sep 2025 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758958513; cv=none; b=ObMYk0ob3yRfSZQbgwVlJHbfZamDQ5gAqvKRMteE5aNKkr4vO38o+OgOYsdOs5PGkb4DtdbMC2DRNZOvNbt4sFOIKwp2Ufn6vszgFIuFnqPda33EMwklf4xZj2yIxur/h1vw9m8AXhwSiCnpSXP2lybTiaQHNSVea51CQBtEj/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758958513; c=relaxed/simple;
	bh=3KtIHrcWGsIKxmoc3fUcVWxyjdB6mkQX61rFynLeMY4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QimcXAdQR8T13ItWIKb2RKweVT2ZyCRz2beMeJqgp83812EnnU36bvj9EeLclzWCCGw4SkL9GK4bWnHgGshBbIeVlBkRSyv1RED3HiVvviIU8n/4ktqCUyNivMXSM2EVIXkGA3QOXRkk8UFlNrEKcRxFGfzZbGryRq/ZKMX8mMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbKxYzko; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbKxYzko"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b5515eaefceso2806104a12.2
        for <linux-doc@vger.kernel.org>; Sat, 27 Sep 2025 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758958511; x=1759563311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s10G/fjsiNB+j7oZGZm9Fk325v5N+O7XKTW1BXFQ3HI=;
        b=MbKxYzkoPStyGSzOdmihFggvFldQDvVVh8YXjG54oEuZNWFiuGPUkJeJms2XkGLTk9
         SXr9YMGQS+Nq7kdUEckiAeoEB1Pn1jbwsCKJts0iXNxsLdCV2TQxGONDP1qKAGj6uj40
         /2cIxULecCHWkXHsB4R7wluEVoMQakIGImNm+AX1ENARzRGDIKVW2OjdWrthKFVbqIk8
         1+iClyQqoFCKOlB3gZ0nST/Buxm8qaelShGg7VJWH7ZPzIKmdFvMX8ekjLpKqJXxUmVr
         WogzAVhVa74ohtxHNcPI6V0FjJCKt3FWcwNU9I3p9U5XzVcT2i9bWqkEewdu06VurRp1
         eZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758958511; x=1759563311;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s10G/fjsiNB+j7oZGZm9Fk325v5N+O7XKTW1BXFQ3HI=;
        b=qbri1JTh/mN/MANLsXRfzP41N2R0FbS8z5o/4K1uPcsjs9w5epUDrRJqS8JqJ4mxjY
         ZqMLIaE8UKVBNldkXw7hijYB9CzeIDSqZBT/8vrt1MZ9O4M69z3MJnfchKZMzAdNrCWz
         Mq9TcjalY9ZMsZJlqK/yuQRc2t5sPgwT+8kEm4SIrVCe92mWBdlxowXhyOHwkldvT/Pb
         BBRRrqRi1/BKGZpeCyqvqcUrmx0erhSiJxEki/hUN0LfV4Gx6JXtqx8UMSRS3R2hwn0d
         8gQraBLqmrZTqGA/FN1K8uGS+tWrjcwuMkK6wjHslXx6FsFDTrSzBcLBMkrSKKh24hUI
         4mww==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+KU68jG1PDxcn9KRYzm7K7V6PgCeBS7JlkL7UUw61EIRqYNAXhccx9neiLHrrsgEDJ+q+Q6tqpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzag1jun//a0loLlZ4c8lqAh7sPHmiEeMyO/Scvip3a94EntPEi
	LbSIJlxbJtBIqKnoGtAk1xAbUQV+RvqA1WgKfB/cPXBxDWjtWJEM03SY
X-Gm-Gg: ASbGncsEzcItg9jAxiPxRYOZGOkpV4FamaN8C8SR4AL9gXuMtCPrz7TVvqmdR8V20xB
	Q8P1miPpsmYe6nAgJfsjNrE36dzidkEOWORgV/eQ+EEAyyQmcthCSgwIL+LqfqPy6ax3rrGIJpG
	0f6lBpX77164xX2C+T8Jty3leqPcjG+QpGdfke7LAc8DIH5RAD/6lcaojblyzL2sNeZz9A4/bLg
	Xc+j1K1e/jVdKPFagC44md3w/Ai9wxoB4o5tnee6sWE7EzOTevPAiG6cCcWHd8Am3u5wU3wKKkU
	6bo7XtD46grbS8HYx44kfrs2lR+sSEXNveZdj1UiJFTB5xXa9QncKwwVpjKsr2nx/y3xWgr44O0
	+wh8cxUQxiVJNgdUGL66cNPinlk7kJeZ1RSB4kW6MrFvvyTlMVeqYLrpUK4bQfZzWQK7WfD4b2q
	QKD+0=
X-Google-Smtp-Source: AGHT+IFcoPDCW0svdgwCyOTNGhZW0u4786+xCuRiWL7PBsKohOQyiYi1b3YaoMuTsQHHBfb5WWJeAQ==
X-Received: by 2002:a17:902:ea0a:b0:24b:62ef:9d38 with SMTP id d9443c01a7336-27ed49d2948mr110347815ad.19.1758958510735;
        Sat, 27 Sep 2025 00:35:10 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm74432455ad.49.2025.09.27.00.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 00:35:10 -0700 (PDT)
Message-ID: <f9ceb569-363c-4806-9451-4a4ef83b38ca@gmail.com>
Date: Sat, 27 Sep 2025 16:35:08 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, Akira Yokosawa <akiyks@gmail.com>
References: <e23e03dd41e044d55e4ae24ffd9e1b49e3f2515a.1758881658.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH 2/2] docs: Makefile: avoid a warning when using without
 texlive
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e23e03dd41e044d55e4ae24ffd9e1b49e3f2515a.1758881658.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 26 Sep 2025 12:16:19 +0200, Mauro Carvalho Chehab wrote:
> As reported by Randy, running make htmldocs on a machine
> without textlive now produce warnings:
> 
>     $ make O=DOCS htmldocs
>     ../Documentation/Makefile:70: warning: overriding recipe for target 'pdfdocs'
>     ../Documentation/Makefile:61: warning: ignoring old recipe for target 'pdfdocs'
> 
> That's because the code has now two definitions for pdfdocs in
> case $PDFLATEX command is not found. With the new script, such
> special case is not needed anymore, as the script checks it.
> 
> Drop the special case. Even after dropping it, on a machine
> without LaTeX, it will still produce an error as expected,
> as running:
> 
>     $ ./tools/docs/sphinx-build-wrapper pdfdocs
>     Error: pdflatex or latexmk required for PDF generation
> 
> does the check. After applying the patch we have:
> 
>     $ make SPHINXDIRS=peci htmldocs
>     Using alabaster theme
>     Using Python kernel-doc
> 
>     $ make SPHINXDIRS=peci pdfdocs
>     Error: pdflatex or latexmk required for PDF generation
>     make[2]: *** [Documentation/Makefile:64: pdfdocs] Error 1
>     make[1]: *** [/root/Makefile:1808: pdfdocs] Error 2
>     make: *** [Makefile:248: __sub-make] Error 2
> 
> Which is the expected behavior.
> 

There seems to be a related issue.

At current "docs-mw", under build environments who don't have xelatex nor latexmk,

    $ make SPHINXDIRS=peci latexdocs

completes without any issue.

In the resulting .../latex/peci directory, one can run

    $ make PDFLATEX="latexmk -xelatex" LATEXOPTS="-interaction=batchmode -no-shell-escape"

and build peci.pdf.

At current "build-scripts", I get this:

    $ make SPHINXDIRS=peci latexdocs
    Error: pdflatex or latexmk required for PDF generation
    make[2]: *** [Documentation/Makefile:68: latexdocs] Error 1
    make[1]: *** [<srcdir>/Makefile:1806: latexdocs] Error 2
    make: *** [Makefile:248: __sub-make] Error 2

Patch 2/2 doesn't change the behavior.

This is yet another regression.  Please teach sphinx-build-wrapper of the
fact that "latexdocs" does not run those texlive commands.  It is only the
"pdfdocs" phase that will run them.

Regards,
Akira

> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/linux-doc/e7c29532-71de-496b-a89f-743cef28736e@infradead.org/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
