Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D033E834F
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101057; cv=none; b=h5h0haUjIvkKICFj6yRUnL/gDvH2vukpG0NHa5uq/l/mYrP4U+K2xinPFlfAHUcZdiOoyCHsTlaBt7pM06Emy5VQ3PKfD1VYFALnTFrGjNBUBk12I7GN2arGK6Cao1lbzVfIxd9sQ2qDuruAkNQ+p+A7e98SELj505umRpaicBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101057; c=relaxed/simple;
	bh=RhWcqJg8RgbB1MJofKvo7sLooBa12dtFpi62aR3SVlA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr9m97D/SeJkUGZUZ3UuZjEsrWGf5ldksdcIbNdImyME/NaaAnXady0v2/svTsRINLxTdNyQpAswuRMG7QGjvjX32YPxu+ArgSIJgodkYob/vUF/rOEhISuCX38gQWfuze/xTHFNk7mi+/0s4bRJIa/2TsnHQSheMixbQztF+kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asZJ33ak; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asZJ33ak"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so23623965e9.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101046; x=1779705846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TfHYXVTtFe8YaePf+Qyu1Vi9txD3OHA9vREKcQqPtk=;
        b=asZJ33ak0Vyy8BzpgsbV8W9yMbtX/3IobBUzr6evd39lgTXOwdAsjwODlfiA4IfAWV
         oN2OnFgvI2KR7G0tI39EJoC2fqB15i+Tqr9txxVJAk6KnuhLmeWYGExopq05wJAwiFJE
         Hb9JoeDGMQI2c3ucBkTa+n2oT+jPrnPBYnKg7JDpCVrBrWHVjC5OFQuEFZGq7SQXfQkP
         pvKYzzeynmi/TmhskNCTCa1nmWStYvTAvKqBS92w3opnpjZJszpcLQ7BbDsEY5o8aja7
         kPut9jURfdR2rRm+bRGJ04JxbKpKFAaoaqvUxwb8W4wnLoML7brSjDknuKjGztLjVWyG
         wJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101046; x=1779705846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1TfHYXVTtFe8YaePf+Qyu1Vi9txD3OHA9vREKcQqPtk=;
        b=fui6kMB1r9CqsaK4zX8nLyPNXWQ+ZDdl/lY0chqd6YPkEM0IiglPYGLxTDLjO1izfr
         N0lgpY5hPdvrS3SGqTfMjzsKQ0n8j5uuuj7xY28dRpwQmaXrYXucXOJdVLLNUw5nkrQw
         BAFSWPZehsak1vN8wxRox49Y4xNzwnssMYddUwacF8fCTgK/V2RxuqiA8LlFE3ECkLb2
         +Vu7h4yn3S87I7E7jRfkg2R4PH7yt+Nl9kbRYJ9Vgzs4bCbJyeeDW6AllJLezIFAcCUD
         835r8CWOYyIDsrtQyBj8JUqxnJRMn96pIiJydYrKA+QIFOWlP4QAFkYPKm97D98Fs+d/
         oUJg==
X-Forwarded-Encrypted: i=1; AFNElJ8o7ozI27i/YyKKK5zsoZdFC0DfBEB963fG1MetHQ9Qs5XagkMpOiSW1TygHLWZj9Y9+olJJIO23HY=@vger.kernel.org
X-Gm-Message-State: AOJu0YweZUqL6V8u0yX/kYqYRoJ6LQ49JloIGUtakSWyJ/WnYQJqTrlD
	SZ4CG3Ndi9I0NyFAOYmR/WSuJQNFTSmxthlYUvzW23Lca8kY3cz7AHNp
X-Gm-Gg: Acq92OHoxUkfb7e3jkcmqlW+B55aPmHiEu9/9SiAqACCEQ9hfjuQ2LiGElOmcporIPD
	sUmILoYbtx9J4ntVE71bbf0XXxwBK+eU1d+JNl2n8dl6Ew+j4W02eOkzSv+fKvfL9inMLPJi2fr
	rgkFqu/vCLYfFWnV7ShfphuvtuXfnGl9ZfBe/7uLTCDRfUHyjk6XoMnF+6gb5l8R4ljZpuPR6o/
	5T5SIKYTCfZLXTlXexrhcjE0gsMt37B0T6CRtDqJUw8y+wPnpc4Fcl0TgFNsY8FoJvFww2qZJHk
	PWOq58BpHTd5eo2HDzCQVpQjQSnHbU+r/+Ltc3thHTFJGPQtTVSyO3qe5hKMqR9zEC9FEiv6eq5
	XOWFKerIUMRTWHQdg9SvccXYqvNbcQUT+9OwFjHiJAOlGt0LlRWlXVDzywgkFOPWZ6vvzfxjwfQ
	XDqT+s55i2wLLXzqRwXYriRZM9XWAN5CPa6XaXAVKIymHzNqMglomarqBQiMidQbA8wz2FFlCWv
	rYJTAL20ap3b5vI1/7+og3jvhs9L74+UeVh4DxgzUcRkYcPjw==
