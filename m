Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4A8C4727D
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 14:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9F3C206DB
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 14:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A5cXXjzF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388056AbgJBObc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJBObc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 10:31:32 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15615C0613D0
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 07:31:32 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id z46so450147uac.13
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cnU95a4B/lopWn7PJb9EKa9/N6eV+gD0Xs8KJ/fY4rM=;
        b=A5cXXjzFewYmWbzazwRS0/VaBU2zMwnx+gFsMz74IU9GsLD3USy5XdWUJzxT39eCc7
         lnBzqESdtLpD0XCCYhvmegsVhtPZJmgxrgt5ttIqBvgDpGo/QdTT6fGyWy8toyId5OSE
         FWLvaBXHHL3dljVDcvJ7tOLPA1Na5BenHsg6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cnU95a4B/lopWn7PJb9EKa9/N6eV+gD0Xs8KJ/fY4rM=;
        b=FBY9FRm23anaf2xAc85Nw13gqWxyinQT/zNYG4craFWKL3fZs1j1K5UayhKsuBoxgx
         Se7HvoH8kyxGHnNovPzR8pweU9ss8dYhwVeyUYSu2qD4vvQK0ovwY3l6zMQ05JZl/uYf
         SbrKYCJqv57Z5KPaPrTLMgZtpG3/xDhowZF+tCJzvGU00KQT3lw808fbu2cuaWShMDmn
         1Ch+wzaFJG6PTgbL0TW9IRFk9wbmTp5Y7hYp2cgDiJX4TwEz1iHNdrEBZaasfKiJpddQ
         Cnfbm9ehlHhPCZDD8ajrwsNBC/kXb8pgnS7WMJ+5KtKqfMxBNGw+EyDN1J7LhB+LmHm0
         2QjQ==
X-Gm-Message-State: AOAM530d1ujAxZkb8pLZmoIqz/69BCcSeqmRDjzzBOdntCUIBH91fvH6
        OO24Vg/38bpF/erx4bBgSBRdvBi8f+pnUQ==
X-Google-Smtp-Source: ABdhPJxtsvcjlEDeurkSAZ5HSqvA6HgyFDJAxADCvEI6D/ZZkBQZtQm5dDrSxAUXO9ZaXoI4cJQiiQ==
X-Received: by 2002:ab0:5e8:: with SMTP id e95mr1221065uae.57.1601649090915;
        Fri, 02 Oct 2020 07:31:30 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id o145sm267555vkd.13.2020.10.02.07.31.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:31:30 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id j3so747075vsm.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 07:31:29 -0700 (PDT)
X-Received: by 2002:a67:f4c2:: with SMTP id s2mr1288376vsn.4.1601649088871;
 Fri, 02 Oct 2020 07:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201002114426.31277-1-lukasz.luba@arm.com> <20201002114426.31277-4-lukasz.luba@arm.com>
In-Reply-To: <20201002114426.31277-4-lukasz.luba@arm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Oct 2020 07:31:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UbNP5-G1z95F37Fmv8=n0JPSSwnPQO_K==WpAc4vAHWQ@mail.gmail.com>
Message-ID: <CAD=FV=UbNP5-G1z95F37Fmv8=n0JPSSwnPQO_K==WpAc4vAHWQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: thermal: update sustainable-power
 with abstract scale
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

On Fri, Oct 2, 2020 at 4:45 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Update the documentation for the binding 'sustainable-power' and allow
> to provide values in an abstract scale. It is required when the cooling
> devices use an abstract scale for their power values.
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  .../devicetree/bindings/thermal/thermal-zones.yaml  | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> index 3ec9cc87ec50..4d8f2e37d1e6 100644
> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> @@ -99,10 +99,15 @@ patternProperties:
>        sustainable-power:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          description:
> -          An estimate of the sustainable power (in mW) that this thermal zone
> -          can dissipate at the desired control temperature. For reference, the
> -          sustainable power of a 4-inch phone is typically 2000mW, while on a
> -          10-inch tablet is around 4500mW.
> +          An estimate of the sustainable power (in mW or in an abstract scale)
> +         that this thermal zone can dissipate at the desired control
> +         temperature. For reference, the sustainable power of a 4-inch phone
> +         is typically 2000mW, while on a 10-inch tablet is around 4500mW.
> +
> +         It is possible to express the sustainable power in an abstract
> +         scale. This is the case when the related cooling devices use also
> +         abstract scale to express their power usage. The scale must be
> +         consistent.

Two thoughts:

1. If we're going to allow "sustainable-power" to be in abstract
scale, why not allow "dynamic-power-coefficient" to be in abstract
scale too?  I assume that the whole reason against that originally was
the idea of device tree purity, but if we're allowing the abstract
scale here then there seems no reason not to allow it for
"dynamic-power-coefficient".

2. Is it worth adding some type of indication of what type of units
"sustainable-power" is represented in?  Maybe even a made up unit so
that you could tell the difference between made up units in the same
system?  I'd envision something like:

sustainable-power-units = "qualcomm,sc7180-bogoWatts"

...and on the dynamic-power-coefficient side, the same:

dynamic-power-coefficient-units = "qualcomm,sc7180-bogoWatts"

One could imagine someone even later (after devices are widely
distributed) figuring out translations between these bogoWatts numbers
and real Watts if someone could come up with a case where it matters.


-Doug
