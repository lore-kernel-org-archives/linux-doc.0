Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBB6C7EE23
	for <linux-doc@archiver.kernel.org>; Fri, 26 May 2023 15:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243698AbjEZP7F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 May 2023 11:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244182AbjEZP7E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 May 2023 11:59:04 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61363187
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 08:59:01 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-541f4ee6f89so317960eaf.2
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685116740; x=1687708740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSRKBuS/oKd5fjIjvvaHlAtUo48fy4uJTXs+lCoN1vw=;
        b=f2sBZne/vKtkK/lk4t0/gRtIMivIWl2baIqJVKH3a4vlR5gImoHRlGZ5G4JQYE3Dih
         7nRNGmGkc9D8WsRBS+VyytzQmcV29mlOW9BIqa99N9baI+L3MPQCFI82HqV82+7+I1hx
         yANj0IJ5arSptM8ldKylACvtHKX6OCVnrBmk27xyWyIhGnD5hIGk2/4WrIS4qXkvDKZ2
         nLN7uYlvWNX9KMzNFsR0r2fwh/dhYKY2LmzQQsMcShmpJRZRWn76SeC2nShazTA5ostL
         fzi3mb1bCqNjIMJXBizkLV8x+yuWpThkNRgOlKjAAd2TszLG3h+EkuW7yGOXHxxthQiG
         +atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685116740; x=1687708740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSRKBuS/oKd5fjIjvvaHlAtUo48fy4uJTXs+lCoN1vw=;
        b=iKArFTVGF2Gu8oPHTSQRjSS8ztH4jxI5qjTfMR0snP7wpVkp/H7n0kvh/MXiIbUrMI
         hhTKL5337KPNeKxw9ZIMbpQnjTbREJyg6R4MLogk6y6Hbemjqu+cwM59OZBhf9XJmlk3
         IXLMoboIIgeZiOd3A6Z60YHrdlfeiqEXdhUcXRquvot8d4HlwBxg16PyInMysCVAZTHH
         tROqmbwt4M9qgkLaLNOOilIcgA6ljHt94QNZCTyO2nmkXVKuI2elnrTCpKVWQOUuBwyR
         HtTevplp/4NmagrPlJAiLvz1bT5qVpsve+cjB3oYoFjHnwvv2FRFEhCgyXEr7kRJh6DI
         +myQ==
X-Gm-Message-State: AC+VfDw9Ka+sOZ60p7AqMjCbX2QtSQSnxwcqq6EZbQbmqC5Pjw9lWz+E
        XUSefPX004qQqNNwIHgik8FBpMpF4yfe0WLB0F4vXg==
X-Google-Smtp-Source: ACHHUZ5ZTSmP0QrHf7hz66nAsxeVVUQ0SpUHxrFTO+uHZWy73GDXXQ0RXqMJqWZ2a7+cV4JqymiWaY6rdgRoL1w+sZo=
X-Received: by 2002:a05:6808:1405:b0:38d:fdf2:962e with SMTP id
 w5-20020a056808140500b0038dfdf2962emr1562135oiv.23.1685116740735; Fri, 26 May
 2023 08:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230526145519.2282062-1-vineeth@bitbyteword.org>
 <20230526172959.5440b9dd@nowhere> <CAO7JXPgLFgXANqXY7L-YLbijxJCOgUKmd8nUQizb62JorOXGhA@mail.gmail.com>
In-Reply-To: <CAO7JXPgLFgXANqXY7L-YLbijxJCOgUKmd8nUQizb62JorOXGhA@mail.gmail.com>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Fri, 26 May 2023 11:58:50 -0400
Message-ID: <CAO7JXPit6snFM2oW-uSs-mtbmKr9wpbX2exqAUF0iAiaAO6hOg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] sched/deadline: Fix bandwidth reclaim equation in GRUB
To:     luca abeni <luca.abeni@santannapisa.it>
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        youssefesmat@google.com,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Luca,

>
> On Fri, May 26, 2023 at 11:30=E2=80=AFAM luca abeni <luca.abeni@santannap=
isa.it> wrote:
> > [...]
> > > + * but as "dq =3D -(max{u, (1 - Uinact - Uextra)} / Umax) dt",
> >
> > ...But I think this is wrong (should be "Umax - ...", not "1 - ...").
> > I think patch 2/2 has the same issue.
> >
> Oops sorry, I missed this. Will send the fixed patch as a
> reply to the original v4.
>
On looking again, I think the description is correct. That line
mentions the actual m-GRUB equation from the paper. And then the
comment explains why we use Umax(because of limiting the bandwidth
to RT capacity).

Does it seem correct to you?

Thanks,
Vineeth
