Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C874582FE
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305788; cv=none; b=loiPyqTmGjX6XOHGxjLAjoD/oyUguGUP6gajSpP7iPtPFzyrND9E+cgJQ+jgpr1FP8p7HEmCrBIAKdf7QoiLyL2aAosxpcZReRcm4d4yhx65cAz/cJrSzBZcXH9bC6rQCcAYzwFOWwQaLqJyyUlQBzNRBLdh2Zdy976Re0O2Pqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305788; c=relaxed/simple;
	bh=kA5LbSGzSFt0yV/2KASUph8Bp02kP3gLVrrUuWxXR3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMiPQBttaCVQf+K/6maISbZQawX/FFNIayoohnpIvdklCCzcfX51Ygl8Rw+vsMvZFiZ73CQ+3pinHB2OMsWHj08eQuD1m/ZUab/mmnMwQ+TJ+KTd14cAzfTmhjPFAZISYANQKMoiVfj0UCAGZrQO1JnbliTOMoSBKoPUHqPq/Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xfahit8L; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xfahit8L"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso726727f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305775; x=1787910575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbdOfomTAI7oLSknzQNqLoWXfzHYXHRHempsJBX4UAA=;
        b=Xfahit8Lf3i3U+ZaKl0gRkU7HGroGJSv/7iuto/dbzfrweQqE4TcS9VkLcG49knPiK
         D0Yi3bhThTEYqNdwl+Ld4zQC0s1QuZWaloAiGmoOKMQwH20fvaUQtQXsfk/J9Ax1yXk+
         Q4q3jHwvyJjbBOBzCPvOplz0gGHsu+PqcsvBQgj3Ifi/IzEUOK40LwrtS7LvAiobDq72
         cMZM/ZJOUL2VLhzLMnNbgbcwXGYZnjmJlTeIhLV4qmv52btIrDZTZlotZsM9+e3IoYQB
         Fyl2auc0gTCOM4GUcf/vrth0msDLeKS0XgqdA4KNwMEZq0+vjTPfP6xcfWxfU36kzd9c
         xhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305775; x=1787910575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbdOfomTAI7oLSknzQNqLoWXfzHYXHRHempsJBX4UAA=;
        b=n8CwfzFsMAOSOtBZcZHxBiaIVhOpQnf3O4CpGrO3QfD9WomH3UR+2h8AEnMCdiAWKj
         EWwHcEdSfnB/8PsaU/0KhfSiNUZ2iTZzh988luzT+yiSTK3kdb+/OQLA6SsVij76GuKg
         Np668ntE5A7PPdvXI+lp1kUTkqL93rsUjU+Y7Rvf0mBmqUP+/hiH3l90z+QN1DjZJGpP
         0mVZjjFH6Wzk+VO+tchvQ1w7/QZRbMN4AW/dLrkGS03DH/gbl2fqS7btDjuXDmptix2w
         SMkqUTfRZB51Ky6cjgowXlJ33Rp3ZwTMGFha64BPxny43kRn4h2Rq7tbyNeeExV2uX/4
         DEyA==
X-Forwarded-Encrypted: i=1; AHgh+RoNt+VzeSlOBmsPKU+1++IZD/9M6lsj/Vwc+BB8LULcEXnpNpl8hKcbL5Hn9oxM5Ed7R7A9DpEdr30=@vger.kernel.org
X-Gm-Message-State: AFuF++myxs2W7nYsHQKuhL+Bzo9KKUFYzY1r+JTi6SFwD1HQG1DI8Xvf
	YL5dmLJQGMZVeyEmfX05HGo8HEmR+2gDuZlkAIvmwZ2mKWxiGMOMpJdcrrAeDNx87Do=
