Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BB8C12002
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 00:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35C61613CB
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 00:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbhGOAXb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 20:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhGOAXb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 20:23:31 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB82C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 17:20:39 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g4-20020a17090ace84b029017554809f35so4868658pju.5
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 17:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++GKWz1ssqCoeJx6bnGwv/X0kc5Z2dWJaQSf7sR2xSw=;
        b=U0PaRa++GGYaBFwYDH/lfFiilXCr2yuSCQujvVP22gL1atGIlTC378Mi40GfDOVB6A
         LGJQH3s5KlIRQ7jvjPI7PRMBUiieTdQD8EYG6o6W2/O8U70BMLXDq35Kwa1IwBLb3eom
         EOH0+hBF8DUoD0vjyPGEBg4f5VkUqNjqnUR5DPN7lHlEuj7S/OJejm38Ozv0gPPydnJt
         3V1iRBhx3r8j1M1OTc1CWwejo+jBFjEltwpdNN/0xia1WQwphKJ6zjxe6RMYwdaUPRTY
         P7ywcBETHArMhiTAjqTuk79xznUmb5Hx5aIFoY/zOl2nJ4TIx9npkb6bAAG6BO9aDRpO
         wqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++GKWz1ssqCoeJx6bnGwv/X0kc5Z2dWJaQSf7sR2xSw=;
        b=GWa7cVBWHJE3faRpBCtE9h8bPCPSvm1A0hz1zdJ6M3pUr9jL3LXnHL6dGZrX5YPO3H
         2pOVS/m8oLYpygshucVqAWHczsOZ6DFXKBVc+mZd9DjKsJLWIdtDbVS750uZjnN10Bgg
         YUI/350zyKN8PBhCBtj9F269QRPZrgX2D0h3UpJlKuHU2/hOvD+Is4NB0VTRKpvF/Zz4
         xYCfXddhD9SkxxZwJjWzdbeb7Ddx8khfMgH+DaJIU++BHdCHsLukzcV+DyyMBGbtfrWh
         nuZm0hMKqSPTgpQRIkJAMlcOvRAekq2EdDGdFOTJkpAGBOis2CPXAxbeGhdXvAZ5tg4q
         PNcg==
X-Gm-Message-State: AOAM532krTUB89b9r9/rlYQMzgtxSETh5p1GaG0pKPEECLKNLW2ynawy
        OgM+YUUrJ9Ja7pDoS6lNGgvX9B74RxSlDN49oRzL0g==
X-Google-Smtp-Source: ABdhPJyrCy3+Y6IJAkn3gtPXWHmXninLfXfs7SN98GDpyx+hpvDd5ePEFLW9PH44iDbQsDONtPRb8Mn3CdBYf6L02Lc=
X-Received: by 2002:a17:902:6bc7:b029:129:20c4:1c33 with SMTP id
 m7-20020a1709026bc7b029012920c41c33mr679072plt.52.1626308439094; Wed, 14 Jul
 2021 17:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-4-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-4-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 14 Jul 2021 17:20:28 -0700
Message-ID: <CAPcyv4jgsAy0RFnxvegJSBypYnHS_JrMUmbLvgwvSDUXurHnnA@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] mm/page_alloc: refactor memmap_init_zone_device()
 page init
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
> Move struct page init to an helper function __init_zone_device_page().
>
> This is in preparation for sharing the storage for / deduplicating
> compound page metadata.
>

Looks good,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
