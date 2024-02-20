Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE76BB3C
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708442941; cv=none; b=WcD4smxofMoLV3WU3p5JtN8yZJ6Wc+2K3g3sl7Rka85MJ3NQrex/FpQAKAifZ1k/oawBVtAuPKZhf7VNnGTRFYUr4Fpgjv9doLjHF08hgQKeyqm6CFpO7/17p+QVR41RLP8q0Qb74hOZ9hD7agDOvRjsodbUzi/mb3B/+a6MSrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708442941; c=relaxed/simple;
	bh=eMn9qDbC9wGSxZ4ewa2LjTQTyBnTusO4hzUEt4oe8Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pggVQzSYp8UzRUNg8dXVHASyuWtnDW67lYFaTWGDQZkqsT/W8+mvsWkJKX4t/ZXAwvmqrmlN3bsIvfMvqI31ugLE4EoSTL+WdWVHE+X/FOthJjs8NYPiB5krPPqftyafYlkTu6NoXnoNroiGXX5uzBAjsmHxHhHa7YRozqWEEn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c02umZ8E; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c02umZ8E"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d94323d547so39985545ad.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 07:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708442939; x=1709047739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HiOQuHRHTl2ao4geU6ih/hRdL0KV5KJzFH9GXYSw1So=;
        b=c02umZ8EFVuf4F/2h72sB45/28+VV/KFAGY4XfDK+pRZkcs3ecWi5mBnbacF10Rea+
         VZF/YA6T5DX14s/ZM0z6HotVjYfb1KK3PJ0+vI8AocV79FuXAQMU0+rIJGz4HKF68WF4
         SOJLriCRR39Rk62QHclOFMUwR6hXdPAflK/4v/azt3SuPk4FUv0+O+sGNXJB4sWaAJz2
         E9JVNOZ0/A8JYMzILvLn/0CB2Uh185kAEFNfABKbU27XMhe7N+voPBuuDBV6BtuGF5e9
         9SCafpHGSmR+YXcll+tbRcwHLrKBxpe9q8tUTSTqH2lkqoeqRBLYHO+KIA+VEnXBW5DO
         xyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442939; x=1709047739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiOQuHRHTl2ao4geU6ih/hRdL0KV5KJzFH9GXYSw1So=;
        b=vpKnJF95J5QCDrEuJfGnZc4nEEQ6mWaEVj5+PiZxvC0AlHFElf+eh1HF19Qoew0GVQ
         LXXkV9Qkc1TcByaRAx6zOxdJI7ITS4xsnJOnAmYCadi6Phag4W3XSVUdxkw9C0gFq/ZM
         X4sEa3AD5A/mo82y3liT8HRAY1hko7HM+5Sygg1Z5NCOYQeXGyi6W0fPxkYKDrXDUUWE
         E0ONanY/SF/3LlkE813r2qp/tWeIWlrZ44hw2HMzJ3kE8di1L3Zj7UYunG+PUQFVPY+9
         dlimIQGwe7ySc2ZQ28d+PqgvbyXxffGWydRhwfcRAp5d4gHV+nD+5ZeD7jG+gs+ypMSS
         HM5w==
X-Forwarded-Encrypted: i=1; AJvYcCWWW2X3H66YhnhcejhXKFfuTNChdiYplR/9OSwc5fyTdtQKiBZb9mBW6dBrVUeEiteJGhfzYGhVDtvg5gyk9dy2S7XsMyM+U3UB
X-Gm-Message-State: AOJu0YwmFkrxu4baDHGC0qYtjDxjP41iNkzU0FidmvGKLmZ0ftd6iNrb
	Bfm/oewwO1pclB0Tl1x2ZAKjIWtxdzxIiMhR+idReI7XZQyDxKQ6
X-Google-Smtp-Source: AGHT+IH05mm98Jm+JkogcnJIG1qNbV1gSSE9v2UrGV+EDh4Tn8Rrh7T5Q9IpayywWbsFy94h4AUCBg==
X-Received: by 2002:a17:903:32c7:b0:1db:8907:5fb8 with SMTP id i7-20020a17090332c700b001db89075fb8mr12802648plr.27.1708442938740;
        Tue, 20 Feb 2024 07:28:58 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id jb19-20020a170903259300b001d9a41daf85sm6388078plb.256.2024.02.20.07.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 07:28:58 -0800 (PST)
Message-ID: <685ad03e-b61c-4c1f-9080-c7298a7625dc@gmail.com>
Date: Wed, 21 Feb 2024 00:28:55 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Instruct LaTeX to cope with deeper nesting
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>, Akira Yokosawa <akiyks@gmail.com>
References: <87jzn0qw19.fsf@meer.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87jzn0qw19.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 19 Feb 2024 09:05:38 -0700, Jonathan Corbet wrote:
> The addition of the XFS online fsck documentation starting with
> commit a8f6c2e54ddc ("xfs: document the motivation for online fsck design")
> added a deeper level of nesting than LaTeX is prepared to deal with.  That
> caused a pdfdocs build failure with the helpful "Too deeply nested" error
> message buried deeply in Documentation/output/filesystems.log.
> 
> Increase the "maxlistdepth" parameter to instruct LaTeX that it needs to
> deal with the deeper nesting whether it wants to or not.
> 
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> Link: https://lore.kernel.org/linux-doc/67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com/
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Tested-by: Akira Yokosawa <akiyks@gmail.com>

And it seems this one might deserve

Cc: stable@vger.kernel.org # v6.4

too, in case someone tries "make pdfdocs" against 6.6.x LTS 
and 6.7.x stable branches.

Commit a8f6c2e54ddc did nothing wrong on its own, so a Fixes: tag
is inappropriate here.

> ---
>  Documentation/conf.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 5830b01c5642..da64c9fb7e07 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -388,6 +388,12 @@ latex_elements = {
>          verbatimhintsturnover=false,
>      ''',
>  
> +    #
> +    # Some of our authors are fond of deep nesting; tell latex to
> +    # cope.

I like this wording! :-)

        Thanks, Akira

> +    #
> +    'maxlistdepth': '10',
> +
>      # For CJK One-half spacing, need to be in front of hyperref
>      'extrapackages': r'\usepackage{setspace}',
>

