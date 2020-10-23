Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F23C5517A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDC6C22210
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470951;
	bh=neFczzbohvFiYnho7s9YJqA2elUOtzM90nxqf1FLG6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=lULzzDg5ONbQLMNFaFcspfAGKHVN5qHQyynQQ+lCWc68muNAQWopW4BPiyy6vCBqI
	 qUrKBFzKlDqddkb2nCR/JrgZb70QOu5YP2Ylb1IdwpT3RSMaMK+T6iXSo5mbSHVy91
	 MzieDsR85kK6eKALv99cir37d4aSrBfKjR7FlMEA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751867AbgJWQdu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:33:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:33228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750868AbgJWQds (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:48 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5790D2467B;
        Fri, 23 Oct 2020 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470827;
        bh=neFczzbohvFiYnho7s9YJqA2elUOtzM90nxqf1FLG6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BAgNp+MDLzDuEABOtE9ECajyHaVxQpA6beQWNymrv/oNodQJR78VH8gb1DnCmk86K
         xz2UsW8wwd5OIch7wC59Vfwvjz4z5RtFexi8GTlDHPn/UDxp5+uLB0+Qnz+HzR8qax
         6Qd5WRYv75IQw4jiQ9b8l8pAmH8pJ2ykniXet9OE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00f-002Aw3-Bh; Fri, 23 Oct 2020 18:33:45 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/56] mei: bus: fix a kernel-doc markup
Date:   Fri, 23 Oct 2020 18:33:03 +0200
Message-Id: <56b4cc6308fe6b6133b95c7d9116ed6fbaaabe9f.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A function has a different name between their prototype
and its kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/misc/mei/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 9cdaa7f3af23..04b904e3a56a 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -1037,7 +1037,7 @@ static struct mei_cl_device *mei_cl_bus_dev_alloc(struct mei_device *bus,
 }
 
 /**
- * mei_cl_dev_setup - setup me client device
+ * mei_cl_bus_dev_setup - setup me client device
  *    run fix up routines and set the device name
  *
  * @bus: mei device
-- 
2.26.2

