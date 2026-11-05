Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879140;
	b=jXU0/y8Sc4ieSM+pn7dY74Z1QfqDmpezn9WhopX6kBUV2yvZlUtaMpmqGXHzdCTR9RZH
	 Rl7UDlfDt8UvE6+QtdFW8w3YqensBsAJxq2UKGz4QKkCz7cXrPrhgkJNaZgQJtt4Ok1E1
	 lKP+ZkNPKVRj2ny3O7d4GTqsXCnnn26SUVAY6/Xf3XqAlStxbDKd6nqamtbQWfXjt1fy4
	 YUYqhI0HZ2fy56Cq1+TpHVNJs/kIRawtsOlK/qpwNZkLs2l1j1+fJWgvvg8pqkrP+iqcp
	 pAbI3/5gd+FxrdMFWYBbmCJqreacP1WTvVGcFvrh6Cn/BpFqkrLM54VeaoYzWYAQrUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=;
	b=C7xdEKRtD344CB3KaZ30XZ98ONVwrbWDP2pkD7PrPS9plyChDUDxf7Tmq7DKVN+nGJrj
	 wfSD2bISaq78C1FzaDfhUHxLMIQPF0MBavH5hdzIGTXxA3Va3xZSLSynM3JYSCrKdWFZ5
	 W0/vC7HldSAF8meJdx4CbZ5kgMK5U/TMDVaiAJrfExzvDrl2fgRK1+kDDDR8Rfu97hn5W
	 2Zk6Fi/aaoAruiOt3RIdlawOQc7zM/pZOmnaoRqddVSS4VUL1ehdMrXtwPMV08XaHqoMW
	 vMz0cdWgoTFq/V1GCmCeoY7k3z+gunluSU5GVFehQVXf0o9x4zohKa/z/luIWxdixdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OigcssTz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE856073ABE
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE856073ABE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OigcssTz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so15901435e9.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879138; x=1794483938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=;
        b=OigcssTz7nlgnoizVRlOpjIfNlQMYxJysGX/ivmf+5x9hf+CVPMsH9KryAZiQw7QH0
         /vqu41gvJKAP/y1qSAFLKkKZOw8CEuFH/f+bZ4FqYdVMwuLuJKIApP4ttly+ygvR0Tyg
         XC/5SMIxNvfOlglFtzrfvTgpgUZp/4LjjySPCBlr186qqpYzCXWzsqYjqNkHp+4qLRCe
         kOn+eNXThLa5ZF+ZVM+Wz4/S8AughtTgPCkslwnvK+IpZaAbxpr1lvvmH0xA14UNn6Al
         Nu3ZwsuxJdZFCE1Ud7yeN56/04ZPKvVO7rzJ1ddbg9ixSFu/7V1SqdvOijX27wuuNGoW
         iE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879138; x=1794483938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1EbclO0CpwqePVCV1L0T+e9zUmbTQ8j93ZAYJlyj8s=;
        b=2Mcqkf/U2qVFVW+HlSoSr/4hvc2GYWuaCoyN9cvbPrfumktX2Qf22b1+Pzi3LfOqTI
         +n7avw242/EjVFEvbFCXWQgLOR3/GG6Pr4IXkKQu43wbg9cJvPLgykM6jEc7twkCkFfl
         mlx5nQ5l6bdRSMDBsfmTeeBpTpKYTX3sIRTyJ8fOKlqCjTGmXii3GcFCNgagHpgoVyJN
         1cepfShcdyUVPqe38wOJU7Qc+k1ACrvHCceniPZZWb2ag7UP5OFrPVhaCe45gYoFP65u
         t6EhdpVI25gbXfDcsVjC/ul7SczE5TV8FKrH+baA3LsQUDoaGb18HbWuBAKrhVWcJEpZ
         LYcw==
X-Forwarded-Encrypted: i=1; AKwUvByIW1uO6nRh6iRspcitcjKUc0plinm67hrVx2QrNbTw7vzmeJrgY45rJ/jWEJZL6dDgTKDoGy5kMso=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dBTlmeMiFEU8nEEH6AAbOY3uMfOrYI3J05mqYRSHMB+vTkQmJ
	3pos6JiN4YRrTKt4ep0t5ER1/JNECGw3dwsjAKKYBT9u5Xr9XpRN9Xhc8oO8wEmHXew=
X-Gm-Gg: AYBFou168PJOr93pRStrC2yBXH3D1G5S2FBrmhJ80+aQhhmh0KVPubAMM3RsH6bvyd3
	+2JSZOzbbU02A/O1aqGNCgdOz3TPNL18NuKzqff0wvvSobqfyjQ0ZgcSt4b7vxQQwyCY2FItKS4
	tlDBZ7xL0hAgEeTuseZxpXFJ9i9lvrNY/IIvJRzw56FdE5Xgqr5Rv9prN/fkOoebNSqZVrKJwfd
	fca+akJ2fq72FqBgBmLB591b/XWok4peb0S2j02Svfi8D0VadYkpQ9MXNvdCh01OzuLOFzNC4/S
	gPCg+RbFYw1pVHNCUzs9lj3ldzczPypZf0xVjiPgiUIZXlPYDoNZAw7dixRXF93mMmOfobGev3V
	lTDuQigTEvDuBl9b6Hy5/bTXRvwRm9QxfInsx3DQv3fWL1N2hlg3iBMWCR+VLbAs2c4cfekmR1C
	/xi/oWZrro1zqQN074aIGVCMRwJM0y8/lJmIIbrg5XsPhiPf7wvc0kbX2EE5py7IeYC6FfydrBb
	WbIjnolQ3xzsxgxTbfTpLhr9OPXkgPkTQns4Uax2GVbfDKnFaig1ea6b0mMoWrHJRseu92PTLxT
	8jrSrHATlgN76/CT85/FawFy6fq3EhEd
X-Received: by 2002:a05:600c:5295:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b3c3545146mr113538265e9.21.1793879138032;
        Thu, 05 Nov 2026 03:45:38 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:02 +0000
Subject: [PATCH v4 14/19] perf cs-etm: Don't print missing buffers in
 snapshot mode
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-14-7759e0ce2449@linaro.org>
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

The driver produces lots of AUX records for trace data that was never
captured in snapshot mode. Downgrade this to a pr_debug3 message as it's
only an error in normal mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 320164645f61..51431a4d5db7 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3361,6 +3361,9 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct perf_sample sample;
 	int ret;
 	struct auxtrace_index_entry *ent;
+	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
@@ -3414,8 +3417,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
 	if (!found) {
-		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+		int level = etm->snapshot_mode ? 3 : 0;
+
+		pr_debugN(level, "CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+			  " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
 	}
 	ret = 0;
 out:

-- 
2.43.0

