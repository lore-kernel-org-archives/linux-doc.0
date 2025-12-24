Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F730C345;
	Wed, 24 Dec 2025 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766591617; cv=none; b=NXzIm49DAEpIyLr8bLhgdMmjgHZQRShuM+aEHWMofpC2Y3BQxekelNKDrNW1Q0IcTGoTKI2GmkgXuhDWPtI+1POlDoSESbabwZnlAnxu5pnDftY8ohe+P4stMcxDOe/iVhvYkg2rxZjhMuw4P68WP5R4iS5lHW+yfW+xyZVfLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766591617; c=relaxed/simple;
	bh=itw1VGsb8caeZEnMIi0mGYNuh+cuyTYEgjoEbrWFsa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqRh40R5Z4dZen3XSipccQa39DXqPKGHilr+gPhIXBiAkxtFrDS+YqGI++ChHbsNWDPWA7NZb325AG6b0sLxN9Rw9Otkr6KqQKPtGylF21HM3T92MCU1BtXDTxKyGlDIjNo4TU5PO3fjyjMAXtt0AD9a4kFR/HTMMPf5qVeKR8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=na8tgn2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="na8tgn2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2AAC4CEF7;
	Wed, 24 Dec 2025 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766591617;
	bh=itw1VGsb8caeZEnMIi0mGYNuh+cuyTYEgjoEbrWFsa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=na8tgn2Fx1vsIkYcIShFC2kkQs5palK2hGDXUPY3eM7gVuxBBrThBP2xZl+f1Mkns
	 h03B+oe1jaxFou7L4DW8/u88YXrF4YH6jZnW1ebWjq3V6cBdxJeWhyTHSAsnZV2dGj
	 IgxQ4vcfM4lrOzcEER2C3fkKnZlutWBSXrYF+rwg=
Date: Wed, 24 Dec 2025 16:53:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bagasdotme@gmail.com,
	catalin.marinas@arm.com, conor+dt@kernel.org, corbet@lwn.net,
	dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org, dev@kael-k.io, haren@linux.ibm.com,
	heiko@sntech.de, jose@osyx.tech, kever.yang@rock-chips.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, maddy@linux.ibm.com,
	mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org,
	palmer@dabbelt.com, pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH 2/5] virt: add Bao IPC shared memory driver
Message-ID: <2025122459-blimp-bobble-c772@gregkh>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-3-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251224135217.25350-3-joaopeixoto@osyx.tech>

On Wed, Dec 24, 2025 at 01:52:14PM +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> Add a new driver providing an interface for communication with guests
> hosted by the Bao hypervisor using shared-memory channels. The driver
> exposes read/write regions defined in device tree and notifies the
> hypervisor via an architecture-specific hypercall (SMC/HVC on ARM and
> SBI ecall on RISC-V).
> 
> The patch introduces:
>   - drivers/bao/ with the initial Bao IPC shared-memory implementation
>   - Kconfig entry enabling BAO_SHMEM
>   - Makefile integration for building the driver
>   - A character device interface supporting mmap(), read(), and write()
>   - Platform driver support using DT properties for channel layout
> 
> Each device instance maps its assigned shared-memory region, validates
> read/write channel configuration, and exposes a /dev/baoipc<N> node
> used by user space to exchange data with Bao guests.
> 
> Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
> ---
>  drivers/virt/Kconfig                 |   2 +
>  drivers/virt/Makefile                |   1 +
>  drivers/virt/bao/Kconfig             |   3 +
>  drivers/virt/bao/Makefile            |   3 +
>  drivers/virt/bao/ipcshmem/Kconfig    |   9 +
>  drivers/virt/bao/ipcshmem/Makefile   |   3 +
>  drivers/virt/bao/ipcshmem/ipcshmem.c | 539 +++++++++++++++++++++++++++

Why two subdirs deep for a single .c file?  Why not just put this in
drivers/virt/ instead?

thanks,

greg k-h
