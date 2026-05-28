Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2975E389107
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964485; cv=none; b=Qu2YvFLeUPREJgrU6tnqAqufFJStLMMlAcHixINbncvw2H7s9Ncr43i1wOpd6DQx/l1oIaU/Lv3Y/mtOWbFrMyUbBTo/R1FHEMIHaNyp4u31N2WDpv0Kxawd40ypC/cPGl+O/JiuO7DA7RML60YYIzRGpcA9eposFio0IBoElK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964485; c=relaxed/simple;
	bh=yMbi+VRYca9N5DT77Dw/uUDcNTNea99an/AfQRCFPxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfQ5BcZFE9Ks42Wv9mEjYW9HFPmqmESdDokEenxs/aP5QTAiAsWc8uFa/eKbjNU4VOW2JwAe9xZN7Val3tBw/JjQlaZQQXHNiHR6GDVI0PZ6ZRKTKYtHjnITgL04DbMenW/bAUqEfmnvbKYR7sjrcHErEIBVEKiZd1t2PdXmd70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+gfSx09; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+gfSx09"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490686877a1so29949675e9.0
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779964479; x=1780569279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0/0ik1ZG6djP8m8FtNdW64oEnroAPrLw40z7zkPx5Q=;
        b=h+gfSx098/da1IKgL8vLZfiqtaL1HYYixlbbj+btv5pWfF5DCn0mj7h8p7iLVYN0/2
         Z8KGbnwZQH3EeUWEqePNeY2kKtlb2mzE8M6KtFCTcFurYYI+T/QMSY+202jcBX0xMI+S
         TAzDkc2IfFS6Bsg776sMXLPC7QpySherzkehbX+7nGi5IjOBrQtDaP2cGJRooqlnx/tC
         N7D8PZLPPLq8v8OCHyBH5tf0xuGtO4NdkV4Q26IIUDWXn+VgnsPhmzQUQ3r4r07U/fkC
         228cqKzRJKxcEr2ZTNv/W403pg1rv6vxrd2OvqgOut5GuKzj8cit/cvXTd2f3toSGXqm
         R2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964479; x=1780569279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0/0ik1ZG6djP8m8FtNdW64oEnroAPrLw40z7zkPx5Q=;
        b=W9GWYJLPnLpHqRVMEH7aIVEao4O2mn6C+mOhVGP8E2iyGMW4ho+4tKqsAOwHh1lm5C
         F2K/y3Hgz6dy5yd+bOkJ3ztEEhNKx2vjHcwmjM20JxPPYnY+I3TlinWswN2kjkBbmpHP
         Zek9EixTQUNLZd8yTqZqLLx6PEIwtAPmPAZ+suJpD1rRokoiHGOhHbK80UnhHO+50rNW
         9mfJqATvKjKxf3bvDuWeh7r2uhlX5WTtnp2iX6f3lGOsL5ExK+BvQlfycmFUl6O25K5f
         0XrwftR38CWYSHTDaexZ2VZa9yuZrJ/dfo5Gl66DqOiuVSQt5VolcG3WmICwjr3oKEHN
         EwRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AePK/HK8TkKELPbOrUbw9UlSesmHtFcalxHWGDkbZXGs5gx+HUzuiAaMkoEi54pzeRwzpQWZkSBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM0W4j1LAKuDOgCLBMQxH/H7GGpQ8gI3Zd0zGFTFfrgeDl9QRV
	0kJ30wo8DqZCf94QgzhK1p5kUQX05fygsUcxWFg74OdN3QhApNmbK2S/
X-Gm-Gg: Acq92OGOhwFxWIoGs7WUkyvBIAGsytP3ywY7508V1BNd2UOFJj/M7E+U3Eh2RcpOt5+
	BV5sNOMSI1Il+hbrTOGPN/YgHstZX0Y8zZUJkhKKziGLLSAMrqW5ZCPXe60dqWzsqi6PajYHahr
	rWfhIwG18tLR1P/a3YNNIt2zNAIjneGIEIdnRCXt3bQDTImdBvkRyjiKXylkgSwZqzhPHi2OqZP
	0n/YlCk7z7yB+mWj2JtclU+HH0ALaylPRXj/9DG4sP7c7f+47EtIA9pGZoxxwybkXscdKPTIbjB
	8yxTs0jGpVq9OfZYDxWbazeFXoP9DlrBgdWcaOe4nbSIR4OJOrD9GtxCYDdjkI8WDfhtPUdHIYm
	MBGYVzJ70+b5/EKhHX/WEsci2igtksrImO3012Jw5ZgGxkNDl9Yxhqdzi2REAyygtWRCtrmqqTQ
	gcOkuGnmK2b1NKL636MwZDUPVXMWxS4BEKaw==
X-Received: by 2002:a7b:cc0f:0:b0:490:3838:1548 with SMTP id 5b1f17b1804b1-490947afaf2mr10706165e9.13.1779964479411;
        Thu, 28 May 2026 03:34:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c44e4sm12324368f8f.36.2026.05.28.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:34:38 -0700 (PDT)
Date: Thu, 28 May 2026 13:34:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefano Zacchiroli <zack@upsilon.cc>,
	Steven Rostedt <rostedt@goodmis.org>,
	Laura Abbott <labbott@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Wenwen Wang <wenwen@cs.uga.edu>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org, Dawei Feng <dawei.feng@seu.edu.cn>
Subject: Re: [PATCH v3] Documentation/process: Add Researcher Guidelines
Message-ID: <ahgaOigklcDCYvRp@stanley.mountain>
References: <20220304181418.1692016-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304181418.1692016-1-keescook@chromium.org>

On Fri, Mar 04, 2022 at 10:14:18AM -0800, Kees Cook wrote:
> +For example::
> +
> +  From: Author <author@email>
> +  Subject: [PATCH] drivers/foo_bar: Add missing kfree()
> +
> +  The error path in foo_bar driver does not correctly free the allocated
> +  struct foo_bar_info. This can happen if the attached foo_bar device
> +  rejects the initialization packets sent during foo_bar_probe(). This
> +  would result in a 64 byte slab memory leak once per device attach,
> +  wasting memory resources over time.
> +
> +  This flaw was found using an experimental static analysis tool we are
> +  developing, LeakMagic[1], which reported the following warning when
> +  analyzing the v5.15 kernel release:
> +
> +   path/to/foo_bar.c:187: missing kfree() call?
> +
> +  Add the missing kfree() to the error path. No other references to
> +  this memory exist outside the probe function, so this is the only
> +  place it can be freed.
> +
> +  x86_64 and arm64 defconfig builds with CONFIG_FOO_BAR=y using GCC
> +  11.2 show no new warnings, and LeakMagic no longer warns about this
> +  code path. As we don't have a FooBar device to test with, no runtime
> +  testing was able to be performed.

People have started sending commit messages in this exact template and
normally I would ask them resend with the meta commentary from this
paragraph below the --- cut off line.

Do we really want this "Compile tested only" stuff in the permanent git
log?

regards,
dan carpenter

> +
> +  [1] https://url/to/leakmagic/details
> +
> +  Reported-by: Researcher <researcher@email>
> +  Fixes: aaaabbbbccccdddd ("Introduce support for FooBar")
> +  Signed-off-by: Author <author@email>
> +  Reviewed-by: Reviewer <reviewer@email>
> +

