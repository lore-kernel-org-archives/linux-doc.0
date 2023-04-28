Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A04C77B61
	for <linux-doc@archiver.kernel.org>; Fri, 28 Apr 2023 09:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjD1JLg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Apr 2023 05:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjD1JLe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Apr 2023 05:11:34 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 28 Apr 2023 02:11:29 PDT
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B071E2D67;
        Fri, 28 Apr 2023 02:11:29 -0700 (PDT)
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id YFN00120;
        Fri, 28 Apr 2023 17:10:20 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201619.home.langchao.com (10.100.2.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:10:21 +0800
From:   Deming Wang <wangdeming@inspur.com>
To:     <corbet@lwn.net>, <fujimotokosuke0@gmail.com>,
        <shibata@linuxfoundation.org>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Deming Wang <wangdeming@inspur.com>
Subject: [PATCH] Documentation/translations/ja_JP/SubmittingPatches: fix some typos
Date:   Fri, 28 Apr 2023 05:10:18 -0400
Message-ID: <20230428091018.1558-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.200.104.82]
X-ClientProxiedBy: Jtjnmail201617.home.langchao.com (10.100.2.17) To
 jtjnmail201619.home.langchao.com (10.100.2.19)
tUid:   20234281710205c6d46daffd72b31717b16de9d57a623
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix of  typos spotted reading documentation in Japanese.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 Documentation/translations/ja_JP/SubmittingPatches | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/ja_JP/SubmittingPatches b/Documentation/translations/ja_JP/SubmittingPatches
index 04deb77b20c6..5334db471744 100644
--- a/Documentation/translations/ja_JP/SubmittingPatches
+++ b/Documentation/translations/ja_JP/SubmittingPatches
@@ -450,7 +450,7 @@ Reviewed-by: タグは、それとは異なり、下記のレビューア宣言
             状況においてその宣言した目的や機能が正しく実現することに関して、
             いかなる保証もしない(特にどこかで明示しない限り)。
 
-Reviewd-by タグはそのパッチがカーネルに対して適切な修正であって、深刻な技術的
+Reviewed-by タグはそのパッチがカーネルに対して適切な修正であって、深刻な技術的
 問題を残していないという意見の宣言です。興味のあるレビューアは誰でも(レビュー
 作業を終えたら)パッチに対して Reviewed-by タグを提示できます。このタグは
 レビューアの寄与をクレジットする働き、レビューの進捗の度合いをメンテナに
-- 
2.27.0

