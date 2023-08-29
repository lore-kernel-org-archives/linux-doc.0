Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29E9C6FA8F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Aug 2023 08:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjH2Iz6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Aug 2023 04:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234378AbjH2Izz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Aug 2023 04:55:55 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD94F9;
        Tue, 29 Aug 2023 01:55:53 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fefe898f76so40359025e9.0;
        Tue, 29 Aug 2023 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693299351; x=1693904151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KErYlQfM+ER4ST6ZQk6w3/k4qEq0kUyWnuGXWwXbdAk=;
        b=P4RCLsQVQytklMdLAC7ZLqdjIYErwsKz60Wup7fqEJlYSTL7ZTUjUATnf4Ny3pEIpW
         vhsvK/8ugTfELX93KsIuaKWIQ8j+OtdWAHkdF8Fyz4bJCUOdFvZWbOhOKoQM/4RfPzCJ
         Nw35o85kbyS0hJ09O4RrE8yVo+D3FFQGDYtvaNAIPfgdnhlgztpRV7AyJGS6yXgdKe/g
         QNIVBCWm2HDm5alGIz3ajK564SA5YrpUpTSoTm9aNPI+ByH/W7P8ru4AaDBfoim+9HDI
         scS29cicIyj3czkMtlgg7lLKVjdOE+Qi521PygULneX/XWQe7ZQnxdlnYG81svpm1zY6
         t2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693299351; x=1693904151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KErYlQfM+ER4ST6ZQk6w3/k4qEq0kUyWnuGXWwXbdAk=;
        b=czgOhVNohzzCeoy+62ZyD2NMzR/cAFAgzsvOtb2bhG4Q86FgKdobOAg1/iDHgojUA2
         Fvnl18v0ec3KotJDsn+UNXVFqESNDb4+1qYArgJbTnVwVfCNjG7e891t4npYhqeHgM4s
         Y/lLpySW3/0AtWWVTYRLdwQ7ODLnltbxPSBx/Zz/xwOB6UpcWoTHSEKkQ0p7nbI0FdBB
         I210KQniUUjbkmADzb27yS8fgMnc2q4II+mj8IfxF+cixd3FwbwFYQbd6CsRl+juBVfj
         jYKXDgHjYivaJnQPUnMQn2L8+SYQk49lQ1E2L5n/NjNiJW2yI1EUbbTP9JLnVIFLXgn9
         AeeQ==
X-Gm-Message-State: AOJu0YztJAUo83/LN7SbHUKlGNMdkedAQMaAah3Sta+ZBxDLjceinrxp
        cJbC0O1dY2xTafG3hNEPX5GIOZ/HY71OyQ==
X-Google-Smtp-Source: AGHT+IFQGfLIO1I2fMKSmom+DI4hc2ojpF5wVO4Eo76npX4BQPnQMxR4XOHCo1yiAoNXE21cIux3cQ==
X-Received: by 2002:a7b:c7c3:0:b0:3fd:2e1d:eca1 with SMTP id z3-20020a7bc7c3000000b003fd2e1deca1mr21317976wmk.4.1693299350921;
        Tue, 29 Aug 2023 01:55:50 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:f4a3:3eb3:6f1d:fdce])
        by smtp.gmail.com with ESMTPSA id g12-20020a7bc4cc000000b003fed8e12d62sm13330228wmk.27.2023.08.29.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 01:55:50 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jacob Keller <jacob.e.keller@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next] doc/netlink: Fix missing classic_netlink doc reference
Date:   Tue, 29 Aug 2023 09:55:39 +0100
Message-ID: <20230829085539.36354-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing cross-reference label for classic_netlink.

Fixes: 2db8abf0b455 ("doc/netlink: Document the netlink-raw schema extensions")
Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/userspace-api/netlink/intro.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/userspace-api/netlink/intro.rst b/Documentation/userspace-api/netlink/intro.rst
index 0955e9f203d3..3ea70ad53c58 100644
--- a/Documentation/userspace-api/netlink/intro.rst
+++ b/Documentation/userspace-api/netlink/intro.rst
@@ -528,6 +528,8 @@ families may, however, require a larger buffer. 32kB buffer is recommended
 for most efficient handling of dumps (larger buffer fits more dumped
 objects and therefore fewer recvmsg() calls are needed).
 
+.. _classic_netlink:
+
 Classic Netlink
 ===============
 
-- 
2.41.0

