Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867836;
	b=Jsz71ob95BZ3eznw8E7tlk4qjRpSHhIcCL3v3FhGsBYoANSYjd6N1Ni/i6t8pvhQQzyV
	 dB/mAjlIL8hfOY9VtHpDMySTt3NhMAySqIjyMSUjRLbrr3UKQNtluOE9v/C7P1aIyYhPk
	 mFNZrz5H/IKm79FD+ed+AfTxngf3bcBwZHBad+G7n3bOjwKnnDQSFWorG3G6FpQQUwaMB
	 Uw91X8ubDJC2uS+pXExmNh6YypNTkcuDbfNmejyg3a/eKmmBdiMhZHh/SXROcPAVTrvwV
	 OZ59l7AiZQviY5XSNHCi2T5MiGBLscC82YFfR5vXIeMFjY5QyPYIdO1Q0xGFwddkWbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
	b=mSrKkKA9NcEcMk0BM1BjbIgDQezfAbgoSmLYg08TK5QkVEwYNWBXRBQ8KwCqUDcUA/cl
	 GzIBwpm0l2+GyDQe0ZYcp5jHOkVOKBbJ/r8JZCHB3Q85tzN2AGXQf/qXhFUCZk2EwNwXD
	 DQJ3zcTR6mONVnntDN8FvfFKyfMwvVyOU1KQFFl+lI8ii7s2ewTT++/PxirB448KPdPtv
	 BUlqt9dBVBPDU+PgzRPbpKt7BxfLnIqICpYjV0+JscEc0QkzEXbDbS3t1IPmtiBuR0Mm3
	 4MY4b0lBNgnXzg+ALRH78CmQCKVcW/b6EM81cEVAv/8KBz6mI15gGqmTg2pjgj61a5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCd7OApu;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06741606A329
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06741606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCd7OApu
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so12742235e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 00:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793867834; x=1794472634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
        b=TCd7OApuoL5e3stS7D1Cly3qhe5s15objHkahbF02Otwe/HfYG0Lej3tHT+vvUg9fX
         wM7/rDK0ZKfkmIKirGxQ4lCbjDhxdGdeY3tFpTNzaQ77gZIvgCQbEVQnLYSoAtRd/F0B
         B3P1GQCvO1Ey7jnj2cNDru7e/V3p7HMD+mzycRvyeaEFiOSwlimL84H/o+T+Sa7HeYX2
         947109hybPJgL421as69RaLomQaFhr95brhMHrb/jbGJdfW/+OsFTyr4iOavfSJAjTq1
         /9RC8ylZyagig84Z8nnznPCc2Fzl/McnQn0vWxi72uOtuqDts7dZxdxnDXtW9AxgOA1e
         XQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867834; x=1794472634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
        b=T/kb9WvvANtAa3qP+sjMWFW6cfdnuKXFjov86xAkPGJJr+voQHwOlJh3Izrgltkl3X
         bM+2eElUrvLuEN/QS8aVLfxofCjjym3Gp0eKPo9qSlc3d7wVHhxT3r1WtiLY70r4v6Tr
         20X/yRrdf0DhN+ynhZJ0CpkuMmrrk1LxX9wFj11zquP8tWk3OKYo2O9MAX0AqvxRF+hG
         CxxKlopgAylc03Rchh38KSV4/KJKJmHjqBpNnYu934UZbJyqsvS6B0L2lygA1tIj/Upq
         uAJQDwFaXLfVdPJUAc+yLtMh0mwaPqCw76KS1trCBvCElu3IDjv2g8FmWyB3JR9zqvTL
         +1iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBaX1PYq3v1XYmXP+Z103tbMjutY+oBchrXhYM7iwP2mOxRFmJpgZ/08Egeb9XCEf3FBhWEhBs2l8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Oqx5qji/iXuCBwvhiYgELjltQaA7sBKMeiH9ZnH5ErNzMnMQs
	QDgXidPJq78EXfgvd8nQYv25MrrgQW5nxR5qpf2a59U8dAxwsVFXFrdn
X-Gm-Gg: AYBFou2tzllPIncDGVG5v8KJP36tFrsdrI7+FrpntOlUOOcqlH6VyBxsab5UISiqHZh
	vGxBP326lXUzjU1XUzSSjYijqVZ+do0Mz/Nmes3OslLkMBLIrCvOm0oBgLAEucOPfKticTEXmfM
	ttYZ1hz2pxPUf6JDWonTfNYdBdzPm5TYiWuKl57zXz70IJPIkZ6Eulouy0gDWNkxmNOU35oGyYg
	+libb2DN7CWwvOUDrymHsBFXu9BMk25FRJ20nVTaanl0J3nUbaigX9F6B2V2WAWTRXj6FtvsOC/
	Tdiqndn7194cxnUkm+rx5kZ/Tf+PNucCgrR146x/YYoqv4yFlH2NYgp2xWr5lD9BsEAglmh2Akv
	XlprXKe5B36OCS27ndZlIfv4ABQDG26h6bXGeGxvxfF73XV3QIFfAFXsk7L/1TfC1ujrXf5rWB6
	llnxQ0LUbINJmtml5X5AGF9YoQgGRRIxJciYsj+VD3aiMaWfiCZktFdX0mk4yjSjCjfPDk53qXx
	DB6ND3tF3yPCf0rDNZMj9iVtnlwle8HGSCrGxjCMF+ve4QfT6I85JtalJr/d5jhMGEfVOJ7MM9k
	/SClHZD1RBdZ4ClJnbzOtirkSZyDP0hkM/M5AoQmLA5mewpdY7bB8+uPhgGAOYan
X-Received: by 2002:a05:600c:4e88:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ac16bc4713mr417554995e9.6.1793867834333;
        Thu, 05 Nov 2026 00:37:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cae5sm75471835e9.12.2026.11.05.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:37:13 -0800 (PST)
Date: Thu, 5 Nov 2026 08:37:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261105083712.14847dcf@pumpkin>
In-Reply-To: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<20261030100215.6f8e0d4f@pumpkin>
	<CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
	<20261104142307.431fc12f@pumpkin>
	<CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 16:05:52 -0800
Samuel Wu <wusamuel@google.com> wrote:

> > I think it might be more sensible (less pitfalls later on) to return
> > the symbol number - not that of the next one.  
> 
> What pitfalls were you anticipating? If the current symbol's position
> is returned, userspace needs another ioctl() call and an -ENOENT
> check, to learn that there are no more matches. Alternatively,
> returning the next position means every call pays for a look-ahead,
> which for an unfiltered query walks the module symbols even when
> userspace only wants the first match.

I was thinking more of the kernel api.
The 'position' is just an array index.
So a 'read by symbol name' would return the array index of that symbol.
A 'read by symbol name index' would return the name (uncompressed) and
do the lookup (binary search and linear scan) to find the value.

I've used a bit in the 'sorted by name array' to indicate that the
symbol is a duplicate of the previous one.
So checking an 'exact match' for being a duplicate is cheap.
But for a partial match you start needing the name buffer to be in-out
on the read-by position request.
So you start needing 'read by position' and 'read by position with
name compare'.
It is likely that the caller will need to validate the name anyway. 

An 'interesting' idea would be an ioctl that returned the value of
the nth symbol along with the name of the n+1th.
That might get confusing though.

David


> 
> Andrii, do you have a preference between the two?
