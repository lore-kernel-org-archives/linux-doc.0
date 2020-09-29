Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4435FC4727D
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 23:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE9CC20691
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 23:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iI8aT1Wp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729499AbgI2Xx3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 19:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729691AbgI2Xx2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 19:53:28 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E703C0613D3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 16:53:28 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id n7so1596vkq.5
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 16:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GOMvpJf6jnH+JyF4Og6jExEF8H9zHVHC1Jf6qwYVtbM=;
        b=iI8aT1Wp1Gb1k5+bUZubbPKESeO6IaGvH04eyr/FlKisSVUJrSN7sxDr7ZHh6ykQ/k
         p7cNKRYxDABzhCKvmHmHPKiowzooCDlBaAZvhSAf2IiRXIGwzXrOzYmprGqkR3t5zyME
         2T3KDDuBxMrpVIi6xezEVmNob5wdPQLidqukU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GOMvpJf6jnH+JyF4Og6jExEF8H9zHVHC1Jf6qwYVtbM=;
        b=VOaZjcKGRznh8Jt+TFJiNOEbW7uT0P8N86EI9HhlBDUD8oNjAC1YsYHE1IQ/mP2Qga
         u2lZxsMe1T2e1ucKk6LPdwR7yb0L1LAE9FTT4ui2puIUna0CY4VudV1CsTpgmtcUB4s+
         LQ8OcJghE6Gi340YAZRK8tspPHHIJh8RwoxNFswAiO9PGgYciPMnvr4na0ki4ErAow9K
         y7NJ5tR4ZXV1yUOba8ILc/5GF/JLBYMcZ/Ui6SkBj/1W9Bi/JMnNKwrfKNfbQ4yqSiBR
         Jwom7L24sVYp6bMjMBjw1wlcntSBCOZhVLwsnXZJOUQG3wt4Rla6Q5bILZj7q8G/lJiv
         rk7Q==
X-Gm-Message-State: AOAM531g9lS6xPnjbYfVmaLxMTw6I8tCni4KeRImEjYvg5w53Quu+Myj
        cpztoCNCh/UEfoBJupTFmCbxv+eoW4fvlw==
X-Google-Smtp-Source: ABdhPJwtRaG1fYuHUFPPSLIVcz6X/SO2GYZ5RA6vS4Na+9f5ETvIyEuEDTFkjlX03U7RzEsLPT93VA==
X-Received: by 2002:a1f:43d0:: with SMTP id q199mr12177vka.9.1601423606798;
        Tue, 29 Sep 2020 16:53:26 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id b30sm556486uad.18.2020.09.29.16.53.24
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 16:53:25 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id q26so4069250uaa.12
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 16:53:24 -0700 (PDT)
X-Received: by 2002:ab0:29d7:: with SMTP id i23mr2207uaq.121.1601423604458;
 Tue, 29 Sep 2020 16:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200929121610.16060-1-lukasz.luba@arm.com>
In-Reply-To: <20200929121610.16060-1-lukasz.luba@arm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 29 Sep 2020 16:53:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UnNkjMiOc0DZE7+OM3-Kr1ZRynxSerdA=ifbyGiRa2Zw@mail.gmail.com>
Message-ID: <CAD=FV=UnNkjMiOc0DZE7+OM3-Kr1ZRynxSerdA=ifbyGiRa2Zw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: Clarify abstract scale usage for power values
 in Energy Model
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Dietmar.Eggemann@arm.com, Quentin Perret <qperret@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Tue, Sep 29, 2020 at 5:16 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> The Energy Model (EM) can store power values in milli-Watts or in abstract
> scale. This might cause issues in the subsystems which use the EM for
> estimating the device power, such as:
> - mixing of different scales in a subsystem which uses multiple
>   (cooling) devices (e.g. thermal Intelligent Power Allocation (IPA))
> - assuming that energy [milli-Joules] can be derived from the EM power
>   values which might not be possible since the power scale doesn't have to
>   be in milli-Watts
>
> To avoid misconfiguration add the needed documentation to the EM and
> related subsystems: EAS and IPA.
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  .../driver-api/thermal/power_allocator.rst          |  8 ++++++++
>  Documentation/power/energy-model.rst                | 13 +++++++++++++
>  Documentation/scheduler/sched-energy.rst            |  5 +++++
>  3 files changed, 26 insertions(+)

I haven't read through these files in massive detail, but the quick
skim makes me believe that your additions seem sane.  In general, I'm
happy with documenting reality, thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I will note: you haven't actually updated the device tree bindings.
Thus, presumably, anyone who is specifying these numbers in the device
tree is still supposed to specify them in a way that mW can be
recovered, right?  Said another way: nothing about your patches makes
it OK to specify numbers in device trees using an "abstract scale",
right?

-Doug
