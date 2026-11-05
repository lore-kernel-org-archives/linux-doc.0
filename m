Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879143;
	b=0WsoNv+RS9huIkBL4wOGC+iNhB7IfCpjEt6RmOVUo+sVIYIyLrz6POlAmCJNSKrJzwhe
	 IJthaku+rXJDAYEJKYqR19ktx36goZlY+L1Wqv0a+Vz29Z+FGkj/lTO6nPDzfkPWviaQO
	 6RUbNTZH3sUwgexuZgDcMpPfkU1aQMJS+zMCNrQzULqiTPlLBQO87l6FGeWWy+TS621mL
	 gDw+nDhBl+/4p6ggVd+tDWnduZ5RMgAJ24kecHvLzKet10OHrfrQy9ROylp61bhKVsfV6
	 UwGlcjKuun5BokXUZsP1Iew7lKcnEsJNyQ/3pjHEe/yRkAA9H7SeUypFNrbOIl/QySw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6POGoe9GP/LfncNNPmyOb3NHHZhyrYu1RabNz3eag4o=;
	b=5BmgVuy2dI0Pd9x8pcqirXwts7unJZAVDSUjrIIYLVgH0N0jG0vfrXRqg9BC34f1Kd2l
	 GSpE2oaV0au4BfLmRYhPnbMyO5ImDTZVAyRGmhv1/wXt9xM5RIea0OD//lrF7WGyDE5P5
	 zVIlFvl8ZNeNKKyXVS1XmQxjyzNGSRMS9NX+KrEcOIa+6AC/vKZXwHHYnJl9tokN3/L4g
	 zOOF3xfko38jttYVZswu6FSB/oZn1J9ohZWqDsFVnyxV7Bd/f25LIEvQipZvbb88mkoe2
	 HyaXHdt6tTippxHeFu6aPJw5czGifwLFfhtX5ncszSAjDktHPtCwrKsxcpTN216wwMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K1gejdb5;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C76074706
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2C76074706
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K1gejdb5
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so3243135e9.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879141; x=1794483941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6POGoe9GP/LfncNNPmyOb3NHHZhyrYu1RabNz3eag4o=;
        b=K1gejdb51J+Z8oiybieXDjNL9wJxYfNHLd1X4OBM5GNJ3wor+IUnGJXJbBw1ZVJemG
         oiQOLL70ZCPDKxZks4QCtmNbf5n1gYX7h76x5nc2888dG8C8bxvg9qIPbxL7FGuZZ++b
         0scyKGIHjQNGL3ckIenvZab7SOT9iPj+TT9DBFlx1T7hD1seza5NI8CPPEKLUFal7mIj
         PYl0DSB2Z9V4kGKcip1ICMOuHBBgkwWixzjLhug6Xkh/ygxGPiF0v5NBr2sVuMVaEPS1
         fBnHpA9IkZfoH81zrYFaaMCOQqLH27o9yOs1pyPsjgbDtnY7oidT38FFfmGSPh9F6xv6
         LvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879141; x=1794483941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6POGoe9GP/LfncNNPmyOb3NHHZhyrYu1RabNz3eag4o=;
        b=AoE/wV3MT0gB76WAM8s+Y9dFvLGSEDoYvuj6d5d/HRWlsx3yA6JqXNwPHlnGyizvTj
         tt6tnIhRqz6my/R99fKrYF2COl1U3iKQYNW9O9KmdisiU7MBQoYH0B2wMJMg+nr46Sph
         jWZ105rInRzVw7hVdOum/+6WcraxX3sfQx2FpwtGL84EpeEYykDKpbiv6zZUl/IXoXFx
         A16XKNyFg/GWVyPal2l41/LbVRyoQSJ8WjleggLrWZ6EohukLQtVya2sfdCpMkRYpNmc
         MtGJdneSnZZy2z8QyakQo1jvtKClC42W0UdhsG7P7Sf3nX6RnMTnd+66HfRmjYU/GB7O
         sGtQ==
