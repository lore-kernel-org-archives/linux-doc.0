Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A49BC001DB
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 21:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbjHNV2k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 17:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbjHNV2c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 17:28:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689F9113;
        Mon, 14 Aug 2023 14:28:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E144F6217F;
        Mon, 14 Aug 2023 21:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63CDC433C8;
        Mon, 14 Aug 2023 21:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692048509;
        bh=dcmmW1miXKK0IWwCJ7FiASGc4CRNp+6V8pV2USusIOw=;
        h=From:To:Cc:Subject:Date:From;
        b=iZ6ikgJmWY1HbULFJA4LTLVwj4yq+Qk95ObOO7DpfVNlrV5VC0BdGHZoT1WWAfT5u
         Z6ID6eCuMxngzAZuXd4wKpXLxKttoLpz3AfnktG85FGr2OrpWgourY6N87p+liimYb
         1Z2KFc3JkSXJ40ctfXWJA3fwBtorn1mGE+zgiUVw/q25p2I4jFPY9gmYPgjrJTPOY7
         THqy2KNhBwHtCSxVFDLY1u8ULmI3dSpoZg7yH8+QyccxcooUdMtHqpKDacl/cTjLBE
         /gAn2vD5k1MNDYVTfg9p9FPk500VbwbCbkX6b4vXFF2ZGIQr0bluyNpwmV5E4woWZZ
         7RoOFpQYtg+jw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/3] Documentation: Fix typos
Date:   Mon, 14 Aug 2023 16:28:19 -0500
Message-Id: <20230814212822.193684-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Fix typos in Documentation.  I split these into:

  Documentation/ABI/
  Documentation/devicetree/bindings/
  <everything else>

If it would be better split more or differently, I'm happy to do that.
These are strictly typo fixes, no clarification or rewording.


