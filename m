Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9DB587D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 22:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbeIVEXC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 22 Sep 2018 00:23:02 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36190 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725756AbeIVEXC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Sep 2018 00:23:02 -0400
Received: by mail-io1-f66.google.com with SMTP id q5-v6so13616021iop.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 15:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7G1LyBYm4HSC5qCxaG9wMUa09GRXe4Qr33dj1P3c38=;
        b=bTijR68FboeRTVFAiAOqUUVXOOXvL8atzI170zC394IEbTNbsAMPfkPwXfsSZjeWKs
         a5ZgPDElseUuWwDKFLiGWnBxhGs8f/P8ex5DamkFzWyhY8r9Gu4O9ZKbr2Y3F87c2Hn7
         qgMIu/sIln9Z/vpL7gHx3iWSrcZUsHMpBItXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7G1LyBYm4HSC5qCxaG9wMUa09GRXe4Qr33dj1P3c38=;
        b=NGDSCxICsFrGJnEiIl0ff5QhZs4j2UoU2BHzHsH1BXAS09du8Dp7qqjSEmVGYIxAdh
         abIAGqHGb39JJd1aKGz2X9Je1TMpYBZMAd/+knEXSZ5v4EfWxkw4OYCL5klOhNtZ93ZS
         uHtPxqvMG6rktiaxDcyZDN/fKjXH574aJ8MJ4ISgrRaJTgr1uhWMm2Ng4D8nUCSUUY6x
         gUiIxoGOHFvHr4ACZAnQ/oKcFmTiq0s720dHppHAR7VN3PDhK/lb9nENTiQU73s4eS5L
         PYgubxqc+jVmUYzkk3fzxcGFOIcnb/wpGX3S+DNbPXDSLMhIXxSDWeKt0UesBx/8COT3
         JRmA==
X-Gm-Message-State: ABuFfog7HtXT8Xfn/gge2cKjEitZ3JT+7hufO6sLlkWT/lc9sSvK48oJ
        chkmeGobVsfiVbN+jHU4INzepQ==
X-Google-Smtp-Source: ACcGV6368inhHgu+ap5tfP0L0acEmPvk/pu4xAZEIOq8KsfmsI5d+1C3/Tj42qXUI1h/0MYOx2cAwA==
X-Received: by 2002:a6b:d00b:: with SMTP id x11-v6mr4250604ioa.181.1537569126661;
        Fri, 21 Sep 2018 15:32:06 -0700 (PDT)
Received: from joelaf-glaptop0.roam.corp.google.com ([207.164.22.36])
        by smtp.gmail.com with ESMTPSA id b195-v6sm2907320itc.42.2018.09.21.15.32.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 15:32:05 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH RFC] Documentation: RCU: Clarify comment about fanout
Date:   Fri, 21 Sep 2018 18:31:53 -0400
Message-Id: <20180921223153.114728-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.444.g18242da7ef-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RCU Data-Structures document describes a trick to test RCU with small
number of CPUs but with a larger tree. It wasn't immediately clear how
the document arrived at 16 CPUs which also requires setting the
FANOUT_LEAF to 2 instead of the default of 16. Clarify that.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../RCU/Design/Data-Structures/Data-Structures.html         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/Design/Data-Structures/Data-Structures.html b/Documentation/RCU/Design/Data-Structures/Data-Structures.html
index 1d2051c0c3fc..791348977da7 100644
--- a/Documentation/RCU/Design/Data-Structures/Data-Structures.html
+++ b/Documentation/RCU/Design/Data-Structures/Data-Structures.html
@@ -127,9 +127,9 @@ CPUs, RCU would configure the <tt>rcu_node</tt> tree as follows:
 </p><p>RCU currently permits up to a four-level tree, which on a 64-bit system
 accommodates up to 4,194,304 CPUs, though only a mere 524,288 CPUs for
 32-bit systems.
-On the other hand, you can set <tt>CONFIG_RCU_FANOUT</tt> to be
-as small as 2 if you wish, which would permit only 16 CPUs, which
-is useful for testing.
+On the other hand, you can set <tt>CONFIG_RCU_FANOUT</tt> to be as small as 2
+and set <tt>CONFIG_RCU_FANOUT_LEAF</tt> to 2 if you wish, which would permit
+only 16 CPUs in a 4-level tree. This can be useful for testing.
 
 </p><p>This multi-level combining tree allows us to get most of the
 performance and scalability
-- 
2.19.0.444.g18242da7ef-goog

