Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EB5C0015E
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 09:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbjGJJja (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 05:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbjGJJjD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 05:39:03 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DC010D8;
        Mon, 10 Jul 2023 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981807; x=1720517807;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9rB6ZsE5tPURsFe8y5ewohv7eTrARShb30ruo1UoOps=;
  b=XkS0vtoRno4p59RD/ecud2kUyt1riYYmLeXjd5e41x02HW4SY9y8dJq/
   L6BrQpEKsULVOOcIwdxWmJpRoonRP1DEbPpv0zg6yzmtZzHy58/zHW1Io
   lP6TLC0IGesbAmtl7qAf67pmYZYwrFN9QKwQ6BzvkEUMBMWYVrRZxj0gK
   myMxtqu5lhwPEnnovlDZdBysYzfN7njp/mAZ22fh0rIBD9WYtH0KtANEm
   D4qMDoE/wT9HxssNcyVfy1jSIx0T4KzLzTMT5yw5XWX20lLgyV2DqbIcc
   jT6TdIsjbuZZnuhnxpSnu/NV1KBSVPO79sfp8jwF/5um7ej0ceqqjRVNJ
   w==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="234573261"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:36:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:27 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:25 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <palmer@dabbelt.com>
CC:     <conor@kernel.org>, <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Andrew Jones <ajones@ventanamicro.com>,
        "Heiko Stuebner" <heiko.stuebner@vrull.eu>,
        Evan Green <evan@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 00/11] RISC-V: Probe DT extension support using riscv,isa-extensions & riscv,isa-base
Date:   Mon, 10 Jul 2023 10:35:35 +0100
Message-ID: <20230710-equipment-stained-dd042d66ba5d@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2986; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9rB6ZsE5tPURsFe8y5ewohv7eTrARShb30ruo1UoOps=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL1zlWb+3V/50SaXq/huKDB8Usyvkp3i5qi+/ymG78oX6 +kznjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExksTrD/9g/CvNNd37zqYub35Tscv q/+UyjYycbXKeFe12v8tJRKmP4X7g5fOnFvbsNO3Sv6r3b9b3xymKnbpFIO4/QGevP5eRsYgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hey,

Based on my latest iteration of deprecating riscv,isa [1], here's an
implementation of the new properties for Linux. The first few patches,
up to "RISC-V: split riscv_fill_hwcap() in 3", are all prep work that
further tames some of the extension related code, on top of my already
applied series that cleans up the ISA string parser.
Perhaps "RISC-V: shunt isa_ext_arr to cpufeature.c" is a bit gratuitous,
but I figured a bit of coalescing of extension related data structures
would be a good idea. Note that riscv,isa will still be used in the
absence of the new properties. Palmer suggested adding a Kconfig option
to turn off the fallback for DT, which I have gone and done. It's locked
behind the NONPORTABLE option for good reason.

In v2, I've also come up with a more reasonable name for the new
function I added & fixed up various comments from Drew and Evan.

In v3, there's the new commandline option that Drew suggested. I have
Also picked up a patch from Palmer that adds more helpful prints where
harts fail the checks in riscv_early_of_processor_id(), and I've
sprinkled a few more of those prints in my new additions to the
function.

v4 just rebases on v6.5-rc1 and fixes the nommu build issue due to a
missing __init.

Cheers,
Conor.

[1] (it's in v6.5-rc1 now)

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Heiko Stuebner <heiko.stuebner@vrull.eu>
CC: Evan Green <evan@rivosinc.com>
CC: Sunil V L <sunilvl@ventanamicro.com>
CC: linux-doc@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (9):
  RISC-V: drop a needless check in print_isa_ext()
  RISC-V: shunt isa_ext_arr to cpufeature.c
  RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
  RISC-V: add missing single letter extension definitions
  RISC-V: add single letter extensions to riscv_isa_ext
  RISC-V: split riscv_fill_hwcap() in 3
  RISC-V: enable extension detection from new properties
  RISC-V: try new extension properties in of_early_processor_hartid()
  RISC-V: provide Kconfig & commandline options to control parsing
    "riscv,isa"

Heiko Stuebner (1):
  RISC-V: don't parse dt/acpi isa string to get rv32/rv64

Palmer Dabbelt (1):
  RISC-V: Provide a more helpful error message on invalid ISA strings

 .../admin-guide/kernel-parameters.txt         |   7 +
 arch/riscv/Kconfig                            |  18 +
 arch/riscv/include/asm/hwcap.h                |  17 +-
 arch/riscv/kernel/cpu.c                       | 179 +++---
 arch/riscv/kernel/cpufeature.c                | 519 ++++++++++++------
 5 files changed, 437 insertions(+), 303 deletions(-)

-- 
2.40.1

