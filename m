Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F94C4742C
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 06:48:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58DAC2222E
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 06:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgKPGsA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 01:48:00 -0500
Received: from mail-m1271.qiye.163.com ([115.236.127.1]:27733 "EHLO
        mail-m1271.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgKPGsA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Nov 2020 01:48:00 -0500
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by mail-m1271.qiye.163.com (Hmail) with ESMTPA id 763F0583098;
        Mon, 16 Nov 2020 14:47:57 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wang Wenhu <wenhu.wang@vivo.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Chucheng Luo <luochucheng@vivo.com>,
        Wang Qing <wangqing@vivo.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH doc] doc: zh_CN: add tmpfs to index tree
Date:   Mon, 16 Nov 2020 14:47:50 +0800
Message-Id: <1605509272-13770-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZHkodQx9DH0lKT04dVkpNS05OS0JJTENLSk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxA6IRw5Sz8sTgooGB9MKUM5
        PgsKCRRVSlVKTUtOTktCSUxDT0pMVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFKQ01MNwY+
X-HM-Tid: 0a75cfcf68c298b6kuuu763f0583098
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add temfs to the index tree while adding tempfs translation.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 Documentation/translations/zh_CN/filesystems/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
index 186501d..9f2a8b0
--- a/Documentation/translations/zh_CN/filesystems/index.rst
+++ b/Documentation/translations/zh_CN/filesystems/index.rst
@@ -25,4 +25,5 @@ Linux Kernel中的文件系统
 
    virtiofs
    debugfs
+   tmpfs
 
-- 
2.7.4

