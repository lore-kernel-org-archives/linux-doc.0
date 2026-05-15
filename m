Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A84E3F6C3B
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 23:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778886356; cv=none; b=d+RY9yUIPrpJVvLs3mNpFAY1nwq7NtKqWXI0qWJ4uGLsR5nQ9L2Ghw3L33WxpC1KsBDV9srCrHd1t6PEOlvG0NBcondEG/2qA0g1qc+XXf2zK1N8lFQiBpfux/FXgsSoGf8zNwjYX1oHikEk3ddRNoGBQdEUd5T6l+ycudMTm3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778886356; c=relaxed/simple;
	bh=Efl9eGRUvRUSMKgeJbT5viBCvrEY9UH6Bmru0k/SItc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqo0jC0Qw4nGsfa7zO+ia/Ylgcc+jxD5ZQpNmQin+5O+hqhu/ObieWZ4LURM4pDL+Ob+qNlPJGGQvY1NXykmxisBb/6ns0/bq8+aWTsnEXWY4vsetdawpXLVIQopS6HB87nMTL3mET8lnUrnbFdBuSEJPLEvezyP1t95zvJ8zf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VjGrlCzq; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VjGrlCzq"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8b8e98fd885so5343336d6.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 16:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778886354; x=1779491154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D7nklUCScqv2NitQOcHmOlp1LpHmTXVfX8MzcU0yUSA=;
        b=VjGrlCzqH+mUAoPngtAUQe7YHCLoMhJG1fiIHQCxDz32VqGSoi3tCJsSFgtxVM188x
         B1I46C1Bx8QQzngPeK7/vA6iCd3CpAt8owSY3Qk2nCELXf16tY5ju7NULVy1Bs7iU46b
         28cIKMzc8eLyongezBRMR3VmA7o08PT5Z7liMeIlm/EM5roeQ11TGTFe8o8pwEKpBde2
         Fsx6ppNY5QSyuK/iYmvX45MZQEdYg6mnwLgbubPjDSn55db4gxyjHGOWFH4aH1iAqKvc
         eCuseZOZeg7y7OGNf1zOhuZ+/BsETUblnI4pCL/GGB+CYb73uPazR/wccxYK74Yh0spW
         gQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778886354; x=1779491154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7nklUCScqv2NitQOcHmOlp1LpHmTXVfX8MzcU0yUSA=;
        b=iPMFbjn/NsGU5d9oP5MBLBlul9koiiO29V07UsFAHGlOfaQeRMUTdvP9hnG/77vLDm
         rYtecNQZ3LTxH/KBwmWzZe8dwooC7qzDwSmRN/E+0OmLdvgMwTBL9Ufe3RrkRCFxmMpG
         nXRE3P0/bn5Dtzm0KOcWs+Kf2enqoNyCyVcFxuDrOtJK6HAdfAjTsRU4TvwUi0urXXes
         BYKM0M76AU0LaAhWwKmUqkKBHIlPFiLCbzhhCaOzPKFxWfBVLT4eSMvemB+mxN9hEguv
         pxf3Jx2m6MDEx9vnMsFgK32lIwIrunfc8CmdlXrbO4mKaeyefRG9Q49ZbVDGPhVT0OEl
         fFew==
X-Forwarded-Encrypted: i=1; AFNElJ+gbGtzS4dfoz30Tje0AMbod7EYiI2UBXXu4qRTuQ0R0ADdMVjQFkkLR/drcl85m50ve/xGu0X5auc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs/qfA6sdZ7mC34mhbZNOCU85gySuryJ3g9UpvvKykkvy9fjNI
	9rfM1Yy4RhlW5mIVzwWgE+9OY4g0+3L9gLOu9atY/10V2x+i5qgc/ReGJORNwVmL5bw=
X-Gm-Gg: Acq92OEaarV0ibO8MqNSWhPMSOqUH4FoU/vve/Xm+KUBt1vsnnz2gQn8iMKOa7qW6IB
	RsmHsqA3A0ydh/8CKQdolbTTcHqKAB1u7UcbOmDn4ZYDutKaz8sRIrVg/Am+w4RGmFlTTj4+kSR
	nt2c652elq0bo1If3TOEysKaVDHk359Mrfw8mFdy2TU+aFqyCmsGgc6G0zB8hKCNPOCVCS15+rH
	005dD298CnwwANduQRvkYBKnQGo+jnP4Lq7pMEjzRyf9Xp1zCyh9P9av2dD1DYLj3c7uFMcw2hc
	MFHCi9ZGyOqMP4rsld2nkw88OdWk3lHUK/DDNbiuVMEXcJTjUitZZdRdG7L3liMppz+Z0HXKRaT
	1EWJFqEN9v2B6PKg2JE1f2yJCi5w1JePpmF+tIMJUUTK/jJIaesOXLmgRFL+02fDABBNxXi8h8o
	enqMkGsZxbLh/SI5TWRUxFalGLTkQ2ACIkTV7k2K+e3iFjwoV2ZKXvdNczv7WY51+M5IuuazIlI
	jXQTA==
X-Received: by 2002:a05:6214:1c82:b0:8c2:b36d:4fc1 with SMTP id 6a1803df08f44-8ca0f66afc4mr87385476d6.14.1778886354080;
        Fri, 15 May 2026 16:05:54 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c374469sm64030376d6.49.2026.05.15.16.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 16:05:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wO1bN-00000008GrB-0jOE;
	Fri, 15 May 2026 20:05:53 -0300
Date: Fri, 15 May 2026 20:05:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Ross Philipson <ross.philipson@gmail.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-integrity@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
	kexec@lists.infradead.org, linux-efi@vger.kernel.org,
	iommu@lists.linux.dev, dpsmith@apertussolutions.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
	dave.hansen@linux.intel.com, ardb@kernel.org, mjg59@srcf.ucam.org,
	James.Bottomley@hansenpartnership.com, peterhuewe@gmx.de,
	luto@amacapital.net, nivedita@alum.mit.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net, corbet@lwn.net,
	ebiederm@xmission.com, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, kanth.ghatraju@oracle.com,
	daniel.kiper@oracle.com, andrew.cooper3@citrix.com,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v16 01/38] tpm: Initial step to reorganize TPM public
 headers
Message-ID: <20260515230553.GO7702@ziepe.ca>
References: <20260515211410.31440-1-ross.philipson@gmail.com>
 <20260515211410.31440-2-ross.philipson@gmail.com>
 <agemXwxVb9jvAbYM@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agemXwxVb9jvAbYM@kernel.org>

On Sat, May 16, 2026 at 02:03:59AM +0300, Jarkko Sakkinen wrote:

> LGTM
> 
> I'll hold on from actual tags up until there is some consensus with the
> patch set.

This patch set is huge, and I know there is alot of interest now in
DRTM.

Can we please split out and progress the TPM reorg mini-series at the
front?

Jason
