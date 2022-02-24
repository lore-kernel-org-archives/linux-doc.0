Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBF2C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 15:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbiBXPmT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 10:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236486AbiBXPmR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 10:42:17 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C847E38D93
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 07:41:45 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id h17-20020a17090acf1100b001bc68ecce4aso6028903pju.4
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 07:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aglwyJuncdMb7TX3kliuiHLVhSIH5aYNnruwhD2Ltmc=;
        b=TROd7V022FpJERjl9bIAT1CByY618UmA0CCwtcpFre6Pzzsc3VcaJ1lo8VTGuKfzTG
         T8BQFm+jhcAyZ5K97lxfP+qAfDnmsR/p4sISJ60lKgw6UlQC4j8WFVGogvhODKFHvidh
         LQaLNxH2I8a7YK73eBimULBO49cy622Ag7Bt6VH0+50zsiZFeZB7PqI7B3bprdlKX/5D
         lh4zAvYyfK2jjSClqeoVeURwDqvKaB9jiRB3Lh7igMW8YMWZxGN182EfZynKe4SZX8he
         W510oDJzTJ7xTz8yfFOOt2+CI8sWq+8x8MNP0665vNGPH8kVwIz3B7iMkqEhpXw7O/X/
         63uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aglwyJuncdMb7TX3kliuiHLVhSIH5aYNnruwhD2Ltmc=;
        b=LVSx+S9ZOLQFZI1kGmVNdEZvQEpHS0ahQBdKJt6JkOpMFKMUsNcHHy0cNSKTBj9xiV
         NG6273VZo26XJ6/aojnOv7TC200o0aR5Nx3fXfu4je6yjQkdLzuF89BWpWkzMJUSNS31
         9iK8YBJ59kLOnUh14s1e2V7S1CDm9LnbIADiF4Xyqvt4C8+EV/nQY0stIhBhvzsKqdZ/
         PDKSjJTTInYxi8D1J9ZgmjxVZl2BkxScgv4d5nCok31iS8zrV04A1xvMxjX6GL1TxJtT
         WMqQ5acXI/aYjSAgMjTWJWHKzXvYdolGs7r/75L16IDc79mBXfqFw4862MooR1qPsa4a
         McaA==
X-Gm-Message-State: AOAM531klQM9hdXf58m/O8LMi5NF0dg0dWG7wDMV7sAo4VdiY+bDlaPw
        Bix7F0V/1JurSoPHQMT1TxP9MO7D6RxAV67cwU2e/w==
X-Google-Smtp-Source: ABdhPJw0qCYj4wX044KlswblL6qaOV1khF2ln5o1BdyFM3xFURkaFxNC7iQzOv4gcEGB24YMZBQdmPh7RBoMgTlZe3I=
X-Received: by 2002:a17:90b:1b46:b0:1b8:f0eb:e424 with SMTP id
 nv6-20020a17090b1b4600b001b8f0ebe424mr15144712pjb.185.1645717305102; Thu, 24
 Feb 2022 07:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20220223194807.12070-1-joao.m.martins@oracle.com> <20220223194807.12070-6-joao.m.martins@oracle.com>
In-Reply-To: <20220223194807.12070-6-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 24 Feb 2022 23:41:09 +0800
Message-ID: <CAMZfGtVCXDeF=3=0n83Bx_20MHOqWsRoJAtZeE53WMr3FA+j7w@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] mm/page_alloc: reuse tail struct pages for
 compound devmaps
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 24, 2022 at 3:48 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> Currently memmap_init_zone_device() ends up initializing 32768 pages
> when it only needs to initialize 128 given tail page reuse. That
> number is worse with 1GB compound pages, 262144 instead of 128. Update
> memmap_init_zone_device() to skip redundant initialization, detailed
> below.
>
> When a pgmap @vmemmap_shift is set, all pages are mapped at a given
> huge page alignment and use compound pages to describe them as opposed
> to a struct per 4K.
>
> With @vmemmap_shift > 0 and when struct pages are stored in ram
> (!altmap) most tail pages are reused. Consequently, the amount of
> unique struct pages is a lot smaller that the total amount of struct

s/that/than/g
