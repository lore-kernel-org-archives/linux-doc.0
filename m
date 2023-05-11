Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21E4C7EE23
	for <linux-doc@archiver.kernel.org>; Thu, 11 May 2023 01:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236946AbjEKBq4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 May 2023 21:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236915AbjEKBqx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 May 2023 21:46:53 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E4C5FDF
        for <linux-doc@vger.kernel.org>; Wed, 10 May 2023 18:46:51 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-3f392680773so21359271cf.0
        for <linux-doc@vger.kernel.org>; Wed, 10 May 2023 18:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1683769610; x=1686361610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJvYmXm5B2lTYrM3WjwxlAESJjR3R/vjXkyvaupYjYg=;
        b=NwdS1Y3aCM815RSGLcU06Wxi9rec4sESxDFoVOloO46AwEuYBW/zG/w5lhJmG2ho0S
         F136GoBUBVLp6N7v9d6a7lcuns7SBc9JgYaVlF6PoNoiWznQbc1fr+kNhX0rarXYlsVK
         9koHTradqf2hy8DtAS8yhLn5dPzT+hUXbafnzS9mexSL3W7NKCpV4d7+GYa8L2xdNsJ1
         32XAnP/btAk5bYMWCUwZr7OY6xYteqHADL+yTycslbXJFZoTXgC+tZRjyc6QzDvUuI3j
         P0VPMwX3vrwUCemgC8o8wlCFx4dlOL6a6UQV8JB7N3YDG1bynhXRPUBNO3NJG+Sh2ksh
         1d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683769610; x=1686361610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJvYmXm5B2lTYrM3WjwxlAESJjR3R/vjXkyvaupYjYg=;
        b=mDK+dAxE+zEnY9FXGwuo7UGRGnSq9d3oUAEz6uR4/YhzYw/SNBHLO/+xrG90n6INBK
         YXAjSHFBz/t+5/SXfR/64zHoHlcX+vr/LNmz/dqKNyWZkMvzol+9kMeRfO1IoOLU0EA5
         N4icUA7eYObbdoOsai9ysP3pLHm/iyg0tRwkM3IfmbJNsprEx38tsn9Y6EkiNQLiFIgU
         8l62sXNvmA2uYA4XqG+564PGzEPDguUZ65hADljNTTs8HH+IysBYA7tmND+bu8/MiRvF
         id1A1a8LnAehxF7Bh5w24vDTR/CtwofFmYOsKOcHIBZjC8wwKqet5uxFl+SPSFCATJn4
         WLaw==
X-Gm-Message-State: AC+VfDyufGsLxOxShBXJDgHTDnmhv/Di83ii2KWEQblMibAVZqe6lD/W
        gKve6GMJu+OiT6FBwKlcgPM2vQ==
X-Google-Smtp-Source: ACHHUZ65yr5ibNguV927INNcO+pktHgRK8tmz86QYfxirzF3gn1lyNc0Wwj5g4z8ZeHTEpp1i7iU+w==
X-Received: by 2002:a05:622a:14ca:b0:3f4:917f:acf3 with SMTP id u10-20020a05622a14ca00b003f4917facf3mr6008625qtx.35.1683769610148;
        Wed, 10 May 2023 18:46:50 -0700 (PDT)
Received: from vinz16.lan (c-73-143-21-186.hsd1.ma.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id k12-20020ae9f10c000000b0074e3cf3b44dsm4316599qkg.125.2023.05.10.18.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 18:46:49 -0700 (PDT)
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
        Jonathan Corbet <corbet@lwn.net>,
        "Bagas Sanjaya linux-kernel @ vger . kernel . org" 
        <bagasdotme@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] Documentation: sched/deadline: Update GRUB description
Date:   Wed, 10 May 2023 21:46:25 -0400
Message-Id: <20230511014625.3443409-2-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511014625.3443409-1-vineeth@bitbyteword.org>
References: <20230511014625.3443409-1-vineeth@bitbyteword.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the details of GRUB to reflect the updated logic.

Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
---
 Documentation/scheduler/sched-deadline.rst | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index 9d9be52f221a..0c73f07f712d 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -195,11 +195,15 @@ Deadline Task Scheduling
       its utilization is added to the active utilization of the runqueue where
       it has been enqueued.
 
- For each runqueue, the algorithm GRUB keeps track of two different bandwidths:
+ For each runqueue, the algorithm GRUB keeps track of three different bandwidths:
 
   - Active bandwidth (running_bw): this is the sum of the bandwidths of all
     tasks in active state (i.e., ActiveContending or ActiveNonContending);
 
+  - Active bandwidth of SCHED_FLAG_RECLAIM tasks(reclaim_bw): this is the sum of
+    bandwidth of all tasks in active state which participates in GRUB. This is a
+    subset of running_bw and is needed for reclaimable bandwidth calculation.
+
   - Total bandwidth (this_bw): this is the sum of all tasks "belonging" to the
     runqueue, including the tasks in Inactive state.
 
@@ -209,12 +213,12 @@ Deadline Task Scheduling
  to
 
            dq = -max{ Ui / Umax, (1 - Uinact - Uextra) } dt
+           dq = -(Ureclaim / (Uextra + Uinact + Ureclaim)) dt
 
  where:
 
-  - Ui is the bandwidth of task Ti;
-  - Umax is the maximum reclaimable utilization (subjected to RT throttling
-    limits);
+  - Ureclaim is the (per runqueue) bandwidth of all SCHED_FLAG_RECLAIM tasks
+    in active state;
   - Uinact is the (per runqueue) inactive utilization, computed as
     (this_bq - running_bw);
   - Uextra is the (per runqueue) extra reclaimable utilization
@@ -222,7 +226,8 @@ Deadline Task Scheduling
 
 
  Let's now see a trivial example of two deadline tasks with runtime equal
- to 4 and period equal to 8 (i.e., bandwidth equal to 0.5)::
+ to 4 and period equal to 8 (i.e., bandwidth equal to 0.5). Tasks are
+ allowed to use the whole cpu(Umax = 1)::
 
          A            Task T1
          |
@@ -244,7 +249,7 @@ Deadline Task Scheduling
          0   1   2   3   4   5   6   7   8
 
 
-         A            running_bw
+         A            reclaim_bw
          |
        1 -----------------               ------
          |               |               |
@@ -272,7 +277,7 @@ Deadline Task Scheduling
 
     This is the 0-lag time for Task T1. Since it didn't woken up in the
     meantime, it enters the Inactive state. Its bandwidth is removed from
-    running_bw.
+    running_bw and reclaim_bw.
     Task T2 continues its execution. However, its runtime is now decreased as
     dq = - 0.5 dt because Uinact = 0.5.
     Task T2 therefore reclaims the bandwidth unused by Task T1.
@@ -280,7 +285,7 @@ Deadline Task Scheduling
   - Time t = 8:
 
     Task T1 wakes up. It enters the ActiveContending state again, and the
-    running_bw is incremented.
+    running_bw and reclaim_bw are incremented.
 
 
 2.3 Energy-aware scheduling
-- 
2.40.1

