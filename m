Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A97437DF8E
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 08:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754127AbeE1Ipp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 04:45:45 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:51779 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754029AbeE1Ipn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 04:45:43 -0400
Received: by mail-wm0-f68.google.com with SMTP id r15-v6so2510691wmc.1
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Lji3vyYRuIF5z4NfQhW1RnWAxHyPoIpzDIEswsoWVp4=;
        b=WW+eEcGyCWeBef21OlxgVGrVRY0JrUSYpwUYryP9DwNie2RnnC10cn/vF9cCOsDJnX
         RA6kiEYtWInbK1Y/AS/2rPsb7ZxXgmNdshKZAQk3kdQUBmHqbBDUE4pIau+SqgQmI8YE
         rNa6QaFMqBrNtyKPOCKcxm1icUtgeMb0MTLEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Lji3vyYRuIF5z4NfQhW1RnWAxHyPoIpzDIEswsoWVp4=;
        b=iiOTQvrn5GG38zBTRmyMaOXTOyA274W0PZ7hVEuSavabUf6hoHsbmxdBO931juN68c
         1DjNGwBpFXxFqG481P5Z8KFkRNQorUcR9lHUp9laEqClF7oHZPf8GnKXbU2Wvbj7urSb
         i9Tkrw5dHMK45rXJXDuvu7bPinpdb6mv4TU2UCJRik+h7oTNfbDS/Iz3SLDqjJrJdjK1
         V3na7msiNSDv+FEh4nyOIoa+nobyyWMp0BSOwiOGZkWBvdhCbpt5EAEZqVOfadZ6le0Z
         0YKil++PezAmuBdo7prdg+B9xrBr00KpH51jNj/LzPOBBM8y7itDQoc5pfBDr5ICilrk
         ha8g==
X-Gm-Message-State: ALKqPwe0sd4qo2uMh0fAkmMkY+MIoMH5TpcXuaKekJwcYd8ES8TMejzf
        MSPGYPge4JgPN/VY/BRJSbZ2Sa78Zz8=
X-Google-Smtp-Source: ADUXVKKUubwAJi1bK/XminLYjfDaz4v8Mbcqxw7xV7eVmNehtPHg+zwA4GcLljNqReqE3y38ssk8Ug==
X-Received: by 2002:a1c:a54e:: with SMTP id o75-v6mr1723268wme.157.1527497142290;
        Mon, 28 May 2018 01:45:42 -0700 (PDT)
Received: from localhost.localdomain ([45.76.138.171])
        by smtp.gmail.com with ESMTPSA id 123-v6sm21783013wmt.19.2018.05.28.01.45.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 May 2018 01:45:41 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Robert Walker <Robert.Walker@arm.com>, mike.leach@linaro.org,
        kim.phillips@arm.co, Tor Jeremiassen <tor@ti.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        Leo Yan <leo.yan@linaro.org>
