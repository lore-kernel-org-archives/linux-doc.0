Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A199C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 18 Nov 2022 18:52:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242269AbiKRSwE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Nov 2022 13:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242838AbiKRSvv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Nov 2022 13:51:51 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1F38FE64
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 10:51:42 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id 0EE8D1382;
        Fri, 18 Nov 2022 19:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1668797485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=betImScO1GhQ0JuM7C17Rd8Gr/O3/6aRG6Ij9CO1FLg=;
        b=IjlwvoqX3/zayXTq8N7wnScOL/BFbSspXv/y8cNFeCEihYkE4R9O0Z1AtTTCqK7jXCJMqG
        xDZVRhfPD+IXD6wFmmxIzGFKx8blGh5Fq7VfWY2xFXa/en7sI7GKhwHex7RqelC5zfC+Em
        sU7mW72DRWomXpCZVYlTiORC2nh2n56hgpMKFbcCjJqlFQIldZP9SOz2BBLL5tTrjEfWrF
        Bu7OiNKGY4PSipIVExu3UM7xyKHkfE7xHq9IO2mq9oMToH1SxI1MSKIT/YrHhOLamYWdv6
        +I1doAvDQcwRAe/5zZwVz8zlp4/Zzts2ExdQhX06XLQKxbPIt8jmL8Q1Uus2FA==
From:   Michael Walle <michael@walle.cc>
To:     Jonathan Corbet <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v3 00/18] nvmem: core: introduce NVMEM layouts
Date:   Fri, 18 Nov 2022 19:51:00 +0100
Message-Id: <20221118185118.1190044-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is now the third attempt to fetch the MAC addresses from the VPD
for the Kontron sl28 boards. Previous discussions can be found here:
https://lore.kernel.org/lkml/20211228142549.1275412-1-michael@walle.cc/


NVMEM cells are typically added by board code or by the devicetree. But
as the cells get more complex, there is (valid) push back from the
devicetree maintainers to not put that handling in the devicetree.

Therefore, introduce NVMEM layouts. They operate on the NVMEM device and
can add cells during runtime. That way it is possible to add more complex
cells than it is possible right now with the offset/length/bits
description in the device tree. For example, you can have post processing
for individual cells (think of endian swapping, or ethernet offset
handling).

The imx-ocotp driver is the only user of the global post processing hook,
convert it to nvmem layouts and drop the global post pocessing hook.

For now, the layouts are selected by the device tree. But the idea is
that also board files or other drivers could set a layout. Although no
code for that exists yet.

Thanks to Miquel, the device tree bindings are already approved and merged.

NVMEM layouts as modules?
While possible in principle, it doesn't make any sense because the NVMEM
core can't be compiled as a module. The layouts needs to be available at
probe time. (That is also the reason why they get registered with
subsys_initcall().) So if the NVMEM core would be a module, the layouts
could be modules, too.

Michael Walle (16):
  net: add helper eth_addr_add()
  of: base: add of_parse_phandle_with_optional_args()
  nvmem: core: fix device node refcounting
  nvmem: core: add an index parameter to the cell
  nvmem: core: move struct nvmem_cell_info to nvmem-provider.h
  nvmem: core: drop the removal of the cells in nvmem_add_cells()
  nvmem: core: add nvmem_add_one_cell()
  nvmem: core: use nvmem_add_one_cell() in nvmem_add_cells_from_of()
  nvmem: core: introduce NVMEM layouts
  nvmem: core: add per-cell post processing
  nvmem: core: allow to modify a cell before adding it
  nvmem: imx-ocotp: replace global post processing with layouts
  nvmem: cell: drop global cell_post_process
  nvmem: core: provide own priv pointer in post process callback
  nvmem: layouts: add sl28vpd layout
  MAINTAINERS: add myself as sl28vpd nvmem layout driver

Miquel Raynal (2):
  nvmem: layouts: Add ONIE tlv layout driver
  MAINTAINERS: Add myself as ONIE tlv NVMEM layout maintainer

 Documentation/driver-api/nvmem.rst |  15 ++
 MAINTAINERS                        |  12 ++
 drivers/nvmem/Kconfig              |   4 +
 drivers/nvmem/Makefile             |   1 +
 drivers/nvmem/core.c               | 281 ++++++++++++++++++++++-------
 drivers/nvmem/imx-ocotp.c          |  34 ++--
 drivers/nvmem/layouts/Kconfig      |  23 +++
 drivers/nvmem/layouts/Makefile     |   7 +
 drivers/nvmem/layouts/onie-tlv.c   | 249 +++++++++++++++++++++++++
 drivers/nvmem/layouts/sl28vpd.c    | 153 ++++++++++++++++
 include/linux/etherdevice.h        |  14 ++
 include/linux/nvmem-consumer.h     |  17 +-
 include/linux/nvmem-provider.h     |  95 +++++++++-
 include/linux/of.h                 |  25 +++
 14 files changed, 834 insertions(+), 96 deletions(-)
 create mode 100644 drivers/nvmem/layouts/Kconfig
 create mode 100644 drivers/nvmem/layouts/Makefile
 create mode 100644 drivers/nvmem/layouts/onie-tlv.c
 create mode 100644 drivers/nvmem/layouts/sl28vpd.c

-- 
2.30.2

