Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3D547252E
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305798; cv=none; b=itmRnd2mpqGRAAJdITL+z/FCMf8rLFWIxLZ+ZnSYv+UAcDFJFg4zlwBYFKQthVAnUBPp6UoOPZzhCOUrmGCvgGkSqkhzT1j9JGjuI1d7jrKiCMc+ov+r0SaBNNn757STqOPL896SAhWK3msTIFEr8JGIXh2eT6b7im9D2E+QCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305798; c=relaxed/simple;
	bh=fm7817PJXD9fz4lHXUyEY4UubPN/xPMUymDFvW6lWqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yn6RKtZkn0pnzF8/sy+siTiAyxLlrSk71VeP1Stx99DKnV2a1bSbmQHZqkP4Poscg4NfigZnXNMB/c8U6BJ2QJLoRJvxgOjttHdczczuZNy4d3YZsCgU9LmzpGYGNSFV3tRDzWKHgaUEY7ymGH6YqxlgY+wwmfrxg9Dg36RuTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVhcc9pq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVhcc9pq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fde295992so574196f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305781; x=1787910581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=;
        b=JVhcc9pqaZ0WA2wp4EnI/h8w79w81W97i0uEjWPNB7PyJgFpg+kr2ao0eBB+S9A1dE
         r2S09lxllcMUoXC15kgeumusX4ZS4YsY8x16fxeDPa+rJXEULCj1vQS1NB8w7Crcagsw
         T/TOwEHVdA5G7gvTxqil/rNXJ05ZHBWgRYrGWvWekw8pXoocQgSXtRV2Y0YEou2uAvj8
         GQ7mWQLHBkR8qjeaxswGsfJtlPtowH2sas1Um+An8EEX7JAewT9uJOIwsZb9k3Gnz8bG
         to1auudUx/skWt0mHQoJSWGaoZBZ0glaP8RSHXq15gkiB93FmzIb0snVgbK4iNqbxfGK
         1wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305781; x=1787910581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIEqHB2kupPj+LJwStZlpRLPHkBGU+WfDNFf0olHiVQ=;
        b=sLvK1Gl2R/X9/+4VUB5VwB4DuRic+hxbodxp0nzQ+Lh83vetHRpalxFDB5bAHsmpcm
         NWV3Rx5eTCnO7yTRxK35Ltv5PcYFpKc8tfRporSavZK/R1bCrHcS+HeSXxx7tInXlVZp
         FBlyC5B0SIAwSo2dQCGKapCU8sNINBlFTJEljOOrCxJI2GYR5nXSXDCYYefuBC6MaHvA
         Hf4kSxKsWBvBTkQji9+KTCV9xjeeMv1AN0mEEjbDLRjl4yuMoVc1NijSGAbUVue1MJL2
         NyYxtjpO4Ld0I6YEO7VDk6a5tgJZYaNGaBSAWktASXaLPkn2tlY0TwIdbBQyQesvHwMf
         7e7g==
X-Forwarded-Encrypted: i=1; AHgh+RpbZ24VtsHoQgbIZ7kC7MMcEaVqFcGnl0EyB+B/+KfogEEL1EtVS21wpBaIPabkwu4BGvo4BtXPXEY=@vger.kernel.org
X-Gm-Message-State: AFuF++k1YMyit9JpAdym7DFxn4F+nvD5pcOlHLrh+01PezBJQLRYvWq1
	ZWpku5sXazmVvFeTRlL3EWMxg9B1TBlb6ALcN1CmVlPMpll0ZegrIT8jE4idyANgH3U=
X-Gm-Gg: AR+sD10h7g5wenlr+S5oyD/ZwI0n5Np+xnC/R1mQvTH8nOzmmeju8lr4oakK4a8mFlw
	L4bYwC0RLP/gLLYeAeNKZi/eUmosXq/vf5cJaBFGPT0QldxNEW2k5AhqfV1i3kagHJemXIuZI21
	moYcUbX6Otq0jPzeSJlcL5vekrxTYIURC8o67lWD1zkDhV7Y9fN0uXeECipLl0sXcU4i1vAKeXp
	r0yg3J7+Zdgll2xGVDOts+GiLvVyt0I+Dkn8mcDYf67KgGZ/1NzXu7GBGBGELIjSs4aD6v32/NU
	NfqgFN8kEo3llReHM6fnKIMib7ZkIf5R2kDccExRYARPtargz6pAqccj+izleAudwt+l7ihzpYA
	HVzSe9iOyVpksA8Q8XD7fWHnlE+WvmzofMIwtjGjnuF3veNkAWeGAXD6jrvfoKThcxMocDIYbVb
	euAl49GM17+4qq/9dD5Fumrk0ROQbrg3NmVJHHZm51xZcH1eVvPWgoD+jA/4Hs9FSs
X-Received: by 2002:a5d:6f06:0:b0:475:da0e:744d with SMTP id ffacd0b85a97d-482c117267emr5590675f8f.8.1787305780785;
        Fri, 21 Aug 2026 02:49:40 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:09 +0100
Subject: [PATCH v2 11/14] perf auxtrace: cs-etm: Capture wrapped snapshots
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-11-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
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
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
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

