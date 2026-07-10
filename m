Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D424C383C65
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712202; cv=none; b=cy58KtjDW43pUJdXlr9jZl+ZWxpDTfXlQWq9BbewZFua9Jxgth0Q+P+nvPJNAf9SMhqg1iE8TjISZt+VvSYHO27JVkaVy6oQ7CzlZwEGz+3IxDn08WgXtTQk8RgKv2tEY/SBDBhAo4zO7fJS23IuQpv7EqL0IlOPkQJBbJhXnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712202; c=relaxed/simple;
	bh=1Ghcw1zrrmq87mRzkUyqqQjybkFHfvUgZp7obfaGbnQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PHKyp3rQB/+eXQ1k7bRPk0/RlfUL+1J42N2v4a1WgBv8lAv+ls1vGJfK58eRtlWq4XlQIT3P5R1z3/hao7QMote7jPuBa8WmynsuFJ7b+EafHoQZnlGBOyKJHn4qHNt1xYqTMCiMuBa+QI25Se9Bh5+Z6NlERRF97cUdNjvwiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KNVz7+b2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KNVz7+b2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0313D415A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783712200; bh=QE64YzEV0x5Is3pGlAmYFyx4GAOb1/YQTNX6+xqHJGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KNVz7+b2+5PKygZKkUYdoHf9urzMnAFwqdQsTd9B3OgaBw/uUnYKoGH/0Y8Z8WUVb
	 ZU654h/1zIdnzW8CSmiXEHnD3DJws5HX8rfRWmJSv84Qpe0g+XCFx85Fkb/HKqfA9J
	 PFXuxkDdN/+lxN2AtekLCdXMjqHNn2j1PlhGbVzOMnS5lBwMUCYRHKcmkJjdRmGgmZ
	 BqN1oIjv+aZ6sfyh5PUXVC1ccC8PmR+qJmkVUw2iyFqgSaS4gniNe+9n00N+emkx+B
	 di3ToUgxUtU9vvOnPamY7GcAMd8ROvagzTSLm3iPf1R/XkoJvVFD2FVyYmsVaeG9cC
	 UTaOKUsgQWjjA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0313D415A7;
	Fri, 10 Jul 2026 19:36:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mingzhu Wang <mingzhu.wang@transsion.com>
Cc: "chris@chrisdown.name" <chris@chrisdown.name>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, Jiazi Li
 <jiazi.li@transsion.com>, Hongyan Xia <hongyan.xia@transsion.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Mingzhu Wang
 <mingzhu.wang@transsion.com>
Subject: Re: [PATCH] docs: printk-index: refresh sample index entries
In-Reply-To: <20260703014954.780-1-mingzhu.wang@transsion.com>
References: <20260703014954.780-1-mingzhu.wang@transsion.com>
Date: Fri, 10 Jul 2026 13:36:39 -0600
Message-ID: <87qzlak56g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mingzhu Wang <mingzhu.wang@transsion.com> writes:

> From: Mingzhu Wang <mingzhu.wang@transsion.com>
>
> Update the example printk index lines in the User Interface section to
> match the current source code. The previous examples contained stale
> line numbers, an obsolete function name, and incorrect format strings.
>
> - block/blk-settings.c: disk_stack_limits -> queue_limits_stack_bdev,
>   and use %pg instead of %s for the device pointer
> - kernel/trace/trace.c: update line number for trace_create_file()
> - arch/x86/kernel/hpet.c: update line number for _hpet_print_config()
> - init/do_mounts.c: prepare_namespace -> wait_for_root, with updated
>   line number
> - drivers/acpi/osl.c: update line number, include the "OSL:" prefix
>   from pr_fmt(), and fix capitalization of "Auto-serialization"
>
> Signed-off-by: Mingzhu Wang <mingzhu.wang@transsion.com>
> ---
>  Documentation/core-api/printk-index.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/core-api/printk-index.rst b/Documentation/core-api/printk-index.rst
> index 1979c5dd32fe..40023f7dfe98 100644
> --- a/Documentation/core-api/printk-index.rst
> +++ b/Documentation/core-api/printk-index.rst
> @@ -47,11 +47,11 @@ The content is inspired by the dynamic debug interface and looks like::
>  
>     $> head -1 /sys/kernel/debug/printk/index/vmlinux; shuf -n 5 vmlinux
>     # <level[,flags]> filename:line function "format"
> -   <5> block/blk-settings.c:661 disk_stack_limits "%s: Warning: Device %s is misaligned\n"
> -   <4> kernel/trace/trace.c:8296 trace_create_file "Could not create tracefs '%s' entry\n"
> -   <6> arch/x86/kernel/hpet.c:144 _hpet_print_config "hpet: %s(%d):\n"
> -   <6> init/do_mounts.c:605 prepare_namespace "Waiting for root device %s...\n"
> -   <6> drivers/acpi/osl.c:1410 acpi_no_auto_serialize_setup "ACPI: auto-serialization disabled\n"
> +   <5> block/blk-settings.c:955 queue_limits_stack_bdev "%s: Warning: Device %pg is misaligned\n"
> +   <4> kernel/trace/trace.c:7861 trace_create_file "Could not create tracefs '%s' entry\n"
> +   <6> arch/x86/kernel/hpet.c:147 _hpet_print_config "hpet: %s(%d):\n"
> +   <6> init/do_mounts.c:413 wait_for_root "Waiting for root device %s...\n"
> +   <6> drivers/acpi/osl.c:1455 acpi_no_auto_serialize_setup "ACPI: OSL: Auto-serialization disabled\n"

I'm sorry, but this seems like a pointless change.  This is simply
example text, the purpose is to describe how to interpret it, not to
communicate specific messages from a current kernel.  It will always be
out of date, and that doesn't really seem like a problem?

Thanks,

jon
