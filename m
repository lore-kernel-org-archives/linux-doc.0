Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD6D3FCB3A;
	Wed, 10 Jun 2026 12:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095421; cv=none; b=JgzGxcQXJSp1O2tAWqrH+fNLPte1iXoNmlvPYjKvavtwKJyJ3Hb+y5TnI/lBRpl0JXcZrY3MX16zaVdE8RmdaAWZqApdAGpSV8zhgdL3I7M03D5GnhJL2fWmslXmYJzgiFi+mOEtrbs7AG00MZp4IeVJYkr9e244VAkw1L0tlZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095421; c=relaxed/simple;
	bh=kpajauAMier9YxqkV0PniCvx8btFDRzDQ7xNUMW78tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJRpkLfD98p5Z3WjIJsNC4glrI4zL/yxSvkVL6W3cWzYAuAoR855UGu4yiLEMQTlhSk+hX8kQ6vqIRslgzer6b/trGAJhn1CBhuLzB2fESUPvvdc7IewXz5QOitRCNLVXgzkanrmLLzPi0ix6jD41vChBYLlzzJdJ5TZ8DuE7vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JEmFMtRl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JEmFMtRl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D29725E3;
	Wed, 10 Jun 2026 05:43:33 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 274743FDE2;
	Wed, 10 Jun 2026 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781095418; bh=kpajauAMier9YxqkV0PniCvx8btFDRzDQ7xNUMW78tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEmFMtRlvmXravXCOwPnwIcd4Uqy8sqeBkogah9vEUWATOZBlkG2G+ZaF2a1Xsma/
	 eD4i+S1ghdIlEbri9qoFKCFpZiu3u41Z+EWBuptIkDfunELUV+UJyI+Rm12L1qsukp
	 tf7oSn9QkU3/pV4BRC1QzTqiQqEFmfCMhc2ZCdMg=
Date: Wed, 10 Jun 2026 13:43:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com, mrigendra.chaubey@gmail.com,
	suzuki.poulose@arm.com, chenl311@chinatelecom.cn,
	fengchengwen@huawei.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, arnd@arndb.de, gshan@redhat.com,
	jic23@kernel.org, dietmar.eggemann@arm.com, sudeep.holla@kernel.org,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <ailb9N9PqXZUg9vA@arm.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
 <20260610075202.3597031-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610075202.3597031-3-ruanjinjie@huawei.com>

On Wed, Jun 10, 2026 at 03:52:02PM +0800, Jinjie Ruan wrote:
> diff --git a/Documentation/arch/arm64/cpu-hotplug.rst b/Documentation/arch/arm64/cpu-hotplug.rst
> index 8fb438bf7781..7c3379b704aa 100644
> --- a/Documentation/arch/arm64/cpu-hotplug.rst
> +++ b/Documentation/arch/arm64/cpu-hotplug.rst
> @@ -47,11 +47,12 @@ ever have can be described at boot. There are no power-domain considerations
>  as such devices are emulated.
>  
>  CPU Hotplug on virtual systems is supported. It is distinct from physical
> -CPU Hotplug as all resources are described as ``present``, but CPUs may be
> -marked as disabled by firmware. Only the CPU's online/offline behaviour is
> -influenced by firmware. An example is where a virtual machine boots with a
> -single CPU, and additional CPUs are added once a cloud orchestrator deploys
> -the workload.
> +CPU Hotplug as all vCPU resources are statically described in the firmware
> +configuration tables (e.g. MADT), meaning their maximum possible count is
> +known at boot. However, vCPUs that are not enabled at boot are not marked
> +as ``present`` by the kernel until they are hotplugged. An example is where
> +a virtual machine boots with a single CPU, and additional CPUs are added
> +once a cloud orchestrator deploys the workload.
>  
>  For a virtual machine, the VMM (e.g. Qemu) plays the part of firmware.
>  
> @@ -60,16 +61,19 @@ brought online. Firmware can enforce its policy via PSCI's return codes. e.g.
>  ``DENIED``.
>  
>  The ACPI tables must describe all the resources of the virtual machine. CPUs
> -that firmware wishes to disable either from boot (or later) should not be
> -``enabled`` in the MADT GICC structures, but should have the ``online capable``
> -bit set, to indicate they can be enabled later. The boot CPU must be marked as
> -``enabled``.  The 'always on' GICR structure must be used to describe the
> -redistributors.
> +that are hot-pluggable must have the ``online capable`` bit set and the
> +``enabled`` bit cleared in the MADT GICC structures to indicate they can be
> +enabled later. The boot CPU must be marked as ``enabled`` with its
> +``online capable`` bit cleared. The 'always on' GICR structure must be used
> +to describe the redistributors.
>  
>  CPUs described as ``online capable`` but not ``enabled`` can be set to enabled
>  by the DSDT's Processor object's _STA method. On virtual systems the _STA method
> -must always report the CPU as ``present``. Changes to the firmware policy can
> -be notified to the OS via device-check or eject-request.
> +must always set the ``ACPI_STA_DEVICE_PRESENT`` bit, while toggling the
> +``ACPI_STA_DEVICE_ENABLED`` bit to reflect its plug status. The kernel will
> +then dynamically mark the vCPU as ``present`` within the OS when the
> +``ACPI_STA_DEVICE_ENABLED`` bit becomes set during hot-add. Changes to the
> +firmware policy can be notified to the OS via device-check or eject-request.

The doc update looks fine as well, thanks for clarifying. My reviewed-by
stands.

-- 
Catalin
