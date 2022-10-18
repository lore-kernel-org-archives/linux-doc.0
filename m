Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B3BC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 10:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiJRKFL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Oct 2022 06:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiJRKFK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 06:05:10 -0400
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E5D2D1D3
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
        t=1666087507; bh=Epjc4nQUBjTPNYhUz0WMHHVOwcv1I1npm3NnknB70+E=;
        h=From:To:Cc:Subject:Date:From;
        b=ceH+dSQcxT0Zxg//pcjNAZ957X+GI6kCIeMxVcFE27KVDFj1OCH6a7Xwj/pbv6dwD
         +6tdS0Qxqxm0nssr68RD5vrILxRjZK9AXzffNESxq1F8CPCBN1oFHf2oRcQLw8UPtZ
         6r7cTf9hTjX/BpjE8I1WUa89VBdaN4nNUN9qeVsY=
Received: from ld50.lan (unknown [101.88.135.226])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 70C04600A9;
        Tue, 18 Oct 2022 18:05:06 +0800 (CST)
From:   WANG Xuerui <kernel@xen0n.name>
To:     linux-doc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, loongarch@lists.linux.dev
Subject: [PATCH 0/2] LoongArch syscall ABI documentation
Date:   Tue, 18 Oct 2022 18:04:55 +0800
Message-Id: <20221018100457.3440691-1-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: WANG Xuerui <git@xen0n.name>

Hi,

Due to popular demand [1] (even Loongson employees can get lost), the
current LoongArch syscall ABI is now documented. A Simplified Chinese
translation is included too.

[1]: https://github.com/loongson/LoongArch-Documentation/issues/66

WANG Xuerui (2):
  Documentation: LoongArch: Document the syscall ABI
  docs/zh_CN: LoongArch: Translate the syscall ABI doc

 Documentation/loongarch/index.rst             |  1 +
 Documentation/loongarch/syscall-abi.rst       | 36 ++++++++++++++++++
 .../translations/zh_CN/loongarch/index.rst    |  1 +
 .../zh_CN/loongarch/syscall-abi.rst           | 37 +++++++++++++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 Documentation/loongarch/syscall-abi.rst
 create mode 100644 Documentation/translations/zh_CN/loongarch/syscall-abi.rst

-- 
2.38.0

