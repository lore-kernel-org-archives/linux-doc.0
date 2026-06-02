Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E33DD525;
	Tue,  2 Jun 2026 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404432; cv=none; b=Yf+l9YVBwAT3AaopKtr0fYvJCdihMYJaUUrStTXRbpW9Mm/ANtBEvjEV1HD/zpzmVwVFbTmOAPlaLoVKrUhxEQJ35HnAAbgCTdacAdCo/vt+x2585tAKufnKfNYa4JGRUkLFZ4xziCQ6OSC5sfmkgbauskVqb2GYd8P0Kps8TP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404432; c=relaxed/simple;
	bh=oYOzxheVhJ9EgbC/FGP6BeKGVBfUT7lKCVc6Ed1ATZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBjPGVkFifqCPTkRb8khovsN66FuTXklDiNvnbcs8CGDLeqfUdJQV8708GhWUiEjfUvf2MUe6xzCCCvp345Wb25a5aDim8gMriXX3CXDK5txi9X3hzwENA1EPpkkFon9mNlExO0ePYWReJ0uPhIlytCkgNTm+RVxjzKfdT8uyhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmADCqcm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmADCqcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A211F00893;
	Tue,  2 Jun 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780404431;
	bh=4TjPJ17gEtcnTt4IawZJaVkXbQlEiP6t8vVeLN4N89Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bmADCqcmlTljvi3P17MrJrPZo0FsPvj93FnANV3ryXgXPv9XIVOp0hYwh3MoUrbLD
	 uPwrfdoYk8yMwg6SCxxGQYPrW8JR1OrN48Pw2vOOJ6LrDJXzLZ6JyqVdZoveV3gilY
	 pqMlMlxVr0DnAnYpm5MEwr9S9r4yzjaVIJJzN/pm6yq+iyMc5JnePZbEE0oPDdgNBK
	 2KYaRwUe2rnRAasxp6uDW0F5YF6OqMgJymUZ/63HTKzAp/IZvuheJXqcQgPrAw5rbn
	 QL2SLtpR4thMxcjkUPoFiyJL2omK9SCN2MKmAyu6LbNRHI3bc/gwz9yKUYF/EZdfvs
	 WFj+L4XkkisFQ==
Date: Tue, 2 Jun 2026 13:47:03 +0100
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
Message-ID: <ah7Qx6UmfJzlph6F@willie-the-truck>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
 <ah65zXlOH6a9geD9@willie-the-truck>
 <37bc3f0c-adeb-41b8-9b26-fabe43f47e6a@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37bc3f0c-adeb-41b8-9b26-fabe43f47e6a@huawei.com>

On Tue, Jun 02, 2026 at 08:14:26PM +0800, Jinjie Ruan wrote:
> On 6/2/2026 7:09 PM, Will Deacon wrote:
> > Please can you check the Sashiko review comment?
> > 
> > https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
> 
> On arm64, arch_unregister_cpu() enforces a safety block against physical
> CPU hot-removal by aborting early if cpu_present() is true but the
> device is no longer physically present, thereby skipping
> unregister_cpu() and leaking the sysfs device node.
> If acpi_unmap_cpu() blindly clears the present bit while the sysfs
> device remains registered, a subsequent hot-add attempt will see the
> valid leaked device pointer, skip acpi_processor_hotadd_init() (and thus
> skip acpi_map_cpu()), leaving the hot-added CPU permanently absent and
> deadlocked.
> 
> Hi, Will,
> 
> what do you think about fix it like this?
> 
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -455,7 +455,6 @@ EXPORT_SYMBOL(acpi_map_cpu);
> 
>  int acpi_unmap_cpu(int cpu)
>  {
> -       set_cpu_present(cpu, false);
>         return 0;
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 5932e5b30b71..507c6d761434 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -554,6 +554,7 @@ void arch_unregister_cpu(int cpu)
>         }
> 
>         unregister_cpu(c);
> +       set_cpu_present(cpu, false);
>  }
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */

Hmm, not sure. Doesn't that break error handling cleanup paths that
expect acpi_unmap_cpu() to undo acpi_map_cpu()? See
acpi_processor_hotadd_init(), for example.

Will
