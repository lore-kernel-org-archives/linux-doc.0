Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621759;
	b=jwypgoYkMccmOmRKTTmAh+h2c025U4havs/83ToQ9LEZDf/Ma0x2SDmNIdfg5FBdL6iO
	 5S76BnPS/OO+TIo9a1yYadUjCf0s2h4NmMUM7ReDMxtZESGY1NOVgMf6cOCW6KWDmk1ue
	 qE/kQzOR8zrNyCRw49tE5vm6cFKe68lsTnBEt1xM61e1X70HU3zjbHXgYj7lBHKvn5SK3
	 XuGIyOA+C2Odl2CBgm3fMWau8VcxqSa2abwFN1gtREQYlA6ifB0i4iVKxcjWdBD8Jrss3
	 1a/P4Zc2VMt6fhu+hMlWrtRif1k9vw50x7lPB4f/vLkFjOYTScrjzuW+bYA1lSvu6cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZFE+K6ibkytnijDp2/HAIN0tLVK/PlyfhjsWm9snroY=;
	b=gpFAPI1bcFbMGVzyj/3noZ03weHBTs7yNV5+c9EIlWDJzFKx0SCa2MoeAbKJ++UUl9Np
	 jEky8qI5r3KotGbIO3RzHqNEJ0edBzwke7cz3gc28UQv3vXycK7HtLIo0hrFdGVqNhsty
	 a5OXeN1bH0nUWD5c5VGA7UrR5H9KCFFc8hmqD0pI81klrrjTjP/CLCPJYMEp7vS17TzdS
	 j5/zGx9nlFYRGwFlVsYvqjnHtKKJaOp4tt4X/+a5ObB0AKGTJsc9AdHihcUE7/0Dc52yS
	 ims01W56AOMbJliozAYTSemMXykrvu+ipjRimi93zStea70kagpj5BiYLOBLk03PVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fXz9aRkJ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EC260A2605
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EC260A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fXz9aRkJ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso22727485e9.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621758; x=1794226558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFE+K6ibkytnijDp2/HAIN0tLVK/PlyfhjsWm9snroY=;
        b=fXz9aRkJLaTjV7AFiNRlStVsxEPcmpqoMgyZdeveE7a+PwAt+A367A7z7367lernMI
         7He/3xoNkO3bQ6u9QZRG/sL6M+xeYI+IC/F65/mPI+C8y4Izs7n6F0us6MWkE1VNdx44
         KJBuJISsh7YIz+5l2mvQXRjguygG4/jCLjIE6Jo2Gg6/xoWZ9FzmARLaAnQXJUvxTvcu
         grFlDfuJoR9vM88vl5BWKr/VqEaOx5rj3Vt7HNOWZJH1cx5apR1S4+gAprj6udNpFXmr
         N30SZsmyfh0bk4PWnUUfFbgwEMc8zaclRU6RMJQupou5q50bYTXLPAkK6Tfz1glZZ2xn
         hSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621758; x=1794226558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFE+K6ibkytnijDp2/HAIN0tLVK/PlyfhjsWm9snroY=;
        b=H94JsTGkUymgLgS838gkSkf/DEQWMk9S0fWP/ClhCHLMmzemxMUp3Ue8IhDbGS7Bcq
         WPDKWxIRd3aQxSmQ7oNl8XNP43D1wwofGsTJ/VIDQQM6LTmPDxvwFkUGVYTrd6G11l+i
         R1aUXQjXo9G+Az/VR9IGDWwviyEGE1YxfgSmg3uw9Kzb9Vi425N7xOhwGqCr0caejZK3
         gn0s0CSAvdixW65afv6/GrP3preRgb3UbIQhxNi5KRZe+NbWOyPEhZoM4HIaEVzUnGut
         fd6KWhddPvyoNLRyOzJ+ajzSES0Zc8QEQnrlzXMQ3EiUb1myMInNMotOBnIwT6Mu2ora
         ERkw==
