Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA10C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 20:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D1D86112E
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 20:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbhINUMZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 16:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbhINUMY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 16:12:24 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2EBC061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 13:11:06 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id k4so955968lfj.7
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 13:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WNWKwD/mZ8dmcHnPyLauepOSjhSOQ4h/50JmWkiv3s0=;
        b=EcGBNwXJXCtEjbiAqZ5SCobVNFat6cwVYl7UZrpcqRZjt6YQEX6uXqQn+h8Hur7RBP
         6Lf5fTjpJCmj8IvaaOplqMgXBBuH+tHM8BEY2eJbEt2CZkmxcK439Q5LYO665Vl+hepx
         U9uY2EfFCOyAcN720RTBPvT3JSy7zWXr5WL7kA4HRZZKTZaGILl/Fuo6ZgtZz8wkakTE
         bKU8KjiEsTo2dhRmKNviX8IQnNZk8d6Rla/TZwPNDuABbhWsQCKglo8WsadZhoars8AK
         wy5nMe2NRGbjEAOl5/WMffpVQdI12t6deZP3nc/5+R5qrjM6c9cJZ73AeuPhuI6PD293
         OWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WNWKwD/mZ8dmcHnPyLauepOSjhSOQ4h/50JmWkiv3s0=;
        b=V34Ohmb4UEzyTx40Qhly6FNXOXjG+um8AsUV+w+H+VZYpyh/M6HhKrPEghvPy2h6CG
         k8c5H/c5RiR8eRRD9KTkc2lu7R2//gxgDmfw6rfT8bVtwCuFgm8EiprMujNFL7RT6dGi
         +QiWFVxPEdUDAijnP+m/wmBbKvi46nBQXji0s0/V4HZbzwvlpyitjBqjJLZPtOBlxN2n
         9ch2QXIVrnv2GQ7FEbUYrYge52+ak+nJDB0VpoUFsSSk7+CyxcpGLTSNSzl0NXvI/PON
         ps2TVpiBLBQCNYo4zpmoWtglNwm8Hqv+PcYSUAm0N6SlFsEDkkcK3OaxJVa7hI7kYNGw
         WDzA==
X-Gm-Message-State: AOAM533sUNA/xMK6bp84sWv/zmgJ+JgJlRfCP8YxeIBW0QtYPNLtiui2
        AICbCH/iTv+RpCI7gt/2veh6gJgDgK+Q+USbaWvQgQ==
X-Google-Smtp-Source: ABdhPJwJhIZ7snNccUlf5HKWs3aKulgAz8Bz80UW1co9+ZsFlqTZY3qTz0PjV970lQ+di9xtI/9sOs58qbg+Py7MwnA=
X-Received: by 2002:a05:6512:31d3:: with SMTP id j19mr1698923lfe.368.1631650264534;
 Tue, 14 Sep 2021 13:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <50b83893065acaef2a9bc3f91c03812dc872f316.1631504710.git.brookxu@tencent.com>
 <CAHVum0dmTULvzD6dhr4Jzow-M1ATi-ubDkO5wQR=RQmWtt_78w@mail.gmail.com> <b62597e9-72c4-563e-fdc7-3315569502f0@gmail.com>
In-Reply-To: <b62597e9-72c4-563e-fdc7-3315569502f0@gmail.com>
From:   Vipin Sharma <vipinsh@google.com>
Date:   Tue, 14 Sep 2021 13:10:28 -0700
Message-ID: <CAHVum0dd5dw1rkcf0U7OjW2GX4VTZi4RCcbTph99qDftd=2taA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] misc_cgroup: introduce misc.events and misc_events.local
To:     brookxu <brookxu.cn@gmail.com>
Cc:     Tejun Heo <tj@kernel.org>, lizefan.x@bytedance.com,
        hannes@cmpxchg.org, mkoutny@suse.com, corbet@lwn.net,
        linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 13, 2021 at 7:24 PM brookxu <brookxu.cn@gmail.com> wrote:
>
> Thanks for your time.
>
> Vipin Sharma wrote on 2021/9/14 12:51 =E4=B8=8A=E5=8D=88:
> > On Sun, Sep 12, 2021 at 10:01 PM brookxu <brookxu.cn@gmail.com> wrote:
> >>
> >> From: Chunguang Xu <brookxu@tencent.com>
> >>
> >> Introduce misc.events and misc.events.local to make it easier for
> >
> > I thought Tejun only gave go ahead for misc.events and not for
> > misc.events.local.
> >
>
> Maybe I missed something. I think events.local is somewhat useful. For
> example, the events of node A is large. If we need to determine whether
> it is caused by the max of node A, if there is no events.local, then we
> need to traverse the events of the child nodes and compare them with
> node A. This is a bit complicated. If there is events.local, we can do
> it very easily. Should we keep the events.local interface=EF=BC=9F

Tejun mentioned in his previous email that he prefers the hierarchical
one. https://lore.kernel.org/lkml/YTuX6Cpv1kg+DHmJ@slm.duckdns.org/

I agree with you that it's easier to identify the constraint cgroup
with the local file. However, there is one downside also, which is if
a cgroup gets deleted then that local information is lost, we will
need a hierarchical reporting to observe the resource constraint. I
will be fine with both files but if I have to choose one I am now more
inclined towards hierarchical (events).

Thanks
Vipin
