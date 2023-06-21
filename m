Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FEAEB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 22:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjFUWfh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 18:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjFUWfe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 18:35:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E435173F
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 15:35:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12AE5616FB
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 22:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A247C433C0;
        Wed, 21 Jun 2023 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687386927;
        bh=EWnSd7bjG7PilttbL5ZZpTzcZo8e3vUQoklthxd0EVc=;
        h=From:To:Cc:Subject:Date:From;
        b=IKHFCF5e2D0cFFU4Tg/JNKd+613yz0i7qT+vcb6XRp1cNDYKcBpNVmCQcCCFy0iry
         cuU9ee1Pzqo6/i/PF4WEdVsxYGxb7WTLvA7ZYotJoZxuH3I+WGlQKXozTfcgYwki88
         LLOugFruXBP2E2r15PlBMzWTUaizFWJ8F2+qn3NjN7JiSuTu70htbTy2OdM+Dez7fU
         4Hx5ZZ4Bs3pM6ANyac8pGO8GIvO/HjUd3cuFthjdguT3esRZweqJcWX9nOnJPS5eUW
         v2noU+NcQapPNwuvDGjWdVzqgcKGqzdrSg2ptXkBMYc6A5/bm2xGjkUdmGSt1ZchcF
         Sh9Wfvwqbqw6g==
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, arkadiusz.kubalewski@intel.com,
        netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH docs] scripts: kernel-doc: support private / public marking for enums
Date:   Wed, 21 Jun 2023 15:35:25 -0700
Message-Id: <20230621223525.2722703-1-kuba@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Enums benefit from private markings, too. For netlink attribute
name enums always end with a pair of __$n_MAX and $n_MAX members.
Documenting them feels a bit tedious.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
Hi Jon, we've CCed you recently on a related discussion
but it appears that the fix is simple enough so posting
it before you had a chance to reply.
---
 scripts/kernel-doc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 2486689ffc7b..66b554897899 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1301,6 +1301,9 @@ sub dump_enum($$) {
     my $file = shift;
     my $members;
 
+    # ignore members marked private:
+    $x =~ s/\/\*\s*private:.*?\/\*\s*public:.*?\*\///gosi;
+    $x =~ s/\/\*\s*private:.*}/}/gosi;
 
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
     # strip #define macros inside enums
-- 
2.40.1

