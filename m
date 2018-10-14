Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A72197D082
	for <lwn-linux-doc@archive.lwn.net>; Sun, 14 Oct 2018 21:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbeJOFM3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 01:12:29 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40857 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbeJOFM3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Oct 2018 01:12:29 -0400
Received: by mail-pl1-f194.google.com with SMTP id 1-v6so8277700plv.7
        for <linux-doc@vger.kernel.org>; Sun, 14 Oct 2018 14:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B1BhcJksYld0iNAKOWfN53vg1bwHsJCccKOsz1OidCM=;
        b=P3Gvaqcg09jDvQq63vIOoN9M87VDwdMJuajFEwUh7JleqOSXVfbkOI6OukhN5kvUVr
         R84d9ws+5LO/PQZkNWjhU/ME1zTIaTwEmCC+QvZXNHS3LWOhEdQZZame1NygElGywAwP
         Q8rd8Rg4tqBrWmFPcdZaGm5qrEDyVdqFCiBdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B1BhcJksYld0iNAKOWfN53vg1bwHsJCccKOsz1OidCM=;
        b=iCUb4uCtIopgadvsDfs067zmHz2PFcdDcIs9zqg8I98EScRFmly8poauKFwZJ3Jr2Z
         P1fwgHkx0MjcYGtXisqNnwFv7M+uqZProkdlZ8i8yF4efWK9tIYNl1QKNBeMeB96rboJ
         S2Q72ZwU/GrstWmtVA6k0sNzA4QhnGxspf34obV/w8DoKrMarw9Rpvm1Lkra9V+12qBX
         9am0GEtoGuMZHfS4p9jVl6eCeAChh72U0PG3ywDiMTNsb+nUE3gnvkN/7Bb4GsPLb8So
         zkLHmA5JV9p1rkeDokZ+ZSMekKP1EgFTNsCMI0btZUZgvRyZmCo3jEgpsfJR+/POPn1C
         COtw==
X-Gm-Message-State: ABuFfoi4F4H2TLQr8u0Am6VT1MxiGLTcSp2fcE7JaVwofvzsNxBivJds
        aZyE+JrEZAd6v1NbMVd8vu3K03Vms+w=
X-Google-Smtp-Source: ACcGV61CbYi+gflLdz5Nia99KIF5T4g9v62OzVfZnt+cIHe9yN6/HQTIy1ewdl6j83S1K/p9Bt7hrQ==
X-Received: by 2002:a17:902:728e:: with SMTP id d14-v6mr14695117pll.51.1539552609764;
        Sun, 14 Oct 2018 14:30:09 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id h6-v6sm10828804pgn.84.2018.10.14.14.30.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Oct 2018 14:30:08 -0700 (PDT)
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
Subject: [PATCH RFC] doc: rcu: remove obsolete (non-)requirement about disabling preemption
Date:   Sun, 14 Oct 2018 14:29:55 -0700
Message-Id: <20181014212955.95267-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Requirements.html document says "Disabling Preemption Does Not Block
Grace Periods". However this is no longer true with the RCU
consolidation. Lets remove the obsolete (non-)requirement entirely.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../RCU/Design/Requirements/Requirements.html | 50 -------------------
 1 file changed, 50 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.html b/Documentation/RCU/Design/Requirements/Requirements.html
index 7efc1c1da7af..4fae55056c1d 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.html
+++ b/Documentation/RCU/Design/Requirements/Requirements.html
@@ -900,8 +900,6 @@ Except where otherwise noted, these non-guarantees were premeditated.
 	Grace Periods Don't Partition Read-Side Critical Sections</a>
 <li>	<a href="#Read-Side Critical Sections Don't Partition Grace Periods">
 	Read-Side Critical Sections Don't Partition Grace Periods</a>
-<li>	<a href="#Disabling Preemption Does Not Block Grace Periods">
-	Disabling Preemption Does Not Block Grace Periods</a>
 </ol>
 
 <h3><a name="Readers Impose Minimal Ordering">Readers Impose Minimal Ordering</a></h3>
@@ -1259,54 +1257,6 @@ of RCU grace periods.
 <tr><td>&nbsp;</td></tr>
 </table>
 
-<h3><a name="Disabling Preemption Does Not Block Grace Periods">
-Disabling Preemption Does Not Block Grace Periods</a></h3>
-
-<p>
-There was a time when disabling preemption on any given CPU would block
-subsequent grace periods.
-However, this was an accident of implementation and is not a requirement.
-And in the current Linux-kernel implementation, disabling preemption
-on a given CPU in fact does not block grace periods, as Oleg Nesterov
-<a href="https://lkml.kernel.org/g/20150614193825.GA19582@redhat.com">demonstrated</a>.
-
-<p>
-If you need a preempt-disable region to block grace periods, you need to add
-<tt>rcu_read_lock()</tt> and <tt>rcu_read_unlock()</tt>, for example
-as follows:
-
-<blockquote>
-<pre>
- 1 preempt_disable();
- 2 rcu_read_lock();
- 3 do_something();
- 4 rcu_read_unlock();
- 5 preempt_enable();
- 6
- 7 /* Spinlocks implicitly disable preemption. */
- 8 spin_lock(&amp;mylock);
- 9 rcu_read_lock();
-10 do_something();
-11 rcu_read_unlock();
-12 spin_unlock(&amp;mylock);
-</pre>
-</blockquote>
-
-<p>
-In theory, you could enter the RCU read-side critical section first,
-but it is more efficient to keep the entire RCU read-side critical
-section contained in the preempt-disable region as shown above.
-Of course, RCU read-side critical sections that extend outside of
-preempt-disable regions will work correctly, but such critical sections
-can be preempted, which forces <tt>rcu_read_unlock()</tt> to do
-more work.
-And no, this is <i>not</i> an invitation to enclose all of your RCU
-read-side critical sections within preempt-disable regions, because
-doing so would degrade real-time response.
-
-<p>
-This non-requirement appeared with preemptible RCU.
-
 <h2><a name="Parallelism Facts of Life">Parallelism Facts of Life</a></h2>
 
 <p>
-- 
2.19.0.605.g01d371f741-goog

