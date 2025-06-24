Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD3127F4C7
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759649; cv=none; b=RhzPa5QV7o+mj7AL23p/CQWXFgJjStq0xPjPChHtGVJSnnFZYSHCVgWuTFyFwbXEMuC6VDpXRatfCq/CI+EEC1oGblqqOGIhccBcOaZoFdCzFoITfH2glmajJXtsqBBXbRq3kuUkPLtIFnGIVnD0kCZdKLAn1II1x2AFmbqSQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759649; c=relaxed/simple;
	bh=W+CM9mO/ETwaXyRHsX7BAiiGsjxFt5RQdi+vc9rW6+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MP06Xydie1IjKWXmI/YImvFO4o3rjDZcbGLCRfulc0MgyysQEqyfFGZxaM7sJPdjJfCJ6NNg4MXCGtea6zbtTUUBfGDsCeWPWBhjkQ9Rl9nC9OXqJNx9UJSm1kdHYkQSqPt/6r74Nj4OFc9giCNDGwIIcuS9weQJMFv6heDT1iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=mgS7pRNq; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="mgS7pRNq"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a58ba6c945so86907931cf.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 03:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1750759645; x=1751364445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hPlvv9Q47LZ5cAIWrnNCm2DnqvLNTn1tPrP8Q6vlz2s=;
        b=mgS7pRNquJ2v0kLWXLgvyQ/SgfO7VdRmdDoGq8nE4hQLGZ2UOWJkuxkKEV3639qjK9
         Fcqbru+vCgr4cNWKaxvAUEVvEbwgWo3OokOCnRko0QNdy40ZtA4EjxI3px2Cu6G1mWIy
         25h6D8HX433FJUiSD88ZGbAqcL9t+Chbc4/6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759645; x=1751364445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPlvv9Q47LZ5cAIWrnNCm2DnqvLNTn1tPrP8Q6vlz2s=;
        b=jj3xKVf+MHs5XQu8W1jGffaADFToPTehF6BWlRz6pbuwlkYAKC+3TcKH9YLQxsVQMu
         L6Kh7M4MBwgKSiRUGeD4UBfcqtjgLfET+Msz5dFHvVwMHlw6HFEBBhSrvPPxfR3sfNkU
         TXm43eegzQ5ScIrM5ONEm+C95ZXB5jyJ9equ21V8jf42LhhR3Xs8Ya+izNM0KFTfQSOz
         QmcDdpoQ+Uz3TS+/bz76JJqO/sJqngM5fRWd3LUY0y9sG1LbbiwHkBiVnf/RZz9I8ctr
         gnr+YQrsrJzmoTmaS0SjpvgpeT4PpvNeAGF3rIFxofOe+2Txg0TEWZxlKEPoGGewRvRX
         AVYg==
X-Forwarded-Encrypted: i=1; AJvYcCV8fAkBt5ELb0dx5xyrbWfZXMrU1YvSx4DKGVBLFBmFcND9WJSYXJhDKqpVSvNhB6ko2ucmQhpv+ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4tE3iusExA9VxSnInYkMGkUpHvRpJWGzrksfxKzJ4ZZZMPm3V
	TQo1AWV0+TO2TJ5UYxpV5MC9zEJ4MnT3ObpZmL5hNqC48aIdwHvR/XPMyTakbB/RWWheEYNYUaY
	AApHC1soL4XB2pWy04S+KGyLLpvmL8W//EFDJIH9x/w==
X-Gm-Gg: ASbGnctmHfje2Sv/WQTYJlw2wdBYJwAyNj9iTV2WbJpYIJvtpoRY4NWI4awwgon9F4g
	5/NHBCbUMcNbzWHbuM3EGeHojeccbs2BOF66XjQCTie5RebwiKiHHmkhED3QlF3g/eTCivz852h
	mpk7FLO5crX2fysiSDRameoq6YCpiiQQk8P20tno6QaqZkkI94tvh07A==
X-Google-Smtp-Source: AGHT+IH0x0+iRHOWa2KqbV5wn8xPjJLoyNs9pTpMyvvOlaqhWqr33e0pXkymA/nSZQXBfDKBFVAgqMyY/CG6d2NNlt8=
X-Received: by 2002:a05:622a:1194:b0:4a4:3be3:6d69 with SMTP id
 d75a77b69052e-4a77a2cf554mr254409501cf.41.1750759645024; Tue, 24 Jun 2025
 03:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624022135.832899-1-joannelkoong@gmail.com> <20250624022135.832899-13-joannelkoong@gmail.com>
In-Reply-To: <20250624022135.832899-13-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 24 Jun 2025 12:07:14 +0200
X-Gm-Features: AX0GCFu5oKUxjJA2CnW9KEBLReN6IYqX2gQbksH-7WeoCgZJDO5EaGGt1ih0KtE
Message-ID: <CAJfpegt-O3fm9y4=NGWJUqgDOxtTkDBfjPnbDjjLbeuFNhUsUg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] fuse: use iomap for buffered writes
To: Joanne Koong <joannelkoong@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, hch@lst.de, brauner@kernel.org, 
	djwong@kernel.org, anuj20.g@samsung.com, linux-xfs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-block@vger.kernel.org, gfs2@lists.linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 04:23, Joanne Koong <joannelkoong@gmail.com> wrote:

>  static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  {
>         struct file *file = iocb->ki_filp;
> @@ -1384,6 +1418,7 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>         struct inode *inode = mapping->host;
>         ssize_t err, count;
>         struct fuse_conn *fc = get_fuse_conn(inode);
> +       bool writeback = false;
>
>         if (fc->writeback_cache) {
>                 /* Update size (EOF optimization) and mode (SUID clearing) */
> @@ -1397,8 +1432,7 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                                                 file_inode(file))) {
>                         goto writethrough;
>                 }
> -
> -               return generic_file_write_iter(iocb, from);
> +               writeback = true;

Doing this in the else branch makes the writethrough label (which is
wrong now) unnecessary.

Thanks,
Miklos
