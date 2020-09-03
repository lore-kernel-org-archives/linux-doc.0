Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A77EC433E2
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 08:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD791206EB
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 08:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="HJR5mkja"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgICIuL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 04:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgICIuJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Sep 2020 04:50:09 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9A7C061244
        for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2020 01:50:08 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id e17so2024450wme.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2020 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Al+jXmabFt6iTjs3Kkx8j5ncFOEuzdqj1tZqlKBcdF4=;
        b=HJR5mkja6Gyifjzh0YOK0V4qgdXBNL3qp3jJwb+1DKhoJ9onltiyhkIFrpa6HRjx3R
         Vc7tkMw9WAll3m6rQeY5dYNXJG91CeCisS85wbsRmliD2GTzXn+dcpMBb3nnZFFtebvO
         akLfHaTl+uYJe0SAcLOPd4c3pUzauWCr7c/Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Al+jXmabFt6iTjs3Kkx8j5ncFOEuzdqj1tZqlKBcdF4=;
        b=BKj7dHiKHPWDcijji9sbuQKKOdTtR/oiCaAl8hL56bEI7e57tqsIJZOduMgfiqCpW2
         zECNnxITjYC1hRjSHIqfll1/L/6vIzPRZ60y6H/jBaFOfixX/yzvTK1ZN1OIx6oxlML8
         AZEEmjRWlynwoKpKBKOnH/h9oPn9yyRI3s5gv/1cdjDi9WmyeVrcJAdcO+T1FZZ+Loo8
         QIyq+gXkfATFiQ/U7w4tnITgC04u9ZCdU2A2BlY6gtEumg0SJ14zoeEXmQFgQCfjAH8v
         JnxmqZh/dA8xFnheoMDsq56fKL0en1mVlmcXh0gNrVn7/+cn8uoJ0C5lJoR6kma5njXg
         LOkw==
X-Gm-Message-State: AOAM531qw5hj1HE53BS6rIGBcCTTTVLGxf5ep54HGroQs2gE7VF46iAn
        JnGMiPkvSWBnEF4oqnFbB7XjkA==
X-Google-Smtp-Source: ABdhPJw5sS9s1NLmXGgGO8ihMdeuqOWfDrs2++miqrmb7KJ12mmteP1MEKBD8iECormo6IoLcMB2fg==
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr1338295wmj.158.1599123007410;
        Thu, 03 Sep 2020 01:50:07 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id 197sm3327090wme.10.2020.09.03.01.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 01:50:06 -0700 (PDT)
From:   Paul Barker <pbarker@konsulko.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Paul Barker <pbarker@konsulko.com>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, trivial@kernel.org
Subject: [PATCH] doc: net: dsa: Fix typo in config code sample
Date:   Thu,  3 Sep 2020 09:49:25 +0100
Message-Id: <20200903084925.124494-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the "single port" example code for configuring a DSA switch without
tagging support from userspace the command to bring up the "lan2" link
was typo'd.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 Documentation/networking/dsa/configuration.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/dsa/configuration.rst b/Documentation/networking/dsa/configuration.rst
index af029b3ca2ab..11bd5e6108c0 100644
--- a/Documentation/networking/dsa/configuration.rst
+++ b/Documentation/networking/dsa/configuration.rst
@@ -180,7 +180,7 @@ The configuration can only be set up via VLAN tagging and bridge setup.
 
   # bring up the slave interfaces
   ip link set lan1 up
-  ip link set lan1 up
+  ip link set lan2 up
   ip link set lan3 up
 
   # create bridge
-- 
2.28.0

