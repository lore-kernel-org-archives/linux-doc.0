Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B44A07D043
	for <lwn-linux-doc@archive.lwn.net>; Sun, 24 Jun 2018 19:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751706AbeFXTfA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 24 Jun 2018 15:35:00 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34537 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751575AbeFXTe7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Jun 2018 15:34:59 -0400
Received: by mail-pf0-f196.google.com with SMTP id g3-v6so690048pfi.1
        for <linux-doc@vger.kernel.org>; Sun, 24 Jun 2018 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=oM8Tr8TK/eW4MzZR6eU5Xgrt37oTYon44hf7ccfXntQ=;
        b=RRYTw8mzSnt2oDezVTdlZxw6s/q0PDluprf5McDCvrMLCO93pTj0n1E0qZLVrEdsg9
         YJKjA88YjePR1N3z2Jn7CYANpmD7LKiIL1QXJiQKSGOsl959frHwIftmtA8vyQbXgIpe
         nPqBl2lp+Pge1a3GuEkFZAuvZnaEm3ubNN7UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oM8Tr8TK/eW4MzZR6eU5Xgrt37oTYon44hf7ccfXntQ=;
        b=tLWJPaGQvwOTg2LtTedOcP9QgLXdSmO1fJBzHo262tcuqHpqMXAlLr0qBgswJbU6xe
         n1sH6F8qmG1cpPLQcCrqGsoxVm1TN2mcEcDpwTQuY6p4UMJs3aeRqq3pkFNQjm5wmYyL
         LO6cY7BCQBnS5hnj1BbY900epPEvR3MLYq1L3IA16AVhRFuTlpenhqGIdJuL0gwlgZE+
         voMY8xRmmiQK2GCAeK20b5VTIzz+WIvv93DwAv96BsLcakj7tOas3pacNIHBmxWEszhG
         qK2LLmw93LVtL8BsVWqXg5qsUep0YWqJdMjrRq41NaGZFkKzyfZIRg8fA5CZKVvRblcY
         OzUw==
X-Gm-Message-State: APt69E1h9FhVlNDWnRQqCSLHPrmu6iBk8xfslc1rU4OD8auEdPAlexAZ
        gxtoUdXYhCHEO3Qy2FpVnEXC2Q==
X-Google-Smtp-Source: ADUXVKKuY/aAXYmP2XocxXXSox8AZnQ+QvizBCpsb0wGpecTyvQ6Cp4BwhA7OBD0XWUSvsLksKMz1w==
X-Received: by 2002:a62:84e:: with SMTP id c75-v6mr10215617pfd.35.1529868898855;
        Sun, 24 Jun 2018 12:34:58 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1600:3122:ea9c:d178:eb])
        by smtp.gmail.com with ESMTPSA id n76-v6sm28132167pfg.98.2018.06.24.12.34.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jun 2018 12:34:58 -0700 (PDT)
From:   Joel Fernandes <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>, byungchul.park@lge.com
Subject: [RFC] doc: Improve rcu_dynticks::dynticks documentation
Date:   Sun, 24 Jun 2018 12:34:51 -0700
Message-Id: <20180624193451.250855-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

The very useful RCU Data-Structures describes that the dynticks counter
of the rcu_dynticks data structure is incremented when we transitions to
or from dynticks-idle mode. However it doesn't mention that it is also
incremented due to transitions to and from user mode which for dynticks
purposes is an extended quiescent state.

I found this with tracing calls to rcu_dynticks_eqs_enter which can also
happen from rcu_user_enter. Lets add this information to the
Data-Structures document.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../RCU/Design/Data-Structures/Data-Structures.html       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/Design/Data-Structures/Data-Structures.html b/Documentation/RCU/Design/Data-Structures/Data-Structures.html
index f5120a00f511..50be87e59937 100644
--- a/Documentation/RCU/Design/Data-Structures/Data-Structures.html
+++ b/Documentation/RCU/Design/Data-Structures/Data-Structures.html
@@ -1227,9 +1227,11 @@ to overflow the counter, this approach corrects the
 CPU enters the idle loop from process context.
 
 </p><p>The <tt>-&gt;dynticks</tt> field counts the corresponding
-CPU's transitions to and from dyntick-idle mode, so that this counter
-has an even value when the CPU is in dyntick-idle mode and an odd
-value otherwise.
+CPU's transitions to and from either dyntick-idle or user mode, so
+that this counter has an even value when the CPU is in dyntick-idle
+mode or user mode and an odd value otherwise. The transitions to/from
+user mode need to be counted for user mode adaptive-ticks support
+(see timers/NO_HZ.txt).
 
 </p><p>The <tt>-&gt;rcu_need_heavy_qs</tt> field is used
 to record the fact that the RCU core code would really like to
-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
