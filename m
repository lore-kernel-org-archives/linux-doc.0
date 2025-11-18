Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B13A5E8F
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483308; cv=none; b=EhSlJj9YQ13G3UmiSH/rt4j1qB6e6DFVAbHS6K9EbRP2X+MiiQWyTE7S8V31oH0TVmBEQGQF6xs7NSMWzs1yw3sml7y69jnhe6Ft90oy6SYu0l8f9kkT4Hir1ypPFEadOwJYw2KM82rDZw32ygghMAN06cG9k3egC5c7g6fwApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483308; c=relaxed/simple;
	bh=49yHZcfRU3JYbttPDuMZA+rvwSlgiEO1pFhN/mGFnMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wrjrf9JjHYLysPPvr3148kgoDEFLv3UoE99VJetvIimZ15Lg0qM+gDUxqd0D59Chw89kYh46ZtK5FaL4ZK8uFzMu3E3h566ZER7s4BB5Nd7EEX651vlbOKWyyZgpfZrNMu9teGXRj/GcVybAMlo2F776KjTIgjv8lQIVtHBZ5uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5PdzVip; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5PdzVip"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so58286505e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483304; x=1764088104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=;
        b=k5PdzVipAFg44lyrdgHJF2sM9KpOvLi4KIfkHWuF1MJjPEDMl2NX3QWjtkfRdE5aOO
         cj6w8zivpCZKIzS9aIVA+plYOTJNtv37YXnE3GfL2GdNgdDR2RMjC5EycXlirmz71K+r
         AFDZJPuQvuFS2lRU2LhKKjXvPiAP2Yasiwz+3QFAJkbCI+Nzb7cGTFWeevePyvJMPt0G
         DgIWC1SxRm473hxvs45lfUywtkdD0LKugnImT826SIiulbv8tzXxJx9WXD2RP0Gd/mfi
         8jsQDV96YCxeV4EB80M6xMxG+3feZNRP1eTOjU3OU4xdDW4pzrNqQ4tt6uUVEwCnuJXS
         lttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483304; x=1764088104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=;
        b=PX7YsON641jT2dWut4oPsl4BqKKj/oUGDvj4GE9Vfd16McuTJ0Facp0xVPjMDbN8CR
         sl2+a1tAeYbC0VSbNAv5TFHJwDZT+Jk2yG3kQckHwpgdQxgTJunw9uUX6TtfF2B49IzR
         rMnHiBnURdBV+USAMG9gYGVru+PZiOanRkaQBiGtya7u4YxqbS0s3LusVbFwMcBqQQB4
         mEZACUj06htXIl4zM127n5xeWweT+KWR7JikPa/f2S5QrMxbS6jgqiNjiCZepF+T5XNz
         RrR+3X3YF775pcFLRcPsPOm8ueONBXCQxInJKPtIyBkmgmA9LNDbt5a5C+nYWuoYrM6Z
         dGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ficefLtvSBmEleOQVwYINVMbTNHTGg9VQUjYKvWTFCntQCmgASJdfUdHFKbciB5c5TZeh+9Wp5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/W0wQp82RMalZj6pKTA3xOGEQFgV7QimDY/KiSg+xxx6Qf/c
	9ERZ5uBxIBVehIwsLPCaeOMPwncjf4X/JVDqhFD8isowlMAUGFoNCWtgLGTxamxso2k=
X-Gm-Gg: ASbGncs4rfllw9CgHx7+su4X7dtIVbcemK/ZIsmZulQmx4EnrSSHTUfYNuquz14Me/S
	act5nASKOpuwaV/J3HtYlg7DQMJpChu0n/opZ+V2jqA34LANY9IdSddO7IkVa5VwKsfei9jAMyj
	e3zutyfKnC3VFIDARqDIdDzLj29agFJLYfJTDYkqzlaQ292t8T+X6VqohM6pTIr6vMxur751OJM
	ORIip+dPc5Tggvnux0Fep3FjWPgG20zieSYrIn/LhKtpPclNnZdeUxoWy0gJgd+5WUkV7CaXAKE
	TWRHjbJEGmQJmnywDqy1m0HL39ua4RtQcS2QFCi9NS5WE4hYWPiIN2GLJHO96a2FMcwCQdXu9LV
	iAS/mEUXrySTvKMjrqLNFjbQT4r+nbxaCJbZDKWdnx0E6JVbB+VGGDf18s3q3DpZiGtE9cQuNOs
	8C4kDTZrlmwI1j+KFjwsDKxxjwtQD/XSQcwgpJ9MY/CQ==
X-Google-Smtp-Source: AGHT+IEOUUUOt7+haNfNY7f4WMr2XAw5LyRTouQ6puNuomap6F1bvehMt9KTpJ7UVZBkfF6l25TEgg==
X-Received: by 2002:a05:600c:630d:b0:477:89d5:fdac with SMTP id 5b1f17b1804b1-4778fea1becmr184750085e9.31.1763483304287;
        Tue, 18 Nov 2025 08:28:24 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:28:00 +0000
Subject: [PATCH v5 10/13] coresight: Remove misleading definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-10-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

ETM_OPT_* definitions duplicate the PMU format attributes that have
always been published in sysfs. Hardcoding them here makes it misleading
as to what the 'real' PMU API is and prevents attributes from being
rearranged in the future.

ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
which is not the responsibility of the kernel to do and doesn't scale to
other registers or versions of ETM. It's not an actual software ABI/API
and these definitions here mislead that it is.

Any tools using the first ones would be broken anyway as they won't work
when attributes are moved, so removing them is the right thing to do and
will prompt a fix. Tools using the second ones can trivially redefine
them locally.

Perf also has its own copy of the headers so both of these things can be
fixed up at a later date.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/linux/coresight-pmu.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
index 89b0ac0014b0..2e179abe472a 100644
--- a/include/linux/coresight-pmu.h
+++ b/include/linux/coresight-pmu.h
@@ -21,30 +21,6 @@
  */
 #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
 
-/*
- * Below are the definition of bit offsets for perf option, and works as
- * arbitrary values for all ETM versions.
- *
- * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
- * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
- * directly use below macros as config bits.
- */
-#define ETM_OPT_BRANCH_BROADCAST 8
-#define ETM_OPT_CYCACC		12
-#define ETM_OPT_CTXTID		14
-#define ETM_OPT_CTXTID2		15
-#define ETM_OPT_TS		28
-#define ETM_OPT_RETSTK		29
-
-/* ETMv4 CONFIGR programming bits for the ETM OPTs */
-#define ETM4_CFG_BIT_BB         3
-#define ETM4_CFG_BIT_CYCACC	4
-#define ETM4_CFG_BIT_CTXTID	6
-#define ETM4_CFG_BIT_VMID	7
-#define ETM4_CFG_BIT_TS		11
-#define ETM4_CFG_BIT_RETSTK	12
-#define ETM4_CFG_BIT_VMID_OPT	15
-
 /*
  * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
  * Used to associate a CPU with the CoreSight Trace ID.

-- 
2.34.1

