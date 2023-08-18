Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBE4C77B7C
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 16:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378631AbjHRQ2e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 12:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378639AbjHRQ2X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 12:28:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2577E30F1;
        Fri, 18 Aug 2023 09:28:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B76DA62128;
        Fri, 18 Aug 2023 16:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE97C433C7;
        Fri, 18 Aug 2023 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692376100;
        bh=LiRICI2/J0/ebyHM3s44JO/H09M7s9q4Pw4YKyi40B0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YIaTiWx0iaadO9GLlgdR6Ynxq3YrTjhjpdgNAkFQWKT7kLmgd+JX9/L84HhR1DWCv
         dtZXjWMIQ8JBm3DtBbEXwsj/kySmHVdHYfaqRWqOTv1E4T3XWZTpVJbAIGVvg2BagW
         o8H2c2bumPoOEw8UcawwBMw3inaoHGhV8EsnVWYAHeDJuBOldN2vI261VoTgX8YD+b
         jlCa72GaimHOO5prpaZvSexRLogB8/Au7lBrL6gddOvwKlIV4FU8F509VdSKBIytVU
         3ujpO6dPeix+zMebzmVA7JJnfQzvVcawJjjG4VnA3yI7i5ite0sl8GnZ1XqRasSSSg
         1mXOq4f12Gwzg==
Received: (nullmailer pid 124312 invoked by uid 1000);
        Fri, 18 Aug 2023 16:28:18 -0000
Date:   Fri, 18 Aug 2023 11:28:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: Fix typos
Message-ID: <169237591222.120900.11534361495306625818.robh@kernel.org>
References: <20230814212822.193684-1-helgaas@kernel.org>
 <20230814212822.193684-3-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814212822.193684-3-helgaas@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Mon, 14 Aug 2023 16:28:21 -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Fix typos in Documentation/devicetree/bindings.  The changes are in
