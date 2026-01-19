Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03062D839B;
	Mon, 19 Jan 2026 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818128; cv=none; b=ZJiHbEDBTUR8gq8QFaxRW/R6S3u7uCzgZ9cI87n0KEUdPYmHUTLtNfDCfArrbZ6WpO7b1nfrz8Y8dQtHGpaGCtceve7vYewAY7ZsWzekz7ny7RSymNGc4a4XfV2JPj3fJzFBMdjSU1t6wmZgi9B3PccSP+aI62ocMse7WbCKS5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818128; c=relaxed/simple;
	bh=bLu6RArehJiUjQ+SpX6+Ls76c2Qcb1yxoIJepWgJ1+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCddRKAQOv6YUKJHPd4zu26TTVLjwvnvHfAba6s4EO6jeaDAhq8XsPS5/V95gr6rvlwvc78lYdUicsd4edHjQdlQaMO6rAtEzocyHV4QfHywieYS5Rk0ssoDGn2xwM/ZhZ3uYD216b/1Mm4kuZV6L0WFUrm8qLZkOOWT79qoOOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FzC5NTJW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FzC5NTJW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 03A1640E02D2;
	Mon, 19 Jan 2026 10:22:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lY5RUtm5OnD8; Mon, 19 Jan 2026 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768818115; bh=jNL1vZLUVDkOzUzJO9g2msnFYQBTSIcRRa9loxRJa/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzC5NTJWyCp4sOjt3zlHWCjRuK7v0B9UhPDTMWlgCjd0rqG5bQobEExwFMTFBSXdR
	 7hlOoLLHfFtCg0+NgTFsISj6s7hkBj5dgiVhqBhMm3vMvv3xj/f6fFL6M2PQ4Qi1ZS
	 XcZrb1m40zOR4+nR/uDFgybtJHwrjJJ/cFcVAbGzBgJgD2v4iykQy6AIRoXKzAufjy
	 E0Pi2cR3mPFjOgHJlQe/FCsuYgqPQO0mlrl1JNQDDugFM/sDcaEHu88gM7DgXkYSMK
	 1oXK44hB1M34JfujY15zSqEc9in79mGtzAOoTlOoHBZYDThsBrbARlsaLHXjIBo8eP
	 L7ASzPLvvFISAdQdjl464NMZRZVPo7OFxBLYoBZdol4SxOrVhvRSpRHPmIUPFJv9HR
	 cIVUTwUbihsy4W7JxJSjvDGNg+cmXolD1JqfT4U9S2jUzqJp5styeiRKA9U4Ndnhpm
	 D+0zJEJQ3cEuSrSbJ/eJ7kcsBCwQRF8bVcNPN7Jvl9ui+K9kljtp/kxkIpyWsvbSzH
	 OktjxZbYNJrM4AcJeMiiX4tSPJ1yH0EUvCGqVny8x9xK9NQlDpfUHbtQKX1+8rhjLh
	 NmAkjkhl7p98LLaavIeYk7O+Qpetzxg42KUrAw6HWEF75XX2RJcU6yhC7SID0RNAge
	 wD0VOuY/pUucK22NjqFZkFA0=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6E7FD40E0028;
	Mon, 19 Jan 2026 10:21:25 +0000 (UTC)
Date: Mon, 19 Jan 2026 11:21:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: corbet@lwn.net, anna-maria@linutronix.de, frederic@kernel.org,
	tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
	pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
	kees@kernel.org, elver@google.com, arnd@arndb.de, fvdl@google.com,
	lirongqing@baidu.com, bhelgaas@google.com, peterz@infradead.org,
	brgerst@gmail.com, kai.huang@intel.com, benjamin.berg@intel.com,
	andrew.cooper3@citrix.com, oleg@redhat.com, neelx@suse.com,
	sean@ashe.io, mproche@gmail.com, chjohnst@gmail.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/idle: Mark "idle=poll" as deprecated
Message-ID: <20260119102116.GAaW4FnNBECNPFzAW3@fat_crate.local>
References: <20260118231009.3194039-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260118231009.3194039-1-atomlin@atomlin.com>

On Sun, Jan 18, 2026 at 06:10:09PM -0500, Aaron Tomlin wrote:
> The "idle=poll" boot parameter is a blunt instrument that forces all
> CPUs in the system into a continuous "polling" state. While effective
> at eliminating wake-up latency, this global override is architecturally
> obsolete and inefficient on modern multicore systems.

Nope.

It is still very useful when you want to stop the machine from entering sleep
states.

> By writing special value "n/a" to the per-CPU sysfs node
> /sys/devices/system/cpu/cpuN/power/pm_qos_resume_latency_us, userspace
> can force a specific CPU to poll without imposing this cost globally.

You can't do that on the kernel command line and thus prevent entering sleep
states from the get-go.

So no, it ain't broke so no need to fix it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
