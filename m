Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09D3EB64D9
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 17:09:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbjGJRJE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 13:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGJRJD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 13:09:03 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1DDD7
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 10:09:01 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-992af8b3b1bso623971366b.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 10:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689008940; x=1691600940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUzXCzHDtsBOWe+bKKtFjsi637OpN1F95ddxn0q8hxY=;
        b=PZWAQvpHgPUSANsJa/B9f1rPlQFnV0lh6zBRJrDKvXAaRtN8UcvT77e7VwVxB8azXj
         vDvRukLJK+z8JLzRjyWyQwDKx65b1IgIvSgluiZN4A8POF7IxxDqw+1u22PtdDUku9yN
         z/woIJ7FIQKPCG69WzPC7n74uXh0F946sDTkFhrXCXKEUpWXwklt7jyXIFzNlare6RI5
         Sge3/7A4SQyi1NQS0dnC/BnMMnw9V1Jz8rt7j2rA0KA0gjm0FVeYuN+l3H0wWCsvJtKv
         vbGg3qDhRcmp5+4JZ3VsXON1sj4ZLdbKSGUoJkrMHC9WAymYQL1jEAu9Wmukq20Mx74A
         p0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689008940; x=1691600940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUzXCzHDtsBOWe+bKKtFjsi637OpN1F95ddxn0q8hxY=;
        b=WZyPI+wZ4DUh71wy6Exe5upXSZAUL9EuXXRSLKHMWxD1G4+TW6J0rd4ktO71cj8W4T
         IdpBhTkpxu1tHCuYTFgI4k4OpJjfW23PxoreiYQ1UcEhRt8S/QoAvEHkJhSV2/rWnGks
         jEVYU+YEuKagEMqmpFRu836+XSopC49fi1qsHvtAMzFphpzvGFGB4nXRviYOe68WwfEz
         AlDDBTzGw3yRpvVyLV9nwrAo42oAGyrjLBvTDXRnreDZzFIn+JFCFCoPAyS8USKFUcZw
         /jCEj8jQnp7nlL3xAQWdS/6FHDOrJ1L7ToRheZfOm7Upy9+cnaqYf63KEe+2JL6Jp5zw
         svIA==
X-Gm-Message-State: ABy/qLYP5AbigFnf8Vf5GtjWuoj54Zc6M+V/4yHFtfAAm2yXj/MLJyuC
        KSrJlIxDBFX0cUgQ/9tDmC6jy4Z3R0wMN2O2QfhNjQ==
X-Google-Smtp-Source: APBJJlGFB6b2OLnR3LAAjVZGXplbgux6d184o3SoKq+5qcCfCog9p7d/Ua6PLTtc9pZOhfiKD7DuelWLIJitDb5PJ4s=
X-Received: by 2002:a17:907:7f89:b0:98d:cacb:888f with SMTP id
 qk9-20020a1709077f8900b0098dcacb888fmr18460583ejc.49.1689008940175; Mon, 10
 Jul 2023 10:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230707215540.2324998-1-axelrasmussen@google.com>
 <20230707215540.2324998-8-axelrasmussen@google.com> <ZKl6ie4s/94TPCgm@xz-m1.local>
In-Reply-To: <ZKl6ie4s/94TPCgm@xz-m1.local>
From:   Axel Rasmussen <axelrasmussen@google.com>
Date:   Mon, 10 Jul 2023 10:08:24 -0700
Message-ID: <CAJHvVch+1TUqtW=EvA92u21axcEr9uhcuXhyLmCoh=38TB=GSg@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] selftests/mm: refactor uffd_poll_thread to allow
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

On Sat, Jul 8, 2023 at 8:02=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Jul 07, 2023 at 02:55:39PM -0700, Axel Rasmussen wrote:
> > Previously, we had "one fault handler to rule them all", which used
> > several branches to deal with all of the scenarios required by all of
> > the various tests.
> >
> > In upcoming patches, I plan to add a new test, which has its own
> > slightly different fault handling logic. Instead of continuing to add
> > cruft to the existing fault handler, let's allow tests to define custom
> > ones, separate from other tests.
> >
> > Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
>
> Acked-by: Peter Xu <peterx@redhat.com>
>
> PS: please remember to update manpage after it lands.  I still have a pla=
n
> to update but not yet happening; if you happen to update before mine plea=
se
> feel free to update for whatever is missing.

Will do!

>
> Thanks!
>
> --
> Peter Xu
>
