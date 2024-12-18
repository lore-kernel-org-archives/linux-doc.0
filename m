Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389A15A856;
	Wed, 18 Dec 2024 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734530837; cv=none; b=JZcpgdrkTkwn/IkfiSICRRMAmuEPBladKji8IVL13PH58CUMQkJ4pI2Wp5D7MP/PitnDwOJOCR2IiEin6H6Qqx/Rn9xukcUWgIcHtGKjoZeNBNYg+TAPjJcDRgtDxgtAmfokTU8u3Hui7xL/bXUDrfKE4eMazj4Jn/SaJX/H7/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734530837; c=relaxed/simple;
	bh=mgX93xzPnXv541PUr2ltsPc7jNYTs6Jq1GIOGYENQHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TG5NcG9VeEbrEqH8BXQ9Alks7iLUvdbELVIPMpbuKDyTecEpKehWRr1BrXtnuoLG2RoMtUshgjzv/qzJCljL35hQoN8r0/AtCu76825Vrt0MQ6O06IaDTVQOUMO0D/rymnRZ1uipyz2lb30kjvXY8XKuM2uW4ZkASmXIy3+uB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4oyRi0C6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eD7V4K9U; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4oyRi0C6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eD7V4K9U"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734530834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2eLj0/YgnHOw01rambB9COkAefJ/p6pn5ystAV/jiIo=;
	b=4oyRi0C6vwlSj2UJ0Htc56FX3h2FMSwlBfutsNVF4HkHLTVxdld6dd/mlb+xz5NBih6CD4
	L+/YByveFf4Kt594VNXOERSlTTBCnXlGFyM3+0gFHmSPfS56qJ+/Vv71A7Ik1A39CTS08E
	870vMA4lcycPkQTIcgLV6CjDdPKlWjRA+yp8KsEHW2JFOwBCvf3ZAeLtt+YxFsGjYZg2rr
	CBsAyJD/8/pVu3YrejWoOlVajbgcHkz4AQ3DO/t99ehLvwOj1DxjYQN/u0eC12pgsjAxd/
	abAmkEJSn4pcOFi6Tu+WDbCwPrXVnGPueSaE5LAiJ6H1FedFlwofBbMRIPZ1rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734530834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2eLj0/YgnHOw01rambB9COkAefJ/p6pn5ystAV/jiIo=;
	b=eD7V4K9U9uNdeUVdYrISR6N8bDAK/Cq8ybtljmpjmFLR4SHiTA1loWgq2Vxd55AJyNCWBr
	xR8l772BMoG4kRCg==
To: Petr Mladek <pmladek@suse.com>, "Rob Herring (Arm)" <robh@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Saravana Kannan <saravanak@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Zijun Hu
 <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: lock in vsprintf(): was: Re: [PATCH] of: Add printf '%pOFm' for
 generating modalias
In-Reply-To: <Z2K_u6jK5aLDqaam@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2K_u6jK5aLDqaam@pathway.suse.cz>
Date: Wed, 18 Dec 2024 15:13:13 +0106
Message-ID: <84wmfxm6em.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2024-12-18, Petr Mladek <pmladek@suse.com> wrote:
> My concern is taking a lock when processing a printf format, see
> below for more details.

Your concern is valid! printk() uses vsnprintf() to format records for
the kernel log. printk() may be called from contexts where locking is
forbidden (such as NMI). If vsnprintf() can take a lock, then either:

vsnprintf() must be made to be lockless

  or

printk() must take another approach to string formatting

  or

we accept that printk() can deadlock for certain format types in certain
contexts.

John Ogness
