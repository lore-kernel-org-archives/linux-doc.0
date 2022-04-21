Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09A6C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 21 Apr 2022 03:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383917AbiDUDVj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Apr 2022 23:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383906AbiDUDVg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Apr 2022 23:21:36 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D291262D
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 20:18:48 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id s14so3587710plk.8
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 20:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NghepmBiaj68pxaOpcG/lSCzSAs3yu0ibKXLD1qTgVU=;
        b=455j9DFRMs2U4tYQSDrRfRP4nUqSK00fXmqysu4e/bPsZzlckCyuXj/B4Y6S4Gy/kd
         1cPTlmK7Sd2NHhR1t9aI7qj1qUlQWyrAYwUxjmz7MscUTz06a2PReygGRCEl5sjU1p5s
         AShoRN1705vDVF8/K9zjL0TN+7kAAREvbQUhlvYHBcEQVZOT/GNOBbxPDf8C8V0hFYY0
         LLA5kIohpZqvAhApQQS63aPM9CE4FIuwkFLEIYSalcxOfL5BfO19RUh+VyRh4JK8FIUw
         8McGY06AAEkYHoCJHRq1xbsa22lUGKS44moWcUmuY+LDfdF+v1XkArmdR+uUaKOIPdWi
         Bfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NghepmBiaj68pxaOpcG/lSCzSAs3yu0ibKXLD1qTgVU=;
        b=goZ1pc1l1ny0hmbfE6iaMPVcRCgLfmbmfCd22pW1wMoDM+c/A31DD6tqDttlfi9hGT
         ERnwL4buVDudiC5MTDp5Fcyd146SLpflSvLV1CuS19y95PnOQ7DuoPGSX9LWbhu7Ew96
         ilUMc5BcOPmbjj8MQYH/YTZj9a79s/5l2rBmtuHbawRvWxcfq0PRUJWzLrFnW2BqElhw
         x+srRDvWe8WlzKJDWLNtFjD3cQoUSdLhsiMt9VsFJAhsCNho/Ej6GbCefT9izdcH2fPA
         oBUhSK535p8UBeE7V7cab9hHnTsXK2Pb7FlmNuCmkVz6XtGR2Mto9P058HsN1K5TbUBT
         CprQ==
X-Gm-Message-State: AOAM530sWG9j+GWysCwnCmG+ipbRLVx2KEJe5xMN7yE63oCa2e02PiKo
        fFFFFMzI+8cU5/ptiz9QmOxOXw==
X-Google-Smtp-Source: ABdhPJymzdzVbaGcv9D9XGC4x7JH8QeNZKFSjMs5U0NY0Qf5J+81At3RmjwzuwOZY02fSOmyeqBv7g==
X-Received: by 2002:a17:902:7407:b0:159:6a:8beb with SMTP id g7-20020a170902740700b00159006a8bebmr17249263pll.168.1650511127951;
        Wed, 20 Apr 2022 20:18:47 -0700 (PDT)
Received: from localhost ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id j6-20020aa79286000000b004fdf02851eesm21039552pfa.4.2022.04.20.20.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 20:18:47 -0700 (PDT)
Date:   Thu, 21 Apr 2022 11:18:44 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v8 1/4] mm: hugetlb_vmemmap: introduce
 CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
Message-ID: <YmDNFO6+wHSEkiSO@FVFYT0MHHV2J.usts.net>
References: <20220413144748.84106-1-songmuchun@bytedance.com>
 <20220413144748.84106-2-songmuchun@bytedance.com>
 <CAK7LNARNyYNMMYcEwU-pVFb-b21cKN+K_jwseLTtoOfscS2Ggw@mail.gmail.com>
 <9bd9c89a-b2fb-04dd-0aac-c42f2ee9e1a1@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bd9c89a-b2fb-04dd-0aac-c42f2ee9e1a1@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 20, 2022 at 04:30:02PM -0700, Mike Kravetz wrote:
> On 4/20/22 10:11, Masahiro Yamada wrote:
> > On Wed, Apr 13, 2022 at 11:48 PM Muchun Song <songmuchun@bytedance.com> wrote:
> >>
> >> If the size of "struct page" is not the power of two but with the feature
> >> of minimizing overhead of struct page associated with each HugeTLB is
> >> enabled, then the vmemmap pages of HugeTLB will be corrupted after
> >> remapping (panic is about to happen in theory).  But this only exists when
> >> !CONFIG_MEMCG && !CONFIG_SLUB on x86_64.  However, it is not a conventional
> >> configuration nowadays.  So it is not a real word issue, just the result
> >> of a code review.  But we have to prevent anyone from configuring that
> >> combined configurations.  In order to avoid many checks like "is_power_of_2
> >> (sizeof(struct page))" through mm/hugetlb_vmemmap.c.  Introduce a new macro
> 
> Sorry for jumping in so late.  I am far from expert in Kconfig so did not pay
> much attention to all those discussions.
> 
> Why not just add one (or a few) simple runtime checks for struct page not a
> power of two before enabling hugetlb vmemmap optimization in the code?  Sure,
> it would be ideal to never build/include the vmemmap optimization code if
> this can be detected at config time.  However, it seems this is a very rare
> combination and the checks for it at config time are very complex.

Right. Iterated and explored through 8 versions, I realized checking
it at config time is very complex.
 
> Would we really need many checks throughout the code as you mention above?
> Or, do we only need to check or two before enabling
> hugetlb_optimize_vmemmap_key?

Yep, now there is only one place where needs to check that size.
I think I should go back to v1, it is simpler.

Thanks Mike.
