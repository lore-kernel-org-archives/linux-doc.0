Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2331F7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Aug 2019 19:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730911AbfH0TCK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Aug 2019 15:02:10 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45584 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfH0TCK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Aug 2019 15:02:10 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so13174235pgp.12
        for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2019 12:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=message-id:from:to:cc:subject:date:mime-version
         :content-transfer-encoding;
        bh=5J5ALFJFkpv7Xs4w8D18Z1Cn1zrt1Xws6/fBk8kZfIE=;
        b=N9cq1ZKagXv/qFb0Zp04dquOjBGdS+OZo912oiF3DrRIaW7/QgM3OaS785bVYHJulY
         P8kvZNKvEpQJIYFFRLCgg/N2dY4ccV0yCa9D+CAlyuJ+ODXMK5JVWdqcQar7rN27qbhz
         LO60YlB8QKon0WNBnt/iwWOBTZdMYnMu75hVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
         :content-transfer-encoding;
        bh=5J5ALFJFkpv7Xs4w8D18Z1Cn1zrt1Xws6/fBk8kZfIE=;
        b=WokLk4Tfe+A74HM2Izi/Xn9cjaYV3cCmE2pxALatM/du2faJG2brPG2Miq+FiicOSw
         aEkd4y6REH5/m1vF1gKL3ey7S5w/RoiW4uFdHg2mNEwVwgAZkSkCXZHJuzFpNIves6is
         /OaWF1RSytHtUkwChU5lBTNtxihpDZZVBMzj+XvOLkSOSOqI/HvCxjoSzHoW9a5OgSCn
         +2ueCiOcutDmfA399I7MODy8dyV5qF5T97k1DoKdt8eSISl2EFiag1et1WwuzLmBBSI+
         tIhRjYSmrnPa9Thyk/BETU8J5VUlKoYJ8k2WEjrCTfhpoNlTGHwJRrfEPnU6grkbu7Tn
         L8hA==
X-Gm-Message-State: APjAAAW0rQBuXOIUoKjIgNfZzwRRgzKyfFBbo1qk8NZgN0caW64vlehT
        XlrycXFcFrnOgzoHg5/TWAZqMg==
X-Google-Smtp-Source: APXvYqxBT+d283gfCpdPxzoqArn/obPfgyEpcu41H5D/uIJsObZOcwEz5IH3noZjFM5pE2Q4pX305Q==
X-Received: by 2002:aa7:946d:: with SMTP id t13mr28543476pfq.121.1566932529765;
        Tue, 27 Aug 2019 12:02:09 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id k14sm33196pfi.98.2019.08.27.12.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 12:02:08 -0700 (PDT)
Message-ID: <5d657e30.1c69fb81.54250.01dc@mx.google.com>
X-Google-Original-Message-ID: 156693247224727@cam.corp.google.com
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        byungchul.park@lge.com, Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>, kernel-team@android.com
Subject: [PATCH 0/5] kfree_rcu() additions for -rcu
Date:   Tue, 27 Aug 2019 15:01:54 -0400
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This is a series on top of the patch "rcu/tree: Add basic support for kfree_rcu() batching".

Link: http://lore.kernel.org/r/20190814160411.58591-1-joel@joelfernandes.org

It adds performance tests, some clean ups and removal of "lazy" RCU callbacks.

Now that kfree_rcu() is handled separately from call_rcu(), we also get rid of
kfree "lazy" handling from tree RCU as suggested by Paul which will be unused.
This also results in a nice negative delta as well.

Joel Fernandes (Google) (5):
rcu/rcuperf: Add kfree_rcu() performance Tests
rcu/tree: Add multiple in-flight batches of kfree_rcu work
rcu/tree: Add support for debug_objects debugging for kfree_rcu()
rcu: Remove kfree_rcu() special casing and lazy handling
rcu: Remove kfree_call_rcu_nobatch()

Documentation/RCU/stallwarn.txt               |  13 +-
.../admin-guide/kernel-parameters.txt         |  13 ++
include/linux/rcu_segcblist.h                 |   2 -
include/linux/rcutiny.h                       |   5 -
include/linux/rcutree.h                       |   1 -
include/trace/events/rcu.h                    |  32 ++--
kernel/rcu/rcu.h                              |  27 ---
kernel/rcu/rcu_segcblist.c                    |  25 +--
kernel/rcu/rcu_segcblist.h                    |  25 +--
kernel/rcu/rcuperf.c                          | 173 +++++++++++++++++-
kernel/rcu/srcutree.c                         |   4 +-
kernel/rcu/tiny.c                             |  29 ++-
kernel/rcu/tree.c                             | 145 ++++++++++-----
kernel/rcu/tree.h                             |   1 -
kernel/rcu/tree_plugin.h                      |  42 +----
kernel/rcu/tree_stall.h                       |   6 +-
16 files changed, 337 insertions(+), 206 deletions(-)

--
2.23.0.187.g17f5b7556c-goog

