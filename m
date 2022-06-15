Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EA7C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jun 2022 03:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbiFOD4g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Jun 2022 23:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354229AbiFOD4Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jun 2022 23:56:16 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B5212D22
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 20:56:07 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l20so5071334lji.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 20:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WKQZz+MMJWEQJ46ry9vZVVhlq7I3kthxxCjdHo8n/iA=;
        b=iEdUBsk861Zwsqa/wiz7X1jxTz9Of21OWBAmPD+fDTVUq4QSBhYL3q06odOOfH+DVw
         Dpx2KB6N4YBXToikuRrCcr6oJ10oksT8SkIW5BlJRwkXhSderCiwJq9BCFahEAiVGX2B
         hQI44ZAlmiclVZ7zVBhJVP5njHH5W9LL7tUZXofbIiiTLBYUzZMDKyS25Hvr5rE3kMSH
         wTA5SISy+NsjLtMi5Ut+oRn+xldyeDkouJQtHqrBrXVLGNfA+BlLkwnFovnWL/Y0Eq1G
         5N2bxR7jWxcWCbHTYemvoIkTv7VXRNaIx+5+DyqjBk7xg9xO2gdOFNiSvmVKjJv9T6n2
         HF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WKQZz+MMJWEQJ46ry9vZVVhlq7I3kthxxCjdHo8n/iA=;
        b=FsgNQtjWbV6M99aBSC7gNfb0LVYPubOveuHU81+pRVQ8qfE9MSqwBb2wpjWIIM/SXX
         ZEKF81mXsG+pBB1ShpiotIlvXzrpPMje7sscq54qgU9VuNQqXMnErI3Qn+IicjOkP7JO
         WQJRN5V5BzxS7ZmQAKqWgT4+7aOMUlqAk6UKhoIW0qC+HHquh5t11wjA6ObqT4rS7q/V
         wag/LChtZhvLo/2aVuHq+hA2twW/8I3bDScaqh8La6QWWvATRRosQoaQ1M2ps+8zTsAg
         D61shLAmEdxKb42aKm2fPNREH7Lz8osRcPtqGiT6FGIVSml341kbt9njKU/uUSj73A86
         RBeQ==
X-Gm-Message-State: AJIora8coiWn9yE4uvza8PniFOf+zT9huaYxt3R4P2SJ19O5klaKYJVH
        ZupXfPi5zaD4rkf4M4sJjEmZCJklsrcJ9DDI77k=
X-Google-Smtp-Source: AGRyM1tDMWDOQG+dYS9eJHFLV1J3RhMHwclrxCowyek7CPCcy3SdYQO4sZpK/cLI97A98i3fWoA52BzHKO2dcjpkixc=
X-Received: by 2002:a05:651c:2124:b0:255:847d:38ea with SMTP id
 a36-20020a05651c212400b00255847d38eamr4148594ljq.439.1655265365774; Tue, 14
 Jun 2022 20:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655094814.git.siyanteng@loongson.cn> <9f458a7be9ef3b9eea3d7bba4e97fc962f6a061e.1655094814.git.siyanteng@loongson.cn>
 <CAJy-AmkF6uCreGjK_iJVOfO6x+yXCecPvL42V+DpXNchm5_bxQ@mail.gmail.com>
 <4d48992c-b09d-3a56-19d5-23b5f971cbcd@loongson.cn> <CAJy-AmkAHT80n7BUfCi0kj4zMZYtUdG7q=WrUnnkUbg_mVZ4_g@mail.gmail.com>
 <5be7a9e0-7968-f38e-6d4c-ca1900c58524@loongson.cn>
In-Reply-To: <5be7a9e0-7968-f38e-6d4c-ca1900c58524@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 15 Jun 2022 11:55:29 +0800
Message-ID: <CAJy-Am=sr07ZaDhLJdipubZs5bSpFHmv9ht2-zBbv6YAc85UYw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs/zh_CN: Update the translation of vm index to 5.19-rc1
To:     YanTeng Si <siyanteng@loongson.cn>
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

