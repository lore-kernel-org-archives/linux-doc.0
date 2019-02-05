Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C91F37D099
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Feb 2019 15:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfBEP6T (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Feb 2019 10:58:19 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:40230 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbfBEP6T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Feb 2019 10:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2014; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:Reply-To:Cc:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9PXWMgWPwutt32DvQ7FNJITJQso3AEiLFtW9buvMo14=; b=S4yMDKwdIPLagVfD8I/9/yRBLn
        4DmblbehVNgXbYAWJAbK9ATX//KhbMBFUZcBxpZ+EMdsRWgJlNxo66isXsu9dSoCdLkXRbH5b7TDk
        MBnZy9x6frQNGdbSofU+GCcS3SpO4kbr+89On1NeqQjXFWfs96X6YkunNv8+VGLgHYF0=;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:45778 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1gr372-000379-5c; Tue, 05 Feb 2019 15:58:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1gr371-0007eK-Gd; Tue, 05 Feb 2019 15:58:15 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-doc@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH 1/2] net: phylink: update mac_config() documentation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1gr371-0007eK-Gd@rmk-PC.armlinux.org.uk>
Date:   Tue, 05 Feb 2019 15:58:15 +0000
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A detail for mac_config() had been missed in the documentation for the
method - it is expected that the method will update the MAC to the
settings, rather than completely reprogram the MAC on each call.
Update the documentation for this method for this detail.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 include/linux/phylink.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 021fc6595856..606a121629a9 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -149,6 +149,13 @@ int mac_link_state(struct net_device *ndev,
  *   configuration word. Nothing is advertised by the MAC. The MAC is
  *   responsible for reading the configuration word and configuring
  *   itself accordingly.
+ *
+ * Implementations are expected to update the MAC to reflect the
+ * requested settings - i.o.w., if nothing has changed between two
+ * calls, no action is expected.  If only flow control settings have
+ * changed, flow control should be updated *without* taking the link
+ * down.  This "update" behaviour is critical to avoid bouncing the
+ * link up status.
  */
 void mac_config(struct net_device *ndev, unsigned int mode,
 		const struct phylink_link_state *state);
-- 
2.7.4

