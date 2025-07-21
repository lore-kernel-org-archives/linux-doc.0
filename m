Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99922D9494
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103116; cv=none; b=eJtfy0hkOzhZjuEFBp2a1jyNIKmyp1o+v1xl8IO5Ht/S45e3OR3fFFJw4fOc7pu66g1vOYthU3l5R0BV6UQSkAq4PVhri5cE3LDZGanuYXvv9F9im+6MgRDRF1T7HE5nXOltTKLihFvNk4bKkgfbLsbRi92tXiEMWquO+4aZtyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103116; c=relaxed/simple;
	bh=ioJvhXZDfjEQt2ziDmXFW0nCeOZA32fi0+BXFuZXXMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxQrR8RfL2VY37J9XopLiE1eV62BOY88y2e/dYWCXUcA1L3rafXOndpNXuoxNvw4Aa964SpuOgR2nZ9OqOOPUQf2Yg2c2UwdXUuaNZEX1AzldbcgJ2D47rqmtd4sgKYCVSXuImbJZi9OBpD8JiXkhDkViPSC3PPih6ID2K4f0cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVB3k91v; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVB3k91v"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2509651f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103113; x=1753707913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55PgdiB+GN4B/bQE+c0k9cxCNgbWScuraMcZpMP7YeE=;
        b=QVB3k91vAt5X0x7iRt0ayPZUdtpHxi0kEISpq/TzDOoOAMe+qcBLAG6yGOdgvD9yfn
         wcpOik/5tVXd0S4lvue/vLRP5qqN/+NIhGZAGXjGKpat28krTj757muLMq/r4jSPcz59
         Qr/KicDF7glSrvUMZCZqAg9ivxuQbX1CZ3sizCZ0VaKQ+dlQkzFIN+qG4XGQ6povyN6+
         DTGAq2JJlMcOkeq9RCm9sHJK1a5SIIO7r3pbL/BqWNyYPaOR2TbWmlr9x1UObbtkPvH5
         HO7d01/+uS6Sb81tf2fPduyA5SHlJAVuNcdgRkHrWCcqZzofYHpxz2GXHMpRJIRUm6DW
         qrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103113; x=1753707913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55PgdiB+GN4B/bQE+c0k9cxCNgbWScuraMcZpMP7YeE=;
        b=MbkUYe5b/CEnnIJjyk5aiDxF7wBkUYIXw6eEDpsRInIzYtk86R8TWxy0BS0lVXm9n+
         PwOTZNapOtVRuh2B2Ldv/ud0PZpPCi13m4FE9elc9MhNK1oXdBncvtc78A2vpvvle9O1
         n3ektLt9u4mBQA93Roc1T8B0Ssq3qe+TVsnxtqyxlOT/qgUAyBnhKnKHQUID9I80Mfi2
         V0M2vPGex4iL9TbSzikEppdohAc41EbI7yHEQyPDu5hXTdaQwop2P84L6rmLqNPAb/hx
         KXEctO0BsLIYyzNeK383plLamRM4GfJOxWAV4loyiIP4AHvjQuB7n7bFISzD+97H8D7C
         VZmw==
X-Forwarded-Encrypted: i=1; AJvYcCX91XmwsFbHcp3/igI3+Z/z+CL+T2wocV3FD+s10D/Cs3miREGoKsN/9rqoAWDZZB132dZU9qZLz0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKcJA3YZDxvY5/1s3J3R7UtdRZ0HkGACBDcpEYTRMSjbTnicfN
	c1IrSpi1MNcK6FtzctR2ZLf9KZoRlBywps3lZyYn3SpX6ge87l41d1IkrvbYQCS9dZE=
X-Gm-Gg: ASbGncv8CPzCcTmI7HoVTAqxQ69jg1oxzAHZLtpOLOkkHSYgmHkL90vM9C3uHQJcyuZ
	Rc1jB0mgCzlHYpbAJlXBfQb5ETgRvzL6QBPk8fHeQRMS2B/WjABpTxbRk1ad04tivCaTggHq0J6
	fuhINZVtNEJqyW5xzfSV+o39NmT8/dtq3I2REDQ6oA4wMRQ7AGnUa0Kwb32pnuOrRWL1X6stw58
	pBF2TdMWrjueTZzuOVzvAawXAmU2xAj7PdvtR/xMDwF/R5pIQfUt10ORq8aub7VdZPDA3uED86G
	y9sQ5l25Fr5kI5MGpq+bmmlFGeZCr4eRnAAL8z0AZHjFkaU+vMrwQ5VuRkMw6ojN8JtZxeSyqzg
	pJ2CWsCtJ10Y3VYxpWlHi4/+AfIQlY+o=
