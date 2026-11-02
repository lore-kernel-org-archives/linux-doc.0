Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621745;
	b=VpCZg7muwxI/x093Be8XvJzZgFKlG7/0QmxDf1puAnwqobQALlKEWV3jKGuSxDcdKKrS
	 29AuBsou0aiMgCukNe4mI4oQiCdM6jnlYEWxJkAEB9JY49VfvW0SWuxvtWLT2tSyfsNJN
	 MKeRzb0bsE3/6NkJQUe29BwtVjWUc+Cm0I5W0l84viW+0PZOVw+n36bk7rBkip47nlCB3
	 JIelLa71fqQX/RLeFYcLrha0tMYfYytHr6U0DcoEMqoUJ7/KFUCopaFU/26ApZQq8rrz3
	 5EXOsqx2t4OGUKONeO28vBPI4N8K5yHAJBMIOgsZXjwoTkPLrTqMn5fAPbtMB0a+9Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=;
	b=E6GA4sLsXQXpczcJg/UFwuMouVaTMBAhLDXB5uHWdzVjvIQ/+DS999RSb/a0Tqe+Jy7O
	 gunC/+HeWV789nG9Brj9W1sVb0AwJ+adTCA+Dm4wDxBMAHnH8Nhm3DeK9YRF7r3SATx8F
	 QpBvTTjXU8hVn2SWoFKOXuT6ssOPEA8qWrnZQQlTOr7WXpnBBM11SlMweGIkjwyKvan8X
	 BUc4O2f1k4JlqKZZb1yFDbhscUaI/bnl4knwzAUQ3+su1vkPkJmAqhw2dED7PcY9ZDSHB
	 wMXUs8OK43Y2hbqo6oGGIIXAlFPyfKRTCl3UjK6EqnNTLV24N2M77qHY9ev9xiLlDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aqwZ2akk;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2F606A334
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C2F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aqwZ2akk
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1497651f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621743; x=1794226543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=;
        b=aqwZ2akkPQhQeixCVlzcQM2YG7Jv1gccwfo2vmMP903VPzwpVbetjX2tQDjmvheEY4
         28kcotK1k3rVSsN+cIev7PHUfWM2gqKlcWZrwMUuzsWNGUwxxLGxLPUj5yZLdINA2oXk
         8NRXOkPhPQyiJwBxKEMbH+8MuJKD/ZyRXLi3BK/Kz1Ee/Xi8i4+RHwojS1tAXZFnVU3V
         Nmp57UN5qtLRXKDRa6yUtNlRI8/ruM9tJIv8b87PvoBZOshK1Bqwg8WfWJkilSLn2NyR
         VdRDENxCSqPhsXYnDOwfECKmn1bg739upo10f8zZa+Ho4pkztl1UyYi3RTaNa6r2fMF1
         C62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621743; x=1794226543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=;
        b=yitaZaEjI7QZl7mkyovi23+z08eOWnewITnFmbjX1zaBl5z+N10Ollinaf3k6F0v3S
         6jHtSnwrshht8FblCkoU+UQuXMWrKFwPbToMNiVWN6E4F4pSUjAl3tq3dmZ8IJzPvLjQ
         ofbda0SO39AuG9bzE3dsUn1myk0X89y57/GotPF5sON5BNbCzXqtcv0lCIV5TKkzPOOg
         4WEb6lkD6adxyPR8yiH0ipsAKssxUFvLC1jFO6hEBKdRhUkFwkvOHsId1QOwTBG6scvK
         /SfEtFMcMggFbrW1oJX//oqVn2A74UX+BDAOCDs0TRSDpr3hFddL5AU9BfdOWz5aYgdy
         +KhA==
