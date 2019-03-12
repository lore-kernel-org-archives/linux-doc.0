Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B59937DC63
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Mar 2019 03:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfCLDDq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Mar 2019 23:03:46 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:53919 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727024AbfCLDCN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Mar 2019 23:02:13 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R771e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04389;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0TMWLtVF_1552359730;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TMWLtVF_1552359730)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 12 Mar 2019 11:02:11 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     corbet@lwn.net, harryxiyou@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v4 22/31] mailmap: update Li Yang's email address
Date:   Tue, 12 Mar 2019 11:01:20 +0800
Message-Id: <20190312030129.47511-23-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190312030129.47511-1-alex.shi@linux.alibaba.com>
References: <20190312030129.47511-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the obsolete email address leoli@freescale.com and
leo@zh-kernel.org with leoyang.li@nxp.com.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Li Yang <leoyang.li@nxp.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index ea98fcc197e4..ca07112c8532 100644
--- a/.mailmap
+++ b/.mailmap
@@ -117,6 +117,8 @@ Leonid I Ananiev <leonid.i.ananiev@intel.com>
 Linas Vepstas <linas@austin.ibm.com>
 Linus Lüssing <linus.luessing@c0d3.blue> <linus.luessing@web.de>
 Linus Lüssing <linus.luessing@c0d3.blue> <linus.luessing@ascom.ch>
+Li Yang <leoyang.li@nxp.com> <leo@zh-kernel.org>
+Li Yang <leoyang.li@nxp.com> <leoli@freescale.com>
 Maciej W. Rozycki <macro@mips.com> <macro@imgtec.com>
 Marcin Nowakowski <marcin.nowakowski@mips.com> <marcin.nowakowski@imgtec.com>
 Mark Brown <broonie@sirena.org.uk>
-- 
2.19.1.856.g8858448bb

