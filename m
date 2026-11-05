Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879135;
	b=ChzcNDY4Yj+8PaedbnBCUzbMaYuAeYxtwEP5xLSxw1/JlMVmvzjiIIFjRXG9V+hNiK/H
	 FUrLP5l1lOFn0F4M7J3mEPoBt/f2qD6liP1RoaiAoitMDs9CV1VY+i2Z7GBBiY9AXNOYW
	 i9OJJ5o4HtEpyijE66UVeB8neW/vAbWsbfYLaK0RElojACLOjNQlOd/RcAZ7J9qx7P0H9
	 xn1ZDnj4o6+FrRekAbitj4IRvHaAmqDP6GCkEg3zFbrmqkHF+svJWanoEQNTLGs0CsSJp
	 SCwZO9mo1DB0GVfhCH5N/o9oPVTr8s0S8ZDX1UNqNhI2ZYXinAU3/JaWO++m18NBJzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=;
	b=utjBRF5aTy+svPYFTleuUw8tha4a7N688oDhO7iDy7+9SlXSJZ6bO1KjsFJp6oQ6hor0
	 N9cCr16+UXeIvXOIytYT/SOFaZBsXhTdmft2tH3r7zv32iH5Du61U4J1PA3eASKui0sLo
	 XkU+VURsmtIjlD739tbrK/YI5OIN6nX4yG1sOWSnqo2lToy5Pp7Yqb6KamojnalNdr2ca
	 Trd8wgnKamTZ5IST6UTQOat2gJS0ajuoc6yRA5pOOlF9WbJgskLVRj21Ut6EUIn6FhgMJ
	 94Xgcj1rJJtH2FsKsQjj6qG4Q9Qu6ysONB28unHe2TfLYC9QJDv9h+Avn3vr3tPeJLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h9MR7kCI;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5026F60A6F43
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5026F60A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h9MR7kCI
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so13634545e9.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879134; x=1794483934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=;
        b=h9MR7kCItMgjRuYRH4dI0FbxJgPnXYrpBMCzkR8o4gxzFFAwnxcHVjnAHsy9kds3Ro
         EMRbKSgGRDJTI36GvX/FWf6W+kGGNOm/rqOK1hKCe5UaZOaCX8YiSmDKynYrCE8wZWvP
         oBdJWXUGEvxRhq5+f1WUVRIzz9K1oxSwg1aynBgn7RnqLSwH5cUWAmnZi1Pwv9kX/uCl
         2OL8RXs+cBUQCtUP+Khx4ZVzr7WA3yE9SDZXCRKtZBOLgA6JeGjDf2dY6zxOuZOJRmLL
         XrRKMkQBSamqX850sEP4oV9tHdGl7AR1PQ14NWkezJy2DQdz18KPXKnZ84/GzqnFY2mx
         ZYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879134; x=1794483934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0h6WPoIHtebuZtai11cK1SScVPN57oWYqBqF0QVqU/0=;
        b=ctqRjftYw5N9rTkp/nFMTDTeadwFCNSTVhppj8m4T07ybvWkFrYLaV/kRzidg5Vyqt
         78QQmSivGkGUpFoj247uKm4c+CAg8iqM6pf9I7EdceCp76PIvP/LawRzLoC7l9yrW6Qg
         u7xVdyJiGlvWqfCXBIsRSWZi9GSOsM5rTKur32KN1jS4Bw6GFGnux2Dscm5Er+TzwSrM
         rAoruCkGLXlMHsLyoUEMBomy8NRQ0UR3JogYvGiftF8BlQXj1s7HMjNPCALjnJw3lqqJ
         DBuz1fL8WYgbiuGbV2t2tE8WvNj++1h3hJhEeKUPeMaUsxNOzf2ijVrDIbc5a5PSS2aq
         iH6w==
X-Forwarded-Encrypted: i=1; AKwUvBzhc8nRUBft8AgrKi9Xrk6ZVd9AR06ACHJZnSavE/yU3ZFXsEaFSHFsSyM+f0hMJajZbvodyZ1WkCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JgX1MPffF/QMLd6NS9UO3gJr31xWcqbkMdvoyjJgh1/jzRSV4
	T8pJ0hjCcCyhk+fSJNbDx+PmNqVrb7/VY0Yyp5gzA/zI950LDsm1z7pcBoyzgWMWK1Y=
X-Gm-Gg: AYBFou2qmcFyXqlOZ9m+uUdR4g7YtvCNjAkHa0gxpb3rY2mtDooko38UVq3FlG4BwQw
	/3HkdEexzkJjAs87CZVkotwjEEGi+T4b0VF+0G9XsCTfNWMneCgI4t+BznhgwOQ2hKsQjJi4yJ9
	1w+qeA3peIfXnwF/6tGUsyTqTzfCoM80LDyvZeRBkirlTs48fBoqSemPmCjGO2aIzxduA4Ee1Ws
	2eojr6V/0vJJnkhAl4m12pz3IUo1qwCMZ9pZEYfW6j2yPTiJBBBBRVXIgdyPFxYQFos/QBkGs86
	d/noU0VBc22pSRk6+t/PqF3u4H45DPyFEtM86L2LevOSzWQT6Aw7HSoBixTGHfSuYARFsP4ZagA
	/O4SznEhQTCCFeEinlMRAsyfVhNFlBgIOSgzD65uVhipZQiCtLdhzozTl/WJD+OTUbMjfLJ5PGJ
	uDadxXAuJ5eLfAqrBIhHvz3FHxhDyAOSAgjHQZ5PA0IOxf/6OhVKfoiTPUsiVgOEx6I1gbYaI8G
	d7NdiMip2fcAXMNqOj3ULLk3LtNOl00qxoUfk5G0tyo2oTDx5xzdaqcb+TtGtJDIkmv3TrTFyHO
	k5tJwocS8X9Ttd3WTUz8wKgI1VGAsKIJ
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr414154955e9.18.1793879133683;
        Thu, 05 Nov 2026 03:45:33 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:59 +0000
Subject: [PATCH v4 11/19] perf arm-spe: Use generic snapshot search
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-11-7759e0ce2449@linaro.org>
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
Tested-by: Leo Yan <leo.yan@arm.com>
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

