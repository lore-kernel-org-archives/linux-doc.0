Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93E3C64ED6
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 17:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjB1REp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 12:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjB1REp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 12:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DBCB776
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677603836;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uLkxFWJZoOWbhdfRTliUPcDXf7HJjLU8upPpqW9MN+E=;
        b=CYDNxVlIbt932Nv7lC72aIFWHBDJIYjrw7SfJl6sC64o8wYK2VgqnEXXPMYr465aeuR9UD
        q23i89jABWZ/LeFYqVOyWI2v3IRTk3Dng6oH0QkqYwq2WKGi+tB3/lEhyflbnIK/n6zO0K
        MXUs5gSF+MTxYQzkw7kk5xacR99MYuA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-MUOEg7B2MX2gDbAZOsCHxA-1; Tue, 28 Feb 2023 12:03:51 -0500
X-MC-Unique: MUOEg7B2MX2gDbAZOsCHxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F35A73C0ED4A;
        Tue, 28 Feb 2023 17:03:49 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.252])
        by smtp.corp.redhat.com (Postfix) with SMTP id 4C88C404BEC5;
        Tue, 28 Feb 2023 17:03:47 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue, 28 Feb 2023 18:03:43 +0100 (CET)
Date:   Tue, 28 Feb 2023 18:03:40 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Gregory Price <gourry.memverge@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        avagin@gmail.com, peterz@infradead.org, luto@kernel.org,
        krisman@collabora.com, tglx@linutronix.de, corbet@lwn.net,
        shuah@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v12 2/3] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
Message-ID: <20230228170339.GA15021@redhat.com>
References: <20230224233126.1936-1-gregory.price@memverge.com>
 <20230224233126.1936-3-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224233126.1936-3-gregory.price@memverge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Gregory,

I can't resist, I have a couple of cosmetic nits.

On 02/24, Gregory Price wrote:
>
> +int syscall_user_dispatch_get_config(struct task_struct *task, unsigned long size,
> +				     void __user *data)
> +{
> +	struct syscall_user_dispatch *sd = &task->syscall_dispatch;
> +	struct ptrace_sud_config config;
> +
> +	if (size != sizeof(struct ptrace_sud_config))
> +		return -EINVAL;
> +
> +	if (test_task_syscall_work(task, SYSCALL_USER_DISPATCH))
> +		config.mode = PR_SYS_DISPATCH_ON;
> +	else
> +		config.mode = PR_SYS_DISPATCH_OFF;
> +
> +	config.offset = sd->offset;
> +	config.len = sd->len;
> +	config.selector = (__u64)(uintptr_t)sd->selector;
> +
> +	if (copy_to_user(data, &config, sizeof(config)))

Let me repeat, do not mix sizeof(struct ptrace_sud_config) and sizeof(config).
Perhaps this is just me, but this looks confusing to me. Please use
sizeof(config) both times.

> +int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long size,
> +				     void __user *data)
> +{
> +	int rc;
> +	struct ptrace_sud_config cfg;
                                 ^^^

Again, this is cosmetic but a bit annoying. Please use either "config" or
"cfg" in both functions to make the naming more consistent.


> +	rc = task_set_syscall_user_dispatch(task, cfg.mode, cfg.offset,
> +					    cfg.len, (char __user *)(uintptr_t)cfg.selector);


	rc = task_set_syscall_user_dispatch(task, cfg.mode, cfg.offset, cfg.len,
					   (char __user *)(uintptr_t)cfg.selector);

looks a bit better to me.

Oleg.

