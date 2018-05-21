Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C4D787D085
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 08:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751688AbeEUIxq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 04:53:46 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:33033 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751657AbeEUIxm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 May 2018 04:53:42 -0400
Received: by mail-pl0-f66.google.com with SMTP id n10-v6so8422529plp.0
        for <linux-doc@vger.kernel.org>; Mon, 21 May 2018 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Bk0a/sYUU4Xt/JywC2m6whoF24x/XfBKep4NsctKs90=;
        b=UAJCw6T6rKfV2TJchHFp85vATrYc/5ZBgUZ7B7inN/s7RbXRc6RUYVG9iz5GR7iFp8
         DTb+BXsL0jOgMa7uBO/xrSp1lZI9g5PXA5g2Fy8YtF/n08s2nlq9T3/d6gT/i3RPkkim
         GN7BKLTBtN2Vitv4JaaaJJiuQ0QqIk9ZVQvH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Bk0a/sYUU4Xt/JywC2m6whoF24x/XfBKep4NsctKs90=;
        b=pDd6pLM2EK9zPs4nA/uNwSpCZMMrcfxT41rslGfGLQnsx+zberbnscxUH2lG4F+th8
         ufQH7/eMsVKPoD5onhAx0go5Uvz+iOaFfXNVc2uZvfqsHhJwBC8uHGJHqf4ZkLDgSVAl
         QjNKtQdL5MR4HsJM4RDltOT49iTIiFfan53c7CkSzntejpzZniPitPGPnqVUtRudOAgN
         u0bVUu1QYthNZuz3gwQRC2A6kSbS8RAw5S/ecSy8Zf5CbTo2Hstvpwr9QQ5fiLzvcQwx
         pPWbn78h8UURns848TNLHnHQet1RSE4fYxEtQ0pS3Z5fXLUrkhZtIQaTe9IwS6PrJpyq
         22/g==
X-Gm-Message-State: ALKqPwdwpegJQxTl2k6gSUcjFm60PMYTO3AmDiOSoxNFP3hVPV4rJr7H
        eBDeMkrQGGtvsBvhKw2rGFhtjw==
X-Google-Smtp-Source: AB8JxZp5xFRhgLXBvPl0v2l+N7VwXcmVdxFlSmLXYXu4uOYpyosaq/go0AYujvqH1A1b/2eQ8UGmKA==
X-Received: by 2002:a17:902:5382:: with SMTP id c2-v6mr19629122pli.335.1526892822128;
        Mon, 21 May 2018 01:53:42 -0700 (PDT)
Received: from localhost.localdomain (li1209-69.members.linode.com. [45.79.110.69])
        by smtp.gmail.com with ESMTPSA id 16-v6sm28553918pfq.115.2018.05.21.01.53.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 21 May 2018 01:53:40 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tor Jeremiassen <tor@ti.com>,
        mike.leach@linaro.org, kim.phillips@arm.com,
        Robert Walker <Robert.Walker@arm.com>,
        coresight@lists.linaro.org
Cc:     Leo Yan <leo.yan@linaro.org>, Mike Leach <mike.leach@arm.com>,
        Robert Walker <robert.walker@arm.com>
Subject: [RFT v2 1/4] perf cs-etm: Generate sample for missed packets
Date:   Mon, 21 May 2018 16:52:25 +0800
Message-Id: <1526892748-326-2-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
References: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit e573e978fb12 ("perf cs-etm: Inject capabilitity for CoreSight
traces") reworks the samples generation flow from CoreSight trace to
match the correct format so Perf report tool can display the samples
properly.  But the change has side effect for packet handling, it only
generate samples when 'prev_packet->last_instr_taken_branch' is true,
this results in the start tracing packet and exception packets are
dropped.

This patch checks extra two conditions for complete samples:

- If 'prev_packet->sample_type' is zero we can use this condition to
  get to know this is the start tracing packet; for this case, the start
  packet's end_addr is zero as well so we need to handle it in the
  function cs_etm__last_executed_instr();

- If 'prev_packet->exc' is true, we can know the previous packet is
  exception handling packet so need to generate sample for exception
  flow.

Fixes: e573e978fb12 ("perf cs-etm: Inject capabilitity for CoreSight traces")
Cc: Mike Leach <mike.leach@arm.com>
Cc: Robert Walker <robert.walker@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/util/cs-etm.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 822ba91..378953b 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -495,6 +495,13 @@ static inline void cs_etm__reset_last_branch_rb(struct cs_etm_queue *etmq)
 static inline u64 cs_etm__last_executed_instr(struct cs_etm_packet *packet)
 {
 	/*
+	 * The packet is the start tracing packet if the end_addr is zero,
+	 * returns 0 for this case.
+	 */
+	if (!packet->end_addr)
+		return 0;
+
+	/*
 	 * The packet records the execution range with an exclusive end address
 	 *
 	 * A64 instructions are constant size, so the last executed
@@ -897,13 +904,27 @@ static int cs_etm__sample(struct cs_etm_queue *etmq)
 		etmq->period_instructions = instrs_over;
 	}
 
-	if (etm->sample_branches &&
-	    etmq->prev_packet &&
-	    etmq->prev_packet->sample_type == CS_ETM_RANGE &&
-	    etmq->prev_packet->last_instr_taken_branch) {
-		ret = cs_etm__synth_branch_sample(etmq);
-		if (ret)
-			return ret;
+	if (etm->sample_branches && etmq->prev_packet) {
+		bool generate_sample = false;
+
+		/* Generate sample for start tracing packet */
+		if (etmq->prev_packet->sample_type == 0)
+			generate_sample = true;
+
+		/* Generate sample for exception packet */
+		if (etmq->prev_packet->exc == true)
+			generate_sample = true;
+
+		/* Generate sample for normal branch packet */
+		if (etmq->prev_packet->sample_type == CS_ETM_RANGE &&
+		    etmq->prev_packet->last_instr_taken_branch)
+			generate_sample = true;
+
+		if (generate_sample) {
+			ret = cs_etm__synth_branch_sample(etmq);
+			if (ret)
+				return ret;
+		}
 	}
 
 	if (etm->sample_branches || etm->synth_opts.last_branch) {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
