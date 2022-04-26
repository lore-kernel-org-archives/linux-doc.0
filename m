Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3F1C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 26 Apr 2022 21:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355514AbiDZVhP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Apr 2022 17:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351810AbiDZVhO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Apr 2022 17:37:14 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FBD1A5DCF
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 14:34:04 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id f4so281016iov.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 14:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJHneikLXEGfJde4krQasd9PQhsFRpApoS4ZRag7+RU=;
        b=EdwxR0V/0R58E5VQDj0HrytGDcfRa0ZaI7Me6rDBjirAgNHRbWWWvGaw7HmQEIGzu+
         8UTTpBJpVmtohKiGL5cVYIq8PicWJvFUQVly2vSP4TS+56W86k/aX6l5WCrdoFzyILM+
         1Yehf40AqvUszrZodWCBswvT50v8vrsYb0CT9VT0ik1assb3s50rjI/Ghc6ERMC0+hQS
         kngQQpUrenrx0Z/CG7kuYI7vOHHB9pxCvklytawOfmTdu9cTLRddizluzNirEjBtvgHq
         /7wjZvrPSoiAuTCiyBqcBwBGz7SjzYicglmkQ0p2ZcHJZmj17y1/IkCZAoejAg68UMHJ
         xOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJHneikLXEGfJde4krQasd9PQhsFRpApoS4ZRag7+RU=;
        b=LXGIp6aIaCLhFxa8QdGM6+//jXs4CZeQOlnpa49MpDbGQaVA6H4naOLneB+iXlHVHa
         HrRn+LvMcyUkNz3ncgE4nFvd9HZoVKAB399xRKQT2uHGfyCZF7e56ndG9WZMprbHi6i/
         g6bRaa4LqNSYlN+ue15eKLBGGje0ZvJzGMlGLsEnaJiEm2FpdlIcZn9dkl2mFVNYgtcK
         VGso/BZGYF5yEruLE0+zXQJCFLUyfHSierp2QNNWJkfCB/l8SJ8AStHK7alcJWP32ivf
         RCwzBsNhttZ+2kQM40PfXnEPZWmDhY6y7faI2ZthptGv7OobyivhJKHgV0dlEQDbbgwk
         ciig==
X-Gm-Message-State: AOAM532o0uL/PfLm+99TcUWKZYDDuoeQkTJzqrZvhuNXjRXlDQodFA/S
        ituFzrnelFj7Z0kdj9EUaZGlYqhYenRpQI8OQ29C9g==
X-Google-Smtp-Source: ABdhPJyGNR5sOXzGqUeKg6keEazd9H9Z8L/jAzBgMCoHI+lyyK7gNjS+2erCu0X4dzgJTpnr7YSLg3mNpJ5fsfcJHI0=
X-Received: by 2002:a5d:9448:0:b0:657:24e0:c0b2 with SMTP id
 x8-20020a5d9448000000b0065724e0c0b2mr10388348ior.167.1651008843696; Tue, 26
 Apr 2022 14:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220422212945.2227722-1-axelrasmussen@google.com>
 <20220422212945.2227722-3-axelrasmussen@google.com> <YmhW+mOuQUWsByj4@xz-m1.local>
In-Reply-To: <YmhW+mOuQUWsByj4@xz-m1.local>
From:   Axel Rasmussen <axelrasmussen@google.com>
Date:   Tue, 26 Apr 2022 14:33:27 -0700
Message-ID: <CAJHvVch=8znnY-u1PbPb1qUeczn+9AR_eZOP5z9kD6PgtPQjrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] userfaultfd: add /dev/userfaultfd for fine grained
 access control
To:     Peter Xu <peterx@redhat.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Charan Teja Reddy <charante@codeaurora.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
        Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        zhangyi <yi.zhang@huawei.com>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 26, 2022 at 1:33 PM Peter Xu <peterx@redhat.com> wrote:
>
> Axel,
>
> On Fri, Apr 22, 2022 at 02:29:41PM -0700, Axel Rasmussen wrote:
> > @@ -65,6 +66,8 @@ struct userfaultfd_ctx {
> >       unsigned int flags;
> >       /* features requested from the userspace */
> >       unsigned int features;
> > +     /* whether or not to handle kernel faults */
> > +     bool handle_kernel_faults;
>
> Could you help explain why we need this bool?  I failed to figure out
> myself on the difference against "!(ctx->flags & UFFD_USER_MODE_ONLY)".

Ah, yeah you're right, we can get rid of it and just rely on
UFFD_USER_MODE_ONLY.

Just to add context, in a previous version I never sent out, I had:

ctx->handle_kernel_faults = userfaultfd_allowed(...);

That's wrong for other reasons, but if we were going to do that we'd
have to store the result, since it's a function not just of the flags,
but also of the method used to create the userfaultfd. I changed this
without also dropping the boolean, which can now be cleaned up. I'll
include this change in a v3.

>
> Thanks,
>
> --
> Peter Xu
>
