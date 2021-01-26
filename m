Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFFFC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jan 2021 01:22:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 712972068D
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jan 2021 01:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390349AbhA0BFT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 20:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405454AbhAZUNo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jan 2021 15:13:44 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E53C061756
        for <linux-doc@vger.kernel.org>; Tue, 26 Jan 2021 12:13:04 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 30so12178714pgr.6
        for <linux-doc@vger.kernel.org>; Tue, 26 Jan 2021 12:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=MZYb3kMF2SoGhQLq5uahaotIljLrCGTAaVi1yzZyu+E=;
        b=rQtBBq+7DEn/8UuWrdJpmlK6c2JgXMWkSZxkTYfBFywMyAgDmZ3D6kVk1XD7N4TpHG
         PvdaUbNm1FtCjSsxSNKYb21sZWE+FesWDmaqZJe1fIRIN+d01oQOLKWNmEyBCUWpaCnA
         tyRSF3dTrqreqh7gLq8WNVhIakPsxJvlRMGDbiZtfBMgQlpRubYNmTs8aqj5jPNuw3MZ
         Qj+oYMuu64b3BBGRK2XStdfjft74djPS0nsShYhxMadKUIDsyoYSXbU0KgSCFJ86cr48
         BFU4RksGcs+cVjZ/WsOGHyS5w5Ho7RdcZn2+1Xj63/rQ81KjK+iAQW+PBT70u49bbumo
         if8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=MZYb3kMF2SoGhQLq5uahaotIljLrCGTAaVi1yzZyu+E=;
        b=EevNwV+WxN9Y2zW/OUODk5ZJIUzm++S3fcQicvjIi11l2RlehzciKokJO+90MyvXxt
         7vV9l02LKfQB/MAw15tflg85UQGfwd5i9g+MwX6JwS8+C7eim59mAT6Vtr9cm5UVE0if
         Xg+4XeKogHA2RrJHOTKyjDzA6Ujm7WzyPazO7BVCxwkcPiVC7y3OBammM2Ba3e5Fv6/V
         HFWyuMKMIjqSOdb0a5uxrAHQME31dGd7V2iP3LxF7UE7W9Yjqni/qSJ0t3fG1pd5zoCO
         dED6He6Jgr9sXkjc98Gc77YsK23YIAO/vPpA5bgcicni47Q0InJFa6F75csMW5m/NzF8
         fNhg==
X-Gm-Message-State: AOAM531bnL4ndTI1zWf0wrH9I5uToxdXI+mG59/HMGjYb90r038oxn0r
        x74nmLnBxdMRZf3UUlnfJ9QPgw==
X-Google-Smtp-Source: ABdhPJwZygl3THYUBXlV0yKqnpk9E6JCOBrWWpJo/lOob6A1GtjpuoLMvN5gWCLSRVFfbY7V4Hp60A==
X-Received: by 2002:aa7:8f13:0:b029:1bd:f965:66d8 with SMTP id x19-20020aa78f130000b02901bdf96566d8mr6613362pfr.80.1611691983496;
        Tue, 26 Jan 2021 12:13:03 -0800 (PST)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667] ([2620:15c:17:3:4a0f:cfff:fe51:6667])
        by smtp.gmail.com with ESMTPSA id 124sm19455216pfd.59.2021.01.26.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 12:13:01 -0800 (PST)
Date:   Tue, 26 Jan 2021 12:13:00 -0800 (PST)
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
In-Reply-To: <CAMZfGtWCy-krzL1ejOOq2rZQ3mPbBUSNqmQd-svABMKxE0FcsA@mail.gmail.com>
Message-ID: <4ab7e425-711f-dad9-6a43-e480d5a92b8a@google.com>
References: <20210117151053.24600-1-songmuchun@bytedance.com> <20210117151053.24600-3-songmuchun@bytedance.com> <472a58b9-12cb-3c3-d132-13dbae5174f0@google.com> <CAMZfGtUGT6UP3aBEGmMvahOu5akvqoVoiXQqQvAdY82P6VGiTg@mail.gmail.com> <eef4ff8b-f3e3-6ae0-bae8-243bd0c8add0@infradead.org>
 <CAMZfGtV5rcCq6EGFAG4joRfWht0=1WE6Oik7LgNUPr-_iNX4Xg@mail.gmail.com> <2d9bfd8d-a77f-6470-807c-1a71ffeac3ff@google.com> <CAMZfGtWCy-krzL1ejOOq2rZQ3mPbBUSNqmQd-svABMKxE0FcsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 26 Jan 2021, Muchun Song wrote:

> > I'm not sure that Kconfig is the right place to document functional
> > behavior of the kernel, especially for non-configurable options.  Seems
> > like this is already served by existing comments added by this patch
> > series in the files where the description is helpful.
> 
> OK. So do you mean just remove the help text here?
> 

Yeah, I'd suggest removing the help text from a non-configurable Kconfig 
option and double checking that its substance is available elsewhere (like 
the giant comment in mm/hugetlb_vmemmap.c).
