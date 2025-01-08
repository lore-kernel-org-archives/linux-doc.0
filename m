Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFA81F8AFE;
	Wed,  8 Jan 2025 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736335866; cv=none; b=mETGaCtQPd9+NSwVFhyVKj8nVrYmYuTSLkIYdkqhOBECW1wsQqlCsPWiZ+hFdoV+AXmXCWi9nOYBkIhNJSn0EFrJ+vsa/xDYi7K2EP87ibWVztN8kgIg5RDQ2GRsREbB4yFR1QVmcgBfiR9vg2WUAeEg5OF8spb9+/Ts2/dXCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736335866; c=relaxed/simple;
	bh=kJ1w61mgzotp9pgUOoPuXBUXjJOyw2Sk8zD0QxYonHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZJiOZfVT3vMoe/rQBc9pmBPwrDCyWkjHhuz3PFfZ6Ar/3bNUUPKi3X5rbhki8jLrrltszoJXvYl0oiQ3yJfZxL2kagNhQEJ99hVMkPRXUX0CVnSRBMn3OBz2kB+VdJpt+8zL91evZ/4FwGP8/1HOFLiIRStTOZS1rTP/HB5B+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=bpSbhme/; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="bpSbhme/"
Received: by lichtman.org (Postfix, from userid 1000)
	id BC9D31771C1; Wed,  8 Jan 2025 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1736335858; bh=kJ1w61mgzotp9pgUOoPuXBUXjJOyw2Sk8zD0QxYonHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bpSbhme/ldZPCk93ev3ly4eeEsfxKPsjTF8WH976oaDE881t/Ly30khSC+MfWcQP/
	 pNFaloM0ShZTaiTm1Ee7p3DI6OIdqx2CRGwK2hRUXoZwi+w0SW4QqDsaJ+x1qzQwj2
	 hgHstk0ijGNUWz+fctBev4Fzct5I812k7IJISkYZhjP9seSevicFJgpX7RxWVp95yO
	 tBQq4a7YmhWEG+N6EnIc0B0hDBE0YyTnaB/ZvCBr89aLEVOhdBhf+9CLiI9qZGKclX
	 xehmmsF/IqQG/+Yz3L4GbKwGWnr0n2cAFF7xpe9cJVHiZI4WTa55zxQ7rZEBMggrzL
	 mZw++C922FI8A==
Date: Wed, 8 Jan 2025 11:30:58 +0000
From: Nir Lichtman <nir@lichtman.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix x86_64 UEFI outdated references to
 elilo
Message-ID: <20250108113058.GA897619@lichtman.org>
References: <20250106223526.GA877278@lichtman.org>
 <Z33Y8FRqVvPycCgB@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z33Y8FRqVvPycCgB@archie.me>

On Wed, Jan 08, 2025 at 08:46:24AM +0700, Bagas Sanjaya wrote:
> On Mon, Jan 06, 2025 at 10:35:26PM +0000, Nir Lichtman wrote:
> > +Refer to <Documentation/admin-guide/efi-stub.rst> for general setup guidelines on usage of the EFI stub, the following are setup specifics for EFI in general on the x86_64 platform.
> 
> "... for how to use EFI stub. Below is general EFI setup on x86_64 platform,
> regardless of whether using EFI stub or separate bootloader."
> 

Thanks will fix

> > -- Create a VFAT partition on the disk
> > -- Copy the following to the VFAT partition:
> > +- Create a VFAT partition on the disk with the EFI System flag
> > +    You can do this with fdisk with the following commands:
> > +    1. g - initialize a GPT partition table
> > +    2. n - create a new partition
> > +    3. t - change the partition type to "EFI System" (number 1)
> > +    4. w - write and save the changes
> 
> I see running paragraph instead of numbered list in htmldocs output.

My bad thanks for checking, will shortly send a v2 with the fixes, thanks for the review!

Nir

> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara


