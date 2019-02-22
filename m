Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42DE57D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 11:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfBVLbp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 06:31:45 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:34882 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbfBVLbp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 06:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:Reply-To:Cc:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/oihd/4/fg3Z1PY20lV/VXQjnvRnVd7978XYS7VuXr0=; b=nD14eq1WeXQMuOXeRRT4mczsUw
        d94zo93lc9hTC6Ic9+9t5+VM1HUgVKZ8LWPDPjZyGmHj09BaLM02oQyFtWGXcIJIxaj+CSxgxRW//
        iZUDHSk0gK5lV7h6Zd2cId/Et9qR0+yyL7VlPEoh7F6fmL2l0nw/MzdXwDlucFV5M46lhfaU1dh/3
        WuBiadngVx63o01IyICez2JVMQZLqCF6xIPLu6a40O0hpkGBOG+Xap4nrRvPOUq34CSpiq0Sq4KyS
        IFzTtb89OfIKMsbND4eVjTc1D3zfsuj3O/S9ypsVlGdi7ADWgNqfp4v25VCte8UUDMSVHLIeBguUV
        4p1NHTYA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:50670 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1gx93N-0001Tn-Ow; Fri, 22 Feb 2019 11:31:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1gx93N-00046w-6j; Fri, 22 Feb 2019 11:31:41 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-doc@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/2] net: phylink: update mac_config()
 documentation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1gx93N-00046w-6j@rmk-PC.armlinux.org.uk>
Date:   Fri, 22 Feb 2019 11:31:41 +0000
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
index f57059e4353f..6411c624f63a 100644
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

