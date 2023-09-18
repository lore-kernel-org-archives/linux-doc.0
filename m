Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACF4CD37B4
	for <linux-doc@archiver.kernel.org>; Mon, 18 Sep 2023 03:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239556AbjIRDPG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 17 Sep 2023 23:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239215AbjIRDOm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Sep 2023 23:14:42 -0400
X-Greylist: delayed 65 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 17 Sep 2023 20:14:21 PDT
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F75129;
        Sun, 17 Sep 2023 20:14:20 -0700 (PDT)
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id NCF00111;
        Mon, 18 Sep 2023 11:13:11 +0800
Received: from localhost.localdomain.com (10.73.42.143) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server id
 15.1.2507.32; Mon, 18 Sep 2023 11:13:11 +0800
From:   Charles Han <hanchunchao@inspur.com>
To:     <dave@stgolabs.net>, <paulmck@kernel.org>, <josh@joshtriplett.org>,
        <corbet@lwn.net>
CC:     <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] Documentation: RCU: Remove repeated word in comments
Date:   Mon, 18 Sep 2023 11:13:09 +0800
Message-ID: <20230918031309.142170-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.73.42.143]
tUid:   2023918111311a8c6fb8e0ab35c7a4292873417f89671
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove the repeated word "of" in comments.

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 Documentation/RCU/torture.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/torture.rst b/Documentation/RCU/torture.rst
index b3b6dfa85248..49e7beea6ae1 100644
--- a/Documentation/RCU/torture.rst
+++ b/Documentation/RCU/torture.rst
@@ -185,7 +185,7 @@ argument.
 Not all changes require that all scenarios be run.  For example, a change
 to Tree SRCU might run only the SRCU-N and SRCU-P scenarios using the
 --configs argument to kvm.sh as follows:  "--configs 'SRCU-N SRCU-P'".
-Large systems can run multiple copies of of the full set of scenarios,
+Large systems can run multiple copies of the full set of scenarios,
 for example, a system with 448 hardware threads can run five instances
 of the full set concurrently.  To make this happen::
 
-- 
2.31.1

