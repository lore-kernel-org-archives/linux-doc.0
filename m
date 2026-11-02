Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621764;
	b=uKps1TSIsiB1tPRoK4gTqSLhYx3R9Qpy2qdcD8mGAXdCSiNtMsnUbVDHE5TcS3sUxosq
	 W70WxR2JO4Wv7mnaCMDMM2QjEyd13yqLiOA1+Tu0mZPVvYgBDOWS+SOog/Px9iT3y8Qtq
	 o3d8pdiHAdGXuNMHb0Yu2UgvsGhPYMsUujnDJi+rvM0rxAza4r17ZW/QMY09Lu+JFk/I3
	 WlRnhSGxlBzThr72+Z+QLj+c02qNnlc0h1zxvGyYABes/IuHyC5BhVqO5KOe4oZMkTkua
	 FllIZ9GTeHPYCICioVI0D5crbuJuWAfnB9arg7yMcFAlgmhsqoj9GLGCjsPDL42P9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=;
	b=XPUkpTqmCJwsWdwrFICIlHYnsZTZth8AfHotbSYJja+uC6pbs00MDpZXP4JFHxrOuTZM
	 WTF9F3qxjF/qdf8jAhc+kidGV8J3UKVgJvbiToxuXemtZPkyd46tj8ZzBfyHv1oLWUrAF
	 8PIoRZCqJoSOTmPUhEHDOMaUpR8bzUEkW6pHC6dEu4IjiJnu9CNa6bYFbXFaDY3MDXVVd
	 D6T20AZORdTuqvACsDr61Bdcy+v++jUZ5ZLWA+ApgAyAIQPC0+TkGcBvHt9sdgbRg1yND
	 +hN0W+zM45W1yI/J1/ClUwwsGj0uU8S3H7ogAkSR6Q3vUaQcJ5pgW7nau/NrWBvkKjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IPl+jZoo;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B9606B1BC
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272B9606B1BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IPl+jZoo
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so25631115e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621761; x=1794226561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=;
        b=IPl+jZooc/Ocqa/xTyy0eTf4YzOERgAZD3gXOxXDZT74tas2k1vjLvWMwevPVRcqBL
         maKGsTaW6Sv5kdK4mbpfYVPn66mrwKrpPWsVgJXcnXPiaUJ5s2A5Nq5JeQtYBrGw2aIS
         vkIiiLOXFvzhPDz94DN/xahwm0DiDHQnsYxlp3FGehTNRUkBd0ixM8SXHBl5hqOvWBY2
         PD593Ari+fFZSjZZy5augqgkV9jBYii47phS4MVNOesAnAn42QdtkY5VcQK2DkqXRDr6
         RAZSX2JrDQhRmye/f0pAV2czhLBeBLCCHYSbDWpkXsYywwRfg3VHR7WvTJFiR3oHRZVg
         RNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621761; x=1794226561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9NpFkRdVW/EG2TCUGvGJ4MlQ2xcOGmdMzm207Q8vjU=;
        b=RWtaWU/yZDf1cEy+ZIrls+CgsA9Wxw3coK+WsNHgJHvkCeA+yc75s8Ydo+lUT3cK32
         LedmBxrwrHRf10FhCxsvryKVR3rip2hPthIxxOfXdgDyDpZwDeR0bQsHIAvlKReSKGts
         yJmZMfpA34ikuNziPB2UBkjunpCuQbmrCMgDW6aLxGSEszouRNa7sHMzzUYS34fgljuA
         MU9fo3V6bvndVaoBFFTURRfRHPHnHsB2zKhTRCIad1zfcn5q7+O+rHoR2WAdSPCNOR2J
         VXvXXMJQc0T5kEs5kVfZsPjheCUBPGVtyRE3qt4sOzeyM/E2rXO0jYK1xpxowFuO8sOh
         zzhg==
X-Forwarded-Encrypted: i=1; AKwUvBxY35NWG/0IyQOUZ2BY0UsBH6CTpSKu2N172ZfOvjPLCUbOt5won6hosvohJGYAs/iaLGKhIHmovzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLReE6OeNXHFWFnS/izMfDkEWwOXg2VQZgAKF7n4zb7vO3GIfZX
	+lRrjheLcnF2X4QEINnOIp+8epJDHGH3jG+4M6D2jat5umyaTPq/8Enq3plEONTowqU=
X-Gm-Gg: AYBFou0ZF7hClvFC4B4UUeLyYzo4blei7Nx2xHNE8QNXM9eAjJUX6nz+waKpIaYMRIQ
	8/lZL2JV1zgklEMFYBRsbmWD+fvtKRAJiTt1sTG6xezbC4P65n1StChkFwATZAuFZVucMR9+UM9
	xA/SkmkJYO3T13Wk8okOSbJ5PLaMSXJ9yvl7PMCyNS/BTvXQK3thy3RpP+7H6M9IwX63vuccOQD
	2mDJqakN0dyrcXpoZbTSVabIT8QDbUEXSaDDJRb5g7OZ2EpId8TjVMu6sCjSYzy/3JONIwjSL/M
	bwsDtb3Ge3k1R4NFU642KvuTebVEGvdFy7OA3a/davoUTgaDpri1bQ+cl3A6TifCpYHV3CHrbMh
	ujIfU502jaXisC6e6/Cc1DXLazh+y5WpmBf7etE4gIdie7GMhMO/B97UmfA+XmU2ajO4AxdQMc5
	cotM0EUtlPEi1i4s52ISkHw4ZQeDqa//e6nGrgv0KO91Vqe0bDBNxHh79slNMIUlCiLUhyFrNVW
	iVi2bxp5h7Q2H86Mc0sIU7itIla+No4xBiWlSr/kIiyGAIRYlDHVtRZRXNPwsaT+NZUHVFWw3+Z
	QuAUakiIREXyotFkYlGrBwQjr7gwQa2iumK18+QIlkZoJQV8im/M3A==
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ac182dc8f6mr222521195e9.34.1793621761658;
        Mon, 02 Nov 2026 04:16:01 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:28 +0000
Subject: [PATCH v3 14/18] perf cs-etm: Don't print missing buffers in
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-14-dbcb0c281b9b@linaro.org>
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

The driver produces lots of AUX records for trace data that was never
captured in snapshot mode. Downgrade this to a pr_debug3 message as it's
only an error in normal mode.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index e899d82b7c93..c880a1ca7533 100644
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

