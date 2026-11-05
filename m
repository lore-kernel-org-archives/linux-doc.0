Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879137;
	b=DxF3EoVGzRYVNxqJOFv+ZjwRUMXKb/Hle4LW9PjO/9fDN8YmfcxkgefLA6r+8wbKEwq1
	 VOBRk0lKdoyq7ELhoHzeiJQ4FjWdxgHQ8RtdnlDbvxuh6rcZE+atZnXrLQTE89Ntvq8bm
	 DfLSX5mArZ/uXQzMdshFBrhB623zuSLDkjnSYM+WDCWE5+kyIZBMBK0VISxZT8ZUheOte
	 bElu6h4CdiKr8/zi5U4/RwMxi88/LKHmhebEHFWKSoN36qgG3U2i2LzD/cweq3EA2gzWo
	 KDrNYknub/R0Y9Yj3iUBB1TCCGN9ZcmFlHf4bqlLQF0iqI7qqTGplIJ8qvUyCeulYZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=;
	b=AXTGhhu81JrXdGBKnrhpGmgQxBVQ8USFUUHF/5lo/NIY/OYxIWKex7kcsFxXewAHAX0Q
	 lkM5gcCP3+zeQCeTFjWoS/ICBh2Mxeg5b68E/PQDsSEG2HFN/+xEC3a+YAK4OmDSqp8HM
	 6bBGrNwFK0cfipqAlLcvbh32RyCf6rFjDubZMW1DjyiURbglN4NQcXW9g2vmf91cSvniJ
	 xmP1r/iwPdquZOna/bkHb8R/2lYJU8RmHcgUOgS7zqesyGTtC+ZRp1/LEjBrht1K+R2ru
	 6Jw9R8Eta1ggSLA+A2d39mx0q2C3Xty9rH3q/GHbXpd6NPjIozBD6T2cGi8r5FWWqKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fdty3Cxx;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1C16073A86
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB1C16073A86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fdty3Cxx
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso15631385e9.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879135; x=1794483935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=;
        b=Fdty3CxxZQa3Fbe8+i/1j18pyDc8cv8OYFTvZzrWBtctEw+HtmIMApE8V8QzVUnSId
         IfTrlbm9YCbm0ZLzW9oPu39vFDqYowwgkqnQHAPRmewSzYDeAQ0bLx3id1rc4/Ow3sle
         Enp0gcJrCRfwhR88A6pAQq32oGtNerO2TVtJfJX7XOanUgCS8Ppo8nOnz1YsqwIyGSmD
         eFZ7OwQI/7KGdS6WL61wWib32TfBCtX6RMJFMSVtBeh2lMwfnbKlry8MjlTivwilDGks
         pba3RhpdcRSt2G9bs9U71cpI89gUREB9N7Lueqy2ai2iIIQcm4IzvfaFzr/fH3GL/GCS
         HWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879135; x=1794483935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=;
        b=NiqISTPdj912h5q1yI45iIG4Q8sBA9eOCA2mHz3e1HFeINGEQuLtT5gc2s6/kytSf/
         vWDQbpduj2/0zhtuAuoHi0zdtKV/cWHejTknUvVB/giYPUQcVIxUCLSllIGXsR/0UrQn
         hm2xVE8zWPnrbjqLCIx4I/5Sz7QIERSfF45exVklJZYS6DnjBQcEhRbIkxwcNc50K0mk
         BxqhZyZI6mqIemHZ7wqIzZPQUCe99NKcbeVbewhnS0kFncqTYTkC3tegGzWcrATFdiRS
         j7UazXJ45G/NCYNeK1gqjb3RWB9kzWHeAP4iXV7VhE26LZQEJxSKdvrpog28laT3wTJl
         ueTg==
X-Forwarded-Encrypted: i=1; AKwUvBwXNRJNXw1EEPiS8pcyXm84oxvmc+WjpleLrLw5sKdmryPHYESFAGciu2yysye2wtK/4fnvQ7uoVXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qHpteGBmmQ3MjvJKs/Fu0xg9gvk+D8toebilFUt6l8rDFkZ1e
	v4Rlaso3agK6cDdCXvketnES5C889T5NOZMC/I7xds/Tld3b3uViFrG8QcH6DSP41v8=
X-Gm-Gg: AYBFou1suo1imVkiFiAdHrxAi01et9y9Hs4hFvqURvp8l7d+lvc9UJLUBZW15BJy9UF
	w1PQaanH/dofaajPgPm+SEFOWEcvf4xI4+TYbA/RtXGP7SzH47LPPqFeFtDAi51PDpg/jVL6r54
	ytqJZgEy+87MkXoeZsyWAvuS3OocgMMnmpUx5mccxS17le42xZSMwUiSAd+wc5y6HJoJqqx0Ror
	8ETw57K6Zh2mzOX42D5BoLCXJwdIUT+m8I7MnGSqP3Gd0NylshMlcpN+d2gtQTMAceRTMgNASyl
	6FOUypbMLvJRziSkaF03v2vNRlA0X/n41gy1CpVU8AUjpqcEaGpD6OH4PHuc81YTd4MMo886SnX
	IlVESJCe9smFPv2BF3Y96mZtKnGnxmJMrLM/EPGEKHYbcAM6p8pUsBSkoYtczou4l8PfbEWxVKU
	uBxdnBdXXhMCX0xexJ9NB7RZGDyq48qx4Ba3Z+nqZJpbe59wdadOyb1LgpPSEvg8BpQivKVINdY
	1YHlouzlKOavtd4t+YmAYZgo3w9zvvDtbSlsk/VltalHIT8rG5m2xjGdVZT2OtPXoZYOw/t/Ydo
	GKYzTQv9Svds1RaBsnEDSHmkEyT6eprd
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr410942325e9.9.1793879135180;
        Thu, 05 Nov 2026 03:45:35 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:00 +0000
Subject: [PATCH v4 12/19] perf auxtrace: intel-pt: Use common snapshot
 pointer fixup
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-12-7759e0ce2449@linaro.org>
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

Intel PT has its own wrap search but the same pointer fixup logic as the
generic auxtrace_record__default_find_snapshot(). Replace the duplicate
code with auxtrace_record__snapshot_fixup().

No functional changes intended.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/x86/util/intel-pt.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
index a533114c0048..ce854209213d 100644
--- a/tools/perf/arch/x86/util/intel-pt.c
+++ b/tools/perf/arch/x86/util/intel-pt.c
@@ -1150,26 +1150,7 @@ static int intel_pt_find_snapshot(struct auxtrace_record *itr, int idx,
 		}
 	}
 
-	/*
-	 * In full trace mode 'head' continually increases.  However in snapshot
-	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
-	 * are adjusted to match the full trace case which expects that 'old' is
-	 * always less than 'head'.
-	 */
-	if (wrapped) {
-		*old = *head;
-		*head += mm->len;
-	} else {
-		if (mm->mask)
-			*old &= mm->mask;
-		else
-			*old %= mm->len;
-		if (*old > *head)
-			*head += mm->len;
-	}
-
-	pr_debug3("%s: wrap-around %sdetected, adjusted old head %zu adjusted new head %zu\n",
-		  __func__, wrapped ? "" : "not ", (size_t)*old, (size_t)*head);
+	auxtrace_record__snapshot_fixup(mm, wrapped, head, old);
 
 	return 0;
 

-- 
2.43.0