Subject: [RFT v3 1/4] perf cs-etm: Generate branch sample for missed packets
Date:   Mon, 28 May 2018 16:45:00 +0800
Message-Id: <1527497103-3593-2-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit e573e978fb12 ("perf cs-etm: Inject capabilitity for CoreSight
traces") reworks the samples generation flow from CoreSight trace to
match the correct format so Perf report tool can display the samples
properly.

But the change has side effect for branch packet handling, it only
generate branch samples by checking previous packet flag
'last_instr_taken_branch' is true, this results in below three kinds
packets are missed to generate branch samples:

- The start tracing packet at the beginning of tracing data;
- The exception handling packet;
- If one CS_ETM_TRACE_ON packet is inserted, we also miss to handle it
  for branch samples.  CS_ETM_TRACE_ON packet itself can give the info
  that there have a discontinuity in the trace, on the other hand we
  also miss to generate proper branch sample for packets before and
  after CS_ETM_TRACE_ON packet.

This patch is to add branch sample handling for up three kinds packets:

- In function cs_etm__sample(), check if 'prev_packet->sample_type' is
  zero and in this case it generates branch sample for the start tracing
  packet; furthermore, we also need to handle the condition for
  prev_packet::end_addr is zero in the cs_etm__last_executed_instr();

- In function cs_etm__sample(), check if 'prev_packet->exc' is true and
  generate branch sample for exception handling packet;

- If there has one CS_ETM_TRACE_ON packet is coming, we firstly generate
  branch sample in the function cs_etm__flush(), this can save complete
  info for the previous CS_ETM_RANGE packet just before CS_ETM_TRACE_ON
  packet.  We also generate branch sample for the new CS_ETM_RANGE
  packet after CS_ETM_TRACE_ON packet, this have two purposes, the
  first one purpose is to save the info for the new CS_ETM_RANGE packet,
  the second purpose is to save CS_ETM_TRACE_ON packet info so we can
  have hint for a discontinuity in the trace.

  For CS_ETM_TRACE_ON packet, its fields 'packet->start_addr' and
  'packet->end_addr' equal to 0xdeadbeefdeadbeefUL which are emitted in
  the decoder layer as dummy value.  This patch is to convert these
  values to zeros for more readable; this is accomplished by functions
  cs_etm__last_executed_instr() and cs_etm__first_executed_instr().  The
  later one is a new function introduced by this patch.

Reviewed-by: Robert Walker <robert.walker@arm.com>
Fixes: e573e978fb12 ("perf cs-etm: Inject capabilitity for CoreSight traces")
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/util/cs-etm.c | 93 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 20 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 822ba91..8418173 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -495,6 +495,20 @@ static inline void cs_etm__reset_last_branch_rb(struct cs_etm_queue *etmq)
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
+	 * The packet is the CS_ETM_TRACE_ON packet if the end_addr is
+	 * magic number 0xdeadbeefdeadbeefUL, returns 0 for this case.
+	 */
+	if (packet->end_addr == 0xdeadbeefdeadbeefUL)
+		return 0;
+
+	/*
 	 * The packet records the execution range with an exclusive end address
 	 *
 	 * A64 instructions are constant size, so the last executed
@@ -505,6 +519,18 @@ static inline u64 cs_etm__last_executed_instr(struct cs_etm_packet *packet)
 	return packet->end_addr - A64_INSTR_SIZE;
 }
 
+static inline u64 cs_etm__first_executed_instr(struct cs_etm_packet *packet)
+{
+	/*
+	 * The packet is the CS_ETM_TRACE_ON packet if the start_addr is
+	 * magic number 0xdeadbeefdeadbeefUL, returns 0 for this case.
+	 */
+	if (packet->start_addr == 0xdeadbeefdeadbeefUL)
+		return 0;
+
+	return packet->start_addr;
+}
+
 static inline u64 cs_etm__instr_count(const struct cs_etm_packet *packet)
 {
 	/*
@@ -546,7 +572,7 @@ static void cs_etm__update_last_branch_rb(struct cs_etm_queue *etmq)
 
 	be       = &bs->entries[etmq->last_branch_pos];
 	be->from = cs_etm__last_executed_instr(etmq->prev_packet);
-	be->to	 = etmq->packet->start_addr;
+	be->to	 = cs_etm__first_executed_instr(etmq->packet);
 	/* No support for mispredict */
 	be->flags.mispred = 0;
 	be->flags.predicted = 1;
@@ -701,7 +727,7 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq)
 	sample.ip = cs_etm__last_executed_instr(etmq->prev_packet);
 	sample.pid = etmq->pid;
 	sample.tid = etmq->tid;
-	sample.addr = etmq->packet->start_addr;
+	sample.addr = cs_etm__first_executed_instr(etmq->packet);
 	sample.id = etmq->etm->branches_id;
 	sample.stream_id = etmq->etm->branches_id;
 	sample.period = 1;
@@ -897,13 +923,28 @@ static int cs_etm__sample(struct cs_etm_queue *etmq)
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
+		if (etmq->prev_packet->sample_type == 0 ||
+		    etmq->prev_packet->sample_type == CS_ETM_TRACE_ON)
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
@@ -922,11 +963,16 @@ static int cs_etm__sample(struct cs_etm_queue *etmq)
 static int cs_etm__flush(struct cs_etm_queue *etmq)
 {
 	int err = 0;
+	struct cs_etm_auxtrace *etm = etmq->etm;
 	struct cs_etm_packet *tmp;
 
-	if (etmq->etm->synth_opts.last_branch &&
-	    etmq->prev_packet &&
-	    etmq->prev_packet->sample_type == CS_ETM_RANGE) {
+	if (!etmq->prev_packet)
+		return 0;
+
+	if (etmq->prev_packet->sample_type != CS_ETM_RANGE)
+		return 0;
+
+	if (etmq->etm->synth_opts.last_branch) {
 		/*
 		 * Generate a last branch event for the branches left in the
 		 * circular buffer at the end of the trace.
@@ -939,18 +985,25 @@ static int cs_etm__flush(struct cs_etm_queue *etmq)
 		err = cs_etm__synth_instruction_sample(
 			etmq, addr,
 			etmq->period_instructions);
+		if (err)
+			return err;
 		etmq->period_instructions = 0;
+	}
 
-		/*
-		 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for
-		 * the next incoming packet.
-		 */
-		tmp = etmq->packet;
-		etmq->packet = etmq->prev_packet;
-		etmq->prev_packet = tmp;
+	if (etm->sample_branches) {
+		err = cs_etm__synth_branch_sample(etmq);
+		if (err)
+			return err;
 	}
 
-	return err;
+	/*
+	 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for
+	 * the next incoming packet.
+	 */
+	tmp = etmq->packet;
+	etmq->packet = etmq->prev_packet;
+	etmq->prev_packet = tmp;
+	return 0;
 }
 
 static int cs_etm__run_decoder(struct cs_etm_queue *etmq)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
