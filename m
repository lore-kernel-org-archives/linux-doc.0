Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8958C4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 17:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DAD32080A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 17:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bjhy7mLE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgJERoN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 13:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbgJERoM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 13:44:12 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FFCC0613A7
        for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2020 10:44:12 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id r78so1938402vke.11
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T0SUN6EKstVpoqlENVYkDpfxgRN2mhcM+hd8aVgx82Y=;
        b=Bjhy7mLEf3dMbcB301h2+hrEGKwW0Lztpw8VQTUMYjrf5E1N0OvXzBbiN7Nm22aCGw
         9lKqHBSMuJczFFO2SHFwXrme+RSj2XbTPmbMh7WBl7D7F4LgcymOwFioF5/PDyoF94sI
         03dR3zYUPifD8/ZTSvWCz2HfMihd2oVmvihvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T0SUN6EKstVpoqlENVYkDpfxgRN2mhcM+hd8aVgx82Y=;
        b=W40j5uBmSlTllES7/sjt0rHLgklgpDAUoA/TEcDbwnNkBbiQEwGdR/r+u5mveEwwWe
         QV4ArizrkQULcDkdBxYcCwAa+At8Zn12n5HE/Mcc26pGIKRg1N2iy9B90sUmPeURgwwm
         tgs9XgIwVON63/TpK7ghYGMcDX3tO7ziT6/knLrOQxi87iiIV6OECsaDr40wIxTRtxp+
         bJRihkqPZPvDQV/vzdplf7O0z9CIo1vSBR/IiwQwuP/PyOWDAqzp2jklrpKYq6hoCWok
         dGImxqiB3AXMzWgRLHdC9qYke4DQu82fW5H67UUYeY65JAWdowRJ+V5SnrKJOBxdJUCC
         envg==
X-Gm-Message-State: AOAM5302VuZbCaxujzatEJzhRIiGxTjydCDUZuGMocoPKQ0CpKdO2u1c
        Tl2+/ugG/JAarz/ORT9yd0P+e/z2lK8TRg==
X-Google-Smtp-Source: ABdhPJzBiBSMfbxIC3efu+kauVj/hEtOqKRXCSeQxhXdNDJV7dVdpjS9OMIroFvKf9BrvVt9GkPCZQ==
X-Received: by 2002:a1f:a905:: with SMTP id s5mr584699vke.9.1601919851996;
        Mon, 05 Oct 2020 10:44:11 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id d1sm101073vsk.4.2020.10.05.10.44.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 10:44:11 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id f8so2375209vsl.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 10:44:10 -0700 (PDT)
X-Received: by 2002:a67:f4c2:: with SMTP id s2mr992567vsn.4.1601919849846;
 Mon, 05 Oct 2020 10:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201005163016.13650-1-lukasz.luba@arm.com>
In-Reply-To: <20201005163016.13650-1-lukasz.luba@arm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 5 Oct 2020 10:43:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W70OPB=ufEfqAJEeZBNwr5yPOCmkM7R2uLKnEj6tZ1qA@mail.gmail.com>
Message-ID: <CAD=FV=W70OPB=ufEfqAJEeZBNwr5yPOCmkM7R2uLKnEj6tZ1qA@mail.gmail.com>
Subject: Re: [RESEND][PATCH v2 3/3] dt-bindings: thermal: update
 sustainable-power with abstract scale
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>, linux-doc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        amitk@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Dietmar.Eggemann@arm.com, Quentin Perret <qperret@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Oct 5, 2020 at 9:30 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Update the documentation for the binding 'sustainable-power' and allow
> to provide values in an abstract scale. It is required when the cooling
> devices use an abstract scale for their power values.
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>
> Hi Rob,
>
> This is a fixed patch for DT binding, which now passes the
> make dt_binding_check (I have changed tabs into spaces).
> The former patch error that I have received is here [1].
>
> Regards,
> Lukasz
>
> [1] https://lore.kernel.org/linux-pm/20201002114426.31277-1-lukasz.luba@arm.com/T/#md4b02a3ada592df67446566180643ba56788c159

...and because I suspect you might not look at any patches that fail
your auto-checker, I'd appreciate it if you could comment on the
discussion on the previous version of the patch.  Thanks!  :-)

-Doug
