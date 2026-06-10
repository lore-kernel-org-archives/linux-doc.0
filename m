Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB23A782B;
	Wed, 10 Jun 2026 11:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091512; cv=none; b=QiHFcxXzJzt1pjZtm9oq/+Az2ejVUQl6HQD0rGBYtQNsMPWVvO36lwYUvzKRKQr1mM1IKytgSyOSmQhKt0wSS+Ulu+SewkFs5JmD4dM17Mq6zTP/p885gBXicDrum5OSTe/xBNMzBTwCqmx4iy398ZnnnIDCTJzZ/akW8RYbBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091512; c=relaxed/simple;
	bh=IX6LtUMmsf2vlnGeHD/63983rh0Y9HBJ2QJ31uk5kmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eu61PtznKTrS1Xz0D6I4J10R2KQaXKoK9okHT1puRZ9Ij5TuhMYPDZEy7txz7tdOwpWxT8FrL53MfxG8R1nBcSuxcOnnXG6Rvk/pWp4C4HdrM1KeQzi97l9KWOJKal2/ZJyk6Vjxz0RgJ9pVvQFjpIXdy9AHjcwUHXBJAJDnFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VXTfeNQq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VXTfeNQq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7480125E3;
	Wed, 10 Jun 2026 04:38:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0923FD88;
	Wed, 10 Jun 2026 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781091510; bh=IX6LtUMmsf2vlnGeHD/63983rh0Y9HBJ2QJ31uk5kmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXTfeNQqSRNFjUTSHZpgYIIQlFGsLLyXII67TjUaJHzh4VW0XA+pPOcbymtdDCuac
	 1emh1qFB4U3M7OLirkhEwwYRU44hhKygV7pU4bGjbJ741RO//JZBdAV7ktUlxQU8rL
	 4jjw9yOmmm9i/AHV5QjmSCCz8pUbsZJIN28z2B/M=
Date: Wed, 10 Jun 2026 12:38:20 +0100
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
Subject: Re: [PATCH v4 1/2] arm64: smp: Fix hot-unplug tearing by forcing
 unregistration
Message-ID: <ailMrGQv1LQ0xmXe@arm.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
 <20260610075202.3597031-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610075202.3597031-2-ruanjinjie@huawei.com>

On Wed, Jun 10, 2026 at 03:52:01PM +0800, Jinjie Ruan wrote:
> Sashiko review pointed out the following issue[1].
> 
> Commit eba4675008a6 ("arm64: arch_register_cpu() variant to check if
> an ACPI handle is now available.") introduced architectural safety
> blocks inside arch_unregister_cpu(). If a hot-unplug operation is
> determined to be a physical hardware removal (where _STA evaluates to
> !ACPI_STA_DEVICE_PRESENT), or if firmware evaluation fails, it aborts
> the unregistration transaction early to protect unreadied arm64
> infrastructure.
> 
> However, returning early from arch_unregister_cpu() causes a catastrophic
> state tearing because the generic ACPI layer (acpi_processor_post_eject())
> unconditionally continues its cleanup flow. This leaves the stale sysfs
> device leaked in the memory, deadlocking any subsequent hot-add attempts
> on the same CPU.
> 
> Fix it by simplifying arch_unregister_cpu() to always proceed with
> the unregistration, as a pr_err_once() warning is sufficient to make
> it more visible for currently not supported physical CPU removal.
> Also remove the redundant NULL check on acpi_handle as it cannot be
> NULL when calling arch_unregister_cpu().
> 
> [1]: https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: James Morse <james.morse@arm.com>
> Cc: stable@vger.kernel.org
> Fixes: eba4675008a6e ("arm64: arch_register_cpu() variant to check if an ACPI handle is now available.")
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
