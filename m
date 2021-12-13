Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AA1C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 13 Dec 2021 20:10:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbhLMUK3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Dec 2021 15:10:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33888 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233617AbhLMUK2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Dec 2021 15:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639426228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=98410SCY73aKt24LcVMxqvWF7akIYNbHy7o+glUPBM4=;
        b=JQM+2SNRVQLxk0m3dCELXvJupEXT4BC4PtRnn8oShbWOPjXc2XIiMABtayBh5nwnvvq7nP
        Yqdlo/Bn2vI45BbWJNQT4NwxLvEm4QOkI25bdURsJgb5xiXWz4HOeGN232AYgYdOikC1k6
        CBuXcMNCN10I+2ZJ2QMVXs9Nx4FlnMw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-n1lWkPEVMOWsIWtwA0f8DQ-1; Mon, 13 Dec 2021 15:10:27 -0500
X-MC-Unique: n1lWkPEVMOWsIWtwA0f8DQ-1
Received: by mail-oi1-f200.google.com with SMTP id p186-20020aca42c3000000b002bc99d2b74aso11568855oia.18
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 12:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=98410SCY73aKt24LcVMxqvWF7akIYNbHy7o+glUPBM4=;
        b=NQFS5ZErubpRzmP+gPA7oBITVi4zDQJc8US3cSnR8CkwKqXwrObvMt54rUYj6Tcx3W
         5H92iGOY9qkqcTKR7NmfX0/qZxD5bcyxAfXFBpLveKgz20IPgtN14MxkiKo1CQbRJ4PN
         gHvh+Px6/LyH8Cr+7iwxS+x+h8nxDSGLzTa2MBCCk4OSQ9NFPrlPbAznhQqpGO5kvFVK
         AsQMbdnhThItFCsAJyuvo83ToRPQ70oyiRe0NxZvLNCyoQuJkI/kdlAQ6OPUc/2Pl935
         s3L9fdfYUAqCTRAjGFFiODkqkqb12zmdYFxwGF2lvEfRcSi65VqHgm9+G4R7bhwv+LK6
         cXPQ==
X-Gm-Message-State: AOAM531JBG3MISoEGNas5AthGAAQhNq76su9nGr+t5xbGxgVp/3fjkb9
        OBs8XMPd4hiOEncdzDZWGK30TSLg3TrYt1yl4UWzQFBxFuDqUNzV0lFspZFH95k0n3/OtswRr70
        v+S1tz5efkRXcQY2LNkKD
X-Received: by 2002:a4a:d184:: with SMTP id j4mr448476oor.72.1639426226195;
        Mon, 13 Dec 2021 12:10:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdF5hmqnDtiL8k0ufA6KXBZMr+XhxgtNNHlmdJ9hKuUpIpa3M2DrnM0v+LSkj9mIo3zup2qw==
X-Received: by 2002:a4a:d184:: with SMTP id j4mr448461oor.72.1639426225935;
        Mon, 13 Dec 2021 12:10:25 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::49])
        by smtp.gmail.com with ESMTPSA id h14sm2392996ots.22.2021.12.13.12.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:10:25 -0800 (PST)
Date:   Mon, 13 Dec 2021 12:10:22 -0800
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     David Vernet <void@manifault.com>
Cc:     pmladek@suse.com, linux-doc@vger.kernel.org,
        live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        jikos@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
        corbet@lwn.net, yhs@fb.com, songliubraving@fb.com
Subject: Re: [PATCH] livepatch: Fix leak on klp_init_patch_early failure path
Message-ID: <20211213201022.dhalhtc2bpey55gh@treble>
References: <20211213191734.3238783-1-void@manifault.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211213191734.3238783-1-void@manifault.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 13, 2021 at 11:17:35AM -0800, David Vernet wrote:
> When enabling a KLP patch with `klp_enable_patch`, we invoke
> `klp_init_patch_early` to initialize the kobjects for the patch itself, as
> well as the `struct klp_object*`'s and `struct klp_func*`'s that comprise
> it. However, there are some paths where we may fail to do an
> early-initialization of an object or its functions if certain conditions
> are not met, such as an object having a `NULL` funcs pointer. In these
> paths, we may currently leak the `struct klp_patch*`'s kobject, as well as
> any of its objects or functions, as we don't free the patch in
> `klp_enable_patch` if `klp_init_patch_early` returns an error code. For
> example, if we added the following object entry to the sample livepatch
> code, it would cause us to leak the vmlinux `klp_object`, and its `struct
> klp_func` which updates `cmdline_proc_show`:
> 
> ```
> static struct klp_object objs[] = {
>         {
>                 .name = "kvm",
>         }, { }
> };
> ```
> 
> Without this change, if we enable `CONFIG_DEBUG_KOBJECT` and try to `kpatch
> load livepatch-sample.ko`, we don't observe the kobjects being released
> (though of course we do observe `insmod` failing to insert the module).
> With the change, we do observe that the `kobject` for the patch and its
> `vmlinux` object are released.
> 
> Signed-off-by: David Vernet <void@manifault.com>

Thanks for reporting the issue and submitting the patch!

The patch description needs a few tweaks.  In the kernel we don't use
Markdown for patch descriptions.

A function can be postfixed with a trailing pair of parentheses, like
klp_enable_patch().

Other symbols can be enclosed with single quotes, like 'struct
klp_object'.

I'd also recommend avoiding the excessive use of "we", in favor of more
imperative-type language.

See Documentation/process/submitting-patches.rst for more details.  It's
also a good idea to look at some kernel commit logs to get a general
idea of the kernel patch description style.

> @@ -1052,10 +1052,7 @@ int klp_enable_patch(struct klp_patch *patch)
>  	}
>  
>  	ret = klp_init_patch_early(patch);
> -	if (ret) {
> -		mutex_unlock(&klp_mutex);
> -		return ret;
> -	}
> +		goto err;
>  
>  	ret = klp_init_patch(patch);
>  	if (ret)

I don't think the fix will be quite that simple.  For example, if
klp_init_patch_early() fails, that means try_module_get() hasn't been
done, so klp_free_patch_finish() will wrongly do a module_put().

-- 
Josh

