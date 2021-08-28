Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEA3C432BE
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 05:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C38B60EFE
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 05:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhH1F0y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Aug 2021 01:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhH1F0x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Aug 2021 01:26:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011BDC061796
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 22:26:04 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id fs6so6051542pjb.4
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 22:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2JfUpe2H37PEi8fU0OKJL2trjpNhW7D/OwMqmglIVHg=;
        b=wmdEvv2ENIhYYGUB7JTLAaIAv0cY9J3AEXqGcxs1JW+wpuG+n6GX/zaphPuMCLN3xI
         ns9idB6Sg7OOr03SuAxG8sRfuinLdHFSjEU7Jq3tp6oLpTSXdhzJPqGFq/uZ+786OV8p
         xd/s6r1r4ESyAYa+7j4DekrjGfL2n2mT9Ovr+H0dMEBLRaDX5FUtiImrzjnlHt2guhE4
         SttN5jwQ2wwEd3jfeAACvoIdQHjZHFJkMFIJcbCmI+cJx+9Z5ebldao2y6R7yv1o1Gnl
         WYYQWav3jQ0a7SPEmpucjj3+iuyqLjSHpDbeiKtEJylvNGStg8w9l95tdLZctBgLKoTg
         DR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2JfUpe2H37PEi8fU0OKJL2trjpNhW7D/OwMqmglIVHg=;
        b=i8vmGPdkHAlHK6GfKo+5rvrr5wO0m0DxsVO4zOy9hoOLavKqo3F9pChVup+Oup4isz
         CRai4Fk554iB5XN5/EyGHj4wm7bU8+34mN4Kp35SG2uLjaav5KDDlwtBik8Tfa+mJ2jd
         iKbhU/g2SrVO6p62mMTcsFvX10ZePUjg0IgntkuDgF/zRRLy9FWg4k2qLaG5D1Ykz0dT
         JhA3EISjupofeqiCSMONmLEckk89ba2Rg2t6zqRZ6CXEqfl797Y+A2X3rOzQcZzL5LcB
         aMrSVQax+A8napDXdkprERhyjxi+Ff3s1uhGafkb+9VKnN8KPLBoL2aScF+AqKapBhyB
         SFEQ==
X-Gm-Message-State: AOAM5323XLfrAq4xSGBVXjXRUHvndExCkrNT2gKjMaiAfZSReEvLHoNJ
        6UYBFd5uwY7TOUtD++RN0z8eCfrDN5JEXm2NPAKJaw==
X-Google-Smtp-Source: ABdhPJyWIL3bp2Wtvc8QNlN/2pOeczW9cA7a6NJ+Yc79O9glgqWDdhp+1YDeYsbIyXrjH7fSFmW+RMAB1LNFKreobxU=
X-Received: by 2002:a17:90a:5405:: with SMTP id z5mr14659897pjh.229.1630128363484;
 Fri, 27 Aug 2021 22:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210828042306.42886-1-zhengqi.arch@bytedance.com> <20210828042306.42886-2-zhengqi.arch@bytedance.com>
In-Reply-To: <20210828042306.42886-2-zhengqi.arch@bytedance.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 28 Aug 2021 13:25:27 +0800
Message-ID: <CAMZfGtW8CVMQkkC_rwJoHXQQYsuJBAfCuWC_XjhHyKnxFdc3kw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] mm: introduce pmd_install() helper
To:     Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        mika.penttila@nextfour.com, David Hildenbrand <david@redhat.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 28, 2021 at 12:23 PM Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>
> Currently we have three times the same few lines repeated in the
> code. Deduplicate them by newly introduced pmd_install() helper.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>
