Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946741A704B;
	Thu, 19 Dec 2024 19:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734635491; cv=none; b=TEeZKSF0WuD/y1FOFgUVpL3nOQ8b+FMmay363Wphj/NyQkl9/ahgm8Ge6iFS58G3mX5zEH4CRBhZ8X2aVrq6+l1hDncPxgkHNN3QLU776/34chms2vJxHMHkkLpem/t+flMhXwouChvyfPKcC54JsvQ9p+xPMVDzPIluhB7IvEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734635491; c=relaxed/simple;
	bh=cYZ4Tni7GOSya/ynck3DnM0K9c3mNrs2E3MBiCLhFK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E7/UYEWRSfdCGyhHacPWVXvnvwd2VuhBFbViJqcWB8ZtuZIxC7P+3BY/5hn72E97tJ2Qk6KrCjPPmax+l0Ax1/L/2Zz7ZIP1NSbvTn8jEyhOHHqIEG/vPBayQ4OtUGzuaK2sK8Zlsc3s3QZO74HBuIXlcFdxw9rrfJBt4vQro0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rtDNGJjM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jsCH5xwL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rtDNGJjM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jsCH5xwL"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734635482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYZ4Tni7GOSya/ynck3DnM0K9c3mNrs2E3MBiCLhFK4=;
	b=rtDNGJjMu6mMm1Ynaubns56vPgt6N69XC0mXpZAyPryzm1ta4hZoav2t5PMDS6pfLGpGAD
	lXfzQ1wHMbEikJEE2XKHUQwiMNEbUgdWapYksz2+ivABB/nEXGWfKelJLK09930U/35G0h
	Wc+Hla4G/dxWDyIlCxv71P7nJXMWHmeIkuaF82dAiEKDc+5Se/pdQhnwQ78+o884M39Tdp
	1g4Zg3tivCyuIDo9hljOpkDeAXRnTQPMp/WBXRBNCpefj0wqdOrZ3dL/tFDb7TYSRQDcfc
	xL5HpRfc8R7sRSIV42dx7w5Q70LGmgbzf5Yys3V/8cpIqg4GvPYs4cGDWP+r+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734635482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYZ4Tni7GOSya/ynck3DnM0K9c3mNrs2E3MBiCLhFK4=;
	b=jsCH5xwLrr25oS9/n9q5pi1FDTCBzSASK8TKG+2IDBykvvp+j3YQgR5JkEK1DVj6382Kg4
	vQ2m+r+XMOrR1NAg==
To: Petr Mladek <pmladek@suse.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Saravana Kannan <saravanak@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Zijun Hu
 <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: lock in vsprintf(): was: Re: [PATCH] of: Add printf '%pOFm' for
 generating modalias
In-Reply-To: <Z2Q2TcM6QPUIIyLC@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2K_u6jK5aLDqaam@pathway.suse.cz> <84wmfxm6em.fsf@jogness.linutronix.de>
 <Z2Q2TcM6QPUIIyLC@pathway.suse.cz>
Date: Thu, 19 Dec 2024 20:17:21 +0106
Message-ID: <84o7171o9y.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2024-12-19, Petr Mladek <pmladek@suse.com> wrote:
> I do not want to revert everything now just because of theoretical
> problems.

What would you revert? This has always been an issue for printk().

> Well, it would be nice to document the lock dependency in
> Documentation/core-api/printk-formats.rst

Yes. If any locking is involved at all, such specifiers should be
documented as not safe in NMI context or within printk_cpu_sync
blocks. Also, it should be checked if all such locks are
raw_spinlock_t. If any other lock type is used, it probably is already
generating a lockdep splat since printk() formats records with local
interrupts off.

Perhaps we should create a kunit that calls printk() for each of the
supported specifiers and see if any lockdep splats appear.

John