> descriptions or comments where they shouldn't affect functionality.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml   |  4 ++--
>  .../arm/marvell/cp110-system-controller.txt      |  8 ++++----
>  .../bindings/arm/mediatek/mediatek,mipi0a.txt    |  2 +-
>  .../bindings/arm/mediatek/mediatek,vcodecsys.txt |  2 +-
>  Documentation/devicetree/bindings/arm/sunxi.yaml |  4 ++--
>  .../devicetree/bindings/ata/pata-common.yaml     |  2 +-
>  .../devicetree/bindings/bus/brcm,gisb-arb.yaml   |  2 +-
>  .../bindings/bus/nvidia,tegra210-aconnect.yaml   |  4 ++--
>  .../clock/allwinner,sun4i-a10-osc-clk.yaml       |  2 +-
>  .../devicetree/bindings/clock/alphascale,acc.txt |  4 ++--
>  .../devicetree/bindings/clock/keystone-pll.txt   |  2 +-
>  .../devicetree/bindings/clock/lpc1850-ccu.txt    |  2 +-
>  .../bindings/clock/lpc1850-creg-clk.txt          |  4 ++--
>  .../devicetree/bindings/clock/maxim,max9485.txt  |  2 +-
>  .../bindings/clock/qcom,gcc-sm8450.yaml          |  2 +-
>  .../bindings/clock/qcom,kpss-acc-v1.yaml         |  2 +-
>  .../bindings/clock/sprd,sc9863a-clk.yaml         |  2 +-
>  .../devicetree/bindings/clock/ti/mux.txt         |  2 +-
>  .../devicetree/bindings/clock/vf610-clock.txt    |  2 +-
>  .../bindings/clock/xlnx,zynqmp-clk.txt           |  2 +-
>  .../bindings/connector/usb-connector.yaml        |  2 +-
>  .../devfreq/event/samsung,exynos-ppmu.yaml       |  2 +-
>  .../bindings/display/atmel/hlcdc-dc.txt          |  2 +-
>  .../display/bridge/snps,dw-mipi-dsi.yaml         |  2 +-
>  .../bindings/display/cirrus,clps711x-fb.txt      |  2 +-
>  .../bindings/display/msm/qcom,mdss.yaml          |  2 +-
>  .../display/panel/olimex,lcd-olinuxino.yaml      |  2 +-
>  .../bindings/display/panel/panel-common.yaml     |  2 +-
>  .../display/tegra/nvidia,tegra124-sor.yaml       |  2 +-
>  .../devicetree/bindings/dma/ingenic,dma.yaml     |  2 +-
>  .../bindings/dma/nvidia,tegra20-apbdma.txt       |  2 +-
>  .../devicetree/bindings/dma/qcom,bam-dma.yaml    |  2 +-
>  .../bindings/dma/stericsson,dma40.yaml           |  2 +-
>  .../devicetree/bindings/fpga/fpga-region.txt     |  4 ++--
>  .../devicetree/bindings/gpio/gpio-xgene-sb.txt   |  2 +-
>  .../bindings/gpio/snps,dw-apb-gpio.yaml          |  2 +-
>  .../devicetree/bindings/gpio/ti,omap-gpio.yaml   |  4 ++--
>  .../devicetree/bindings/hwmon/adi,adm1177.yaml   |  2 +-
>  .../bindings/hwmon/adi,axi-fan-control.yaml      |  2 +-
>  .../devicetree/bindings/hwmon/adi,ltc2992.yaml   |  2 +-
>  .../bindings/hwmon/aspeed-pwm-tacho.txt          |  2 +-
>  Documentation/devicetree/bindings/hwmon/lm87.txt |  2 +-
>  .../devicetree/bindings/hwmon/ltq-cputemp.txt    |  2 +-
>  .../bindings/hwmon/moortec,mr75203.yaml          |  2 +-
>  .../bindings/hwmon/npcm750-pwm-fan.txt           |  2 +-
>  .../bindings/hwmon/sensirion,shtc1.yaml          |  2 +-
>  .../devicetree/bindings/hwmon/ti,tmp513.yaml     |  2 +-
>  .../devicetree/bindings/hwmon/ti,tps23861.yaml   |  2 +-
>  .../devicetree/bindings/i2c/i2c-sprd.txt         |  2 +-
>  .../bindings/iio/adc/xlnx,zynqmp-ams.yaml        |  2 +-
>  .../devicetree/bindings/iio/cdc/adi,ad7150.yaml  |  2 +-
>  .../devicetree/bindings/iio/common.yaml          |  2 +-
>  .../bindings/iio/frequency/adi,admv1014.yaml     |  2 +-
>  .../bindings/iio/humidity/ti,hdc2010.yaml        |  2 +-
>  .../iio/pressure/honeywell,mprls0025pa.yaml      |  2 +-
>  .../bindings/iio/proximity/ams,as3935.yaml       |  2 +-
>  .../devicetree/bindings/iio/st,st-sensors.yaml   |  2 +-
>  .../bindings/input/rmi4/rmi_2d_sensor.txt        |  4 ++--
>  .../bindings/input/touchscreen/stmpe.txt         |  2 +-
>  .../bindings/input/touchscreen/tsc2007.txt       |  2 +-
>  .../interrupt-controller/arm,gic-v3.yaml         |  2 +-
>  .../brcm,bcm2835-armctrl-ic.txt                  |  2 +-
>  .../brcm,bcm7120-l2-intc.yaml                    |  2 +-
>  .../backlight/mediatek,mt6370-backlight.yaml     |  2 +-
>  .../devicetree/bindings/leds/leds-lp55xx.yaml    |  4 ++--
>  .../devicetree/bindings/leds/leds-qcom-lpg.yaml  |  2 +-
>  .../bindings/mailbox/brcm,iproc-flexrm-mbox.txt  |  2 +-
>  .../bindings/mailbox/ti,omap-mailbox.yaml        |  2 +-
>  .../bindings/media/i2c/toshiba,tc358746.yaml     |  2 +-
>  .../devicetree/bindings/media/i2c/tvp5150.txt    |  2 +-
>  .../media/mediatek,vcodec-subdev-decoder.yaml    |  2 +-
>  .../memory-controllers/mediatek,smi-larb.yaml    |  2 +-
>  .../memory-controllers/rockchip,rk3399-dmc.yaml  |  4 ++--
>  .../memory-controllers/xlnx,zynq-ddrc-a05.yaml   |  2 +-
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml      |  2 +-
>  .../bindings/mfd/rohm,bd9576-pmic.yaml           |  4 ++--
>  .../bindings/mfd/stericsson,ab8500.yaml          | 16 ++++++++--------
>  .../bindings/mfd/stericsson,db8500-prcmu.yaml    |  2 +-
>  .../devicetree/bindings/mmc/pxa-mmc.txt          |  2 +-
>  .../devicetree/bindings/mmc/ti-omap-hsmmc.txt    |  2 +-
>  .../bindings/net/brcm,bcm7445-switch-v4.0.txt    |  2 +-
>  .../devicetree/bindings/net/can/cc770.txt        |  2 +-
>  .../devicetree/bindings/net/dsa/brcm,sf2.yaml    |  2 +-
>  .../devicetree/bindings/net/ethernet-phy.yaml    |  2 +-
>  .../devicetree/bindings/net/mediatek-dwmac.yaml  |  2 +-
>  .../bindings/net/microchip,lan95xx.yaml          |  2 +-
>  .../devicetree/bindings/net/nfc/marvell,nci.yaml |  4 ++--
>  .../devicetree/bindings/net/samsung-sxgbe.txt    |  4 ++--
>  .../bindings/net/snps,dwc-qos-ethernet.txt       |  2 +-
>  .../devicetree/bindings/net/sti-dwmac.txt        |  2 +-
>  .../bindings/net/xilinx_gmii2rgmii.txt           |  2 +-
>  .../devicetree/bindings/nios2/nios2.txt          |  2 +-
>  .../bindings/nvmem/layouts/onie,tlv-layout.yaml  |  2 +-
>  .../bindings/phy/phy-hisi-inno-usb2.txt          |  2 +-
>  .../bindings/phy/pistachio-usb-phy.txt           |  2 +-
>  .../devicetree/bindings/phy/pxa1928-usb-phy.txt  |  2 +-
>  .../bindings/phy/rockchip-inno-csi-dphy.yaml     |  2 +-
>  .../bindings/phy/ti,phy-j721e-wiz.yaml           |  2 +-
>  Documentation/devicetree/bindings/phy/ti-phy.txt |  2 +-
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml     |  2 +-
>  .../bindings/pinctrl/canaan,k210-fpioa.yaml      |  2 +-
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml         |  2 +-
>  .../pinctrl/mediatek,mt6795-pinctrl.yaml         |  2 +-
>  .../pinctrl/mediatek,mt7981-pinctrl.yaml         |  4 ++--
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml         |  4 ++--
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml         |  2 +-
>  .../pinctrl/mediatek,mt8365-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/pinctrl-max77620.txt        |  2 +-
>  .../bindings/pinctrl/pinctrl-rk805.txt           |  2 +-
>  .../devicetree/bindings/pinctrl/sprd,pinctrl.txt |  2 +-
>  .../devicetree/bindings/pmem/pmem-region.txt     |  4 ++--
>  .../bindings/power/renesas,sysc-rmobile.yaml     |  2 +-
>  .../bindings/power/supply/sbs,sbs-manager.yaml   |  2 +-
>  .../devicetree/bindings/powerpc/fsl/cpus.txt     |  2 +-
>  .../devicetree/bindings/powerpc/fsl/dcsr.txt     |  4 ++--
>  .../devicetree/bindings/powerpc/fsl/raideng.txt  |  2 +-
>  .../bindings/powerpc/nintendo/gamecube.txt       |  2 +-
>  .../devicetree/bindings/powerpc/nintendo/wii.txt |  2 +-
>  .../bindings/pwm/snps,dw-apb-timers-pwm2.yaml    |  2 +-
>  .../bindings/regulator/regulator-max77620.txt    |  2 +-
>  .../devicetree/bindings/regulator/regulator.yaml |  8 ++++----
>  .../regulator/richtek,rt5190a-regulator.yaml     |  2 +-
>  .../devicetree/bindings/regulator/vctrl.txt      |  2 +-
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml     |  2 +-
>  .../bindings/reset/ti-syscon-reset.txt           |  2 +-
>  .../devicetree/bindings/rng/omap_rng.yaml        |  4 ++--
>  .../devicetree/bindings/rtc/rtc-cmos.txt         |  2 +-
>  .../bindings/serial/nvidia,tegra20-hsuart.txt    |  2 +-
>  .../devicetree/bindings/serial/st-asc.txt        |  2 +-
>  .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml    |  2 +-
>  .../microchip/microchip,mpfs-sys-controller.yaml |  2 +-
>  .../bindings/soc/qcom/qcom,aoss-qmp.yaml         |  2 +-
>  .../bindings/sound/axentia,tse850-pcm5142.txt    |  2 +-
>  .../devicetree/bindings/sound/cs35l35.txt        |  2 +-
>  .../devicetree/bindings/sound/cs35l36.txt        |  2 +-
>  .../devicetree/bindings/sound/cs53l30.txt        |  2 +-
>  .../devicetree/bindings/sound/fsl,esai.txt       |  2 +-
>  .../bindings/sound/mediatek,mt8188-afe.yaml      |  2 +-
>  .../devicetree/bindings/sound/mt2701-afe-pcm.txt |  2 +-
>  .../bindings/sound/mt8195-afe-pcm.yaml           |  4 ++--
>  .../bindings/sound/qcom,msm8916-wcd-analog.txt   |  2 +-
>  .../devicetree/bindings/sound/renesas,rsnd.txt   |  2 +-
>  .../sound/rockchip,rk3288-hdmi-analog.txt        |  2 +-
>  .../devicetree/bindings/sound/rt5663.txt         |  2 +-
>  .../devicetree/bindings/sound/serial-midi.yaml   |  2 +-
>  .../devicetree/bindings/sound/sprd-pcm.txt       |  2 +-
>  .../devicetree/bindings/sound/st,stm32-sai.yaml  |  2 +-
>  .../bindings/sound/ti,j721e-cpb-ivi-audio.yaml   |  2 +-
>  .../devicetree/bindings/sound/ti,tas2781.yaml    |  2 +-
>  .../devicetree/bindings/sound/tlv320adcx140.yaml |  2 +-
>  .../bindings/soundwire/qcom,soundwire.yaml       |  4 ++--
>  .../bindings/spi/brcm,bcm2835-aux-spi.txt        |  4 ++--
>  .../bindings/spi/brcm,spi-bcm-qspi.yaml          |  4 ++--
>  .../devicetree/bindings/spi/omap-spi.yaml        |  2 +-
>  .../thermal/nvidia,tegra124-soctherm.txt         |  2 +-
>  .../devicetree/bindings/timer/snps,arc-timer.txt |  2 +-
>  .../devicetree/bindings/trivial-devices.yaml     |  8 ++++----
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml    |  2 +-
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml |  2 +-
>  .../devicetree/bindings/usb/msm-hsusb.txt        |  2 +-
>  .../devicetree/bindings/usb/richtek,rt1719.yaml  |  2 +-
>  161 files changed, 199 insertions(+), 199 deletions(-)
> 

Applied, thanks!

These conflict with linux-next as presumably because they've been 
converted to schema. So I've just dropped them:

* Unmerged path Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
* Unmerged path Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
* Unmerged path Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt
* Unmerged path Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-analog.txt
* Unmerged path Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt

