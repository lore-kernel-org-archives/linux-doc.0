Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4DA370D70;
	Tue,  2 Jun 2026 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398549; cv=none; b=j7v1pcu+cddHSQSIxbKx/Bf0yB3E7IZ05XhIwCxalgtNEY20tHviCELqXZzauZPZYdIl72hFtGqYE/JSPiq9cjkakdfztWTxRxE7123qXYmCZpoOyov36Z9svH5zehtnzSkpXjMf2h1mLzZkqM6QcpyNCBtxdtTEnGeyJkP+ykA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398549; c=relaxed/simple;
	bh=3uU/jZDhI0KL69RAGfJZn17Oxt1PVreSngERNwq58XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZW9gTINdTbWJ2x0qY9PITe20FApnbQuAwpeupcoTrxFiTNtxxo+BSoF+wW0ZjB31ItNqeN4J4iTQ8H7WV1K0NpNQgdCNlM9qoMbT3kSlmaMKf4vrwpyppQdK0orYfhlQe3zbAmd5HmlgTyWY4jqWz2MFViBlqTNxGbK5YpLZtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d93wfmpG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d93wfmpG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6500F1F00893;
	Tue,  2 Jun 2026 11:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780398548;
	bh=0f3zx5C/sVnQ2w/FOxbtuszEnPOgGK2c9YD7zpg3Vck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d93wfmpGFItoK4y4E1K0EN7pxhe9fUIcYCLDyTFrOsva+C9amXA0LqBIzM7olJQDs
	 vAjfLTR0AaQ3sVqls11K6QSoJTRL8Re+QKWvdVQWZtFyvBZ3IMSvZg3QQqc70eb3wt
	 690dzSX5UtUGQZN3gOV8CGs/cDgLWQQh5XO0dz0JmJZxML6juJmO8Xk6srPF/vhSE3
	 SaSRPSXSTKxvTBRqVy+opTc5wCGQj9pfFXlJe903qI6G1sJSce8qSgtTR1hsRsXDPE
	 5yyHOfUGmARNUmj6QsuIpBipluEkdcX+681Ig121xjJHtU4UOdrlmFAd8V0AkfWLvU
	 bi8d0aVdwEEWg==
Date: Tue, 2 Jun 2026 12:09:01 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, corbet@lwn.net, skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com, jic23@kernel.org,
	osama.abdelkader@gmail.com, chenl311@chinatelecom.cn,
	fengchengwen@huawei.com, suzuki.poulose@arm.com, maz@kernel.org,
	lpieralisi@kernel.org, timothy.hayes@arm.com,
	sascha.bischoff@arm.com, arnd@arndb.de, mrigendra.chaubey@gmail.com,
	pierre.gondois@arm.com, dietmar.eggemann@arm.com,
	yangyicong@hisilicon.com, sudeep.holla@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <ah65zXlOH6a9geD9@willie-the-truck>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520022023.126670-1-ruanjinjie@huawei.com>

On Wed, May 20, 2026 at 10:20:23AM +0800, Jinjie Ruan wrote:
> On arm64, when booting with `maxcpus` greater than the number of present
> CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
> but have not yet been registered via register_cpu(). Consequently,
> the per-cpu device objects for these CPUs are not yet initialized.
> 
> In cpuhp_smt_enable(), the code iterates over all present CPUs. Calling
> _cpu_up() for these unregistered CPUs eventually leads to
> sysfs_create_group() being called with a NULL kobject (or a kobject
> without a directory), triggering the following warning in
> fs/sysfs/group.c:
> 
> 	if (WARN_ON(!kobj || (!update && !kobj->sd)))
> 		return -EINVAL;
> 
> When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
> enumerated CPUs as "present" regardless of their status in the MADT. This
> causes issues with SMT hotplug control. For instance, with QEMU's
> "-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
> follows: the first four CPUs are marked Enabled while the remaining four
> are marked Online Capable to support potential hot-plugging.
> 
> Fix this by:
> 
> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
>    entry before calling set_cpu_present() during SMP initialization.
> 
> 2. Properly managing the present mask in acpi_map_cpu() and
>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
>    other architectures like x86 and LoongArch.
> 
> 3. Update the arm64 CPU hotplug documentation to no longer state that all
>    online-capable vCPUs are marked as present by the kernel at boot time.
> 
> This ensures that only physically available or explicitly enabled CPUs
> are in the present mask, keeping the SMT control logic consistent with
> the actual hardware state.

Please can you check the Sashiko review comment?

https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com

Cheers,

Will
