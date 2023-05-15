Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5961AC77B7F
	for <linux-doc@archiver.kernel.org>; Mon, 15 May 2023 02:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238134AbjEOC5c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 14 May 2023 22:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238124AbjEOC52 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 14 May 2023 22:57:28 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091CC10C8
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 19:57:23 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-61b5a653df7so108205876d6.0
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1684119442; x=1686711442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4tdcE/RlPPWlg6iAdXaGZNVyK5umvAOvUWDkEICJxo=;
        b=CNTtbniX5ayzxsMvoctpFjLHGEE0h7Mwjf0yymlINUH6gKYDnQ1m5IZYKjg0Oc+gG2
         syDzip1n9MiSkQqWdsm0gZPFjAZ/9aBWDKGPB8UIpxMiLLKCN6jQj5gjYZAEFoNd0Evx
         XuSh+r5jpkwLwGoHx6/OGKFw6l9CkOBa9FFvVDlOcFx1y0geuywkIeodEJid6bQfbDVC
         YkIibZQKlfP2OQ2BBQgwlvJlg1DlbNEYnax739vdtbNRHdK4fd1ad6JmqIiurHg4mO9T
         uJExQN/0X+lq8pi5aBEtXa1cZmbsZkzjQZLK3ICutISjlHY71dpqgse4ucQuJFYgQ2RF
         9G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684119442; x=1686711442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4tdcE/RlPPWlg6iAdXaGZNVyK5umvAOvUWDkEICJxo=;
        b=HKIeERsvwTfje4nDorp0aL1fE6y2FnQfv68wA/3dOoVSHFVWuREfy6cDj16YjRCjBF
         VdyVZtkA/SULPX2QoUaQZuSCyW4T5ZMprJkTZX6ZnHamet+E2pzGBWMkK3RIYD8SE0Ax
         Pad6mrDYTr2dK3Q9F0ppdsGDC07HYPZBnjRI36YUuFRtZtAB1bqWn5Ccbza2dpQNYzs0
         2pA6QuheZQTLaCOs1TFKiiCN3vgCNLOb++a+WMOJz6GbV/QfwUzEGFUoQJlDknrA8nCW
         qbxBIZcOrK8ltOUs5ygYgfmtWuONWDNAQ9Y7roIaL1bhUHavyhdTmnCTvis6oThZmn7j
         SuRQ==
X-Gm-Message-State: AC+VfDzp2yTWaRAztE6Rm8pY3QhinhTU8NNIaWBU5LzmHrXIBUIHprb2
        1zvP0zqP2zR/meOBc+cuB+0h8w==
X-Google-Smtp-Source: ACHHUZ660qreqvDu7gQa2+qBLGLh9equ+Ct//O/dm5dwfrkT1hABZpk/iUlwprRFgmtPkGvjWLz/7Q==
X-Received: by 2002:a05:6214:2a87:b0:621:3b88:7af2 with SMTP id jr7-20020a0562142a8700b006213b887af2mr31432034qvb.52.1684119442119;
        Sun, 14 May 2023 19:57:22 -0700 (PDT)
Received: from vinz16.lan (c-73-143-21-186.hsd1.ma.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id c3-20020a05620a134300b007339c5114a9sm2308994qkl.103.2023.05.14.19.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 19:57:21 -0700 (PDT)
From:   Vineeth Pillai <vineeth@bitbyteword.org>
To:     luca.abeni@santannapisa.it, Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>
Cc:     Vineeth Pillai <vineeth@bitbyteword.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 0/5] GRUB reclaiming fixes
Date:   Sun, 14 May 2023 22:57:11 -0400
Message-Id: <20230515025716.316888-1-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Current reclaim calculation for GRUB is a bit inaccurate and the
inaccuracy gets larger as the bandwidth of tasks becomes smaller.

There are couple of issues with the existing implementation:
 - Loss of precision in division due to rounding off.
 - Minor bug in the reclaim calculation.
 - In SMP, tasks with smaller reservation tend to reclaim less
   even if its the only task on a cpu.
 - Inaccuracy when normal deadline tasks and SCHED_FLAG_RECLAIM
   tasks share the cpu.

This patch series aims to fix the above mentioned issues.

Changes in v3
-------------
1. Split the fixes into multiple self contained patches
2. Cover letter.

Vineeth Pillai (5):
  sched/deadline: Fix bandwidth reclaim equation in GRUB
  sched/deadline: Fix reclaim inaccuracy with SMP
  sched/deadline: Remove unused variable extra_bw
  sched/deadline: Account for normal deadline tasks in GRUB
  Documentation: sched/deadline: Update GRUB description

 Documentation/scheduler/sched-deadline.rst |  28 ++--
 kernel/sched/deadline.c                    | 160 ++++++++++-----------
 kernel/sched/sched.h                       |  18 ++-
 3 files changed, 112 insertions(+), 94 deletions(-)

-- 
2.40.1

