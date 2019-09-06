Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2F667D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Sep 2019 09:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391102AbfIFJeX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Sep 2019 05:34:23 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:35749 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388432AbfIFJeX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Sep 2019 05:34:23 -0400
Received: by mail-pf1-f201.google.com with SMTP id r7so4156677pfg.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Sep 2019 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=1BLM+8RkYf8/MndiCshul4/7LoT+5adDFDiSgd05Noc=;
        b=JxFjM4B7HKjIXBKRIn6+p0en4hhmFlji4b8vK7raPD/Ike5uXIXHdkDZ63rRW4MS/a
         i8EuuqGHx0z/83ENaRRGpWiOoV7Js3PVN0536iSop1tJ0dKjxB8iOXDceBFTjXh5F1WE
         EAc5rGKOk+/AuhyDDWEzpXSb4ac0yuXla3BoP726wGbAbU/ofZxQg1jj1jy7gIHoEFQR
         58oWNHr87R2d8MdFVTQMSdNF+Yacm0QKsyGCv9/LetG3N/HP/HSKopGuNn11x1XISZCo
         jEU5uCMrgQkZYufvBQFuaNLHWs7jj5U4w9xoKkCsF9sH9HPlNUnzH720dq98EZA5Vj4Y
         /i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=1BLM+8RkYf8/MndiCshul4/7LoT+5adDFDiSgd05Noc=;
        b=JHIEZbyVXU4Yq1FSGdngcTeLT+5/T1LzLlTCEKZfCCc3YQtm1e8d8i9M4q8Sl2EsJ4
         +3B8bueIPnU3tcXJr2IoTGAix0UQbYB9hpMGf1p4wepv0nrdIDhILB+5NzkOSo/FnbCI
         4gRZ7uneoEnYZuULGBpC/87lhYOK3rkgn1Xgv7WSGgi1COXyZ4Aiw7Zy7A5qjT3LWinQ
         dVSdKnwl87UvWfqiBRxWlD5wxxJqU6pXnzBRHKw8fqIGap7pPUR02RkX6+VTJnV4/x/R
         /H30RzH4ttSWhd0AwBkUQmWCvDhnsebMBp/N4PWEstrycuxtho5IsgoHzIU17QsjVAeS
         LnpQ==
X-Gm-Message-State: APjAAAWwVvh+rROGb5XxZdXDMqiR63bqTnKa+bkHDZkgdwh6dhgkeptb
        1ZEJX54GdXL0wZotCIWro8lQrKc=
X-Google-Smtp-Source: APXvYqx7ko7R6Jw2+USMRIzzf5uJvWlBnbcmCVVq5z31qVPuXUgOwzU1hY4T/cYiI/zyD5rKZ/AAMrs=
X-Received: by 2002:a65:5188:: with SMTP id h8mr7110393pgq.294.1567762461979;
 Fri, 06 Sep 2019 02:34:21 -0700 (PDT)
Date:   Fri,  6 Sep 2019 02:34:11 -0700
Message-Id: <20190906093412.233463-1-xii@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH 0/1] Add micro quanta scheduling class
From:   Xi Wang <xii@google.com>
To:     linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Paul Turner <pjt@google.com>, Ben Segall <bsegall@google.com>,
        linux-doc@vger.kernel.org, Xi Wang <xii@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a scheduling class that does one thing really well:
microsecond level scheduling granularity. There are many problems
It doesn=E2=80=99t solve, e.g. there is minimal mutlicore support. Context
switch and cache overheads are going to be higher but we found
benefits outweigh drawbacks for certain applications.

It can be used in two different but related ways:

Provide softirq like scheduling latency for kernel and userspace
threads. Somewhat safer and easier to use than both softirq and rt
classes - microsecond level time slicing means a microq task can share
a cpu with a cfs task and still maintain low scheduling latency. With
rt classes users often have to choose between starving cfs tasks (rt
bandwidht control not activated) and high rt tail latency (rt
bandwidth control activated).

When busy polling is desired, we can run the busy polling thread under
the microq class with less than 100% of allocated cpu bandwidth. The
response latency would still be low and some cpu cycles are recovered
from the busy polling loop - it is a middle ground between interrupt
driven and busy polling.


Xi Wang (1):
  sched: Add micro quanta scheduling class

 Documentation/scheduler/sched-microq.txt |  72 +++
 include/linux/sched.h                    |  12 +
 include/linux/sched/sysctl.h             |  12 +
 include/uapi/linux/sched.h               |   1 +
 init/Kconfig                             |  13 +
 kernel/sched/Makefile                    |   1 +
 kernel/sched/core.c                      | 138 ++++-
 kernel/sched/debug.c                     |  28 +
 kernel/sched/fair.c                      |   4 +-
 kernel/sched/microq.c                    | 750 +++++++++++++++++++++++
 kernel/sched/pelt.c                      |  30 +-
 kernel/sched/pelt.h                      |   6 +
 kernel/sched/rt.c                        |   6 +-
 kernel/sched/sched.h                     |  63 +-
 kernel/sysctl.c                          |  23 +
 15 files changed, 1135 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/scheduler/sched-microq.txt
 create mode 100644 kernel/sched/microq.c

--=20
2.23.0.187.g17f5b7556c-goog

