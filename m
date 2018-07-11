Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 365197DE80
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 13:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbeGKNNa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 09:13:30 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33237 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732868AbeGKNN2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 09:13:28 -0400
Received: by mail-wm0-f68.google.com with SMTP id z6-v6so16111721wma.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Jul 2018 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SuV2RgMXtsFDr9YsO5D8IxTRhWziF/ZQhDgwiw6Xee0=;
        b=HgBgMQGi84YNzvzkjG8SHs8x+mm2d55CGR4kynd6pAs4gIN80lzHGeABdFfPdYf7mL
         sM5fidzjQTKIDGaN3ONlpntIRjguxIBvjH+VYkyT7Mn7N01ma7+M3HBIIzAx5yErQkx5
         LEdJtA0VeiwiGypF996C17UTfM8YIPP32YLGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SuV2RgMXtsFDr9YsO5D8IxTRhWziF/ZQhDgwiw6Xee0=;
        b=YYClg8aJvo+c8jtcMkhSMTEqF/P8SBL3gzF8TdOTKk/HE08dcmthBZlcHkgN4XZ+x8
         Lv4LuadjhWvLiHK0c837a1a7cBPl8OyfmFoXXN3zViY658S76opPLX9HGYeDQsjMuhAJ
         Z+k7xXWwRNOdw37pvzv4qhGl6jfXFX3j/ScTkog1KY+EH3jsyB4HiAjPJI6wttpbNzUD
         wVuTjbADWelTTjnhIsMGopv+yg+CNV9z2jqQRq5OlKYFnthRYvkbPepeZLfyFkA/fC0P
         mln+89Rg5ztfqMILdOSD94OLdp6zqUOYw2LA5WFZCJX1Vwn5roFy8gfhulnwr1dzHKF6
         XCCg==
X-Gm-Message-State: APt69E2gzvuRrMJ3o7uFoLt+CtB5mudmm92qh2cRAr5hVEalANuCDeaj
        RzY7ZYtXQXplP8X42k6cJ0nnLw==
X-Google-Smtp-Source: AAOMgpc4JpQ4244sq0m5ElDsZpWzU1Fgcc2kDvpuFZZ3odSzx1TXvE6Vb2W14q1emMDUaTI1OmOvQw==
X-Received: by 2002:a1c:ae8d:: with SMTP id x135-v6mr16952204wme.20.1531314550627;
        Wed, 11 Jul 2018 06:09:10 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id a13-v6sm2047283wrf.93.2018.07.11.06.09.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 06:09:10 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Andrea Parri <andrea.parri@amarulasolutions.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Will Deacon <will.deacon@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] doc: Replace smp_cond_acquire() with smp_cond_load_acquire()
Date:   Wed, 11 Jul 2018 15:08:50 +0200
Message-Id: <1531314530-11624-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531216943-6382-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1531216943-6382-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Amend commit 1f03e8d2919270 ("locking/barriers: Replace smp_cond_acquire()
with smp_cond_load_acquire()") by updating the documentation accordingly.
Also remove some obsolete information related to the implementation.

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Jade Alglave <j.alglave@ucl.ac.uk>
Cc: Luc Maranget <luc.maranget@inria.fr>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>
Cc: Daniel Lustig <dlustig@nvidia.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/memory-barriers.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index 0d8d7ef131e9a..c1d913944ad8b 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -471,8 +471,7 @@ And a couple of implicit varieties:
      operations after the ACQUIRE operation will appear to happen after the
      ACQUIRE operation with respect to the other components of the system.
      ACQUIRE operations include LOCK operations and both smp_load_acquire()
-     and smp_cond_acquire() operations. The later builds the necessary ACQUIRE
-     semantics from relying on a control dependency and smp_rmb().
+     and smp_cond_load_acquire() operations.
 
      Memory operations that occur before an ACQUIRE operation may appear to
      happen after it completes.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
