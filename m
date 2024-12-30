Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DEE22339;
	Mon, 30 Dec 2024 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735590405; cv=none; b=bJMIFFG0hr52RYPnRV0EFxbPohy+vaEnKDZ90iwlegfE9pUBw77gzO7p+bo2ysx2RHl21XosDPGhQuN1iEJWXdI9Yd1YeQaCmlVEblxYnTT2fIPffy7EdvjbgdiZfGqk2+XeDkvgpXWmE89n9fcGqDBwrUlfZzXvbpEbi47k0qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735590405; c=relaxed/simple;
	bh=i7/DMHFJrn3Lm2GZEvIky9fI6TgsLT4dRkxWc1R2TXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9LoEkY3RigqcpA3uq9T0WWleMtxzzrZxmLy3oXGKH3aeRECynSkzDy4Xva7yczQ77oB7055U4v2Yj/AGjtmSIXzp6o0Jzkafek5DN+PSJyR9vwOW8XBVSckiFoU+SnOzNRwj6jseIV7AJCFXAFrfC2z2bhXE26QGagqlzKPpVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUxX/flg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUxX/flg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D755C4CED0;
	Mon, 30 Dec 2024 20:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735590404;
	bh=i7/DMHFJrn3Lm2GZEvIky9fI6TgsLT4dRkxWc1R2TXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jUxX/flgpkakiW92dz9kZVrCYu59Q47eQGpfcftbzL8rvwlKCKzERVLrcGZUxpxbr
	 LI+zLe9+oY7sIvGEg0ua3jeA5Wo7UETf7w7/iWfzjNCrXpPpW7ZGiOabNeQKAy1Jlm
	 DYMrr75GdtzZDf02eQUrZecV8qbBVy+68Dtr1H4DK/aTPaVhuS1q9ViYa4yF9x+azS
	 +LXcd/aZJYQCaSmE0QfFTcVc+fJrb/L+hdo+OdAO21YzdAfNkkTpGHmq6y1RxS0/E0
	 C2nDKkitd50TbixSXnnGJ4Zu4FNQ4NAJlDeSDQd7a/42sndtY+kYsDJtBszA4NHnI0
	 KCG8ckYRJ0cZw==
Date: Mon, 30 Dec 2024 14:26:43 -0600
From: Rob Herring <robh@kernel.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Saravana Kannan <saravanak@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: lock in vsprintf(): was: Re: [PATCH] of: Add printf '%pOFm' for
 generating modalias
Message-ID: <20241230202643.GA2488017-robh@kernel.org>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2K_u6jK5aLDqaam@pathway.suse.cz>
 <84wmfxm6em.fsf@jogness.linutronix.de>
 <Z2Q2TcM6QPUIIyLC@pathway.suse.cz>
 <84o7171o9y.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84o7171o9y.fsf@jogness.linutronix.de>

On Thu, Dec 19, 2024 at 08:17:21PM +0106, John Ogness wrote:
> On 2024-12-19, Petr Mladek <pmladek@suse.com> wrote:
> > I do not want to revert everything now just because of theoretical
> > problems.
> 
> What would you revert? This has always been an issue for printk().
> 
> > Well, it would be nice to document the lock dependency in
> > Documentation/core-api/printk-formats.rst
> 
> Yes. If any locking is involved at all, such specifiers should be
> documented as not safe in NMI context or within printk_cpu_sync
> blocks. 

For the folks that don't read documentation, should we bail out on 
in_nmi() for these as well?

> Also, it should be checked if all such locks are
> raw_spinlock_t. If any other lock type is used, it probably is already
> generating a lockdep splat since printk() formats records with local
> interrupts off.

At least for DT, that is the case. There is a mutex, but that's only 
taken if the tree is modified.

> Perhaps we should create a kunit that calls printk() for each of the
> supported specifiers and see if any lockdep splats appear.

That's already in place with the DT unit test (which doesn't use kunit 
ATM).

Rob