X-Forwarded-Encrypted: i=1; AKwUvBx14twt9CDVrSHtMcCvrD2wB6RJmYMjqhIS98VRGIElSPjZPmAyYP9dDQ+0uQtTL6/kAnaV3/qvVRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK50mVnAZAJg7HxvFBQZdv6kSxJnCC2gipjkBvIh+EVR91KGrku
	o+Ja6kNB1297lHAP+gUb1DzQYPdS/ASRwI7jJp2fA1oPLcFh0YssOBdjb+zipuxptxk=
X-Gm-Gg: AYBFou22VU+1wy1wX9Ve+Le/cLc9ag3ge8Nyvx3puzkczwF/aqASkiPVmm4D4bziedO
	+GBZFDo27SOR3qtd95yFgcm8WmDS5zlGudVRhSQpLQnZ2OnNeAWOnfek6nIOBhW8x8Z2Athv190
	u7c2qhDjNrRpRXyRYc84SZAwG+oBgOchRLExJcWugxACPnD5rd55tNAVfHXjS1P254K3zeIkH9f
	5lY79oXA5aUbJ+CWevmAYi914cbr58/oeAf5zvOGFy7PTmUupe+k/4pVVHQUKH1GHnm3CKPa5Q6
	PkwO1AJrCaIiHF6V+Y7xYdeT3rdnNt10YwX/idmH85cAO9AKscWihQR6u1JaEtaD57N1ZSWtZE2
	3Yp5FsJwY3iZ8+rsaXP2stT/63BM6NOUQfYdJ+WyYdAWRm76vqxcEVHyIBYimSkgchxqWq4Hb/1
	rm7b3Rw9thveh5yLU37B5kZ6sQgg3I780QN8Nw8DCPa+gix38w12CKeqzrlXUs8Ox5IXLvVZNHe
	EKQGF0OioLm/yDbSQNOk4DrRC+LbkVCGxKZYBv16JBio9c4fKeF+wJBecjo7/QswHBRfLxa5A5p
	ocZtNjsXe+dCTtCJgwl2s/R4r7/sAht4
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr227973035e9.32.1793621743497;
        Mon, 02 Nov 2026 04:15:43 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:43 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:15 +0000
Subject: [PATCH v3 01/18] perf cs-etm: Fix nVHE per-thread decoding
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-1-dbcb0c281b9b@linaro.org>
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

pid_fmt is unset in per-thread mode because we don't need PIDs, so we
can't use it as a hint to determine which EL the host is running at.
That results in falling though to the next part where EL1 is treated as
guest, which is wrong for nVHE.

Fix it by only returning a guest machine when run from perf kvm where a
guest image would be provided, which matches existing behavior in other
parts of Perf. The exception is when pid_fmt shows that the host is
running at EL2 (VHE). Then EL1 is always a guest, so keep using the guest
machine rather than decoding guest trace with the host kernel maps.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index c8a6a6e4c7d3..509ec014b276 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1102,6 +1102,20 @@ static struct machine *cs_etm__get_machine(struct cs_etm_queue *etmq,
 	if (pid_fmt == CS_ETM_PIDFMT_CTXTID)
 		return &etmq->etm->session->machines.host;
 
+	/*
+	 * If guest processing hasn't been enabled, also assume everything is
+	 * the host, unless the host is known to be running at EL2 (VHE).
+	 *
+	 * This matches Perf's guest handling in machines__find_for_cpumode()
+	 * etc where guest machines are only created and used when perf_guest is
+	 * set. This also guards against accidentally using guest machines when
+	 * pid_fmt can't be used as a hint (per-thread mode). With VHE, EL1 is
+	 * always a guest so keep using the guest machine to avoid decoding guest
+	 * trace with the host kernel maps.
+	 */
+	if (!perf_guest && pid_fmt != CS_ETM_PIDFMT_CTXTID2)
+		return &etmq->etm->session->machines.host;
+
 	/*
 	 * Not perfect, but otherwise assume anything in EL1 is the default
 	 * guest, and everything else is the host. Distinguishing between guest

-- 
2.43.0