X-Forwarded-Encrypted: i=1; AKwUvByFrfzccv5WXi5N02lTKa1wa7XL4G+Wzzk4XvaEKk/1h87YwHM/i9zEJ6OqiPPMhCC6GZpUYIDMz/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AkIh07Bjlc09FCxalQTdTcC4s5fT5pSzABL9AcF3zPKikX7IV
	CxL4/36NX7TC1DjS579iqbTYTyiyKIeYE0cezRhYSvX2YCES4kZFGTdGODxMeEHF10c=
X-Gm-Gg: AYBFou29qxUd5fK4KE9EZ5Rtxjv9cPWsFhn7vDnOfy8qzbo9psBJO991sTiAU18IHq0
	Rf1aLf6zE1sRrPbEgoe4JC57Y+0QLBcRFJ3/GFb97oTfK6CgHwir6E8n3E5EIEm9nx4XZvoO08c
	7Awulnhm0pNI9fVfp72oYl8mRVLz5D/RPY9lEetx9P/1XGVSHgkOeK4HuxE17V3iyS1lriivC0T
	UK4JNStHeGA6+g37QNn8iibGoS89ILvhzgsqcnmR9+u8dE3i+wntgmzJb91nM4ya6/+uBBlsMIf
	cZLzQVVaWOZp35A3d8ujo/MzGbsaWKAwfT+r6tRhYdEcUTj8jQesZKoYd/TmbtJCA1VgyhlQN9Z
	U5VyE/F+8CCR4pQLEsv3GDHqwEMIVWmgASQv02+7SIbfqCjiQnVg2FzBw7SdP4Qse9xOvsBlEEl
	yKhHceG91vzNEIyO4dAOi7sYRhE+SW7VYnh3t27yekAiiAxT35SWWKm2CHXzgoRkpa5TgDQc7XK
	M/JEMm2Bpoq4whpwxRx7dJHCNlFvAt3wKFpZ0HF/Xf6k1rpVh7/6/n5KckpNkYI1qBe8czJchtR
	M4LJ1niwLLenSSSG9h9fTcDfCQZcF4oz1Df3pxx8IvZhsCnOdDt1bvo=
X-Received: by 2002:a05:600c:34d2:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b55e07e6d5mr40258725e9.16.1793879141088;
        Thu, 05 Nov 2026 03:45:41 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:03 +0000
Subject: [PATCH v4 15/19] perf auxtrace: cs-etm: Capture wrapped snapshots
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-15-7759e0ce2449@linaro.org>
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

find_snapshot() isn't implemented for Coresight, so when a wrap occurs
we only save from offset 0 to current head, modulo buffer size, rather
than capturing the whole buffer. Coresight drivers currently use a
monotonic head pointer even in snapshot mode, which gives a lot more
information for taking snapshots than a wrapped pointer. It means we
don't need to search for data at the end of the buffer to guess if a
wrap has occurred, and we can go back to saving partial buffers after a
wrap by checking if the next size to take is less than the buffer
size.

The drivers will always be able to generate a monotonic head because
TRBE has a bytes written counter, so even if we stop generating an AUX
record on every overflow, we can check if the counter indicated an
overwrite and offset head by a whole buffer size if it wrapped. This
forces userspace to read the whole buffer rather than between last and
current head. ETR and other sinks use software double buffering, so can
continue as they are.

