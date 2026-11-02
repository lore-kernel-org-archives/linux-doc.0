Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621749;
	b=HNTpmW1WljESSkfVd3f4HzZh7SFRiIh3P7ezwgWAatw0g1/LDKzOEhzTSw/ImB9Mooq3
	 nS/CaQh8UX3/+kAaMVWzCupfghNcoA6/V6vyiA8jwr6doFAjGTlcfTcg90DtYYSg7ITlr
	 0ECn0rQdyFk1aCNFsZXcFvtMwHM7Z3dUPuwhPXJgs6MCeld+P9ybbqgmFyCNdAuoqaljK
	 VNoyd1INRLJFieAJfatTkiy+L8Rv4MmnjyRBEtDdqFMNwRrW67S18w3s06LbL3oV6ygKN
	 BUS9EPmzFlSF9vqnrV4tnNN25n6U6GYbNOaeV4gW3z1Cv490L3OXQPNBOT2cPh1R7rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=;
	b=nt8uuXG3mWKgSQ7RWikPzOlPjn7UoqVkwuDvVY7i8CpS0RXMwEXf72aBZiSL3FKfNlUF
	 fbQdk+wRdCJXljdw/3GNSGlKXOlaiWWSdIbtv9mUjkRNq2SOB7UWq9CRvKAD4RZU3lPPh
	 7j5H52aFzNhjlsrW4ONZV5TC142NFlAZEEKoITX36596IlwnQfncjO4GbFaAgidiTU4sY
	 iX8ra+fryCq6oqv4KteGlxx330ybTZ/PpFJs7kKjxLFBsfEwNL9eWT+W3V5BFXuS5lLtG
	 eXJhv87Nv/E4Jn1sR0UJcEHY9yUsUyrucY2of0HAdlOJsDAjg8sXVbnUv8bZ0ibfM8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YJN7Iw4Q;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288860A2630
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1288860A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YJN7Iw4Q
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so14971435e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621747; x=1794226547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=;
        b=YJN7Iw4Q0LLmBxRNrJVqSg3KtrkyLiLCTIzVd1vsu6yUmY8LBpkywyUB3JKl5LmCAr
         CjPDJbb7qKFi4BdrX4Ii/f8PHkHDSyv+s7SgccxhHdkUuzNeZxhtpi7Ob+vVmLSZOCov
         43PmRuWevzyAJfnA5UKArt8+i+MHrfKkQgDDZKIJUOvOcdsJYuPNJ/GN5DyxSsbRvRgk
         QMduL+tj+KFmGNG1lGL36wQB6rcrHoDpy0HGsaBjIjr5LnmSaEplo0X0eCQFyRuJ27ao
         U+zUh8uni6tRFJVyeAL1YEs+D9pjTPds/NO5TByW/8QdVeymK3Por7rJFEa+5KCulo6M
         93TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621747; x=1794226547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDOKgyiHoV1+L9IrHJGqzLdyPO03dwc9hJe20Z/mTLk=;
        b=OgG61fp8ent/DQte8V60S+EJQP9lyae4J4Ghb8FF0/bVlFqq+wqzyo+Me7bEu++3DI
         i2xPCoPGwSf/hEWuMiLjtjo/QRhJtFhsvmT3zAPA8Bs7szxviqo8ivA4i1TJOqUogub3
         FKmOSo70DcNCOStZpHkkmen5Jq3KusiZKj4OOyFaN4VRNke8OhV2OvZJ2iAF7WqKARsJ
         ExMTzVLFU6lIDj07e+jtrQIQm7AQ8tGh6Df/O6NolTNEiFT5EN5t5KyVySw8FYMgjMOn
         RPTMEu0BQrglsMtwR2LBfV8sdsLCQI24h+Zr4pGnnJ0FworyceWjzYtw6RwYx4uQPmrI
         Ukzg==
X-Forwarded-Encrypted: i=1; AKwUvBwRnfqD+VhpvMOC0ymey7N6dP4H94TmSzvVuR/nNRiYMzrpt0ixrqvXvCZnsMKO4RHPuAKMUSsdhMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUPm7AqDcRbIKWQAY6bLAxiYhuc1HbfPSUIE9Okrqea/ZK8d40
	DMbIjzoZ3ryGv6yWnxfcOxb3kDAzgUWZMKttR2VJo8K1h0PaPptcLD4QNORBI4TfGVWCS14BoEO
	RMWaSD0Q=
X-Gm-Gg: AYBFou10LD5FtaWUf56x8DD0gT1vszI2OPojlZmg9vdNXQKlN6aT9tn5e8QbjPmSgT/
	UDk4P0zoG/CeNTOsLG9/KbUz05Ur5xUFs9lWCgCeXgZqnct55+fEdBKLBt8Y/o2NHSDvKrFYfba
	mRHWNxvBHWl14Da/wvc4ehtesUnBAmoTwqsBa1mtIiGp/AH6ykR3OZAK1WrqrE6RqW7495xnp1C
	7mbDTkZ0fGsAaItDgjLnih/6K1kpNBr/Ogif7pkI0+VDiWUnjaw/q/SeUcyzvGKMLLNm87GWg+T
	OkrV3num0NyBx2W8onjgoGinljh5fobXI68OMtTCK4hxzG0rdaTlZHqEhxt5wNfXZnnPVesHYK9
	KDLZ+hrLjwCj7AsEaC/APveEggQPBVpY3tm5QstR/ZoUXU4as6yw1tKfWwQHm8P+6mgpiV6CFPN
	O4ebZeii0pCnJoIw3ba2qGlRpNcUwl8lyF0+ntRgMIZrMAiOVchkQXATgul47y+41+37foavbXa
	DzPyEWYYbZiO6saA14AFt7JDkK71gO0TFj0YMtLyK937h8N1yM+VyzGv1BcUUtG3RnUg7PyegmH
	jU0LQYsHD88MSLP4463etWANJ5ycFFIe
X-Received: by 2002:a05:600c:1990:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ac1923581cmr215808995e9.32.1793621747540;
        Mon, 02 Nov 2026 04:15:47 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:18 +0000
Subject: [PATCH v3 04/18] perf cs-etm: Use per-CPU queues for per-thread
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 509ec014b276..f19aa4f787fa 100644
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

