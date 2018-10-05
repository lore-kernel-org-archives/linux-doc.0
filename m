Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF89B7D082
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 23:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbeJFGTc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 02:19:32 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45604 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbeJFGTb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 02:19:31 -0400
Received: by mail-pf1-f194.google.com with SMTP id u12-v6so2606829pfn.12
        for <linux-doc@vger.kernel.org>; Fri, 05 Oct 2018 16:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GGAqxr0F89ju3bhRty+29lvrmYJBGdCM+Kjt6JTCbOI=;
        b=EFAyFhAV1BIxvRq2BYQcFC7zJBWdPRY8+Dtk9krt6Tv6dIJ3iL89lRCgci3eRjHyft
         rfLEW4y/Nu9xVp2GeUpsYoWBq5ExXwUwWQJ3K8IlA7rUaDGZEHQ9RDErxfx3JV0GH3dT
         qOqsY3xp5FSfc+blysbdDYDwbpBKvCzCFZOVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GGAqxr0F89ju3bhRty+29lvrmYJBGdCM+Kjt6JTCbOI=;
        b=TP4BSTAIul2cCVs9LUny31Ez75XGq75t0A8z8OiS+m44c2Enc5Mzr3SmiSePwe5iQA
         8ZBlUOGrmcTg5GGkqZRD+u4c6nVaiw/vf+w6DBFxZW5E4Orfk08IFm4aYlXTyv5HsmY+
         UD2TDCIQWtmLuEtaqd5HgNPtHaVK5aki8FStqAxcX2l04HsXV0oYiUqn1J0nmYBKYpO7
         50gZtFULzv0tKBaCMsudps3z+Xdtbc8ULEHv6C81yVF1cnIp8B5dAZ8cRrXSIitLAs3A
         BjeqpLDStJueEmqSAWrwYPqU3dWwO5VtACYa/hPqlOeIRtQHPKSUv07ZTTFS+yMVmb4x
         mCxQ==
X-Gm-Message-State: ABuFfojMTMdNZPfb8aIXvAqaZtFzZlJMLXRwQZyrt85vgOztdn7h+KC1
        SUDStGGG1HQyWKP52kxxykJ6Bw==
X-Google-Smtp-Source: ACcGV60FlVkU3W/TdcigKZUyjnqE4NCtHrOIHI5LmCEUTW1hliEJg/vKubOv/rtvuwG8yiUWiNvlnQ==
X-Received: by 2002:a65:47cb:: with SMTP id f11-v6mr12326568pgs.166.1538781516548;
        Fri, 05 Oct 2018 16:18:36 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id q76-v6sm16641028pfa.18.2018.10.05.16.18.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Oct 2018 16:18:35 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>, pantin@google.com
Subject: [PATCH RFC 5/5] doc: rcu: Encourage use of rcu_barrier in checklist
Date:   Fri,  5 Oct 2018 16:18:14 -0700
Message-Id: <20181005231815.170433-6-joel@joelfernandes.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20181005231815.170433-1-joel@joelfernandes.org>
References: <20181005231815.170433-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The checklist suggests rcu_barrier_bh for RCU-bh and similarly for
sched, however these APIs are now implemented as rcu_barrier itself due
to the RCU consolidation. It may also be removed in the future, so lets
correct the doc to encourage use of the rcu_barrier() API itself.
Similar changes are made in previous patches.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/checklist.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/RCU/checklist.txt b/Documentation/RCU/checklist.txt
index b90ad1b0665a..6f469864d9f5 100644
--- a/Documentation/RCU/checklist.txt
+++ b/Documentation/RCU/checklist.txt
@@ -442,8 +442,8 @@ over a rather long period of time, but improvements are always welcome!
 	You instead need to use one of the barrier functions:
 
 	o	call_rcu() -> rcu_barrier()
-	o	call_rcu_bh() -> rcu_barrier_bh()
-	o	call_rcu_sched() -> rcu_barrier_sched()
+	o	call_rcu_bh() -> rcu_barrier()
+	o	call_rcu_sched() -> rcu_barrier()
 	o	call_srcu() -> srcu_barrier()
 
 	However, these barrier functions are absolutely -not- guaranteed
-- 
2.19.0.605.g01d371f741-goog