X-Gm-Gg: AR+sD12XmKu549dOD2ik9cuSlPjAkzullcMLM1B+ruG4zzUAu7aXH2KNmy/k269PPsz
	4SgiBaNDJzk76KDhoKcxtxpILTiBXlc8OBgFVDDZEYoSb6xsp0pLw/goR8ohaJyseQxMQcAo5Ob
	/qcYDPTnZ2n0HUkY+kxVLDj1wtVqsjR35PqvOh2gCnM6P+6EjrVb4fav64b1mo0wCdCgydGt2xS
	Bhu0qluQPJcMoznBzYrl0FNeSpWtPtpjs5ay2tqNUQab1B170KTcqIY5rnLA9ivWNo97HsY0pCb
	JTg0Zm2SMgzgKuADQ4/sBrYtGY2i3OF5RNFo2Q/I8XTr8nqaAoRy7Y7IIIb1tDYaNGLcgLnO+3o
	Ug8GxeAH9UmmDnvw+abqFxc5aLpns0aMuL/QFaGpKRIbPz1tfkJs91z9cbwOX/99qtM/lUYulD8
	JbqVJuoxRLbEkJBX8po3Ugml5VUNBI2nVmLtAKx10hk8D/TzKBNub32nyeCnSgCf/J
X-Received: by 2002:a05:6000:2305:b0:481:573d:9d29 with SMTP id ffacd0b85a97d-482c0b96bf7mr7076525f8f.14.1787305774666;
        Fri, 21 Aug 2026 02:49:34 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:05 +0100
Subject: [PATCH v2 07/14] perf arm-spe: Use generic snapshot search
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-7-00c4fd0701b4@linaro.org>
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

The new generic snapshot search gives a similar result as the
reimplemented version of it here. One slight difference is in the
pointer fixup. SPE has:

  *head += mm->len;
  *old = *head - mm->len;

Which gives exactly the same result but written in reverse order to the
generic one:

  *old = *head;
  *head += mm->len;

SPE also had a special fixup case for head pointers greater than the
buffer length, which is not needed because the SPE driver always wraps
them, and __auxtrace_mmap__read() handles that anyway. It also didn't
have the special case for old > head for when the wrap heuristic fails
but the pointers showed a wrap had happened.

The other feature lost is that this search only looked from head to the
end of the buffer, rather than always at the last 512 bytes. This was
flawed because once head is close to the end, it's likely it could
contain zero padding from actual SPE data and a wrap would be missed.
It's better to err on the side of caution and mark as a wrap, rather
than trying to optimize by limiting the search from head onwards.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 147 +----------------------------------
 1 file changed, 2 insertions(+), 145 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 1ba803a8d9b4..d8c4a1d6c621 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -26,7 +26,6 @@
 #include "../../../util/record.h"
 #include "../../../util/header.h"
 #include "../../../util/arm-spe.h"
-#include <tools/libc_compat.h> // reallocarray
 
 #define ARM_SPE_CPU_MAGIC		0x1010101010101010ULL
 
@@ -37,8 +36,6 @@ struct arm_spe_recording {
 	struct auxtrace_record		itr;
 	struct perf_pmu			*arm_spe_pmu;
 	struct evlist		*evlist;
-	int			wrapped_cnt;
-	bool			*wrapped;
 };
 
 /* Iterate config list to detect if the "freq" parameter is set */
@@ -497,146 +494,6 @@ static int arm_spe_snapshot_finish(struct auxtrace_record *itr)
 	return ret;
 }
 
