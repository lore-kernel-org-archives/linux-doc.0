Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A691C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 13:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EA3C61A7F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 13:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbhG0Nj5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 09:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhG0Nj4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 09:39:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DC9C061760
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 06:39:56 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id a20so16031440plm.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0EuAdJ2j3Xy0wD/MXKwZ/PwZTNMmcTB1bfhzXbegpT8=;
        b=OeyAi2UTKTWbVp/qMcrINmfyO/LiUfMC5mKML0fs/Se/Osx2AXIKqsFoml0FtAfvZU
         wXu2X/iGWw/iqftzqKLG9r5kHy4YXAJZEwh2FIJw1FPF20pxUpihuExFJS3XkxJKEJg5
         cIPdejsvCQ1OI1oR0AAcM8cXthGlaeC+ZHA60kPxdItf4zktXNVg8FwQHl9d45gqr6RW
         Trva3LvqGr4yfXLnZy+LhWKmQ6OR/Oykg1QMcJk9Ncwy0kc4XZu0BnpUmRnDjaX4m9Gx
         ONNtIo8lA8GfBiJgpRjloIHldM1SN7Q2JdkUz54XQFS/NT924wl+TzlSOPU4zLtVj6mh
         Ej2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0EuAdJ2j3Xy0wD/MXKwZ/PwZTNMmcTB1bfhzXbegpT8=;
        b=nIBXFCFFuES9PXH+leW29sYiy4PV6e2kK9nUtdnnycC/rbVc1NDFFymZDhNJVobDSB
         0no7LdfVFB9qq5KuuwaPON0ohRav/xo1KFQ2BtZAHOCd0zS2nD+8s9YUvATZIwGrw1Hh
         k/yL31XfRzBd9HIEH6ZE7Uafg1nHfxO6uNSZeyvAInfTXtvl2qqwGkoWMQRxPnvpcTWW
         /4NBjBHb97hyT2BssFA/JLzYGMtby6ioKqrZ93nCSJDXcY9EIg7Sla6ww6Dtf8dn2TD7
         yMig+VobmSFqZERSjA17IV/OnAhDdeCTl3vb4Iqns02v18GdrQRc5+lg891o3Sa9/Zhn
         uihw==
X-Gm-Message-State: AOAM531CUuJ059MzV7/hgT+uuMjjCOWh1l9feRo6tAUemXO5h1oy6Y+V
        hEA7QE24drT+bKZRfskOGCZ+lb4sGY5E0taZbQ2sKA==
X-Google-Smtp-Source: ABdhPJzBfHNbdE8QZCQo1KfFkwCTH8KqVgtlNH0zqRZJ1iKnUGTO5j5NK3RgzPw2/D0tchJpoenEbqHB1cxeOgLzLhQ=
X-Received: by 2002:a17:902:6ac9:b029:12c:3bac:8d78 with SMTP id
 i9-20020a1709026ac9b029012c3bac8d78mr5117123plt.34.1627393195692; Tue, 27 Jul
 2021 06:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com> <20210718043034.76431-4-zhengqi.arch@bytedance.com>
In-Reply-To: <20210718043034.76431-4-zhengqi.arch@bytedance.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 27 Jul 2021 21:39:17 +0800
Message-ID: <CAMZfGtWjunhRYQNW4u4Rea8N+csKPvzUmKfgUBnWBdJdagjs-g@mail.gmail.com>
Subject: Re: [PATCH 3/7] mm: remove redundant smp_wmb()
To:     Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 18, 2021 at 12:31 PM Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>
> The smp_wmb() which is in the __pte_alloc() is used to
> ensure all ptes setup is visible before the pte is made
> visible to other CPUs by being put into page tables. We
> only need this when the pte is actually populated, so
> move it to pte_install(). __pte_alloc_kernel(),
> __p4d_alloc(), __pud_alloc() and __pmd_alloc() are similar
> to this case.
>
> We can also defer smp_wmb() to the place where the pmd entry
> is really populated by preallocated pte. There are two kinds
> of user of preallocated pte, one is filemap & finish_fault(),
> another is THP. The former does not need another smp_wmb()
> because the smp_wmb() has been done by pte_install().
> Fortunately, the latter also does not need another smp_wmb()
> because there is already a smp_wmb() before populating the
> new pte when the THP use preallocated pte to split huge pmd.

s/use/uses a/g
s/split huge/split a huge/g

>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>
