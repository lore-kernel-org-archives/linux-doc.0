Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF28C636C8
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jul 2021 21:28:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7ACC60FEA
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jul 2021 21:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhGRVbO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Jul 2021 17:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232582AbhGRVbM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Jul 2021 17:31:12 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC94C061762
        for <linux-doc@vger.kernel.org>; Sun, 18 Jul 2021 14:28:12 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a6so23024969ljq.3
        for <linux-doc@vger.kernel.org>; Sun, 18 Jul 2021 14:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RDmZbfk4umt1NTgReOWa0nlo9wbj8HPSJ0b72AWtHlI=;
        b=m3X+8h5sNcmib/Jzd1hwMXGfSUSimXJ8rCCYFjWXgqdSTHMLURCciTa1Gkf8rtY8gF
         IncY0rxbJp7diuFaM+sFO05fUn4c92aIEMDVyrXI8pBY4anM35msGOlHF0MDM4G62Dk2
         FhjzD5Th/XMP9NIJnqKS/cWnewOk8N41dGlkiPqK/TQK+uGp9PoN7en3TFzuESVIRDVe
         kr2/rVucVrHylll2n8fEOui5IgqOAIj4yZKDt0w5Td30AqPv6TC7MY5vZrLeh82nYqP9
         3pq3j/JTjz9QWloFIbVWejNWh2rAHLrHh4gy2ZCayJtoD1AYG6AVo/w29miAlO0N3kz/
         cokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RDmZbfk4umt1NTgReOWa0nlo9wbj8HPSJ0b72AWtHlI=;
        b=SuY87ZNCjvRcp3dGkYdHm8fuDrbwtpX2IQ3wVSkek3xzTC7TRlQ4W4UYPx2hWLZoEL
         bJdc4UyufD0aNFLry8zPoUvzVzKXIG6o4DdSY2lz1j/hWKb2gmPUE/a6Jh5KFz9J16LI
         /xB6QRlLPLurAH3JIc4l6+mRUd7JwquTSxwOaS7KCceipng71RkqrStsI44Wd8etYYyT
         UTxP2jJQL9aHEYpp9s6GSoW6NkQ31dHRKAA51O9L+scVvP1LXF83Z5S4cUnb2WiL0yiX
         W5Qxyc1ttx0GIeB2ZBZiiJam6Kz2U4RZa9MR80rex8tdRMNl8j6j250lkbf9OOjM1p/0
         wVMQ==
X-Gm-Message-State: AOAM532oKQNAtRicSd57UuEjAyCQCUbFWMPVvxhAzOxIT5t5k1wDKzZt
        7EDqxAJVpmyq7gAIYUmHPEL0Vg==
X-Google-Smtp-Source: ABdhPJzslQtZZUuJs3gEJ2cjkwE33akLtrf7biZvMZ6KhTw7w+qis1t8Cmc/qZBJE6B/zyxqPlhZpA==
X-Received: by 2002:a2e:3506:: with SMTP id z6mr20511573ljz.238.1626643691394;
        Sun, 18 Jul 2021 14:28:11 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id z13sm1232704lfb.40.2021.07.18.14.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 14:28:10 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 6C5B610260F; Mon, 19 Jul 2021 00:28:14 +0300 (+03)
Date:   Mon, 19 Jul 2021 00:28:14 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
Subject: Re: [PATCH 1/7] mm: fix the deadlock in finish_fault()
Message-ID: <20210718212814.suvziikndiyezi6m@box.shutemov.name>
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
 <20210718043034.76431-2-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210718043034.76431-2-zhengqi.arch@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 18, 2021 at 12:30:27PM +0800, Qi Zheng wrote:
> The commit 63f3655f9501(mm, memcg: fix reclaim deadlock with writeback)
> fix a deadlock bug by pre-allocating the pte page table outside of the
> page lock, the commit f9ce0be71d1f(mm: Cleanup faultaround and
> finish_fault() codepaths) rework the relevant code but ignore this race,
> fix it.
> 
> Fixes: f9ce0be71d1f(mm: Cleanup faultaround and finish_fault() codepaths)
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

and add stable@, please.

-- 
 Kirill A. Shutemov
