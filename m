Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132BBC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  4 Apr 2022 21:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382378AbiDDV2L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379500AbiDDRQo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Apr 2022 13:16:44 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BE514019
        for <linux-doc@vger.kernel.org>; Mon,  4 Apr 2022 10:14:48 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id f3so9590897pfe.2
        for <linux-doc@vger.kernel.org>; Mon, 04 Apr 2022 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9G0a90Ep/Bz5OOoDZhbBO26Y5kHqZZt4pCiJoHTyyw4=;
        b=dbsKFhi7Qrtq/Rq9OZDWGOfaDFXlehFA5Dvy8IhvRrLeU0T4wP85YNiBqYaU9XUcaR
         eUVN69DjjMnifijLW25m+YKzc/I0odbx2wV1tPCdU+KBxslLKSqFwvkD4pVvTF50IUQa
         +QaIH7XLXTeNMaw7eguYI4S17J2ihOJkhUqbubb0twU+NF44WOBEs4KEZwuyI2cQ1OWg
         DjvmsdfzKYHIffEOCxLZBCluUxcZ7//A9FO1lCcnt+AcAMATqSVWgw8Xu0BUE/Jl7VQw
         rtUspdPnkhbICsCmzGy+IMML4dl30xRIEscdXvevjnn2tvTt7h6mqDEkiKuyZ7Z/UY9Z
         FpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9G0a90Ep/Bz5OOoDZhbBO26Y5kHqZZt4pCiJoHTyyw4=;
        b=6nJs3CVmJA+e6jvsBy4/KEoDcgwq11mP7XSM3tNgQBW/eaSzamiWH+WQ/YuoQL9N3z
         u8/f/QIazUDSkOUiBqoP9SSq7Ei8A5Z9bXUDC/vpU15sUkGDOOQugabB6KHEO/9m+TNd
         PZGPXPVv6J25gd9yl00d7PTeJOZ+SZ4dDKk98OLMTLEE3S5BgsiYHu1vlHxM6+pV7ijM
         s+Xd9hX+byXkuaPttf0wh3HBAaOwiL7wDC6S3qZcJkgNTL0OSk75XPjk8cjsoPqZ5iFK
         aehygd2C52o3Z+75XQa7q5QEqXi4yNI4CGC0bSPZhfOpoPvs3st/aNE00iwv17YGfTT9
         cE/w==
X-Gm-Message-State: AOAM533fYKgBR/APgw0FLYq3RJA4a2gKK/8d+WydLfAzDEzw6SSMjR0T
        NUjLsscGLBVOYz7md0rOmmBbDVZ3tNDPmsKdcj4evg==
X-Google-Smtp-Source: ABdhPJwExpdEGnyWDK69sFVEHi5zDLcGulVNorqTNcKNzqhC2Qfdem89xzMoC4eHonTJ3Nemx/2dgOoEjbxz5HBpdFw=
X-Received: by 2002:a05:6a00:bd1:b0:4fa:a5d7:c082 with SMTP id
 x17-20020a056a000bd100b004faa5d7c082mr520472pfu.85.1649092487680; Mon, 04 Apr
 2022 10:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <YkdrEG5FlL7Gq2Vi@cmpxchg.org> <243A0156-D26A-47C9-982A-C8B0CDD69DA2@linux.dev>
 <Ykdz7fiMFZeFltYy@cmpxchg.org>
In-Reply-To: <Ykdz7fiMFZeFltYy@cmpxchg.org>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Mon, 4 Apr 2022 10:14:36 -0700
Message-ID: <CALvZod466jLN8Bb67X9=iF5TvjOo-oEsHA-mGhpHnywGCP+WvA@mail.gmail.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Roman Gushchin <roman.gushchin@linux.dev>,
        Yosry Ahmed <yosryahmed@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Cgroups <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Jonathan Corbet <corbet@lwn.net>,
        Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 1, 2022 at 2:51 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Fri, Apr 01, 2022 at 02:21:52PM -0700, Roman Gushchin wrote:
> > > On Apr 1, 2022, at 2:13 PM, Johannes Weiner <hannes@cmpxchg.org> wrot=
e:
> > >
> > > =EF=BB=BFOn Fri, Apr 01, 2022 at 11:39:30AM -0700, Roman Gushchin wro=
te:
> > >> The interface you're proposing is not really extensible, so we'll li=
kely need to
> > >> introduce a new interface like memory.reclaim_ext very soon. Why not=
 create
> > >> an extensible API from scratch?
> > >>
> > >> I'm looking at cgroup v2 documentation which describes various inter=
face files
> > >> formats and it seems like given the number of potential optional arg=
uments
> > >> the best option is nested keyed (please, refer to the Interface File=
s section).
> > >>
> > >> E.g. the format can be:
> > >> echo "1G type=3Dfile nodemask=3D1-2 timeout=3D30s" > memory.reclaim
> > >
> > > Yeah, that syntax looks perfect.
> > >
> > > But why do you think it's not extensible from the current patch? We
> > > can add those arguments one by one as we agree on them, and return
> > > -EINVAL if somebody passes an unknown parameter.
> > >
> > > It seems to me the current proposal is forward-compatible that way
> > > (with the current set of keyword pararms being the empty set :-))
> >
> > It wasn=E2=80=99t obvious to me. We spoke about positional arguments an=
d then it wasn=E2=80=99t clear how to add them in a backward-compatible way=
. The last thing we want is a bunch of memory.reclaim* interfaces :)
> >
> > So yeah, let=E2=80=99s just describe it properly in the documentation, =
no code changes are needed.
>
> Sounds good to me!

To summarize for next version:

1) Add selftests.
2) Add documentation for potential future extension, so whoever adds
those features in future should follow the key-value format Roman is
suggesting.

Yosry, once we have agreement on the return value, please send the
next version resolving these three points.