X-Forwarded-Encrypted: i=1; AKwUvBw8pkE/l2wp22jpkvAKqvD5ZLAUQCxymNGAOk8Ne31NNlHT5L8CbHuEdQ01VPxZ81gDyL2OFvsOP8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ31TY1YNIjQsukcaWa4xhtG1hqKdbvEMYqLMdtZH0RweeEBjpO
	wHJzD0ew4+aySgBZ4o8pK7g1Rm3TTGHv20g045zk+n8iGEGIF7q535Y2MW4R4zUg4vY=
X-Gm-Gg: AYBFou2K18tIRnc+AjKiTx1wCYlvBH1mrpMg3hin9IF2Rm/1zbvpzruoswY9lhXZIV6
	zEkIXK7rMuMgEYA3auaPLi0G7aQnnCuh36CPxTcZLjwiVbPxXpqFBkxbKIeq6AvMPAIW7mTbWM6
	2m5pG624GFF6hm6ZeKMdQ8KSw0xhFHS+GiwrBklQDMqcRX+xZTNoiztUPDZetDgB2FuVNeoj73F
	TLNHe3TfylxdDJ8Cb8ImWrGcZkMM9gN2CQ1t6uNtRHbjOskFbMdQedZjW5xt9RFnOhqWmPFUAbb
	nypbk0WgfoXzzVizYRv4DkCjEXK7T/DiS0il9qsPCWisuGbmu1gKYg7aNEmXYcPfk81I1jl/GW0
	sq/t2oJ1eZfQRi5j2yrGg7cFdDRElKxed24gBdG7u9xsw/1HW5j/q0PYVj/jQiiqJZO0gOALKI3
	e6N9l19uBDXWHHXHjYOsLWl9iK5sOXnFgDKFu3lwNvsy/0vdRg+Eguy49JHKVMJgmXhYnnOAxn3
	uoi0rF5vmUKjlZVA42KgF6PnpW/SwypU1XGzJb9Vygn8fxgF9kCusZG+MmDqtYghJ//U/Pqpccd
	jdk2ayk9QhcwgxSJo3CbId5VzrV+x5tKZLRmVYNL+JG7Nd1umsgvmQ==
X-Received: by 2002:a05:600c:1d07:b0:4a5:87a:50ba with SMTP id 5b1f17b1804b1-4ac18e5dbaamr222388115e9.33.1793621757770;
        Mon, 02 Nov 2026 04:15:57 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:57 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:25 +0000
Subject: [PATCH v3 11/18] perf arm-spe: Use generic snapshot search
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-11-dbcb0c281b9b@linaro.org>
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

The new generic snapshot search gives a similar result as the
reimplemented version of it here. One slight difference is in the
pointer fixup. SPE has:

  *head += mm->len;
  *old = *head - mm->len;

Which gives exactly the same result but written in reverse order to the
generic one:

  *old = *head;
  *head += mm->len;

SPE also had a special fixup cases (if (head >= buffer_size)):

 * head > isn't needed because the SPE driver always wraps them, and
   __auxtrace_mmap__read() handles that anyway.
 * head == buffer_size isn't wrapped by the driver, but it just
   indicates 'full' which doesn't mean wrapped any more or less than any
   other index in the buffer.

Both of these cases are covered by the 512 byte search.

It also didn't have the special case for old > head for when the wrap
heuristic fails but the pointers showed a wrap had happened.

The other feature lost is that this search only looked from head to the
end of the buffer, rather than always at the last 512 bytes. This was
flawed because once head is close to the end, it's likely it could
contain zero padding from actual SPE data and a wrap would be missed.
It's better to err on the side of caution and mark as a wrap, rather
than trying to optimize by limiting the search from head onwards. This
can mistake old data as evidence of a wrap, but for false positives
[head..mm->len] contains zero data. This should be fine, as zero data
are treated as PAD packets and discarded during decoding.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 147 +----------------------------------
 1 file changed, 2 insertions(+), 145 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 1ba803a8d9b4..8d6a2bde2892 100644
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
+	sper->itr.find_snapshot = auxtrace_record__default_find_snapshot;
+	sper->itr.snapshot_search_bytes = 512;
 	sper->itr.parse_snapshot_options = arm_spe_parse_snapshot_options;
 	sper->itr.recording_options = arm_spe_recording_options;
 	sper->itr.info_priv_size = arm_spe_info_priv_size;

-- 
2.43.0

