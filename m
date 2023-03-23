Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DB3C74A5B
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 08:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjCWIiH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjCWIhr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 04:37:47 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0F334F74
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 01:36:31 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id e65so23871983ybh.10
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUuy98YfrrGR9WlMIlTaa+4F/lCxj6Hdgjgj3ZONIGA=;
        b=Q7owO8OcLsAk4Smi2JWsWIKAzqfBJpGOHyVtF07hxl9piqNLJCWoW7ed4RVNmHjhGk
         ol3NRAXqNtaHo6lDY/g//4xjwt/zxo/2zoFknjy1zGZhizSaFw5hdgDuLK8RdU/zZVAH
         dCepbf77TgGhUbiTSUqhp684enkT1DtfqWYiu+D4zXHU39Q95c87S5jHYzWSUjmQidIr
         CR/bcZ9UWgx4ZwxmbVTnGPjgT3U1OF+r4Mp8yx8TwvEPJeXshXVD54tjYJO1ApHYyVfH
         z4fQSasarnufBSTBhpRbCiJTIbgj3WYu0exC/3/6OArXM7pWXh8QX0awOx12n+r31erH
         QTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUuy98YfrrGR9WlMIlTaa+4F/lCxj6Hdgjgj3ZONIGA=;
        b=UkVujl6xNZDGLb3fLujGhVvvP9WLCvj4mEEycEBz156ifiNUaAvMyViZfQH2fWAniz
         ItCujZB30izR8jCGMbmVCKJaVr9h5AFvXGJKJPWVYIwL0tdSAqKPeZkuF0gFcRQerQ4s
         u8C9U9/BoD8fAMEcITa+LUndpAd19ahDjUv9kfB8BjRVK2nnZCPSco4b9yMROezS0eLH
         z2kyH+qpx6DVirieKlB1FMKk9FjlwQeCD9kw+tKAGkc30c154TyQlEgAv1sncGBFzPSt
         XlbZS9wxlQ4VUewfPl6J0rFkqSJuCSmQ1to4nFSPIqaLhjTniRe4hysclypMn8bPjZjy
         sR8g==
X-Gm-Message-State: AAQBX9fWySxoDpIqNRrvcngTzD4/3N87cnfmAzzJNIJihKoO6i9MGpxl
        74oMM6oBDYwZerHrZGo0F9XfgwdffTAUwLb2wHq/cw==
X-Google-Smtp-Source: AKy350bcnM7cm+AyBPl6E7Dhs+RovIUhLWC1y2V4vCJ+ybMyh+qGNl7hbQ/eRRAdXm8YoocIetQrjs3e6tsPxiaKuts=
X-Received: by 2002:a05:6902:a93:b0:b23:4649:7ef3 with SMTP id
 cd19-20020a0569020a9300b00b2346497ef3mr1654862ybb.4.1679560587513; Thu, 23
 Mar 2023 01:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-5-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-5-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:36:16 +0100
Message-ID: <CACRpkdbkCEPOV9xEXx20qm5idG0p2vdoyU09FRwXmMyj5gGqoA@mail.gmail.com>
Subject: Re: [PATCH V4 04/10] dt-bindings: timestamp: Add nvidia,gpio-controller
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> Introducing nvidia,gpio-controller property from Tegra234 SoCs onwards.
> This is done to help below case.
>
> Without this property code would look like:
> if (of_device_is_compatible(dev->of_node, "nvidia,tegra194-gte-aon"))
>         hte_dev->c =3D gpiochip_find("tegra194-gpio-aon",
>                                    tegra_get_gpiochip_from_name);
> else if (of_device_is_compatible(dev->of_node, "nvidia,tegra234-gte-aon")=
)
>         hte_dev->c =3D gpiochip_find("tegra234-gpio-aon",
>                                    tegra_get_gpiochip_from_name);
> else
>         return -ENODEV;
>
> This means for every future addition of the compatible string, if else
> condition statements have to be expanded.
>
> With the property:
> gpio_ctrl =3D of_parse_phandle(dev->of_node, "nvidia,gpio-controller", 0)=
;
> ....
> hte_dev->c =3D gpiochip_find(gpio_ctrl, tegra_get_gpiochip_from_of_node);
>
> This simplifies the code significantly. The introdunction of this
> property/binding does not break existing Tegra194 provider driver.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

It is fair to assume that other operating systems will need this too
so I interpret the commit message as an example of the issues
faced by anyone making a driver for this HW.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
