Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A77C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 08:32:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5509360E09
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 08:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbhEFIdV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 04:33:21 -0400
Received: from mail-m176216.qiye.163.com ([59.111.176.216]:39172 "EHLO
        mail-m176216.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbhEFIdV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 04:33:21 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m176216.qiye.163.com (Hmail) with ESMTPA id DD0E6C20147;
        Thu,  6 May 2021 16:32:18 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] docs/zh_CN: make reporting-bugs.rst obsolete
Date:   Thu,  6 May 2021 16:32:07 +0800
Message-Id: <20210506083207.15705-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGkxDQlYfH0pLSE4YTB1LTE1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OlE6Dhw*CD8LNEIzEhIiHhMs
        MRAaCjxVSlVKTUlLSUNCQkhCTEpLVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFJTkJINwY+
X-HM-Tid: 0a7940ce6684d976kuwsdd0e6c20147
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In commit d2ce285378b09 ("docs: make reporting-issues.rst official
and delete reporting-bugs.rst"),reporting-bugs.rst was deleted and
replaced by reporting-issues.rst.

In commit da514157c4f06 ("docs: make reporting-bugs.rst obsolete"),
it made reporting-bugs.rst obsolete in docs.

Fix it in docs/zh_CN to make reporting-bugs.rst obsolete.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 Documentation/translations/zh_CN/SecurityBugs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/SecurityBugs b/Documentation/translations/zh_CN/SecurityBugs
index 2d0fffd122ce..adf4042ba7f8 100644
--- a/Documentation/translations/zh_CN/SecurityBugs
+++ b/Documentation/translations/zh_CN/SecurityBugs
@@ -31,9 +31,9 @@ linux内核安全团队可以通过email<security@kernel.org>来联系。这是
 一组独立的安全工作人员，可以帮助改善漏洞报告并且公布和取消一个修复。安
 全团队有可能会从部分的维护者那里引进额外的帮助来了解并且修复安全漏洞。
 当遇到任何漏洞，所能提供的信息越多就越能诊断和修复。如果你不清楚什么
-是有帮助的信息，那就请重温一下admin-guide/reporting-bugs.rst文件中的概述过程。任
-何攻击性的代码都是非常有用的，未经报告者的同意不会被取消，除非它已经
-被公布于众。
+是有帮助的信息，那就请重温一下admin-guide/reporting-issues.rst文件中的
+概述过程。任何攻击性的代码都是非常有用的，未经报告者的同意不会被取消，
+除非它已经被公布于众。
 
 2) 公开
 
-- 
2.25.1

