Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB07CC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 18 Dec 2021 14:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbhLROfL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 18 Dec 2021 09:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbhLROfH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Dec 2021 09:35:07 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C1EC061574
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 06:35:07 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id x21so2660921lfa.5
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 06:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pYgC6UbioLpLUDdPygjohyGooIms1qIM+qPuyGqET70=;
        b=rHhgE6Zlotk8HdSmidDY7wBJeHWSp00Vfo+Aqyou5BgyXPRyKu8LnPMUgXmkKkflzx
         udb3hkJAw6YSaGTz2tvs0AUdbG9qxcputvPHcQJHMxINHngDuOsk5v1e2RDCfUnB1Ab8
         Km2eL88kgKvUp1qHFQIF+u/2wiYm+aqXrJo5w5NWU3ewPCL+RZWQvfMM8aVSybzkQWv2
         YznjW4G5pZEtM+9rqSNDOTSDoor1uxwRfciKnnPsd/l/oMeQiT+BBMLp7QmdgammQt4/
         5yoUrYl7NRtmvNpp4QCxknwd6fmsh7MmHlYOIuMeHEPl2JNzg5WgzpB/pIaguDzdx6I4
         IGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pYgC6UbioLpLUDdPygjohyGooIms1qIM+qPuyGqET70=;
        b=X8NB3L4t0eBJRYGDTe/qnlN+wWNAgztkK/LJScFEoitny7MISXOlB1on9Jt5pW2G9d
         MZcoOwAU1Bl8vz9ySkuTHkHVFxn9E6DwLNY1t9cXtlR3OtCXFMp6zIYtAj643AMx9zmC
         eOSc/Sudf+J6RyUQ36YtQEjHgJXfXoWCNQ4FK1pLQHT2FJUQh148mcayXcEK7eDg4Qxr
         F05t0Seyml60u6br/FhYCVa/qXtPPt5Saf0HIZdhO0h3eqwIq4EUXRZ7d7GS1IENIGUq
         ylIP7ryAaDokye/C52W6gRZiSOGU/O+PPFQyef4ag5xVi1m0dpaS947AgRjkfy1olnpu
         sCgQ==
X-Gm-Message-State: AOAM533iXO50357QztUrarkp5cMD7mBXXknYo6M8qAx+DDuVA7MySRwb
        Ye3etGv80b0ljI1lP+15Xbbfvg==
X-Google-Smtp-Source: ABdhPJyJfweji7/uZmtDXAtvhhz48SwfdSecz//NO1/1kZj2ekmyONM2NijthLcvedNhQHMMoHkBbQ==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr462354lfu.460.1639838105757;
        Sat, 18 Dec 2021 06:35:05 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id s4sm1728641lfp.198.2021.12.18.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 06:35:05 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id 98E2D103A58; Sat, 18 Dec 2021 17:35:12 +0300 (+03)
Date:   Sat, 18 Dec 2021 17:35:12 +0300
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
Subject: Re: [PATCH v1 04/11] mm: thp: simlify total_mapcount()
Message-ID: <20211218143512.luh7jnd4y7it2yun@box.shutemov.name>
References: <20211217113049.23850-1-david@redhat.com>
 <20211217113049.23850-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217113049.23850-5-david@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 17, 2021 at 12:30:42PM +0100, David Hildenbrand wrote:
> Let's simplify a bit, returning for PageHuge() early and using
> head_compound_page() as we are only getting called for HEAD pages.
> 
> Note the VM_BUG_ON_PAGE(PageTail(page), page) check at the beginning of
> total_mapcount().
> 
> This is a preparation for further changes.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
