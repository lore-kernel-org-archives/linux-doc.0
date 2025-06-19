Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B787519D07B
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 02:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750299746; cv=none; b=YB8i32TxFKfTFrx5e2Ji/yc3340Fmh+CZ8SmkKOVD53ajUh3GKU5OTs0Y/EMmFKSRF7XHmf9lmqPRvEgk+BMDcRfhDyHMNJKM++t2FmRMyG0oylpIdjWV8e2T6IDD3miUjcXEfC7p+7R3/ZA5WTMUeOshhQZzDTcJAVyUEAi00s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750299746; c=relaxed/simple;
	bh=MXqV1FB2nAcOf2otr92irp2eyIbwT6af9dTLVRB9uZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bb6Vp+gQf+pDfLYs/ZCU9nV/k3IZWpepVN20Dm2u+KMhDMF8f2X6uRdQCsOP1iahBjrvoWb7h9EiAVa0WBl2BYLVfjcZfGTYtIqHCMif428qL9R/XM3q18hTOwB6a0I5nvdqI+Dm069Mknd3kNg+7uH6eAsC8aStIXYM4NwQCKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aX4cj4Rc; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aX4cj4Rc"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so186421b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 19:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750299744; x=1750904544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kkpx/PBTQdyE9M2WtcIaowDPR6PpsdibcOjL5B7P53M=;
        b=aX4cj4Rc+n86mfW/82XQQnteK0QXbYRRek/TYoD3jHdgqgXO6lkL6jL4XWkG3PkFXY
         bwU+0/2PE/YC5bbdrwgYosQtgFiCIPiXuazlVNo498+naeuGag4c/+tTeVAI+0ihbGuQ
         QjAk1xV6zoUmZ6QJA/IFgeKiULIPfmzrwGkgf6J3cmed4B2DD2hEBIMFsdFGDdZvC9vg
         nppAG8wFiMjf9HTY56TgS7xQ3UhBQeZHMbHg7IGQELNSlnvlhCg4vVuNHW8sYpZPU8cT
         pTi06n60gPGVaUKyzvmJEwpSlZeJpWdp5Cxl/qfZai9eXGaS4RnYwVxOTuCtJ/XpXfYQ
         zwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750299744; x=1750904544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kkpx/PBTQdyE9M2WtcIaowDPR6PpsdibcOjL5B7P53M=;
        b=CTjdEdqcwyLNyFZYhiH/CJLa660tK7NfVs4+JeQn0oyP9BpqY3LcXCiM2YnlqHfrI/
         TUXtjT4rF6krzGctpNii3/U3qmf7smPlz0Kw5YJA5Y92xdneG9CvfPQoXTGmAl14RRRD
         bATRVZI1QRIiEJrY2LXo6TkGq+2uPf5+8Ay8moUXFn2geT8vUzE/VcDGAX8GoGmh/617
         r1oQ0M1DONVs68ivxwZj0Zek0/l14YeiCpMR0CNTEJ/RFc2MBTDVDztVyJN2gUSjC0QK
         VRW4NooTZ8sTOaAsOpcxJbtRiburqyItuNzYd3PudyvZOVd7B7dzAJKp39qK8MCYacI2
         xDuw==
X-Forwarded-Encrypted: i=1; AJvYcCWrgsS/vHt2CvZWyXRcUQKaLzyDZdOF7pbH7v7gzqKqdYzepx6UI1QXZO44Q59ENPzn6EM2jeTADl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxApa20FJozGigqG/WYp5tZdIYbXNWEkrgXgrWuP03yHB7E9OCY
	Q1IbWey5eQM4Q3cVR8QcyBEYL9Aht8me1QhSn82hk0eGJ9/w4e1krNhM
X-Gm-Gg: ASbGncvov4N5sTz8dmCdEjpURwYM12RG/RBGr0xYfPp4Kv06NzEMuXIwNtXX1+KE52J
	Fs5qrkoCu4KRft4iT9eJXX5aJP8XkH7KlfQLsstxKg7mHwPPZhB7ObyBWhUHSfrh2kaAiDyEzbY
	GzFZIcjBPEqGtr1J0dY2Tv1Mlu1SuR0UiD5Db9hsFfRbl4FWxCdl9a963BtbJB753t8biOPvoxF
	+4+hjKIoAT+O4RmQMN/io5PcIr8vumorRnU2Fwfzfs/EZhMePePYjk/bBl4QTQpea1k+a8dJWvF
	qHrsY17WPDpVs0zVOS6MuFYlLdJAG8uRz2kpcIsAQP4iuFQ3WF6B4qG0z3aDO679tSpbkC8y0eb
	/T82vYlObQbKXGD4OSXCAh3DHpcCWBjag+lirgp3Tuy8=
X-Google-Smtp-Source: AGHT+IE4BGiVxDTH8PGJMJL0sWyhhGR19y9vjAXPM6pHW36yEwWcCNHjrtHe4ouOKjAqKM8Xjv2WRg==
X-Received: by 2002:a05:6a00:1955:b0:742:a77b:8c3 with SMTP id d2e1a72fcca58-7489cdf05bfmr26914017b3a.4.1750299743779;
        Wed, 18 Jun 2025 19:22:23 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e4444c65sm2831427b3a.33.2025.06.18.19.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 19:22:23 -0700 (PDT)
Message-ID: <6fcb75ee-61db-4fb3-9c5f-2029a7fea4ee@gmail.com>
Date: Thu, 19 Jun 2025 11:22:19 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250610
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Akira Yokosawa <akiyks@gmail.com>
References: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>
 <20250616140450.79b3fedb@foz.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250616140450.79b3fedb@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On Mon, 16 Jun 2025 14:05:36 +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 16 Jun 2025 20:18:22 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
[...]

> > I managed to reproduce the build error using debian bookworm's distro packages
> > which can be close enough to Sphinx 5.3.0 used there.
> >
> > This is the error I got from "make htmldocs":
> >
> > ----------------------------------------------------------------
> > Extension error (automarkup):
> > Handler <function auto_markup at 0x796307745bc0> for event 'doctree-resolved' threw an exception (exception: argument for warn() given by name ('stacklevel') and position (3))
> > ----------------------------------------------------------------

> Perhaps it is related to docutils version.

Looks like you are right.

debian:12 (Sphinx 5.3.0) and mageia:9 (Sphinx 6.1.3) are distro releases
whose docutils is 0.19.  They both show the same symptom.

Furthermore, if I install Sphinx by using venv and saying:

    pip install "docutils==0.19" Sphinx pyyaml

, I have Sphinx 7.3.6 and it shows the same symptom.

So you need to say "docutils!=0.19" when you install specific versions
of Sphinx.

> 
> Assuming that it doesn't work with certain versions of sphinx or
> docutils, instead of reverting the entire patch, IMO the best would
> be to add a check for Sphinx version, disabling the broken refs
> only for too old versions.
> 

Can you do so against docutils 0.19 only?

       Thanks, Akira

