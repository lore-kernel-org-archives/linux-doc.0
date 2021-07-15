Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AB3C12002
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 02:48:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80CFE61377
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 02:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhGOCu6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 22:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhGOCu6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 22:50:58 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F40AC06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 19:48:05 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso3042307pjp.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 19:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wLYnBhNAj/XYO/bo2YBoHKajEtf9fKNsRXOzJF9AhAY=;
        b=WacdKpDj/uTksZo6/l6FDHFWO104E7OO2DgdbtlDcJCotc2VpJn0V6oiyUYEPdPbsQ
         ssVnr/8JKm8cIKZcniDPaxqhlFzeZFAf3DvwQGD/B1iPdcQ3V/Fpehd6v6v+SXAPJpyk
         iOvMEkx3YaxCr63is2uK9eJ3CCOBEH2cqrC/O7iDRN9K9Sw6OuE6K6CPyzF3PM3V9fL0
         llII3rzUe9qs8gH8c/cQYk4ZZuzDjm1rrXvWSdoIrJjhh+qSlajYgTI+u6zVDvRSRyzt
         hn4jYPeAvnkM7uGQy537gNMVXl9EVQCk26OWvOPizkE9GVOx2c3GXOsZIBAaTKlx4XoX
         EExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wLYnBhNAj/XYO/bo2YBoHKajEtf9fKNsRXOzJF9AhAY=;
        b=NOhXBHPFafLN6QodTeKbIarH6OmQeIMEFRSiZbtiG35XV0DH8PyP2VQEg7sOv1COu7
         qEFows3+fYbcs9PmonlEnRsYw6zp+KvMFMm+IrWAlLTfjsii94q7CiqwUSLm7XAUxspF
         gM20V/Kn7tjNxMt14Ss2HN35DdG167Tqq6agyFPJP1oZRpdCC0GKjkvP3lxnDdVB7AIg
         BkOJ9BK8SE+RijM6pt+erSyIPBdpScVjierQrowOnU9GZGf2HKBZngnamj5v8bag0dHE
         /dncWyV6/wZS8TuMiqNwg9w+oR4xoMmEV7tIXFBoyoSNDamcjpFEXgISComa5KpMQ5FZ
         ziOA==
X-Gm-Message-State: AOAM531VWItLwdeStC6Oz4ACsdSQ/4SKxeYriPqDJaiAqR/CljpRrAsv
        VVYtaJlO/Ne2eg71yfkUMY88MjOpJvLJayLE4TofQw==
X-Google-Smtp-Source: ABdhPJwnYKsB/f8VcSXozl4jCzBcmpmRoGBlFdzIHhfg7bLHH9uUQUn0ixm4YyAIqR4ymVuzLh5W7ViAwd54SDp7dgo=
X-Received: by 2002:a17:90a:9b13:: with SMTP id f19mr1296324pjp.229.1626317284798;
 Wed, 14 Jul 2021 19:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-8-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-8-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 15 Jul 2021 10:47:28 +0800
Message-ID: <CAMZfGtVrv=Eh3PGkgYm+mV_E-mO9_0rVW0LSJsZh0e9Kr9hBFg@mail.gmail.com>
Subject: Re: [External] [PATCH v3 07/14] mm/hugetlb_vmemmap: move comment
 block to Documentation/vm
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 15, 2021 at 3:36 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> In preparation for device-dax for using hugetlbfs compound page tail
> deduplication technique, move the comment block explanation into a
> common place in Documentation/vm.
>
> Cc: Muchun Song <songmuchun@bytedance.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

LGTM.

Reviewed-by: Muchun Song <songmuchun@bytedance.com>
