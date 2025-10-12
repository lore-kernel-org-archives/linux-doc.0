Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966591A5BA2
	for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 05:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760247101; cv=none; b=i2vvXsCX4LOZpAxD5GEqf2hBztbk4iH6R5tecyaTKYAzaf/dysQ/ZPI2p5O+QhCzLvah0Dc3ksAqPO/99ckJFeQobm6gdLqjEWfHJ4fWLxtbrlC4gmNVyH3PU1UgYHI6Rpvt7QI4/P5M0bemnfmm8eKKXWNl4s7QWA3cygPW3w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760247101; c=relaxed/simple;
	bh=nCLq+DEhLRJEZWZMV+X3bkQFsa5jy4fUB1Ka/mPQCGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJbcEheRvIetOxJiohJCcercfbycgX1R5plfkd/SE4y4C8d4k+qTYSd4X8zV/wKzrqBYIAlHrIBcQM8Ugp46WqZAxKppg3+gukoEQjh1S5lc6gZ6X8+UKb5AFOc8/Plxa7NA5EmaPVemjEPI4XGinW+ypOi+LGxBdIyzweMnL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9X4K/Is; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9X4K/Is"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32ecc60c9e6so584471a91.0
        for <linux-doc@vger.kernel.org>; Sat, 11 Oct 2025 22:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760247099; x=1760851899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V315Oz2UwZma7KgfzSEN+KehYy049Dd9a5YOBN+/BjE=;
        b=N9X4K/IsmO8u3o/D9ulIXP1nUD9bGiyvJHkE8Q6ccAipWNKcAQrO1Nuh/FsOiFi7TS
         FZLiYAk7rqnPlscwcp/Xjf1WpKqkmW7jyg9hv26GpRI0d1sp4oqIhAuBzbpcNl/8EXzU
         Wt+vXlPMCpimlORYx9WbZkPu6XIoDhyS6Zb/+hICvrwnvmPI4fmvIPd+o9kr94iOMQ96
         LSTUkJ+2U3VjqoJHX+9BzbFMDBaRXUO+ro4IqL6viX7DFsh2z00UXcjCLXPhZjzV2lDd
         4PGcIboN/nHdxcuJX1qeBE07YKPbOjAYGmX6aRS8s1zYdp5+X7G79J5/pcyu4Qi2BjfE
         tmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760247099; x=1760851899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V315Oz2UwZma7KgfzSEN+KehYy049Dd9a5YOBN+/BjE=;
        b=jXNhfWbVzOj5W6Nk80AXEordbeEN+l3WcAHatf8SwoegJ/aFqqr9ENmGflQA0LGxLl
         Aa3lCQg0eaBy6lexj3hU07X3DQ0uioBUNtkdXTuxgHsOwbF1zj+uQsXc8O2Ot6HrhFUb
         OJBH69NHFoEe4jyGAV5sHsyWmuwL7e8c1l5K2+jw15k05Iu9mnJom+cXm/RFJwAvDwNS
         g5LDZMtFLVcfcPXNUWKkG66xWsC54ncD3BYugZwmq5SFvanRzKT04qd0h1nVMELlBf14
         Q4fyDON6JE46dqG0JnTEeGi4v7TPLB1YJdrM+kHCqcLZDOfkl9NQbLNfTrStY8Fyvj0i
         F6vg==
X-Forwarded-Encrypted: i=1; AJvYcCVDtN9+81jaC9PRFkgcaP9IrXsb6VtPqw19lK0D/TKfovYTz9JvBfQLDaZcKtWcCk/N8uhmzAyU4N4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWf7raNRIWi+kGZGoHeYE2ZnLwabG8LcF7INNaai101ey+JGN
	muz+utdIFLXtf3cwLKWVIJjWWzDFr++ds67HT8atZi2lwQbb74PPvIxz
X-Gm-Gg: ASbGncs5xn6etI+8CPiCRGjNyOGE6DwfylogR3ByOAQWTlj/B0/RsVgBD42k2+w8cJq
	aSKkIkJeWDC+jHy84whe5+E52HPe1oTvudk2TgQZNIVXB2uUYCqw1CSfiOyuIjR7ezXgJPFTuMT
	C9rUyAgwLm0LE9DTmzRTX8IENXuB3WdLYEg/ocI8vcu+s1CjJvsCnaWztrs732EKQUOgkmELntF
	2GbuyGsMB7QsUa45gUs5pByJVm7mRaGBhOLkUEGErNi56hbirex3/FdLCroyettiofMtW2uujHj
	LhVJRwDcVlyAGSOnwSawOfYR/6CjsVh9l33f7RBjj3/5EwlUIdzAyF8je8l/2SNuIkx78TO9AWG
	H7K6QxXC3Qh2Kg04IZLktTIyskOQssIvq2IvNDsVcKjSeWa3Xg8E=
X-Google-Smtp-Source: AGHT+IGdgMMmNCve6hIXzVGxikslohoV+pMEGgcopaw46XiTYHSuaq6+3cVVsGeG9CQvShDrq4immg==
X-Received: by 2002:a17:90b:1b42:b0:32e:64ca:e849 with SMTP id 98e67ed59e1d1-33b513990d5mr12118698a91.8.1760247098812;
        Sat, 11 Oct 2025 22:31:38 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:ff1c:3f53:c7ab:f611])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b12756sm8028789a91.25.2025.10.11.22.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 22:31:38 -0700 (PDT)
Date: Sun, 12 Oct 2025 14:31:34 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: chao@kernel.org, corbet@lwn.net, jaegeuk@kernel.org,
	linux-doc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: f2fs: wrap tables in literal code blocks
 to fix LaTeX build
Message-ID: <aOs9NiaXVrcO83dz@elitemini>
References: <20251011172415.114599-1-nogunix@gmail.com>
 <12aa7858-b05b-415f-a76b-c18848a9a784@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12aa7858-b05b-415f-a76b-c18848a9a784@gmail.com>

Hello,

Thank you for your detailed feedback regarding the f2fs.rst issue.

I have tested the current mainline (without my patch) using
Sphinx 8.3.0+ (commit ab8303f4bb13) and Docutils 0.21.2
on Python 3.13.7.

The pdfdocs build now completes successfully, and the nested
tables in f2fs.rst no longer cause any LaTeX errors.

It seems that the problem has been resolved in the upcoming
Sphinx 8.3 release, as you mentioned.

Thanks again for your kind guidance.

Best regards,  
Masaharu Noguchi
