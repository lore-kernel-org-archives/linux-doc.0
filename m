Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 723CB7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 10:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933051AbeF1KnJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 06:43:09 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:44037 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933033AbeF1KnI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 06:43:08 -0400
Received: by mail-wr0-f196.google.com with SMTP id p12-v6so4993006wrn.11
        for <linux-doc@vger.kernel.org>; Thu, 28 Jun 2018 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=S53wbi4mGoQLB+yRCebSoL1n+CCuc7cEeP7FibSh9rE=;
        b=qx3snv8+AxhBL3R84Z5M8Jey7cEWXuESEeYC59Eo+SNECYSHUVNHOUTXObVsSxx3Zt
         GWGC6PajqpORaoFS2PwWR2IGQ3Tx9X1G4VRzozmyquPHpTDyt+Y3uUACXVDADCUgPNOf
         HthvH5tQlkv7FIV9Y15AiNxivsosV1cjSFcmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S53wbi4mGoQLB+yRCebSoL1n+CCuc7cEeP7FibSh9rE=;
        b=SFClQvfwV2I2mHZAc4PZXsg86LVeA83LxbhD+LkhqD4eNbaxN49GP4Arjuz1UTmP5Y
         3QaKJGDwYXwP3l6aenmPcGtlf8Khz+U1cSTW3b+UMd5XfckJhSeJM9CUZ+vgvlBLRmjV
         1mBX486/mltbvKnkcSkX22E3g4TU19ysinPanEBy1szgnvjfkbGMLqgKOYn23ooFQ5OF
         We7diI8vzKHmSOvHPb9cfQ8iJ5zagjor/Yza/27Q4cSv0EQsAoHU+oBQ4UMsKgqlIApo
         1WuUxShoehN4RjWl2JB8kLdWARH0zQDYH+HfxEw8z6iHwyTm6jXp+0y2p1EFTEDIATyZ
         LJ7g==
X-Gm-Message-State: APt69E0Zr1GX0rOG9bWpaUMVuxQgFUOSRjHsSWxqlilcoVpAXPlTQuk8
        Q2Tp0ErjDupWh7o8wqjy1LrHpc52
X-Google-Smtp-Source: AAOMgpeQEvym5pp2CgUKHnRfTGBKTTY50tRykoyjaMkcvWOCJix3PEXjpTgF/RP1DdqFliay5gh8mA==
X-Received: by 2002:adf:99ea:: with SMTP id y97-v6mr8105898wrb.215.1530182587452;
        Thu, 28 Jun 2018 03:43:07 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id 14-v6sm9257298wmh.8.2018.06.28.03.43.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 03:43:06 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [PATCH 0/3] sched/locking/doc: Miscellaneous fixes
Date:   Thu, 28 Jun 2018 12:41:17 +0200
Message-Id: <1530182480-13205-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This is a follow-up on the discussion started in [1].

Applies on -rcu/dev.

Cheers,
  Andrea

[1] http://lkml.kernel.org/r/1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com

Andrea Parri (3):
  sched: Use smp_mb() in wake_woken_function()
  locking: Clarify requirements for smp_mb__after_spinlock()
  doc: Update wake_up() & co. memory-barrier guarantees

 Documentation/memory-barriers.txt | 43 ++++++++++++++++++------------
 include/linux/sched.h             |  4 +--
 include/linux/spinlock.h          | 25 ++----------------
 kernel/sched/completion.c         |  8 +++---
 kernel/sched/core.c               | 30 +++++++++------------
 kernel/sched/wait.c               | 55 ++++++++++++++++++---------------------
 6 files changed, 72 insertions(+), 93 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
