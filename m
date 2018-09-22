Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3AD87D57F
	for <lwn-linux-doc@archive.lwn.net>; Sat, 22 Sep 2018 23:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbeIWFhD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 23 Sep 2018 01:37:03 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39596 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbeIWFhC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 23 Sep 2018 01:37:02 -0400
Received: by mail-pg1-f193.google.com with SMTP id 85-v6so4534878pge.6
        for <linux-doc@vger.kernel.org>; Sat, 22 Sep 2018 16:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gcw9CPSV3u4YZIhv/1kFUlTXnlNjBUBOnEHeo2kzAG8=;
        b=fRsLbea0WqRNuUF/D8fiemmJvAOCLFkpp5qlftzGN5aLY+hZvkgUZ/7w6LeI7hwozy
         iTA9JYcxARVNloV04ELd8eqgaVO2JHPcmoZ+vKpcRzBx+hpLoCHlmYxEzQZbmiROeMph
         +TsZFHV1KZUuKbYXkWRsUGgC46fGD16VRzh6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gcw9CPSV3u4YZIhv/1kFUlTXnlNjBUBOnEHeo2kzAG8=;
        b=Dgn3aBWbRsq1gC6PSnmRO+mmp4JrMdsjcS4tlOX2Z8Brar1zSU68U6HVHT8hLBBb4S
         6ZR+tUZ2CssC8s5YeheaRy6ZWeyjPIAJxl0kGgPljkkzwlsgn5xGLQBx94iIfzg+2QCL
         MkR99wQ7vOChTmsf2V1ufQ684keeUZL7vs7RTe7uO5Ntn5G+2vJW8Rn24iaT726Axna3
         QABIJS6KGcBGdAK9HHKgwM38hf7eZCKqcDBNOrXQOyOTfr6uXf16zS17qGSeQQpjowEJ
         Zrkq5tVAyPbrQlv7o4S1KEPhn2d1+Xb1SSKy0+CIHpYeNqyHAQbvDHaxtKhzuojdou7Y
         jS5g==
X-Gm-Message-State: ABuFfoiEYljoCtxnAEX88Z2mdmoL5QE/EmKCxU8z2aivZhwNgF0d/qs1
        RrXJ4kk70jsMVw9JIae6B6eYJw==
X-Google-Smtp-Source: ACcGV61HqTSEmA6k1xeHjIqiB46mqmWw/Rc7H8WwHSLt/o7nNRkGfvUeoSl6rq0AnOYEgRP3uAEFHg==
X-Received: by 2002:a65:594b:: with SMTP id g11-v6mr3710808pgu.260.1537659702332;
        Sat, 22 Sep 2018 16:41:42 -0700 (PDT)
Received: from joelaf-glaptop0.roam.corp.google.com (c-98-210-118-128.hsd1.ca.comcast.net. [98.210.118.128])
        by smtp.gmail.com with ESMTPSA id h4-v6sm32377789pgp.13.2018.09.22.16.41.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Sep 2018 16:41:41 -0700 (PDT)
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
Subject: [PATCH RFC 3/3] Documentation: RCU: Fix rcu_preempt_state reference in stallwarn
Date:   Sat, 22 Sep 2018 19:41:27 -0400
Message-Id: <20180922234127.94970-3-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.444.g18242da7ef-goog
In-Reply-To: <20180922234127.94970-1-joel@joelfernandes.org>
References: <20180922234127.94970-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

rcu_preempt_state doesn't exist anymore. Update stallwarn documentation
accordingly.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/stallwarn.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/stallwarn.txt b/Documentation/RCU/stallwarn.txt
index 491043fd976f..b6bc7a2a9961 100644
--- a/Documentation/RCU/stallwarn.txt
+++ b/Documentation/RCU/stallwarn.txt
@@ -176,9 +176,8 @@ causing stalls, and that the stall was affecting RCU-sched.  This message
 will normally be followed by stack dumps for each CPU.  Please note that
 PREEMPT_RCU builds can be stalled by tasks as well as by CPUs, and that
 the tasks will be indicated by PID, for example, "P3421".  It is even
-possible for a rcu_preempt_state stall to be caused by both CPUs -and-
-tasks, in which case the offending CPUs and tasks will all be called
-out in the list.
+possible for a rcu_state stall to be caused by both CPUs -and- tasks,
+in which case the offending CPUs and tasks will all be called out in the list.
 
 CPU 2's "(3 GPs behind)" indicates that this CPU has not interacted with
 the RCU core for the past three grace periods.  In contrast, CPU 16's "(0
-- 
2.19.0.444.g18242da7ef-goog

