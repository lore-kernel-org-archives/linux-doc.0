Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD721C75E2
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 02:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736476778; cv=none; b=YVbUQlgyLvAgKFv+JDpcrGpkprSMS+TanOUWwthgedQrH2SwXYhWzhEAR2EE/pvJZD7+SbAQEIZr9KcuQrOTOjomrBDjyyxnQV8X3pr0K/HsfnJzhPegSSvVk4BN9YPpHiuUsPI9kSHgberokxonQHjvJYHFRTzQv81oNXMJ+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736476778; c=relaxed/simple;
	bh=wNfG6a4nWV+WDHvlYEywMmAzMAZoADg+1dGCgUfBAow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhD7jo6K8DOzsAn1iW+7mJ9NqUdwsVq3lcsliy7NlVq22n7eIiyEkimTYYaCM9NPaejzFP49PePT3Udc6gBjuvCQz9VGU/u1BFEwY9D7hG1e+sOVvbp+MaDSK9xDIvU5EKhwe0Q035cLGsjNduzbvbc2WKVLo7Z+qIy1QbIpU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AC7FTdxX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AC7FTdxX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so2080199a91.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 18:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736476776; x=1737081576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr2zl9tokZEmJRNbwSPk2x5ju4GlaTGsmKHBRm106nw=;
        b=AC7FTdxXayw7v/b/N4r3gcPdZJE6h3u6NcGuQT60PYF+SccMrAciT40DCDvAvVMRfz
         6dqqc8cjXV8w4Gas32/NfUPg/yLnBUzxkHJ1CO0f/GQ3F70z5iefLzUSzpKPUOVTntNC
         9jyR0u1JBD5GDNY7gjIEq2UAOE6na0zcXBAUbZcz//8EeD78Oz0y73DpqWcIfWxOq46O
         Q1DLNVEXJKxO1TEt7bypjGsJtOI7EtsSFm12DWWSJarQYtr5mmawblUn6gd9PmKhliFR
         rj+xmDQwXurKl5erlqNHhKtRrgpSEuTnd1F8JOG5XcObhptH5tXh1OdozHh8QS6BRNJS
         8sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736476776; x=1737081576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr2zl9tokZEmJRNbwSPk2x5ju4GlaTGsmKHBRm106nw=;
        b=XS8/K31I/JjNCqnQygGn4RDnTlfeoviddY4fQem4QdzdPbUQAfBjS1IchHfTFV7PSn
         v0Z0hbvvkwMny1qf06wQrpr4CQuITom91yBNtHTn1A+Nn2pHzRC6AntxpxPXNVRgH4G0
         IR+PaIB/5HSK01kJFATut/jPAIEXTcua1T5PJIbzSwzxx2CacPq11aakZQYG9azOcCwP
         d6YOFqtPeNQCisaRouquVVu6u2VYvqNKYNrbS95JM4AWaklFsi2v0wjhHNVFqhwcRbA5
         8CCPdJ+zFEI3kLUZy3h5Nk27ItzlrtgKlW60T/CKN5rN9wjWw8O0LLLTGy+y4pSmZyWe
         6gKA==
X-Forwarded-Encrypted: i=1; AJvYcCXh9idX1yfcrP4Q3yV12HZIp7Lu9JWbSqP84RpjarAB8BSDEVlNLZYIsC3uGQ5A+lmU4sUaxvaUSvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz21lott8thRfS2qznbU17YZLw4rbgw2V2fnNm+mCPxmR9iWKYe
	xPhI/zAfRXAWRSBGwjvRzircp5XfTgGySiCvuUKw3bUo2KAtjuk/nF5F2pwk790=
X-Gm-Gg: ASbGncvlOjagG4M28sx4z3zJu/Y+cp8wCCkVBhg99DKAuGqivBmqXQGkvvHyZnkcow5
	tlNFS2wqhaSzmJTroH4HGtEZ2BJ7hQp0pdom3/alSb9Ok3SPpTysiVMT01XQ/I6vw9z67t23CBr
	PMwU+uxHk5aLzVgVoPQBMMnYMMuFX0ccWWjU8CSj7TJbzU2WtopF5e9oLVld6gYepee6+Xg5G/o
	CdExoY2cYvyY4ZP3jCx/8Nc6oFyniP3ZooX5fBNr/SHJNaHgtli
X-Google-Smtp-Source: AGHT+IEELWBKHxdbrUGocMcdse//zbn0a7mfhRS+t2cLR4rGWCWkHhICwizRk/m67LS+t2LFMSJfyw==
X-Received: by 2002:a17:90a:e18c:b0:2ea:8fee:508d with SMTP id 98e67ed59e1d1-2f548f45fb4mr13311438a91.30.1736476775943;
        Thu, 09 Jan 2025 18:39:35 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f233836sm4473465ad.207.2025.01.09.18.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 18:39:35 -0800 (PST)
Date: Thu, 9 Jan 2025 18:39:33 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: cp0613@linux.alibaba.com
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Documentation: riscv: Remove KPROBES_ON_FTRACE
Message-ID: <Z4CIZSpbbUATs8TN@ghost>
References: <20250108020342.4172-1-cp0613@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108020342.4172-1-cp0613@linux.alibaba.com>

On Wed, Jan 08, 2025 at 10:03:42AM +0800, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
> kprobe on ftrace is not supported by riscv.
> 
> And commit 3308172276db5d ("trace: riscv: Remove deprecated kprobe on
> ftrace support") removed the relevant code, but left out the
> documentation, so fix that.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Perhaps this should have a fixes tag for the commit that removed the
support?

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 3308172276db5d ("trace: riscv: Remove deprecated kprobe on ftrace support")

> ---
>  Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> index 02febc883..d937b7a03 100644
> --- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> +++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> @@ -20,7 +20,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: |  ok  |
> +    |       riscv: | TODO |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
