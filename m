Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DCCC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbiDDV2A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379456AbiDDRKw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Apr 2022 13:10:52 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C224E1AD8A
        for <linux-doc@vger.kernel.org>; Mon,  4 Apr 2022 10:08:55 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id kw18so3128354pjb.5
        for <linux-doc@vger.kernel.org>; Mon, 04 Apr 2022 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EXYG3Ps4LgSyecmtEkjB7IBmEX/53r1BKcEWnhV4WlY=;
        b=s4CMrkgH7my/reT6boSS8yl+kfuqsyuW+f1JH/k+5yIXMdHslsChfPbL4NUMHPqZix
         KdR9ph2X7IYOncO9Nplztcf1q9mtEgJP1Y6UsMxgR1beJRzUvrBp6ANO369YovHpmVdq
         2BGBW1PuagDvNO8qY4jV7AGNNT87QsO97aWQbHXwie/ZqjowUI/d2ISWG22WhANZxVeQ
         lT04QY1g8hr2moiJ3B2tVGObcfy9yn+vkPuRXQ98mGwLgRFQo4pjIN60/lEFGGD6loMc
         UNTzU7wMtCvSSt4SZE313BRItgkLW6uEcEnQtikscmC8CTKTE20RUhwAVqAYjKbwVVAM
         vgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EXYG3Ps4LgSyecmtEkjB7IBmEX/53r1BKcEWnhV4WlY=;
        b=IP5zWoSmTaqtYydE1S4F5KbktuHmt9rCUve7neskqfobWczBh92efaDlbdAbKpi0rW
         JcOTK1YJ1SBPn+gL2u5rBdP7fu5bx6o3rZkMmglKrLOwdXKg3pJzaX9OCqb/daFU0JYG
         m3IZX3BIUHSQNs2h64suY+h+n9sP+KdryF4n88qcxhXeLwJQpydILtYYOQOQwwYoq3Cs
         z1g0BrHVDxO08gSmAi7+8/4W5J8LyyKmAs984vaggW05/ZNwg4h5buIKqrkXQgaEMwjx
         DGTnDnejb7BOxjmRuLE671KeOUBGzRiOg6t8Y2hnDky+igAdduH+k/brvovVknSfxwLA
         4/SA==
X-Gm-Message-State: AOAM5301hqsa4S1jZ/GUJAcJcpl4jbzUjvmhtcmGA8sKvoSwWAQObvo8
        T7QNKGOvOvq27sl2HWLpBY1/SMdti8+D4anOLUS01A==
X-Google-Smtp-Source: ABdhPJw+J54Cf+Ic9BirLs3NVMza9LBojr2USzUl4/qVFxAGsWR2VqpprijI+ObsHmL3rSo+fWzODR9vouPWAPRhZZ4=
X-Received: by 2002:a17:902:d0c9:b0:156:b0dd:999c with SMTP id
 n9-20020a170902d0c900b00156b0dd999cmr1019023pln.6.1649092135073; Mon, 04 Apr
 2022 10:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220331084151.2600229-1-yosryahmed@google.com>
 <CAAPL-u8g2qkhdTQtFtBS3GNYz0WnyahWEXvR4g_OSaKv+7EozA@mail.gmail.com>
 <YkcYq8F6MYlMi+yS@cmpxchg.org> <CAAPL-u-za-TTyyC5uMVev9eQyhxZS7q3pVqaUxCFjqk+Sv9+ig@mail.gmail.com>
In-Reply-To: <CAAPL-u-za-TTyyC5uMVev9eQyhxZS7q3pVqaUxCFjqk+Sv9+ig@mail.gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Mon, 4 Apr 2022 10:08:43 -0700
Message-ID: <CALvZod4-fKfv6vbZPZ3nCE=Bue4FUnC+9t27wsznmyd+JKgDbg@mail.gmail.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
To:     Wei Xu <weixugc@google.com>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosryahmed@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Cgroups <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 1, 2022 at 1:14 PM Wei Xu <weixugc@google.com> wrote:
>
[...]
>
> -EAGAIN sounds good, too.  Given that the userspace requests to
> reclaim a specified number of bytes, I think it is generally better to
> tell the userspace whether the request has been successfully
> fulfilled. Ideally, it would be even better to return how many bytes
> that have been reclaimed, though that is not easy to do through the
> cgroup interface.

What would be the challenge on returning the number of bytes reclaimed
through cgroup interface?
