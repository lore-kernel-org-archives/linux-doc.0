Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319C8F58;
	Tue, 21 Jan 2025 03:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737431046; cv=none; b=rwxb020+/fZbcjJvTGwdG7JEpUxctrkgJIfLRtoCMJ9SWjgT92PtschVauTU0W67NvF3F9ah3iZJO3aWwSqUNyjG8k1fKJCGmA+pia506zI0smryIOzLyErpS2m0JDXiLC2dvRtJ2XmbUSMzsxavbeh53JDb269OUT0X64LW+vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737431046; c=relaxed/simple;
	bh=jOJVULn6EqFsDjJxxk7FAAcOXGDkIA5EGSZIb4wTFDc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Kx247OQ+IwDD5+OCxH+J4j/sXABAghdQe/oGubnAeOqTzufNuEbstSbJyMpgJEu0RwxfEYGj4I5bhbDHacPnpsMGMAWBRtGcPgNCOqxr9V7tVu9HpwV9ybr6ObhYTizZdx0aDEmr4ZgnUCwW4k5Jgc+2n9O8sipSc0MI+dcXWKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvSBZcKT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvSBZcKT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21619108a6bso86324615ad.3;
        Mon, 20 Jan 2025 19:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737431044; x=1738035844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAkkKUzEXXYVdip0FNgTweAxK1wX4PuAFbB5iWdOOlw=;
        b=MvSBZcKTrcEEW1uRqudZdyiXfjH+PSQ/iHiixWQYTgjfmQ2L3cvsDRaMzusSAt7OfT
         5kn4z/663RVqa6tZs10UMM3Rhi1RxeHz1ewk69Bv3TiPEwESmSQZPusura/Vjs61VWJq
         RaqMItzYh+yhQlxIpc5ljiwzLmOuOmUZ+m2y7bLdmj5x9Su5poEcWUoRSr0owgDfIIXL
         vO1QljQj629B39oFgQlR7lUt1hU2006mqAvvxQpvjjqcj6rdTNSavA3gxUqiKq9XCi0Q
         TIYfeBf18Q7PJwkO1oTrKaUae4j/OSrCs8RMFnzFlPw7I+JPhm0Z2Od1b9XbRs2yqv3K
         PucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737431044; x=1738035844;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAkkKUzEXXYVdip0FNgTweAxK1wX4PuAFbB5iWdOOlw=;
        b=VfdjMbJq7rfzqC4+LJOQvHOuboGNK8uuQIH6IPkZvHDL2apLOUG96Tzwkz2VvAnKA2
         awnQ9jako7HmJxTz1Wy/d2GaY2yCfyFP1ez3G84QZvUD3n6cWgb8IbonxNox9s4I0qc6
         /ko0Rugi2jFW3KOWKwzDj1q3+Tti+8uh8LfR5o7DuX9/43cp94NgbWtXQU0oHvfwFE7U
         0zzP9XJowtVeanbrW0eCcSfAf6nG4T80Of7ef4NfQyUByKNnc+vD6T2QBpxS+N5qTHC8
         n2TEM9qG4rqyT9iz0yCDAJpCrGygstIWvEtHqiirlm89J0F+7nxUHe+1bK9unWK6p32Z
         ajsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdu63Vg5LtSI8THdY5Sd7Qnntd+ISxK7I7Tv7GlWSvubB80A2JOP9bK70Vkrn9DL6lyibGFkp9xEaV72o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx94E58mr2LEKYy2OVgELhS8WuBeOKW5s6BDTlF0jldvk47Ne4K
	P/mvRHvLYxVh3MSt3sUKYQfgj6y8gqGabBeImppqrU0v6SnL82C/rzPhsw==
X-Gm-Gg: ASbGncsLj3dsMcTGF7SisbKQxNQqXf+jmKG+PMlIMQIXvudKP2lB7c9Pvr8auLbBsef
	EFY0a0nGj8oCD3+izMXUuA8jZO5Qmy/D7SamMmm9ruKRZkX5eJxVKyIw0SlVaZPg+e78n1sEjlh
	oSNRLCRHO+kj4qVA9RwbXwLDu/+klfjH2zOzvLwueBZFAqRFKu1crskl+TdjE3ofsQGzlPtdREp
	s6beChLCDVaQH89CUr70JrEPLB3pBFUGtTfCwGlud6yg02/OznUiJ62YMmTZXdim86D+XqGeGFa
	OX2Y6TUmlsMV+mNyamp7LczGJkIPO7Sr9qRuDVcE
X-Google-Smtp-Source: AGHT+IEDCVtsHwTIUCIsOfD6CCsuyPxLGDRZlvsFQ+HlYavctm4lQAe3/vlUIHcnSyhj7rzmcM9uQw==
X-Received: by 2002:a17:902:e84c:b0:216:6769:9eca with SMTP id d9443c01a7336-21c355b9442mr190026105ad.37.1737431043938;
        Mon, 20 Jan 2025 19:44:03 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d406f8asm68254755ad.237.2025.01.20.19.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 19:44:03 -0800 (PST)
Message-ID: <bffb09b8-8e9d-471c-871c-2fb3605dc7ed@gmail.com>
Date: Tue, 21 Jan 2025 12:43:59 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: carlodelos90@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20250121003056.10930-1-carlodelos90@gmail.com>
Subject: Re: [PATCH] docs: Fix backticks in README instructions
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250121003056.10930-1-carlodelos90@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

carlodelos90 wrote:
> The commands `make pdfdocs` and `make htmldocs` were incorrectly formatted
> with only two backticks, which caused confusion and didn't render properly
> in some contexts.

Do you mean:

... One example is GitHub where top-level README is assumed to be in
the GitHub dialect of Markdown.

???

>                   This change updates the documentation to use triple
> backticks for consistency and clarity.

Obviously, triple backticks don't work in other contexts.

So your "fix" breaks assumption of others.

I think GitHub can render its README pane in reST format if you add a
symlink of README.rst -> README.  No?

> 
> Signed-off-by: carlodelos90 <carlodelos90@gmail.com>

Do You normally sign a contract using the name of "carlodelos90"?

Signed-off-by should be regarded as a formal statement that you
have the right to submit a patch.

See "Sign your work - the Developer’s Certificate of Origin"
in Documentation/process/submitting-patches.rst.

In your future submissions, please use your real name for signing off
unless you have a good reason not to do so.

I'm not sure if adding a symlink for the sake of GitHub compatibility
is acceptable or not.  But it looks to me worth an attempt at least.

        Thanks, Akira

