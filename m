Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C5AC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 23 Nov 2022 09:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236238AbiKWJwL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Nov 2022 04:52:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237122AbiKWJvB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 04:51:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D28A445
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669196854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/JvhkIMHaE9tMvv7uV8gHbGibKRYLhWKCV1r10ib1SI=;
        b=OpAaQbF0oiqGl3q99GKa3XBztE6GAx8QF9kNDhcSYrC2jfCZ+J+hJA1aFzwysuA/LxPBbI
        MnwbGYxyCL1AEm+qXn+BywXZxvteDq7R8c+a0JXtSKKjhiOGa1ZnguvzPMcz0f4PTLtVyJ
        iUYK3+Kzi8IdeeBWEEFYfEX0TIVIBzQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-wcLG9FRXPSiJz2FVZjmd8Q-1; Wed, 23 Nov 2022 04:47:31 -0500
X-MC-Unique: wcLG9FRXPSiJz2FVZjmd8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70B73C0E460;
        Wed, 23 Nov 2022 09:47:28 +0000 (UTC)
Received: from localhost (ovpn-13-118.pek2.redhat.com [10.72.13.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 054CB2166B31;
        Wed, 23 Nov 2022 09:47:27 +0000 (UTC)
Date:   Wed, 23 Nov 2022 17:47:20 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Eric Biederman <ebiederm@xmission.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        Ross Zwisler <zwisler@kernel.org>, linux-doc@vger.kernel.org,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 1/2] Documentation: sysctl: Correct kexec_load_disabled
Message-ID: <Y33sKLOwqjCc7Qwe@MiWiFi-R3L-srv>
References: <20221114-disable-kexec-reset-v1-0-fb51d20cf871@chromium.org>
 <20221114-disable-kexec-reset-v1-1-fb51d20cf871@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114-disable-kexec-reset-v1-1-fb51d20cf871@chromium.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/14/22 at 02:18pm, Ricardo Ribalda wrote:
> kexec_load_disabled affects both ``kexec_load`` and ``kexec_file_load``
> syscalls. Make it explicit.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 98d1b198b2b4..97394bd9d065 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -450,9 +450,10 @@ this allows system administrators to override the
>  kexec_load_disabled
>  ===================
>  
> -A toggle indicating if the ``kexec_load`` syscall has been disabled.
> -This value defaults to 0 (false: ``kexec_load`` enabled), but can be
> -set to 1 (true: ``kexec_load`` disabled).
> +A toggle indicating if the syscalls ``kexec_load`` and
> +``kexec_file_load`` have been disabled.
> +This value defaults to 0 (false: ``kexec_*load`` enabled), but can be
> +set to 1 (true: ``kexec_*load`` disabled).
>  Once true, kexec can no longer be used, and the toggle cannot be set
>  back to false.
>  This allows a kexec image to be loaded before disabling the syscall,

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> -- 
> b4 0.11.0-dev-d93f8
> 

