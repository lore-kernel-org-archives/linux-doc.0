Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10DCC4363A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 13:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 466F62075E
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 13:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="bHBQYcj8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgJ2NfC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 09:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgJ2NfC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 09:35:02 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4DDC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 06:35:01 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i1so2831548wro.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KpTzlVayUqmIgARPOMPHIPf+pVQBXZ57u27MnCRyRl4=;
        b=bHBQYcj8neeWwxu6NrAHcOkwrOtEZGmaAjWKrh8jI1JhyZORzyCnXt3On6YqLd0N6p
         tErqMaeHRpKVhnOsWX3ipgXBeAanJDaLg2D8M4OQev81G0DQIHUklusbFlwpETgl05pA
         9uzcGGNCaO4+1Zg9YIBIK8jKoXD+ErnUL7DN3jIGsEqoYlvUdmyR609Qw/hR5IczuWjV
         VOAARd7lzT6kY3GvtELMpY3LsYW8LByBImUhKXyPeXliSUfxfhqOAPaLA5/E3P/6e0Cw
         EAEc+4wV66ab4E6oPsOs9CQKokMSZ7Skmwwz6q3RzYKcpQ3sF5XwenicLyIEirLdcuLc
         LAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KpTzlVayUqmIgARPOMPHIPf+pVQBXZ57u27MnCRyRl4=;
        b=gTD6aSrJE/6ijORj2lK88qtt1+acjm7sFBfqOBjseX59dJ3RJsOLhe99sNXRhozzeE
         4IUppoL2sYg5Ufxf9EVFosq8cd9lMIPrEJH+JPg9N8VdI3P+kJfQAP1zI8BtSUDrIdBU
         9FE4PeFK5amjhrKjlIUq2/RpgTU70FqZOmxaIIF3pUu9axJ1E/TovSFxKWelYVDYoLgN
         sjWfyL19O7GveQ01/uEaYPnxDAaagoi1VQsUKzI3kbdM4U+gzk8NOSt/GEPoW5O/DTtT
         3r3QxbLNkHYYOngTdrVxyyoZj5HntCgYRRV91aMw09FyH3d58Ot+nQEjU8i8c89wRlJS
         DxpQ==
X-Gm-Message-State: AOAM530Aq6IQKDmqTYstM/lxBOXWUShoScKAeV3g9w2Rwz7BYSde/Zz/
        Qvkd1sZ4yOXI+BvX8h3IKUV0FhwIfBKxTgKjtEyX+g==
X-Google-Smtp-Source: ABdhPJzoa2kj33P5RHtMoZgDs5yNcjZnapoviF7YdfZYL3bAMykZSBtyBQnjKWARVTGdeTQXxtRcORTM2XC5tC0dDY8=
X-Received: by 2002:a5d:69d1:: with SMTP id s17mr5830591wrw.398.1603978500435;
 Thu, 29 Oct 2020 06:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201026145114.59424-1-songmuchun@bytedance.com>
 <20201026145114.59424-4-songmuchun@bytedance.com> <20201029102913.GA31881@linux>
In-Reply-To: <20201029102913.GA31881@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 29 Oct 2020 21:34:22 +0800
Message-ID: <CAMZfGtVrKrvn0J7jVYjppRv_mF3y-e8RnL7aQRsqPLjfXH8T5Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 03/19] mm/hugetlb: Introduce a new
 config HUGETLB_PAGE_FREE_VMEMMAP
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
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 29, 2020 at 6:29 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Mon, Oct 26, 2020 at 10:50:58PM +0800, Muchun Song wrote:
> > The purpose of introducing HUGETLB_PAGE_FREE_VMEMMAP is to configure
> > whether to enable the feature of freeing unused vmemmap associated
> > with HugeTLB pages. Now only support x86.
>
> Why this needs to be a config thing?
> If this space-memory-optimization does not come with a trade-off,
> why does the user have to set this instead of coming by default?

Now we only support x86_64. If we want to support other archs. We
need some arch special code to support this feature. In the future,
if this patch series is merged to mainline, I will implement this
optimization for other archs. At that time we can remove the
HUGETLB_PAGE_FREE_VMEMMAP.

Thanks.

>
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
