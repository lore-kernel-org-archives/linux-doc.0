Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE87E563
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 19:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718135239; cv=none; b=TYmdQkiggzrKB9jOhoTv7PHzEle5I81QqnY0WcBPuG23ytKwHZIXUdPt3NHB1q9FJi76h+FWTwpCdc5ZchnXchYBWnOG7w0lT3zm0DV98pOMuCHZOIS/T2z4MmVpwktEcRRuT7ntip1DrMFykZiXI1r7oNnMHxMZUuuoaESPe1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718135239; c=relaxed/simple;
	bh=uCNDyWcELfp1Oid3wEh3hhNBU0sDdHXgnTWH4GJUymE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEGXTEKv5vp4h6gzVoJZAhIOBp2VtFapAvd3OEw9XcPNVIszj+fFpPROhIH2UM7elXScXg5RnZJI4HD7SkifYoOeBvhYa25sEkX4rbw7wQ9uziRyClx02PDwjmDJflo0HfdftRXkRqsD1MdlNsa6sEwo9tqaOPuYLFnHi0LanPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DRo8Ef67; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DRo8Ef67"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f6c7cdec83so49178425ad.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718135237; x=1718740037; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qCkTNdoWHedtO2Rublq66t6G2AvnXm+h/79qji0mlS4=;
        b=DRo8Ef67svKZEGKbnvuzDIRbVD4BlGvPJXJXPS5BwZWv+Zty14v9Xjejn4YfIsQksI
         5a2/OwUtOCkQFfz2RT9Uw8Q3u2iQ9to1OSG4ORCRBqut8/wwUu/Ws2tQg60kjt8N06f/
         kiIMdiAiwvDSLmd09Jmz8v4kGtqONNdWP7E20gFBmjXis8qWc4CdqWYM9YxgtUc+Yl3o
         4vDTNIzK/dDww9qKsCV//9o/vIS9N5tat53P80VAIIXYkMSoGv2GcdyOKPQpC4yzEBo3
         Wbd6llY8qscNJQbz9OwkjXYRchMWutAk6UN4wQ1UnvFCZ63a4zZsrzuq3UnnfV42kwSo
         tb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718135237; x=1718740037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCkTNdoWHedtO2Rublq66t6G2AvnXm+h/79qji0mlS4=;
        b=MBwWkxDTSzRPShcwwlqbwPfd7Yv+dVjbg81ZzFgZM22fnPPUyQdZ+Qub4N06V3WJZS
         nrJyfDahIQ8eJ7wLzX/ggEY6b1dJK3w98rw7fjWPtUXSJNcHTxTbWx8exh+jJ9e9lAEK
         KvvlIu7jLK7FMPncHUYLq2x0s2BDo4nTES1Edzc0S8rh2QhTiUEUPhJMaViKMs7Jyuds
         bfi6m7A17RQ75VvSAnxgUzgIqbc05n2V+/oW7t/wk3tfga+yaWtSfmJbjrYScErltduS
         ngXdF5e0j+qwi2ZdnCNq9lVLAewzybHixfs61slmz1+yopTUEREVWAC7KtE/UYO4WMJj
         dZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCUBkYtZxMlVHBnNe+P23clOeXRweU3sXt8PFLfswoZU3SJBveDg1HaIK7UQvJPtNXBF7H0zgqbryA93CMPVQxlofIC2i6zTykT6
X-Gm-Message-State: AOJu0YxcS0/rZD7CAQLTuQKU6JiLAhv+zaus7GIW3d0bCLnE4IEoNTop
	yoVCQBjbZQ1oML8R9UUsx5LxvzqtRdCpm5rCTMAYDI9Is8mYWpzSCTuUQWGdRyQ=
X-Google-Smtp-Source: AGHT+IF72CTY1GSL+psPQ685hIrEeRutg+9+b9kEwCoHappRKyYOV15sm3Zs49FEAcTiubbmLDM4gQ==
X-Received: by 2002:a17:903:244d:b0:1f7:eb9:947e with SMTP id d9443c01a7336-1f70eb99809mr71450745ad.63.1718135236937;
        Tue, 11 Jun 2024 12:47:16 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ff937456sm57302045ad.243.2024.06.11.12.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 12:47:16 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:47:13 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 11/13] riscv: hwprobe: Document thead vendor
 extensions and xtheadvector extension
Message-ID: <ZmipwVN/WBCQcJdY@ghost>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
 <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
 <CALs-Hsu2jFAfr7H9UfLd9VHEZvpfF7Q6Chxko3XbBZBCU94eSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALs-Hsu2jFAfr7H9UfLd9VHEZvpfF7Q6Chxko3XbBZBCU94eSw@mail.gmail.com>

On Tue, Jun 11, 2024 at 08:58:37AM -0700, Evan Green wrote:
> On Mon, Jun 10, 2024 at 3:57 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > Document support for thead vendor extensions using the key
> > RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
> > the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Evan Green <evan@rivosinc.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > index 204cd4433af5..9c0ef8c57228 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -214,3 +214,13 @@ The following keys are defined:
> >
> >  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
> >    represents the size of the Zicboz block in bytes.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
> 
> Our recent snafoo with CPUPERF_0 popped into my memory
> when reading this. Does this work properly with the WHICH_CPUS flag?
> Specifically, we need hwprobe_key_is_bitmask() to return true for this
> key since it's a bitmask.

Hmm yes I need to add that. Thank you.

- Charlie

