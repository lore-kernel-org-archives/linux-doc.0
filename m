Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879127;
	b=oYkCqbUFZj1uFdaJJ6AoPqW6z+/U2BC9vbTxDUGU4ujXiGFoGJcrhbZiHpcxnyVgP6kh
	 TQZ4sLFem9uAkI+j2VYjEujnM/2HAyZpiWhplaZMfWr4j2f/vbdF0FtzG/ZploUG/5A0W
	 ZSuRCG4avPlsO0OsbWdNNKdLxTmiYI0moheCDyOegwvJYY1E8PLjSAbAj7gI58aRD1O5V
	 bPMTe16rOWoWrMhEXTl3VaS7hEm6Ir2XNTBoWR2Dpwqvltbu6DOceEBOQvRvGtt0zWmXT
	 fhq/bi0A3Tva/k4sg3Da5jTU/mKwaML6AIwv7uLCT2r6Ei9EiIRZEVPh6VeydPsffUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=;
	b=3/VSNdNLqPTbtEKUZ55sM/1bDoHrpdhcQC0GFLSCe7HHzJ6ACRJUPFHsEtzMxjmchZBL
	 88Uc+VMB646/fyg+yKXM2q9RxXyL1PKvEG3XoPdIfwBOQb21laHNjOOc87Dc7R1fmf/xd
	 JmnCYJUV/FJvhBD49LwVcwNPV9wizAdjNf6uvOeQHwsb/Lb/CMvrmFBiQoPD5jcoMnyFR
	 /6aXNN828cCe0lOHY2/1Bo5xDa3Lhwht134D77PEEnGElnh8CJTf9ZtXKLCMrfLs6Jpfv
	 cRBI8vau360/eYcB8or3y4OmS/oov3lpWIQ2rew0mEDbIUrakNBqeu7CYbevxiQXXbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gJwHVSFi;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B0E60A2611
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B0E60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gJwHVSFi
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4919a880834so270574f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879124; x=1794483924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=;
        b=gJwHVSFiXARZWgQjVK1PPIL6vPBMS2i1wPbOV+zqI9mACph1+7aM9GK3EDwBJ24wYw
         wTQYetRpiRptJE+REiIsdJYDDnv8x4yNETJxmCM8iKduVQi0Y96I7J0Sb3rhMEMn/olj
         Uzt44eQWS6SQdokSKtOEtU31jevi4xpN+qp6WZ12TrZc1dIHJTtEIFTL1eu+/zP2VEhL
         yfNxNWXqIfS7btzT2nL/kX2+jAl0EUsQNcitOPHlCeaMhQpQ6H/MYgVHGoFYsKhCBP/e
         ZMsEQWMSMT8PoVcoDvXJ5Dw7anFYnn/3lX9ggX4/zeZqbo9sv9mn+80xwNgN9hQCBEUw
         RmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879124; x=1794483924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZd6e2ni20P+OpySwPpNrzuCEe/t8gUcg0pg0WzBYrI=;
        b=yoUU5uj+bocUyC8RP0M2yxGmxyLHGYwEVzkC5LVwh4Xse0U1j/Q/WA7Cdc1jGH5sgc
         pGZ6U3r9oIOLhWx+V4DITZfM5PIjpe3yN1gPaSNLs90SvRr2O9KLONOZcmv9t2YyARiO
         Ta17Vj2lUBWtOqXH4TJhCeE0iFhkywYQuRa9r/kwf69R0yH+bd31Q6y49Vqjh7U2bIyX
         hM5L0M8aYBAcctXXApLX0CH3sPL94m5347lQ33KcMQ2L2ctcJ9DGklydcXdTF+FClGbz
         jF1uXeawSmYiM0VRLGJcL+98VU86DX6GREKBjN8T7baBFiMm1k2zpw3j48VbOL4tj36g
         KQdw==
X-Forwarded-Encrypted: i=1; AKwUvBx4cQ8JGVQdwxVeyg33lOyw6SVx9kPajkG/DT9VrdfNq3gHn0T/i7SVRwT4SDA7FiG2sxHCg0AY46U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MGcjA5qnbluEpZWH+MOZfErQLsmER0rVV9okP7eW3GC+lIMkB
	qoerQe+Bi9eX+CRMpu5U7fjQO1O2RZ+UxkW1IrEs3g0rntXPTj4h0hw13uNrGmEIdc4=
