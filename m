Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879138;
	b=CsVEoRWgLtMHpjxe3uFVCkNRZC/yE+kEmxHNnHxLbWfNnVp1xdfDJ6kOgXCtlFphOsNn
	 Z/pcoxKprTGjQdsZbYpwzvUdts9dpi14ikCi6WLcy+C25vxOAqse9QWVDcT7I3khTLJ56
	 8ztYdS6tTLkWgeRMlDMb9+bB73g7SKmZ9OdmjChBTsH/iPYCnnuChxyEdPKZRx6DzQHrd
	 7TMdbSNMAXbRXTEdJ0SwGyKI5ijCMI+ZfemwDXrPz21bTMn2+KVtlPEkBQfB7SKajVYd0
	 1QCviTHk6YW8zxOhJ6wHsvXDL3qsTkjnffhm486AX7yNhFsHG97rgHghzi38zDeCP+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7+yXqelcd7K9D83xlzwHs5kTJc4QtzlsHxdJQfLdGMM=;
	b=leEBJnQHJCpHKMNplNv33ontNs2RNTUTMts78OXUwr4a0/eAA4D/HxN7ZcXG8yTi9MpN
	 YMr48oVCGF3DIxGBmhM3xUXckYpafQaJ9WjQdyV728umto4VV4qWMyI27lu1lyvoG2Qzd
	 qZ0PfbZt8BWNH84ZIhMzaDgmbD/byI3vkDXF14ZsxFw5I5864aP/6NhGaNmdCBVnMexeq
	 /0T9aXbXZZIrJhSHgP9zW9xEJOgMqAoRsqsquuuUGglONwuO4rpWL3A+Ns1Jrkq796vr9
	 KtdvKJQCFG3X96M3yxdKpTSB4OXdBR+GSlOG1WbtYC0U9JCcuebw2e0WG57gAMKXv/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eiAXUHZk;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4936073AA0
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4936073AA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eiAXUHZk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15953945e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879136; x=1794483936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+yXqelcd7K9D83xlzwHs5kTJc4QtzlsHxdJQfLdGMM=;
        b=eiAXUHZkRcPPJyedbMUBbfgxQ/69bd1TJfROZiWDCkI/5s2nMHEmO0+/X+Br9wTGGi
         1FlYPTfwxBUARRST1SxwdDyoFfvi0jXy+TYCkoHiEXSoZsa/HUD2GbzCZaPv5uZXvQn1
         mN5gNTWnwNf56D9mOI+L/vNhTmtX4zcUpGwul45g9G99HBeGp6LzkAlw+6e4gO7suRug
         OTm1Sj2jJ9uodOVxQEpLUyBn184jYCSz38wIBxD+S8iDTePuKh8lh7CnUT8uMhAS9wso
         y9CaSkLRYFgAQ0ZjSoWZD6BLtecXTyc4NcUduj514JWaqqQV/M8NV0r7Xy1O7wN/maqM
         weDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879136; x=1794483936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+yXqelcd7K9D83xlzwHs5kTJc4QtzlsHxdJQfLdGMM=;
        b=eINWIQradaRGlzwOABSdSz66w3Ma5R4LIVbNYZFr3vzYD8g8lQhu2YW+5XBxM7VYcx
         6pdAo/sP0BXsgTw6vy+4EP8NYpwSpyNMtQxp+iXOJ1giOzn8p2sYdD0+kO+tCOf5lSTL
         P6x5vA9jatgLRB6eMdG6Nm9f0ALHPQj8zASg0uJdFNvapKO6z/kVAySdW0lCk23Py5bq
         HkChztGBmm90IKX4OnYzQwD0tX2wFKu3zs8z9sDYKtEHNS0zT2MKCJo364XE0TfmT08P
         STYZkU38ayiuOf0/ukfxIgKsc073nH/QUQeWQbOiGiCH6gmIQnxTzelL6m0Hj2RHlL5M
         hBqA==
X-Forwarded-Encrypted: i=1; AKwUvBxDZPAPO7JKlO2yhFw0OP1P60uws2LiMJjPy8pCMoa8LnYkj8smvlwcxPPE0YHt5z4M9vcWwmTed68=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XVSv3QKH+szkSh6T3yQICyXtzyAexGFamOdv9QaNbt8Y1/7eH
	31L45p0r4/CAcz//PNCxiJzUwcEBSQiYAskDRJzDeEckgMN+TWL2uFAqmECdamUKa0A=
X-Gm-Gg: AYBFou26SNuct/y1DbVBKe8s0Rb4Lrmhwb5T+BAFPuJVGGg8I7GpLOohJMfX/FLRhLh
	CGLe9Qw3T3WODSqqx0JxmZpp1jtZtO2+oYoSMZQzWaADNQu7JeUTtUmnUll5io72JRVmbx5DoYJ
	I4yXfnAHlXSLenE8mBuZI4fvTtlKCOSVEMHLCaznFAvnaqyrehTLgqC2OwedhloYmVaKNc5vOGz
	hjZsEpbfyzR13f64hzNmKhgI8etviWhIbBhJmQjw4CeKr74nmyDzy2KVAoOeMbB7YEpFByiFQ6a
	0GREcDMw59S58ee+TfRU8D8+06BnvjutlzTXFieo3WyFg6Fpl+/jKiHA9gxMHlUt+V4UaN7Yve+
	sBxbrxQSI1JJLYG5x3OR2BDW8QMuKmgHcALcA1TFRbsle0vHPEv+HjLxi3eThtJ2KXUu0d06iUn
	upFgbFgVAPHh01pnjftzZ2S49Fp3FSSKBWkpxH9po4HPYBOFoL6nkPrjPiBAXYUogq+hk7moz+B
	lFErPBa34ajj12vHDkW+DEgHheGSYnMbAzAhTpKV0hspzUX+J2RYSM7M8ShzmmPKjNRdjyz2Kir
	ffd5fBmMxFyOcqOs01evczUsCcIA7+d+kt/mGWQR5d4PTRfIXl1Sjw==
