Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32250C12002
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 00:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10AE4613CC
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 00:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbhGOAWU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 20:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhGOAWU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 20:22:20 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6185CC06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 17:19:28 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id d12so4220983pgd.9
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 17:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xptbCn3ZR6g3HHgjV/Xny4YP8XtafdWsr2mlA0mT64U=;
        b=pZ57OUfv/A3XPbSrq8TjPCfFK38KeIBp1cKqaCSFN7yDgtXstzslwp1/cg/MWnHAEN
         rvjpTla6Pmpq+QRIYprdqlOiFG+xlEpnftL5MubgNlUfRXI/50E22pRThISLKzQGRm91
         T426iHag7KVqecSn8VNEwbN+5H/YssX5MBL3Lf4IOMmgmarVnbvUs5tDpeDxOvutdR/2
         4FtpgUIAtm8XwgdS+VjlbErD6HSB3EBM1TxTVba/7RdwqO/s60/OwiwcJ3DT1FrJLgo/
         p5gBF+iuRXGZFPtm6NkAULS/PPMWaoMovxzzinqrf0SdnpMx+VQdMsRihIB7dDSamVvh
         7b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xptbCn3ZR6g3HHgjV/Xny4YP8XtafdWsr2mlA0mT64U=;
        b=loVlvXtTW42UfMg2RUfjTGWcjcv+5eN23xilPU49bZ3o1k9ts3XGuc7F38z6e2oE83
         jCNEZO9OHjIF4Clv6qyMjOdG+jbTJ/1PQfKreYIgSiyAFYPDqU40oG7nniASmXAna5FQ
         S2ctIIiUhyYNkQT1Qwh8quLXe/6G9DjwddVwXiF0MSqkO7Zd9aDgEm5FCKDP3ZHp48+V
         2N2mHJKqXrQRgTinHOeVDwsAlWABz5yWS/8eBtLAy+02W6yBomvrUCdb5bGxT6lDpv8q
         40ooCELkPO7MpES5A6Ib+Z7Zh2f8hDRmqMDw8OjqBXCETHqzCYlrz/JqdGbCddt72bc/
         xrgw==
X-Gm-Message-State: AOAM531GHsnGo9xX8ATBtpfHeoVUAKCoD8S1xyNgOTWW1TeBUx+jpU8y
        0OzUQBqhqEvjt0W/NR8FGUtkKsyysoKrQ40EYO/1HA==
X-Google-Smtp-Source: ABdhPJzr3Gu4NfSezOIp9S9hnR9ZfNwv/i1ULAds8y94a5pFZ/UrtXrOB6tXMxlT/ruiiWH0tAJd3Csnh7XSYP4bKvU=
X-Received: by 2002:a05:6a00:d53:b029:32a:2db6:1be3 with SMTP id
 n19-20020a056a000d53b029032a2db61be3mr620397pfv.71.1626308367997; Wed, 14 Jul
 2021 17:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-3-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-3-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 14 Jul 2021 17:19:17 -0700
Message-ID: <CAPcyv4iZGLzzv7o7JK3iTu6rudX2d0-OqV-ueDhx6w9fminnAw@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] mm/page_alloc: split prep_compound_page into
 head and tail subparts
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> Split the utility function prep_compound_page() into head and tail
> counterparts, and use them accordingly.
>
> This is in preparation for sharing the storage for / deduplicating
> compound page metadata.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>

Looks good,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
