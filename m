Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423E3C4332B
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 18:07:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28C9222D49
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 18:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgLUSHS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Dec 2020 13:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgLUSHS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Dec 2020 13:07:18 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F820C061248
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 10:06:38 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id x18so6016324pln.6
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 10:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JhvMmYOdFPEQsdkzltW2aRwWzXxJ2fIZG/7Lv2kkB4c=;
        b=S5szebOzFDTVguVH8GCcLC9zpyBaokUUS+BlpueH6g4aieSbtIbuFAiiS9ULXSSPK5
         YhMDHcJxfvAo6CKneTwM3uuCMuExpke2+xkkUi55NbLlv8d7UawDMb1fUYKFrj7F9YIZ
         eqLlBlQ30iCPJh0YZXC1pwX57XF0Ra7y63UMvYAT2gG2SpmeROQU3KoJwYG3nhfzmOE8
         dgPvXgeghZrwoQ+0i6TzwM5Rhg2zBVDrdapU3W0185lxQ62LVv6WKSJ5m9jZeCsh2HDY
         tQFEHxx5KfF4kRJwzW+SPzGk5jSlNa3iXvRRg7zflT7KlH6mX4lMS+llXxNok4UtMVes
         nWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhvMmYOdFPEQsdkzltW2aRwWzXxJ2fIZG/7Lv2kkB4c=;
        b=WqFSh8s1VZh46YX+o9DSPjSQA9r47E3C1q6EO/9/i264f5Qlsdj8Mbex9XaOZZVM5J
         wE3kkiCxZ23OfFLHbXLq6w9lzkt4hy0LasOH7egRYgZ/rKmkoG+AuAdm0IeGdXPNPGtd
         KgTuMvgLhUujmYoe2pPCSYeFkbfPngHl2wdmgOQ498hM0yAGpHCdmRDEwmJ6JtE7NPp7
         f6i6BNx6v+nlzYPuaLLzFwRh+4GIP8yMin83Vuw1zZVCN8eL0p0uYJFyWT6/l4CKn8+V
         H0whPTekzJ7oRPKv9EL0liAr+pQZzZw3S0Uk920560QhrEmzY6m7NayF4ViL8MsUrhzK
         gN8g==
X-Gm-Message-State: AOAM531A90hah4udOn8O1q+b6t6Krl5DCC9TwXBCASN+G5b3gJR2jc7M
        O81eu9r6NhJQgDeP8QLgUu+eq2Sqt+LVov1KfIp6gSAtfR1l5zMS
X-Google-Smtp-Source: ABdhPJwVx//EDYahork2LZ/VOpYoYko3xANCgxRVilG3AdbDW9UcKntl7bSI1Dn7ehiZiOaGvbQDz+RUAAvPxjhTtiM=
X-Received: by 2002:a17:902:ed0d:b029:da:c83b:5f40 with SMTP id
 b13-20020a170902ed0db02900dac83b5f40mr17050460pld.20.1608563927117; Mon, 21
 Dec 2020 07:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20201217121303.13386-1-songmuchun@bytedance.com>
 <20201217121303.13386-5-songmuchun@bytedance.com> <20201221102703.GA15804@linux>
 <CAMZfGtW0jzNchLqieAudyk4TsaAUtYEdoC=j+gkkVLJBaKg3pA@mail.gmail.com> <20201221141242.GA19680@linux>
In-Reply-To: <20201221141242.GA19680@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 21 Dec 2020 23:18:11 +0800
Message-ID: <CAMZfGtXgzorGv_hymZF_cJPv2qziVG6xN5hCGFqT3KOjCZOteg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v10 04/11] mm/hugetlb: Defer freeing of
 HugeTLB pages
To:     Oscar Salvador <osalvador@suse.de>
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
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>, naoya.horiguchi@nec.com,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 21, 2020 at 10:14 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Mon, Dec 21, 2020 at 07:07:18PM +0800, Muchun Song wrote:
> > > The above implies that update_and_free_page() is __always__ called from a
> > > non-task context, but that is not always the case?
> >
> > IIUC, here is always the case.
>
> I might be missing something obvious, so bear with me.
>
> I guess you are refering to the call __free_huge_page()->update_and_free_page().
> AFAICS, free_huge_page might call __free_huge_page right away when in task
> context, and so, we would be calling update_and_free in a task context as well.

Yeah. You are right. I mean the call __free_huge_page()->update_and_free_page().
Because update_and_free_page is called under hugetlb_lock, it is
non-task context,
right?


>
> Or are you referring to the other callers?
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
