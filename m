Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 026987D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun,  5 May 2019 02:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfEECED (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 4 May 2019 22:04:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33925 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfEECED (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 May 2019 22:04:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id b3so4882695pfd.1
        for <linux-doc@vger.kernel.org>; Sat, 04 May 2019 19:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZFhA4rpBi4Ho6CrUxobqyCCZrYULhg304dSUdvW7O94=;
        b=VF97BCjYFHEAQLpYYbW91gr3FQIXdhnksyX+tLBpQCq6IOPLNoGKQ1xLm4n+GoZEK1
         ZrMI9jRmv92rcu4yERa1vUnvkrYoiSlvlVDtuk58zcMFywKQjMNULJqXEPROjvk2LhoS
         3IZ2EhwORtG6UrMA7SYMD7RU/CopH/XHCGLFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZFhA4rpBi4Ho6CrUxobqyCCZrYULhg304dSUdvW7O94=;
        b=i81r66pv9m5+KWw9RWLsb36i5Vzk0dg6udVlaRRVZkKXb0uCQetxwyOO0wcuUv/PG7
         NwJoJOpcFkLsRDJYdgtNoG2gd8TP9s57BeAiovNAni+K3ObHjK6zJDEpQ/0kwPLw/QlN
         FFidgNKITKwxX5U6lVquAjuBvYZZ0MXtoajyikv25SznEABMtHX6Zp8Vz7uQdTONVK3b
         gkeFzrUlI/ypCll/8qSldIqkAPcH9fnknvNNzu3fpKO/1qCQR7pMCTEOffgXUTNShsxk
         bVXl0Tjmir78ehAaIVQzN/PYEZF3kqhatFwZ0hfvmhAq56JqyDf+FPWmu9oeSr+NE7Cq
         c2Ag==
X-Gm-Message-State: APjAAAW7vXuwee7lxR6//J/QiIa+Va+FAU2KG9Ux+O5mV72Y5roxRXpb
        dOjkMsR3yfCqVR8OwpFAL16IXg==
X-Google-Smtp-Source: APXvYqxVp6IA/vCCGuS3+eK5MQzvCZdy0r4p5IJ9nTyEy86IgB/c5iImNtANV5yxYN8IFPwA87P+VQ==
X-Received: by 2002:aa7:91c8:: with SMTP id z8mr23430186pfa.110.1557021842475;
        Sat, 04 May 2019 19:04:02 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id 5sm2632829pfs.17.2019.05.04.19.03.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 04 May 2019 19:04:00 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] doc/rcu: Correct field_count field naming in examples
Date:   Sat,  4 May 2019 22:03:10 -0400
Message-Id: <20190505020328.165839-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I believe this field should be called field_count instead of file_count.
Correct the doc with the same.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/listRCU.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/RCU/listRCU.txt b/Documentation/RCU/listRCU.txt
index adb5a3782846..190e666fc359 100644
--- a/Documentation/RCU/listRCU.txt
+++ b/Documentation/RCU/listRCU.txt
@@ -175,7 +175,7 @@ otherwise, the added fields would need to be filled in):
 		list_for_each_entry(e, list, list) {
 			if (!audit_compare_rule(rule, &e->rule)) {
 				e->rule.action = newaction;
-				e->rule.file_count = newfield_count;
+				e->rule.field_count = newfield_count;
 				write_unlock(&auditsc_lock);
 				return 0;
 			}
@@ -204,7 +204,7 @@ RCU ("read-copy update") its name.  The RCU code is as follows:
 					return -ENOMEM;
 				audit_copy_rule(&ne->rule, &e->rule);
 				ne->rule.action = newaction;
-				ne->rule.file_count = newfield_count;
+				ne->rule.field_count = newfield_count;
 				list_replace_rcu(&e->list, &ne->list);
 				call_rcu(&e->rcu, audit_free_rule);
 				return 0;
-- 
2.21.0.1020.gf2820cf01a-goog

