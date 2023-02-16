Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D2AC636CC
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 13:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjBPN6f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 08:58:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjBPN6e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 08:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F066240ED
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676555868;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YnxDLMWCCiMGyvneSFxls7U85vzv18A/rrjPRaBLYi4=;
        b=ArSkjEfoAVFlZDWty8OWQTXg/PltF6yMk0jT2NdYZ72ZwVRlGwL9McwtUYM5ZrqTUzmDHE
        5ab4x4Rn9RGJ/JjGcfGPedYRP/wxJY3UYkI6JcXPKtBxI/4U6eNoMgJjlFMF7UCf4NijEJ
        6R0CQS4+8xC60vvHbQHE6PJbotDOziU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-zkewakoCOiGPe08EjN_aTQ-1; Thu, 16 Feb 2023 08:57:45 -0500
X-MC-Unique: zkewakoCOiGPe08EjN_aTQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 116E480D0E0;
        Thu, 16 Feb 2023 13:57:45 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (ovpn-193-101.brq.redhat.com [10.40.193.101])
        by smtp.corp.redhat.com (Postfix) with SMTP id 6B765492B0E;
        Thu, 16 Feb 2023 13:57:42 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 16 Feb 2023 14:57:41 +0100 (CET)
Date:   Thu, 16 Feb 2023 14:57:38 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Gregory Price <gourry.memverge@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        avagin@gmail.com, peterz@infradead.org, luto@kernel.org,
        krisman@collabora.com, tglx@linutronix.de, corbet@lwn.net,
        shuah@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH 2/2] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
Message-ID: <20230216135737.GC5200@redhat.com>
References: <20230214085215.106708-1-gregory.price@memverge.com>
 <20230214085215.106708-3-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214085215.106708-3-gregory.price@memverge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/14, Gregory Price wrote:
>
> +struct compat_ptrace_sud_config {
> +        compat_ulong_t mode;
> +        compat_uptr_t selector;
> +        compat_ulong_t offset;
> +        compat_ulong_t len;
> +};

...

> +int syscall_user_dispatch_get_config(struct task_struct *task, unsigned long size,
> +		                     void __user *data)
> +{
> +	struct syscall_user_dispatch *sd = &task->syscall_dispatch;
> +#ifdef CONFIG_COMPAT
> +	if (unlikely(in_compat_syscall())) {
> +		struct compat_ptrace_sud_config cfg32;
> +
> +		if (size != sizeof(struct compat_ptrace_sud_config))
> +			return -EINVAL;
> +

Horror ;) why?

See my reply to v9, just make

	struct ptrace_sud_config {
		__u8  mode;
		__u64 selector;
		__u64 offset;
		__u64 len;
	};

Oleg.