X-Gm-Gg: AYBFou0Gvxki7i0TGOTkTQgNBOryl6f349jVhCBPg0UsZcYQrvpxy8c8UZkzshiPJUD
	5IW/HlFfdH1mZuqxDN713gZeNqkhgROoqDnPUQXN2U40pSZdFTAuSE0LsIJdVdnZ8fcDssswYL/
	UfWjqD0S27bToFP4g0qWC/qrUt90eqR4HZUGEhqDwXrsknWHq65t8YDiuQYEemoa9gKKQYd79iM
	cFLR9OtzMeHiRrhyhfxaDidVP4JtlMOgx2zJEOuXHjMCrlW23c8G6kpL6N+mSwNzf0H2iFJBgVo
	TbxCMLYrCLvnKzmOy1HByiwUoa5thyEFFRq7Bq9Rb7wfgRF7ZaN2O/Bwgccy5cM6oh0G/81lsZ0
	wxqgCE0F87RmeQX1lXEs8t0YYzP0in7M7gRGB6l0+TQN94e9CjOVKZkaIQ9xBxdmjQSqKTY3A16
	2Jlunekmnq9R2zkwyikTYGh8YrcUS8thE3ufoYpkiNWmfiCFlUkamTJT3JPnWEXx8DL5CQScAHY
	WThTvuMR1rGwagKNQ+NdgbFDNGBaoyZ39yNfmheLr1QchalEim4RNvwJB9fF7zFN4M+SEMXivhg
	bCtEIQe+T3ywhAGDSdGYmqMhsHLxUtuK
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr378217845e9.29.1793879124465;
        Thu, 05 Nov 2026 03:45:24 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:52 +0000
Subject: [PATCH v4 04/19] perf cs-etm: Use per-CPU queues for per-thread
 mode
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-4-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

This makes it easier to support multiple threads without creating a
decode tree for every CPU for every thread. It also fixes the CPU field
of synthesised samples being incorrect when the CPU can't be retrieved
using the trace ID in unformatted mode.

It also simplifies by removing a special case in the decode path for
per-thread mode. Per-thread mode is now decoded in exactly the same way
as per-CPU (apart from pre-initialising the context).

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 5abdd726c6d2..966261429da6 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -296,9 +296,6 @@ static int cs_etm__map_trace_id(struct cs_etm_queue *etmq, u8 trace_chan_id,
 
 static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
 {
-	if (etm->per_thread_decoding)
-		return etm->queues.queue_array[0].priv;
-
 	if (cpu < 0 || cpu >= (int)etm->queues.nr_queues)
 		return NULL;
 
@@ -436,11 +433,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
 			return -EINVAL;
 		}
 
-		if (etm->per_thread_decoding)
-			cpu_data = etm->metadata[0];
-		else
-			cpu_data = get_cpu_data(etm, queue->cpu);
-
+		cpu_data = get_cpu_data(etm, queue->cpu);
 		if (!cpu_data) {
 			pr_err("CS_ETM: Unformatted queue missing CPU metadata\n");
 			return -EINVAL;
@@ -1301,7 +1294,7 @@ static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 	queue->priv = etmq;
 	etmq->etm = etm;
 	etmq->queue_nr = queue_nr;
-	queue->cpu = queue_nr; /* Placeholder, may be reset to -1 in per-thread mode */
+	queue->cpu = queue_nr;
 	etmq->offset = 0;
 	etmq->sink_id = SINK_UNSET;
 
@@ -2187,6 +2180,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
  */
 static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 {
+	struct cs_etm_auxtrace *etm = etmq->etm;
 	int ret;
 
 	/* The current block is not finished */
@@ -2215,6 +2209,29 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	 */
 	cs_etm__flush_all_stack(etmq);
 
+	/*
+	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
+	 * different threads. When the TID from the AUX record on a CPU changes,
+	 * re-initialize the thread using the AUX record/buffer fragment TID so
+	 * we can start decoding even if the context ID packet was cropped or
+	 * they're disabled.
+	 */
+	if (etm->per_thread_decoding) {
+		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
+							CS_ETM_PER_THREAD_TRACEID);
+
+		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
+			thread__zput(tidq->frontend_thread);
+			thread__zput(tidq->decode_thread);
+			tidq->frontend_thread = machine__findnew_thread(
+				&etm->session->machines.host, -1,
+				etmq->buffer->tid);
+			tidq->decode_thread = machine__findnew_thread(
+				&etm->session->machines.host, -1,
+				etmq->buffer->tid);
+		}
+	}
+
 	return 1;
 }
 
@@ -3288,7 +3305,9 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 
 	if (aux_offset >= auxtrace_event->offset &&
 	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
-		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
+		/* Old per-thread files have no CPU (before v6.4) */
+		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
+		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
 
 		if (!etmq)
 			return -EINVAL;
@@ -3301,6 +3320,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		auxtrace_fragment.auxtrace.size = aux_size;
 		auxtrace_fragment.auxtrace.offset = aux_offset;
 		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
+		auxtrace_fragment.auxtrace.cpu = etmq->queue_nr;
 		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64

-- 
2.43.0

