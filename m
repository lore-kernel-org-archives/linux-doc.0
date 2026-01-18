Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2CCBA34
	for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768761578; cv=none; b=QvPeGBB8K4u2fW5s/4mIV5n07XH19ynwYfkcPYtRgytAOrCUOF1xuUC8u0ctb0UtAi0myFX7NFQN+Fd/ZZsUHCVCQOxS820/MwPVFRsTTA9+DdJjGnfi/t2hQtrLYjDUrAz4/Ed62zZXmlOpDoqGk1JGSvG6d9+uE76LpawdVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768761578; c=relaxed/simple;
	bh=4lZpR8FG8w/chOL3V/R5ZNGJ23dMmKUtrEGWwqpJ9iU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qq7dWmb5vRNDJhIl4Yd+iL+wTKJKU1+FxVo/EzFGqmnSVNm1Q6l2KP4Vl1uAVI4/reA/jzThrYrKtbigwV0299ZWw5X7PxW6rORNKlqEraAuh3Ol3eLEmRCFyGztSBkPGP8oR5Qdp8q/9ILJDl9xvZoF+nCxS2CsdVS2ZQT+bqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4yD8TVm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4yD8TVm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801bc328easo27452735e9.3
        for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 10:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768761576; x=1769366376; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssETAPjk15Tfi3uSMKlD8z7k1rFd42Egkuq2oU+e61c=;
        b=W4yD8TVmn32U1wFy7KF7r3dunPVVb+xW4MX8jLEGPk3Nmt/jpxBWxDeBYT7Xl8el07
         UiSdefFtUZ+CMvKkXj4cYPKrLZhBIkepAbWdHJx7NlllVWMeXCSUkHx+redRln3Eovo0
         xFdz6EBCCr+/Qi8TlhKBpAc2dKLOy7GDYhWubuy3G6ZDQUnD+GKB5Ezhw1w54N4SSMPd
         IdXcdzv2dLm/SBUom9Y6O/I5tCfA0IQsyzA6CBwyM3xlKgi70mhcaRtTj+ikdxO3PACA
         hzybQSiRnkA5BcUlpUw/b4M2qfyjclvY0eYt7kWTf+BImD3m3EVBUgN+AzB5uYJwArlp
         Y/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768761576; x=1769366376;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ssETAPjk15Tfi3uSMKlD8z7k1rFd42Egkuq2oU+e61c=;
        b=w4mxKGNqvapPYbUvBFCmMVRCM8r8jKRR9okqfFYK6haSmAcu40EVklZH7EwH+B7Cs0
         It+WraJCjcEeCARMjd7FinfEW1ZUiBgQJ2ODD95r/7lcbpWkoZAQMSannUEzAVtcFS1P
         p0vdb3iGae3eCMjgWLcmwywkC5qpkdct8HEn+05OvWX5ouS01C7u35/ypNDTezhyQ3Tq
         OuGQiNP2YRSh3oO/DI/z6aDBaISuSEF6VdPmTheNHCZceIuyS/skGjGllUASa6tcpOcU
         /7MNncuTL+SG5kg4BledaUT+KpUVG0N3CSSKgpfAJdKpLLdoiC6SMYgUQMvhluqNhfN8
         1h+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhuowv3V1UHGuzOxeKhMoZej0iTDCuw1ftq3XNW17FYYTJLj+HOZ/5MTTJyiiOZ+iiED1kL/u4q5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWmpTm7LRVLEy6CEPTpI+9GgJXdvqkhBk06PcdvdFlaAflr2Q
	ET3Bsr0Z8tzaFtiovrAfzTZ0TR1fqKDDDjenTR8hQK7AbQX0HwKB5tVu
X-Gm-Gg: AY/fxX4U+aIPP6v+dmB1os7cHRFOv2Lht3x7i4EaJVFyyjxkH1j3S/H3w0SrPkxuAjl
	p5TvvvpnxfPqtgDWIk6mMf1cY6xCEB1W6VX9F45jfVWfJnX6wkfIgrDf0WcA6NrJm2pfgBnXzqq
	q/DLCqCgAWzgcA9aqfKS3TidiK/a1Okxe8AOin0bDuPpCZIeNpGAqKmr7fHkZ3vEIpZ7SGj+re2
	9nmTSqcK+X7FYVISQOhFMYde8hGBn0deD8RJuAmafUR+TyJfHfiQ8d3aZlVwdMb5kk3Kbsk6XsD
	6NBpk5LKjiuVuQqH/RQHX+Hvk2G55F3AJY+NfK7GLcR5JSj/Igg2fhjJbLSYfg+YpbYWyl3uEwf
	KpvMgBYlUsZzniGTr2gUFwN1/uSwqlwlqIiRxFcU1/1STwLcTWw4N7E5ybKAu6wPEslT429X8Tw
	gjmwvKQ50q9qoJAHPgCiHY2CeiCUo=
X-Received: by 2002:a05:600c:474a:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-4801eb14b36mr110897765e9.35.1768761575423;
        Sun, 18 Jan 2026 10:39:35 -0800 (PST)
Received: from practice.local ([147.235.193.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm74167365e9.7.2026.01.18.10.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:39:35 -0800 (PST)
From: Jay Benjamin Winston <jaybenjaminwinston@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: corbet@lwn.net,  brauner@kernel.org,  linux-doc@vger.kernel.org,
  linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] docs: filesystems: escape errant underscore in porting.rst
In-Reply-To: <20260118173518.GC3634291@ZenIV> (Al Viro's message of "Sun, 18
	Jan 2026 17:35:18 +0000")
References: <20260118131612.21948-1-jaybenjaminwinston@gmail.com>
	<20260118173518.GC3634291@ZenIV>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Sun, 18 Jan 2026 20:40:50 +0200
Message-ID: <873442bw7h.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Sun, Jan 18, 2026 at 03:16:12PM +0200, Jay Winston wrote:
>> filename_...() seems to be literal text whereas Sphinx thinks filename_ is
>> a link. Wrap all with double backticks to quiet Sphinx warning and wrap
>> do_{...}() as well for consistency.
>> 
>> Signed-off-by: Jay Winston <jaybenjaminwinston@gmail.com>
>> ---
>>  Documentation/filesystems/porting.rst | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Documentation/filesystems/porting.rst
>> b/Documentation/filesystems/porting.rst
>> index 8bf09b2ea912..86d722ddd40e 100644
>> --- a/Documentation/filesystems/porting.rst
>> +++ b/Documentation/filesystems/porting.rst
>> @@ -1345,6 +1345,6 @@ implementation should set it to generic_setlease().
>>  
>>  **mandatory**
>>  
>> -do_{mkdir,mknod,link,symlink,renameat2,rmdir,unlink}() are gone;
>> filename_...()
>> -counterparts replace those.  The difference is that the former used to consume
>> -filename references; the latter do not.
>> +``do_{mkdir,mknod,link,symlink,renameat2,rmdir,unlink}()`` are gone;
>> +``filename_...()`` counterparts replace those.  The difference is that the
>> +former used to consume filename references; the latter do not.
>
> FWIW, check the current viro/vfs.git#work.filename; that fragment is now
>
> fs/namei.c primitives that consume filesystem references (do_renameat2(),
> do_linkat(), do_symlinkat(), do_mkdirat(), do_mknodat(), do_unlinkat()
> and do_rmdir()) are gone; they are replaced with non-consuming analogues
> (filename_renameat2(), etc.)
> Callers are adjusted - responsibility for dropping the filenames belongs
> to them now.

Got it, I see that now. Thanks!
