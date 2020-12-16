Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C9EC4361B
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 14:27:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3E2C233CF
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 14:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgLPO1Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Dec 2020 09:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgLPO1X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Dec 2020 09:27:23 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81850C0617A7
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 06:26:43 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id c79so16689563pfc.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 06:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8WM83lb97KepD4KmRISVDaNGwvKB/0GjjAaBayPIvpU=;
        b=S1E/ZV+vN0Og3JgNA5Cn2YIKeoGnmvTCR7g1K0s9BmGYSWT9bm3Lo/7FoFkWMma1K2
         1Z7WoG9TeNLxGvdJ1Iw+HNp4UlLHALLxVbgxXqTlAOKgFDkSDixhtHp387OBGRFtX2bb
         qAELSHEsUPqfmYUfnbrFyhBI9eFf0yZnVV5dnhvSiGIdPg14xVilijefMZDs11Mqq22X
         QGu/9UFgiA1GFT56dAQcleW+3L1Dkpc76FVUYGF/S8DqTYKO0uA3ouwbO/2sOakTjxHe
         yKX6FwYGPjvf5W+xuYPNCni/vKCLYAuvDTAL16QWeWaHr+aNaAn0JCo8/rtxkasVGt59
         RsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8WM83lb97KepD4KmRISVDaNGwvKB/0GjjAaBayPIvpU=;
        b=WHwxngW1WlvlXzYWwnOXBxv/bdQUxWs3nPGkPkjc4OS9+KmgY3fKLtOnaDZ3Cn6H3x
         qzpiclefBDGy7H6EEjgGVT834oFWpCd4SXh/NtZWTlVDPOuOk9fl7BPle49kW5P/l1kg
         R00tXBTiEeVYcqwihkdcICCzsshXr85gXCfvfb5xA9mG8dF7rIVkbEttVrqdRQ1EhWz/
         HqV3t7XqRCku1Wx+2A6JqYDlgoqL0uOIm0ByHEGUht+v5wg5kwqGAUu1ZzctI5ROm3ZT
         qSrH3pcnQ7HqKiaOY0kUImKumzuWYL3wwTSasv5F19+MurnxBSf2wvFGoa6UO+9EFSzM
         D7KQ==
X-Gm-Message-State: AOAM531i70QFHFRZxuU15/SUM32BcaIbUqdZI3Er0+LQ5fhW+XgHdszI
        3ewZgRR+9Werz5bMk9BAu2sBaOFWKMsE+2bzF30bLw==
X-Google-Smtp-Source: ABdhPJwce9/AVHptfdglalHmeS/eT0gVNrSN7cUYjB3PIyYd9xeIxzY1Ah23S9+RjgyIKSmckj4+gU1OpZezBIOgxmI=
X-Received: by 2002:a63:50a:: with SMTP id 10mr5249784pgf.273.1608128802894;
 Wed, 16 Dec 2020 06:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20201213154534.54826-1-songmuchun@bytedance.com>
 <20201213154534.54826-11-songmuchun@bytedance.com> <20201216140340.GE29394@linux>
In-Reply-To: <20201216140340.GE29394@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 16 Dec 2020 22:26:02 +0800
Message-ID: <CAMZfGtVq29N1Rysy+BL1N7dYW_3X3uCKG=mAXXZbsJw_nt=aBg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 10/11] mm/hugetlb: Gather discrete
 indexes of tail page
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 16, 2020 at 10:03 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Sun, Dec 13, 2020 at 11:45:33PM +0800, Muchun Song wrote:
> > For HugeTLB page, there are more metadata to save in the struct page.
> > But the head struct page cannot meet our needs, so we have to abuse
> > other tail struct page to store the metadata. In order to avoid
> > conflicts caused by subsequent use of more tail struct pages, we can
> > gather these discrete indexes of tail struct page. In this case, it
> > will be easier to add a new tail page index later.
> >
> > There are only (RESERVE_VMEMMAP_SIZE / sizeof(struct page)) struct
> > page structs can be used when CONFIG_HUGETLB_PAGE_FREE_VMEMMAP, so
> "that can be..."

Thanks.

>
> > add a BUILD_BUG_ON to catch invalid usage of the tail struct page.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>
> I think this makes the current situation with metadata usage in sub-pages
> easier to track.

Agree.

>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thank you.

>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
