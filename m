Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEB740D599
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462271; cv=none; b=VdnCWZXz6+DCJ+tMd7d52cA0fzE1e+8Z2+oWbpMllKM7w+RrE5K98O4ZAkWeGlACE9+XlbUo+5cxLA843rnbLMpMVXzU2PoVAIGypKCdhm8FLlm1ATyBMWMdwmP5ROGWxWKw3dX2hHNPTcHdNgo3deNy8DVcurEfz3LsAnhhTuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462271; c=relaxed/simple;
	bh=fm7817PJXD9fz4lHXUyEY4UubPN/xPMUymDFvW6lWqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVtQiwUbLZ2UMX2TFjh6Df812c+COGjtOzPQqA0ayrG8i1uLuBQUWvXrzOLqs68trvVoMnLiIVoeNIpak1ptcVc/kxmgVRNFPkTrLOPsevWXOg0V6kkameBBhjqhs2c91w4s4yqCWi5boiaj3D/f6FndxiM3UA6davFj49bZ9ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oe3yG5Sk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oe3yG5Sk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so45421485e9.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462266; x=1787067066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=;
        b=oe3yG5SkXDJbUeACkepPqbKesotJ9fOEgcTZVzKGGqCNRwrMa1OUtSTuNy2ftZS4nn
         Ie5cz9BLcuH3qUA6uW33Ejno0KzNse8N+4aBs3ayG6aq0CwY5WXeg4R0dPmcraxKJnDv
         Zcy1dwBpmUKqvNSTnBi34WmD6PTduw+/UB1LSmR54UoeXLYkbj/kRRjoabQU/U71npqd
         ObaZ3knULUyiEhAlTJdt/LlXfYpgJt6QUJ6Z+1rIdhbMAoMpujahUQQb83Fo+0hA0XpE
         aYjmpn2T8sKB/tDmHNnuAaEyfMkDlPZXRYJ1Xu3gEeqS5KlnwdCHYlCPF475wI4S5ESR
         D7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462266; x=1787067066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=;
        b=bu9uUrr2ft6mAuaDkV9cNidEO7YPZpLK1MOw5AR1+s3KD/fkeo2TLS/cPrjL8Tn8jS
         m07+NCoZ+9ygV24SMB/bm8yN0qWEWSZeGdRMujG0iaz6s4fSpOcPCNbs9F1HvOlfnXD5
         QRKY6n/zmbcj4LZ5lpolFBNF5KDo30nHH0vUECW4uM7B0pzxPYTagbD4ETFRFvlhmqU9
         XuKNWqsLyxgm8pwwtiPFr6qyYsRwKlyRi5GD8AMCqnDvl26SKU8o4QR4pDWQKMbYRS5B
         BzUSZj2zaZ8IYHQBstAPQ1Wg3+2z0pwODt7rWH0GzifYQtU4vyCmHpDCMRoEagtLE4aO
         b9YA==
X-Forwarded-Encrypted: i=1; AHgh+RqjPU5ZuHQvpIgZmFtKcjJ8li+DEssMoBR6poQShOjKG/ZcJWH9X/4P5uXsrnhkPPJpRQPc+sygj4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOdBumFJEnccBiBKeeyhEFLXNRfsANumNXXvy9WbfxYUdmanJr
	8fSdTyf+jNGXGHTaI/VccCGYfuYtzUTbJsN6Fdclw7Ch+JZD/PD95FueVwXGyaJdEVI=
X-Gm-Gg: AR+sD10D0OPBTa/Jy4wPyeWTMzvk26OlHpo3atlvb5lsbC7S45Kn9wn26WqRAY1feI2
	8caK8FkIopIxWlB/pU73JDISpdfR5XLx7GO225dAjWvvNSINN6BeE+MtIb3dPu8lbFSIfDYH3FM
	Fw5KT9mfWQlOfcVgq1EfW3YnnJaI7RPB20bhnJ6S2iNDCeSduomU2myyDYJfelnJ4AxS4ycx2wf
	A/rg0QCTcjPBjXeHeqNHsi++UVNkw/HZp2GHXKnyL/GdhLwX5wxO29K0RNK2NhJsGXQ6qCyYyj6
	oS3veGjjEXfLkkrr9qozaE2jTzZ5Ws0n2/0zZ8/TL70TrAW7S81rjqrsiunW5O+2ItpBmewNj6y
	LTPFs0UBFLLpzCIzf8UkbA7vezdWYOvZnaO6FoeeKyKiDgY9v634mgbv1FEut+d5Ci3jdbmPp3H
	eJoIvHciyQSRX/R6DO2zQxeJJGtnUNcH88cSAXXxTBLZWSD1jkJlAQGz3ad42fxyx/
