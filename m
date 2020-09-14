Return-Path: <SRS0=Qf3S=CX=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295EBC43461
	for <linux-doc@archiver.kernel.org>; Mon, 14 Sep 2020 12:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E82972245B
	for <linux-doc@archiver.kernel.org>; Mon, 14 Sep 2020 12:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgINMWu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Sep 2020 08:22:50 -0400
Received: from m17618.mail.qiye.163.com ([59.111.176.18]:46709 "EHLO
        m17618.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgINMVR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Sep 2020 08:21:17 -0400
X-Greylist: delayed 463 seconds by postgrey-1.27 at vger.kernel.org; Mon, 14 Sep 2020 08:20:15 EDT
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.226])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id AACCB4E1503;
        Mon, 14 Sep 2020 20:09:30 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wang Qing <wangqing@vivo.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] doc: zh_CN: add translatation for ext3.rst
Date:   Mon, 14 Sep 2020 20:08:32 +0800
Message-Id: <1600085362-2157-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGUIZQh1OTxhPHhkdVkpNS0tLQ05ITEpLSUpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6Sgw*PT8hDhc2ESg0TzEj
        CwwwCTRVSlVKTUtLS0NOSExKT05OVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlJTVlXWQgBWUFJSU9MNwY+
X-HM-Tid: 0a748c8528119376kuwsaaccb4e1503
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/filesystems/ext3.rst into Chinese.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 .../translations/zh_CN/filesystems/ext3.rst        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/translations/zh_CN/filesystems/ext3.rst b/Documentation/translations/zh_CN/filesystems/ext3.rst
index 0000000..38ac08b
--- /dev/null
+++ b/Documentation/translations/zh_CN/filesystems/ext3.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/filesystems/ext3.rst <ext3_index>`
+
+译者
+::
+
+	中文版维护者： 王擎 Wang Qing <wangqing@vivo.com>
+	中文版翻译者： 王擎 Wang Qing <wangqing@vivo.com>
+	中文版校译者： 王擎 Wang Qing <wangqing@vivo.com>
+
+- Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+
+===============
+Ext3 文件系统
+===============
+
+Ext3最初于1999年9月发布。由Stephen Tweedie撰写，由Peter Braam，Andreas Dilger，
+Andrew Morton，Alexander Viro，Ted Ts'o和Stephen Tweedie移植到2.2内核。
+
+Ext3在ext2文件系统基础上增强日记功能。该文件系统是ext4文件系统的子集，因此请
+使用ext4驱动访问ext3文件系统。
-- 
2.7.4

