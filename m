Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129F3C001B0
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jul 2023 17:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbjGGREk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 13:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbjGGREj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 13:04:39 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855EA268A
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 10:04:33 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso34475111fa.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 10:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688749472; x=1691341472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIecGmLz1MlH+va/QFWif8XrmmDnlbqD98dJPxGNA64=;
        b=OwYvnUtjF7ahSmumagnned4jibeNbglj/gEaLa7engmpvPADf/SqNog7qaoecsz+bz
         qg272OVvIl8aMDi2KbW3ytwr+UPSdYA5SP9MrudFeKxwLWHZXx2effACfixn4ba85enw
         jBzBE2qnFUSmNTgX6U7Rp+WH0qJkZGnEiVFAnG0FwyYy2ejrUbraUHaWx8bWzt9WBJQn
         Dk2zXG2eO0XAU7pPdSQ/XuKdulSawH0pxfHmrCBkgLzQSjv3yCseholEErz9vmDBgBmh
         0yJAAlFBtczoky1ZBsx/izYr7EvqD7ojK8IrH0KhnBB/E8GbnkJG5VUMhWejXA2emDIV
         LoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688749472; x=1691341472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIecGmLz1MlH+va/QFWif8XrmmDnlbqD98dJPxGNA64=;
        b=C8UO0OKrXwyx0YOn8Y8+3y3YBrNjAhwUGkdLTQIWQqJMHU0ZG/bamce7v/7m46fcIQ
         xHHTXF+2r9cass7+dUTZjYeZxD4k0Mw3Ljg5UdsSYJSKijLgZ5XvG4rVbnWvH6GoOJgr
         uSSNqeRkSCgUtw83MTJSEqtp8O4sCf97UIUa97rxP1NgSczOcmo4QxbBA4BBz1X+5sUI
         atOkhhNZCUwz1+Y3eOQlmDcXpX+6doeE8x4LDyKvVk7mikuFFzM1FSCfwL5/N8ML3ngF
         gyy6ZNnmSfiLyvRxeBAt+mlC6UGsA6ITBebu07YOb8aNiCf3lYbOA+xzKUUd3Us/AM2Z
         S0ZQ==
X-Gm-Message-State: ABy/qLay4PojNSvtS606GHTPyVgWQqYWSsCV2gNqTETgc36pVgpQUlD6
        EJoJS1lB8eQxY9hF0hMdGo+ArmfouDHiVborArZ4pg==
X-Google-Smtp-Source: APBJJlE+uUzC9dQYc/1nYMgq7EH9eX449paNaogkV+J1Pnfqq+ImNuTvrVj3o/GwqoxD3e2JidduSFie88A3cb/Pa/w=
X-Received: by 2002:a2e:9b15:0:b0:2b6:d8cf:2f44 with SMTP id
 u21-20020a2e9b15000000b002b6d8cf2f44mr4204788lji.13.1688749471534; Fri, 07
 Jul 2023 10:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230706225037.1164380-1-axelrasmussen@google.com>
 <20230706225037.1164380-8-axelrasmussen@google.com> <ZKgWOYuIdqa25Qcs@x1n>
In-Reply-To: <ZKgWOYuIdqa25Qcs@x1n>
From:   Axel Rasmussen <axelrasmussen@google.com>
Date:   Fri, 7 Jul 2023 10:03:55 -0700
Message-ID: <CAJHvVcj-3gUC3dx4LAVnNr-zgo8+cwjGNafQ480EhDifojrcRA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] selftests/mm: refactor uffd_poll_thread to allow
 custom fault handlers
To:     Peter Xu <peterx@redhat.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Geffon <bgeffon@google.com>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Shuah Khan <shuah@kernel.org>,
        Suleiman Souhlal <suleiman@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "T.J. Alumbaugh" <talumbau@google.com>,
        Yu Zhao <yuzhao@google.com>,
        ZhangPeng <zhangpeng362@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 7, 2023 at 6:42=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jul 06, 2023 at 03:50:35PM -0700, Axel Rasmussen wrote:
> > @@ -247,9 +245,13 @@ static int userfaultfd_stress(void)
> >  {
> >       void *area;
> >       unsigned long nr;
> > -     struct uffd_args args[nr_cpus];
> > +     struct uffd_args *args;
> >       uint64_t mem_size =3D nr_pages * page_size;
> >
> > +     args =3D calloc(nr_cpus, sizeof(struct uffd_args));
> > +     if (!args)
> > +             err("allocating args array failed");
>
> This is trivial, but I think I requested a "free" (or keep it allocate on
> stack) in previous version but it didn't get a response on why we cannot
> and it kept going..  could you help explain?

Oh, sorry! I had meant to change this after our discussion, and simply
overlooked it while reworking the patches.

I'll include this change in a v4 which also addresses e.g. the
comments on commit 1.

>
> --
> Peter Xu
>
