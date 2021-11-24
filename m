Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A754C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 24 Nov 2021 22:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243339AbhKXWeR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242784AbhKXWeR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Nov 2021 17:34:17 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC01C061574
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 14:31:07 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so6191192pja.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 14:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZTluUY3cfxjR9J/ibD8Q7eAgh7RLXinSzFroRqU4Dps=;
        b=DStKIl3D31dPx51zr5q99irRZoe+Yhr00PsrXQdnlBwTNGrPhkVxm323fyvH8fWTPY
         uCy2yJnFf871/QbrZ2TFRrrJ+kiQkR9uuevtlIhU0dSnpwSSARXBTd71IBUpZqifxm4L
         tn2fWH/hhn97cwmhGP/WZlf9wBdK8sdSE/N7Z+ofNfAkvpBp6xYiGxGukSTR/roCiIhm
         /uLuFlwkTc1ia5TxHKufnvnLEveTbJYV6m8zINtLhp7KFWHlmNYLtJ6GeeIgCQV//ZPX
         eBvk6/gV84acVoPnFCLaQMx5NBHtkHg70Z0OwLbXhB1XEA81KsUCve+EQpT/ejypy5mz
         MYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZTluUY3cfxjR9J/ibD8Q7eAgh7RLXinSzFroRqU4Dps=;
        b=SWLh2yYGlWs4BgHeZS0L79BRaNfBag+JKdc6ISPGt8UsXOd6QY1cupWW8Hux0Mf8WP
         1D6D/RuPxW0KwTrsllUZ1VgHyIqKjpisGICz6hCcLu7eLmHU25O2GBCtR6cP53Rv+oqD
         arITvTFown3Ibqkwsa0uUcApkc5tB2JBx0soLPBDekW/5sdZ1tb8PBRXE+dbOXiD8BV5
         RMq6Add1jYZo9WExzUP81pikXueLHGqdvG9luj10mhpYEzySpYbeqp5StMwlRW5TWCK2
         LUTmGP6OJbOXfC86hG2oCyzCNO/RLOo5FJZzIpHEMzyCXQNbWcWOtxdhjj0KMOmwKre9
         HzjQ==
X-Gm-Message-State: AOAM532gMnj6JwWsPBZ0bQ9pm5z/PhaejffEJn9Rp/U7DOry9/aUPmjL
        5dUtZxTXUi1WQNMY5NjwZ4EEqRsoHhEM72xTNcTFqg==
X-Google-Smtp-Source: ABdhPJz1ZxxqX/IeS4j0FkYYNfR0YubhWSALTSmVmxUQdkgfzkBeZXTVYWzt7kBsoct/2dA7OHXQoUJmBkF/iTIKLa0=
X-Received: by 2002:a17:90b:1e49:: with SMTP id pi9mr689531pjb.220.1637793066752;
 Wed, 24 Nov 2021 14:31:06 -0800 (PST)
MIME-Version: 1.0
References: <20211124191005.20783-1-joao.m.martins@oracle.com>
In-Reply-To: <20211124191005.20783-1-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 24 Nov 2021 14:30:56 -0800
Message-ID: <CAPcyv4jxQTMoz7wnzzspm85o+buD2M+KKuBoHZvn7VEVsCFzsQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] mm, device-dax: Introduce compound pages in devmap
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
        Christoph Hellwig <hch@lst.de>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 24, 2021 at 11:10 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> Changes since v5[9]:
>
> * Keep @dev on the previous line to improve readability on
> patch 5 (Christoph Hellwig)
> * Document is_static() function to clarify what are static and
> dynamic dax regions in patch 7 (Christoph Hellwig)
> * Deduce @f_mapping and @pgmap from vmf->vma->vm_file to reduce
> the number of arguments of set_{page,compound}_mapping() in last
> patch (Christoph Hellwig)
> * Factor out @mapping initialization to a separate helper ([new] patch 8)
> and rename set_page_mapping() to dax_set_mapping() in the process.
> * Remove set_compound_mapping() and instead adjust dax_set_mapping()
> to handle @vmemmap_shift case on the last patch. This greatly
> simplifies the last patch, and addresses a similar comment by Christoph
> on having an earlier return. No functional change on the changes
> to dax_set_mapping compared to its earlier version so I retained
> Dan's Rb on last patch.
> * Initialize the mapping prior to inserting the PTE/PMD/PUD as opposed
> to after the fact. ([new] patch 9, Jason Gunthorpe)
>

Looks good Joao, I was about to ping Christoph and Jason to make sure
their review comments are fully addressed before pulling this into my
dax tree, but I see Andrew has already picked this up. I'm ok for this
to go through -mm.

It might end up colliding with some of the DAX cleanups that are
brewing, but if that happens I might apply them to resolve conflicts
and ask Andrew to drop them out of -mm. We can cross that bridge
later.

Thanks for all the effort on this Joao, it's a welcome improvement.
