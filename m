Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2B8F27D581
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 18:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbeIZAfL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 20:35:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41564 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbeIZAfL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 20:35:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id z3-v6so7191289pgv.8
        for <linux-doc@vger.kernel.org>; Tue, 25 Sep 2018 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XVYEKlTIExHm59BmL+jH8IjUcY1uTbAH49/iOVh5nJA=;
        b=lfC0f2knKosFw7moj42GCPTjxNrwqRvoD1wpqog58i8uDX+z2eWy3wft7uCfdx2gDF
         lPutq220jnfImnbQfarEYFWRUbKMw6vlDj4/SEZbjRwn76dlm01sgjy0sALg9bEeY6I0
         k8vzuMiTtjzDv/e33NnZcbr5qG6JBIukUnunM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XVYEKlTIExHm59BmL+jH8IjUcY1uTbAH49/iOVh5nJA=;
        b=cUwxMzrSRx0HjIHU28KrtDyPQ5jWMANANn3ZOh7EFdv65/q9F8Il19jkeCHTltwipW
         ur+yB6J9hEFl4i1WQ3+HU0DYzZ4q/TmxThJa+PHkHsh85loaiuESII/tw8mw809Eybp0
         IkvINmEvqUXsJqE2E7HgyvhX4Bksg1RVTf0iNE9krSbZWNvfpEBqVrUTFZrPaXXAARi1
         Lt4dj8uuHDXsjVxGB6Pkwfp7f/So+jz9MJ1U6HjIUEDLgJJVar9MiVgn1qaVeysSDttG
         j3mTnMdChvkgCQ83gUaTRS7egeenukJnyCxJIdP97/TnbmqjGvAzHOqrJRnR+Zs8BCt8
         eBRA==
X-Gm-Message-State: ABuFfoi1badesRTDudD5g5hRBsE9HKqGOs8d+z0sm4Kcj8J7NWKEw+NH
        AB0gtcUrPgRSB/hqRU/xCEHwhA==
X-Google-Smtp-Source: ACcGV61qdSQMphcIKHOK27wS2izqV4exTH78zfs6/rxLpydCWDF+okTqceetw5AGDKkgWkgk5Td8XQ==
X-Received: by 2002:a62:b604:: with SMTP id j4-v6mr2303898pff.199.1537899984515;
        Tue, 25 Sep 2018 11:26:24 -0700 (PDT)
Received: from joelaf-glaptop0.roam.corp.google.com (c-98-210-118-128.hsd1.ca.comcast.net. [98.210.118.128])
        by smtp.gmail.com with ESMTPSA id x70-v6sm6883626pfk.85.2018.09.25.11.26.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Sep 2018 11:26:22 -0700 (PDT)
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
Subject: [0/5] rcu doc updates
Date:   Tue, 25 Sep 2018 11:25:56 -0700
Message-Id: <20180925182601.37421-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.444.g18242da7ef-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Paul,
These patches are documentation updates for the rcu_dynticks rolling into
rcu_data and also the updates to the fact that there's a single rcu_state now.
Its based on your rcu/dev branch.

Next I'm thinking of tackling 'RCU Callback Handling' and further digging into
the dyntick handling and then dig into other documents outside of
Data-Structure that need updates. But let me know any suggestions.
Thanks!

Joel Fernandes (Google) (5):
  doc: rcu: Update information about resched_cpu
  doc: rcu: Remove rcu_dynticks from Data-Structures
  doc: rcu: Update Data-Structures for RCU flavor consolidation
  doc: rcu: Clarify better the rcu_segcblist len field
  doc: rcu: Update description of gp_seq fields in rcu_data

 .../Data-Structures/BigTreeClassicRCUBH.svg   | 499 -----------
 .../BigTreeClassicRCUBHdyntick.svg            | 695 ---------------
 .../BigTreePreemptRCUBHdyntick.svg            | 741 ----------------
 .../BigTreePreemptRCUBHdyntickCB.svg          | 834 +++++++-----------
 .../Data-Structures/Data-Structures.html      | 152 +---
 .../RCU/Design/Data-Structures/blkd_task.svg  | 676 +++++---------
 .../Expedited-Grace-Periods.html              |   6 +-
 7 files changed, 596 insertions(+), 3007 deletions(-)
 delete mode 100644 Documentation/RCU/Design/Data-Structures/BigTreeClassicRCUBH.svg
 delete mode 100644 Documentation/RCU/Design/Data-Structures/BigTreeClassicRCUBHdyntick.svg
 delete mode 100644 Documentation/RCU/Design/Data-Structures/BigTreePreemptRCUBHdyntick.svg

-- 
2.19.0.444.g18242da7ef-goog


