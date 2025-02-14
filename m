Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112211C84D9
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739576315; cv=none; b=X2ctiUJwOcUWRgqSMS+ixxcPH08O23Q41tZQLKTJwlZNJB+TcgrKYL8EhMIcQiQnZSK+e9xyOH/ktNlNZQQxYpEAjqLW9Pi/+eTUbppltoQo5Q/+k76jy8EuMjcquRGVr+CKFhP3oQeMRDL9R/7rFG1FYXgD4Jmpd8c0zcS7YCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739576315; c=relaxed/simple;
	bh=JClmUjjKXhQ28qiEEnHxauuR1p44iOsyuCLNXAQJLuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRJ9mbd1vYcEST3Ie658cFLybFdgNhAyk15/P0Gwud5oTt/6JTbElNncgTvx9n8Z/FBvgFofTnBWDsSqA5ZLh+ze2EnVFHPzfwJCpCq36vHAT8shEUInkdHVTIWCkCGAtQjfDnNzNgAHtOX0SRF06t2NitYtjm0rCETTqLVHdWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pFrb4o7F; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pFrb4o7F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hArMmSF3X2IQOmSFxXB7EEuPOrlcE0tFNLe2BJiR8Uw=; b=pFrb4o7FTl6XoGdGTqjh2baUii
	W7HB6/AsV6wL7GeHRluueWlDm6L+RsaqiGszBgs8yz7XNNUOMVqkx0tp+Gd2oPTxmRu391pdySy2X
	hqNN0Cei527XxbiURk4TliNAadYo5O/4qDq1Laue+FUEgOE4lPlNMcEwqqJo9i6KFQYl2nZwwzqGS
	vxB4H3uXLN61IF/lKeayX2zO9q91jIFc0v9cjSI7maZt2yLmWeFfzFGjVlYC/4RX//ZKtsDYcR9sw
	HxzNBzlBNL2XAyPMEXkCNLydSl1o0MwPIjSSCwjYGNGVTWcreGu0OMqlq+dZmctnOoxtpbnlmIEVN
	BdciHVOA==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tj5GF-002Ump-FI; Sat, 15 Feb 2025 00:38:25 +0100
Date: Fri, 14 Feb 2025 16:38:21 -0700
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] Documentation/gpu: Add acronyms for some firmware
 components
Message-ID: <4rkulwzkqzje6c6yky34fi6jobgpc7ehrktavpswndhfqpjvxt@ivpb2tg5bgbf>
References: <20250214230011.439163-1-siqueira@igalia.com>
 <CADnq5_P0BX1VT6F1Bo6Zip+9fsV98Y=XVQDpv-B3NeOKNnDX7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_P0BX1VT6F1Bo6Zip+9fsV98Y=XVQDpv-B3NeOKNnDX7w@mail.gmail.com>

On 02/14, Alex Deucher wrote:
> On Fri, Feb 14, 2025 at 6:00 PM Rodrigo Siqueira <siqueira@igalia.com> wrote:
> >
> > Users can check the file "/sys/kernel/debug/dri/0/amdgpu_firmware_info"
> > to get information on the firmware loaded in the system. This file has
> > multiple acronyms that are not documented in the glossary. This commit
> > introduces some missing acronyms to the AMD glossary documentation. The
> > meaning of each acronym in this commit was extracted from code
> > documentation available in the following files:
> >
> > - drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > - drivers/gpu/drm/amd/include/amd_shared.h
> >
> > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> > ---
> >  Documentation/gpu/amdgpu/amdgpu-glossary.rst | 21 ++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> > index 00a47ebb0b0f..3242db32b020 100644
> > --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> > +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> > @@ -12,6 +12,9 @@ we have a dedicated glossary for Display Core at
> >        The number of CUs that are active on the system.  The number of active
> >        CUs may be less than SE * SH * CU depending on the board configuration.
> >
> > +    CE
> > +      Constant Engine
> > +
> >      CP
> >        Command Processor
> >
> > @@ -80,6 +83,9 @@ we have a dedicated glossary for Display Core at
> >      KIQ
> >        Kernel Interface Queue
> >
> > +    ME
> > +      Micro Engine
> 
> This is part of Graphics so maybe something like:
> 
> ME
>     MicroEngine (Graphics)
> 
> > +
> >      MEC
> >        MicroEngine Compute
> >
> > @@ -92,6 +98,9 @@ we have a dedicated glossary for Display Core at
> >      MQD
> >        Memory Queue Descriptor
> >
> > +    PFP
> > +      Pre-Fetch Parser
> 
> This is also part of GFX.
> 
> PFP
> Pre-Fetch Parser (Graphics)
> 
> > +
> >      PPLib
> >        PowerPlay Library - PowerPlay is the power management component.
> >
> > @@ -110,14 +119,26 @@ we have a dedicated glossary for Display Core at
> >      SH
> >        SHader array
> >
> > +    SMC
> > +      System Management Controller
> > +
> >      SMU
> >        System Management Unit
> 
> These two are synonyms.
> 
> How about
> SMU / SMC
> System Management Unit / System Management Controller
> 
> Other than that, looks good.
>

Thanks a lot for all the suggestions; I'll make those changes for the
V2.

btw, from the amdgpu_firmware_info, I did not find the meaning of the
below acronyms, could you help me with that?

MC
SRL(C|G|S)
IMU
ASD
TOC

Thanks
Siqueira
 
> Alex
> 
> >
> >      SS
> >        Spread Spectrum
> >
> > +    TA
> > +      Trusted Application
> > +
> > +    UVD
> > +      Unified Video Decoder
> > +
> >      VCE
> >        Video Compression Engine
> >
> >      VCN
> >        Video Codec Next
> > +
> > +    VPE
> > +      Video Processing Engine
> > --
> > 2.48.1
> >