Bjorn Helgaas (3):
  Documentation/ABI: Fix typos
  dt-bindings: Fix typos
  Documentation: Fix typos

 Documentation/ABI/stable/sysfs-block          |  2 +-
 .../ABI/stable/sysfs-class-infiniband         |  2 +-
 .../ABI/stable/sysfs-platform-wmi-bmof        |  2 +-
 .../ABI/testing/debugfs-driver-habanalabs     |  2 +-
 Documentation/ABI/testing/procfs-diskstats    |  2 +-
 Documentation/ABI/testing/sysfs-bus-coreboot  |  2 +-
 .../testing/sysfs-bus-coresight-devices-etm3x |  8 +++---
 .../testing/sysfs-bus-coresight-devices-etm4x |  2 +-
 .../sysfs-bus-event_source-devices-events     |  4 +--
 .../ABI/testing/sysfs-bus-fsi-devices-sbefifo |  4 +--
 .../ABI/testing/sysfs-bus-i2c-devices-fsa9480 |  2 +-
 Documentation/ABI/testing/sysfs-bus-nfit      |  2 +-
 Documentation/ABI/testing/sysfs-bus-papr-pmem |  2 +-
 Documentation/ABI/testing/sysfs-bus-umc       |  2 +-
 Documentation/ABI/testing/sysfs-class         |  2 +-
 Documentation/ABI/testing/sysfs-class-cxl     |  4 +--
 Documentation/ABI/testing/sysfs-class-mtd     |  2 +-
 Documentation/ABI/testing/sysfs-class-net     |  2 +-
 .../ABI/testing/sysfs-class-net-queues        |  2 +-
 .../ABI/testing/sysfs-class-power-wilco       |  2 +-
 .../ABI/testing/sysfs-class-remoteproc        |  2 +-
 Documentation/ABI/testing/sysfs-class-thermal |  2 +-
 .../ABI/testing/sysfs-class-uwb_rc-wusbhc     |  2 +-
 .../ABI/testing/sysfs-devices-online          |  2 +-
 .../ABI/testing/sysfs-driver-ge-achc          |  2 +-
 .../ABI/testing/sysfs-driver-tegra-fuse       |  2 +-
 Documentation/ABI/testing/sysfs-firmware-acpi |  2 +-
 .../ABI/testing/sysfs-firmware-sgi_uv         |  4 +--
 Documentation/ABI/testing/sysfs-fs-f2fs       |  8 +++---
 .../ABI/testing/sysfs-kernel-mm-damon         |  2 +-
 .../ABI/testing/sysfs-memory-page-offline     |  4 +--
 .../ABI/testing/sysfs-platform-dell-laptop    |  2 +-
 .../ABI/testing/sysfs-platform-dfl-fme        |  2 +-
 Documentation/ABI/testing/sysfs-platform-kim  |  2 +-
 .../ABI/testing/sysfs-platform-sst-atom       |  2 +-
 .../admin-guide/kernel-parameters.txt         |  2 +-
 Documentation/admin-guide/mm/damon/usage.rst  |  4 +--
 .../admin-guide/mm/numa_memory_policy.rst     |  2 +-
 Documentation/admin-guide/module-signing.rst  |  2 +-
 Documentation/admin-guide/xfs.rst             |  2 +-
 Documentation/arch/arm/arm.rst                |  2 +-
 Documentation/arch/arm/ixp4xx.rst             |  4 +--
 Documentation/arch/arm/sunxi/clocks.rst       |  2 +-
 Documentation/arch/arm/swp_emulation.rst      |  2 +-
 Documentation/arch/arm/tcm.rst                |  2 +-
 Documentation/arch/arm/vlocks.rst             |  2 +-
 .../arch/arm64/acpi_object_usage.rst          |  2 +-
 Documentation/arch/arm64/arm-acpi.rst         |  2 +-
 Documentation/arch/openrisc/openrisc_port.rst |  4 +--
 Documentation/arch/x86/boot.rst               |  2 +-
 Documentation/arch/x86/buslock.rst            |  2 +-
 Documentation/arch/x86/mds.rst                |  2 +-
 Documentation/arch/x86/sgx.rst                |  2 +-
 Documentation/arch/xtensa/atomctl.rst         |  2 +-
 Documentation/block/data-integrity.rst        |  2 +-
 Documentation/block/ublk.rst                  |  2 +-
 Documentation/bpf/cpumasks.rst                |  2 +-
 Documentation/bpf/graph_ds_impl.rst           |  2 +-
 .../devicetree/bindings/arm/fsl.yaml          |  4 +--
 .../arm/marvell/cp110-system-controller.txt   |  8 +++---
 .../bindings/arm/mediatek/mediatek,mipi0a.txt |  2 +-
 .../arm/mediatek/mediatek,vcodecsys.txt       |  2 +-
 .../devicetree/bindings/arm/sunxi.yaml        |  4 +--
 .../devicetree/bindings/ata/pata-common.yaml  |  2 +-
 .../bindings/bus/brcm,gisb-arb.yaml           |  2 +-
 .../bus/nvidia,tegra210-aconnect.yaml         |  4 +--
 .../clock/allwinner,sun4i-a10-osc-clk.yaml    |  2 +-
 .../bindings/clock/alphascale,acc.txt         |  4 +--
 .../bindings/clock/keystone-pll.txt           |  2 +-
 .../devicetree/bindings/clock/lpc1850-ccu.txt |  2 +-
 .../bindings/clock/lpc1850-creg-clk.txt       |  4 +--
 .../bindings/clock/maxim,max9485.txt          |  2 +-
 .../bindings/clock/qcom,gcc-sm8450.yaml       |  2 +-
 .../bindings/clock/qcom,kpss-acc-v1.yaml      |  2 +-
 .../bindings/clock/sprd,sc9863a-clk.yaml      |  2 +-
 .../devicetree/bindings/clock/ti/mux.txt      |  2 +-
 .../devicetree/bindings/clock/vf610-clock.txt |  2 +-
 .../bindings/clock/xlnx,zynqmp-clk.txt        |  2 +-
 .../bindings/connector/usb-connector.yaml     |  2 +-
 .../devfreq/event/samsung,exynos-ppmu.yaml    |  2 +-
 .../bindings/display/atmel/hlcdc-dc.txt       |  2 +-
 .../display/bridge/snps,dw-mipi-dsi.yaml      |  2 +-
 .../bindings/display/cirrus,clps711x-fb.txt   |  2 +-
 .../bindings/display/msm/qcom,mdss.yaml       |  2 +-
 .../display/panel/olimex,lcd-olinuxino.yaml   |  2 +-
 .../bindings/display/panel/panel-common.yaml  |  2 +-
 .../display/tegra/nvidia,tegra124-sor.yaml    |  2 +-
 .../devicetree/bindings/dma/ingenic,dma.yaml  |  2 +-
 .../bindings/dma/nvidia,tegra20-apbdma.txt    |  2 +-
 .../devicetree/bindings/dma/qcom,bam-dma.yaml |  2 +-
 .../bindings/dma/stericsson,dma40.yaml        |  2 +-
 .../devicetree/bindings/fpga/fpga-region.txt  |  4 +--
 .../bindings/gpio/gpio-xgene-sb.txt           |  2 +-
 .../bindings/gpio/snps,dw-apb-gpio.yaml       |  2 +-
 .../bindings/gpio/ti,omap-gpio.yaml           |  4 +--
 .../bindings/hwmon/adi,adm1177.yaml           |  2 +-
 .../bindings/hwmon/adi,axi-fan-control.yaml   |  2 +-
 .../bindings/hwmon/adi,ltc2992.yaml           |  2 +-
 .../bindings/hwmon/aspeed-pwm-tacho.txt       |  2 +-
 .../devicetree/bindings/hwmon/lm87.txt        |  2 +-
 .../devicetree/bindings/hwmon/ltq-cputemp.txt |  2 +-
 .../bindings/hwmon/moortec,mr75203.yaml       |  2 +-
 .../bindings/hwmon/npcm750-pwm-fan.txt        |  2 +-
 .../bindings/hwmon/sensirion,shtc1.yaml       |  2 +-
 .../devicetree/bindings/hwmon/ti,tmp513.yaml  |  2 +-
 .../bindings/hwmon/ti,tps23861.yaml           |  2 +-
 .../devicetree/bindings/i2c/i2c-sprd.txt      |  2 +-
 .../bindings/iio/adc/xlnx,zynqmp-ams.yaml     |  2 +-
 .../bindings/iio/cdc/adi,ad7150.yaml          |  2 +-
 .../devicetree/bindings/iio/common.yaml       |  2 +-
 .../bindings/iio/frequency/adi,admv1014.yaml  |  2 +-
 .../bindings/iio/humidity/ti,hdc2010.yaml     |  2 +-
 .../iio/pressure/honeywell,mprls0025pa.yaml   |  2 +-
 .../bindings/iio/proximity/ams,as3935.yaml    |  2 +-
 .../bindings/iio/st,st-sensors.yaml           |  2 +-
 .../bindings/input/rmi4/rmi_2d_sensor.txt     |  4 +--
 .../bindings/input/touchscreen/stmpe.txt      |  2 +-
 .../bindings/input/touchscreen/tsc2007.txt    |  2 +-
 .../interrupt-controller/arm,gic-v3.yaml      |  2 +-
 .../brcm,bcm2835-armctrl-ic.txt               |  2 +-
 .../brcm,bcm7120-l2-intc.yaml                 |  2 +-
 .../backlight/mediatek,mt6370-backlight.yaml  |  2 +-
 .../devicetree/bindings/leds/leds-lp55xx.yaml |  4 +--
 .../bindings/leds/leds-qcom-lpg.yaml          |  2 +-
 .../mailbox/brcm,iproc-flexrm-mbox.txt        |  2 +-
 .../bindings/mailbox/ti,omap-mailbox.yaml     |  2 +-
 .../bindings/media/i2c/toshiba,tc358746.yaml  |  2 +-
 .../devicetree/bindings/media/i2c/tvp5150.txt |  2 +-
 .../media/mediatek,vcodec-subdev-decoder.yaml |  2 +-
 .../memory-controllers/mediatek,smi-larb.yaml |  2 +-
 .../rockchip,rk3399-dmc.yaml                  |  4 +--
 .../xlnx,zynq-ddrc-a05.yaml                   |  2 +-
 .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  2 +-
 .../bindings/mfd/rohm,bd9576-pmic.yaml        |  4 +--
 .../bindings/mfd/stericsson,ab8500.yaml       | 16 ++++++------
 .../bindings/mfd/stericsson,db8500-prcmu.yaml |  2 +-
 .../devicetree/bindings/mmc/pxa-mmc.txt       |  2 +-
 .../devicetree/bindings/mmc/ti-omap-hsmmc.txt |  2 +-
 .../bindings/net/brcm,bcm7445-switch-v4.0.txt |  2 +-
 .../devicetree/bindings/net/can/cc770.txt     |  2 +-
 .../devicetree/bindings/net/dsa/brcm,sf2.yaml |  2 +-
 .../devicetree/bindings/net/ethernet-phy.yaml |  2 +-
 .../bindings/net/mediatek-dwmac.yaml          |  2 +-
 .../bindings/net/microchip,lan95xx.yaml       |  2 +-
 .../bindings/net/nfc/marvell,nci.yaml         |  4 +--
 .../devicetree/bindings/net/samsung-sxgbe.txt |  4 +--
 .../bindings/net/snps,dwc-qos-ethernet.txt    |  2 +-
 .../devicetree/bindings/net/sti-dwmac.txt     |  2 +-
 .../bindings/net/xilinx_gmii2rgmii.txt        |  2 +-
 .../devicetree/bindings/nios2/nios2.txt       |  2 +-
 .../nvmem/layouts/onie,tlv-layout.yaml        |  2 +-
 .../bindings/phy/phy-hisi-inno-usb2.txt       |  2 +-
 .../bindings/phy/pistachio-usb-phy.txt        |  2 +-
 .../bindings/phy/pxa1928-usb-phy.txt          |  2 +-
 .../bindings/phy/rockchip-inno-csi-dphy.yaml  |  2 +-
 .../bindings/phy/ti,phy-j721e-wiz.yaml        |  2 +-
 .../devicetree/bindings/phy/ti-phy.txt        |  2 +-
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  2 +-
 .../bindings/pinctrl/canaan,k210-fpioa.yaml   |  2 +-
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  2 +-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |  2 +-
 .../pinctrl/mediatek,mt7981-pinctrl.yaml      |  4 +--
 .../pinctrl/mediatek,mt7986-pinctrl.yaml      |  4 +--
 .../pinctrl/mediatek,mt8183-pinctrl.yaml      |  2 +-
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      |  2 +-
 .../bindings/pinctrl/pinctrl-max77620.txt     |  2 +-
 .../bindings/pinctrl/pinctrl-rk805.txt        |  2 +-
 .../bindings/pinctrl/sprd,pinctrl.txt         |  2 +-
 .../devicetree/bindings/pmem/pmem-region.txt  |  4 +--
 .../bindings/power/renesas,sysc-rmobile.yaml  |  2 +-
 .../power/supply/sbs,sbs-manager.yaml         |  2 +-
 .../devicetree/bindings/powerpc/fsl/cpus.txt  |  2 +-
 .../devicetree/bindings/powerpc/fsl/dcsr.txt  |  4 +--
 .../bindings/powerpc/fsl/raideng.txt          |  2 +-
 .../bindings/powerpc/nintendo/gamecube.txt    |  2 +-
 .../bindings/powerpc/nintendo/wii.txt         |  2 +-
 .../bindings/pwm/snps,dw-apb-timers-pwm2.yaml |  2 +-
 .../bindings/regulator/regulator-max77620.txt |  2 +-
 .../bindings/regulator/regulator.yaml         |  8 +++---
 .../regulator/richtek,rt5190a-regulator.yaml  |  2 +-
 .../devicetree/bindings/regulator/vctrl.txt   |  2 +-
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  2 +-
 .../bindings/reset/ti-syscon-reset.txt        |  2 +-
 .../devicetree/bindings/rng/omap_rng.yaml     |  4 +--
 .../devicetree/bindings/rtc/rtc-cmos.txt      |  2 +-
 .../bindings/serial/nvidia,tegra20-hsuart.txt |  2 +-
 .../devicetree/bindings/serial/st-asc.txt     |  2 +-
 .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml |  2 +-
 .../microchip,mpfs-sys-controller.yaml        |  2 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  2 +-
 .../bindings/sound/axentia,tse850-pcm5142.txt |  2 +-
 .../devicetree/bindings/sound/cs35l35.txt     |  2 +-
 .../devicetree/bindings/sound/cs35l36.txt     |  2 +-
 .../devicetree/bindings/sound/cs53l30.txt     |  2 +-
 .../devicetree/bindings/sound/fsl,esai.txt    |  2 +-
 .../bindings/sound/mediatek,mt8188-afe.yaml   |  2 +-
 .../bindings/sound/mt2701-afe-pcm.txt         |  2 +-
 .../bindings/sound/mt8195-afe-pcm.yaml        |  4 +--
 .../sound/qcom,msm8916-wcd-analog.txt         |  2 +-
 .../bindings/sound/renesas,rsnd.txt           |  2 +-
 .../sound/rockchip,rk3288-hdmi-analog.txt     |  2 +-
 .../devicetree/bindings/sound/rt5663.txt      |  2 +-
 .../bindings/sound/serial-midi.yaml           |  2 +-
 .../devicetree/bindings/sound/sprd-pcm.txt    |  2 +-
 .../bindings/sound/st,stm32-sai.yaml          |  2 +-
 .../sound/ti,j721e-cpb-ivi-audio.yaml         |  2 +-
 .../devicetree/bindings/sound/ti,tas2781.yaml |  2 +-
 .../bindings/sound/tlv320adcx140.yaml         |  2 +-
 .../bindings/soundwire/qcom,soundwire.yaml    |  4 +--
 .../bindings/spi/brcm,bcm2835-aux-spi.txt     |  4 +--
 .../bindings/spi/brcm,spi-bcm-qspi.yaml       |  4 +--
 .../devicetree/bindings/spi/omap-spi.yaml     |  2 +-
 .../thermal/nvidia,tegra124-soctherm.txt      |  2 +-
 .../bindings/timer/snps,arc-timer.txt         |  2 +-
 .../devicetree/bindings/trivial-devices.yaml  |  8 +++---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +-
 .../bindings/usb/fsl,imx8mp-dwc3.yaml         |  2 +-
 .../devicetree/bindings/usb/msm-hsusb.txt     |  2 +-
 .../bindings/usb/richtek,rt1719.yaml          |  2 +-
 .../fault-injection/fault-injection.rst       |  2 +-
 Documentation/fb/deferred_io.rst              |  2 +-
 Documentation/fb/sm712fb.rst                  |  2 +-
 Documentation/fb/sstfb.rst                    |  2 +-
 .../core/thread-info-in-task/arch-support.txt |  2 +-
 Documentation/filesystems/9p.rst              |  2 +-
 Documentation/filesystems/befs.rst            |  4 +--
 .../filesystems/caching/cachefiles.rst        |  2 +-
 .../filesystems/caching/netfs-api.rst         |  6 ++---
 Documentation/filesystems/configfs.rst        |  2 +-
 Documentation/filesystems/dax.rst             |  2 +-
 Documentation/filesystems/devpts.rst          |  4 +--
 Documentation/filesystems/ext4/super.rst      |  2 +-
 Documentation/filesystems/f2fs.rst            |  6 ++---
 Documentation/filesystems/gfs2-glocks.rst     |  2 +-
 Documentation/filesystems/idmappings.rst      | 14 +++++-----
 Documentation/filesystems/netfs_library.rst   |  2 +-
 .../filesystems/nfs/client-identifier.rst     |  2 +-
 Documentation/filesystems/nfs/rpc-cache.rst   |  2 +-
 .../filesystems/nfs/rpc-server-gss.rst        |  2 +-
 Documentation/filesystems/nilfs2.rst          |  2 +-
 Documentation/filesystems/ntfs3.rst           |  2 +-
 Documentation/filesystems/orangefs.rst        |  2 +-
 Documentation/filesystems/overlayfs.rst       |  4 +--
 Documentation/filesystems/porting.rst         |  6 ++---
 Documentation/filesystems/proc.rst            | 12 ++++-----
 Documentation/filesystems/qnx6.rst            |  2 +-
 Documentation/filesystems/seq_file.rst        |  4 +--
 .../filesystems/ubifs-authentication.rst      |  2 +-
 Documentation/filesystems/vfat.rst            |  2 +-
 Documentation/filesystems/vfs.rst             |  2 +-
 .../filesystems/xfs-online-fsck-design.rst    | 20 +++++++-------
 Documentation/filesystems/zonefs.rst          |  2 +-
 Documentation/firmware-guide/acpi/osi.rst     |  2 +-
 .../gpu/amdgpu/display/mpo-overview.rst       |  2 +-
 Documentation/gpu/drm-kms-helpers.rst         |  2 +-
 Documentation/gpu/drm-kms.rst                 |  6 ++---
 Documentation/gpu/drm-usage-stats.rst         |  4 +--
 Documentation/gpu/i915.rst                    |  4 +--
 Documentation/gpu/kms-properties.csv          |  2 +-
 Documentation/gpu/komeda-kms.rst              |  4 +--
 Documentation/gpu/msm-crash-dump.rst          |  2 +-
 Documentation/gpu/rfc/i915_scheduler.rst      |  2 +-
 Documentation/gpu/rfc/i915_vm_bind.rst        |  2 +-
 Documentation/gpu/todo.rst                    |  8 +++---
 Documentation/hwmon/pmbus-core.rst            |  2 +-
 .../input/devices/iforce-protocol.rst         |  2 +-
 Documentation/input/multi-touch-protocol.rst  |  2 +-
 .../livepatch/reliable-stacktrace.rst         |  2 +-
 Documentation/locking/lockdep-design.rst      |  4 +--
 Documentation/locking/locktorture.rst         |  2 +-
 Documentation/locking/locktypes.rst           |  2 +-
 Documentation/mm/hmm.rst                      |  2 +-
 Documentation/mm/hwpoison.rst                 |  2 +-
 Documentation/mm/page_migration.rst           |  2 +-
 Documentation/mm/unevictable-lru.rst          |  2 +-
 Documentation/mm/vmemmap_dedup.rst            |  2 +-
 Documentation/netlink/genetlink-c.yaml        |  2 +-
 Documentation/netlink/genetlink-legacy.yaml   |  2 +-
 Documentation/networking/bonding.rst          |  2 +-
 .../networking/devlink/devlink-port.rst       |  6 ++---
 Documentation/networking/packet_mmap.rst      |  2 +-
 Documentation/power/energy-model.rst          |  4 +--
 Documentation/powerpc/dscr.rst                |  2 +-
 Documentation/powerpc/kasan.txt               |  2 +-
 Documentation/powerpc/papr_hcalls.rst         |  2 +-
 Documentation/powerpc/qe_firmware.rst         |  4 +--
 Documentation/powerpc/vas-api.rst             |  4 +--
 Documentation/process/botching-up-ioctls.rst  |  2 +-
 Documentation/process/kernel-docs.rst         |  2 +-
 Documentation/riscv/hwprobe.rst               |  4 +--
 Documentation/riscv/vector.rst                |  2 +-
 Documentation/s390/vfio-ap.rst                |  2 +-
 Documentation/scheduler/sched-bwc.rst         |  2 +-
 Documentation/scheduler/sched-energy.rst      |  4 +--
 Documentation/scsi/ChangeLog.lpfc             |  2 +-
 Documentation/security/digsig.rst             |  2 +-
 Documentation/security/keys/core.rst          |  2 +-
 Documentation/security/secrets/coco.rst       |  2 +-
 Documentation/sphinx/cdomain.py               |  2 +-
 Documentation/spi/spi-lm70llp.rst             |  2 +-
 .../tools/rtla/rtla-timerlat-top.rst          |  2 +-
 .../coresight/coresight-etm4x-reference.rst   |  2 +-
 Documentation/trace/events.rst                |  6 ++---
 Documentation/trace/fprobe.rst                |  2 +-
 Documentation/trace/ftrace.rst                |  2 +-
 Documentation/trace/hwlat_detector.rst        |  2 +-
 .../trace/rv/da_monitor_synthesis.rst         |  2 +-
 Documentation/trace/rv/monitor_wwnr.rst       |  2 +-
 .../trace/rv/runtime-verification.rst         |  2 +-
 Documentation/trace/uprobetracer.rst          |  2 +-
 Documentation/trace/user_events.rst           |  2 +-
 Documentation/usb/gadget_uvc.rst              |  2 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst   |  2 +-
 .../userspace-api/media/v4l/metafmt-d4xx.rst  |  2 +-
 Documentation/userspace-api/netlink/intro.rst |  2 +-
 Documentation/virt/hyperv/clocks.rst          |  2 +-
 Documentation/virt/kvm/api.rst                | 26 +++++++++----------
 Documentation/virt/kvm/devices/vm.rst         |  2 +-
 Documentation/virt/kvm/devices/xive.rst       |  2 +-
 Documentation/virt/kvm/halt-polling.rst       |  2 +-
 Documentation/virt/kvm/x86/mmu.rst            |  2 +-
 .../virt/kvm/x86/running-nested-guests.rst    |  2 +-
 .../virt/uml/user_mode_linux_howto_v2.rst     |  2 +-
 Documentation/w1/slaves/w1_therm.rst          |  2 +-
 Documentation/w1/w1-generic.rst               |  2 +-
 Documentation/w1/w1-netlink.rst               |  2 +-
 .../watchdog/watchdog-kernel-api.rst          |  2 +-
 Documentation/wmi/devices/dell-wmi-ddv.rst    |  4 +--
 328 files changed, 441 insertions(+), 441 deletions(-)

-- 
2.34.1

