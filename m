Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E431F81AE
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788917; cv=none; b=vDyi2BiIPNPKZoRgECAQD2c9RvEXeeR4wiC/eoK6cKTGYVpvwZ7NQBpH/ylDcIKUMIS34fAXij3fLc9i+a0l+GWsTT/dOo5KKQjWOaove/Kh7bjpRaYjI0HYujWB0mgraBLKSooeZpbibXJGAxrLM6+a6TiwYmsKTeLAiDwM/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788917; c=relaxed/simple;
	bh=GO+CYso/bTOf2xGs1upCw8Mp19VtJPjOhr62lrxsNG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+WzTtAeG+RkO8h4dTwuCQYPIdrwY9Ve98qwDtWc4Q0GwC2A23rg2biwfad5OjlUL8jOa6yZnqlGv4TSDjJxGQ/MdqO+KIe3ziYKO0SoxlvWnldkKhYKsmX88043oOiGorWKyoLF2H/q+I7LbvYjjCAXt63GVbVGOZ7Kcgj6PyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mcihC874; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mcihC874"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43150ea2db6so7745e9.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729788912; x=1730393712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCdtKyQctIBSL1se9ZBXozl/8Gw/YsUba47AyHThe0Y=;
        b=mcihC874xHNrlWyFkXlnppm9CT7ZXhu1whGEKYELuJNVTJB612P9NAIaNu5f03knYF
         So//NBHpqy7I1yQCik5Y+2aCzMJbFJs5xQVruU9XA1LwKg9IS6tF3bjy6sPvwSsjBdR4
         2C86PJoIek8chu60kDGXejU3C+Z99OGXC/s11XF+eURjxho6pZVSaXa4czDWFvG5wCri
         PMNV1NfJKaFKDoExwOP9ec2KpxOGALXE+L3A0T8JC51xVw0+mHjq/3qtxZm7q1TLW58o
         ku2tQWCP5D63GhUtKetPYeegS9WIWLVGeE30q/VOpExglSKzMPs0dJdfEhzBHvtzoKws
         rbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788912; x=1730393712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCdtKyQctIBSL1se9ZBXozl/8Gw/YsUba47AyHThe0Y=;
        b=BVitlaiGiHpzyId4Z4spf+ICnLtzi8sFMTqqn/37Y1++ml5s77KhHnnraxr2+pyLHt
         cvibt3mx0xt1SSkuZHVlAGa+TmivsAC2BwfxpENhphP8vmAmVhw2iNCUln/Yum4dyyvG
         ynVXIoq0TaAJTg0CskGqT01hQz2h5NWXbnYy3xryDY0Us1HkX6tM3CMKjM10QLMT2N1H
         K6Gx1hTwal/Syfc3gVnaWRe0UzeblFYmqygiMGuniVJR4dVBDoTN0L3tEbQoQZRuF6mW
         jCA0NEFbuV6vPYVgPs2tsrBuYD+O7HwlQBoi9pQD2h4hGWqs7kr1pjLyBOHeiDTQ0JzY
         jTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCAnN7atClT9EWwk1HTwmctutTOSju8iNmDvfOe1lpRsRa/pTgFGxZPPnawVuLY4Ygc15WzZMJ9W4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2nrC3gy2m+1HTHeBkShevviflt+n1HmYUJ2LigMPIMK1kXkIL
	KrHtd8OEZ5xV9yVk9rzWgsdLS6jU2VPuIaKknqk/NsFCvOQF0GcBkhOcWGuWtw==
X-Google-Smtp-Source: AGHT+IHcN7HDbw2An/mqTEn7MtXy6cHrcCtVnXaHLCdh4ENrobYlDmJPj++dv/iSVSPdnUCb+iLsTg==
X-Received: by 2002:a05:600c:1d82:b0:42b:a8fc:3937 with SMTP id 5b1f17b1804b1-4318a56d62dmr5544205e9.4.1729788912295;
        Thu, 24 Oct 2024 09:55:12 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd69e0sm52243065e9.3.2024.10.24.09.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 09:55:11 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:55:08 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, corbet@lwn.net,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] Documentation: Update the behaviour of "kvm-arm.mode"
Message-ID: <Zxp77Es8BCnHcAHk@google.com>
References: <20241024160614.1894599-1-smostafa@google.com>
 <86o73930ze.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86o73930ze.wl-maz@kernel.org>

On Thu, Oct 24, 2024 at 05:43:49PM +0100, Marc Zyngier wrote:
> Hi Mostafa,
> 
> On Thu, 24 Oct 2024 17:06:14 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
> > VHE support") modified the behaviour of "kvm-arm.mode=protected" without
> > the updating the kernel parameters doc.
> > 
> > Update it to match the current implementation.
> > 
> > Also, update required architecture version for nested virtualization as
> > suggested by Marc.
> > 
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > 
> > ---
> > v2: Update nested value also
> 
> Thanks for that. However...
> 
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 1518343bbe22..d5b771e5cb5b 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2740,12 +2740,16 @@
> >  			nvhe: Standard nVHE-based mode, without support for
> >  			      protected guests.
> >  
> > -			protected: nVHE-based mode with support for guests whose
> > +			protected: hVHE-based mode with support for guests whose
> >  				   state is kept private from the host.
> > +				   In case hVHE is not supported in hardware, it will
> > +				   boot with protected nVHE.
> > +				   nVHE protected mode can still be forced on VHE systems
> > +				   using "kvm_arm.mode=protected arm64_sw.hvhe=0 id_aa64mmfr1.vh=0"
> 
> 
> I probably didn't explain myself very well. I would like to avoid
> mentioning hVHE at all, because this is pretty confusing (and really
> an implementation detail). Instead, we can talk about VHE/nVHE, which
> are real architectural features.

Agh, my bad, it makes more sense to talk in terms or architecture.

> 
> Also, I just realised that we can use your command-line magic for
> downgrading from VHE to nVHE in all cases, so I'd be suggesting
> something like this:
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1518343bbe223..2bb19f1331fed 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2740,8 +2740,9 @@
>  			nvhe: Standard nVHE-based mode, without support for
>  			      protected guests.
>  
> -			protected: nVHE-based mode with support for guests whose
> -				   state is kept private from the host.
> +			protected: Mode with support for guests whose state is
> +				   kept private from the host, using VHE or
> +				   nVHE depending on HW support.
>  
>  			nested: VHE-based mode with support for nested
>  				virtualization. Requires at least ARMv8.3
> @@ -2749,8 +2750,11 @@
>  
>  			Defaults to VHE/nVHE based on hardware support. Setting
>  			mode to "protected" will disable kexec and hibernation
> -			for the host. "nested" is experimental and should be
> -			used with extreme caution.
> +			for the host. To force nVHE on VHE hardware, add
> +			"arm64_sw.hvhe=0 id_aa64mmfr1.vh=0" to the
> +			command-line.
> +			"nested" is experimental and should be used with
> +			extreme caution.
>  
>  	kvm-arm.vgic_v3_group0_trap=
>  			[KVM,ARM,EARLY] Trap guest accesses to GICv3 group-0
> 
> 
> >
> >  			nested: VHE-based mode with support for nested
> > -				virtualization. Requires at least ARMv8.3
> > -				hardware.
> > +				virtualization. Requires at least ARMv8.4
> > +				hardware (with FEAT_NV2).
> 
> That part looks good!
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks,
Mostafa
