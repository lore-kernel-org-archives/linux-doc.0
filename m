Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F9EC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 15:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238901AbiC2Pjc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 11:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238891AbiC2Pjb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 11:39:31 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BB1255A85
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 08:37:47 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2ea1b9b3813so82627797b3.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=cdiQn4MDYBZT4MD+COiiujM149rg5cmUvhmDH4fWhAI=;
        b=b0FFvlB+8/wM/+w8iI8lE3ZS1QMXytKOW4Cd8OhonyTCVfrB84LSEiNtPADXgnwKgl
         N+ZiZJwyZfFo12Ku19vtLdM8bGKMUoBbqeZfKMl00u5tCdsmeS7yK9jciIMY65MA5Leh
         wi7Vi6n17nHUdocZtBuEF0AfuX37TtK3WKvQjR3nmDnEsDi+Sr4TAxOEamyJ1xSBSmCe
         4Pwh7A+3X82yrIM0K7qQjp/6hfecVXgWXVdpSDFEju9zKhESv8854khenVmLUnxFipPo
         Buzkkyx8o6TwydErWCWb7snbfCJa755Z52eELhBcDUkvsuMykgHRWeBQ2eiFPsbGrvz3
         PeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=cdiQn4MDYBZT4MD+COiiujM149rg5cmUvhmDH4fWhAI=;
        b=Csd2HBNTOK28fX7oGXXNp3N9cRiVNW3EVj8vjWHn4wLEwRl1lJWw4ZZofjLvHNUmDf
         mBIMeECNGPjkrpqf53V/+XVJB1ybB/V27Gb7bys3dJmWpo8fmJve6kir03yB1liKdhov
         z8L0CqVNe5SjmTwEaHbMf4Bq3LMbllzdvGlGY1p0RQqd0UiXsSkqCtu75wp4CmVAUVYU
         rj43RqVSOpUkvN3XVTH/tlcnPzLOulqeiwsJueB9DGIPLrC2APvUGAfUD7OlEUEAkxbu
         QBlhQdG/iyHYNi9rNQi2YhxkO7YwP6ghEo8/cSiiN8uraMVrlh8o9auXd4FFOMN7HODu
         1BdA==
X-Gm-Message-State: AOAM531lXkS2VGhBuGEV3dJpIiZNVyKsI0SEANY2fjcFy62cRl4A9flE
        +R9h1BvVgaYoMuMCDDiKIOBHFWtAw24TEhSvyh1s6w==
X-Google-Smtp-Source: ABdhPJy264N9elL1uOkqTXbYsKQktV0xNWVZwrTTKjVZDqGQCViM7C+xgfzXs+Ws9tjYbgAAQVu8W3L5CmwVqLyLbVo=
X-Received: by 2002:a0d:ccca:0:b0:2e6:2b53:3f16 with SMTP id
 o193-20020a0dccca000000b002e62b533f16mr32560002ywd.35.1648568266768; Tue, 29
 Mar 2022 08:37:46 -0700 (PDT)
MIME-Version: 1.0
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 29 Mar 2022 23:37:10 +0800
Message-ID: <CAMZfGtU1sbsrnCbCKi_By8VTGN1CA1s4A=s1NcHzRunDUpGXgQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] mm: hugetlb_vmemmap: introduce STRUCT_PAGE_SIZE_IS_POWER_OF_2
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 25, 2022 at 1:11 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Mar 23, 2022 at 9:57 PM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > If the size of "struct page" is not the power of two and this
> > feature is enabled, then the vmemmap pages of HugeTLB will be
> > corrupted after remapping (panic is about to happen in theory).
> > But this only exists when !CONFIG_MEMCG && !CONFIG_SLUB on
> > x86_64.  However, it is not a conventional configuration nowadays.
> > So it is not a real word issue, just the result of a code review.
> > But we have to prevent anyone from configuring that combined
> > configuration.  In order to avoid many checks like "is_power_of_2
> > (sizeof(struct page))" through mm/hugetlb_vmemmap.c.  Introduce
> > STRUCT_PAGE_SIZE_IS_POWER_OF_2 to detect if the size of struct
> > page is power of 2 and make this feature depends on this new
> > config.  Then we could prevent anyone do any unexpected
> > configuration.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  Kbuild                           | 14 ++++++++++++++
> >  fs/Kconfig                       |  1 +
> >  include/linux/mm_types.h         |  2 ++
> >  mm/Kconfig                       |  3 +++
> >  mm/hugetlb_vmemmap.c             |  6 ------
> >  mm/struct_page_size.c            | 19 +++++++++++++++++++
> >  scripts/check_struct_page_po2.sh |  9 +++++++++
> >  7 files changed, 48 insertions(+), 6 deletions(-)
> >  create mode 100644 mm/struct_page_size.c
> >  create mode 100755 scripts/check_struct_page_po2.sh
> >
> > diff --git a/Kbuild b/Kbuild
> > index fa441b98c9f6..21415c3b2728 100644
> > --- a/Kbuild
> > +++ b/Kbuild
> > @@ -37,6 +37,20 @@ $(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
> >         $(call filechk,offsets,__ASM_OFFSETS_H__)
> >
> >  #####
> > +# Generate struct_page_size.h.
> > +
> > +struct_page_size-file := include/generated/struct_page_size.h
> > +
> > +always-y := $(struct_page_size-file)
> > +targets := mm/struct_page_size.s
> > +
> > +mm/struct_page_size.s: $(timeconst-file) $(bounds-file)
> > +
> > +$(struct_page_size-file): mm/struct_page_size.s FORCE
> > +       $(call filechk,offsets,__LINUX_STRUCT_PAGE_SIZE_H__)
> > +       $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
>
>
> No, please do not do this.
> It is terrible to feed back this to Kconfig again.

OK. I'll remove syncconfig.

>
> If you know this happens on !CONFIG_MEMCG && !CONFIG_SLUB on x86_64,
> why don't you add this dependency directly?

It is not enough since the size of the struct page also depends on
LAST_CPUPID_NOT_IN_PAGE_FLAGS && CONFIG_SLAB.
We cannot know the result of LAST_CPUPID_NOT_IN_PAGE_FLAGS in
Kconfig.

>
>
> If you want to avoid the run-time check,
> why don't you use  BUILD_BUG_ON() ?
>

Now I have another solution to avoid the run-time check.
We could use macro STRUCT_PAGE_SIZE_IS_POWER_OF_2
to do that like the following.

#ifdef STRUCT_PAGE_SIZE_IS_POWER_OF_2
/* code */
#endif

Thanks.