-static int arm_spe_alloc_wrapped_array(struct arm_spe_recording *ptr, int idx)
-{
-	bool *wrapped;
-	int cnt = ptr->wrapped_cnt, new_cnt, i;
-
-	/*
-	 * No need to allocate, so return early.
-	 */
-	if (idx < cnt)
-		return 0;
-
-	/*
-	 * Make ptr->wrapped as big as idx.
-	 */
-	new_cnt = idx + 1;
-
-	/*
-	 * Free'ed in arm_spe_recording_free().
-	 */
-	wrapped = reallocarray(ptr->wrapped, new_cnt, sizeof(bool));
-	if (!wrapped)
-		return -ENOMEM;
-
-	/*
-	 * init new allocated values.
-	 */
-	for (i = cnt; i < new_cnt; i++)
-		wrapped[i] = false;
-
-	ptr->wrapped_cnt = new_cnt;
-	ptr->wrapped = wrapped;
-
-	return 0;
-}
-
-static bool arm_spe_buffer_has_wrapped(unsigned char *buffer,
-				      size_t buffer_size, u64 head)
-{
-	u64 i, watermark;
-	u64 *buf = (u64 *)buffer;
-	size_t buf_size = buffer_size;
-
-	/*
-	 * Defensively handle the case where head might be continually increasing - if its value is
-	 * equal or greater than the size of the ring buffer, then we can safely determine it has
-	 * wrapped around. Otherwise, continue to detect if head might have wrapped.
-	 */
-	if (head >= buffer_size)
-		return true;
-
-	/*
-	 * We want to look the very last 512 byte (chosen arbitrarily) in the ring buffer.
-	 */
-	watermark = buf_size - 512;
-
-	/*
-	 * The value of head is somewhere within the size of the ring buffer. This can be that there
-	 * hasn't been enough data to fill the ring buffer yet or the trace time was so long that
-	 * head has numerically wrapped around.  To find we need to check if we have data at the
-	 * very end of the ring buffer.  We can reliably do this because mmap'ed pages are zeroed
-	 * out and there is a fresh mapping with every new session.
-	 */
-
-	/*
-	 * head is less than 512 byte from the end of the ring buffer.
-	 */
-	if (head > watermark)
-		watermark = head;
-
-	/*
-	 * Speed things up by using 64 bit transactions (see "u64 *buf" above)
-	 */
-	watermark /= sizeof(u64);
-	buf_size /= sizeof(u64);
-
-	/*
-	 * If we find trace data at the end of the ring buffer, head has been there and has
-	 * numerically wrapped around at least once.
-	 */
-	for (i = watermark; i < buf_size; i++)
-		if (buf[i])
-			return true;
-
-	return false;
-}
-
-static int arm_spe_find_snapshot(struct auxtrace_record *itr, int idx,
-				  struct auxtrace_mmap *mm, unsigned char *data,
-				  u64 *head, u64 *old)
-{
-	int err;
-	bool wrapped;
-	struct arm_spe_recording *ptr =
-			container_of(itr, struct arm_spe_recording, itr);
-
-	/*
-	 * Allocate memory to keep track of wrapping if this is the first
-	 * time we deal with this *mm.
-	 */
-	if (idx >= ptr->wrapped_cnt) {
-		err = arm_spe_alloc_wrapped_array(ptr, idx);
-		if (err)
-			return err;
-	}
-
-	/*
-	 * Check to see if *head has wrapped around.  If it hasn't only the
-	 * amount of data between *head and *old is snapshot'ed to avoid
-	 * bloating the perf.data file with zeros.  But as soon as *head has
-	 * wrapped around the entire size of the AUX ring buffer it taken.
-	 */
-	wrapped = ptr->wrapped[idx];
-	if (!wrapped && arm_spe_buffer_has_wrapped(data, mm->len, *head)) {
-		wrapped = true;
-		ptr->wrapped[idx] = true;
-	}
-
-	pr_debug3("%s: mmap index %d old head %zu new head %zu size %zu\n",
-		  __func__, idx, (size_t)*old, (size_t)*head, mm->len);
-
-	/*
-	 * No wrap has occurred, we can just use *head and *old.
-	 */
-	if (!wrapped)
-		return 0;
-
-	/*
-	 * *head has wrapped around - adjust *head and *old to pickup the
-	 * entire content of the AUX buffer.
-	 */
-	if (*head >= mm->len) {
-		*old = *head - mm->len;
-	} else {
-		*head += mm->len;
-		*old = *head - mm->len;
-	}
-
-	return 0;
-}
-
 static u64 arm_spe_reference(struct auxtrace_record *itr __maybe_unused)
 {
 	struct timespec ts;
@@ -651,7 +508,6 @@ static void arm_spe_recording_free(struct auxtrace_record *itr)
 	struct arm_spe_recording *sper =
 			container_of(itr, struct arm_spe_recording, itr);
 
-	zfree(&sper->wrapped);
 	free(sper);
 }
 
@@ -674,7 +530,8 @@ struct auxtrace_record *arm_spe_recording_init(int *err,
 	sper->arm_spe_pmu = arm_spe_pmu;
 	sper->itr.snapshot_start = arm_spe_snapshot_start;
 	sper->itr.snapshot_finish = arm_spe_snapshot_finish;
-	sper->itr.find_snapshot = arm_spe_find_snapshot;
+	sper->itr.snapshot_has_wrapped = auxtrace_record__has_wrapped;
+	sper->itr.snapshot_search_bytes = 512;
 	sper->itr.parse_snapshot_options = arm_spe_parse_snapshot_options;
 	sper->itr.recording_options = arm_spe_recording_options;
 	sper->itr.info_priv_size = arm_spe_info_priv_size;

-- 
2.43.0

