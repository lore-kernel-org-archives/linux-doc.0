Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFD5C77B7A
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 13:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjE3Nze (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 09:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbjE3Nze (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 09:55:34 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE07AEA
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 06:55:32 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-626117a8610so14735976d6.1
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685454932; x=1688046932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSS96BQmp/orj0veigjn/MG+4No9KgOkSEIBHXDxWNk=;
        b=nQyentgTue7+lWz00xktFPfo45ahUAyYxIrD7TRCr5XvjtrprXD6x3GejfX+F64zmP
         wFgszkowqam8yjAXwH5pjAVuIrNDnqCZwPTlkeUutU3qxRrR6/Ga707aT4xP2uQp/Xxr
         ZIM3rkMiN0uibjTZNA9YpOgPkFCQXG4i1Mi0u3z35yBzfkjbHF1XobjD+XlLyr6oQfQ6
         +5jlpLgzKkUT3N7E3GQVVeTkluZ2zyNWKUVwsvPlUWmRtZs5ijliG6NNzeamTqXqQwwo
         Xf1POkN9OlG8jSHzmkbQ2vkj73TRM84ZlPkqLMFA832QZuNKszAA57sq8qgjsr2h9IPL
         /fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685454932; x=1688046932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSS96BQmp/orj0veigjn/MG+4No9KgOkSEIBHXDxWNk=;
        b=GInLTOdmFP3K7/T02hd4swPwgFQERcfmCjjhX/r6il0FX0axmYj0eWvPxAYrjOaNqJ
         6yJ4W+01H/OMfC/F7GsYPJtkrflOznrPpCjmAF1DCtneCxeR1ONOWi0cQn2BcVyIXBNa
         fSvUxn8cCoqZaF0cujA9Tp2g9Ga6s1bSrz8ZiuCoIQ5TybUwFnWIT1aJAmKj3YEk0peo
         P1H62Ucgps0XwxwZOWLv6KkO1y2YcfMUrFNctNaaIG5VwF0LujT7fHB3uCJOy03j2whR
         WZ7+Jq2Yxfy7OB73t5CLeh9r5ubfYx2JfU23efHoU0VYXt9JxXy+uZRyztHTSzY7cmNz
         iswg==
X-Gm-Message-State: AC+VfDzbV1QdH22jdswBcnYDNAMWCD9IUnjk6zZl6dH7TCDDc5z+iMQi
        w3m1wSmTBKFU4hjWSNtCMiQe/CUGlXbMOhLNIuyybg==
X-Google-Smtp-Source: ACHHUZ4HGmG9UVJRljVDJw5k+9dXUnZxA01/wBQn72HUyv0GiGCkKl5WWl/q8SD7cwN90DQ8akUSNg==
X-Received: by 2002:a05:6214:529a:b0:621:48be:baa8 with SMTP id kj26-20020a056214529a00b0062148bebaa8mr1866832qvb.48.1685454931816;
        Tue, 30 May 2023 06:55:31 -0700 (PDT)
Received: from vinz16.lan (c-73-143-21-186.hsd1.vt.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id u6-20020ae9c006000000b0074d4cf8f9fcsm527809qkk.107.2023.05.30.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:55:31 -0700 (PDT)
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
Subject: [PATCH v5 2/2] sched/deadline: Update GRUB description in the documentation
Date:   Tue, 30 May 2023 09:55:26 -0400
Message-Id: <20230530135526.2385378-2-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530135526.2385378-1-vineeth@bitbyteword.org>
References: <20230530135526.2385378-1-vineeth@bitbyteword.org>
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
index 9d9be52f221a..9fe4846079bb 100644
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