On Wed, Jun 15, 2022 at 10:38 AM YanTeng Si <siyanteng@loongson.cn> wrote:
>
>
> =E5=9C=A8 2022/6/14 21:42, Alex Shi =E5=86=99=E9=81=93:
> > On Tue, Jun 14, 2022 at 9:02 PM Yanteng Si <siyanteng@loongson.cn> wrot=
e:
> >> On 2022/6/13 =E4=B8=8B=E5=8D=882:30, Alex Shi wrote:
> >>> On Mon, Jun 13, 2022 at 1:02 PM Yanteng Si <siyanteng@loongson.cn> wr=
ote:
> >>>> update to commit 481cc97349d6 ("mm,doc: Add new
> >>>> documentation structure")
>
> Note: There are some empty files that do not need to be updated for now,
>
> they are:
>
> bootmem,
> oom,
> page_allocation,
> page_cache,
> page_reclaim,
> page_tables,
> physical_memory
> process_addrs,
> shmfs,
> slab,
> swap.
> >>>>
> >>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> >>>> ---
> >>>>    .../translations/zh_CN/vm/bootmem.rst         | 14 +++++++
> >>>>    Documentation/translations/zh_CN/vm/index.rst | 37 ++++++++++++++=
+----
> >>>>    Documentation/translations/zh_CN/vm/oom.rst   | 14 +++++++
> >>>>    .../translations/zh_CN/vm/page_allocation.rst | 14 +++++++
> >>>>    .../translations/zh_CN/vm/page_cache.rst      | 14 +++++++
> >>>>    .../translations/zh_CN/vm/page_reclaim.rst    | 14 +++++++
> >>>>    .../translations/zh_CN/vm/page_tables.rst     | 14 +++++++
> >>>>    .../translations/zh_CN/vm/physical_memory.rst | 14 +++++++
> >>>>    .../translations/zh_CN/vm/process_addrs.rst   | 14 +++++++
> >>>>    Documentation/translations/zh_CN/vm/shmfs.rst | 14 +++++++
> >>>>    Documentation/translations/zh_CN/vm/slab.rst  | 14 +++++++
> >>>>    Documentation/translations/zh_CN/vm/swap.rst  | 14 +++++++
> >>>>    .../translations/zh_CN/vm/vmalloc.rst         | 14 +++++++
> >>>>    13 files changed, 198 insertions(+), 7 deletions(-)
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rs=
t
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/page_alloc=
ation.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/page_cache=
.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/page_recla=
im.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/page_table=
s.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/physical_m=
emory.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/process_ad=
drs.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/slab.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
> >>>>    create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rs=
t
> >>> It's better to add above doc completely one by one, not just
> >>> unfinished few words.
> >> In the beginning, I thought so too.
> >>
> >> To be honest, My original intention was that a zh_CN update patch shou=
ld
> >> equal an English patch. Because My commit simply updates vm/index.rst =
to
> >> 5.19rc-1. I don't know why there are so many empty files mixed in with
> >> the original patch(commit: 481cc97349d694e3211e14a886ad2b7ef55b5a2c).
> >>
> >> Of course, I'm willing to add them to the TODOLIST if you insist. :)
> >>
> > Uh, I understand these awkward empty files may imply a plan, but until =
now
> > It's just meaningless file, may not worth to translate them now. We'd
> > better leave
> > them off and do translation after some meaningful info added, and then =
the
> > translator sign will be more accountable.  Is this good for you or any
> > more ideas?
>
> OK, remove them, and add them to the TODOLIST.

Hi yanteng,

After thought twice about TODOLIST, we hope TODOLIST become the
guide list for next translation target, on this pointview, these meaningles=
s
files are not worth to get into them, otherwise, the TODDOLIST is just all
files list without guiding function.
So on this point, we may leave off them totally until sth meaningful fulfil=
led
into these files.  Is this better?

Thanks
Alex