X-Google-Smtp-Source: AGHT+IGWq4jzpIhEdv6123LGkJS3kcsTALE6uCDdvRzPU6u7cW14a0/tv2JQi8/2wxRmO1WYzyv6ew==
X-Received: by 2002:a05:6000:430c:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3b613e984ccmr12134458f8f.32.1753103112960;
        Mon, 21 Jul 2025 06:05:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:04:57 +0100
Subject: [PATCH v5 03/12] perf: arm_spe: Expose event filter
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-3-a7bc533485a1@linaro.org>
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

From: Leo Yan <leo.yan@arm.com>

Expose an "event_filter" entry in the caps folder to inform user space
about which events can be filtered.

Change the return type of arm_spe_pmu_cap_get() from u32 to u64 to
accommodate the added event filter entry.

Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 051ec885318d..3e9221a22a61 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -116,6 +116,7 @@ enum arm_spe_pmu_capabilities {
 	SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_CNT_SZ = SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_MIN_IVAL,
+	SPE_PMU_CAP_EVENT_FILTER,
 };
 
 static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
@@ -123,7 +124,7 @@ static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
 	[SPE_PMU_CAP_ERND]	= SPE_PMU_FEAT_ERND,
 };
 
-static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
+static u64 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 {
 	if (cap < SPE_PMU_CAP_FEAT_MAX)
 		return !!(spe_pmu->features & arm_spe_pmu_feat_caps[cap]);
@@ -133,6 +134,8 @@ static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 		return spe_pmu->counter_sz;
 	case SPE_PMU_CAP_MIN_IVAL:
 		return spe_pmu->min_period;
+	case SPE_PMU_CAP_EVENT_FILTER:
+		return ~spe_pmu->pmsevfr_res0;
 	default:
 		WARN(1, "unknown cap %d\n", cap);
 	}
@@ -149,7 +152,19 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
 		container_of(attr, struct dev_ext_attribute, attr);
 	int cap = (long)ea->var;
 
-	return sysfs_emit(buf, "%u\n", arm_spe_pmu_cap_get(spe_pmu, cap));
+	return sysfs_emit(buf, "%llu\n", arm_spe_pmu_cap_get(spe_pmu, cap));
+}
+
+static ssize_t arm_spe_pmu_cap_show_hex(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct arm_spe_pmu *spe_pmu = dev_get_drvdata(dev);
+	struct dev_ext_attribute *ea =
+		container_of(attr, struct dev_ext_attribute, attr);
+	int cap = (long)ea->var;
+
+	return sysfs_emit(buf, "0x%llx\n", arm_spe_pmu_cap_get(spe_pmu, cap));
 }
 
 #define SPE_EXT_ATTR_ENTRY(_name, _func, _var)				\
@@ -159,12 +174,15 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
 
 #define SPE_CAP_EXT_ATTR_ENTRY(_name, _var)				\
 	SPE_EXT_ATTR_ENTRY(_name, arm_spe_pmu_cap_show, _var)
+#define SPE_CAP_EXT_ATTR_ENTRY_HEX(_name, _var)				\
+	SPE_EXT_ATTR_ENTRY(_name, arm_spe_pmu_cap_show_hex, _var)
 
 static struct attribute *arm_spe_pmu_cap_attr[] = {
 	SPE_CAP_EXT_ATTR_ENTRY(arch_inst, SPE_PMU_CAP_ARCH_INST),
 	SPE_CAP_EXT_ATTR_ENTRY(ernd, SPE_PMU_CAP_ERND),
 	SPE_CAP_EXT_ATTR_ENTRY(count_size, SPE_PMU_CAP_CNT_SZ),
 	SPE_CAP_EXT_ATTR_ENTRY(min_interval, SPE_PMU_CAP_MIN_IVAL),
+	SPE_CAP_EXT_ATTR_ENTRY_HEX(event_filter, SPE_PMU_CAP_EVENT_FILTER),
 	NULL,
 };
 

-- 
2.34.1

