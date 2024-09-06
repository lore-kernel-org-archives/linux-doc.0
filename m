Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F521E4BE
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634437; cv=none; b=G/oBFExWhZFFmfRilPKbU1cLU5iceeqqon4396dfce5w7QtHi0iwCjukRIi70fiPm/AVP0ym10NNXmVgJfGdVvYUyzK2NJHsXhlqcglh7Yenc2Xf9BUBnSP/FR7JE7yAC2AIXSWQfclvT6jRlZGaVCmuohGzErafQEd4CFVC5iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634437; c=relaxed/simple;
	bh=MgkDSesJao9FbYiJpDqnXfpje9viaZ77rcmZGkWe4Ls=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=V0afZG99MK1tbt5drQj6GSzDM/Ex+p5/XQByLilq8c2iL9tM/lycutqdjv0kGSMp/tjZ1uX59yy/cl37KDKHd0aFc38fgbjWhlPXZk9gFRA5z8ig7u2hyz0GURFIhIoljhZfEPAJIdZF5XO0nbwXXSBUYgxRaO4BCz2CUleczwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jy7KsHWy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jy7KsHWy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7148912a1ebso1330544b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Sep 2024 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725634435; x=1726239235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTEOpRUpeXJNFm2hS7D/fQot7KA79CeKzRyiGAZCIv8=;
        b=jy7KsHWym1VsiUmJFw2ebj2ieULQc5+oTG2M3wSuR2Q6TAxG+jhc8n2QRPXLC82s1T
         /6mOYwXVikm97hpYdXCBQMD8ZIAEYEUH3xy0t8YbaR7BrZwgv5DpWUJvtGmApzxx/RJD
         bQVTZAlD6TlwAbwwclALSmVFyNMKE+pd3RiuUXmnT8QvlEoNt49Sj2Szgd4p9SOMRi3T
         bd+YXKBihK13Mz9U2VGj1h2dlDbzyj9EahElwK/p0KKS0DJX+7bYyFjafg6nBMghRqHg
         JCEtnWpUGNJjR3fbfesMlkbPDT9c9CXRWCDUk1m0PXEBoICmR83NRTGWoO1JhXn3we+c
         ISsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725634435; x=1726239235;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTEOpRUpeXJNFm2hS7D/fQot7KA79CeKzRyiGAZCIv8=;
        b=oyqM7zDU1CmwpwJBGcVqZ5PLHEgRSoScav9X8WVSpW80FHGTxiQPrm7CYQN68iIBeK
         J7CBnb2/jzs7IR91uLlDHIDqaSzZkcy2iK1igpl2D2ba3yMtG2u0Gb90p7pZQjlP3fjJ
         8iBImua8ff2zLzRsAShOktkg0TZeP0oC3vxzfuY+P3UupWFXjqO+K+XEtWDsHzVCZkbi
         2CbYcSf993rYsU2icG29HHzCH27UMnVhKqWbABNdyJHcYHENFEaAxA28Qatf/DG3fqHn
         G/zA18/erHelzjO1k9OburiJoQUrnrDKV6CKbqos1vPFYQOE4R5ZkGFxwOEaYxeh425b
         uvFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWpkp23SkZZkJ18WulVFMT2RpRL2+c3aZgMcvy9/jJKVdaGlv2MH06KYdBAGyuy4Thp/NcJ6LabZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07P7RyYQGIX9zVbTmfZA/FZL1edbqo92Hwbz3Ext0TRBpuIG0
	0cg/15qQSrzhtDRFIkgoRmzyyLyXdbDKnYi+obyhv7BUVKUxHog5oavYvA==
X-Google-Smtp-Source: AGHT+IFSkpOcZC8kWrSndlTIZkDu93phy/gCVTl1HOLclQBoJP7golsljwL0xTe++Ginvmzqe+2HfA==
X-Received: by 2002:a05:6a00:c95:b0:717:85e2:28fa with SMTP id d2e1a72fcca58-718d5e57510mr2945672b3a.16.1725634435034;
        Fri, 06 Sep 2024 07:53:55 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778598f06sm4927707b3a.166.2024.09.06.07.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 07:53:54 -0700 (PDT)
Message-ID: <08d30cc7-2a88-44ae-95ac-2a259090aa8e@gmail.com>
Date: Fri, 6 Sep 2024 23:53:50 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: bwiedemann@suse.de
Cc: bernhard+linux-doc@lsmod.de, corbet@lwn.net, linux-doc@vger.kernel.org,
 mchehab@kernel.org, vegard.nossum@oracle.com,
 Akira Yokosawa <akiyks@gmail.com>
References: <33018311-0bdf-4258-b0c0-428a548c710d@suse.de>
Subject: Re: [PATCH] docs: Build kernel docs deterministically
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <33018311-0bdf-4258-b0c0-428a548c710d@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 6 Sep 2024 15:56:10 +0200, Bernhard M. Wiedemann wrote:
[...]
> On 06/09/2024 11.11, Vegard Nossum wrote:
> > On 05/09/2024 13:35, bernhard+linux-doc@lsmod.de wrote:
> >> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>
> > If you need reproducibility and the solution/workaround is to limit it
> > to 1 concurrent sphinx-build invocation, why can't you just run
> > 'make -j1 htmldocs ...' explicitly?
> > 
> I had tried that and it did not help.
> 

I think 'make SPHINXOPTS="-q -j1" htmldocs' should work for you.

This is more of a happens-to-work kind of hack, which assumes that
sphinx-build picks up a final -j option in the command line if there
are several.

Actual command line invoked from parallel-wrapper.sh will look something
like (wrapping by me):

    sphinx-build -jauto -b html -c /<abspath>/linux/Documentation \
	-d /<abspath>/linux/Documentation/output/.doctrees \
	-D version=6.11.0-rc6 -D release= -D kerneldoc_srctree=. \
	-D kerneldoc_bin=./scripts/kernel-doc -q -j1 \
	/<abspath>/linux/Documentation \
	/<abspath>/linux/Documentation/output

You see, -jauto (from $PARALLELISM) will be superseded by the -j1
(from $SPHINXOPTS).

Hope this helps.

        Akira
