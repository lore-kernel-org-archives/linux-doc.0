Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67161C2D0E4
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 11:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF9412083E
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 11:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="S510g7kb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731882AbgKXLOZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729241AbgKXLOZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 06:14:25 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10AEC061A4D
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 03:14:24 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w187so3673350pfd.5
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 03:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v/sot8C2WsjzLbiXIhxi+5cp9rKmtAFXiiGvcKf+TbE=;
        b=S510g7kb5vjSscjz2aQWVET1/qXviVXD2YCzJUVzQGY1FWvp9RWqUzYO9kykrDBSBU
         qufXQya3b+g2T8LrFfnd/CZHuwh8CPyZvElR50o4yNB6cyYWz0cWZhcHaQWPMQ8hbEOa
         m9UlcQXNdJSSywxcKqHN/OIHiC8/mFJLshrwTypZV3z6/WWtcQ0N4AUWnsBQkvyGn4fT
         hRaVjfuRJQDQA/nqTO6moD3WeYsyR06s4kN+lfkBmgtXegNiM5AgRXlUWUibck8hq795
         OehpHHbmzF8wrw4YJm2cBicnzqhlktXZRZgpAFJFxDxwu+55nF9BjzIFmk7/4IIPTjDG
         /obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v/sot8C2WsjzLbiXIhxi+5cp9rKmtAFXiiGvcKf+TbE=;
        b=O1qymhGAwlzZakl4ddORcwglGlrsvQ2nB3mFVzW6vzaOvHWNGX72WGlB9G+4Qo68xh
         tqDN3Hugrg4w7Kn33hO51AKP7cPetRPJnguR9y2dyJ3oH3jGLHhLaAqFwzoZI8k4Qa00
         EXPb5YFrEvevHxbhnEtDtbBPHdYfmFZCEQLTNeIPhO12jvAkL32jgZ382gkCMw+QzWso
         aDKzLyLM5I+ScsVzXr+mhLXI+kuI6R1d3fbdfqd/m6Q5f6S5h8zt7Nc3NUtKbzw9qw1G
         ettRZpZVqzTGCP2LKBrb03cIfbEcfTXgI5Q48kC6rf7/D1so/n6ITJXbexma7ox7pZkI
         X5cw==
X-Gm-Message-State: AOAM531eaIElYWNOR6sJn47CKcugNm69nKdOBsPoJD3q2t+7yUnJ+VYl
        NBxp1jmsHGZf0K9sEBWmNALKgmJpxrvwtv0Qc2oyrQ==
X-Google-Smtp-Source: ABdhPJwZQyY7kH8gIqzhnKBbLHHF3RPAiMy6aiswptBAfQVUw6PtBUQ54ClI+tM+sA0E0N7Y9Z5aGZQA2c9JBp3BKdU=
X-Received: by 2002:a17:90b:941:: with SMTP id dw1mr4338471pjb.147.1606216464411;
 Tue, 24 Nov 2020 03:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20201124095259.58755-1-songmuchun@bytedance.com>
 <20201124095259.58755-8-songmuchun@bytedance.com> <20201124102441.GA24718@linux>
In-Reply-To: <20201124102441.GA24718@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 24 Nov 2020 19:13:47 +0800
Message-ID: <CAMZfGtVRywVmfWSLPwy4HFPa8O9--Acx+Tsd+tiJa3U3gwF-sQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6 07/16] x86/mm/64: Disable PMD page
 mapping of vmemmap
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
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 24, 2020 at 6:24 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Tue, Nov 24, 2020 at 05:52:50PM +0800, Muchun Song wrote:
> > If we enable the CONFIG_HUGETLB_PAGE_FREE_VMEMMAP, we can just
> > disbale PMD page mapping of vmemmap to simplify the code. In this
> > case, we do not need complex code doing vmemmap page table
> > manipulation. This is a way to simply the first version of this
> > patch series. In the future, we can add some code doing page table
> > manipulation.
>
> IIRC, CONFIG_HUGETLB_PAGE_FREE_VMEMMAP was supposed to be enabled by default,
> right?
> And we would control whether we __really__ want to this by a boot option,
> which was disabled by default?
>
> If you go for populating the memmap with basepages by checking
> CONFIG_HUGETLB_PAGE_FREE_VMEMMAP, would not everybody, even the ones that
> did not enable this by the boot option be affected?

Yeah, this should be improved. We should enable the basepage mapping
of vmemmap only when this feature is enabled via boot command line.
I will apply the suggestions mentioned by Barry. Thanks.

>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
