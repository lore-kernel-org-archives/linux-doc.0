Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2182C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 18 Dec 2021 14:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233378AbhLROYG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 18 Dec 2021 09:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233400AbhLROYF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Dec 2021 09:24:05 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF91C061574
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 06:24:05 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id d10so10846901lfg.6
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 06:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YHPIbWRskoI13v7SXXYMBlSshlVSyS/odNCxIx2krDU=;
        b=R4nqpuf2D2DP8ypequ4V07JdTq+9/RJeA9MphSpqihYX8Oez6G9V072DMW865BY+pq
         R3g+gZUI4RYthKnmvhW7KfLBafYZFxdCJMedaQr4RvhGkP6i4FiwOlEoWfXFM/rJFn+N
         G++OvSsj876IZmj+HOXSMaWdSXEfO8PHtTNblHjWbd1zUd1gXnrvUsbdvgovYfO1PxBc
         37Qm7BkKVy4OPHHpp+nFKfqG1sbC+WhEMSuNyXFgFBmYC9jjWiDJYRhwnBw8qa2T5Phs
         xug0VS8hsvvto4w1gdHrFyORC20qHxxNVZNzujMu4GMRwwa42C4X3xdj1HepNreKjiyn
         xaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YHPIbWRskoI13v7SXXYMBlSshlVSyS/odNCxIx2krDU=;
        b=pIFPrV6w/+XY1mrP+75+aGM6TE/579vSqcJYv8QujBB+OInhmC9k86blstM98YO3Rj
         eOX99/Rg0HS/fmKMKKlb4wSErIDwPVfEdIRFKBzS8QP1ZSkTRSZDxeUqKciQSrGTDamI
         FJVVv92CvrBdoXGIE95/qAyZhaKRL3OLdRD7LwdMnjp2VEgTumz1Lg/ilAs1UszKTVFR
         X5OBg/grHsyATBP7lBtRhzD7TCILkq8gvSbQgi8lFNePqHMHuFgWKrWDDCChageMhmFB
         rjI/aG4jF8m81SDxeDhZ7L7Ce/sKaH+ljb59r1t87Kzfgp8tW5XC5Dyc4M8/AWryCzPn
         30TQ==
X-Gm-Message-State: AOAM530aU3z3XXzLUh6wpNXU67k7hchtiveGTXu3TVzOJ8G1CMwFx/5U
        uDK4fyE3MooLPMKfzuJoJPdsow==
X-Google-Smtp-Source: ABdhPJwRXwDws7S7mqGeGmMBpf2IbdMmPv3SQLhQ+ZzyCtgk1Wku5XINL0bXpgQs8Ermc0douUUqvA==
X-Received: by 2002:ac2:46d1:: with SMTP id p17mr4046681lfo.578.1639837443559;
        Sat, 18 Dec 2021 06:24:03 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id bu16sm1259230lfb.276.2021.12.18.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 06:24:02 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id 2E11B103A58; Sat, 18 Dec 2021 17:24:10 +0300 (+03)
Date:   Sat, 18 Dec 2021 17:24:10 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Nadav Amit <namit@vmware.com>, Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 02/11] mm: thp: consolidate mapcount logic on THP split
Message-ID: <20211218142410.rols565bgtwzeruj@box.shutemov.name>
References: <20211217113049.23850-1-david@redhat.com>
 <20211217113049.23850-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217113049.23850-3-david@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 17, 2021 at 12:30:40PM +0100, David Hildenbrand wrote:
> Let's consolidate the mapcount logic to make it easier to understand and
> to prepare for further changes.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
