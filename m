Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC17EC636D6
	for <linux-doc@archiver.kernel.org>; Wed, 22 Feb 2023 12:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjBVMte (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 07:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjBVMtb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 07:49:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DEC29E34
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 04:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677070130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pwhafy9c9OVklvOu8fWr7CpmYP0sg2Cj0LDnB+q0JdQ=;
        b=MKlzp5MMrddKyDCiClF81dnGgh2GQniJQNvATqrPORj5p0dRre24EF1thvZ8dRKzvaCbv1
        MtpCVvJsYT5PeRxVpfsMFwHiHuuPG7O0w7sgffMIz49nGkQBEhgUzy3dCxOeNRroEqdG6J
        kn1QHv+R7QhYMuBR3KrLOCEiWICb/Q8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-yC4_3_61NByzTdmNpn1GFA-1; Wed, 22 Feb 2023 07:48:44 -0500
X-MC-Unique: yC4_3_61NByzTdmNpn1GFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B11E73C10690;
        Wed, 22 Feb 2023 12:48:43 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.227.52])
        by smtp.corp.redhat.com (Postfix) with SMTP id 24BD82026D38;
        Wed, 22 Feb 2023 12:48:40 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 22 Feb 2023 13:48:38 +0100 (CET)
Date:   Wed, 22 Feb 2023 13:48:35 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Gregory Price <gourry.memverge@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        avagin@gmail.com, peterz@infradead.org, luto@kernel.org,
        krisman@collabora.com, tglx@linutronix.de, corbet@lwn.net,
        shuah@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v11 2/2] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
Message-ID: <20230222124834.GA15591@redhat.com>
References: <20230221201740.2236-1-gregory.price@memverge.com>
 <20230221201740.2236-3-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221201740.2236-3-gregory.price@memverge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/21, Gregory Price wrote:
>
> +struct ptrace_sud_config {
> +	__u8  mode;
> +	__u8  pad[7];
              ^^^^^^
Why?

> +int syscall_user_dispatch_get_config(struct task_struct *task, unsigned long size,
> +		                     void __user *data)
> +{
> +	struct syscall_user_dispatch *sd = &task->syscall_dispatch;
> +	struct ptrace_sud_config config;
> +	if (size != sizeof(struct ptrace_sud_config))
> +		return -EINVAL;

Andrei, do we really need this check?

> +
> +	if (test_task_syscall_work(task, SYSCALL_USER_DISPATCH))
> +		config.mode = PR_SYS_DISPATCH_ON;
> +	else
> +		config.mode = PR_SYS_DISPATCH_OFF;
> +
> +	config.offset = sd->offset;
> +	config.len = sd->len;
> +	config.selector = (__u64)sd->selector;

As the kernel test robot reports, this is not -Wpointer-to-int-cast friendly.
Please use uintptr_t. See for example ptrace_get_rseq_configuration(). Same
for syscall_user_dispatch_set_config().

> +	if (copy_to_user(data, &config, sizeof(config))) {

This leaks info in (uninitialized) config.pad[]. You can probably simply make
config.mode __u64 as well.

Minor, but sizeof(struct ptrace_sud_config) above vs this sizeof(config)) doesn't
look consistent to me...

> +static int sys_ptrace(int request, pid_t pid, void *addr, void *data)
> +{
> +	return syscall(SYS_ptrace, request, pid, addr, data);
> +}

Why can't you simply use ptrace() ?

Oleg.

