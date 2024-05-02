Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98413C68D
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714661169; cv=none; b=RNgteUm0teYSw9b5nwixR8/seUN38hN2u9slu9BUPaVlyR2/waWprtBg1Q65AJFohW+lY9/nXMmD1BllIkyDn7SPq0AtsW7vB9RQIcKDozf3OtwbiAGQO6T/i+G5lgG0PQtLnNP8L/QjxduXHfYYZlp9DTwzxmAHU0TOCFmR8Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714661169; c=relaxed/simple;
	bh=H1Ne7EjretT2qnnizy+L+5S9nlqOziiZl5WNkeLkX9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpU1vgCv0M2qwIXF9yrzBi8/Fv2hYEKbLYBzHaZ2VAhgLUlRnFBg6eDK+f2KaM8qW09akOAho2ytAnd7cwlxi2o/kgRvTLRUaxckxrkygoWqbyYuldvEWVcvflWglMjyE6Bi1B1TZhUPI0cQi71vecSuwMu9vHxXkspJRAHDy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBuNCeKQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBuNCeKQ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ecec796323so7686491b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714661168; x=1715265968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MAGBXBeUMw4RQ8TuEH6xQvI9gbF7opOFoXZ6AOeTtms=;
        b=DBuNCeKQwvBxgCS3LcmIwziXOFxmRrYMUKjIhB6PgLfWnD008QG1WVEz/MF5Up9dtC
         zXnE1t+0q7u0RTfC9C000sG6R228HtLpmZb7/VjWtpeqEpYCtaRygCJQHzoRKnRh1KU7
         BjvOSNLR1uneZmPciDInKQqMU6jdiNrF8+xkpHse5ammQIUYJOJz11+mqel9CYo8AQe5
         dXDH6UpEvelxZPss3nGBhXczJ9C+gaksuRf86EGth5FhAt4nLCtaWMN/ayqiekJSTUXp
         s2V5IqJ0FKh25NyfgMZKp8Xtg+uRhVZFv2jlIUckjxQV5ihZaauc8lrzouGi+wSrD+AP
         qxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661168; x=1715265968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MAGBXBeUMw4RQ8TuEH6xQvI9gbF7opOFoXZ6AOeTtms=;
        b=oFEKNGvcSMAkAxd7lliS39bt/1h4H2OkaQZjN5WE0f0PTr7tAm6zWLLcC8I2FNbwD4
         yZCjYEZcGfjGtXgR/EOH89mH7qApwrLfye/ky7wISh1bGCKEZXCyVLEI9D5PLgFCaJIW
         PDJ6DNDF6+yImt0LJ+EyyaG81LMigvLL/8NsZsKVJ6wOlPbXAnuHlG/U9Yti2So9YacY
         EqJ8J4fVCmJ3MDNmQrRvFlsUhJ4tXCtUHC3TozKUHl/ge6WdYbovxJysTFBJVyWmLdf/
         gKev3fXv8gHiFqGv7xeD6J70ZKILLO6DG4uQ9XrPEOaVxiFwD9FbUON0fJmHsyA17178
         zUZg==
X-Gm-Message-State: AOJu0YxhDhbVXcKP/DYIOtcEVM4bz/Vg+zt4hUSO+Kzr2hcnzdJ15JBZ
	zpj3HSMz50hXoWLByvNV9f5WJ86fVOjQlxus1vNlxumhyaxfeJYcyt3Ysg==
X-Google-Smtp-Source: AGHT+IHOACljiYTsqvv5BEdwJD05ZUEijMi1xV/Qtr4giTFvCGSKVwIiFc7XObL4IUCAhlurXv0jNA==
X-Received: by 2002:a05:6a20:7491:b0:1af:3870:20dc with SMTP id p17-20020a056a20749100b001af387020dcmr7396584pzd.55.1714661167744;
        Thu, 02 May 2024 07:46:07 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id j4-20020a62b604000000b006ece85910edsm1298204pff.152.2024.05.02.07.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 07:46:07 -0700 (PDT)
Message-ID: <376c813f-971c-4558-b596-64e7f6f3833d@gmail.com>
Date: Thu, 2 May 2024 23:46:05 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kernel_include.py: Cope with docutils 0.21
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <faf5fa45-2a9d-4573-9d2e-3930bdc1ed65@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <faf5fa45-2a9d-4573-9d2e-3930bdc1ed65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jon,

On Wed, 1 May 2024 12:16:11 +0900, Akira Yokosawa wrote:
> Running "make htmldocs" on a newly installed Sphinx 7.3.7 ends up in
> a build error:
> 
>     Sphinx parallel build error:
>     AttributeError: module 'docutils.nodes' has no attribute 'reprunicode'
> 
> docutils 0.21 has removed nodes.reprunicode, quote from release note [1]:
> 
>   * Removed objects:
> 
>     docutils.nodes.reprunicode, docutils.nodes.ensure_str()
>         Python 2 compatibility hacks
> 
> Sphinx 7.3.0 supports docutils 0.21 [2]:
> 
> kernel_include.py, whose origin is misc.py of docutils, uses reprunicode.
> 
> Upstream docutils removed the offending line from the corresponding file
> (docutils/docutils/parsers/rst/directives/misc.py) in January 2022.
> Quoting the changelog [3]:
> 
>     Deprecate `nodes.reprunicode` and `nodes.ensure_str()`.
> 
>     Drop uses of the deprecated constructs (not required with Python 3).
> 
> Do the same for kernel_include.py.
> 
> Tested against:
>   - Sphinx 2.4.5 (docutils 0.17.1)
>   - Sphinx 3.4.3 (docutils 0.17.1)
>   - Sphinx 5.3.0 (docutils 0.18.1)
>   - Sphinx 6.2.1 (docutils 0.19)
>   - Sphinx 7.2.6 (docutils 0.20.1)
>   - Sphinx 7.3.7 (docutils 0.21.2)
> 
> Link: http://www.docutils.org/RELEASE-NOTES.html#release-0-21-2024-04-09 [1]
> Link: https://www.sphinx-doc.org/en/master/changes.html#release-7-3-0-released-apr-16-2024 [2]
> Link: https://github.com/docutils/docutils/commit/c8471ce47a24 [3]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I forgot to put a Cc: stable@ tag.

Jon, could you do it for me?
I'm not sure how far this wants to be backported.
Maybe v6.1?  It's up to you!

        Thanks, Akira

