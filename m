Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88E4C4361A
	for <linux-doc@archiver.kernel.org>; Fri,  4 Dec 2020 03:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 861C7221F5
	for <linux-doc@archiver.kernel.org>; Fri,  4 Dec 2020 03:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgLDDks (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Dec 2020 22:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgLDDks (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Dec 2020 22:40:48 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D16C061A51
        for <linux-doc@vger.kernel.org>; Thu,  3 Dec 2020 19:40:08 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id b10so2778503pfo.4
        for <linux-doc@vger.kernel.org>; Thu, 03 Dec 2020 19:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kP0kqVxYlLhlxakYbEWvE8pzB4Mj7yplj9IQfIP/Nqo=;
        b=RXeno4fHs2hClfvDpmt84Kb0l0ffZ+tfCf4eGR4N2xKr5d+GEweCV3ikwwgvmK8Jz8
         7yRlfUm9ZgJHUw0G7xO4JpRTa6nHUnxHGOP3ecvxLWNCVn2qfP0+4sEXxg+TQ6dzvNdB
         8fFJclIAPEb3EGx/lzzZi/6MYFK1BUfwM3r0BthCHtK3IOfFmB7QRDuVsNQ+2GSAaMLj
         Fx7lToXjBVngkeA49IgqF5XW44cP2AB3Llrt2EDOfpZX1pB/6wcSb6Q/s5a06s8rxYkP
         f6HLsRbClLzTOVfJPPeTaEpznXSGk9wCHNM+A1LjcwaYFE4EheH05Ug+dHysIlihP4qm
         fqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kP0kqVxYlLhlxakYbEWvE8pzB4Mj7yplj9IQfIP/Nqo=;
        b=eT9hIpeiC2Vn02NUECX/747c+gRLDGG31tlxboktRMQM9RSi4Iei1uKAcEmq+ZdzIx
         LR7Qft1jr3yosa5LT5F3tEZgYvAu9G8zqOrm0TL12J2j32ZXI0v+lB65BAV4ZB+veGM4
         7pjz3gGhQGXQbyJLbRq36KJvLKOcjqDwycn/2NvwDYUPZsAIgtJgdeJ2lWyWrClHB13v
         n2kE+dhhcoRzQBypyfMsKX67FA90a9svMDMfX5I6GCQgXQFLPxq97S+ZS60pcYk98sdD
         mZdRq4p8Oz6k8qtnpHoyzYf/uhusgk4FQB/WVe1KU3RoLCBAzQ0WVBwVjrI2wqD5Vd1p
         DVJA==
X-Gm-Message-State: AOAM532gXwhtWLlay3AHYKtxLQpaU1xnO/KD0bbGEKbD7obSHQhkkNL6
        BtDq7ZLJQiic/orBueWp2Qfkje2L125mS3sVwiHmtw==
X-Google-Smtp-Source: ABdhPJynCEO+aYzaCWwl98Gj7aTZquZAjP6gvBEF+xIuWOhnCtjsbj71ZJ7LyQ2PQpmasXLQiRg6kelKrNEq9MwhbLk=
X-Received: by 2002:a63:1203:: with SMTP id h3mr2402111pgl.273.1607053207913;
 Thu, 03 Dec 2020 19:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20201130151838.11208-1-songmuchun@bytedance.com>
 <CAMZfGtWvLEytN5gBN+OqntrNXNd3eNRWrfnkeCozvARmpTNAXw@mail.gmail.com> <600fd7e2-70b4-810f-8d12-62cba80af80d@oracle.com>
In-Reply-To: <600fd7e2-70b4-810f-8d12-62cba80af80d@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 4 Dec 2020 11:39:31 +0800
Message-ID: <CAMZfGtX2mu1tyE_898mQeEpmP4Pd+rEKOHpYF=KN=5v4WExpig@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v7 00/15] Free some vmemmap pages of
 hugetlb page
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, dave.hansen@linux.intel.com,
        hpa@zytor.com, x86@kernel.org, bp@alien8.de, mingo@redhat.com,
        Thomas Gleixner <tglx@linutronix.de>,
        pawan.kumar.gupta@linux.intel.com, mchehab+huawei@kernel.org,
        paulmck@kernel.org, viro@zeniv.linux.org.uk,
        Peter Zijlstra <peterz@infradead.org>, luto@kernel.org,
        oneukum@suse.com, jroedel@suse.de,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        Mina Almasry <almasrymina@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        anshuman.khandual@arm.com, Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 4, 2020 at 7:49 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 12/3/20 12:35 AM, Muchun Song wrote:
> > On Mon, Nov 30, 2020 at 11:19 PM Muchun Song <songmuchun@bytedance.com> wrote:
> >>
> >> Hi all,
> >>
> >> This patch series will free some vmemmap pages(struct page structures)
> >> associated with each hugetlbpage when preallocated to save memory.
> >
> > Hi Mike,
> >
> > What's your opinion on this version?  Any comments or suggestions?
> > And hoping you or more people review the series. Thank you very
> > much.
>
> Sorry Muchun, I have been busy with other things and have not looked at
> this new version.  Should have some time soon.

Thanks very much.

>
> As previously mentioned, I feel qualified to review the hugetlb changes
> and some other closely related changes.  However, this patch set is
> touching quite a few areas and I do not feel qualified to make authoritative
> statements about them all.  I too hope others will take a look.

Agree. I also hope others can take a look at other modules(e.g.
sparse-vmemmap, memory-hotplug). Thanks for everyone's efforts
on this.

> --
> Mike Kravetz



-- 
Yours,
Muchun
