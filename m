Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BA4407DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 14:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754566AbeDYOuR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 10:50:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:35740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754300AbeDYOuP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 25 Apr 2018 10:50:15 -0400
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com [209.85.220.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB73C21759;
        Wed, 25 Apr 2018 14:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB73C21759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh+dt@kernel.org
Received: by mail-qk0-f178.google.com with SMTP id b131so18527986qkg.2;
        Wed, 25 Apr 2018 07:50:14 -0700 (PDT)
X-Gm-Message-State: ALQs6tC+IL/cnr/gy/hfHvCE7jRPRVotQHkqTd7Ihvy7TSUnI2UXcW5z
        lGqxfFK/3eKPwIuMVH60jCAQv0oTY5ORCWx0OQ==
X-Google-Smtp-Source: AB8JxZrjwcg5IVBxQVtASfpQh5/Nbp1qm73F9kbHmfsgHyYKkdlayWvzily68G0v3npX1WIfwPatC623R/NR4UbyWLk=
X-Received: by 10.55.31.132 with SMTP id n4mr29350132qkh.375.1524667813859;
 Wed, 25 Apr 2018 07:50:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.228 with HTTP; Wed, 25 Apr 2018 07:49:53 -0700 (PDT)
In-Reply-To: <20180425125449.19755-10-kishon@ti.com>
References: <20180425125449.19755-1-kishon@ti.com> <20180425125449.19755-10-kishon@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 25 Apr 2018 09:49:53 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+d6VdbYT3djvYQARjEP3qXiG16f9e8XESfNBj3zzf2NQ@mail.gmail.com>
Message-ID: <CAL_Jsq+d6VdbYT3djvYQARjEP3qXiG16f9e8XESfNBj3zzf2NQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] ARM: dts: dra72-evm-common: Add wilink8 wlan support
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Hari Nagalla <hnagalla@ti.com>, Eyal Reizer <eyalr@ti.com>,
        Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 25, 2018 at 7:54 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> From: Hari Nagalla <hnagalla@ti.com>
>
> Wilink8 module is a combo wireless connectivity card based
> on Texas Instrument's wl18xx solution.
>
> Add support for the wlan capabilities of this module by muxing
> the relevant mmc lines, and setting the required device-tree
> data.
>
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> [nsekhar@ti.com: drop WLAN_EN pinmux. It should be done by bootloader.
>                  Also, some commit message adjustments]
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  arch/arm/boot/dts/dra72-evm-common.dtsi   | 42 +++++++++++++++++++++++
>  arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi | 11 ++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
> index 8e3b185d864b..1e4d36e33a1b 100644
> --- a/arch/arm/boot/dts/dra72-evm-common.dtsi
> +++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
> @@ -44,6 +44,16 @@
>                 regulator-boot-on;
>         };
>
> +       evm_3v6: fixedregulator-evm_3v6 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "evm_3v6";
> +               regulator-min-microvolt = <3600000>;
> +               regulator-max-microvolt = <3600000>;
> +               vin-supply = <&evm_5v0>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
>         vsys_3v3: fixedregulator-vsys3v3 {
>                 /* Output 2 of TPS43351QDAPRQ1 on dra72-evm */
>                 /* Output 2 of LM5140QRWGTQ1 on dra71-evm */
> @@ -171,6 +181,15 @@
>                         clocks = <&atl_clkin2_ck>;
>                 };
>         };
> +
> +       vmmcwl_fixed: fixedregulator-mmcwl {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vmmcwl_fixed";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               gpio = <&gpio5 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
>  };
>
>  &dra7_pmx_core {
> @@ -398,6 +417,29 @@
>         max-frequency = <192000000>;
>  };
>
> +&mmc4 {
> +       status = "okay";
> +       vmmc-supply = <&evm_3v6>;
> +       vqmmc-supply = <&vmmcwl_fixed>;
> +       bus-width = <4>;
> +       cap-power-off-card;
> +       keep-power-in-suspend;
> +       non-removable;
> +       pinctrl-names = "default", "hs", "sdr12", "sdr25";
> +       pinctrl-0 = <&mmc4_pins_default>;
> +       pinctrl-1 = <&mmc4_pins_default>;
> +       pinctrl-2 = <&mmc4_pins_default>;
> +       pinctrl-3 = <&mmc4_pins_default>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       wlcore: wlcore@2 {

wifi@2
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