X-Received: by 2002:a05:600c:13ca:b0:48f:eb8b:9988 with SMTP id 5b1f17b1804b1-48feb8b9a84mr122520795e9.23.1779101046286;
        Mon, 18 May 2026 03:44:06 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm36544342f8f.33.2026.05.18.03.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:44:05 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 18 May 2026 11:43:58 +0100
To: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/13] iio: core: validate file offset in
 iio_debugfs_write_reg()
Message-ID: <hr3phupisl7dc3sch64tjkpeb25z2lkxwsxumcviauvstu2b46@rba2dqhoezze>
References: <20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com>
 <20260517-ad9910-iio-driver-v5-1-31599c88314a@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517-ad9910-iio-driver-v5-1-31599c88314a@analog.com>

On 26/05/17 07:04PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `*ppos != 0` check introduces a functional regression for sequential writes, masking the true bug which is the inappropriate use of `simple_write_to_buffer()`.
> - [High] Unpatched uninitialized stack memory reads in other IIO drivers caused by the identical anti-pattern.
> --
> 
> commit 7c5ddbc34738b9e84e226b9906348d61e3569bf4
> Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> iio: core: validate file offset in iio_debugfs_write_reg()
> 
> This patch adds a check to ensure that the file offset is zero in
> iio_debugfs_write_reg() before calling simple_write_to_buffer(). This is
> intended to prevent leaving the start of the buffer uninitialized if a write
> occurs at a non-zero offset.
> 
> > diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> > index bd6f4f9f45330..e587aca79b8e7 100644
> > --- a/drivers/iio/industrialio-core.c
> > +++ b/drivers/iio/industrialio-core.c
> > @@ -419,7 +419,7 @@ static ssize_t iio_debugfs_write_reg(struct file *file,
> >  	char buf[80];
> >  	int ret;
> >  
> > -	if (count >= sizeof(buf))
> > +	if (count >= sizeof(buf) || *ppos != 0)
> 
> Does this cause a functional regression for sequential writes?
> 
> If a user writes multiple commands to the same open file descriptor, for
> example using (echo "cmd1"; echo "cmd2") > direct_reg_access, the first
> write advances the file position. This means *ppos will be non-zero on the
> second write, causing it to fail with -EINVAL.
> 
> Before simple_write_to_buffer() was introduced, the code used
> copy_from_user() and ignored *ppos, correctly treating every write() call
> as a distinct command starting at the beginning of the buffer.
> 
> Since simple_write_to_buffer() is designed for stateful linear memory buffers
> rather than stateless command endpoints using local stack arrays, would it be
> better to revert the use of simple_write_to_buffer() entirely and use
> copy_from_user() or strndup_user() to parse each write independently?
> 
> Additionally, does this leave a similar pattern unpatched in other IIO
> drivers?
> 
> While this patch addresses the issue in iio_debugfs_write_reg(), the same
> pattern of using simple_write_to_buffer() into a local stack array still
> exists in other locations:
> 
> 1. iio_backend_debugfs_write_reg() in drivers/iio/industrialio-backend.c
> 2. ad3552r_hs_write_data_source() in drivers/iio/dac/ad3552r-hs.c
> 
> Both functions use simple_write_to_buffer() into uninitialized local stack
> arrays without checking *ppos.
> 
> Furthermore, ad9467_chan_test_mode_write() in drivers/iio/adc/ad9467.c
> uses the same pattern. While the buffer is zero-initialized there,
> sequential writes will still be functionally broken.
> 
> >  		return -EINVAL;

This was me trying to fix an issue and maybe creating another.
Probably I would just drop this, and leave this to be handled later.
At least it was good to indicate that such issue exist.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com?part=1

-- 
Kind regards,

Rodrigo Alencar

