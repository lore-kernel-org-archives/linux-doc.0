Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D43C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 25 Feb 2022 02:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236677AbiBYCKi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 21:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236663AbiBYCKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 21:10:37 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481881EC98A
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 18:10:07 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id j12so3090406ybh.8
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 18:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VaaYEu0W9vfH/I8GhBeXu6TN8xL6pQ3TajEdMb2e320=;
        b=Ec+DY5i4Jig/PADzcIykXyOBueVUruad9lcr0sK+XpCIEFqmqi2EQDM6LDbEFcbRIM
         PBjckSFcyLHchAaYk2XMLbPz/Ci6e8ILCruA3+ERUSqCLTnhp4tnNeiJTTxe1gONuwIq
         VqjQQot6r9I/ZPzxaFvnpnmprwkb9qEa8aTXnBCUmxUM5JhA2Xy/RLUhH9gIvCnyNgR1
         NZve9Us5Dtf37lL5TY3yXiqJPtTgb0x9S8QrXuKQiB0DowRLxcyhOs0I1Z1fIllBqfJt
         xA4Q4kxCNU2mPXl1Xb/lo+ErXqF6gn7BQhOEGevlPhtYQ+H2GBu/kVPUJo605z32XGSX
         GtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VaaYEu0W9vfH/I8GhBeXu6TN8xL6pQ3TajEdMb2e320=;
        b=Z0Irbvfgpr5PL0Ws98dXw0Uhw3BOIi8p3Sj58XCOgM5lSypZkSNxhlrA5DUWDxcybK
         bgSXgfuiv6aP6OqFtWFKWnU5gvcX5uqaKpQ0ILLvZ9pS68NHCBGfZ4AyZYYBHw0BjOZ5
         bRepa9heCl68yfGVFsfV0yQM0PHmbrT0vLHPfkLeDhbblp2rxFSCeux9WJOC2t6WLMwo
         5a7uj6ie3Rm+n6DWDUYjz/9oLEx5mL6pAEK4JA0cZ5jn5slacYsuLtbgd4BE4CUiabf3
         b+x9zF6/2W4wsJdlB9vkia1xeq7Yzyb41ncEh+j9gfmNkSrKODrzbWZYaJIry1bif0FR
         5p9g==
X-Gm-Message-State: AOAM533E/Ds2Oi3Y/e2ijUvMDuPsV2jUi3BgwROpAQhsq4+UQQXkuq2S
        6trg3XN75Uc/a41e2xGuFviYQuDH3+f/Niw0/LQuOnnwoQoMfWLT
X-Google-Smtp-Source: ABdhPJzvmNGoV1o1SekQHtfUFcGvR954mx9VjYikZ+AxMB5xGXrXRIdz4WrETUJ8Vt4MrjV9i3eLxwkq5AsXs/gXNoQ=
X-Received: by 2002:a25:3c04:0:b0:61e:105b:f18f with SMTP id
 j4-20020a253c04000000b0061e105bf18fmr5101214yba.73.1645755006516; Thu, 24 Feb
 2022 18:10:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645437621.git.siyanteng@loongson.cn> <87czjckqzk.fsf@meer.lwn.net>
In-Reply-To: <87czjckqzk.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 25 Feb 2022 10:09:55 +0800
Message-ID: <CAEensMxQNywVKz8jXxUFyoetfiqAw1cwx625nSxogGF8-ZX6-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] docs/zh_CN: add admin-guide damon translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2022=E5=B9=B42=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=BA=94 03:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > v2:
> > * Pick Alexs Reviewed-by tag. [PATCH 1-3/5]
> > * Fix a build warning.(introduce from usage.rst)
> >
> > v1:
> > * Translate .../admin-guide/mm/damon/* into Chinese
> > * note my patch thread is based on
> > <https://lore.kernel.org/linux-doc/20220212080024.1684590-1-xu.xin16@zt=
e.com.cn/T/#t>
> >
> > Yanteng Si (5):
> >   docs/zh_CN: Refactoring the admin-guide directory index
> >   docs/zh_CN: add admin-guide damon index translation
> >   docs/zh_CN: add admin-guide damon start translation
> >   docs/zh_CN: add damon usage translation
> >   docs/zh_CN: add damon reclaim translation
>
> This set doesn't apply to docs-next; could you respin and resubmit,
> please?
Hi jon

 Sorry=EF=BC=8CApplying this set to doc-next requires an index for memory
management, but this index is committed inside Xu Xin's set.
<https://lore.kernel.org/linux-doc/20220212080024.1684590-1-xu.xin16@zte.co=
m.cn/T/#t>

I noticed that you couldn't pass the build test when you applied his
set, but Xu Xin seemed to be busy, so I fixed and tested his set for
him, and submitted the v4 for him.

So, if you don't mind, please apply Xu Xin's set first, and then apply my s=
et.

Thanks,
Yanteng