X-Received: by 2002:a05:600c:4709:b0:499:5220:db3d with SMTP id 5b1f17b1804b1-4997a65ef59mr12003705e9.16.1786462266487;
        Tue, 11 Aug 2026 08:31:06 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:31:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:14 +0100
Subject: [PATCH 11/14] perf auxtrace: cs-etm: Capture wrapped snapshots
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-11-90565318f5f8@linaro.org>
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

snapshot_has_wrapped() isn't implemented for Coresight, so when a wrap
occurs we only save from offset 0 to current head, modulo buffer size,
rather than capturing the whole buffer. Coresight drivers currently use
a monotonic head pointer even in snapshot mode, which gives a lot more
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

Add a much simpler 'monotonic_snapshot_head' path for tracers to use,
and use it for Coresight.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c                  |  1 +
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |  5 -----
 tools/perf/util/auxtrace.c                         | 22 ++++++++++++++++------
 tools/perf/util/auxtrace.h                         |  2 ++
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d36b7e41399b..dbf76dd3349e 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -918,6 +918,7 @@ struct auxtrace_record *cs_etm_record_init(int *err)
 	ptr->itr.info_fill		= cs_etm_info_fill;
 	ptr->itr.snapshot_start		= cs_etm_snapshot_start;
 	ptr->itr.snapshot_finish	= cs_etm_snapshot_finish;
+	ptr->itr.monotonic_snapshot_head = true;
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
index 8ca872e6d465..e3c770b46e94 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -2051,9 +2051,9 @@ static int __auxtrace_mmap__read(struct mmap *map,
 				 bool snapshot, size_t snapshot_size)
 {
 	struct auxtrace_mmap *mm = &map->auxtrace_mmap;
-	u64 head, old = mm->prev, offset, ref;
+	u64 head, old = mm->prev, offset, ref, size;
 	unsigned char *data = mm->base;
-	size_t size, head_off, old_off, len1, len2, padding;
+	size_t head_off, old_off, len1, len2, padding;
 	union perf_event ev;
 	void *data1, *data2;
 	int kernel_is_64_bit = perf_env__kernel_is_64_bit(env);
@@ -2061,10 +2061,20 @@ static int __auxtrace_mmap__read(struct mmap *map,
 
 	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
 
-	if (snapshot && itr->snapshot_has_wrapped) {
-		err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
-		if (err)
-			return err;
+	if (snapshot) {
+		if (itr->snapshot_has_wrapped) {
+			err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
+			if (err)
+				return err;
+		} else if (itr->monotonic_snapshot_head) {
+			size = head - old;
+			/* Force a full buffer read if a wrap has occurred */
+			if (size > mm->len) {
+				pr_debug3("%s: wrap detected, adjusting old from 0x%"PRIx64" to 0x%"PRIx64"\n",
+					  __func__, old, head - mm->len);
+				old = head - mm->len;
+			}
+		}
 	}
 
 	if (old == head)
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index a9d0c84184c5..971b817d3396 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -385,6 +385,7 @@ struct auxtrace_mmap_params {
  * @evlist: selected events list
  * @snapshot_wrapped_len: number of bits in @snapshot_wrapped
  * @snapshot_wrapped: bitmap indicating if each aux buffer has wrapped
+ * @monotonic_snapshot_head: driver doesn't wrap head pointer on overflow
  */
 struct auxtrace_record {
 	int (*recording_options)(struct auxtrace_record *itr,
@@ -412,6 +413,7 @@ struct auxtrace_record {
 	int snapshot_wrapped_len;
 	unsigned long *snapshot_wrapped;
 	int snapshot_search_bytes;
+	bool monotonic_snapshot_head;
 };
 
 /**

-- 
2.43.0

