Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B34BEB64DA
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 17:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjGJRqm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 13:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjGJRqm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 13:46:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74204DD
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 10:46:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11D5D6115E
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 17:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D988C433C7;
        Mon, 10 Jul 2023 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689011200;
        bh=JAxHBqgOmJqchXSR6NoBE6n0/dxS2e6Jz25wI0ASHys=;
        h=From:To:Cc:Subject:Date:From;
        b=cMCloIYV7yTHhbdKB+1ys8mQEFeldbiiR5oFxomKX/JK0UQatqANwYStqPzUS9J4d
         QfLF9Og+sYv8+ZZeV7pKJ2p2hWvMCQuFse1NfBHIRBr3IydwCd8Nbhu6nUZINP8Pt7
         b9sh8gqSeTs5em8PHH74xUf5tncjcmI60Xo8gN2ipN7gkw5PiFCG3gsRyEtwURnyHW
         hP4x2tDTsBZ9yGfNIPXXCTqLAc7op+pP5l5XeHKqk9kX+cdwvULW3w30y//wzb+9aG
         ccblALfhsNqQHSn9oVcbyw0HjwU9an1F1KrXK/03KWGhtErzXVmcSKxR/Xh+DRiM//
         T4/BvnoNxCT4w==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        bpf@vger.kernel.org, linux-doc@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net] docs: netdev: update the URL of the status page
Date:   Mon, 10 Jul 2023 10:46:36 -0700
Message-ID: <20230710174636.1174684-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move the status page from vger to the same server as mailbot.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
BPF folks, I see a mention of the status page in your FAQ, too,
but I'm leaving it to you to update, cause I'm not sure how
up to date that section is.
---
 Documentation/process/maintainer-netdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index 2397b31c0198..2ab843cde830 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -98,7 +98,7 @@ If you aren't subscribed to netdev and/or are simply unsure if
 repository link above for any new networking-related commits.  You may
 also check the following website for the current status:
 
-  http://vger.kernel.org/~davem/net-next.html
+  https://patchwork.hopto.org/net-next.html
 
 The ``net`` tree continues to collect fixes for the vX.Y content, and is
 fed back to Linus at regular (~weekly) intervals.  Meaning that the
-- 
2.41.0

