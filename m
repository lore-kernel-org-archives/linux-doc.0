Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC88348880
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773746948; cv=none; b=SBNWDC8XSRYNbzNY71+ztms9PepRK1cox5FkprHvaGCJSvKTpLgLYwoU6IKs/G1+qAm+WER7M2ESPz9vXotYMfsRPZE3zW9ZiTtfFPwbOlgI1VW9ib5eeaiD4zbRKe0oqqwMRCI5Ls/fEEH8OzCp2jeLUldAFvA68T0/0+Sq3ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773746948; c=relaxed/simple;
	bh=F6L8vG7qMuFHqFg4ADKsBOb9hvQlU2v84xLG1A0YvZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pNDCx4m0CHZc+ubVP+nIGDxk1kUXV/ZQAKQKleH3ZmgSqCoaZoqfyovhZBybhPdEoxgY92fsO5Dao+SnIud2jrIbGbIUMiVOSNDHDbRZN0y5c0f3yWjhhTJcXaMdmxH2Cia+NtHSQiM2jnUYIunJxCR2vSWsorXq1CHDbQHc+nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GIq6lRrK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IA4V2qNc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GIq6lRrK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IA4V2qNc"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773746944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6L8vG7qMuFHqFg4ADKsBOb9hvQlU2v84xLG1A0YvZ8=;
	b=GIq6lRrK4mudn4xiFrRao3fwp5xVxTJ9MEdARUbupWEfW7+1CfqaNWNTgq7qsWTxJ1ojuq
	Ch/YeA4X3TzrI6bh6XsPSDUaNH9uFFbvbcI9PQ+n1sGBYTz8zl+sZTtWiCcpnfk0IE0lVU
	kfvfACwWdvxZLKK5PtFWwoSCl4m/9/obfj6QUdiAiR7XXNuoLL6qf/KhVfwCEf5/RbGxpD
	xHM8XqVX4nqa3JoQTsOWzCzoRXP80VMDSTdLnUxWYAtRpbouKh/qqWxT55iMcvOMuKCb5s
	91e0zGuLqOf3F0o5rDJ/UMGnMimVKjGt5Yl7uB18gS4NpC/DaL8eteNSeFeg9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773746944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6L8vG7qMuFHqFg4ADKsBOb9hvQlU2v84xLG1A0YvZ8=;
	b=IA4V2qNcWy9KrDuOvXn+cD62AfIBYfr2sHer8C1tDH7YQJe5s2ZDWKBT8MFpmegA42B+FN
	Fy5RsUxGIg8PqBCA==
To: h3288824963 <3288824963@qq.com>, linux-doc@vger.kernel.org
Cc: pmladek@suse.com, senozhatsky@chromium.org, rostedt@goodmis.org,
 qujingling@huawei.com, zhangjiaji1@huawei.com, xushuangxing@huawei.com,
 hujinfei3@huawei.com, h3288824963 <3288824963@qq.com>
Subject: Re: [PATCH v2] Documentation: printk: Add section about avoiding
 lockups
In-Reply-To: <tencent_FB5B7DCFFB10BCDE325397D1202226779D09@qq.com>
References: <tencent_FB5B7DCFFB10BCDE325397D1202226779D09@qq.com>
Date: Tue, 17 Mar 2026 12:35:03 +0106
Message-ID: <87341yd79c.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-03-17, h3288824963 <3288824963@qq.com> wrote:
> Add a section 'Avoiding lockups from excessive printk() use' to
> printk-basics.rst, explaining the risk of calling printk() in hot paths
> with legacy consoles and suggesting alternatives.
>
> The section covers:
> - Rate-limited and one-time printing variants
> - Log level filtering
> - printk_deferred() for legacy consoles
> - Porting to nbcon API (preferred solution)
> - Using tracepoints for permanent debugging
>
> This documentation is relevant only for legacy console drivers and
> !PREEMPT_RT kernels.
>
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: h3288824963 <3288824963@qq.com>

Thanks for addressing my concerns.

Reviewed-by: John Ogness <john.ogness@linutronix.de>
