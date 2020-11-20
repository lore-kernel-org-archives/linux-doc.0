Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20D4C63798
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 08:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 661A722256
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 08:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="T4Bxv0Lz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgKTIyW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 03:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgKTIyW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 03:54:22 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C818EC061A04
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 00:54:20 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 34so6724019pgp.10
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 00:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/obyKwhLmELIOTNjIjMVdmJhk74zSgJefv372u+mWk=;
        b=T4Bxv0LzpQqYFqnbeoS5z/ymTAG70N5QauApvRu4qkPvG7VYaK9AXKbvZlE86tp5yk
         fcPnYwapwHzMDp+jEDGBEvDwx6spPXhDfJyf8sgWfTNABV200qxPHXrK3Rit6Oce0j5l
         wLfS+XEwnskhpBt15tIZ6iOu4IDS00Khmp5i6lhieuw8Y8iAT+u/rx3Fo8BvBaASOEi/
         iba04pd7eKQjZL9vCbNICUU4idRDKUOEEYQUOoAheAntgu6yoGk5inGNaVsx+E6lDiTT
         2SCFgLs6lj3X/wvtIGkcFFI3BPo4tKQjVr1niCgGn1jiSixtv99mnKU0DJFAui7wSVSB
         bcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/obyKwhLmELIOTNjIjMVdmJhk74zSgJefv372u+mWk=;
        b=MTqFKMN5D3KGoV7Rid2KTqdULUIp5LkWPEke/K1LN5sMEqRmxWKauKlmzxL808cVrj
         Ch1Cn/e5Oz/S4OfbCS4d73+IvJp+Y3JyJYTduG1JPawhUS5HIRC7499t5yy+IKuxiq4N
         dTz3t3529xh8yx8aNLywk0rJFERw+VHkjWkIHY98DcTXK+VY/hFzvAWNupK/XU36e0hv
         rzaCY2iKvebf0GCxe+tefpBF7Pa5iAIV5ri1t7pNqyNX/diCZNMzcp3FqVEJoystzA29
         oAM9c+IgTDuNJ18PgB8zX0EWbVhPsddkuzaQmSZvFL+7GldXhL9/e9BnUs8o5mGsfUgR
         nKhw==
X-Gm-Message-State: AOAM532HAV0sjvZL7MAhM/fhJ2Sci4Y+tO8XxTslOSwkxbmDcRccdcI4
        reYCTWHePYkkNbj3KITuFogYxREfe5M0ktjgMoQLIA==
X-Google-Smtp-Source: ABdhPJy1+LfEuD8o9GFskPkG8bpoSM/jlOhzy1Ph5ajz7lZTeqmYNK0X1dfui/R4WQbABZDeaxI2ByEigdWN7vPUj54=
X-Received: by 2002:a17:90a:ae14:: with SMTP id t20mr9193687pjq.13.1605862460402;
 Fri, 20 Nov 2020 00:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20201120064325.34492-1-songmuchun@bytedance.com>
 <20201120064325.34492-4-songmuchun@bytedance.com> <20201120074950.GB3200@dhcp22.suse.cz>
 <CAMZfGtWuCuuR+N8h-509BbDL8CN+s_djsodPN0Wb1+YHbF9PHw@mail.gmail.com> <20201120084750.GK3200@dhcp22.suse.cz>
In-Reply-To: <20201120084750.GK3200@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 20 Nov 2020 16:53:37 +0800
Message-ID: <CAMZfGtW2QEuRgYv_WXjN5OU+EhLPO9UHJ+8puSoVG8cwKQBvjA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 03/21] mm/hugetlb: Introduce a new
 config HUGETLB_PAGE_FREE_VMEMMAP
To:     Michal Hocko <mhocko@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 20, 2020 at 4:47 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Fri 20-11-20 16:35:16, Muchun Song wrote:
> [...]
> > > That being said, unless there are huge advantages to introduce a
> > > config option I would rather not add it because our config space is huge
> > > already and the more we add the more future code maintainance that will
> > > add. If you want the config just for dependency checks then fine by me.
> >
> > Yeah, it is only for dependency checks :)
>
> OK, I must have misread the definition to think that it requires user to
> enable explicitly.
>
> Anyway this feature cannot be really on by default due to overhead. So
> the command line option default has to be flipped.

Got it. Thanks for your suggestion.

>
> --
> Michal Hocko
> SUSE Labs



-- 
Yours,
Muchun
