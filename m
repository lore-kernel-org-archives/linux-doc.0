Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F11BC1B0D9
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 12:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0915C2339F
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 12:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgLGMRa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 07:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgLGMR3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 07:17:29 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA15EC0613D2
        for <linux-doc@vger.kernel.org>; Mon,  7 Dec 2020 04:16:43 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id iq13so7239959pjb.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 04:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jD4wHcJJlBIQx2668YfWwft0+hoWgNC83Bw+E+5vHU=;
        b=urv5yGIB55SdkAowinQ5hQNE4We7mRVn/jy61tXEo+c5qJikiNyPSAOANZcKoFVXCh
         JQ0T3BpdVoNDfuFySpVTHCLylsab91jHwBjvq5soJR3ST/M2x2My9gFuojp5nbBLNpto
         upQ9pq1liyxJFaO/7VXvevlieC6z4bnw9t/KkpXoO/gsbTaAZ6+z6QtnyLTH02Qyyl+6
         PB70h6zoFvrpjbqIUoisTMNjlRSfGJf9KONB5K2j2uyUVwI+wqxFY81JzWK/68VamowZ
         0b2SfHZxEvaf/EWswY/H4+6NEM/IoDl31NvbiGliB/iz+wIJN2URLSmT0+Qda2X+Jhex
         572Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jD4wHcJJlBIQx2668YfWwft0+hoWgNC83Bw+E+5vHU=;
        b=MhZGWjBMy5qHvVHMz9Lgot6R4YFN0Xw7FkNxjQDURezB0wTanaEMWacAB+Yhn+qgb6
         HB9H0iyi9DZw2kE1aXgzj6dBPX/FagfAyRNlKW8ZuuHuUczkzzvxASrZhjDBxWZA8RpY
         rrLVSMlsRn6fbGUKSMgSVZthzMrnH9lqTz//QE2GHj4j5nL2VGLsTEMIhCi6u1QeKkcy
         KR1EZl7++Sp9r7lJV3PX8MbD0banALg2kguPMgjR6kY/RwNNzSwm4pM/ClTw/TtKKP8T
         27hesM6aypnp7vSROwUmxiqRZAkgPyJHosCraC3MY7U2Feezs9a+E3rUw5Ie2jZFfyGM
         +0Fw==
X-Gm-Message-State: AOAM5312S3URhpiC2ciLgbu2gnTUqGt2GLocCgCbwUVbGJACZ3gHAqSO
        X+Xft7R+XYV0QRI21skO/HdXBZ1TzuxDbOIXsiTGuQ==
X-Google-Smtp-Source: ABdhPJx7dJV6HPyqzd41Q0ApDOhuD6KvtSFfq9vHWey0F0Shcc9vdI4nXgzDX3fwRfhjmHt9GIpXonvCDxH4DymN7Qs=
X-Received: by 2002:a17:90a:ba88:: with SMTP id t8mr16138235pjr.229.1607343403421;
 Mon, 07 Dec 2020 04:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20201130151838.11208-1-songmuchun@bytedance.com>
 <20201130151838.11208-3-songmuchun@bytedance.com> <3840b0eb-bc65-6ad4-9ef9-f6e1603d1473@redhat.com>
In-Reply-To: <3840b0eb-bc65-6ad4-9ef9-f6e1603d1473@redhat.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 7 Dec 2020 20:16:07 +0800
Message-ID: <CAMZfGtVa3mmdJip=sPoAT-ibgimhiOAy+OKzpjtatzLd0SahPg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v7 02/15] mm/memory_hotplug: Move
 {get,put}_page_bootmem() to bootmem_info.c
To:     David Hildenbrand <david@redhat.com>
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
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 7, 2020 at 8:14 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 30.11.20 16:18, Muchun Song wrote:
> > In the later patch, we will use {get,put}_page_bootmem() to initialize
> > the page for vmemmap or free vmemmap page to buddy. So move them out of
> > CONFIG_MEMORY_HOTPLUG_SPARSE. This is just code movement without any
> > functional change.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> > Reviewed-by: Oscar Salvador <osalvador@suse.de>
> > ---
> >  arch/x86/mm/init_64.c          |  2 +-
> >  include/linux/bootmem_info.h   | 13 +++++++++++++
> >  include/linux/memory_hotplug.h |  4 ----
> >  mm/bootmem_info.c              | 25 +++++++++++++++++++++++++
> >  mm/memory_hotplug.c            | 27 ---------------------------
> >  mm/sparse.c                    |  1 +
> >  6 files changed, 40 insertions(+), 32 deletions(-)
> >
>
> I'd squash this into the previous patch and name it like
>
> "mm/memory_hotplug: Factor out bootmem core functions to bootmem_info.c"

OK, will do. Thanks for your suggestions. :)

>
>
> --
> Thanks,
>
> David / dhildenb
>


-- 
Yours,
Muchun
