Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F96F3F6C3B
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462266; cv=none; b=QVzi8TfD3MuExqSrJ/S1kvotQ4pWsaQwCzmNFpIyJ4wA0FAzfxOU5WMQBtuKfUU9IEei98oZC9yCv9hdHbI9Rohvizicrs/JBUxMgt1ZDLCso2fLUu2h/3deT/w+x/SaZhNgPvaEOQ17A5815TuVvetwjJccWSD8Nw0EwZHDmXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462266; c=relaxed/simple;
	bh=74lpABqcB4r+lKhOt5ne94g0pmOsy67TRdqfjLvxrH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imPLAft/XhQF/bpx60rj33QqojQ3wPdzxTXvNG8yLtq6K+fbbXEGrAV1YpMbqLzx3UEI8+0Cj7dIVwqpOiza5tlx7Ao4kRAlVCVBBxK+wZNjOQLpAHVJQnikE5ltYp7FJbSKSFwbr/uiBBdyhws5wQb0S9mI1hGgGoOtmfK2iQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vIEMTAaT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vIEMTAaT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso36355725e9.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 08:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462262; x=1787067062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLrtzOE6JfG2/1H41zLGULod6PxsqgJ0B9NXXbgCKQM=;
        b=vIEMTAaTlzqeru1HrdB/3bWUniBfj1toChH6DTnMX/3uexN3G+3/HcBCd6vsqbf36j
         eN4CWuEazzV4u2j9XN9Lxwmffk2b5YCmSHdjfhMlfPO/XHI6jURnk7abLtzdoDXCrPxJ
         9uZAas7BCuuO5IdbABxCZbIMx7ASt8IDXt2e4XkPTrPAj/GGihsM0lDGQrp3Ws9UM+uh
         EsKq1KNbrdhBmodJ4G+SODYTLGSOeAoTD9mxRv4ogbI8P6pDDlA5M33ZiE1I4hsfJCPx
         werw2S7hjKBJMw4AjA+CilKnNLhNj6eV7qJIKCumDlt04PRaYrylb/vM+yn9+LvUh4As
         cD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462262; x=1787067062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLrtzOE6JfG2/1H41zLGULod6PxsqgJ0B9NXXbgCKQM=;
        b=OValDB/btc1jfqNvz26nTjAJVAVYfnakxVyLDt/GIVQHAAWBrBhWBisdOJ/DSm2HZn
         U/koFRTAyMhUjTg4HygfkMwXbkMjYRjTjrsgGKcjDf1JiXaWU9CXT9chUbUK0HA/RQ1H
         F7men56kJE76Jmhb6NTirmsGnF/M8SFNjKfHz0794Ip/KXSCLcZQR63qAj7mqTcyotx2
         I5SH63kj6989y5+FHLCBC0P9h6TZt/USfDzLeMT7wyNpwwjBBi4DEqBJupcZ/mli4XCA
         wQ0v/loQw9JPDx4oy70rD+Iwd6avfNucHPBRLrkzdPv/RSVmiIrxgeGsKn6ri9IbhZME
         rwBA==
X-Forwarded-Encrypted: i=1; AHgh+RopiHVK816SkXRrXFSYBlYXV9YBY1aDSU/3qfS9zcbI5A6p6xD5uP5KYn91sMR2GnOfqptDM5cGZN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ7fkA4DjPxmRLZDF+q7qwBH1QyKYBXuo9HOFLz5ch8sOCX8h2
	sSlRoqkSEfl/jKGefIj0C5kmEWgLoqsfanIt05GF0xolrnG0Qk/MtB8eQvDPI1vApvQ=
X-Gm-Gg: AR+sD117q9C0R7/x+zb25ur00WUr/1NHfnbsuNbnJw1xTsOJhpxRy0+kG7VQyxCSosc
	TOxl7QFsypsfHD8Jm1vvdFT4g+1srdgv7E7n18/PoedeL2VD56Pir4gRcmNPCU8WbhNFBqELYxL
	sNPRAisgPigw41NRmZHH7MMRGYr5xCXhP9h0A+iPn0CC0c4yWBHUkv2l1/AOcPVRLkF9CIxXSUz
	bFAeoPaSAvr6NhLSNHpdPoA/E7w0UXzABdvxuH7ZlSrzJ5yO+TB7MICfij9yYYf1ThfwHLqyNzF
	uOSZBGE5zd2GGxJQhVxIhnDdegFTUugMqbmeoQnyg6P024Rysvbhrg2GbVU1NV9qASq8cDJSJ/3
	pZ+6KTiakF0le55ZFyZNUh4EmgfrL4xm7Cby2SgWi4yhRzufsYg4VT5P7EpuZJ410KL09JJczo8
	VfTv2jGdiBdUoOtzURa2ohiet4T0LRlDZMI5kwry8dKWQoYurDRsKf1bnfqZGLy1eA
X-Received: by 2002:a05:600c:630e:b0:499:757f:a9ba with SMTP id 5b1f17b1804b1-49978463c2fmr54014135e9.9.1786462262497;
        Tue, 11 Aug 2026 08:31:02 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:31:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:12 +0100
Subject: [PATCH 09/14] perf cs-etm: Queue partial AUX records
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-9-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

In snapshot mode AUX records may straddle the boundary of multiple trace
buffers. Currently we only queue AUX records whose range is contained
wholly within a single buffer.

Fix it by queuing any partial AUX range that overlaps any buffer.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 54 +++++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 28f5ce63ba80..5bafee31cf4b 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3197,7 +3197,8 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	union perf_event *auxtrace_event_union;
 	struct perf_record_auxtrace *auxtrace_event;
 	union perf_event auxtrace_fragment;
-	__u64 aux_offset, aux_size;
+	__u64 aux_start, aux_end, auxtrace_start, auxtrace_end;
+	__u64 frag_start, frag_end, frag_size;
 	enum cs_etm_format format;
 
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
@@ -3245,42 +3246,41 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
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
 		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, sample->cpu);
 
 		if (!etmq)
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
-		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
+		file_offset += frag_start - auxtrace_start + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
-			  " tid: %d cpu: %d\n", aux_size, aux_offset, sample->tid, sample->cpu);
+			  " tid: %d cpu: %d\n", frag_size, frag_start, sample->tid, sample->cpu);
 		err = auxtrace_queues__add_event(&etm->queues, session, &auxtrace_fragment,
 						 file_offset, NULL);
 		if (err)
@@ -3320,6 +3320,7 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
+	bool found = false;
 
 	/* Don't care about any other events, we're only queuing buffers for AUX events */
 	if (event->header.type != PERF_RECORD_AUX)
@@ -3353,11 +3354,14 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
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
 
@@ -3365,8 +3369,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
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

