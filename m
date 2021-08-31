Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FA3C4320E
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 23:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6497061026
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 23:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240043AbhHaX0P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Aug 2021 19:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240022AbhHaX0O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 19:26:14 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A98FC061760
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 16:25:18 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id d16so1647598ljq.4
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 16:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ReC2ox+Cju/4N9Fc/5sSAV7oCq75ICewzDo/R9c9AWY=;
        b=pN2iMhH1zDTCH5MDvXVSzuCCB8DDe5RwD/to1P+zYwgR3DO/7mbOMaR+UgXeGk6uEY
         VS+eBqv36wZzDcoK+gl28f4wVMGO0a8tRVlNE4KUWK5lS+DtIThtjNjrA5vFjnoLuFx5
         SF2NE3vcEWAOMwE7kJMkKVnpiyuvH3aOqyjNU7QBSLTgSZ5pIhsY+ZobDcJz0MUqUiZi
         u9dKRXDo4CNeHOaWa022jYMGL/JGxNvl5/vr91LmlOC8nMa0dBivNRDi809sIPe+joPy
         TOkgWM6CTQr0rztXAn1t4byLi8pmM1TnYj+LEy+o7xklXItVtOLrir0qHRdiJhVga9uu
         TEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ReC2ox+Cju/4N9Fc/5sSAV7oCq75ICewzDo/R9c9AWY=;
        b=iwhVJwYHTqvVZ0p04EPBC1Wzs2lLbc9Lyy+OVpbSrC8VLMLMZ5btpKhx+V6V2sfX6M
         oOVC+XR0XayiKytFZtE/Dlj9B/BGTNLQ8gugisjVUpcP4wCBAmj39/JCRDbVLR9UXNhS
         bTlxadUlNoxqXYcX5mA1jmXTYnEW4IsLTko2w1zE8Ly1e4DEz6d/dbCnovGqot2f1SIL
         p4TtEsR6coEGSeMCMEOCjLbtvI6skixhZ+WjJfhLD6iahKYGdAh2YTQAIOdfFNDCV6zQ
         9us4zvKHcrtnS8tqznhF9UD0DBKX257h8mgTP9xtXe2+SWL2rCIIMrIVH5vveebWP6VK
         Nsxg==
X-Gm-Message-State: AOAM532gLOiL7mX21pFuYilEMeReX/cSZjVi5TlFpm7tsXEX/5CtLD15
        +CAv1mBEVH4324mPIVHfn5NILw==
X-Google-Smtp-Source: ABdhPJyzJabJ58N8ryzlDv9r2PjoUf90VHxMfkQhKyDBPDhi2KLOiYKJaoK8XeWY7SWSfyJ+pJ6UIQ==
X-Received: by 2002:a2e:a4ba:: with SMTP id g26mr26698740ljm.254.1630452316794;
        Tue, 31 Aug 2021 16:25:16 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id c3sm2344950ljj.77.2021.08.31.16.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 16:25:16 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 44B20102EFE; Wed,  1 Sep 2021 02:25:16 +0300 (+03)
Date:   Wed, 1 Sep 2021 02:25:16 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, vbabka@suse.cz, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        songmuchun@bytedance.com
Subject: Re: [PATCH v2 2/2] mm: remove redundant smp_wmb()
Message-ID: <20210831232516.4ft2kkn63lngggbb@box.shutemov.name>
References: <20210831132111.85437-1-zhengqi.arch@bytedance.com>
 <20210831132111.85437-3-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831132111.85437-3-zhengqi.arch@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 31, 2021 at 09:21:11PM +0800, Qi Zheng wrote:
> The smp_wmb() which is in the __pte_alloc() is used to
> ensure all ptes setup is visible before the pte is made
> visible to other CPUs by being put into page tables. We
> only need this when the pte is actually populated, so
> move it to pmd_install(). __pte_alloc_kernel(),
> __p4d_alloc(), __pud_alloc() and __pmd_alloc() are similar
> to this case.
> 
> We can also defer smp_wmb() to the place where the pmd entry
> is really populated by preallocated pte. There are two kinds
> of user of preallocated pte, one is filemap & finish_fault(),
> another is THP. The former does not need another smp_wmb()
> because the smp_wmb() has been done by pmd_install().
> Fortunately, the latter also does not need another smp_wmb()
> because there is already a smp_wmb() before populating the
> new pte when the THP uses a preallocated pte to split a huge
> pmd.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: David Hildenbrand <david@redhat.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
