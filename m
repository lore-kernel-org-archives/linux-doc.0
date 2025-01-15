Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8E1DB138;
	Wed, 15 Jan 2025 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931254; cv=none; b=XROvJQOdBUIeF5E7Hf6tLVsFctJzT7AWDgqGUZgP8YW6jt5rDlgqMgBGObnVRfTQYA8JQt+aoE6ETV38eZNO9X/RvAMG30xWULbaBNzE8VOw3IYaV2nHflDczcHnjMcYR3fmtT4HTzz5e31jfHo8DByY03uOWCu5VZX6bch1tCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931254; c=relaxed/simple;
	bh=UV/F72owoitHKYB2gA5znqJnsyn7kbERx5K3N2HW3JU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mkhdhDXpkCoJRxhIqzEU0L/AATI3+Sp8horXHyaROBiuHaDxyhgAVyErN4XRazG9JjTAZzZzWqtyRG7Nem08cTScKRMAEVkp/4u4NkIk9HHNT11i9SK5vu9yBa9MOqSV0NJuZHjZE3sEHVXtLhGpTyv68Fq5b7aN+2ln6y07I64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaeeIEK9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaeeIEK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8890C4CEE1;
	Wed, 15 Jan 2025 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736931253;
	bh=UV/F72owoitHKYB2gA5znqJnsyn7kbERx5K3N2HW3JU=;
	h=From:To:Cc:Subject:Date:From;
	b=WaeeIEK9rs1ukX2+fYKbXPKUYRynqYZMErxEzfdUVWqoliZCEcfuMTFha++sCBoAd
	 2tqCEarab7YOR2zZuilIVhXWpSRl7FpY5wX+wBP1ytLUVzd0Q1Par/Jmxmy1dgeyQL
	 ihTD1szpvqr/a/+vwx9+aPpq92rmE0erc3CA3iY424+vhI/17Q69wgUh/dHOOPlEz+
	 wZnn1+W9TlG/SV3p4rqmfpa8zNnFyWWB88OTWmcIBcdjo79MyStGTODF8JqUjoUuI5
	 NUCjlQnrr6JM19I/Kb7Uo3uphHEzBKf6HCHAIyA0c2i6y8ls8ANs1AOOIdOm2eMYvN
	 RGQMbKzBiu50w==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 00/18] irqdomain: couple cleanups and documentation
Date: Wed, 15 Jan 2025 09:53:49 +0100
Message-ID: <20250115085409.1629787-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

while I was reading through the irqdomain code and headers, I found some
naming and documentation hard to follow or incomplete. Especially the
naming of _add/_create/_instantiate functions.

I tried to come up with a better state with this patchset. Despite I
believe the state is much better when the patchset is applied, I totally
do not insist on anything from the suggested.  Especially for new-comers
like I was some months ago. But of course, I might have missed something
behind the scenes, so comments welcome (and I am sure they come).

Finally, all the irqdomain stuff is now plugged (and generated) into
Documentation. So that everyone can walk through it at
https://www.kernel.org/doc/ (once applied, of course).

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>

