Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10468C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 07:07:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECF9E61165
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 07:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbhG0HHF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 03:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbhG0HHE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 03:07:04 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC08C061760
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 00:07:05 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id a20so14952771plm.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gRjmuFZcr1eSBhne8H1SLkdS9f3pbpxDfvMvPpPvFP0=;
        b=QVKjfGbnR32GQUbYrb6/qb02GRpzHi9VNov+FPkEVRqZbbTln2gnlOjt/KDtwrgpmY
         gIidgwAaLE031GY6D8OFlM0j6U2Tf2sgXS0Piy4FXlomGU9Ya80l1TYPpDFrPtXkTI/W
         85YIrUuynRlJLHxRXZBjbUjpN46eZ5i4rWaZYCn9C7SzdAYsHC5MAvE6rkmwODO4dFzZ
         ue5LVdvewkWM4k/MoHyDebVQYTAhgS/raO1/5MgHNVMJQiniyIhGaHqmUPkwFtA6hY5F
         gHxeVmKuafAmtwW7BcV0yJgnMD+49AeuMOmI0tJ9Iud9pkJXF5OP368UOMpW8N8eD3KZ
         2wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gRjmuFZcr1eSBhne8H1SLkdS9f3pbpxDfvMvPpPvFP0=;
        b=PGWf29eWyqWhcZ4TCC5W1DfvG9zG3qadyQJgEWi7EK/cyc/u4SVnDgZIj72UGNeclc
         i84pIE+PMI/1+W3jNBLRf9dujJE9+vlCd/75Crex6iGUOWS/tU6EAks+MyFw4xpe571k
         xv9tJmA+qb2flFoFTxKEKxuD6paaY3tuoM0CCvpI0nO+RxyEREg6z1A0yM10/CLg4CDy
         HZTPLX8DAlJ4Nm5hujs05ZJt/4IBdCL80skTFBK3DUZOgV4ayxTXF5Tn4v8EIjF+tQ+v
         HMXv74NC0nwSqz9km2Vl9texWZCFPbh4oQH76fEc+1qn712OpzrC5oHqPQFpkjU54evz
         TrQQ==
X-Gm-Message-State: AOAM533I/IZtQOegU2fhx9O11v9UH8P4ksjkPWYs9rrNU3+KWx6McXeT
        +yJxnD6CLaELBAj3ncMEsB9g1yjW/B8aiAI4rRKQ4Q==
X-Google-Smtp-Source: ABdhPJy8do4w5yZuxEKWkVW2eIwgAICsoVJlX2vijoDLzxx/qmuCAGdDgTq3YZ45HD/oPkf72lUMiVSB1BGuPgiLwdw=
X-Received: by 2002:a17:90a:4894:: with SMTP id b20mr1818416pjh.13.1627369624969;
 Tue, 27 Jul 2021 00:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210714091800.42645-1-songmuchun@bytedance.com>
 <20210714091800.42645-3-songmuchun@bytedance.com> <fea1d845-209a-e2d5-6fcc-dbf17c949861@oracle.com>
In-Reply-To: <fea1d845-209a-e2d5-6fcc-dbf17c949861@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 27 Jul 2021 15:06:28 +0800
Message-ID: <CAMZfGtUaSsfjf4HSCsHMHFNxVaGrTXjVqE5iExM8JkMJPx169g@mail.gmail.com>
Subject: Re: [PATCH 2/5] mm: introduce save_page_flags to cooperate with show_page_flags
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 27, 2021 at 7:18 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 7/14/21 2:17 AM, Muchun Song wrote:
> > Introduce save_page_flags to return the page flags which can cooperate
> > with show_page_flags. If we want to hihe some page flags from users, it
> > will be useful to alter save_page_flags directly. This is a preparation
> > for the next patch to hide some page flags from users.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  include/trace/events/mmflags.h  | 3 +++
> >  include/trace/events/page_ref.h | 8 ++++----
> >  2 files changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
> > index 390270e00a1d..69cb84b1257e 100644
> > --- a/include/trace/events/mmflags.h
> > +++ b/include/trace/events/mmflags.h
> > @@ -121,6 +121,9 @@ IF_HAVE_PG_IDLE(PG_idle,          "idle"          )               \
> >  IF_HAVE_PG_ARCH_2(PG_arch_2,         "arch_2"        )               \
> >  IF_HAVE_PG_SKIP_KASAN_POISON(PG_skip_kasan_poison, "skip_kasan_poison")
> >
> > +#define save_page_flags(page)                                                \
> > +     (((page)->flags & ~PAGEFLAGS_MASK))
> > +
>
> Looking ahead to the next patch, this is changed to hide the PG_head
> flag for 'fake' head pages.
>
> IIRC, all vmemmap pages except the first will be mapped read only.  So,
> all vmemmap pages with 'fake' head pages will be read only.
>
> It seems that all the modified trace events below are associated with
> updates to page structs.  Therefore, it seems these events will never
> experience a 'fake' head page.  Am I missing something?

Totally right. I didn't realize this point before. We cannot see a fake page
struct in page refcount tracing. So this patch is definitely pointless. I'll
drop it in the next version. Thanks Mike.


>
> --
> Mike Kravetz
