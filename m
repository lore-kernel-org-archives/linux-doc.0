Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A1245014
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 01:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675371; cv=none; b=SAMLfj/jkJopnI1j3+BbGfSbKy+jJKzmzqmMY34rdu1XhH/XhDjmu9mEnNJ4K1Q8Q+49vJ2f/KBPyFUrQMFYcWZnl0GJfUfXCSZEnRGBe72VnGEeK+AjVz7uiRuGvL1xkM35CMNwPzPtDzG5jNL+1nAcDdCCfEUVZpEudtFCLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675371; c=relaxed/simple;
	bh=Np4ShKJhjd/UsVZCCVkMIXyUkSYRhUpk9SUmJO1RszE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ieBHRGKTVoHmxvVQCVCjF0sMuZegx4cl+puBOL0GfvNG/fp6yivFkNk4gj2lcQkFNcGuKdNAp7/vfg7M2nIHc2FwTBdGl4vZOrHvP9wECctsfYh1HfD8DMM6713SpCO0fh9O1q1pqRZyK/nxMfBP4vgvnKQKifw8g6oULqlr1oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 8375213B923;
	Thu,  5 Mar 2026 01:49:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 6A6D02000D;
	Thu,  5 Mar 2026 01:49:20 +0000 (UTC)
Date: Wed, 4 Mar 2026 20:49:18 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: hujinfei <3288824963@qq.com>
Cc: linux-doc@vger.kernel.org, pmladek@suse.com, senozhatsky@chromium.org,
 qujingling@huawei.com, zhangjiaji1@huawei.com, xushuangxing@huawei.com,
 john.ogness@linutronix.de, hujinfei3@huawei.com
Subject: Re: [PATCH] Documentation: printk: warn about lockups from
 excessive use
Message-ID: <20260304204918.53abe94c@fedora>
In-Reply-To: <tencent_D970CEB1BE717D3D5E259943CB4510A99308@qq.com>
References: <tencent_D970CEB1BE717D3D5E259943CB4510A99308@qq.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: uqeho639ny6g9r8yhunkxuaqzbd8w1os
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 6A6D02000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Mkw2VZVy96heZTK+URNisEyPsrFd6TXw=
X-HE-Tag: 1772675360-310425
X-HE-Meta: U2FsdGVkX1+FdnYvN1QLFGkOO9s+Je6phw363ubXKHO8wYnZ3nTPKn1ypE8PJKjlh2Fvb00Gn/XV4ABA/hroVPTfphCVdWF7kE3LrC1wSWRiLOXXrVk/Bmm5HlxTFhxVtIMDm2s0km12ka/yqj0oc1KWiIXkQIDtW8nOWwg5C35tbHffvE9OZKQsXjQGfdE8sXRX/YyDtaCZtgBdJkHlfUJ1YfHMKioMszR/tY/6QpN1YnGBDylX7PVEaBT0gG84LYUIDJ9zVKrEjHR/6BwWbsTFNzO5ErbMGhNZr131apZW1grAkAAguMMLwsXJ/vIW5FgiKlU08Y1tk7NYqk2xzwMrn6jhQJfsNijajGOig2wa0x8YP5zEVQ==

On Wed,  4 Mar 2026 22:40:32 +0800
hujinfei <3288824963@qq.com> wrote:

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
> +
> +To avoid this:
> +
> +- Avoid ``printk()`` in hot paths and interrupt contexts.
> +- Use rate-limited variants (e.g., pr_xxx_ratelimited()) or one-time macros (e.g., pr_*_once()).
> +- Assign lower log levels (e.g., ``KERN_DEBUG``) to non-essential messages and filter
> +  console output via ``console_loglevel``.
> +- Use consoles that implement the non-blocking ``nbcon`` API (indicated by ``CON_NBCON``),
> +  which offload message printing to a dedicated kernel thread outside emergency contexts.
> +  Note that asynchronous printing increases the risk of message loss during crashes;
> +  increasing the kernel log buffer size may help retain more messages.
> +
> +Temporary debugging may use ``trace_printk()``, but it must not appear in mainline
> +code. See the section about ``trace_printk()`` in Documentation/trace/debugging.rst.

You could also add:

  If more permanent output is needed in a hot path, trace events can be
  used. See Documentation/trace/events.rst and
  samples/trace_events/trace-events-sample.[ch]

-- Steve


>  
>  Function reference
>  ==================

