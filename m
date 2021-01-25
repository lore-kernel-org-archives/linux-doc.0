Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CFCC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 18:49:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACE5E224D1
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 18:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbhAYStV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jan 2021 13:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730627AbhAYSsS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 13:48:18 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEFEC06174A
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 10:47:33 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id j12so135309pjy.5
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 10:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=ETq2ktZkANjUC7Me/RyH9n1tJakbH50bRmVCx0xOmwg=;
        b=OwEBYQmaBsKbc7iDfMlqm2AWtZvRyFNZfh0RZHpJvnSTDzlpuc8InF121vKQkdAM9I
         o48u7t/O1pHkbeuCyGvD7PBJxbfgQ1ZpGAs1P93++HXiembtNowP79kdpPL71MazE2Js
         MOjKH7BVJPSFVTSk2iMDaDNbJ66ZVC/Oyudj3q0Ek98fFGw/iu9n0JPoBDNWgkY6JayK
         ptMBDCpsyrA7UZQzBm4vtKw6TLFOGYqAjPF1awu+O3RoDAwgGvyeZMIY1Km951sUFv19
         kr02qfCVRCvnVUjfbxLlg0eG0NaOULqteXBvwUnwOULESMD4hbmUWrAGjdwvS8W2jeE7
         +Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=ETq2ktZkANjUC7Me/RyH9n1tJakbH50bRmVCx0xOmwg=;
        b=gNaYiS695qV8upR8VRzaf6km7VK2nGJ9f9GyQq/kTHzjbigSJbtM+msV8U+NhL0+CJ
         mHhvhQ1vcNfSuvcLP5HAt/SjMSFJi7Yllc3vj3Anj+nyi1LSJNjveMwIIxhLJ2ocwVPQ
         65hRicGIl1OVQUUvxalj9+Y6NXKnIcu1m9K4i5mddOFGuFazQzpP1lJYblkWM7eOMtwN
         X395S4+xY6KZtb3rptkXSuB1xEp0Z5PZK1QLx8e7GwWw8FcL6x8c8neQfnwuyAboyCb9
         41pGhIGK9ZIZOd2RAwIhrYt/bAVUy8WnrYMuC2Qav3WK0SvSTu0Hzu+hl064lwaVaKoo
         hDhg==
X-Gm-Message-State: AOAM530Qw7EAMIqlhIsMnWp25K6NgjTkFj0jf3MPJMFUGUcOFn5Cu4rr
        39c5POJ3dUnBfwEUHHEYeR5Gkg==
X-Google-Smtp-Source: ABdhPJwcJvhoNQhB4A5BKUQVkatkkHcE3W30AKdVI3lYpo5ilXK0mRFQaoESZtN23pj62Dq7kfxK8w==
X-Received: by 2002:a17:90a:a394:: with SMTP id x20mr1593054pjp.24.1611600453220;
        Mon, 25 Jan 2021 10:47:33 -0800 (PST)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667] ([2620:15c:17:3:4a0f:cfff:fe51:6667])
        by smtp.gmail.com with ESMTPSA id z16sm17086131pgj.51.2021.01.25.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 10:47:32 -0800 (PST)
Date:   Mon, 25 Jan 2021 10:47:31 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
To:     Muchun Song <songmuchun@bytedance.com>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?Q?HORIGUCHI_NAOYA=28=E5=A0=80=E5=8F=A3_=E7=9B=B4=E4=B9=9F=29?= 
        <naoya.horiguchi@nec.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [External] Re: [PATCH v13 02/12] mm: hugetlb: introduce a new
 config HUGETLB_PAGE_FREE_VMEMMAP
In-Reply-To: <CAMZfGtV5rcCq6EGFAG4joRfWht0=1WE6Oik7LgNUPr-_iNX4Xg@mail.gmail.com>
Message-ID: <2d9bfd8d-a77f-6470-807c-1a71ffeac3ff@google.com>
References: <20210117151053.24600-1-songmuchun@bytedance.com> <20210117151053.24600-3-songmuchun@bytedance.com> <472a58b9-12cb-3c3-d132-13dbae5174f0@google.com> <CAMZfGtUGT6UP3aBEGmMvahOu5akvqoVoiXQqQvAdY82P6VGiTg@mail.gmail.com> <eef4ff8b-f3e3-6ae0-bae8-243bd0c8add0@infradead.org>
 <CAMZfGtV5rcCq6EGFAG4joRfWht0=1WE6Oik7LgNUPr-_iNX4Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 25 Jan 2021, Muchun Song wrote:

> > >> I'm not sure I understand the rationale for providing this help text if
> > >> this is def_bool depending on CONFIG_HUGETLB_PAGE.  Are you intending that
> > >> this is actually configurable and we want to provide guidance to the admin
> > >> on when to disable it (which it currently doesn't)?  If not, why have the
> > >> help text?
> > >
> > > This is __not__ configurable. Seems like a comment to help others
> > > understand this option. Like Randy said.
> >
> > Yes, it could be written with '#' (or "comment") comment syntax instead of as help text.
> 
> Got it. I will update in the next version. Thanks.
> 

I'm not sure that Kconfig is the right place to document functional 
behavior of the kernel, especially for non-configurable options.  Seems 
like this is already served by existing comments added by this patch 
series in the files where the description is helpful.
