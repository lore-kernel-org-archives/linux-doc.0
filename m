Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E60C43334
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jun 2022 13:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236357AbiFNNnv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Jun 2022 09:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243331AbiFNNn0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jun 2022 09:43:26 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC2522296
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 06:43:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c4so13962767lfj.12
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QFbWiJSWchHZ/ZdSIBOHUYdO7GIo1UywXnqsfZ2oa68=;
        b=G33fsOGq4KMmoqTVTqqM3ZzVCFTDmgZejUZ1j7zfOTMSdQXUEER6h22qtyv03QW9c+
         GZNQhe00umxtHLw1hI4+XZiZ4dt7nmMHRhKuDz6lTQGe2kCE6fTbUJ5FKqwkykOEadmx
         ECPKArN02G99zMrdLORcMFB5WLWZBZFiU5K8ErG9b6NnFQv86SI+Peks9Bjh0aiFhTon
         PSLNlxc1u4NBlW1qKXQMcyPqGfeGHw4bwgswBBPyfRYwzTJv4XAR2OkTAROZvIpZJYQl
         PXPxTy3bl9Zsq2/95XwIdwfEx9kBlC7tEUiwIlyoB2UDEt0X3IUGSQZOWDg2eG/ksIB3
         T6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QFbWiJSWchHZ/ZdSIBOHUYdO7GIo1UywXnqsfZ2oa68=;
        b=jcgGh2kLbdSbo+B9AHiaOzekAvDJTu8nSpEiLspzg0aQYlBuowmE9FRlF0i6J/wzXp
         lkilmU98z5WJuQds7kVme1ZP6E3ujvv8/5SJdEGmeyD4ZdlTfkQ4vA25oeE2XZmoF+c9
         u4Bq5xooPW7MwX6uxrploj7csDLyj6GSFPgCPGcPOD4tRA/lFJx8y2Fo0W4Cyl3MNTYC
         cjSL0l/ii1h0kNtrdNw48SopRt2DruXA6ZjdMDx3SkxZW35z1xU4kes3yCh5SfunedWe
         FKkcM4vnCancqYb2pYNC72CZVSkBSx4lSkxACxzxCqbaZvBw+gN2TT6hKeeRRtVRGVIU
         W8Hg==
X-Gm-Message-State: AJIora9KfFOXce/Goz35oLpVo5UBNfqxu8O9PObIhOgV8qdeC5byKwL0
        9TwRG6ZUyX9dTr3FKENLVE8v13Wh/tCyUDU0oa0B360G8iA=
X-Google-Smtp-Source: AGRyM1tMxqulYT0Id2OI018NjcDGQnGxo0oUUwIV/FftaXil13R8PJ8s1e1mh7nRQKuF1u28I7k8c6MMlqzDtkLk1wM=
X-Received: by 2002:a19:384a:0:b0:479:17b1:2e49 with SMTP id
 d10-20020a19384a000000b0047917b12e49mr2993375lfj.629.1655214203018; Tue, 14
 Jun 2022 06:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655094814.git.siyanteng@loongson.cn> <9f458a7be9ef3b9eea3d7bba4e97fc962f6a061e.1655094814.git.siyanteng@loongson.cn>
 <CAJy-AmkF6uCreGjK_iJVOfO6x+yXCecPvL42V+DpXNchm5_bxQ@mail.gmail.com> <4d48992c-b09d-3a56-19d5-23b5f971cbcd@loongson.cn>
In-Reply-To: <4d48992c-b09d-3a56-19d5-23b5f971cbcd@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 14 Jun 2022 21:42:46 +0800
Message-ID: <CAJy-AmkAHT80n7BUfCi0kj4zMZYtUdG7q=WrUnnkUbg_mVZ4_g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs/zh_CN: Update the translation of vm index to 5.19-rc1
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>, zhoubinbin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 14, 2022 at 9:02 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> On 2022/6/13 =E4=B8=8B=E5=8D=882:30, Alex Shi wrote:
> > On Mon, Jun 13, 2022 at 1:02 PM Yanteng Si <siyanteng@loongson.cn> wrot=
e:
> >>
> >> update to commit 481cc97349d6 ("mm,doc: Add new
> >> documentation structure")
> >>
> >> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> >> ---
> >>   .../translations/zh_CN/vm/bootmem.rst         | 14 +++++++
> >>   Documentation/translations/zh_CN/vm/index.rst | 37 +++++++++++++++--=
--
> >>   Documentation/translations/zh_CN/vm/oom.rst   | 14 +++++++
> >>   .../translations/zh_CN/vm/page_allocation.rst | 14 +++++++
> >>   .../translations/zh_CN/vm/page_cache.rst      | 14 +++++++
> >>   .../translations/zh_CN/vm/page_reclaim.rst    | 14 +++++++
> >>   .../translations/zh_CN/vm/page_tables.rst     | 14 +++++++
> >>   .../translations/zh_CN/vm/physical_memory.rst | 14 +++++++
> >>   .../translations/zh_CN/vm/process_addrs.rst   | 14 +++++++
> >>   Documentation/translations/zh_CN/vm/shmfs.rst | 14 +++++++
> >>   Documentation/translations/zh_CN/vm/slab.rst  | 14 +++++++
> >>   Documentation/translations/zh_CN/vm/swap.rst  | 14 +++++++
> >>   .../translations/zh_CN/vm/vmalloc.rst         | 14 +++++++
> >>   13 files changed, 198 insertions(+), 7 deletions(-)
> >>   create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/page_allocati=
on.rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rs=
t
> >>   create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.=
rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/page_tables.r=
st
> >>   create mode 100644 Documentation/translations/zh_CN/vm/physical_memo=
ry.rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/process_addrs=
.rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/slab.rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
> >>   create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst
> >
> > It's better to add above doc completely one by one, not just
> > unfinished few words.
> In the beginning, I thought so too.
>
> To be honest, My original intention was that a zh_CN update patch should
> equal an English patch. Because My commit simply updates vm/index.rst to
> 5.19rc-1. I don't know why there are so many empty files mixed in with
> the original patch(commit: 481cc97349d694e3211e14a886ad2b7ef55b5a2c).
>
> Of course, I'm willing to add them to the TODOLIST if you insist. :)
>

Uh, I understand these awkward empty files may imply a plan, but until now
It's just meaningless file, may not worth to translate them now. We'd
better leave
them off and do translation after some meaningful info added, and then the
translator sign will be more accountable.  Is this good for you or any
more ideas?

Thanks
Alex
