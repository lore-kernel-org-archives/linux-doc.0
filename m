Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDA3DD514
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927858; cv=none; b=iecjeAgsun1OQYOBKJN+X/3wZMkeOBquuwIFOLWvy5lSjYdemfJzfEjSLlE8PgYCk/9a5ABdfW695lquSIbe4/R+BwA9ChTz8hHO1CUNWPHaFWOCOzfCpC8FyK9NWCX6o48tkIBW7w/TdGt1h1ZCbXohbQDyk1MhVOiZySLSkm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927858; c=relaxed/simple;
	bh=BOWFI4ZVdARo4b+YYZ3jA1Rs4kF32fa3LdQ7WaJFRDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4XoXyL0HBprP16j80RA/CiIKImLuVi7IWmQpcxyUTQBSzUkUQpPnNFXbX6EJ3nr8YI9AI+AJihTfsHJnzX9YZKan/CfsxcgoxDM22S+yyqj6/uJkXOrDtqac2LxUu0ZA1Z7PQF1nSxV050bwIpAwnIQaIwPfOj2P8m/r09lZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTsjzDNH; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTsjzDNH"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c6df0b9bbso86541c88.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927857; x=1777532657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8qPIWsE1aC3FA/rveJpSyhd4EiiBmj/2eCVy34kXTaI=;
        b=hTsjzDNHz5sloZCMBPgNj3gXFN0KBjhxtsLnaPgtE1tyb53FqS1bgKqm6AU8sfHS5E
         diWewmYFCqSpPhk+JkcLHICtTwOorScbamUD1YR2UBcvBXSIX7sty0J9JMM9nxZ9NCOK
         Iykey41+48vMAnhgv4SoyoW2LcBIvX3dlK64z0CZmh9xe4Fy1iwETvNUEr9TOuNuvSZo
         ZDbO8h5lR/6FN68yvo8DFU+6V6udnW734ozx0fJ1LgZhIddG7Cqixo1HRbhRo/8/XunC
         NSRxvr9VLvT4S5eCUuXm0imxJgtb1kTfcH0GV5dxPnJr/yMCTxLQfbLefdZ3K4zO8dRM
         CGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927857; x=1777532657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qPIWsE1aC3FA/rveJpSyhd4EiiBmj/2eCVy34kXTaI=;
        b=FV6mh1IP8YAYPRkjfCnJtmwftLv6uAXmAowuUJxxdwJDTzNfXc7rWjm4FDb77k6Vuy
         gKtkOAOWzfa6InxI4h7A5EEFe4VKH2XG9upJup+ujtmhE5TyIX6EC54bPkad7OkUQHeQ
         KpFDhE6Ax9w0PgBNJ7oKYP8c8ftcuxz/yUSb+hGCKj4FN2Un2SDf8L1O2+uoudA3glKC
         MarXjxcPPfXJbzEGwenC3SWVoSdeD531ufywd61QZhO9TPtBstjd4Fq6yOzPGBMaVMyO
         CT1pPTdRobQzMOlQZVBMCHCuZ5gqgdGgyWnZvkxgQst4sZ4EuGjNXtPF9qI6AY9y4Jc5
         BVXA==
X-Forwarded-Encrypted: i=1; AFNElJ+WpydM8eaEyf09rR01FqaZ/OFaBYnunxXTdb9ilFR52bP4UbGP9M7mxh9KvdkqB7S+UhVTfMP59kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQw4B1+HkdUqJYhMt4ZLxoqWghRZSaD4Dv7w7XT8eRVVT0djD9
	mpNZR//t+FtWIPQZex35H8t5RuMo4hofpzTsMaSaK9WvLyeC6Ox1wPempLh+vroU
X-Gm-Gg: AeBDieu5rfcRpiwVxnVpn6FxS4jlKoDn+wrndjWHUB7hWkZj2xjr5JiuSQPQv08dS7H
	uo46OZ6PRdT04/1TQuQZGW7zNKYYcwUCvxfe+Ga/KeDtknnzaEGs1mwCUzGy9MH3AeP9SQmnDo3
	Xh1xEQp09mKVcKA7yrBwuVJmIPIi3x9pmlP5OuI6Fn5kH3WuJCodW2TdH18x2ZzLD5iHDwLp+ks
	hxjYOQgtDblVrvRx8k62xACbV16XzeR6UCenjeuDOohjFSlOX16KFe1RTDRhVfZNto5eZSe64nk
	9T8Beu4lIPOyDIOOj6pOZhPy/hT2npV1k2Lw2SkEhc/CjG15q2Lx/Cx2NZVJpRNxIkBhxeUal7Z
	/NhTodA2+HW0wA1MmoGuAryoZXaU2jpCgPTiQxApeXvxRIk2+luFuscSGEBvmes034yLLiFCNo6
	1mdxXK6oPnfN36n/6zh5KscN7XOGGFw8tskA==
X-Received: by 2002:a05:7022:12b:b0:11a:3734:3db3 with SMTP id a92af1059eb24-12c73fac54dmr17782302c88.32.1776927856545;
        Thu, 23 Apr 2026 00:04:16 -0700 (PDT)
Received: from inky.localdomain ([2601:647:6700:64d0::3877])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a185a8sm27322792c88.9.2026.04.23.00.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:04:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 00:04:13 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation/binfmt-misc.rst: Clarify "P" flag
Message-ID: <20260423070413.GA156309@inky.localdomain>
References: <20260419-binfmt_misc_doc_update_p-v1-0-757c12f33cc2@gmail.com>
 <202604211026.C462A59EC0@keescook>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604211026.C462A59EC0@keescook>

On Tue, Apr 21, 2026 at 10:29:07AM -0700, Kees Cook wrote:
> On Sun, Apr 19, 2026 at 12:11:01AM -0400, Charlie Jenkins wrote:
> > Improve the wording of the description of the "P" flag to explain that
> > the interpreter gets the path to the file provided by execve and not the
> > full path as well as documenting that AT_FLAGS can be read to see if the
> > "P" flag is set.
> 
> Thanks for the clarifications! I'll get this into the execve tree once
> the merge window is over. (I usually wait for -rc2 to be released.)
> (Or maybe this should go via linux-doc? I should add this file to the
> EXEC entry in MAINTAINERS...)
> 
> How did you happen across this mismatch(?weakness?) in the docs?

I was writing an interpreter application that was using binfmt-misc and
was using this documentation to do so. I was getting unexpected results
so I read through the kernel code to figure out what was going on.

- Charlie

> 
> -Kees
> 
> -- 
> Kees Cook