X-Received: by 2002:a05:600c:4f0f:b0:4b3:ad9d:e21 with SMTP id 5b1f17b1804b1-4b3ad9d0e48mr136677825e9.12.1793879136438;
        Thu, 05 Nov 2026 03:45:36 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:36 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:01 +0000
Subject: [PATCH v4 13/19] perf cs-etm: Queue partial AUX records
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-13-7759e0ce2449@linaro.org>
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

In snapshot mode AUX records may straddle the boundary of multiple trace
buffers. Currently we only queue AUX records whose range is contained
wholly within a single buffer.

Fix it by queuing any partial AUX range that overlaps any buffer.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 54 +++++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 966261429da6..320164645f61 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3238,7 +3238,8 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	union perf_event *auxtrace_event_union;
 	struct perf_record_auxtrace *auxtrace_event;
 	union perf_event auxtrace_fragment;
-	__u64 aux_offset, aux_size;
+	__u64 aux_start, aux_end, auxtrace_start, auxtrace_end;
+	__u64 frag_start, frag_end, frag_size;
 	enum cs_etm_format format;
 
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
@@ -3286,25 +3287,23 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	}
 
 	if (aux_event->flags & PERF_AUX_FLAG_OVERWRITE) {
-		/*
-		 * Clamp size in snapshot mode. The buffer size is clamped in
-		 * __auxtrace_mmap__read() for snapshots, so the aux record size doesn't reflect
-		 * the buffer size.
-		 */
-		aux_size = min(aux_event->aux_size, auxtrace_event->size);
-
 		/*
 		 * In this mode, the head also points to the end of the buffer so aux_offset
 		 * needs to have the size subtracted so it points to the beginning as in normal mode
 		 */
-		aux_offset = aux_event->aux_offset - aux_size;
+		aux_start = aux_event->aux_offset - aux_event->aux_size;
+		aux_end = aux_event->aux_offset;
 	} else {
-		aux_size = aux_event->aux_size;
-		aux_offset = aux_event->aux_offset;
+		aux_start = aux_event->aux_offset;
+		aux_end = aux_event->aux_offset + aux_event->aux_size;
 	}
 
-	if (aux_offset >= auxtrace_event->offset &&
-	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
+	auxtrace_start = auxtrace_event->offset;
+	auxtrace_end = auxtrace_start + auxtrace_event->size;
+	frag_start = max(aux_start, auxtrace_start);
+	frag_end = min(aux_end, auxtrace_end);
+
+	if (frag_start < frag_end) {
 		/* Old per-thread files have no CPU (before v6.4) */
 		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
 		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
@@ -3313,18 +3312,19 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 			return -EINVAL;
 
 		/*
-		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
-		 * based on the sizes of the aux event, and queue that fragment.
+		 * If this AUX event overlaps this buffer, create a new auxtrace event
+		 * for the overlapping range and queue that fragment.
 		 */
+		frag_size = frag_end - frag_start;
 		auxtrace_fragment.auxtrace = *auxtrace_event;
-		auxtrace_fragment.auxtrace.size = aux_size;
-		auxtrace_fragment.auxtrace.offset = aux_offset;
+		auxtrace_fragment.auxtrace.size = frag_size;
+		auxtrace_fragment.auxtrace.offset = frag_start;
 		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
 		auxtrace_fragment.auxtrace.cpu = etmq->queue_nr;
-		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
+		file_offset += frag_start - auxtrace_start + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
-			  " tid: %d cpu: %d\n", aux_size, aux_offset, sample->tid, sample->cpu);
+			  " tid: %d cpu: %d\n", frag_size, frag_start, sample->tid, sample->cpu);
 		err = auxtrace_queues__add_event(&etm->queues, session, &auxtrace_fragment,
 						 file_offset, NULL);
 		if (err)
@@ -3364,6 +3364,7 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
+	bool found = false;
 
 	/* Don't care about any other events, we're only queuing buffers for AUX events */
 	if (event->header.type != PERF_RECORD_AUX)
@@ -3397,11 +3398,14 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 			ret = cs_etm__queue_aux_fragment(session, ent->file_offset,
 							 ent->sz, &event->aux, &sample);
 			/*
-			 * Stop search on error or successful values. Continue search on
-			 * 1 ('not found')
+			 * Stop search on error values. Continue search on
+			 * 1 ('not found') or 0 ('queued')
 			 */
-			if (ret != 1)
+			if (ret < 0)
 				goto out;
+
+			if (!ret)
+				found = true;
 		}
 	}
 
@@ -3409,8 +3413,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * Couldn't find the buffer corresponding to this aux record, something went wrong. Warn but
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
-	pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-	       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+	if (!found) {
+		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+	}
 	ret = 0;
 out:
 	perf_sample__exit(&sample);

-- 
2.43.0

