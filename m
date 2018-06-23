Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B85737D043
	for <lwn-linux-doc@archive.lwn.net>; Sat, 23 Jun 2018 04:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751320AbeFWElK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 23 Jun 2018 00:41:10 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:44956 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751204AbeFWElJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Jun 2018 00:41:09 -0400
Received: by mail-pf0-f193.google.com with SMTP id x23-v6so161442pfn.11
        for <linux-doc@vger.kernel.org>; Fri, 22 Jun 2018 21:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=CW3gtRZPbTm2ilrBisLi7BBMmZuYVObAHL2BztC1qpo=;
        b=ltXJatiYkVpJdvymlwmFmTPK69caCHB3TOU2obwFTltYATeRF3fEKO7FIrige8LRX4
         5OhiOIDUowHBoGbISrs3DJF7DDhC24RbcQw/IsI0xa/gsNCXI4WDCWsL5YBJZ32cO201
         n/oHTO8/PHcABos6SWXBzl1CzCLtE/updVIWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CW3gtRZPbTm2ilrBisLi7BBMmZuYVObAHL2BztC1qpo=;
        b=ihs2m2YSIDwRFv69qYgHt1+MXmMNMXByRMENoSNGEMM/+WS2wIlnLNOOCFOcEITxRZ
         Gx8H1D88uCzIEN70uoQzcRA9CnLyp+hIqzk9YlXqrnf8zYt7H+x/aucuEYQEMQ5bzItR
         rLFjzUgWLVc8l6VmSd07pjldg9cn1byGAyV2Qtqu3mhA+aHFlNjZxz10Jzx2l8E0EvSE
         6FMQPODc3ZhGWGiEengJfu6VTjfY2/wDX/ZlSHXAPxLNXB9n3mzQjB7tXE8R6C77tble
         JeB9MlRNl/cmWtJ5v1JVDHUoYVFJ7McBBrb39J4SDPt6C/CVGazaDoxHGUDgFPmLtg/s
         3Ikg==
X-Gm-Message-State: APt69E32vUVaPKZwurIeIO6zqUl1HljYGpddfndLUnbdVHCXw6r9gHDQ
        Uwb+0Mv9p63XU1haDM7OiJPtLg==
X-Google-Smtp-Source: ADUXVKIBW7NiMXp2kpR0mLurErTRLfxmdaJQ/l06LGymlPbhsnpKs+o/eybTRJKzGOOdjSqBJb5ofQ==
X-Received: by 2002:a65:410d:: with SMTP id w13-v6mr3609456pgp.414.1529728868523;
        Fri, 22 Jun 2018 21:41:08 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1600:3122:ea9c:d178:eb])
        by smtp.gmail.com with ESMTPSA id 29-v6sm22695637pfp.24.2018.06.22.21.41.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jun 2018 21:41:07 -0700 (PDT)
From:   Joel Fernandes <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] Documentation: RCU: Fix broken link to LKML archive
Date:   Fri, 22 Jun 2018 21:40:55 -0700
Message-Id: <20180623044055.118383-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

While going through the RCU requirements for interrupts, I noticed that
one of the LKML links is broken. This patch changes it to use the
archive from lore.kernel.org which works fine.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/Design/Requirements/Requirements.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.html b/Documentation/RCU/Design/Requirements/Requirements.html
index 9b808402f8ce..58b6557007a3 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.html
+++ b/Documentation/RCU/Design/Requirements/Requirements.html
@@ -2269,10 +2269,10 @@ Thankfully, RCU update-side primitives, including
 The name notwithstanding, some Linux-kernel architectures
 can have nested NMIs, which RCU must handle correctly.
 Andy Lutomirski
-<a href="https://lkml.kernel.org/g/CALCETrXLq1y7e_dKFPgou-FKHB6Pu-r8+t-6Ds+8=va7anBWDA@mail.gmail.com">surprised me</a>
+<a href="https://lkml.kernel.org/r/CALCETrXLq1y7e_dKFPgou-FKHB6Pu-r8+t-6Ds+8=va7anBWDA@mail.gmail.com">surprised me</a>
 with this requirement;
 he also kindly surprised me with
-<a href="https://lkml.kernel.org/g/CALCETrXSY9JpW3uE6H8WYk81sg56qasA2aqmjMPsq5dOtzso=g@mail.gmail.com">an algorithm</a>
+<a href="https://lkml.kernel.org/r/CALCETrXSY9JpW3uE6H8WYk81sg56qasA2aqmjMPsq5dOtzso=g@mail.gmail.com">an algorithm</a>
 that meets this requirement.
 
 <p>
-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