Jiri Slaby (SUSE) (18):
  irqdomain.h: Remove extern from function declarations
  irqdomain: Rename irq_set_default_host() to irq_set_default_domain()
  irqdomain: Rename irq_get_default_host() to irq_get_default_domain()
  irqdomain.h: Stop using 'host' for domain
  irqdomain: Drop of_node_to_fwnode()
  irqdomain: Make a couple of functions an inline
  irqdomain: Make irq_domain_instantiate() returned domains an
    initializer
  irqdomain: Make struct irq_domain_info variables const
  irqdomain: Rename _add functions to _add_*_of_node
  irqdomain: Rename _create functions to _add_*_fwnode
  irqdomain: Rename _instantiate functions to _add
  irqdomain: Switch away from irq_linear_revmap() and drop it
  irqdomain.h: Improve kernel-docs of functions
  docs: irq/concepts: Add commas and reflow
  docs: irq/concepts: Minor improvements
  docs: irq-domain.rst: Simple improvements
  docs: irqdomain: Update
  irqdomain.c: Fix kernel-doc and add it to Documentation

 Documentation/core-api/genericirq.rst         |   2 -
 Documentation/core-api/irq/concepts.rst       |  27 +-
 Documentation/core-api/irq/irq-domain.rst     | 227 ++++++-----
 .../driver-api/driver-model/devres.rst        |   2 +-
 .../zh_CN/core-api/irq/irq-domain.rst         |  38 +-
 arch/arc/kernel/intc-arcv2.c                  |   4 +-
 arch/arc/kernel/intc-compact.c                |   4 +-
 arch/arc/kernel/mcip.c                        |   2 +-
 arch/arm/common/sa1111.c                      |   2 +-
 arch/arm/mach-exynos/suspend.c                |   2 +-
 arch/arm/mach-imx/avic.c                      |   2 +-
 arch/arm/mach-imx/gpc.c                       |   2 +-
 arch/arm/mach-imx/tzic.c                      |   2 +-
 arch/arm/mach-omap1/irq.c                     |   2 +-
 arch/arm/mach-omap2/omap-wakeupgen.c          |   2 +-
 arch/arm/mach-pxa/irq.c                       |   4 +-
 arch/arm/plat-orion/gpio.c                    |   2 +-
 arch/arm64/kvm/arch_timer.c                   |   2 +-
 arch/mips/ath25/ar2315.c                      |   2 +-
 arch/mips/ath25/ar5312.c                      |   2 +-
 arch/mips/cavium-octeon/octeon-irq.c          |  18 +-
 arch/mips/lantiq/irq.c                        |   2 +-
 arch/mips/pci/pci-ar2315.c                    |   2 +-
 arch/mips/pci/pci-rt3883.c                    |   2 +-
 arch/mips/pci/pci-xtalk-bridge.c              |   4 +-
 arch/mips/ralink/irq.c                        |   2 +-
 arch/mips/sgi-ip27/ip27-irq.c                 |   4 +-
 arch/mips/sgi-ip30/ip30-irq.c                 |   4 +-
 arch/nios2/kernel/irq.c                       |   4 +-
 arch/powerpc/kvm/book3s_hv.c                  |   2 +-
 arch/powerpc/kvm/book3s_xive.c                |   2 +-
 arch/powerpc/platforms/44x/uic.c              |   6 +-
 .../powerpc/platforms/512x/mpc5121_ads_cpld.c |   2 +-
 arch/powerpc/platforms/52xx/media5200.c       |   2 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c     |   6 +-
 arch/powerpc/platforms/52xx/mpc52xx_pic.c     |   6 +-
 .../platforms/85xx/socrates_fpga_pic.c        |   4 +-
 arch/powerpc/platforms/8xx/cpm1-ic.c          |   4 +-
 arch/powerpc/platforms/8xx/pic.c              |   4 +-
 arch/powerpc/platforms/amigaone/setup.c       |   2 +-
 arch/powerpc/platforms/cell/axon_msi.c        |   2 +-
 arch/powerpc/platforms/cell/interrupt.c       |   6 +-
 arch/powerpc/platforms/cell/spider-pic.c      |   2 +-
 arch/powerpc/platforms/chrp/setup.c           |   2 +-
 .../platforms/embedded6xx/flipper-pic.c       |   6 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c |   4 +-
 arch/powerpc/platforms/pasemi/setup.c         |   2 +-
 arch/powerpc/platforms/powermac/pic.c         |   6 +-
 arch/powerpc/platforms/powermac/smp.c         |   2 +-
 arch/powerpc/platforms/powernv/opal-irqchip.c |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c     |   6 +-
 arch/powerpc/platforms/ps3/interrupt.c        |   4 +-
 arch/powerpc/platforms/pseries/msi.c          |   6 +-
 arch/powerpc/sysdev/cpm2_pic.c                |   4 +-
 arch/powerpc/sysdev/ehv_pic.c                 |   6 +-
 arch/powerpc/sysdev/fsl_msi.c                 |   2 +-
 arch/powerpc/sysdev/ge/ge_pic.c               |   4 +-
 arch/powerpc/sysdev/i8259.c                   |   2 +-
 arch/powerpc/sysdev/ipic.c                    |   6 +-
 arch/powerpc/sysdev/mpic.c                    |   8 +-
 arch/powerpc/sysdev/tsi108_pci.c              |   2 +-
 arch/powerpc/sysdev/xics/xics-common.c        |   4 +-
 arch/powerpc/sysdev/xive/common.c             |   6 +-
 arch/sh/boards/mach-se/7343/irq.c             |   4 +-
 arch/sh/boards/mach-se/7722/irq.c             |   4 +-
 arch/sh/boards/mach-x3proto/gpio.c            |   2 +-
 arch/um/drivers/virt-pci.c                    |   2 +-
 arch/x86/kernel/apic/io_apic.c                |   4 +-
 arch/x86/kernel/apic/vector.c                 |   4 +-
 arch/x86/platform/uv/uv_irq.c                 |   2 +-
 drivers/acpi/irq.c                            |   2 +-
 drivers/base/regmap/regmap-irq.c              |   2 +-
 drivers/bus/moxtet.c                          |   2 +-
 drivers/cdx/cdx_msi.c                         |   4 +-
 drivers/edac/altera_edac.c                    |   2 +-
 drivers/gpio/gpio-bcm-kona.c                  |   2 +-
 drivers/gpio/gpio-brcmstb.c                   |   2 +-
 drivers/gpio/gpio-davinci.c                   |   2 +-
 drivers/gpio/gpio-em.c                        |   2 +-
 drivers/gpio/gpio-grgpio.c                    |   2 +-
 drivers/gpio/gpio-idt3243x.c                  |   2 +-
 drivers/gpio/gpio-lpc18xx.c                   |   2 +-
 drivers/gpio/gpio-mockup.c                    |   2 +-
 drivers/gpio/gpio-mpc8xxx.c                   |   2 +-
 drivers/gpio/gpio-mvebu.c                     |   2 +-
 drivers/gpio/gpio-mxc.c                       |   2 +-
 drivers/gpio/gpio-mxs.c                       |   2 +-
 drivers/gpio/gpio-pxa.c                       |   2 +-
 drivers/gpio/gpio-rockchip.c                  |   2 +-
 drivers/gpio/gpio-sa1100.c                    |   2 +-
 drivers/gpio/gpio-sim.c                       |   2 +-
 drivers/gpio/gpio-sodaville.c                 |   2 +-
 drivers/gpio/gpio-tb10x.c                     |   2 +-
 drivers/gpio/gpio-twl4030.c                   |   2 +-
 drivers/gpio/gpio-uniphier.c                  |   2 +-
 drivers/gpio/gpio-xgene-sb.c                  |   2 +-
 drivers/gpio/gpiolib.c                        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c                |   2 +-
 drivers/gpu/ipu-v3/ipu-common.c               |   6 +-
 drivers/hid/hid-rmi.c                         |   2 +-
 drivers/i2c/busses/i2c-cht-wc.c               |   2 +-
 drivers/i2c/i2c-core-base.c                   |   2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           |   4 +-
 drivers/iio/adc/stm32-adc-core.c              |   2 +-
 drivers/iio/dummy/iio_dummy_evgen.c           |   2 +-
 drivers/input/rmi4/rmi_driver.c               |   2 +-
 drivers/iommu/amd/init.c                      |   2 +-
 drivers/iommu/amd/iommu.c                     |   2 +-
 drivers/iommu/hyperv-iommu.c                  |   2 +-
 drivers/iommu/intel/irq_remapping.c           |   2 +-
 drivers/irqchip/exynos-combiner.c             |   2 +-
 drivers/irqchip/irq-al-fic.c                  |   2 +-
 drivers/irqchip/irq-alpine-msi.c              |   4 +-
 drivers/irqchip/irq-apple-aic.c               |   4 +-
 drivers/irqchip/irq-armada-370-xp.c           |  18 +-
 drivers/irqchip/irq-aspeed-i2c-ic.c           |   2 +-
 drivers/irqchip/irq-aspeed-intc.c             |   2 +-
 drivers/irqchip/irq-aspeed-scu-ic.c           |   2 +-
 drivers/irqchip/irq-aspeed-vic.c              |   2 +-
 drivers/irqchip/irq-ath79-misc.c              |   4 +-
 drivers/irqchip/irq-atmel-aic-common.c        |   2 +-
 drivers/irqchip/irq-bcm2835.c                 |   2 +-
 drivers/irqchip/irq-bcm2836.c                 |   4 +-
 drivers/irqchip/irq-bcm6345-l1.c              |   2 +-
 drivers/irqchip/irq-bcm7038-l1.c              |   2 +-
 drivers/irqchip/irq-bcm7120-l2.c              |   2 +-
 drivers/irqchip/irq-brcmstb-l2.c              |   2 +-
 drivers/irqchip/irq-clps711x.c                |   4 +-
 drivers/irqchip/irq-crossbar.c                |   2 +-
 drivers/irqchip/irq-csky-apb-intc.c           |   2 +-
 drivers/irqchip/irq-csky-mpintc.c             |   2 +-
 drivers/irqchip/irq-davinci-cp-intc.c         |   2 +-
 drivers/irqchip/irq-digicolor.c               |   2 +-
 drivers/irqchip/irq-dw-apb-ictl.c             |   2 +-
 drivers/irqchip/irq-ftintc010.c               |   2 +-
 drivers/irqchip/irq-gic-v2m.c                 |   2 +-
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c   |   2 +-
 drivers/irqchip/irq-gic-v3-its.c              |   2 +-
 drivers/irqchip/irq-gic-v3-mbi.c              |   2 +-
 drivers/irqchip/irq-gic-v3.c                  |   6 +-
 drivers/irqchip/irq-gic-v4.c                  |   4 +-
 drivers/irqchip/irq-gic.c                     |   2 +-
 drivers/irqchip/irq-goldfish-pic.c            |   2 +-
 drivers/irqchip/irq-hip04.c                   |   2 +-
 drivers/irqchip/irq-i8259.c                   |   2 +-
 drivers/irqchip/irq-idt3243x.c                |   2 +-
 drivers/irqchip/irq-imgpdc.c                  |   2 +-
 drivers/irqchip/irq-imx-gpcv2.c               |   4 +-
 drivers/irqchip/irq-imx-intmux.c              |   2 +-
 drivers/irqchip/irq-imx-irqsteer.c            |   2 +-
 drivers/irqchip/irq-imx-mu-msi.c              |   2 +-
 drivers/irqchip/irq-ingenic-tcu.c             |   2 +-
 drivers/irqchip/irq-ingenic.c                 |   2 +-
 drivers/irqchip/irq-ixp4xx.c                  |   4 +-
 drivers/irqchip/irq-jcore-aic.c               |   2 +-
 drivers/irqchip/irq-keystone.c                |   2 +-
 drivers/irqchip/irq-lan966x-oic.c             |   4 +-
 drivers/irqchip/irq-loongarch-avec.c          |   2 +-
 drivers/irqchip/irq-loongarch-cpu.c           |   6 +-
 drivers/irqchip/irq-loongson-eiointc.c        |   4 +-
 drivers/irqchip/irq-loongson-htvec.c          |   4 +-
 drivers/irqchip/irq-loongson-liointc.c        |   6 +-
 drivers/irqchip/irq-loongson-pch-lpc.c        |   2 +-
 drivers/irqchip/irq-loongson-pch-msi.c        |   4 +-
 drivers/irqchip/irq-loongson-pch-pic.c        |   4 +-
 drivers/irqchip/irq-lpc32xx.c                 |   2 +-
 drivers/irqchip/irq-ls-extirq.c               |   2 +-
 drivers/irqchip/irq-ls-scfg-msi.c             |   4 +-
 drivers/irqchip/irq-ls1x.c                    |   2 +-
 drivers/irqchip/irq-mchp-eic.c                |   2 +-
 drivers/irqchip/irq-meson-gpio.c              |   4 +-
 drivers/irqchip/irq-mips-cpu.c                |   4 +-
 drivers/irqchip/irq-mips-gic.c                |   4 +-
 drivers/irqchip/irq-mmp.c                     |   4 +-
 drivers/irqchip/irq-mscc-ocelot.c             |   2 +-
 drivers/irqchip/irq-mst-intc.c                |   2 +-
 drivers/irqchip/irq-mtk-cirq.c                |   2 +-
 drivers/irqchip/irq-mtk-sysirq.c              |   2 +-
 drivers/irqchip/irq-mvebu-gicp.c              |   4 +-
 drivers/irqchip/irq-mvebu-odmi.c              |   4 +-
 drivers/irqchip/irq-mvebu-pic.c               |   2 +-
 drivers/irqchip/irq-mvebu-sei.c               |  10 +-
 drivers/irqchip/irq-mxs.c                     |   2 +-
 drivers/irqchip/irq-nvic.c                    |   2 +-
 drivers/irqchip/irq-omap-intc.c               |   4 +-
 drivers/irqchip/irq-or1k-pic.c                |   2 +-
 drivers/irqchip/irq-orion.c                   |   4 +-
 drivers/irqchip/irq-owl-sirq.c                |   2 +-
 drivers/irqchip/irq-partition-percpu.c        |   2 +-
 drivers/irqchip/irq-pic32-evic.c              |   4 +-
 drivers/irqchip/irq-pruss-intc.c              |   2 +-
 drivers/irqchip/irq-qcom-mpm.c                |   4 +-
 drivers/irqchip/irq-rda-intc.c                |   2 +-
 drivers/irqchip/irq-realtek-rtl.c             |   2 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c     |   2 +-
 drivers/irqchip/irq-renesas-irqc.c            |   2 +-
 drivers/irqchip/irq-renesas-rza1.c            |   2 +-
 drivers/irqchip/irq-renesas-rzg2l.c           |   2 +-
 drivers/irqchip/irq-renesas-rzv2h.c           |   2 +-
 drivers/irqchip/irq-riscv-aplic-direct.c      |   2 +-
 drivers/irqchip/irq-riscv-imsic-platform.c    |   2 +-
 drivers/irqchip/irq-riscv-intc.c              |   4 +-
 drivers/irqchip/irq-sa11x0.c                  |   2 +-
 drivers/irqchip/irq-sifive-plic.c             |   2 +-
 drivers/irqchip/irq-sni-exiu.c                |   4 +-
 drivers/irqchip/irq-sp7021-intc.c             |   2 +-
 drivers/irqchip/irq-starfive-jh8100-intc.c    |   2 +-
 drivers/irqchip/irq-stm32-exti.c              |   2 +-
 drivers/irqchip/irq-stm32mp-exti.c            |   4 +-
 drivers/irqchip/irq-sun4i.c                   |   2 +-
 drivers/irqchip/irq-sun6i-r.c                 |   2 +-
 drivers/irqchip/irq-sunxi-nmi.c               |   2 +-
 drivers/irqchip/irq-tb10x.c                   |   2 +-
 drivers/irqchip/irq-tegra.c                   |   2 +-
 drivers/irqchip/irq-ti-sci-inta.c             |   6 +-
 drivers/irqchip/irq-ti-sci-intr.c             |   4 +-
 drivers/irqchip/irq-ts4800.c                  |   2 +-
 drivers/irqchip/irq-uniphier-aidet.c          |   4 +-
 drivers/irqchip/irq-versatile-fpga.c          |   2 +-
 drivers/irqchip/irq-vf610-mscm-ir.c           |   2 +-
 drivers/irqchip/irq-vic.c                     |   2 +-
 drivers/irqchip/irq-vt8500.c                  |   2 +-
 drivers/irqchip/irq-wpcm450-aic.c             |   2 +-
 drivers/irqchip/irq-xilinx-intc.c             |   4 +-
 drivers/irqchip/irq-xtensa-mx.c               |   6 +-
 drivers/irqchip/irq-xtensa-pic.c              |   8 +-
 drivers/irqchip/irq-zevio.c                   |   2 +-
 drivers/irqchip/qcom-irq-combiner.c           |   4 +-
 drivers/irqchip/qcom-pdc.c                    |   2 +-
 drivers/irqchip/spear-shirq.c                 |   2 +-
 drivers/mailbox/qcom-ipcc.c                   |   2 +-
 drivers/memory/omap-gpmc.c                    |   2 +-
 drivers/mfd/88pm860x-core.c                   |   2 +-
 drivers/mfd/ab8500-core.c                     |   2 +-
 drivers/mfd/arizona-irq.c                     |   2 +-
 drivers/mfd/db8500-prcmu.c                    |   2 +-
 drivers/mfd/fsl-imx25-tsadc.c                 |   2 +-
 drivers/mfd/ioc3.c                            |   2 +-
 drivers/mfd/lp8788-irq.c                      |   2 +-
 drivers/mfd/max8925-core.c                    |   2 +-
 drivers/mfd/max8997-irq.c                     |   2 +-
 drivers/mfd/max8998-irq.c                     |   2 +-
 drivers/mfd/mt6358-irq.c                      |   2 +-
 drivers/mfd/mt6397-irq.c                      |   2 +-
 drivers/mfd/qcom-pm8xxx.c                     |   2 +-
 drivers/mfd/stmfx.c                           |   2 +-
 drivers/mfd/stmpe.c                           |   2 +-
 drivers/mfd/tc3589x.c                         |   2 +-
 drivers/mfd/tps65217.c                        |   2 +-
 drivers/mfd/tps6586x.c                        |   2 +-
 drivers/mfd/twl4030-irq.c                     |   2 +-
 drivers/mfd/twl6030-irq.c                     |   2 +-
 drivers/mfd/wm831x-irq.c                      |   4 +-
 drivers/mfd/wm8994-irq.c                      |   2 +-
 drivers/misc/hi6421v600-irq.c                 |   2 +-
 drivers/misc/lan966x_pci.c                    |   2 +-
 drivers/net/dsa/microchip/ksz_common.c        |   2 +-
 drivers/net/dsa/microchip/ksz_ptp.c           |   2 +-
 drivers/net/dsa/mt7530.c                      |   4 +-
 drivers/net/dsa/mv88e6xxx/chip.c              |   2 +-
 drivers/net/dsa/mv88e6xxx/global2.c           |   2 +-
 drivers/net/dsa/qca/ar9331.c                  |   2 +-
 drivers/net/dsa/realtek/rtl8365mb.c           |   2 +-
 drivers/net/dsa/realtek/rtl8366rb.c           |   2 +-
 .../net/ethernet/wangxun/txgbe/txgbe_irq.c    |   2 +-
 drivers/net/usb/lan78xx.c                     |   2 +-
 drivers/net/usb/smsc95xx.c                    |   2 +-
 drivers/pci/controller/dwc/pci-dra7xx.c       |   2 +-
 drivers/pci/controller/dwc/pci-keystone.c     |   2 +-
 .../pci/controller/dwc/pcie-designware-host.c |   4 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   2 +-
 drivers/pci/controller/dwc/pcie-uniphier.c    |   2 +-
 .../controller/mobiveil/pcie-mobiveil-host.c  |   6 +-
 drivers/pci/controller/pci-aardvark.c         |   6 +-
 drivers/pci/controller/pci-ftpci100.c         |   2 +-
 drivers/pci/controller/pci-mvebu.c            |   2 +-
 drivers/pci/controller/pci-tegra.c            |   2 +-
 drivers/pci/controller/pci-xgene-msi.c        |   4 +-
 drivers/pci/controller/pcie-altera-msi.c      |   4 +-
 drivers/pci/controller/pcie-altera.c          |   2 +-
 drivers/pci/controller/pcie-apple.c           |   4 +-
 drivers/pci/controller/pcie-brcmstb.c         |   4 +-
 drivers/pci/controller/pcie-iproc-msi.c       |   4 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   |   4 +-
 drivers/pci/controller/pcie-mediatek.c        |   6 +-
 drivers/pci/controller/pcie-rcar-host.c       |   2 +-
 drivers/pci/controller/pcie-rockchip-host.c   |   2 +-
 drivers/pci/controller/pcie-xilinx-cpm.c      |   4 +-
 drivers/pci/controller/pcie-xilinx-dma-pl.c   |   8 +-
 drivers/pci/controller/pcie-xilinx-nwl.c      |   6 +-
 drivers/pci/controller/pcie-xilinx.c          |   4 +-
 drivers/pci/controller/plda/pcie-plda-host.c  |   8 +-
 drivers/pinctrl/mediatek/mtk-eint.c           |   2 +-
 drivers/pinctrl/pinctrl-at91-pio4.c           |   2 +-
 drivers/pinctrl/pinctrl-keembay.c             |   2 +-
 drivers/pinctrl/pinctrl-single.c              |   4 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   4 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c     |   4 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |   2 +-
 drivers/platform/x86/asus-tf103c-dock.c       |   2 +-
 .../platform/x86/intel/crystal_cove_charger.c |   2 +-
 drivers/remoteproc/pru_rproc.c                |   2 +-
 drivers/sh/intc/irqdomain.c                   |   4 +-
 drivers/soc/dove/pmu.c                        |   2 +-
 drivers/soc/fsl/qe/qe_ic.c                    |   6 +-
 drivers/soc/qcom/smp2p.c                      |   2 +-
 drivers/soc/qcom/smsm.c                       |   2 +-
 drivers/soc/tegra/pmc.c                       |   2 +-
 drivers/soundwire/irq.c                       |   2 +-
 drivers/spmi/spmi-pmic-arb.c                  |   2 +-
 drivers/ssb/driver_gpio.c                     |   4 +-
 drivers/thermal/qcom/lmh.c                    |   2 +-
 drivers/thermal/tegra/soctherm.c              |   2 +-
 include/linux/gpio/driver.h                   |   2 +-
 include/linux/irq_sim.h                       |   8 +-
 include/linux/irqdomain.h                     | 362 +++++++++++-------
 kernel/irq/devres.c                           |   8 +-
 kernel/irq/ipi-mux.c                          |   2 +-
 kernel/irq/irq_sim.c                          |  28 +-
 kernel/irq/irqdomain.c                        | 114 ++----
 kernel/irq/msi.c                              |   2 +-
 sound/soc/codecs/rt5677.c                     |   2 +-
 sound/soc/codecs/wcd937x.c                    |   2 +-
 sound/soc/codecs/wcd938x.c                    |   2 +-
 sound/soc/codecs/wcd939x.c                    |   2 +-
 327 files changed, 896 insertions(+), 844 deletions(-)

-- 
2.48.0

