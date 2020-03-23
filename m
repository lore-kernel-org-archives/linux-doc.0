Return-Path: <SRS0=kJSq=5I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF2AC1975A
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 01:57:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D56DD20732
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 01:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="LKskb9/q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgCWB54 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 22 Mar 2020 21:57:56 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:35569 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgCWB5r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Mar 2020 21:57:47 -0400
Received: by mail-qk1-f194.google.com with SMTP id k13so2056586qki.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2020 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vz9xBYT7w2JZFqAtcJyqqCJgtO34i29+WCO4KTVtkB8=;
        b=LKskb9/qJnxs+ndLBRI6a2Qvn4blylgqfSDZDNHlcfPrnXsyfOH+lvtJTl/4/hpMFZ
         ehZS19cQtTegYgR2LjnZPtCsQKUNC/VZ7WGPfwJnCLebkOze/3K6jTLYgwHpVxON6LKA
         ogda2WQ/xUnbauY8b7cNfrjtnYo/DoaCrYvko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vz9xBYT7w2JZFqAtcJyqqCJgtO34i29+WCO4KTVtkB8=;
        b=BywpIs/R7Doun1vAod2A0TehMIUBNcYxjXKHntd3L+TfoPngCMxAOcdMz4cvcwdYbD
         3gfprYSlPGZyOojMaxMyBkRwQLeoFYaNYmI4G+HD9MM+vZtH3QDcK9txs3lXQoKMIHCD
         XM2rwW+RjaSDjHHkEdXkvoBgTPqu/xrakKknAo747sj1v1SwTib127W5i5llYVhVhllG
         b//rZuNlqc6LGip70/PNO8qLNyLsoDKzMS6/haYN6JNzsxqIvXM3Btir3OZv0yAeq5Gi
         R1OHsRU4mwzn9dlgCt6krhnd5pFJmySCCsyRyS/VMP1przu/xt0BXoUtgvN6zu3MLXlv
         mTXw==
X-Gm-Message-State: ANhLgQ1AfezTLKNdqUgeZo43STgHU+Q2nssZdmdt0b+zKZGLB4gX1Hko
        Yff/O3uJDYOztiSBQr7/tWOm4w==
X-Google-Smtp-Source: ADFU+vt1yWrK2R2GI2UFyps1U5tV/pTHQam8GzIYyN4qfwwXi4mmjWSN2KEPsWPNu5U2UR1d7x9Ieg==
X-Received: by 2002:a37:8b01:: with SMTP id n1mr16659727qkd.407.1584928666324;
        Sun, 22 Mar 2020 18:57:46 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id e66sm10146233qkd.129.2020.03.22.18.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 18:57:46 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 4/4] MAINTAINERS: Update maintainers for new Documentaion/litmus-tests/
Date:   Sun, 22 Mar 2020 21:57:35 -0400
Message-Id: <20200323015735.236279-4-joel@joelfernandes.org>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
In-Reply-To: <20200323015735.236279-1-joel@joelfernandes.org>
References: <20200323015735.236279-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Also add me as Reviewer for LKMM. Previously a patch to do this was
Acked but somewhere along the line got lost. Add myself in this patch.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1d18cb5d186..fc38b181fdff9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9699,6 +9699,7 @@ M:	Luc Maranget <luc.maranget@inria.fr>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 R:	Akira Yokosawa <akiyks@gmail.com>
 R:	Daniel Lustig <dlustig@nvidia.com>
+R:	Joel Fernandes <joel@joelfernandes.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-arch@vger.kernel.org
 S:	Supported
@@ -9709,6 +9710,7 @@ F:	Documentation/atomic_t.txt
 F:	Documentation/core-api/atomic_ops.rst
 F:	Documentation/core-api/refcount-vs-atomic.rst
 F:	Documentation/memory-barriers.txt
+F:	Documentation/litmus-tests/
 
 LIS3LV02D ACCELEROMETER DRIVER
 M:	Eric Piel <eric.piel@tremplin-utc.net>
-- 
2.25.1.696.g5e7596f4ac-goog

