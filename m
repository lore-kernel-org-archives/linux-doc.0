Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF35F37757D;
	Tue,  7 Jul 2026 22:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461738; cv=none; b=HYvGi0lKN1zRzRVmlzqY1pr0TUhWCb1EV6OBuU6xqnzNfH0K/cs66PnOSAQNthjRne0Zn3ZXQ2N3RwtpYFGlJ5Z8pSQCbzLV9aChaA05s2QyZhiL48wE6pRYGw0AeJzFZWBXMPmPLIGNWJgFSxtHkFCnXYn4KJH38v65jBmuY+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461738; c=relaxed/simple;
	bh=1LvvBPFn4k9IM8o+t/N/5UcCN+lrpHYb6Qt2Is08rMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7F2kpNS3EJH1Hp0RX0cVjwm///opwi9TUXTsbATmGL1zJU1TKXJvhDEOkAUD3aDM1epU8PH/2Z9XyjaNw+ZSiITQsHLaNhpCKfPIg41HYfGOPDJ+YAyYqvvFKGtw6KUZnGZZBqxwlJJowLeO3ljynm5cd/DiF0Fpt7F3P+KXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=A8ebpP9a; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="A8ebpP9a"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4AC7E40E0163;
	Tue,  7 Jul 2026 22:02:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LyTn1SsZ08-j; Tue,  7 Jul 2026 22:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783461723; bh=dXzsYmwTI1qK7hBcZ8flsb1ioGtiimGmOqhDF68sxBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8ebpP9a5tB1zT7Q04r48XntDySUHvXilo342zoVRez8CeM/A/JuXTRQ7G4wdi0qj
	 yaKJbxslgUHarrC9CsRSY7Q4Kopz8szrYPph1M9+9Rd3KwvLJZm3l2232AnoHSISHQ
	 g469Bmlaid3dwhXo6DMTmsZDfr29nqH8z53f4MgLp0rYkYPt2wo95/7gHqRr6CZLTF
	 a8FwLdf80y08gqh45tFf+XMOCxgagxjpAjEbXaWRCOxguiE2rDCJnvO/aWZjg1mN4m
	 rsERr9WM4YddKssfZo6nhX5+uvaElGy8aTY1QRCsmO53Cjqi6eUcaVW56pL/cQxtsd
	 oZxqwBB7uQWrOup5nYYYHuCI4UmKD3q38IcsQ/R1Wn7FBwm77FvLV7gJpqm9t61j1C
	 Rf1AsvKYgvFN9Wu7ixUxIFRkoQ+8F2g+jUQ/SzONGwuO5BI2hbmy/xDLFD2X76rYkp
	 wGbQ6gcnHzaWrnYpvTnOwGYJMQj3veR11m/mPsYTblYtb+92tYCUMKEEzhEUkSnva/
	 qerXrx5hQ4GJe1e9HdJ5chKZI0GtgiZ5n5MHohnCkvv+H6SprzIQKv58Ko3jBxl2cT
	 E8GqTNZQe4ErhobWmQSusFZQg7Ih7wz5XCXFfprTvQEXBHq/g4NIZUQZOBV8A3BOyk
	 kGcV5T626YYMs3n9JMbO60uk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 44F7E40E0140;
	Tue,  7 Jul 2026 22:01:20 +0000 (UTC)
Date: Tue, 7 Jul 2026 15:01:16 -0700
From: Borislav Petkov <bp@alien8.de>
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
	Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org,
	ben.horgan@arm.com, fenghuay@nvidia.com, skhan@linuxfoundation.org,
	x86@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
	hpa@zytor.com, akpm@linux-foundation.org, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, elver@google.com,
	enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
	lirongqing@baidu.com, seanjc@google.com, nikunj@amd.com,
	xin@zytor.com, pawan.kumar.gupta@linux.intel.com,
	tiala@microsoft.com, chang.seok.bae@intel.com,
	kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
	kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
	elena.reshetova@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
	eranian@google.com, peternewman@google.com,
	qinyuntan@linux.alibaba.com
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level
 Zero Association (PLZA)
Message-ID: <20260707220116.GFak13LChoDbSaCh1O@fat_crate.local>
References: <cover.1783461016.git.babu.moger@amd.com>
 <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com>

On Tue, Jul 07, 2026 at 04:50:02PM -0500, Babu Moger wrote:
> Customers have identified an issue while using the QoS resource control

Please drop the "customers" speak from kernel code.

> feature. If memory bandwidth associated with a CLOSID is aggressively
> throttled, and a task with that CLOSID moves into kernel mode, the kernel
> operations are also aggressively throttled. This can stall forward progress
> and eventually degrade overall system performance.
> 
> AMD hardware supports a feature Privilege Level Zero Association (PLZA),
> which allows the CPU's CLOSID association to be changed during the
> transition from user mode to kernel mode. This allows the kernel to run
> using a different CLOSID than user space, which can improve system
> performance in certain scenarios.
> 
> The feature is detected via CPUID_Fn80000020_EBX_x00 [Bit 9]:
> Privilege Level Zero Association (PLZA).
> 
> The PLZA feature details are documented in [1] available from [2].
> 
> [1] AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
>     Publication # 69193 Revision: 1.00, Issue Date: March 2026
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Split the patch into 2. This patch only handles x86 changes.
>     Re-wrote the changelog along the ABMC changes.
> 
> v3: Code did not change. Patch order changed.
>     Added documentation link.
> 
> v2: Rebased on top of the latest tip.
> ---
>  arch/x86/include/asm/cpufeatures.h | 1 +
>  arch/x86/kernel/cpu/scattered.c    | 1 +
>  2 files changed, 2 insertions(+)

With that addressed:

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
