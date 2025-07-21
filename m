Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051782DAFCD
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103124; cv=none; b=WIrqDjcH8C7ImYOMpviYWuEsg+/CexheGkHPjihPV6g6jIbHqYH7axHgEpgfyo8w4+yFzWAf5lpQFGiKo1up1kJkSRLZLTg1Ba0IdLt2o0OuhC8kvdGw9nFaRQkz2sEdloeZ9G7tYO5KfipIelhGYb8MU4AMl9fKHmGwUExvd6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103124; c=relaxed/simple;
	bh=3yjrpHkX+aMdTK90nxuOJyMh4ajXQ8n+rTYB1GAa/ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m000w5Z7mAmXMggbE5jj4ny70B8i3oU1OY2ZsM57sLPRJSUxQcSxh1QoETZzjO/9DycyxsTp/h53icVMRVtmVrp/mhrvZDlZUWdpLkA/eCP3+4R3qLjzZgrjzwG1Xrp6kIvDXdhzwtWngwAGi7AcV5ba5M2keRwINX1lI0L6KyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+8ZXiqL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+8ZXiqL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso32314525e9.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103120; x=1753707920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=o+8ZXiqLRLXZX5M3emkvo3y3nwYFHiT+xAeP5lCWkA1tkX1lPvKNQXdoQDMx4UFoul
         U7kUGQoLkxAQnlrYz+9fPDuG5HQ0pC/z8GRfRSQEusmbwNPRyQO/AYGgdf8CyaBBlbzT
         0XcUOziZNR7fY83Jf2YLxfM2+tzYoYGY6e2J8teDjEYNxxkfVtTGa3cWfOwAeJOJpLFs
         F1eyfK3jzIyBLVb716H8s2+rz4D2b7sKijqKJCbKy1ooYWThtdxUbDen6bhnJLSuEmip
         1O+jekZKlJrehNe7G1RcsYpUR+IlOXHJyd/VorDjbdywo5BdzN4bdLmxaJxRSHDAUuYb
         zgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103120; x=1753707920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=whovLvjl7E+rQd8tQYBgR6shZWNmZ61hUNEhtCdMzB7XP2Zyxj3AFA6Led7zrgApBT
         ElE+e32BGmIVKp/FzB0BDcf+uiO4TWyOi26ER31aSTq/rIWugYBZf181jZn6CrjM/dbT
         9tu8HrdKwliLCxSO0D3AFktqCQAzI6XE5kF4xpTo7JBae4+bVgqd4IhWmvfJTUylh1Zz
         onIP0tXNQu1axYiF8u3UasnGHhENlXcMLB0T14ir25SvTJGJaDXTbL5CFwjZUoV8gydC
         H/zrnxhkLtYfGuWyYxb2qrnTSex0WNHrsDZ5l7XGwZmzmfmf/Hq8vVEkQZN0L4ZJtKkM
         JzXg==
X-Forwarded-Encrypted: i=1; AJvYcCUchCsXIk/HBU0b/IH9SjemcNpBclOtYoLX51vAThAF34EZGu+N5o3zH70MohZs7sPTiUBYL3LFQYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Ecut0dR7iTF6btgnf38TWAEfZ3d6CDTQGn/wzwItCQ5kJqyv
	fY4qWUnFg10sZgNYQ3JZ3GKw/Fkeq+VjpKdYiWyHVnO7zIE4Us+czQh+korJPRFT4C0=
X-Gm-Gg: ASbGnctWZKLysfEiw1EJEQBnfkTSs0MKZdfI9FNSuXt2bxegLjfc3lKErXol4T5E2Pd
	7hwUs47SxD1XUnqeEDXCZ+1liAL1xCJtg/QHFQ/kRjzyAXe3NivVSjJhEeeU19LFXtQqbL1xaeK
	RTB3mha+f+slm8CIx6LWibhwEu7BatFeOpV+1+5LfHjfc9fFH2aBMurNOv8jKr2kKk9QYA+SL/b
	U9Gy7fvXQwibSO3dppjMvFCoBZR8XJb82ba02FJ1yJcierP6TT59frz12YAdc9u8wi+FBfRbF87
	H5EOb4HLkgFGypCNfflTPgUnamH1xKy2wL/8kTcnVWtamdOeAEtDDKkM5feb8Khueao81yX7CK6
	LDlAtCY9gGcJeK2SSN2ruhwapJpkYbTI=
X-Google-Smtp-Source: AGHT+IHcC0WWzrKqr8+Igj35NnjWFuFj+8E1KaR+jWoua9xbcKUEBeLY4nnJZlnbhkk4+Th+Kwau9g==
X-Received: by 2002:a05:6000:4022:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3b60dd731c4mr16367288f8f.29.1753103120265;
        Mon, 21 Jul 2025 06:05:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:05:02 +0100
Subject: [PATCH v5 08/12] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-8-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1

