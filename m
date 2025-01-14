Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF6B673;
	Tue, 14 Jan 2025 06:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736834438; cv=none; b=gvepjp09NA2tka1t0+humo+kzzMWxZAWUk06lI4gQR5OpQsMvYZZ+aycEw8ZtK1nvMteFvv7OEtZ7k6BduSYSXMZB6uR32T3qDPb9sMhsMO1vggrtsR+sBxEpXha9x8h15YzdFMrDuAUxP7rriG9+wg56qRfmkQeMfMMnXhialU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736834438; c=relaxed/simple;
	bh=JKcWF1SvojtVo3Shbj5UARsavsR4YSyQUuZiaEab86s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evMAO4TOkEPAPpfFjgG1FUMzyHaY9AgnPMBbG4ciCsuVg6SkxpzHazRLOiKWlL40888a7sFSauruoBT5x1GpAp9J5uh/iwEmbWnPHqbs3emk35HUa91jk10HEM4nmbSgwrctt3gaTZbyw/lkLZeuLKSbke8irAbeup8iUgcDdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=sgXp8o6o; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="sgXp8o6o"
Received: by lichtman.org (Postfix, from userid 1000)
	id C7CF81770E1; Tue, 14 Jan 2025 06:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1736834429; bh=JKcWF1SvojtVo3Shbj5UARsavsR4YSyQUuZiaEab86s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgXp8o6omhkwsMFjM7HXA97XvZvM5UngS7wRXQeCbWKXx+zzjepQaEzzHEHhVR5A0
	 NseDGGs2gAABsDoOjGMgxtyDvgrI31VH807ReLsZMOeFVqZtLD+DQOseZ74Q8osYJR
	 +tx3Te7nkLUU+O80z3hBJVDP28mNEcnrSu9HtLRLgtBUPvZNmqKlgKWrhxfubTctgP
	 O92dHWqVKDM7f/F1c/N+j1dBXrI0sxfCp5wST0AnNG5Ly/qBjsybjRnEWUHGk3kSDW
	 TVFmr1aGOoV4R40o1rmsbhGS/bWwPql6nVurNngPosTLbWi4r3Gu1r9JFq8Frt2Ifn
	 2JilstdQnqUGA==
Date: Tue, 14 Jan 2025 06:00:29 +0000
From: Nir Lichtman <nir@lichtman.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com
Subject: Re: [PATCH v2] Documentation: Fix x86_64 UEFI outdated references to
 elilo
Message-ID: <20250114060029.GA966321@lichtman.org>
References: <20250108113522.GA897677@lichtman.org>
 <Z4Tj5NyguaU8xoKV@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4Tj5NyguaU8xoKV@archie.me>

On Mon, Jan 13, 2025 at 04:59:00PM +0700, Bagas Sanjaya wrote:
> On Wed, Jan 08, 2025 at 11:35:22AM +0000, Nir Lichtman wrote:
> > diff --git a/Documentation/arch/x86/x86_64/uefi.rst b/Documentation/arch/x86/x86_64/uefi.rst
> > index fbc30c9a071d..3949d83a9915 100644
> > --- a/Documentation/arch/x86/x86_64/uefi.rst
> > +++ b/Documentation/arch/x86/x86_64/uefi.rst
> > @@ -12,14 +12,19 @@ with EFI firmware and specifications are listed below.
> >  
> >  1. UEFI specification:  http://www.uefi.org
> >  
> > -2. Booting Linux kernel on UEFI x86_64 platform requires bootloader
> > -   support. Elilo with x86_64 support can be used.
> > +2. Booting Linux kernel on UEFI x86_64 platform can either be
> > +   done using the <Documentation/admin-guide/efi-stub.rst> or using a separate bootloader.
> >  
> >  3. x86_64 platform with EFI/UEFI firmware.
> >  
[..]
> >  - If some or all EFI runtime services don't work, you can try following
> >    kernel command line parameters to turn off some or all EFI runtime
> >    services.
> 
> Looks good, thanks!
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks for the review! Small question:
I noticed that there is also a script in the kernel (genimage) which enables
automation of building the image, including an image utilizing the EFI stub.
The EFI stub image can be built by enabling the relavent EFI stub config options
and then running "make hdimage", thing is that I couldn't get the script the to
work yet (stuck on an error about missing EDK2/OMVF), but I could look deeper into
this method as well and add it also to this doc, do you think it is also relavent?

Thanks,
Nir
