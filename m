Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54322392C2D;
	Tue,  3 Feb 2026 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113311; cv=none; b=mtAk60er/HEgvnMZB7m17ez0m/fc4nSG5Vkzq6mk4wvVWmtFpIYmMUsX5DutNzsWq3i8VcWkD2fAnk2ustv89RDHJyzLhLlzTb0QWdcW3A+zlTWzdIHayjdBd4eO/n21SeHgdrhEp7cnAeGOnjf052fkQrNoW6HJJLH+3KgZXIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113311; c=relaxed/simple;
	bh=xp9hTc2PImRZi1tongCx4gW7QVJ9IGe+51p0b2/+98o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TADZJXj2hdyBmg/Xwp5sw8pKCWrWu/Qdr81JHA7+ZT9kU37w6auRLZiBb9t3U5ToujYR2fyIYUEhU0cb22hS9nbz/szzXBDfNTSPwE4GPQWuzUNcsZZi5Jzw93kWeXKHeBa6KPmfJXdkgwjsPqBBYtJOwh772EGp/XUdRHkGCbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPRYuiqG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPRYuiqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CFFC116D0;
	Tue,  3 Feb 2026 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770113310;
	bh=xp9hTc2PImRZi1tongCx4gW7QVJ9IGe+51p0b2/+98o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kPRYuiqGtSr27s2DljdpBYr/ua2hfjyMJUMeQAWKRxhwHuCymYU3wow8YzIErt/T8
	 bEhghoC8rlJRiqr2D9+2keIwuK2/YMXnRyuilv/fr0eskkVAaSOhElyRxNFR7psokW
	 EkIhEMlFOWTGwh/5YhnyRbYUKCC7qm9eKJbNLFp0bCiDmt4gDu0NE3+lo1om7LSaSh
	 vCtG/EYVbZdwLVixIc3Fin799npKPGCHZ0kxnGnu/RTq52h9QVW8NCJr80lfgXcxnu
	 Alg75pbielnYoavpfb7ZMp7Tt+iFouC5L05J7sUH9BAAos6mXp5lIuT1ZJ8a9+AyFR
	 47cdHmhhOYLmg==
From: Thomas Gleixner <tglx@kernel.org>
To: Alexander Graf <graf@amazon.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Clemens
 Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
 <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 nh-open-source@amazon.com, Nicolas Saenz
 Julienne <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>,
 Filippo
 Sironi <sironi@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Jan
 =?utf-8?Q?Sch=C3=B6nherr?= <jschoenh@amazon.de>
Subject: Re: [PATCH 1/2] x86/ioapic: Add NMI delivery configuration helper
In-Reply-To: <20260202174803.66640-2-graf@amazon.com>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-2-graf@amazon.com>
Date: Tue, 03 Feb 2026 11:08:26 +0100
Message-ID: <87ldha3zs5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 02 2026 at 17:48, Alexander Graf wrote:
> To implement an HPET based NMI watchdog, the HPET code will need to
> reconfigure an IOAPIC pin to NMI mode. Add a function that allows driver
> code to configure an IOAPIC pin for NMI delivery mode.

A function which violates all layering of the interrupt hierarchy...

> +/**
> + * ioapic_set_nmi - Configure an IOAPIC pin for NMI delivery
> + * @gsi: Global System Interrupt number
> + * @broadcast: true to broadcast to all CPUs, false to send to CPU 0 only
> + *
> + * Configures the specified GSI for NMI delivery mode.
> + *
> + * Returns 0 on success, negative error code on failure.
> + */
> +int ioapic_set_nmi(u32 gsi, bool broadcast)
> +{
> +	struct IO_APIC_route_entry entry = { };
> +	int ioapic_idx, pin;
> +
> +	ioapic_idx = mp_find_ioapic(gsi);
> +	if (ioapic_idx < 0)
> +		return -ENODEV;
> +
> +	pin = mp_find_ioapic_pin(ioapic_idx, gsi);
> +	if (pin < 0)
> +		return -ENODEV;
> +
> +	entry.delivery_mode = APIC_DELIVERY_MODE_NMI;
> +	entry.destid_0_7 = broadcast ? 0xFF : boot_cpu_physical_apicid;
> +	entry.dest_mode_logical = 0;
> +	entry.masked = 0;
> +
> +	ioapic_write_entry(ioapic_idx, pin, entry);

Q: How is that supposed to work with interrupt remapping?
A: Not at all.

Thanks,

        tglx
