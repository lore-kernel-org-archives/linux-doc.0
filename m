Return-Path: <SRS0=/7E3=6O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3043AC47256
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 16:20:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 087A320873
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588263602;
	bh=nUL4Ljjaa2gr/jys+Y/d89y09io9uYH337lahjpWfnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ASf+hUM9hVBQSU61HNZ8Wy+rJnhypyWjRKzv6b5qZ5NsWVKjTrvq4erZg9+q/7rZj
	 ytK5GfwBhmK676DN+zvfXPF4eGeQfG3nsetDMOlHxOcCD8szXMJOoNfaucfTZzbIff
	 1tyavzSUXcx//rHTyoWD1611u0oj+E8irSV+INKc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgD3QTl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Apr 2020 12:19:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726783AbgD3QSj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 30 Apr 2020 12:18:39 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32E482496D;
        Thu, 30 Apr 2020 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588263518;
        bh=nUL4Ljjaa2gr/jys+Y/d89y09io9uYH337lahjpWfnI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LvYYNu5T88QVNpjYQsjYaiBgaGNcR5+61osROpCPVmjAhuTjzAtT69rLDYzkD+v0E
         8rH6QUK/QfQFDeTkZum2waH96qSmS8zYdG5EpXjsTlRxVWTUCtGismVm7JC+tZuGwX
         SJatjSv8uYaPA9CdateJV4+BEjgbp1LuVtA6f/O4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jUBtU-00Axi6-F1; Thu, 30 Apr 2020 18:18:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v4 19/19] docs: misc-devices: add uacce to the index.rst
Date:   Thu, 30 Apr 2020 18:18:33 +0200
Message-Id: <fdf772548f644de87cccbc9a4c03bc22126a10a3.1588263270.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588263270.git.mchehab+huawei@kernel.org>
References: <cover.1588263270.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a ReST file already. It just needs to be inside the
building system in order to be part of the documentation body.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/misc-devices/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index a31c2ab8151f..46072ce3d7ef 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -27,4 +27,5 @@ fit into other categories.
    mic/index
    pci-endpoint-test
    spear-pcie-gadget
+   uacce
    xilinx_sdfec
-- 
2.25.4

