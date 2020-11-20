Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2CFC63798
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 22:29:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2330B2408E
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 22:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G5VJUQua"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgKTW3z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 17:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgKTW3y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 17:29:54 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A521C061A04
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 14:29:54 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id v144so15587314lfa.13
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 14:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rN2oDMLkDXvF2d0qSHyE1KGJoI0coYurxX8BvFhI+bY=;
        b=G5VJUQuazvZ46rb86s40Pn6WkJ8vF48RjwI203WsXZ9Dd/97U9zAuv02njfWIOciBV
         QuSh0dRcRHb6kNB5R91cqfNYC3Nx6BskGC8Id4k04GJmqF+iTSL0z/vx19itSZMS+dny
         GX6UFvM4nLEOfv88ofsMR/2MQJp/CTfeCiBq4RMzNChRcKghzB+b2vhazIrHXFWol38n
         pfrMAxiWdO7fXF7LhFiySxUhhlwuVHmMt2IU2HAhlY57qt8oywDFoatbjiKMM0J1tI0a
         F2+QJ/feDTYc37U0EswhVkKC6ECmTYbgvZ1lbayAJ7xC0KxdUPr0mf9Jsvw5GLqRUrhv
         ttbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rN2oDMLkDXvF2d0qSHyE1KGJoI0coYurxX8BvFhI+bY=;
        b=Ac9LGYJ7DZVb6QXoiTJqS5JFDWl9S+87p8R3Rarcic/xZDT8196CrocB48uc8l4n+C
         cVQop9ZKsVs8IUvWKXsFm4Foch5hpXPx24JKXOFMCpI988vFnjOaVVwugLo8q34yretB
         TM2tmX7d42z+ULso1yZ9rXVGDq9QYq11OFGS7HwarPrD+mo156yVbK/+8kNnCIdzU8Tj
         NlDmWv/ANQAf6hi44S4WfCZStZKxvn3z7aQaBBgCuXnRbatlY1i9DZR2lTf55SNNW3bk
         E8yv+mgTowCFnXc7dGVuVfuIznDEGtD9j6onlMctym39TxYYA/+7rBdsAF+DBtBIbNms
         nt0Q==
X-Gm-Message-State: AOAM531gIriIZvKngsiFnVNmO7TN1smNVz8WDltc01Rydb/sy1j864WH
        mRrGO/6ZyRyshy0yr6JVYxFkh969MOK1oon1HltpLg==
X-Google-Smtp-Source: ABdhPJz7KhY3kkkWmPWTE7oEp1RrYqakWRzVBA4phAIJXfRGBYOb72PMtSpg2EcEFuNfIDhSB+mhcRErvgpdubnMvSw=
X-Received: by 2002:a19:686:: with SMTP id 128mr8504175lfg.198.1605911392397;
 Fri, 20 Nov 2020 14:29:52 -0800 (PST)
MIME-Version: 1.0
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
In-Reply-To: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 20 Nov 2020 23:29:25 +0100
Message-ID: <CAG48ez2VAu6oARGVZ+muDK9_6_38KVUTJf7utz5Nn=AsmN17nA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To:     "Catangiu, Adrian Costin" <acatan@amazon.com>
Cc:     "Graf (AWS), Alexander" <graf@amazon.de>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>, Willy Tarreau <w@1wt.eu>,
        "MacCarthaigh, Colm" <colmmacc@amazon.com>,
        Andy Lutomirski <luto@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        "Woodhouse, David" <dwmw@amazon.co.uk>,
        "bonzini@gnu.org" <bonzini@gnu.org>,
        "Singh, Balbir" <sblbir@amazon.com>,
        "Weiss, Radu" <raduweis@amazon.com>,
        "oridgar@gmail.com" <oridgar@gmail.com>,
        "ghammer@redhat.com" <ghammer@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Qemu Developers <qemu-devel@nongnu.org>,
        KVM list <kvm@vger.kernel.org>,
        Michal Hocko <mhocko@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Linux API <linux-api@vger.kernel.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        linux-s390 <linux-s390@vger.kernel.org>,
        "areber@redhat.com" <areber@redhat.com>,
        Pavel Emelyanov <ovzxemul@gmail.com>,
        Andrey Vagin <avagin@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
        "gil@azul.com" <gil@azul.com>,
        "asmehra@redhat.com" <asmehra@redhat.com>,
        "dgunigun@redhat.com" <dgunigun@redhat.com>,
        "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 16, 2020 at 4:35 PM Catangiu, Adrian Costin
<acatan@amazon.com> wrote:
> This patch is a driver that exposes a monotonic incremental Virtual
> Machine Generation u32 counter via a char-dev FS interface that
> provides sync and async VmGen counter updates notifications. It also
> provides VmGen counter retrieval and confirmation mechanisms.
>
> The hw provided UUID is not exposed to userspace, it is internally
> used by the driver to keep accounting for the exposed VmGen counter.
> The counter starts from zero when the driver is initialized and
> monotonically increments every time the hw UUID changes (the VM
> generation changes).
>
> On each hw UUID change, the new hypervisor-provided UUID is also fed
> to the kernel RNG.

As for v1:

Is there a reasonable usecase for the "confirmation" mechanism? It
doesn't seem very useful to me.

How do you envision integrating this with libraries that have to work
in restrictive seccomp sandboxes? If this was in the vDSO, that would
be much easier.
