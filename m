Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90816C77B7D
	for <linux-doc@archiver.kernel.org>; Thu, 11 May 2023 01:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjEKBnp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 May 2023 21:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236907AbjEKBno (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 May 2023 21:43:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5110E59F2
        for <linux-doc@vger.kernel.org>; Wed, 10 May 2023 18:43:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C770A641CB
        for <linux-doc@vger.kernel.org>; Thu, 11 May 2023 01:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6823C433D2;
        Thu, 11 May 2023 01:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683769421;
        bh=WgiagVILFlJr+BssirgOWdx4EX6xaOlwOwJSQdWpN6M=;
        h=From:To:Cc:Subject:Date:From;
        b=ByRJMek1Bn5TXGuVVZO1SyoLXds2iMI5zSyd7EQfLgL1hQWlWUlVoXPaz3Id/G1lK
         r32ICq2Mr+hXG0qjY0HpHmf3wLwmRZzV49qXY7y58VTMjvW1gIfjXH8jKa7EkVL5Nh
         M2XN4T6JGGIyBKJ3BWrTmdPwXCJKqE+KRkFUxMjr4AnSheyZIJEYSoCBu2oV/UYA2b
         5aNUmrxyjrGr7cLM2yC3idtBISan6Zj3N8SYmHsXCFkXcHVNRx5cjyg+Sv6neEs2E4
         O2ye0MrmZNlAP98AYSWcish3ckD8ZVU5AFeB1PK+EP5eFtXr826rQ5/wT1/A7gUDv2
         bXBqDGUD6r0Kg==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net] MAINTAINERS: don't CC docs@ for netlink spec changes
Date:   Wed, 10 May 2023 18:43:39 -0700
Message-Id: <20230511014339.906663-1-kuba@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation/netlink/ contains machine-readable protocol
specs in YAML. Those are much like device tree bindings,
no point CCing docs@ for the changes.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..1c78e61a3387 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6218,6 +6218,7 @@ X:	Documentation/devicetree/
 X:	Documentation/driver-api/media/
 X:	Documentation/firmware-guide/acpi/
 X:	Documentation/i2c/
+X:	Documentation/netlink/
 X:	Documentation/power/
 X:	Documentation/spi/
 X:	Documentation/userspace-api/media/
@@ -14607,6 +14608,7 @@ B:	mailto:netdev@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	Documentation/core-api/netlink.rst
+F:	Documentation/netlink/
 F:	Documentation/networking/
 F:	Documentation/process/maintainer-netdev.rst
 F:	Documentation/userspace-api/netlink/
-- 
2.40.1

