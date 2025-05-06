Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A827C872
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531764; cv=none; b=IyZ8kuYuy9Dk3BtanUOtdzUrzbMhvK/LYVAY5pHhrUYj3B0HM1FSZR8c5+Rx7P5Qef+d/SkkK/DLnqS5qLbRajQeVPoZQA49GfoRHrMO8RIwaVz/5pb/9b+Odrbm3PsbZcs5xDe3BMyPdsVnwiSXG77bG68XeGZZmzRwkp/oeCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531764; c=relaxed/simple;
	bh=1Orlrzff9rVR0JZWyMg++jiq5IsyuYfqKzNJU/EyCi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5izSzMfAiXyYM4Dns59Sj2XggCKy3UjnPgsiirq7U8VUXJhyE919puamFchDbbTLBrR0qquYCvnu1p6O6hvX0YYQMBGEvVKphj+3L9ng87LNNb7YteY78C8ebKr2zVzoRJxapODOmicHTd2o+egk8kkzFB1FvjcTb+srWeVPUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=naVGkR5w; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="naVGkR5w"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39efc1365e4so2609304f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 06 May 2025 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531760; x=1747136560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIZcQ6bjIvx3LOuJqJtvWPXqPFlWznoYfJ+QWY9umw8=;
        b=naVGkR5wXITAX+DRXH0/HMatroPp4sFAvgLKQDW+YyMzQgomcYaXm134m/E45LwtUK
         4g1+g7CyG8dGp5hKm5spYNAhLDlagNf8X3ghRt2IxWKaHt4NvX/7k2ihTdu9L9crfoiF
         lcYCWwFGfZ8oMmHMRR0XneEMGWORapIk/nhvYylxBM0E/gmKmC3zUtq+rfsnO49nja5X
         rvrpbZq9iVRzcVgZtts+hAyvR6UOODQPZqiMwY4/15qmjvvtD88kvPNTY2EQo352vL0V
         2KATzbUInukqyBz1OXwMZapXIenpZ8fiiczwJ6kxgG0jSy5uyarvJEHJyhZInR26R9y4
         D85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531760; x=1747136560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIZcQ6bjIvx3LOuJqJtvWPXqPFlWznoYfJ+QWY9umw8=;
        b=Lk0Du9tWOmyZB8eE7oZWMHuWMJEfSwvV7jSkk6eAJuGkEwFiVs8blBAyjiHXtLoyDD
         5a/7ho8rMi9u2h/v8R4D0c7J9ubSz4UlQ3X1MG6l76np8o/HinaAfJ2vrTpjvIAR40KQ
         5aw0RY6Q8bIfajPInq0CXkVsL8KAQGq52lINEKEdN2+aYveQQVhhNd/6rzRYwjjng1yF
         ORAW4He8tW/jabolj4HrDbPmxjpkGj9BxRX0dc7k3JfO1aMyVKBoCKjUG3tpgIAxkn5R
         TpVr5E9xlQ40CUmF5+PNwpPHRJN7GVfRYRpq6n6FN134PB1WHkDUxLV71kO4ka6voVLy
         OUkw==
X-Forwarded-Encrypted: i=1; AJvYcCWtPQfPcyrSszYiUPVD2cyaAQtqDWrh4+LEJJ+56DuvzVBlgEtvT9YIMVkWKwO7ZvhQb7TDapAGnbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo0WQnTsEDoJaKEcDueYQPRZLByaTKpxPexvA4ghGAiZKrTRFs
	z1etYGjeEmnPHnhcyMM0rVms9RWYx23+1iNCnotvsYGm0hSxAAwHNsqpz6HnYSA=
X-Gm-Gg: ASbGnctesVocg8L1gZUJhmcEecVvh5CTUOowxZrHUUJyldYWdujagCe7zSHhOym9mQG
	3rYjVi/drLEyvpcRsIxvJ6VA9TNPH00JID+14LaVsQ75RURYd3NEuxAujpHssZF+GMRHffSOX8I
	GZTV5fwFwWb2OxYAkWYEn758LJLnumvu1cs2+0TfTws19/gDuG6DkWRYH8+G3MhhqSrv56CEdSc
	U3c3EhJ6kflOWQZp4UejYAxYCulCrz0mDiOAb8jKZRT5NAxiS9lntIapmBe6PvPixV3rPPN5PiD
	62Gc/6RSvgIT6jTbtDvSqUPZuL2D3JCUVlvkAtmEtEATMWQ=
X-Google-Smtp-Source: AGHT+IFOd1IsGOuUERaKBF17xqjJD9v+resYFgda6lTrrEteCoMMOKMSD17uDHezFeocGMqRKvBkWQ==
X-Received: by 2002:adf:e6c8:0:b0:3a0:b1de:1be0 with SMTP id ffacd0b85a97d-3a0b1de1dacmr1217177f8f.31.1746531760579;
        Tue, 06 May 2025 04:42:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:38 +0100
Subject: [PATCH 06/10] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-6-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 5fc753c23734..c7c2b1d4ad28 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -379,6 +379,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
 #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
+#define PERF_ATTR_SIZE_VER9	144	/* add: config4 */
 
 /*
  * Hardware event_id to monitor via a performance monitoring event:
@@ -533,6 +534,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1

