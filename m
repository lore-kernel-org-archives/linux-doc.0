Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A8DC7EE23
	for <linux-doc@archiver.kernel.org>; Fri, 26 May 2023 14:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjEZOzs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 May 2023 10:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjEZOzr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 May 2023 10:55:47 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36A9E65
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 07:55:25 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6238200c584so5243676d6.3
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685112925; x=1687704925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVYdErQmwOcZHGzqxcaNnogi2GW6TYxbftez0/A27pg=;
        b=EXO2d4pePptGSQJTPQP12sseD7KyidWglTMGmjALxwMUzagRCgPcowS0J3GN0A2sc3
         +P23X5/urWmlhsoPq/HyO0c75DwjQjfrxgNmXvqvklf/cTzPhCJ1WGMjk6SIWxFyt/De
         q6ODrIFzxlxVMavr00m1w/mjpDioOSpZUL718NiJKt+kImczkPEZfHwYXZXeSCrrJF5V
         FhVacFG6se8JdGKy+WUHMXtGt18MEaXVC0JtZLxdSe2rxZf9oEoa3Qe/uNPqL3qdq2PU
         gbEFuQGxzcXsuj926i+9mhX+qxRZ7nbYWqMnIOEWi5VSBochUGK/LMCFyqiRhWWHrHs5
         lhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685112925; x=1687704925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVYdErQmwOcZHGzqxcaNnogi2GW6TYxbftez0/A27pg=;
        b=XFRQE55n7vGi8rFN7/a06EY4LqOHppP3Dq/uVKPHVQeUozxL1iawg6cKkvNAIuVSfX
         cKCpQ9UBc22jNDtDWF0cAMoB8urL0tOClypZOisZwl1aIlIOrkBOYo9l3olR3rR/IcdS
         oyUUvLcYcpNU0DBJHtIdlUCgmfBeGS1IZLCC+UpLVSRe5cAWAU7bl0+8OTPEDlnAe+GP
         eH5pSSX3jm+PJbmVjeEfhrSHAF94sgLMToSVIALqA/9vpy63LTUd+XV7kAmAv2mPOPLC
         5ARuCKYKetYLnBH+U94LoMIbwHsHzabEZHuLznjHW09BuW1TdenkNFMtJ58y9fFJY3GZ
         SBXw==
X-Gm-Message-State: AC+VfDwXSVVLXATg/hngL0y775E7/irY5rG2c7Xc2jyC6momxS7LN5e2
        rAZrZK6YPx0+YIBDZJHj1qAvew==
X-Google-Smtp-Source: ACHHUZ4RYOwCRRUN62Y58DuX0b6rsS6FxA9MqxAQyhV0Tb/kYaUd6kp3+It5e9sjqUMGyE2QnsS2zg==
X-Received: by 2002:a05:6214:242c:b0:625:83ab:8a42 with SMTP id gy12-20020a056214242c00b0062583ab8a42mr2284081qvb.46.1685112924905;
        Fri, 26 May 2023 07:55:24 -0700 (PDT)
Received: from vinz16.lan (c-73-143-21-186.hsd1.vt.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id q5-20020a0cfa05000000b0061b73e331b2sm1271455qvn.30.2023.05.26.07.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 07:55:24 -0700 (PDT)
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
Date:   Fri, 26 May 2023 10:55:19 -0400
Message-Id: <20230526145519.2282062-2-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526145519.2282062-1-vineeth@bitbyteword.org>
References: <20230526145519.2282062-1-vineeth@bitbyteword.org>
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
+           dq = -(max{ Ui, (1 - Uinact - Uextra) } / Umax) dt
 
  where:
 
-- 
2.40.1

