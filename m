Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29AFC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 18:50:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9558E22ADC
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 18:50:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbgLUSu7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Dec 2020 13:50:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbgLUSu6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Dec 2020 13:50:58 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92399C0613D3
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 10:50:18 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n7so6855720pgg.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 10:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YliUtlY76/UIPuQ5v8deFXxZeb8eSvRLcMxme2JxEEk=;
        b=HDksKqgKauZN6tvbdPBgggj8IeeTS2c7JRuSWMI+pRG1FwKAhMCJxMCv7JOIqk50wv
         3X1HRLkpEKIsTmGLQK6vIyf/RMl8sqUJoc0+IVGVdkvPNiQkOjCyDbUhahzYluorDnrk
         1PDsuxVXgwT/JnDR/e8fyiqWr/gjcp4gXGi2ngqD9bS5/EBS76qfZPKMvDBaRcXFxHGt
         YOSyX7QbQ/Koym0Jms6BgoWpgnw/5heVHu2j7+FeQsRTUWVZEWILea7Byq/nnV5Cq6bO
         YDDYicvRlZMY5s2D5oa9p6I/4Nwjhwv9qDpErWN/14vrvlkMgsgZNqe/YH2kcc3Fnt+d
         1eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YliUtlY76/UIPuQ5v8deFXxZeb8eSvRLcMxme2JxEEk=;
        b=M/2GJOl9QtzhTJKCJ9KbMXUJZ7gLG5GVpIlxcX9X7chdrdxUJia1knTO6cDnq2IVfT
         qI6XKrIPIjBfbXxR+xRqKvYoUru2wkcELiiFWFA+9xgsGV1qKdSOmdBebP4sW4Moqcth
         eBHblY47imNO0ZXIwTh3OiLLgMEeFx30mMdilD2tug0ULyFnb8+OJ0oqebKMn+fVZCDU
         6Sq+jdbsXadg+BhJniuaMRejaEtxb5B5zC9iMPVEjVMUCN/0TdI+1mURBYGv/1yeiPG6
         yus4GoPznGIs7SLw9+l5S2kmKIRlogvVtDnhVPq+IzTvCRsIg5k3JGqDJpQvMTA33sJl
         7Rmg==
X-Gm-Message-State: AOAM53014pBftLQcj5yinzF5NHLsBM1d9bXSOI1rs1y0UMPyjqlfKd0s
        2EV1l1x5TyTDpEqgncL60pQtsMfv+MnOZ84dDD/GkbYbj38ZeagE
X-Google-Smtp-Source: ABdhPJxKT6tC6/ndV2N5i1FwKZxN3yOMknKcMYRbpSq6pVUOWTKpPSP2SnmFD7tg+Np8Z6fWmUqBTLjQBM+VPNs1bYw=
X-Received: by 2002:a63:480f:: with SMTP id v15mr2249541pga.341.1608565986866;
 Mon, 21 Dec 2020 07:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20201217121303.13386-1-songmuchun@bytedance.com>
 <20201217121303.13386-4-songmuchun@bytedance.com> <20201221091123.GB14343@linux>
 <CAMZfGtVnS=_m4fpGBfDpOpdgzP02QCteUQn-gGiLADWfGiVJ=A@mail.gmail.com> <20201221134345.GA19324@linux>
In-Reply-To: <20201221134345.GA19324@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 21 Dec 2020 23:52:30 +0800
Message-ID: <CAMZfGtVTqYXOvTHSay-6WS+gtDSCtcN5ksnkj8hJgrUs_XWoWQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v10 03/11] mm/hugetlb: Free the vmemmap
 pages associated with each HugeTLB page
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

On Mon, Dec 21, 2020 at 9:44 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Mon, Dec 21, 2020 at 07:25:15PM +0800, Muchun Song wrote:
>
> > Should we add a BUG_ON in vmemmap_remap_free() for now?
> >
> >         BUG_ON(reuse != start + PAGE_SIZE);
>
> I do not think we have to, plus we would be BUG_ing for some specific use
> case in "generic" function.

The vmemmap_remap_range() walks page table range [start, end),
if reuse is equal to (start + PAGE_SIZE), the range can adjust to
[start - PAGE_SIZE, end). But if not, we need some work to
implement the "generic" function.

  - adjust range to [min(start, reuse), end) and call
    vmemmap_remap_rangeand which skip the hole
    which is [reuse + PAGE_SIZE, start) or [end, reuse).
  - call vmemmap_remap_range(reuse, reuse + PAGE_SIZE)
    to get the reuse page.Then, call vmemmap_remap_range(start, end)
    again to remap.

Which one do you prefer?

> Maybe others think different though.
>
> --
> Oscar Salvador
> SUSE L3



--
Yours,
Muchun
