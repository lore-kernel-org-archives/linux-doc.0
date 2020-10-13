Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14532C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF8B0222EB
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602591404;
	bh=hi1aczpcTujPkeB1XjLIT9pw1YvDNzWxbCRXWh+zmzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ACfGm47Tp8tnRpnlhRVUgjcqjQOEy27cLJ+tDbn65ZLuUE5Og7pbz4w3r5KTezT8S
	 KWdTU0QuqpLedJSziiiMT9xOb/F164Pk2YQ58P36CAYQUY/uFHSXCD4P/38QKxzzPj
	 1Ltx6rQJ4hkEZ+FwjD75JLCGpHI8f21HVXfdVKSg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgJMMO4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:14:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726832AbgJMMOz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 08:14:55 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F06DE22248;
        Tue, 13 Oct 2020 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602591295;
        bh=hi1aczpcTujPkeB1XjLIT9pw1YvDNzWxbCRXWh+zmzw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Raj9YxLe4jdAllcCxm0Y0vLP7xhTJbaUIGNFQiTvcFRchAkIByExUvohS4Ap7xwiB
         TmLhq+TY8gLOC/Don5cRUd/BaGlrHf2UsNlFa9bpNoyAtY9h5TUndHEdPfyg5ZmFDo
         VVa7P6AIJrtpMq16/bF4daTsQm6ra0cK83Rkj4og=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSJCe-006Cnz-Qa; Tue, 13 Oct 2020 14:14:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Luke Nelson <lukenels@cs.washington.edu>,
        Mahesh Bandewar <maheshb@google.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/24] docs: admin-guide: net.rst: add a missing blank line
Date:   Tue, 13 Oct 2020 14:14:32 +0200
Message-Id: <434c60fcbe895ba44b3beea886c7996bb20e7b50.1602590106.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There's a missing blank line after a literal block, which
causes this warning:

	Documentation/admin-guide/sysctl/net.rst:303: WARNING: Literal block ends without a blank line; unexpected unindent.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/sysctl/net.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index 57fd6ce68fe0..f2ab8a5b6a4b 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -300,6 +300,7 @@ Note:
       0:    0     1     2     3     4     5     6     7
   RSS hash key:
   84:50:f4:00:a8:15:d1:a7:e9:7f:1d:60:35:c7:47:25:42:97:74:ca:56:bb:b6:a1:d8:43:e3:c9:0c:fd:17:55:c2:3a:4d:69:ed:f1:42:89
+
 netdev_tstamp_prequeue
 ----------------------
 
-- 
2.26.2

