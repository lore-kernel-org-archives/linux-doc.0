Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B05C433E9
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 11:08:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8949422512
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 11:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgLULI4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Dec 2020 06:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgLULI4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Dec 2020 06:08:56 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BC5C061282
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 03:08:16 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id l23so6263452pjg.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 03:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fCGxNgt4GzjA2J6Ybm1/RunLTw4Cq07YupT3iACrfFE=;
        b=B5uSct3PlX3Kr2qHj80JA4OzaFMIIWkWLrcFydCymroCnU4gdEWUxv+k4jLZQN5EmH
         r4KZ36GROasljVcxMEDBFuIjx5kDLgAYT0jx/0eFjIJ+RTwumNYYW5wiqWDYEGaIfGZ6
         B1J9gjOQlc6xCuXmInx6VPGQbW/KAlLapxKaFS9FEvbSBYBksXlg8agiKvEwwvZKdZsq
         g68GPvFpDpgpTs47V5dAaPJPY0td3gBMd4XF4IJGKXhhMLH7UxHarEzpnTluxYZhPwtJ
         zc5X0VzG2K69a8/Rau9IXEy2PP+GsTEWB0r4Gy4aYSNPDMAvW0fcn/Xpj1efl/rD+jv9
         Bw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fCGxNgt4GzjA2J6Ybm1/RunLTw4Cq07YupT3iACrfFE=;
        b=DQNT/BxoBYbYHB8qwa4Yg3s8CJvMQtWr3tc+WIlZgAUyuoc/P2qG04Uu6I79SXzJy2
         LTWZFG/GqcTH8V+OPoCSTDD6tRNCwWbUCx2I989/dpzbWIyACYLpkUX4+QddRA52c7yt
         ostHTr4BqifkvFE2ugoEyQj+2NNQZUfGsjJn/+MIVu0eB6bIX5/DpXlPrYOu/MkIw89K
         MM/i3DJVELQWHyLpN+AIvmo2GuBehCHEfifGKVrs1XmuIjqd/HpfvB4qWghWxvzqdY6l
         sfsfDs65EfoZKtW3OZOEB3y7xyhHpG53kfyb64fZVkwDA7V1cZ/TQR8LXDfCKUBLpvjI
         6Kqw==
X-Gm-Message-State: AOAM5324yEKmtOk5g9UKebkgLDbn2aK5nHQ/2dg9RQSt4pAVCkwtkxUn
        oMgQnevTmq1Fpcy48SL3XTR39YWeRiMdGl4esHjI8g==
X-Google-Smtp-Source: ABdhPJy+5TgHcPSu8gMt1h1aG/LqaNFQSJjtwWsk5Gyn08DMQ3M95ZayPCuRTgLij5s8O5gnZE+fn6qyzAL9VBxRPHo=
X-Received: by 2002:a17:90a:c588:: with SMTP id l8mr16683485pjt.147.1608548895665;
 Mon, 21 Dec 2020 03:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20201217121303.13386-1-songmuchun@bytedance.com>
 <20201217121303.13386-8-songmuchun@bytedance.com> <20201221104013.GB15804@linux>
In-Reply-To: <20201221104013.GB15804@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 21 Dec 2020 19:07:37 +0800
Message-ID: <CAMZfGtWK5uJE=W5O+dg4XO5zgTQUVpL0bjPB6im4+GZa3U+dsA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v10 07/11] mm/hugetlb: Flush work when
 dissolving hugetlb page
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

On Mon, Dec 21, 2020 at 6:40 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Dec 17, 2020 at 08:12:59PM +0800, Muchun Song wrote:
> > We should flush work when dissolving a hugetlb page to make sure that
> > the hugetlb page is freed to the buddy.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thanks.
>
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
