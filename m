Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97625761
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 04:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881042; cv=none; b=so2dENlCKgHZQW/JfitsloLkgpVEsF4J11juoft8RRdMacqq4YHqY933hP8DBVRjSQ5mkBP4sE4b1B2anM6pm5CSS8iMDekX5T972dfFawTdkttkn2FpaJCYHiRwC8Z0SbyPgWpklEn4pwNymwRCCzratb/qDJHEtfVmaUvuMOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881042; c=relaxed/simple;
	bh=Kj0U9MTC5AyxWQYTo+VsBcBXCC89clLXpFMQ9HWKWsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEGpkk669WnQPD8lXXtw4uFdX5ICaZUkkGDBUdcclDnIYlfP2/QeMdOA4e1ZomHONxQZ5nviE84l6evJI/nj018ND9eXbRF7LWTKvQUnttrqHXVkDHn5H0D7KmLls8MBMlh+JGJQGLzMyICcf621ojJ3CHzIFgCiq5wn4kAZCWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eoMYAL0/; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eoMYAL0/"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70d18112b60so372374b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 21:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881041; x=1722485841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+VMdQmHWFgj58kNWJtoryibFDwz3t5+vVkcIVzkHLE=;
        b=eoMYAL0/Xr4/cduuK9twqtlGo7/Et7XYVIFE69mshHwfheHhrAM63vcFtaIzLv0l9+
         E9mMHrtbLyHYEHQ7WI6kx5Neg+RkgVSp6vdV8OU86NaIGCCeTvDqkBR9akwLFtTM/n0J
         i2C/mOx2xgK6LdCVXoXeP+7yydy3G5MxeQg4TnnKUHAgKAL03Z8+bniA9+7cQ2GDS8vf
         4j0Qkezgnyx8LBO9NZtqyBkMVAM0SwBE6XrlILiTBsRDEd+gv0JnYW8/f+VlRAqCAOl0
         9f6XYHQH3TUnVJvQDFsGOzyHpiRhvw3XWnXCNqJo5aMG6YFjVdc2BGmthVO0sf+RFEdK
         hNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881041; x=1722485841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+VMdQmHWFgj58kNWJtoryibFDwz3t5+vVkcIVzkHLE=;
        b=ldBPMSmt5ZNoikc8WfSkQy5g0p+kap1g5B4mxB7EyxJ5kvDK+6hAu0prkJOvZJi9+8
         YVdkRvoa5YrpVnmKd9qr/Mx9EmXm4lpRcDRH28rW/xvFep80y8Q3NH4t95SjEbYSap7a
         n/g/SuGNr4qKBFq6GqKltiBuGt9+GO8oKP1Iews8ybajMIfOu9IqXQkaLlguz7i3ejAy
         eGOdlajUS+gJF6xuxC05MCfVoIbiy4wDdx0+5Cl4BR3h+P9I4w5rdBUzuJEHQ/mbim3l
         uhHbzAQoYuK/3GXLlva+TdUTKcfIL1rVxviPZT41NxIPSd8d2um1stZQi8RJIESdnTJB
         e5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEvQdGBwvrgE1uBNkggv+PzO6teK8zMUqr4+lNV7rmuOPeHuUVfAxYmiVxfPy/7uK8XTa3Ez3JVJGW1whnaXScGeC7UAu6ifaS
X-Gm-Message-State: AOJu0YwuAK4jLm0cvXtJNwKGmhkpYY3+UZKF9IO1CBKt7/nsuCwejjeh
	MqwIn8+gY7cj0f8pI0xqxBzrXnfUbf69nrpbBL7tSpnmmZLthgCjtMF0MaAxbA8=
X-Google-Smtp-Source: AGHT+IG8/lGGFfeqD0yKL6Ukrgul7u0XCxEnqHsWKKVCOGqLNIttHBNHSYlpgXB/YPJd1O/zSdOyZQ==
X-Received: by 2002:a05:6a00:66cd:b0:704:151d:dcce with SMTP id d2e1a72fcca58-70eaa1e2e1emr2589164b3a.5.1721881040621;
        Wed, 24 Jul 2024 21:17:20 -0700 (PDT)
Received: from ghost ([2601:647:6700:2d90:4e8c:b287:20dc:e447])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead874b35sm322537b3a.167.2024.07.24.21.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:17:20 -0700 (PDT)
Date: Wed, 24 Jul 2024 21:17:16 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	jszhang@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, samuel.holland@sifive.com, corbet@lwn.net,
	shuah@kernel.org, guoren@kernel.org, Evan Green <evan@rivosinc.com>,
	andy.chiu@sifive.com, jrtc27@jrtc27.com, ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 09/13] riscv: vector: Support xtheadvector save/restore
Message-ID: <ZqHRzAI0O+zsZd3A@ghost>
References: <20240724-xtheadvector-v7-9-b741910ada3e@rivosinc.com>
 <mhng-28424e23-c9b4-407e-97d8-9dbb09101781@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-28424e23-c9b4-407e-97d8-9dbb09101781@palmer-ri-x1c9>

On Wed, Jul 24, 2024 at 08:23:27PM -0700, Palmer Dabbelt wrote:
> On Wed, 24 Jul 2024 12:14:00 PDT (-0700), Charlie Jenkins wrote:
> > Use alternatives to add support for xtheadvector vector save/restore
> > routines.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> b4 isn't applying this, either on top of your last patch set or rc1 -- the
> base commit in the header isn't a hash I have, so I'm not sure where it's
> mean to apply to.
> 
> Also...
> 
> > ---
> >  arch/riscv/include/asm/csr.h           |   6 +
> >  arch/riscv/include/asm/switch_to.h     |   2 +-
> >  arch/riscv/include/asm/vector.h        | 225 +++++++++++++++++++++++++--------
> >  arch/riscv/kernel/cpufeature.c         |   5 +-
> >  arch/riscv/kernel/kernel_mode_vector.c |   8 +-
> >  arch/riscv/kernel/process.c            |   4 +-
> >  arch/riscv/kernel/signal.c             |   6 +-
> >  arch/riscv/kernel/vector.c             |  12 +-
> >  8 files changed, 198 insertions(+), 70 deletions(-)
> 
> [...]
> 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index bf25215bad24..cb48092fdc5d 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -845,10 +845,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> >  			riscv_isa_set_ext(ext, source_isa);
> >  		}
> > 
> > -<<<<<<< HEAD
> >  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
> > -=======
> > ->>>>>>> 0f260ac829ca (riscv: Extend cpufeature.c to detect vendor extensions)
> >  		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
> > 
> >  		of_node_put(cpu_node);
> 
> This chunk isn't applying, and it's got a conflict marker in there.  So I
> think that means something's gone off the rails?

I really messed that up... Okay I sent a new version that is based off
of your for-next that should work?

- Charlie

