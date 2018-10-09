Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C33B67D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Oct 2018 01:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbeJIIsR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Oct 2018 04:48:17 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33744 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbeJIIsR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Oct 2018 04:48:17 -0400
Received: by mail-pl1-f195.google.com with SMTP id s4-v6so10846379plp.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Oct 2018 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DEmAFEukNjBuJ2mkXEf/xrv4vdpDOGkWYaADMVgzl8o=;
        b=kchSpnXZP3Wuzx/fKM6kMuQqfdullDuzAgNA8URCbPncOYLNZlBJQ6WY2Rjfq0KODj
         njJmdhnaH2VwhPQ+gD/ZMiOo8i83+uaOHUTSrs/zprp9mM4sYw+kEtSuDlv8lvmUmyzb
         y+EU4a2d6342gcsKGFr51EbnsFnwnNb07YIqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DEmAFEukNjBuJ2mkXEf/xrv4vdpDOGkWYaADMVgzl8o=;
        b=DAvHeke00pCY5f/r/GR7XC7O2Gxk2/ojF7fYZIHa2DXiKASgTLXJiVrdtSsvzzFrPr
         PbO6XG+Jo6NodJXghiC+Bh7PB3O3V8oDBbQpVM1inosQ6WY7iUYlBlNn35DD0df8GJgh
         Rvbxu/99NLZrnKv2kDmo9Rca79n6VvDOFK3+h3cFmZ9JTuXiWCwEbUUAO52wcxUsjXqt
         eDODsUIKKG0TFKDv2VBMLHfwMZ5JOluwrQ+15qT7GoB+WiOm6BEvbv/GJFOlRI5gcgok
         gV9W+vZogpcpWE2zPTxBBd1ehV0Z9yz7e0xNwPCfWbP6a6mZLzmy71w46wq3BdVpzdCO
         G/cQ==
X-Gm-Message-State: ABuFfog/qdf3TyYx0Z+O4J/9IgcXOY/XzZSnseVUxakVACD8jOpQPQmT
        SJnG8xr37UXngS+26IA49a+CKg==
X-Google-Smtp-Source: ACcGV62Flq8J6hH9PlW/0esU7F3IUDVO9QDdk6QtiRiDoj207SAKHS7TuKpu5vz8vyBrL/lru9VInA==
X-Received: by 2002:a17:902:a989:: with SMTP id bh9-v6mr25644758plb.245.1539048828983;
        Mon, 08 Oct 2018 18:33:48 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id h5-v6sm24153803pfo.135.2018.10.08.18.33.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Oct 2018 18:33:47 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>, tytso@mit.edu,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] docs: rcu: Make reader aware of rcu_dereference_protected
Date:   Mon,  8 Oct 2018 18:33:41 -0700
Message-Id: <20181009013341.60111-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

whatisRCU says rcu_dereference cannot be used outside of rcu read lock
protected sections. Its better to mention rcu_dereference_protected when
it says that, so that the new reader is aware of this API and is not led
to believing that all RCU dereferences in all situations have to be
protected by a rcu_read_lock() and rcu_read_unlock().

Cc: tytso@mit.edu
Suggested-by: tytso@mit.edu
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/whatisRCU.txt | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/RCU/whatisRCU.txt b/Documentation/RCU/whatisRCU.txt
index 7c33445fd0e5..da820fc9b307 100644
--- a/Documentation/RCU/whatisRCU.txt
+++ b/Documentation/RCU/whatisRCU.txt
@@ -266,7 +266,7 @@ rcu_dereference()
 	unnecessary overhead on Alpha CPUs.
 
 	Note that the value returned by rcu_dereference() is valid
-	only within the enclosing RCU read-side critical section.
+	only within the enclosing RCU read-side critical section [1].
 	For example, the following is -not- legal:
 
 		rcu_read_lock();
@@ -292,6 +292,24 @@ rcu_dereference()
 	typically used indirectly, via the _rcu list-manipulation
 	primitives, such as list_for_each_entry_rcu().
 
+	[1] The variant rcu_dereference_protected() can be used outside
+	of an RCU read-side critical section as long as the usage is
+	protected by update-side locks. These update-side locks are
+	obviously acquired by the update-side code, but may also be used
+	to protect other code sequences outside of the reader and the
+	updater. If such sequences need to make an rcu_dereference() call,
+	they can instead simply call rcu_dereference_protected() without
+	needing extra calls to rcu_read_lock() and rcu_read_unlock().
+	Another advantage of using rcu_dereference_protected() is it does
+	not prevent compiler optimizations unlike rcu_dereference() which
+	could result in optimized and the result is assured to be
+	functionaly correct due to the update-side locks.
+	rcu_dereference_protected() takes a lockdep expression to
+	indicate what is providing the protection. If the indicated
+	protection is not provided, a lockdep splat is emitted.
+	See RCU/Design/Requirements.html and the API's code comments
+	for more details and example usage.
+
 The following diagram shows how each API communicates among the
 reader, updater, and reclaimer.
 
-- 
2.19.0.605.g01d371f741-goog

