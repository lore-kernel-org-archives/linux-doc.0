Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4C19F12D;
	Thu,  2 Jan 2025 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735826555; cv=none; b=O8jx3UM2o9rZdzyPB6vdxJbEnWZY73v7kgfOP0ArgfiyDKhQrYavuMVbA7KOtO9M5LHCGXcVnNsGa+H5qIwFiwc2X5DXCDOgBEaHDFHTRvXfwWHDE/a49D3RYdxwp4b/aqxzV9bNe2GXiVZFunvaWIGb783hYrgYV4W2P7Bwn30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735826555; c=relaxed/simple;
	bh=zd7WZdgR7XgysT/dpmqg2UlIs+lrlywyDgn5O4Qkk14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aKxhunQY6KWZb7ofLi8Asnx7Ntoq0g1FO8lb4JcyknoPwIQXw4kXXpOx+nFzYmTXra/sGj/eobreaR1VVgVy7IaXTe8qRKSQit4PF2YygvXSmwYIBwmY4CI0ROOe4Ntee8ddWz3wGNKAuljTS/gpdOQgLy4L7iktHGhnYjY3rzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RbRupLoa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tcc3o95v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RbRupLoa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tcc3o95v"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1735826551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4hTaNAjC/tRcIKreB2//EDqD06qNgIsNswNjrgCSsmw=;
	b=RbRupLoaaGs3cg+MHuy2Kjgp3WWLDu9iVvZHhqJewIBI5CinqXjSH9B86h2YHVs+QxKc87
	Ud4ZCepfXNS39CYqYGUyRpzUOIMDW5rOGUErsf/nEqPFlZ9iem+T73kQ4CnfKjdPuIyDRQ
	KgFIdE1VPsYO5RHYQnupCTPnpPg1X0Qd4rey8xLNPXHFncbCN5MsjN5YSVmxmTq3LkvA6y
	j8p3kO7ZdWTQG1BL3gBte+fZ/cgdy2dMBdZNT22kVEd9NBcJh+Dj0ndoeYm+J1tGWx1NQG
	wzdKV976jMzpiLmsbe6iEgHP9hhOVgt7euVgcl6/eBKsq3SgPidvC5flmnsO6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1735826551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4hTaNAjC/tRcIKreB2//EDqD06qNgIsNswNjrgCSsmw=;
	b=tcc3o95vqiRfEn0uM09xMP5DakBtW+yB0ucyalo6GZRh44ZuOHOjSVqJKpC+QiORFIlvUL
	ongMNdmdapX1w9Bw==
To: Petr Mladek <pmladek@suse.com>, Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Saravana Kannan <saravanak@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Zijun Hu
 <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: lock in vsprintf(): was: Re: [PATCH] of: Add printf '%pOFm' for
 generating modalias
In-Reply-To: <Z3aPSwnbUhqvp59v@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2K_u6jK5aLDqaam@pathway.suse.cz> <84wmfxm6em.fsf@jogness.linutronix.de>
 <Z2Q2TcM6QPUIIyLC@pathway.suse.cz> <84o7171o9y.fsf@jogness.linutronix.de>
 <20241230202643.GA2488017-robh@kernel.org>
 <Z3aPSwnbUhqvp59v@pathway.suse.cz>
Date: Thu, 02 Jan 2025 15:08:30 +0106
Message-ID: <8434i1z53d.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2025-01-02, Petr Mladek <pmladek@suse.com> wrote:
> On Mon 2024-12-30 14:26:43, Rob Herring wrote:
>> On Thu, Dec 19, 2024 at 08:17:21PM +0106, John Ogness wrote:
>> > On 2024-12-19, Petr Mladek <pmladek@suse.com> wrote:
>> > > I do not want to revert everything now just because of theoretical
>> > > problems.
>> > 
>> > What would you revert? This has always been an issue for printk().
>> > 
>> > > Well, it would be nice to document the lock dependency in
>> > > Documentation/core-api/printk-formats.rst
>> > 
>> > Yes. If any locking is involved at all, such specifiers should be
>> > documented as not safe in NMI context or within printk_cpu_sync
>> > blocks. 
>> 
>> For the folks that don't read documentation, should we bail out on 
>> in_nmi() for these as well?
>
> I like this idea.

Perhaps also include a check using the upcoming
is_printk_cpu_sync_owner() [0] as well.

John Ogness

[0] https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/commit/?h=for-6.14-cpu_sync-fixup&id=0161e2d6950fe66cf6ac1c10d945bae971f33667
