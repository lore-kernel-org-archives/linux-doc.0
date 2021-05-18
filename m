Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9BEC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 13:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACDAC610E9
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 13:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhERNlA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 09:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhERNk7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 09:40:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9E3C061756
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 06:39:40 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v8so9221729lft.8
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 06:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nrf7kNqbVnAq1Hf1uDBaFlAV929R3QrjgqvJW3l17CY=;
        b=DMufJIyGl+qNFpflK8tU5hLtyEQK9T7KiW3MEpqtY3+36Of1jx9dJuhnl+YfejEiLM
         hPANf0IEpDtgAouU4WTLfVxIzrpDgnNkLM8E+N91lh0Fh1aq488EttAQrJrj1HMscFkz
         +wqn4bWB1oOKviRzm0K7jp8TjQf0kurdf+i6UUos208vX+n0yPGMg5JCnZmWfP+bbxuP
         luJYVWEAtucWfTN+0xCrWWFFCvUNvMZTO1LRA25gSk7j2Zk8SiLZJqwLQvMaf2TtPm8h
         7mxwLAQ4r2y+5/oW5f9m6zeQv4kqNrG5hW54jVdCmgqxUDhRic5qJhAJb4+BzLxQH5+C
         zAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nrf7kNqbVnAq1Hf1uDBaFlAV929R3QrjgqvJW3l17CY=;
        b=arbczUFQ6H86S+GcBRI5aPIFPWHT8DQfxrpB5XXxzg5tYtYvPcZkw1GjWOf1/VA3Hk
         8kNouAYVog/DLukGglP4oBx3uYySRUfRFySYFNu11o0/+adPkcWZ6OChPeKvAgGCF64d
         3pKmgYru4clTSRLBbUhXuRNq8CkXvIZQ/A0s+slEX+ADdUE0/ZrPk8X21g1ThJw7fD3a
         tK6ipRoJzQh03vyDE7CVHDenN5k4CKd2EnjtpQlmdC3S+bDr7iE3Aq5nFRllm4RIRARe
         brIeT5WhUHyXUGsQLlV0tvIZovguYxBQnsqw3HzELmpMqxoppn6Vwc2DE3zP6c5Xq6g0
         u0fw==
X-Gm-Message-State: AOAM531ozFca1zq5VruGzSjVJUgB01CA2qe507tvnAfImV10pt8Qboqy
        CEDNmdY25ixpOrb15mORvGueghZO9N71HH2IBs9k4Q==
X-Google-Smtp-Source: ABdhPJx422ES6gfI9g9zWtdAm24lIHv7zsc/CM8d0RwvK3AgZCihGwzdt92BAiHNiWlB+C5wItRT3gYSF7KGJMHkGC0=
X-Received: by 2002:a05:6512:22c2:: with SMTP id g2mr4601044lfu.305.1621345178822;
 Tue, 18 May 2021 06:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <1621239831-5870-1-git-send-email-beata.michalska@arm.com> <1621239831-5870-2-git-send-email-beata.michalska@arm.com>
In-Reply-To: <1621239831-5870-2-git-send-email-beata.michalska@arm.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Tue, 18 May 2021 15:39:27 +0200
Message-ID: <CAKfTPtAPcayjhedNWaL20rsaUQbxXFdEXAF8aqwd9YX5gLVbOQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] sched/core: Introduce SD_ASYM_CPUCAPACITY_FULL
 sched_domain flag
To:     Beata Michalska <beata.michalska@arm.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 17 May 2021 at 10:24, Beata Michalska <beata.michalska@arm.com> wrote:
>
> Introducing new, complementary to SD_ASYM_CPUCAPACITY, sched_domain
> topology flag, to distinguish between shed_domains where any CPU
> capacity asymmetry is detected (SD_ASYM_CPUCAPACITY) and ones where
> a full range of CPU capacities is visible to all domain members
> (SD_ASYM_CPUCAPACITY_FULL).

I'm not sure about what you want to detect:

Is it a sched_domain level with a full range of cpu capacity, i.e.
with at least 1 min capacity and 1 max capacity ?
or do you want to get at least 1 cpu of each capacity ?


>
> With the distinction between full and partial CPU capacity asymmetry,
> brought in by the newly introduced flag, the scope of the original
> SD_ASYM_CPUCAPACITY flag gets shifted, still maintaining the existing
> behaviour when one is detected on a given sched domain, allowing
> misfit migrations within sched domains that do not observe full range
> of CPU capacities but still do have members with different capacity
> values. It loses though it's meaning when it comes to the lowest CPU
> asymmetry sched_domain level per-cpu pointer, which is to be now
> denoted by SD_ASYM_CPUCAPACITY_FULL flag.
>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
> ---
>  include/linux/sched/sd_flags.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/linux/sched/sd_flags.h b/include/linux/sched/sd_flags.h
> index 34b21e9..57bde66 100644
> --- a/include/linux/sched/sd_flags.h
> +++ b/include/linux/sched/sd_flags.h
> @@ -91,6 +91,16 @@ SD_FLAG(SD_WAKE_AFFINE, SDF_SHARED_CHILD)
>  SD_FLAG(SD_ASYM_CPUCAPACITY, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
>
>  /*
> + * Domain members have different CPU capacities spanning all unique CPU
> + * capacity values.
> + *
> + * SHARED_PARENT: Set from the topmost domain down to the first domain where
> + *               all available CPU capacities are visible
> + * NEEDS_GROUPS: Per-CPU capacity is asymmetric between groups.
> + */
> +SD_FLAG(SD_ASYM_CPUCAPACITY_FULL, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
> +
> +/*
>   * Domain members share CPU capacity (i.e. SMT)
>   *
>   * SHARED_CHILD: Set from the base domain up until spanned CPUs no longer share
> --
> 2.7.4
>
