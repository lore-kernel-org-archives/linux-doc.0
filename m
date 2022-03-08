Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856DDC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 04:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbiCHEud (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 23:50:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbiCHEuc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 23:50:32 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C5A33A01
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 20:49:36 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id g26so35361972ybj.10
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 20:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xuaJXgStO4V2/6OACg9pyt4+VjQwnKoW7tP0rVxp1rc=;
        b=Z/B0PeDEwomh5qRn3fXnB0G02hiLRPnH5JfBrSHrV+b3TBk6CaamgpqCUtb20ZKT12
         jZovQQh7syOWMXciaT9JSPo+O+YNoyOQYu9BdUNoTE6cUXi9hHlX03GAqYpmpoT0mJt5
         EHxp3VZWrgk1M6M4XHKZcaCz6lgINg1EaN0DNuIWqwrBb85Q0RYBUulsbVaYX7sULYfg
         hkPRfTDgev43ApaBi3WEDahQ2aSouBkD7JYcPKK6IpDxsHgvEPAHKg1vCPNDzNxnJGAT
         wT7D3PgdxHZxO3zl24WwW6oHPSrzIg2rRTdani6Rkf3ZKrFbKlsWOqYHUVhublApeh1S
         et+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xuaJXgStO4V2/6OACg9pyt4+VjQwnKoW7tP0rVxp1rc=;
        b=0QKZ1iAwH03WBh+JEal94co7BbZ5VyXPVXGB/TMnr8sLoh7RedHjTUcj+MIyNBqqSt
         /EyrqSooSOOV5kDjHfp8z/BHocWQH9IbIjBvxf92ECeclTCj8t8KJbE3kZrwDzOu5uQU
         10FiPz3bgcSgNttXcpxVrctxyIrzr+gjcKODY6gaN92RaJMRuNL8A5FlIWG6CjqYVTTu
         Qdqi99D54GaoAFrwvaqrLA5s2L2OUK4cSDB5nXzYOTa8/XjeGmGupCLxly+FN18mez3U
         EvEdr5whXGLDCQYGq5+6Wzq8ljm82RUYOrZlS67iPAF8kHZIjhYQ1Z+BfgdaqDnwPF0g
         BT4A==
X-Gm-Message-State: AOAM532P86HfnvJWAcjaVBZX383di41Qb/+QwCIBPUtQADjJVe/v6Lvc
        4/ivCLmdDaOpKwAPLyphM9xJs0/t8G7WKEzn+Wc=
X-Google-Smtp-Source: ABdhPJzDRwl/duQfYWkdYaxHqXZ5xGc48BqkRimRlhTy71s0FkZLVsPN/Ns7lP0qkUzxdF1RyB06Blpv8YC0ATBn1QM=
X-Received: by 2002:a25:9a43:0:b0:628:672c:e471 with SMTP id
 r3-20020a259a43000000b00628672ce471mr9965967ybo.73.1646714975773; Mon, 07 Mar
 2022 20:49:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646640696.git.siyanteng@loongson.cn> <a43902460ff47a3aea8c7b01119cb7db647103e6.1646640696.git.siyanteng@loongson.cn>
 <20220307202026.3f2dc395@canb.auug.org.au>
In-Reply-To: <20220307202026.3f2dc395@canb.auug.org.au>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 8 Mar 2022 12:49:17 +0800
Message-ID: <CAEensMy=DeLxgtOX=M4W+uK9uUqzkP5piitZFynUp-yeXXkRUg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] kselftest/vm: override TARGETS from arguments
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Chengming Zhou <zhouchengming@bytedance.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> =E4=BA=8E2022=E5=B9=B43=E6=9C=887=
=E6=97=A5=E5=91=A8=E4=B8=80 17:20=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Yanteng,
>
> On Mon,  7 Mar 2022 16:17:15 +0800 Yanteng Si <siyanteng01@gmail.com> wro=
te:
> >
> > From: Chengming Zhou <zhouchengming@bytedance.com>
> >
> > We can specify which testcases to build using TARGETS argument, for
> > example: make -C tools/testing/selftests TARGETS=3Dvm, cause the ordina=
ry
> > assignment of TARGETS in Makefile will be ignored.  So we need to use
> > override directive to change that.
> >
> > Link: https://lkml.kernel.org/r/20220227055330.43087-1-zhouchengming@by=
tedance.com
> > Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
> > Cc: Shuah Khan <shuah@kernel.org>
> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Please do not take my Signed-off-by lines from linux-next.  It is only
> there because I publish Andrew's patch queue as part of the linux-next
> tree, and so is only relevant in the linux-next tree.

Sorry, this is my fault, I will regenerate this thread of patches.

Thanks,
Yanteng
