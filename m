Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE0264614
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397641; cv=none; b=O3Mv/iwXxi85M30Nyn3mS3C78iSsQteKrIS/yyL5h+wWr8fXE5He8fI/ubNZ9KmNYex4OvQ0x+OPDMPNhKtBUsH2ZFcsmd6CLu3v3H7jv4VgLub2iVZ98Ain7NgGPHVZkRtnhvoiGJI73BoQi1CsKAc7/G3I7fPIyelHPWWqbrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397641; c=relaxed/simple;
	bh=lUxN4aiH1kcGdncQK2DiMhZOJwIpj3ZaxQHpth4H+5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KegCfek71GP/lINEoARwx05/AYHEnsiBbjAW32oBnCqmKTYwU2nbEwimk0kKGcuoJfn5k/tPMysyjMMUJva+Ed8joD1S4SacKcWmAZY+CeAFSPtIBXb+Ck3TiMlUs/74E14cWVVweqtaXv0ckVgttTPmkE+0L0gUci4At+Jqef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PL2EYF3l; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KY3Y433Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PL2EYF3l";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KY3Y433Y"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773397637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69Js723qJt+gJpA1N3GRZEEjVdPBtPoxsgHR9UOxxTI=;
	b=PL2EYF3lHKCqJl2i2YQM0+UvzOaL+i4GZa1B3XpcxEMZn3VX7uUgCtb5WOztuDxhf4kJcD
	CeTJ3+aSYlQZnXYDtCQGK9e2eeuj0TcNR9wZHVkR9C2/sG965cqGJ+Ppy3st1TdGAgnBV3
	Qeq+6byrVfw0I0s15vVqG4+wRiW6uEH+SVJVqOuOZNz0G/2xhwGrC1dGZOVPKaIl40YytW
	gkga3x1O1TwDHXFIHYoZ1bHHXVKDfZ4bsFUmw3m5hBMMtJ9u35arQAks1cTJXh+GvRrYqh
	iIoJn8HfmHqunzX23eA3jwxXvXwqEHX52H3ctkapOpMbCAaWltTursB0WC0nyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773397637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69Js723qJt+gJpA1N3GRZEEjVdPBtPoxsgHR9UOxxTI=;
	b=KY3Y433YJzOvzvT3xToyEe4JHlmAOTIRnpLz6wNNn6w57thhvcXqXrD4fxlg0Ft4QlLuRz
	wTue82swE8gbFADw==
To: hujinfei <3288824963@qq.com>, linux-doc@vger.kernel.org
Cc: pmladek@suse.com, senozhatsky@chromium.org, qujingling@huawei.com,
 zhangjiaji1@huawei.com, xushuangxing@huawei.com, rostedt@goodmis.org,
 hujinfei3@huawei.com
Subject: Re: [PATCH] Documentation: printk: warn about lockups from
 excessive use
In-Reply-To: <tencent_D970CEB1BE717D3D5E259943CB4510A99308@qq.com>
References: <tencent_D970CEB1BE717D3D5E259943CB4510A99308@qq.com>
Date: Fri, 13 Mar 2026 11:33:16 +0106
Message-ID: <874imkqb23.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-03-04, hujinfei <3288824963@qq.com> wrote:
> From: hujinfei <hujinfei3@huawei.com>
>
> Add a section 'Avoiding lockups from excessive printk() use' to
> printk-basics.rst, explaining the risk of calling printk() in hot paths
> with slow consoles and suggesting alternatives like ratelimited printing,
> tracepoints, nbcon, and log level filtering.
>
> Signed-off-by: hujinfei <hujinfei3@huawei.com>
> ---
>  Documentation/core-api/printk-basics.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
> index 2dde24ca7..a9da8c336 100644
> --- a/Documentation/core-api/printk-basics.rst
> +++ b/Documentation/core-api/printk-basics.rst
> @@ -103,6 +103,28 @@ For debugging purposes there are also two conditionally-compiled macros:
>  pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or
>  also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.
>  
> +Avoiding lockups from excessive printk() use
> +============================================
> +
> +Do not use ``printk()`` in hot paths such as interrupt handlers, timer callbacks,
> +or high-frequency network receive routines. When a slow console (e.g., ``console=ttyS0``)
> +is active, ``printk()`` may synchronously acquire ``console_sem`` and block while
> +flushing messages, potentially disabling interrupts long enough to trigger hard or
> +soft lockup detectors.

I hesitate supporting the addition of this documetation because it is
only relevant for legacy consoles and !PREEMPT_RT. Perhaps we could make
that point clearer. Once all console drivers have been updated to nbcon,
we can then remove this documentation.

> +
> +To avoid this:
> +
> +- Avoid ``printk()`` in hot paths and interrupt contexts.
> +- Use rate-limited variants (e.g., pr_xxx_ratelimited()) or one-time macros (e.g., pr_*_once()).
> +- Assign lower log levels (e.g., ``KERN_DEBUG``) to non-essential messages and filter
> +  console output via ``console_loglevel``.
> +- Use consoles that implement the non-blocking ``nbcon`` API (indicated by ``CON_NBCON``),
> +  which offload message printing to a dedicated kernel thread outside emergency contexts.

If the first paragraph made it clear that legacy consoles are the
problem, the point about using nbcon would not be necessary.

> +  Note that asynchronous printing increases the risk of message loss during crashes;
> +  increasing the kernel log buffer size may help retain more messages.

This last sentence is misleading. Calling printk() immediately logs the
message to the lockless ringbuffer. Upon panic, the buffer is
flushed. The nbcon consoles also transition to atomic printing. The only
messages that might get lost due to mass printk() calling are older
messages. But this problem is not specific to nbcon consoles.

There is also printk_deferred(), which immediately logs to the
ringbuffer and defers the console printing. It is a workaround for
legacy consoles. For nbcon consoles there is no difference between
printk() and printk_deferrred().

And since this is supposed to be general tips for developers, perhaps we
could mention that porting a legacy console driver to nbcon is also a
solution (and, in fact, is the preferred solution).

John Ogness
