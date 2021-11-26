Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABD9C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Nov 2021 06:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhKZGXB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Nov 2021 01:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352430AbhKZGVB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Nov 2021 01:21:01 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F91C06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 22:17:49 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id y16so10103392ioc.8
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 22:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JgASxAioWMfqPmVngMuG9C0OsrcDbAPUOJlpE/ZHZfY=;
        b=BvkCpE3YWuzwbzXn3cggm+tQjm7jV1uBoIPhkNkCcS6/NR/buMcsVypSxV+rP9ebWz
         fc+ZXxR+ExNTVHdnThnmeDXcwGjqgamEXEkRNvJCXUKuIHEFN8RdvnYuqajNOgvck9yF
         Scdcj2JqO5aX+RPD6i+1TMFkwoF8x0/tC+xR93rhnjC8rbydxerGGR1kjnJ8cQvdxlu3
         gBSJo/nYUfHwhhEIosoJsBk+Iizk3L3C/Frer0F9E8igT4Zwb/QKV30rl8j/NOQiHg4T
         NV5Dfr2QpiOk2HH7geZNmMvYajH2vP5uOe4vDDzMTAorWqyg614BhMcwYQ76Fywq7zyA
         K0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JgASxAioWMfqPmVngMuG9C0OsrcDbAPUOJlpE/ZHZfY=;
        b=H2oTXgZbcuwiANpFrErguyPYYxV0JpAg/3XN0ntQZoOVcjncm59XF7Kthh6o64iEEL
         nrGVAPBd/ceBfeGQsOKUxVPGzcIJKGR9M7uWIlYPosHXu4nKM6DdmFPgTrUIflEzV4oR
         /ZgeOld1JEAhg2z2WyboPaiIeQqCxkJeu66q2bu767EHGD0bHVaT3VJtZRVHkD2Xhou3
         zQ8JYPzxm8m7uNxTdXZavxmyfWne3flfZLIZRPs+napr7bPKDsRwkuoJDFmlQsDRs+QU
         W3hUk2fnpCtTmOF/3jx9trqHJ9lEiY9xGGTq/PdIFgRCIq3xfLWThqds2j0sNuNsnXT0
         qscQ==
X-Gm-Message-State: AOAM532sECC0DIrds6LrtwWlCPwWTrf4bImlsoKlMXj145YlJrEP4pyu
        h8hIZDb/Jy+SKQMomtwME5+FwCksI6Zse+CASqk=
X-Google-Smtp-Source: ABdhPJwmeIfr6Z5KCrdM3q6hKKQaw6jCqbD4ifzim6E/Tt2/KsW47RgFCrI7bKH+iIrS+1y8/ey9ix8CJuBSDdZLFH0=
X-Received: by 2002:a05:6602:140d:: with SMTP id t13mr30769533iov.176.1637907468795;
 Thu, 25 Nov 2021 22:17:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637843107.git.siyanteng@loongson.cn> <434b1a86545b393bfa764d6ae310c77408367e08.1637843107.git.siyanteng@loongson.cn>
In-Reply-To: <434b1a86545b393bfa764d6ae310c77408367e08.1637843107.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 26 Nov 2021 14:17:13 +0800
Message-ID: <CAJy-Am=wEVjxJO-328-px7MWcua04WYEkW=A89A95XKQSU+aSQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs/scheduler: fix typo and warning in sched-bwc
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 25, 2021 at 8:55 PM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> a) since d73df887b6b8 ("sched/fair: Add document for burstable CFS bandwidth")
> [cpu.cfs_quota_us: the total available run-time within a period (in] shoud be removed,
> let's delete it.
>
> b) Add a period.
>
> c) fix a build warning:
>
>    linux-next/Documentation/scheduler/sched-bwc.rst:243: WARNING: Inline emphasis
>    start-string without end-string.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  Documentation/scheduler/sched-bwc.rst | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
> index 173c14110c85..f166b182ff95 100644
> --- a/Documentation/scheduler/sched-bwc.rst
> +++ b/Documentation/scheduler/sched-bwc.rst
> @@ -74,7 +74,6 @@ Quota, period and burst are managed within the cpu subsystem via cgroupfs.
>     to cgroup v1. For cgroup v2, see
>     :ref:`Documentation/admin-guide/cgroup-v2.rst <cgroup-v2-cpu>`.
>
> -- cpu.cfs_quota_us: the total available run-time within a period (in
>  - cpu.cfs_quota_us: run-time replenished within a period (in microseconds)
>  - cpu.cfs_period_us: the length of a period (in microseconds)
>  - cpu.stat: exports throttling statistics [explained further below]
> @@ -135,7 +134,7 @@ cpu.stat:
>    of the group have been throttled.
>  - nr_bursts: Number of periods burst occurs.
>  - burst_time: Cumulative wall-time (in nanoseconds) that any CPUs has used
> -  above quota in respective periods
> +  above quota in respective periods.
>
>  This interface is read-only.
>
> @@ -238,7 +237,7 @@ Examples
>     additionally, in case accumulation has been done.
>
>     With 50ms period, 20ms quota will be equivalent to 40% of 1 CPU.
> -   And 10ms burst will be equivalent to 20% of 1 CPU.
> +   And 10ms burst will be equivalent to 20% of 1 CPU::
>
>         # echo 20000 > cpu.cfs_quota_us /* quota = 20ms */
>         # echo 50000 > cpu.cfs_period_us /* period = 50ms */
> --
> 2.27.0
>