Add auxtrace_record__monotonic_find_snapshot() and use it for Coresight.
A monotonic head can't be auto-detected in the default find_snapshot()
by checking if head > buffer size, because before the first wrap a
monotonic head looks the same as a wrapped one. The search would then
falsely detect a wrap when head is near the end of the buffer, and the
wrapped pointer fixup moves 'old' and 'head' a whole buffer ahead of the
driver's head. With a wrapped head that doesn't matter because only the
offset within the buffer is used, but with a monotonic head the next
snapshot would either save already saved data again or drop up to a
buffer's worth of new data.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c                  |  1 +
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |  5 -----
 tools/perf/util/auxtrace.c                         | 23 ++++++++++++++++++++++
 tools/perf/util/auxtrace.h                         |  4 ++++
 4 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 5e7d09b7170c..84a5d7392a5f 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -922,6 +922,7 @@ struct auxtrace_record *cs_etm_record_init(int *err)
 	ptr->itr.info_fill		= cs_etm_info_fill;
 	ptr->itr.snapshot_start		= cs_etm_snapshot_start;
 	ptr->itr.snapshot_finish	= cs_etm_snapshot_finish;
+	ptr->itr.find_snapshot		= auxtrace_record__monotonic_find_snapshot;
 	ptr->itr.reference		= cs_etm_reference;
 	ptr->itr.free			= cs_etm_recording_free;
 	ptr->itr.read_finish		= auxtrace_record__read_finish;
diff --git a/tools/perf/tests/shell/coresight/raw_dump_stress.sh b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
index bea70d825596..c9459ded4cbe 100755
--- a/tools/perf/tests/shell/coresight/raw_dump_stress.sh
+++ b/tools/perf/tests/shell/coresight/raw_dump_stress.sh
@@ -48,11 +48,6 @@ read -r size offset last_idx <<< "$(awk '
 # everything was dumped. Allow 48 bytes difference to cover 3 frames: current
 # frame length, a partial frame and a final empty one, all of which aren't
 # dumped.
-#
-# TODO: for a single snapshot, offset should always be zero. However, we
-# currently output AUX records in snapshot mode when we shouldn't, which
-# increments the offset. Allow for that until it's fixed so we can test raw
-# dumping.
 decode_size=$((1 + last_idx - offset))
 if [ "$decode_size" -gt "$((size - 48))" ] && [ "$decode_size" -le "$((size))" ]; then
 	echo "PASS: AUXTRACE buffer length matches dumped packet index"
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index c613efd83223..3aabf2f4bd47 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -750,6 +750,29 @@ int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
 	return 0;
 }
 
+/*
+ * auxtrace_record::find_snapshot() implementation for drivers that don't wrap
+ * 'head' in snapshot mode, so it's already monotonic like in full trace mode.
+ * No search is needed, only force a full buffer read if more than a buffer's
+ * worth of data was written since the last read.
+ */
+int auxtrace_record__monotonic_find_snapshot(struct auxtrace_record *itr __maybe_unused,
+					     int idx, struct auxtrace_mmap *mm,
+					     unsigned char *data __maybe_unused,
+					     u64 *head, u64 *old)
+{
+	pr_debug3("%s: mmap index %d old head 0x%"PRIx64" new head 0x%"PRIx64"\n",
+		  __func__, idx, *old, *head);
+
+	if (*head - *old > mm->len) {
+		*old = *head - mm->len;
+		pr_debug3("%s: wrap-around detected, adjusted old head 0x%"PRIx64"\n",
+			  __func__, *old);
+	}
+
+	return 0;
+}
+
 int auxtrace_record__options(struct auxtrace_record *itr,
 			     struct evlist *evlist,
 			     struct record_opts *opts)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 9d86f8366ad7..980acb2dc687 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -607,6 +607,10 @@ int auxtrace_record__default_find_snapshot(struct auxtrace_record *itr, int idx,
 					   struct auxtrace_mmap *mm,
 					   unsigned char *data, u64 *head,
 					   u64 *old);
+int auxtrace_record__monotonic_find_snapshot(struct auxtrace_record *itr,
+					     int idx, struct auxtrace_mmap *mm,
+					     unsigned char *data, u64 *head,
+					     u64 *old);
 void auxtrace_record__snapshot_fixup(struct auxtrace_mmap *mm, bool wrapped,
 				     u64 *head, u64 *old);
 u64 auxtrace_record__reference(struct auxtrace_record *itr);

-- 
2.43.0

