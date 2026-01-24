Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F463B1BD
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769237811; cv=none; b=u1tjgoR5RoV7xfy11EHDqWM3wbHPRMmyKcqusa8GBDK2M0YmRdUlG7F1F3sVaPCSmlWsF8XS2sAfq/m+nGSZaEYhkKNHUkOQwlooQXtc2imGp1xY1eequQ2ff25Nsj7yYOEJO6gyhd5xEBli/DoSuGP+92luJIHrCC+c1ySNvd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769237811; c=relaxed/simple;
	bh=XWJhGhdSASYxWCvQzqZe/Sb9+Y3yqO0nUgrS3+60DFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrIfby4cplkCF31VXlbXzvmLCbDiRRezqAi1Ad8GlYi1Ayb6HtB3TuxkK+h1oEfKe5Mb9FwKoCh3jEWpBatwMxZeMoxeYJTgyb3z1cGe2HRowViuY4Lva+dDPTYHqpWSOJje07g+kvGKqNgHj2OYbLowVhHGKGL6hpugcmLFhqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRbS5q+v; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRbS5q+v"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so1453362b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 22:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769237810; x=1769842610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgVczWZqjpDOEws1aiHHj0tzrDvYB7c+fHoQo0LOiQ8=;
        b=JRbS5q+vcjUIF5AMzcibAif7stRPXM9kiQXPrg7iv4Xd8j3RVMjRBDKIte8zNebHwZ
         Mcj3j6obEhGV+Phx3txy7swHAwFC/KXwzA8Uggp882ecuqvfj1Ps6k71R9+hvbE+A+g7
         tnCz5dY3Yge7SZcJFmGOZcoLeHerLQIKUya5DFd7+XCN3U4uNqz0JHSrZcBwV0JHF+tk
         I8FVdgGY2rzUAay4EoUykrBu6fL6FsgCr4IsZ9WRFlMFQ52Bfg7nxdQ1Ku4OZWLVoi3m
         v5FsLXm/aQhmIIibJxfV/jf+oHVlu9m7o7E3hRXzdrgNiE9DPc3WckjioiK6piaGCOBi
         mNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769237810; x=1769842610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgVczWZqjpDOEws1aiHHj0tzrDvYB7c+fHoQo0LOiQ8=;
        b=v+lrvoqmm89u/AFW4GUVoTOxkyzA3FsJGObvjuRpf1NNjXwoQzsiV8DHmHUe+T2/Id
         NDnPeWGytLw0spI6ABxX12vDv2LcVd626K5kryW52FDmQ0xkx4t+bgDl2PgyE8LgJvF2
         X2Kn7I4v8ZVGFk5AuN0o7/cShDPNo1nw/uaV1SKwgy+cV0fHyDTtHIvxugx6cMJXeshR
         UfNSEcperxz5ZJYMVC8CjIY8DEi+SBvWQqc2L086iOonEhOKDOtdno1pIH3vlPAScwqN
         /CSzzt57h4/V0gaM3liZeAOmWJZ0fL3+QiX1uU02kn1yuwG4O5lcNaiooOn6OJz8pKmk
         ywMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaunGBCsnqZGR4E+TJleab0WrqCifZi8XtqQ27hfaiwexRP+BOQwL4lhY9i3ZeKzkMqgBDjM5DNJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNjm8p7dFxoIyQqDKMtTZ51q3EUbG+fRKb6YjKDGEDdxhgJ0f
	M5z2Bw4Ol6exwx2VcFBs0Ay4xvksR8+RzP2rAAPvtFVsgMX4eYXs1Is/
X-Gm-Gg: AZuq6aK61oyqdz9SP9RperYcWDREfEVgLaWEYB7LhW4dzRZX9v7NqWaFi3xVSd9Ax2l
	2rUX17iUYBFHJFbXp+JqytjmvrFc/OMg+g6KC3VRldfrpAdxSKIFighqPAPnOx9xMUURHeqkVIA
	iATGGg21UmtCSadK9yXvVxZ9o2zd43rW2EpXpbTFJeK7tW5hSHHO0mvzKWc1v9lcCdKgT8Y5peb
	9pRLcZQqj0WyNYHOryxhhL+NP7N1MxvaTkWROzq9Sk1pwN+OCcvhLCTPiicl/UMJWE3jrfT8Fss
	/BtwCKki9N5m+I1rhJJqLTbrwuYU1IvL609sN+qWuU9tZG7cvcNQ4YCGZ6jyrYbl7pKjHFTMDGL
	LZ0Q3Uojo4h+35diieOfzBSGDMc1tV69P+iQWx+k6bvP4FZJb7zvd5UajRtLBr3VUmYg3hERX73
	KFvWj/KLRwYN+Bl15swBagm3y1JK0JPDfmzxtOi7vM8ngDTYLswku1RA/b
X-Received: by 2002:a05:6a00:4c99:b0:7f1:d6e6:8f87 with SMTP id d2e1a72fcca58-82317d4d450mr4745749b3a.17.1769237809748;
        Fri, 23 Jan 2026 22:56:49 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318770179sm3801454b3a.67.2026.01.23.22.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 22:56:49 -0800 (PST)
Message-ID: <281c27c9-1c0a-4cdc-9250-b1fb6388c14e@gmail.com>
Date: Sat, 24 Jan 2026 15:56:46 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc: Fix pdfdocs build for tools
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <1a60aea3155a2e7c5e7bb004952739652407fb8c.1769233717.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1a60aea3155a2e7c5e7bb004952739652407fb8c.1769233717.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 24 Jan 2026 06:48:41 +0100, Mauro Carvalho Chehab wrote:
> the "\1" inside a docstring requires proper scaping to not be
> considered a hex character and break the build.
> 
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Closes: https://lore.kernel.org/linux-doc/63e99049-cc72-4156-83af-414fdde34312@gmail.com/

This doesn't look like working as expected.

I see:

    if r’1’ is used ...

in both the HTML and PDF outputs.  I think what you expect is:

    if r’\1’ is used ...

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  tools/lib/python/kdoc/kdoc_re.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
> index 2816bd9f90f8..dae5a9136fbf 100644
> --- a/tools/lib/python/kdoc/kdoc_re.py
> +++ b/tools/lib/python/kdoc/kdoc_re.py
> @@ -228,7 +228,7 @@ class NestedMatch:
>              yield line[t[0]:t[2]]
>  
>      def sub(self, regex, sub, line, count=0):
> -        """
> +        r"""
>          This is similar to re.sub:
>  
>          It matches a regex that it is followed by a delimiter,

To get the expected "\1", I guess you also need:

@@ -234,7 +234,7 @@ class NestedMatch:
         It matches a regex that it is followed by a delimiter,
         replacing occurrences only if all delimiters are paired.
 
-        if r'\1' is used, it works just like re: it places there the
+        if r'\\1' is used, it works just like re: it places there the
         matched paired data with the delimiter stripped.
 
         If count is different than zero, it will replace at most count

as well.  No?

Thanks, Akira



