Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BB6C43381
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F78764E36
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhBFPKV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Feb 2021 10:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhBFPKC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Feb 2021 10:10:02 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87063C061794
        for <linux-doc@vger.kernel.org>; Sat,  6 Feb 2021 07:08:53 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id a16so5077558plh.8
        for <linux-doc@vger.kernel.org>; Sat, 06 Feb 2021 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MYsvbHKaWJFqmZk3Q9+ksW0atKxTMG3xftJaoncz8gs=;
        b=dNGP/2hlQACIFVgVqAZpcOMCki2v+66EQ8TBrZ0HkGU1vdF4megfua9P0HKGvpNazw
         GTb08ugdsqG+adcVgSFXLmRI4zB275pVV9Fe4RTFrxuqmVs/kptl/g+ugvPMrj03PEoY
         Zr2mA69d6sQIZHak0J1XmTDzsUGGstX31y37iYBvxpDOl7EvUd/+o0oA31eRPlHTB0Mq
         y8lzyTW+b18AIspZlpPPbixXmhjY6PhEN+Hrgi6RluDpznis0mF95vjrRvB0IdVz3WPn
         WYOWlwsw+Zf488V4rIABms4TCm80huXZD3GaVla75qIRHfTkppCzAmy1KNa7TLKftTfx
         eNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MYsvbHKaWJFqmZk3Q9+ksW0atKxTMG3xftJaoncz8gs=;
        b=kg9PS5ib2OknkAE2r1WZefHwIMR76om2sRo+y7LthU8/raj0rbui+C3d4XyFyDBVXA
         rBg9+7RpdyteMfFGoN+mlyfA9v2NYE+TRGY1s5CN0LGaiqSrgZ2xdVBKXI7sj8oSCAul
         +wQ3It1vbbWyFSIn2jRzjMUetzby/UpCOtb6PGqESZtRKpbeDZCqRL7YH37nwBO5gnvz
         onVQeKO/pS9JiC8Q7ggkV6tvvIyTSK0vx3Z2xNng+v67VcajwYoxITOgO8zlo9mOpyHD
         cTq5M83f2e4qV8cfDIC8V6cpWLXWoe0BbEsrCkoXVmWI9lACRWf3a8E11xsy67YeGSMP
         KnMg==
X-Gm-Message-State: AOAM532X5+2xv5tU73t5sA1fK6hrxhew9oZmrJ2ZOS/TNPhJCOmMFy6/
        yVXxGIYDQFKla4ck0reTn7o75w==
X-Google-Smtp-Source: ABdhPJy5Kt2RYWfoS5BP+one494ix3rqIBAWlKT0wTwuY4x0rPYFzi1BDUE/E0AOrgyBFjSsr2UDjA==
X-Received: by 2002:a17:90a:f0c7:: with SMTP id fa7mr8463150pjb.201.1612624133053;
        Sat, 06 Feb 2021 07:08:53 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id x17sm13394623pff.180.2021.02.06.07.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 07:08:52 -0800 (PST)
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
Subject: [PATCH v3 4/8] perf cs-etm: Fix bitmap for option
Date:   Sat,  6 Feb 2021 23:08:29 +0800
Message-Id: <20210206150833.42120-5-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206150833.42120-1-leo.yan@linaro.org>
References: <20210206150833.42120-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Suzuki K Poulose <suzuki.poulose@arm.com>

When set option with macros ETM_OPT_CTXTID and ETM_OPT_TS, it wrongly
takes these two values (14 and 28 prespectively) as bit masks, but
actually both are the offset for bits.  But this doesn't lead to
further failure due to the AND logic operation will be always true for
ETM_OPT_CTXTID / ETM_OPT_TS.

This patch defines new independent macros (rather than using the
"config" bits) for requesting the "contextid" and "timestamp" for
cs_etm_set_option().

[leoy: Extract the change as a separate patch for easier review]
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index bd446aba64f7..c25c878fd06c 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -156,6 +156,10 @@ static int cs_etm_set_timestamp(struct auxtrace_record *itr,
 	return err;
 }
 
+#define ETM_SET_OPT_CTXTID	(1 << 0)
+#define ETM_SET_OPT_TS		(1 << 1)
+#define ETM_SET_OPT_MASK	(ETM_SET_OPT_CTXTID | ETM_SET_OPT_TS)
+
 static int cs_etm_set_option(struct auxtrace_record *itr,
 			     struct evsel *evsel, u32 option)
 {
@@ -169,17 +173,17 @@ static int cs_etm_set_option(struct auxtrace_record *itr,
 		    !cpu_map__has(online_cpus, i))
 			continue;
 
-		if (option & ETM_OPT_CTXTID) {
+		if (option & ETM_SET_OPT_CTXTID) {
 			err = cs_etm_set_context_id(itr, evsel, i);
 			if (err)
 				goto out;
 		}
-		if (option & ETM_OPT_TS) {
+		if (option & ETM_SET_OPT_TS) {
 			err = cs_etm_set_timestamp(itr, evsel, i);
 			if (err)
 				goto out;
 		}
-		if (option & ~(ETM_OPT_CTXTID | ETM_OPT_TS))
+		if (option & ~(ETM_SET_OPT_MASK))
 			/* Nothing else is currently supported */
 			goto out;
 	}
@@ -406,7 +410,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		evsel__set_sample_bit(cs_etm_evsel, CPU);
 
 		err = cs_etm_set_option(itr, cs_etm_evsel,
-					ETM_OPT_CTXTID | ETM_OPT_TS);
+					ETM_SET_OPT_CTXTID | ETM_SET_OPT_TS);
 		if (err)
 			goto out;
 	}
-- 
2.25.1

