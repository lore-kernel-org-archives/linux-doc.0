Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61F0C433E6
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89E3064EE2
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhBFPJ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Feb 2021 10:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhBFPJZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Feb 2021 10:09:25 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4139C06178A
        for <linux-doc@vger.kernel.org>; Sat,  6 Feb 2021 07:08:46 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id a16so5077462plh.8
        for <linux-doc@vger.kernel.org>; Sat, 06 Feb 2021 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0KYgcuzRcK64FqZdfoaXMBAUKCaxi3vx19tf6c3rQi0=;
        b=mmXuJN/1tg0qNcFwFL8K90YVumJto5vA4Aiwf7H4x+s1UCkEoAip9nU0eISzHtWZ47
         moHRovyLLaZ5OAhm0qpe9dMPB0Ut9XFIR0iF4cr5rd7PZLkbdOeV+sCq3kKHCIZXlJbZ
         Ys8ziPbWrnSpPD7L9NjXdfdaj4GNFodCy4Xdav6ILq6aNi1TDpuFfV/cGgnSPUAGG2T9
         Mz3/WxY2R0FiwzjDbcNjLCmWdeA2uCTWeHhyAHlxNpPg8yXym/4z4F/yMMU/544mqqtZ
         MYqFk/JjryOaU1e0EH7e1g81buAUurR7D08f67iZVYut5JcLsiVYAK1gC1MnV/QBSVFe
         eJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0KYgcuzRcK64FqZdfoaXMBAUKCaxi3vx19tf6c3rQi0=;
        b=mLhXfKJakwjeABZ1cdE4LG+5wBCFNMYVsS6cbqTASMF8rvk8cAPnFqMZG8pqKn5otv
         VNxOhG6jnmiMyIxuF4vSaKvkixqIcGdR5qF+vQYfMD3IiKQCV+j3YU/8JL6bvHQG02EQ
         B3810GiwA7Dy76jGAnzzMCdqK7pf37Rx5KqGTmYF6PEAXxvYLYBmScB9CfoVlZkFm226
         8h5bRo94xOdpaqJ3UiO4lofBFw49EIIvaiEiqRK94EABJld4QrgeZ7IMpp5GgDYRtPNn
         jaBRf7xyyfT7CDj7rq5dQHmwPq9TgyPWGWbk7FX07pev5j+pWKsf5OSJMPB9k4h5H6AU
         KZFw==
X-Gm-Message-State: AOAM531ThcK4YUsfwpBW+qkujj3ylzNpDFHQWR91pJXfOwg0kq4s5b69
        7KgUY8XkxkDqnrKQUG4WUYVuCA==
X-Google-Smtp-Source: ABdhPJz+CVo/Ac3YMbjwwryPb+EY4OI5OLY0lEqJGPde2t+7ReFRP54LBWUUBaL1JZXJIdlJtFtmTg==
X-Received: by 2002:a17:90b:1081:: with SMTP id gj1mr9294709pjb.231.1612624126320;
        Sat, 06 Feb 2021 07:08:46 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id y3sm8723612pfr.125.2021.02.06.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 07:08:45 -0800 (PST)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Al Grant <al.grant@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 2/8] tools headers UAPI: Update tools' copy of linux/coresight-pmu.h
Date:   Sat,  6 Feb 2021 23:08:27 +0800
Message-Id: <20210206150833.42120-3-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206150833.42120-1-leo.yan@linaro.org>
References: <20210206150833.42120-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To get the changes in the commit:

  "coresight: etm-perf: Clarify comment on perf options".

Signed-off-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 tools/include/linux/coresight-pmu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/include/linux/coresight-pmu.h b/tools/include/linux/coresight-pmu.h
index b0e35eec6499..5dc47cfdcf07 100644
--- a/tools/include/linux/coresight-pmu.h
+++ b/tools/include/linux/coresight-pmu.h
@@ -10,11 +10,18 @@
 #define CORESIGHT_ETM_PMU_NAME "cs_etm"
 #define CORESIGHT_ETM_PMU_SEED  0x10
 
-/* ETMv3.5/PTM's ETMCR config bit */
-#define ETM_OPT_CYCACC  12
-#define ETM_OPT_CTXTID	14
-#define ETM_OPT_TS      28
-#define ETM_OPT_RETSTK	29
+/*
+ * Below are the definition of bit offsets for perf option, and works as
+ * arbitrary values for all ETM versions.
+ *
+ * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
+ * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
+ * directly use below macros as config bits.
+ */
+#define ETM_OPT_CYCACC		12
+#define ETM_OPT_CTXTID		14
+#define ETM_OPT_TS		28
+#define ETM_OPT_RETSTK		29
 
 /* ETMv4 CONFIGR programming bits for the ETM OPTs */
 #define ETM4_CFG_BIT_CYCACC	4
-- 
2.25.1

