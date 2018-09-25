Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 896637D584
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 18:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbeIZAfX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 20:35:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40274 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbeIZAfW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 20:35:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id n31-v6so5281998pgm.7
        for <linux-doc@vger.kernel.org>; Tue, 25 Sep 2018 11:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iobjIfdXylFlPdRp0Yvu1bpQIsYvW1yCa9Ix2CTdNJQ=;
        b=Rb0HmpYS/c/0jVktdhahA7NJ/VhPfHy+jj9opXhjnaBNtPg2jkWoZQ0hw+9ywgEP1j
         pORdPD1JpjN6tuFoYxlC8XqJ/Du5jLeg9MTlNmCNBPxJYyoWi65c9MI1Ssxnh/fBeQ6m
         1jW8XOEw24JO3xB4oF474StAy/xI9TmOoNEMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iobjIfdXylFlPdRp0Yvu1bpQIsYvW1yCa9Ix2CTdNJQ=;
        b=FXA4XkHgzuDRg9OIV0WYxxVwkjwbavHjpx8kQ+GsKyuKq8nhgzu0JJeXL/8P0nOrC8
         cIKOi3PWoIQ8Kzh2L621ZGU9jy/A1aM4eKCqsvgiuJlL2SMQm+8OSDIzyYUsCkgdmgGb
         Gzdq2ruG+G1UoYhiyukqs99izpEo1FQ6zCU96OASDZn1C94aT09c5Yw7VFJJ2qgps2aW
         xUFnYcNj7t3pSnXPS9FVAsUBndhTlaTkIXukl0147WE2V0pwjqS3jxxXLqhaBYBVJa1F
         Znc1slGZyL4ReEAfQq4aRYymsiaQQk/nZdoaiSLm52oJgJgE8hnyOMtYJCyZu2ULHRvH
         RNfg==
X-Gm-Message-State: ABuFfogb+NaRvlJFpMpO0Walg4e3QY6TiFjO4rTmVi4CQxGn+mgYJNbl
        3rKCb+xo1nPO2rVIvjvANB+iPQ==
X-Google-Smtp-Source: ACcGV62Tj9oXQ/mE5tHLx1pcws4Hdp8M6vLr6FT1shuhPg92iIAWzUBucZrc9nqoCR8D8njrfwEFUw==
X-Received: by 2002:a65:64d7:: with SMTP id t23-v6mr2193487pgv.436.1537899995111;
        Tue, 25 Sep 2018 11:26:35 -0700 (PDT)
Received: from joelaf-glaptop0.roam.corp.google.com (c-98-210-118-128.hsd1.ca.comcast.net. [98.210.118.128])
        by smtp.gmail.com with ESMTPSA id x70-v6sm6883626pfk.85.2018.09.25.11.26.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Sep 2018 11:26:34 -0700 (PDT)
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
Subject: [5/5] doc: rcu: Update description of gp_seq fields in rcu_data
Date:   Tue, 25 Sep 2018 11:26:01 -0700
Message-Id: <20180925182601.37421-6-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.444.g18242da7ef-goog
In-Reply-To: <20180925182601.37421-1-joel@joelfernandes.org>
References: <20180925182601.37421-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The rcu_state structure doesn't have a gp_seq_needed field. Update the
description under rcu_data accordingly, to reflect this.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../RCU/Design/Data-Structures/Data-Structures.html        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/Design/Data-Structures/Data-Structures.html b/Documentation/RCU/Design/Data-Structures/Data-Structures.html
index a45fc326d990..b41deca48383 100644
--- a/Documentation/RCU/Design/Data-Structures/Data-Structures.html
+++ b/Documentation/RCU/Design/Data-Structures/Data-Structures.html
@@ -1009,9 +1009,10 @@ as follows:
   5   bool gpwrap;
 </pre>
 
-<p>The <tt>-&gt;gp_seq</tt> and <tt>-&gt;gp_seq_needed</tt>
-fields are the counterparts of the fields of the same name
-in the <tt>rcu_state</tt> and <tt>rcu_node</tt> structures.
+<p>The <tt>-&gt;gp_seq</tt> field is the counterpart of the field of the same
+name in the <tt>rcu_state</tt> and <tt>rcu_node</tt> structures.  The
+<tt>-&gt;gp_seq_needed</tt> field is the counterpart of the field of the same
+name in the rcu_node</tt> structure.
 They may each lag up to one behind their <tt>rcu_node</tt>
 counterparts, but in <tt>CONFIG_NO_HZ_IDLE</tt> and
 <tt>CONFIG_NO_HZ_FULL</tt> kernels can lag
-- 
2.19.0.444.g18242da7ef-goog

