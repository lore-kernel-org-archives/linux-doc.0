Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F51C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 03:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiBXDLr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 22:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiBXDLo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 22:11:44 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3F62465FA
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 19:11:15 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2d641c31776so10527007b3.12
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 19:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8mtpPZAP/jAYJJyMzEonaOx2sTOc5n28GBAe2uH3WEY=;
        b=S0K6WvP3CBpaQxxCYEvAn89gSciPZblXBrv71erMz95cLnLNtW2zkatg+yAJAgTj00
         POqnWFPbhQghMwFFx4v0DLLnGg6ylky5WSvhfyRD8R2eEZySUm2zKBAQfCDyV+amNQ0Q
         TVAW63GcunhlDC39D3QlNDI8r/9sC5Bbzjc4XQ1p58f3ABxBmWb8lzxiEl8uszqR+lCr
         XIFntqbOgE/2zcf3Ybjetlfvc2GBpyLZOEQkS+4ZXpZivDuMHD60zcPjdLQs6+eJvp36
         1f+jnfdZInSE2h7dz9KTvRD7mJS3lbOeq37L+eQA0DDbC6tqWpcZ1s/HzkcwP1uEJbya
         Hmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8mtpPZAP/jAYJJyMzEonaOx2sTOc5n28GBAe2uH3WEY=;
        b=lhJojejlM/oDsSuehFxXx5RBRrDxL8wmplDqsEm2wqZTk5zLMvfUQSUFyPjSNbataY
         ohsghQTkZ6UdIpaq5/z3YqeBtHdwKEkFV2N9qS0RynuCS3Oc66Wb22RBcr78xmTYronU
         MkNYgQkFPWeO2UxJV4+ubtM202S/BPG1nKVYdsEUvJa2zdElTlyFXbsrA1/mODKTxJiY
         YZ76HVRGQja4tY8XAEoto59ene7Z7ZHefD2frigVE0UEyZmWogGW+zN5bG6aJCKZxEg1
         S72QgueiHofnpKgarIIFYZVrCz2b84H4QdxwlngTZmaXc17VHm2bnvQVXAwHWkD0HFsL
         cJ0Q==
X-Gm-Message-State: AOAM530+INgHs0VgrQwp4AFCNuSc6IyzDZ6Wz9K4zRO+PXA+YtskNt7q
        RPX/04Jjc3bjkc5G9f6oNTcHsirHOlVVGqYzYo8w3Q==
X-Google-Smtp-Source: ABdhPJwptZfPYhJvyu9jxfgMax6JVNrA4Pjt/3kifQRRjekLcRYO6pKkn+QzAd2aHb3P73wOLHCN4Da3bM9b+36fi5g=
X-Received: by 2002:a0d:f347:0:b0:2d6:916b:eb3f with SMTP id
 c68-20020a0df347000000b002d6916beb3fmr596585ywf.141.1645672274498; Wed, 23
 Feb 2022 19:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20220223194807.12070-1-joao.m.martins@oracle.com> <20220223194807.12070-3-joao.m.martins@oracle.com>
In-Reply-To: <20220223194807.12070-3-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 24 Feb 2022 11:10:37 +0800
Message-ID: <CAMZfGtVD6XyjqrQ4RpDDPOSZCgo1NHXbfjeRwqi2KmUckW-6xA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] mm/sparse-vmemmap: refactor core of
 vmemmap_populate_basepages() to helper
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
> In preparation for describing a memmap with compound pages, move the
> actual pte population logic into a separate function
> vmemmap_populate_address() and have vmemmap_populate_basepages() walk
> through all base pages it needs to populate.
>
> While doing that, change the helper to use a pte_t* as return value,
> rather than an hardcoded errno of 0 or -ENOMEM.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
