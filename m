Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3803B27E8
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480447; cv=none; b=XF5O/GH7Hj2o8967yBNbu7/vKbmrIuC8XsXK54yF0ZnAW2e9aH8EcllkceiJloflVYDSABZULPCDFuZgjgJdKOaRX0DUGvXqVds1RbAcmnOXBVphhbHx0I/aZMD+vbGbfuRmLW7cskp5zdo5PBiBedpkOPyngRNDLQ0YFc+Tjgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480447; c=relaxed/simple;
	bh=ZPy0MYfemx91GQNlEr2gCQvz8mUG8eRkhPLLNC+7LNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8Xro/j9A3GMrWZrppg9cN5GpeMVh44jd66jmhqZ1uKtLPSypXHvFFxA/X4YAmyOTYuZtGfh7cvQ78mv0qWhJXxrnwNxCpsLz/4aadECdO7VIbHQjqIw74VYBO6ihgzUCROUWjF1qdE4HMU+loA8wqHjdOKyjqjIp/sPkCQQihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMNDUciz; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMNDUciz"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d82eso5379375ad.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789480443; x=1790085243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNZydljm1VGomtR27o8PI9pWGF1nMXphYRYTsDo2lS4=;
        b=kMNDUcizv8BOzXFp9YJlY9/PmhTypN0sks0kG85oAlGBjRyX8icsoFPO+o4g1RFFxl
         b+uVNUzLru1++CIAWL0HOtKxiBCLXWKFvLXB8PiQJQDpHYhNrseL6MIki8yk7IeRQ1zz
         Dcp574WuTP7ERQpddrbhWUHUvskmWzmUcttOSpcOVAeNrVLVMOtt4Z5Jgs2Ym8xsMvrW
         0LyqvhBBIRQEgj32vrKdeNqy0JMmtNWOdyJ3fHlWxeQ9DIc+hVh2GibZqfmxDIP9/ihI
         yyI25sEVLIJnN79SSTAPwIn3rm6UV7LjdX5s6ecY66w06TMP8/7in9Gv/96Ei9SiVjx0
         KXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480443; x=1790085243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNZydljm1VGomtR27o8PI9pWGF1nMXphYRYTsDo2lS4=;
        b=isfgZNkF0cmZ1iv6eWGf4g0nmjpvJ7R4Z4WcdojUpNatTtDHaiteWyLOZ6DyMFeop7
         y/7SYh+Um8FNIY49/4lkhoS5IHRHkXr+Nx8ilOyURgxK+chFIozce/x/YvdJ2M7/ScdX
         cYkboFSmEEfhqWBnnOSJ0Cg3J2yEOEEj5XctdtzDLjpndXrAtyHKz2q+OCNhn9jdImJJ
         LrQH1oO7ZuIn0NqeYi4ztgiDJPQ38Y+qmDOSKHE09+p0bWdgCk6LmM8Psf42B0fhO1Ss
         B5ES8V26K8yBFcP/+aLIn+oZ6peaWIhrjmdQuna6jRBF/ORiETHDy9sRMn2QDQVbrfLj
         19LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiqz4IIRucG8ViW3elI18U2lnWBlQ4IYzGXXQUHRZ5+7T+Bq5IhZhDDwMHaRnHvg6CZjNZv3tVJ6c=@vger.kernel.org
X-Gm-Message-State: AFuF++nKWhqDSiQP4TrGx3B6rAHA4yZaTfttf984BmOYHrp32YOZN8Vl
	pNEOZVkqlaTlJXOG0WriolHLG4drNTLLmKC4WqA/7jZdjUg5LLXKUhNu
X-Gm-Gg: AYBFou1/isvVRzZHs+VFxXZr7pW8hVrSkqyfmvCMNT9AoKwnlIa0yO/TUW5OCcq/4Y9
	wVO0jfJWTZlakVlvg3ZWJigzXeLyACo5yNnAqn/mtA1lT24YCYfAlFLkfv8RyCkqbNzYEUzv/pJ
	9nixYOFFFIoEiOcTpLbUpq1q12BJgeicT8Nf/RTSUpWcJsHLEyo+70c1MQw9gJqqOBoP8YV8hGX
	sU0uJ8EiHt5OGvP7QiTOgZdeNu3vOF24OUHhYb42JMpj/O8TJsGPpUSNPs6MJtx3flk6Ski73X5
	xw4aY7nyDyOFsyG+7mNE7xggtozvfQBk+3OmTnTDYN2XbW9NdrDYRUCGV+oKoFGe/lOgYp+gaVL
	jNMFZ57WuWAQ5DdrfomxUdWme/WsnZv15R91E3rcCvGClA0sy5CMxaUAOM6ms5tsiUYKyfhcK9m
	MKwSwZ1aguT0D9LASmqXk2wwXpCJzSFnr25g3lhYkadAoryWZ+LJyx5uKSzoncehJJTGxuAw==
X-Received: by 2002:a17:903:b0e:b0:2d6:3c1a:85ef with SMTP id d9443c01a7336-2dd6c848391mr104355525ad.4.1789480443559;
        Tue, 15 Sep 2026 06:54:03 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd6f120c5dsm28157935ad.57.2026.09.15.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:54:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 22:53:58 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Chen Miao <chenmiao.ku@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Message-ID: <aqlNvld2LINsWSSe@elitemini>
References: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
 <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
 <20260915101638.76e3bf1c@foz.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915101638.76e3bf1c@foz.lan>

Hi Mauro,

On Tue, 15 Sep 2026 10:16:38 +0200, Mauro Carvalho Chehab wrote:
> Fedora 44 EOL is still in at least 7 months from now (e.g. when Fedora
> 46 will be launched), so, it could still be worth.

Thank you.  And it is not only Fedora: Akira pointed at Ubuntu 26.04 LTS,
which holds up -- it ships Sphinx 8.2.3 with Docutils 0.22.4, and its
python3-sphinx depends on "python3-docutils (>= 0.20)" with no upper bound
at all.  Both fail identically here, and an LTS carries this a good deal
further than seven months.

> Indeed it sounds a better approach on my eyes.

Taken -- v3 moves the check into tools/lib/python/kdoc/docutils_version.py
and calls it from sphinx-build-wrapper next to LatexFontChecker, only
once a PDF build has failed.  sphinx-pre-install is left untouched, which
also drops the overlap with Chen Miao's series.

> On a separate but related issue, has anyone tried to use rst2pdf
> lately (https://github.com/rst2pdf/rst2pdf)?

I have not tried it myself, but not having to go through LaTeX at all is
an appealing idea.  I would like to look at porting your branch once this
one has settled.

Thanks,
Masaharu
