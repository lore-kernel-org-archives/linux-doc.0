Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B80F47D0F4
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 19:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751396AbeCTTjJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 15:39:09 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35489 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751481AbeCTTjI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 15:39:08 -0400
Received: by mail-pf0-f194.google.com with SMTP id y186so1060925pfb.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:to:from:in-reply-to:cc
         :references:message-id:user-agent:subject:date;
        bh=9hJCJUTr7iGOM4DYekqTBc8f0YwVNj4CgiQDljQzJio=;
        b=iqCyCVKeZj6V1CGjljVEpcCjGVWnhV+G/1EGl96s2SpIpo5vcYW9pzx8XFK+6tv/ks
         kM09EA/BZEultLwcqiy5jafHqrJSdUq26xIJYAFjRd1THyfYlFGO+SLfOknEwlTwI4za
         c+lmbAPYtZa7Xj9mlcSkQCjI2g8ZFJ8tRdpu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:to:from
         :in-reply-to:cc:references:message-id:user-agent:subject:date;
        bh=9hJCJUTr7iGOM4DYekqTBc8f0YwVNj4CgiQDljQzJio=;
        b=s4x5ejZqZiWhJhWFBjHcsFlYrlwPBLkiSITdwavBZ+4b0j/QPTMZWqm4+2zG6iay8t
         aceOywJjW4C8AtBklT5/pQtp+qqVs2n1raYJH8Ff7Zerz3gmcmCX9ZgZQEKIB2BybDJH
         roAfn9XSxS1IPlkmsMxlXMsA33tx9Bg23BsvTNR7CzxQ8LHyK0MuYN8U9ayI9HE6VcGZ
         rKYXKvZDi/JKylgUKwwjOJFQWMhNIIRxmem48+H7YjiKABFFfk9+pcDBaGHkuhFHbJUg
         tuItAwznmhOc8vJRl7xA5ZqLt7ik6tcZaWa3KgdGCbAu+Rz7YAbnMR5vNV+km1/Nrzv8
         Duhw==
X-Gm-Message-State: AElRT7ERX2+PJipXgdIcwOXcCiHk2Be9fb69P4AN3cyc7V2Qxk5WTY3U
        BQolW/Hi5OO9WyLwvo5GBmdUhQ==
X-Google-Smtp-Source: AG47ELu271eLO6AeCgkzCQoa6h0lUK/S+Bc4GG33ExtYxOoO5K0O4PhNNAfTosX2eMcNOg75CE1mrg==
X-Received: by 10.98.234.22 with SMTP id t22mr14638688pfh.56.1521574747531;
        Tue, 20 Mar 2018 12:39:07 -0700 (PDT)
Received: from localhost ([2620:0:1000:1511:d30e:62c6:f82c:ff40])
        by smtp.gmail.com with ESMTPSA id 13sm5405568pfm.10.2018.03.20.12.39.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Mar 2018 12:39:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de
From:   Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <1521071931-9294-6-git-send-email-kramasub@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-6-git-send-email-kramasub@codeaurora.org>
Message-ID: <152157474508.187949.10348604942277810227@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v4 5/6] arm64: dts: sdm845: Add serial console support
Date:   Tue, 20 Mar 2018 12:39:05 -0700
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:50)
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dt=
s/qcom/sdm845-mtp.dts
> index 979ab49..ea3efc5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -12,4 +12,43 @@
>  / {
>         model =3D "Qualcomm Technologies, Inc. SDM845 MTP";
>         compatible =3D "qcom,sdm845-mtp";
> +
> +       aliases {
> +               serial0 =3D &uart2;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0";

Also add :115200n8 ?


> +       };
> +};
> +
> +&soc {

I think the method is to put these inside soc node without using the
phandle reference. So indent everything once more.

> +       geniqup@ac0000 {
> +               serial@a84000 {
> +                       status =3D "okay";
> +               };
> +       };
> +
> +       pinctrl@3400000 {
> +               qup-uart2-default {
> +                       pinconf_tx {
> +                               pins =3D "gpio4";
> +                               drive-strength =3D <2>;
> +                               bias-disable;
> +                       };
> +
> +                       pinconf_rx {
> +                               pins =3D "gpio5";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +               };
> +
> +               qup-uart2-sleep {
> +                       pinconf {
> +                               pins =3D "gpio4", "gpio5";
> +                               bias-pull-down;
> +                       };
> +               };
> +       };
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 32f8561..59334d9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -6,6 +6,7 @@
>   */
>  =

>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  =

>  / {
>         interrupt-parent =3D <&intc>;
> @@ -194,6 +195,20 @@
>                         #gpio-cells =3D <2>;
>                         interrupt-controller;
>                         #interrupt-cells =3D <2>;
> +
> +                       qup_uart2_default: qup-uart2-default {
> +                               pinmux {
> +                                       function =3D "qup9";
> +                                       pins =3D "gpio4", "gpio5";
> +                               };
> +                       };
> +
> +                       qup_uart2_sleep: qup-uart2-sleep {
> +                               pinmux {
> +                                       function =3D "gpio";
> +                                       pins =3D "gpio4", "gpio5";
> +                               };
> +                       };

Are these supposed to go to the board file?

>                 };
>  =

>                 timer@17c90000 {
> @@ -272,5 +287,28 @@
>                         #interrupt-cells =3D <4>;
>                         cell-index =3D <0>;
>                 };
> +
> +               geniqup@ac0000 {
> +                       compatible =3D "qcom,geni-se-qup";
> +                       reg =3D <0xac0000 0x6000>;
> +                       clock-names =3D "m-ahb", "s-ahb";
> +                       clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +                                <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;

Add a status =3D "disabled" here too.

> +
> +                       uart2: serial@a84000 {
> +                               compatible =3D "qcom,geni-debug-uart";
> +                               reg =3D <0xa84000 0x4000>;
> +                               clock-names =3D "se";
> +                               clocks =3D <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +                               pinctrl-names =3D "default", "sleep";
> +                               pinctrl-0 =3D <&qup_uart2_default>;
> +                               pinctrl-1 =3D <&qup_uart2_sleep>;
> +                               interrupts =3D <GIC_SPI 354 IRQ_TYPE_LEVE=
L_HIGH>;
> +                               status =3D "disabled";
> +                       };
> +               };
>         };
>  };
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
