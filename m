Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB63C43217
	for <linux-doc@archiver.kernel.org>; Tue, 26 Apr 2022 16:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352754AbiDZQEP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Apr 2022 12:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352824AbiDZQEM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Apr 2022 12:04:12 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F677B852
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 09:01:03 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id 125so20520762iov.10
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dyCNcdxP+OP+ZEEDkKpS4dIut/dFXRkxuAQItAbC2hk=;
        b=kkI2HO5/ZEBb6dwCosEFba8Hqs93phXW7y7LQIwDiDweskbxzWfkhJOxUXgbksafGv
         Cj9I3+VUsMtqzbQ+FRheYG7Jnp0nCQoqCtylg9A9uVvjFZFE+gYUol4vZnJS8L/D7fcH
         IXLA9h7oaFPNuHm4FrQjgkuQGxMTT+zn4y0Dc3ZUaMQ6grfstTlV1uURhTu7yZhAB2CR
         S15Az/6PGwq5RzEtyE76iZSrukPtIepHVy15uTIKCKRfoQGMqwl6nQ2Wcrtywgqq4l9K
         yrTT7rEccOM0wyFm2LgURZQ9atXRmAewK37yNCUoS/4n8PFFGhjVqFY7J9psP2v3Z2G9
         KjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dyCNcdxP+OP+ZEEDkKpS4dIut/dFXRkxuAQItAbC2hk=;
        b=lj3ZXfzC5jbxSR06Jds3YsToQ+m7QQOEedZ9r4rhkZhgdydjyuVdbce1xSRw5x5Goe
         2WYeKmRyXV6WVfrJa1QDmF5/mtVJBpNDogey9Ppa8/nUh/FTWBnjq8zPttxsN2WZgFuu
         5MhXH7O+hahPg3EaqBD2ZgTCBKrPV8B0GnLpG00sMmCnUBSBcRziRCORMK1OznZlhaql
         /X/0h9NLHlImyJJcp4glER/DfLnwXMAS5k5wLUJWBQ7SuriUagjP2eRNJM+s1ma5018P
         pGn+gjl5Qs67tMGYLz/9fk1SlRMZMArzTcQ/iVSQ8t2TQkF8BxM3ei9EfiZAKBNc/ABY
         Bmww==
X-Gm-Message-State: AOAM532C5vzhI+0D6F0fCC8fXdI1cO/CUJrK+ELwsaF9mWqiM7d7ghLP
        +gbA9XbbhMJrYSRXO/1AEq3Ha0/wkAz5ok9RVVUNrg==
X-Google-Smtp-Source: ABdhPJy2p2YsSAWaLRUyeCx9GIenmVZnYXSr1zBWwbH2S+IZQF4NN6DuvWqwwrbZ5neEqlH8OPqJygq6V4YSc9feqz0=
X-Received: by 2002:a05:6638:1695:b0:32a:a178:98bc with SMTP id
 f21-20020a056638169500b0032aa17898bcmr10205311jat.167.1650988862310; Tue, 26
 Apr 2022 09:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220422212945.2227722-1-axelrasmussen@google.com>
 <20220422212945.2227722-3-axelrasmussen@google.com> <20220425203249.GA5814@altlinux.org>
In-Reply-To: <20220425203249.GA5814@altlinux.org>
From:   Axel Rasmussen <axelrasmussen@google.com>
Date:   Tue, 26 Apr 2022 09:00:26 -0700
Message-ID: <CAJHvVchLSpbKXn6u451pjaRpW=SwbOFSdpQpaC47WBFa0660xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] userfaultfd: add /dev/userfaultfd for fine grained
 access control
To:     "Dmitry V. Levin" <ldv@altlinux.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Charan Teja Reddy <charante@codeaurora.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
        Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        zhangyi <yi.zhang@huawei.com>, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

You're right, [1] says _IO is appropriate for ioctls which only take
an integer argument. I'll send a v3 with this fix, although I might
wait a bit for any other review comments before doing so. Thanks for
taking a look!

https://www.kernel.org/doc/html/latest/driver-api/ioctl.html

On Mon, Apr 25, 2022 at 1:32 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> On Fri, Apr 22, 2022 at 02:29:41PM -0700, Axel Rasmussen wrote:
> [...]
> > --- a/include/uapi/linux/userfaultfd.h
> > +++ b/include/uapi/linux/userfaultfd.h
> > @@ -12,6 +12,10 @@
> >
> >  #include <linux/types.h>
> >
> > +/* ioctls for /dev/userfaultfd */
> > +#define USERFAULTFD_IOC 0xAA
> > +#define USERFAULTFD_IOC_NEW _IOWR(USERFAULTFD_IOC, 0x00, int)
>
> Why this new ioctl is defined using _IOWR()?  Since it neither reads from
> user memory nor writes into user memory, it should rather be defined using
> _IO(), shouldn't it?
>
>
> --
> ldv
