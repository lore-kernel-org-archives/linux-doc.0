Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CE8C05027
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 23:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjBIXp3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 18:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjBIXp2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 18:45:28 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CEA40F6;
        Thu,  9 Feb 2023 15:45:27 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1675986325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jSeql7k1ZuOuwRVZLTzmNwC3JFvmVPUKY/W+IZMmlXU=;
        b=KD20dLSvBelYh+OuB5XE+SJVyOQEF8UXupi+kZPFQJh5Aq3RNlqoC9xIctqsM4wuVoZ3bi
        vVyHqerx5IDlvBCur+AEilIP3bai54obiDt8gty7q3WBPem+La+rD+107bP9RdUJrTmrKB
        qCdtcnn24KmjFm97hSKEKG7Dm0T5xgVC7aUN7ZwMBI8u3m2c5FB0DZtPJuAbNX0DDP2gRn
        Vomnllg0OuNhIaHima2A+lrKOlWblCBGcCwKxcjpFPQ/kVJcuGNvdK12GiyAw+Ej8EKBQ7
        reoPmmEdz2miAWgfO7kIB8LY/V1ehQ5yvF3qbN5cdcfqLaZrtJ3thx3nCth/hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1675986325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jSeql7k1ZuOuwRVZLTzmNwC3JFvmVPUKY/W+IZMmlXU=;
        b=RjC1RGtaAjvRuo3lEdqHlLCbjwBVzuH14OcX43RCkMR/fIErtvvGDRSEvyV3sYtF5ZFEAw
        2DbBFS428h8EXVCw==
To:     Gregory Price <gourry.memverge@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, oleg@redhat.com, avagin@gmail.com,
        peterz@infradead.org, luto@kernel.org, krisman@collabora.com,
        corbet@lwn.net, shuah@kernel.org,
        Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v8 1/1] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
In-Reply-To: <20230131144458.1980891-2-gregory.price@memverge.com>
References: <20230131144458.1980891-1-gregory.price@memverge.com>
 <20230131144458.1980891-2-gregory.price@memverge.com>
Date:   Fri, 10 Feb 2023 00:45:24 +0100
Message-ID: <87edqy1jzf.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 31 2023 at 09:44, Gregory Price wrote:
>  
> +static inline int syscall_user_dispatch_get_config(struct task_struct *task, unsigned long size,
> +	void __user *data)

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#line-breaks

All over the place.

> index 195ae64a8c87..6d2f3b86f932 100644
> --- a/include/uapi/linux/ptrace.h
> +++ b/include/uapi/linux/ptrace.h
> @@ -112,6 +112,15 @@ struct ptrace_rseq_configuration {
>  	__u32 pad;
>  };
>  
> +#define PTRACE_SET_SYSCALL_USER_DISPATCH_CONFIG 0x4210
> +#define PTRACE_GET_SYSCALL_USER_DISPATCH_CONFIG 0x4211
> +struct syscall_user_dispatch_config {

Can you please visibly separate the defines from the struct definition
by a newline? Glueing that stuff together is just horrible to read.

> +	__u64 mode;
> +	__s8 *selector;
> +	__u64 offset;
> +	__u64 len;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

Please add proper documentation to this struct. It's user space ABI and
it's not the job of the man page maintainers to figure out what this
actually means.

> +int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long size,
> +		void __user *data)
> +{
> +	struct syscall_user_dispatch_config config;
> +
> +	if (size != sizeof(struct syscall_user_dispatch_config))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&config, data, sizeof(config)))
> +		return -EFAULT;
> +
> +	return set_syscall_user_dispatch(config.mode, config.offset, config.len,
> +			config.selector);

How is this supposed to work? This is called from the ptracer to set the
user dispatch mode on the ptracee, i.e. on @task.

But set_syscall_user_dispatch() operates on current, which is the
ptracer itself.

Clearly well tested with the non-existant selftest, which is part of
this submission.

So please fix the above issues, add a selftest and proper documentation.

I'm neither impressed by this patch nor by the reviews.

Sigh

        tglx

