Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48538C12002
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 23:48:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2391C613B2
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 23:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234101AbhGNXu5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 19:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhGNXu5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 19:50:57 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42502C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 16:48:05 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 70so803720pgh.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 16:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RYJwbh9KOD42Nf9grsOeUnqWk613NdX1cSceZQgmFzY=;
        b=la5Lzin/p9l6kMKFGi0nSnGoTD6/D3mcyh4lmt+Zx3MPG/CRQRg1LvlrPpYxvATPsH
         NltxhoZzZIIklEW1LExZH+14Um8mvy632/UM6d9us1de7T5yN7zFfDjsZX88Y3m5ncow
         Z8pjNyH1nXg7FY3zgD/vxEZRDlsUtERtYWTfkjVHxDsYFEa4cEFMp+Ks1BVr6Wi6zRkY
         PlCr8h5ooOIk5PADZpi2Nvo8AzjQHLSIbpnjaQSeL79IDJ9azobM6NlplSs0/zjxUN9Y
         VGLNeFK+YLgk/Gplp4Dlt6yPwlUvvUnmNOhl1PYuoJdbSZ2cIjamdnVMPAIfNxVtblGf
         97jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RYJwbh9KOD42Nf9grsOeUnqWk613NdX1cSceZQgmFzY=;
        b=S5jwruucRkqJlRUInJDE/qJEuUv63VHSY94iV66izDcHmwF6g5R5JZHHwYa65l47o4
         FS5KK++3fDBcQEIH9yGNoGebVY6uw9O3FWDrJpcbvmXgfVijy8T1rev1fFFtwl4B2ZMA
         gJsCGAv4VlQZCSQ50mvKGA2ggTao3yfuhXTiScv2gMo9IGN/+swBmcqH+8n0V8ezMpno
         bQbrB/u1/lowEu5YQnFzEkgAIuEJv07ir29rXuK8h1homk389NGX08J7XsozFiHgYsnV
         v7I0LqrQB00+S8k24GPOfziokk/IiwQQoK2NqU0HU4/zLrBue3TpLXAjeoKJAtF1sXnb
         3Y0A==
X-Gm-Message-State: AOAM532KZ7PUJYipH2CONretSoP0B4z5PaWSg4Hw9hNv2ANSbksN2Gkm
        YW6v33Hbj9EIQqU4NlsY8TLoesjMM9s9jo8spb0+Uw==
X-Google-Smtp-Source: ABdhPJwneGCuIIVoUCtM9q9uOOW140VZfTV5NbZkp/6lBrGpkRU0Bdxnv37+tn9M3sWDwBLiq5jWR9FnjE1VcTRpaKk=
X-Received: by 2002:a63:4c3:: with SMTP id 186mr587774pge.240.1626306484737;
 Wed, 14 Jul 2021 16:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714144830.29f9584878b04903079ef7eb@linux-foundation.org>
In-Reply-To: <20210714144830.29f9584878b04903079ef7eb@linux-foundation.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 14 Jul 2021 16:47:53 -0700
Message-ID: <CAPcyv4gotCqOnssJk6QzU9rXyfC+6qJi_4iDR5HkTUv9Waxqiw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mm, sparse-vmemmap: Introduce compound pagemaps
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Joao Martins <joao.m.martins@oracle.com>,
        Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 2:48 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 14 Jul 2021 20:35:28 +0100 Joao Martins <joao.m.martins@oracle.com> wrote:
>
> > This series, attempts at minimizing 'struct page' overhead by
> > pursuing a similar approach as Muchun Song series "Free some vmemmap
> > pages of hugetlb page"[0] but applied to devmap/ZONE_DEVICE which is now
> > in mmotm.
> >
> > [0] https://lore.kernel.org/linux-mm/20210308102807.59745-1-songmuchun@bytedance.com/
>
> [0] is now in mainline.
>
> This patch series looks like it'll clash significantly with the folio
> work and it is pretty thinly reviewed,

Sorry about that, I've promised Joao some final reviewed-by tags and
testing for a while, and the gears are turning now.

> so I think I'll take a pass for now.  Matthew, thoughts?

I'll defer to Matthew about folio collision, but I did not think this
compound page geometry setup for memremap_pages() would collide with
folios that want to clarify passing multi-order pages around the
kernel.

Joao is solving a long standing criticism of memremap_pages() usage
for PMEM where the page metadata is too large to fit in RAM and the
page array in PMEM is noticeably slower to pin for frequent
pin_user_pages() events.

memremap_pages() is a good first candidate for this solution given
it's pages never get handled by the page allocator. If anything it
allows folios to seep deeper into the DAX code as it knocks down the
"base-pages only" assumption of those paths.
