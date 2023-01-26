Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68357C54EAA
	for <linux-doc@archiver.kernel.org>; Thu, 26 Jan 2023 19:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjAZTQU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Jan 2023 14:16:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjAZTQT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 14:16:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104AC5B59D
        for <linux-doc@vger.kernel.org>; Thu, 26 Jan 2023 11:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674760526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z/6NzXul2HEh42eixvs/tgvbhLjr/JPWRiufbihZODs=;
        b=f5NyZlG3Cgp0fYjcfzdwweufTINe7qhpmbexAE2KfXaNtFzEn+vlSASRRFHx+JOQsgBLKE
        xLX3rkewlIALd7BXpZz9ReG8ykVe9DkxVey4ZOVquK3pidNyncO1EXLqd4AWdcXjCH8anR
        tnrQPz/hr4S4m/RyOMyVHKwkbKTFU9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-UnlMdd_YM9eYwBW14uadDA-1; Thu, 26 Jan 2023 14:15:22 -0500
X-MC-Unique: UnlMdd_YM9eYwBW14uadDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DF8787B2A4;
        Thu, 26 Jan 2023 19:15:21 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (ovpn-194-60.brq.redhat.com [10.40.194.60])
        by smtp.corp.redhat.com (Postfix) with SMTP id ACBFAC15BA0;
        Thu, 26 Jan 2023 19:15:18 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 26 Jan 2023 20:15:18 +0100 (CET)
Date:   Thu, 26 Jan 2023 20:15:15 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Gregory Price <gourry.memverge@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        avagin@gmail.com, peterz@infradead.org, luto@kernel.org,
        krisman@collabora.com, tglx@linutronix.de, corbet@lwn.net,
        shuah@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v7 1/1] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
Message-ID: <20230126191515.GE4069@redhat.com>
References: <20230126190645.18341-1-gregory.price@memverge.com>
 <20230126190645.18341-2-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126190645.18341-2-gregory.price@memverge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/26, Gregory Price wrote:
>
> Implement ptrace getter/setter interface for syscall user dispatch.
>
> These prctl settings are presently write-only, making it impossible to
> implement transparent checkpoint/restore via software like CRIU.
>
> 'on_dispatch' field is not exposed because it is a kernel-internal
> only field that cannot be 'true' when returning to userland.
>
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> ---
>  .../admin-guide/syscall-user-dispatch.rst     |  5 ++-
>  include/linux/syscall_user_dispatch.h         | 18 +++++++++
>  include/uapi/linux/ptrace.h                   |  9 +++++
>  kernel/entry/syscall_user_dispatch.c          | 39 +++++++++++++++++++
>  kernel/ptrace.c                               |  9 +++++
>  5 files changed, 79 insertions(+), 1 deletion(-)

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

