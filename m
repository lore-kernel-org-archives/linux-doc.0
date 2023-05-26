Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D44C77B7A
	for <linux-doc@archiver.kernel.org>; Fri, 26 May 2023 16:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243557AbjEZQK6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 May 2023 12:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244242AbjEZQK4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 May 2023 12:10:56 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F90A19D
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 09:10:52 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-75b00e5f8e4so62622485a.0
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685117451; x=1687709451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgIUzMFd0Wu4Ol9oHyv7Wf8bNpCQi48RTzTuWdj5viQ=;
        b=bMK3rSXUcwt/oyxOni/E1+aDrCvO8uQNH3a669+1l1G1buZyt4hmjxrxaQ9zyDYq0q
         3OJqmCIi9C1NJDTgt2RukX+DYxLTdJWJdhwAApMmf4CeM5Vx9uhxTahqdBdTePQrJzjU
         4vCLt5ttYoIYkO2vEX/QgG9TlpwKR28aP0Dp2qZoc2lDpu8Sy06WNbYOWQIpceVB+gEi
         iMcr68y4vy+xc2rr38ckDu2WusHEOJ/s+Q/b0eJQazEANf6QSgI1SLgsqBHQEte+1e7T
         aWL4cSYlBdmgq6Ud75RLBbQXE8icxar8Km59ZZ+MqZINkNY4Rp9/CuYOOH9qzmd4CxSq
         4bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685117451; x=1687709451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgIUzMFd0Wu4Ol9oHyv7Wf8bNpCQi48RTzTuWdj5viQ=;
        b=EkVruDdxDv7vnJ5cI9laoD5hy08QfvFnDYw+M+6qgHOKI3wS2OZ+C+swTowYQYsAjj
         NNWYeeBlBuXh6P3Dx6Jr2wwiy8IqHo5eoWsYaeMzdmldsatk1FxhOw/c9bQdJpezY/zt
         u3auTJWpX4U/MIzMzCOCN1V5j7nqxObDWK2OzX/RVtwlKt85MNWZAAFNif7ZfxDHnmNT
         dmx+k6Bw7m8UNT8MNOopFPtiKDBpODUyr1Xg3sz8f+ROFPRLUAbCAwuqJkIxpw1Lpb6P
         fOL7o7+K3o5fA86HndLtpXp9AQdKp3isAv3GPp8V13wSAVbmtdNc615XiYid0u+4BsON
         rkSQ==
X-Gm-Message-State: AC+VfDxOSWBM3xJdsE2rVMgrTVg7bTzdEb6tFJL6poiO2UQ2wg+osaEo
        49V4wwvRn0yxTTpZxc+jmuBCFA==
X-Google-Smtp-Source: ACHHUZ4+9YD+0XkjiRj7Leu8WRGwVaahM3SelZvLtApMojXLJADrIKSe/xMOJp+1TvDqXUmUNiZVfA==
X-Received: by 2002:a05:6214:c8d:b0:61b:5cba:5820 with SMTP id r13-20020a0562140c8d00b0061b5cba5820mr1886177qvr.50.1685117451360;
        Fri, 26 May 2023 09:10:51 -0700 (PDT)
Received: from vinz16.lan (c-73-143-21-186.hsd1.vt.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id l12-20020a056214028c00b0061b608dc4c1sm1303256qvv.94.2023.05.26.09.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 09:10:51 -0700 (PDT)
From:   Vineeth Pillai <vineeth@bitbyteword.org>
To:     luca.abeni@santannapisa.it, Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        youssefesmat@google.com,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>
Cc:     Vineeth Pillai <vineeth@bitbyteword.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v4 2/2] sched/deadline: Update GRUB description in the documentation
Date:   Fri, 26 May 2023 12:10:45 -0400
Message-Id: <20230526161045.2283530-1-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526145519.2282062-2-vineeth@bitbyteword.org>
References: <20230526145519.2282062-2-vineeth@bitbyteword.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the details of GRUB to reflect the updated logic.

Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
---
 Documentation/scheduler/sched-deadline.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index 9d9be52f221a..d9f9f10c2191 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -203,12 +203,15 @@ Deadline Task Scheduling
   - Total bandwidth (this_bw): this is the sum of all tasks "belonging" to the
     runqueue, including the tasks in Inactive state.
 
+  - Maximum usable bandwidth (max_bw): This is the maximum bandwidth usable by
+    deadline tasks and is currently set to the RT capacity.
+
 
  The algorithm reclaims the bandwidth of the tasks in Inactive state.
  It does so by decrementing the runtime of the executing task Ti at a pace equal
  to
 
-           dq = -max{ Ui / Umax, (1 - Uinact - Uextra) } dt
+           dq = -(max{ Ui, (Umax - Uinact - Uextra) } / Umax) dt
 
  where:
 
-- 
2.40.1

