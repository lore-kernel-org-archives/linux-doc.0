Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBCA33F387
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960963; cv=none; b=PjWOVu3MSsYs/Pfp8AZUnnrRj2HiYN2fsBuzBf/GRmzv15txCOhGP8MpH/a0AZeN0Afd0pzqMU5UHPBgCcv5wJYQmUvuy7EzZ7XU32yCh1+ujRz73WDSGoGv99gro0PmosA12OWwtMn1sHT7XX7/Hrr+UtHSLs5dwp7QZUW+CEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960963; c=relaxed/simple;
	bh=uJVSK5aYHf9PqYstWTAX4v/czLiKhA9I0TGHQKP62RA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chHhI9GEiR3RIKYH/E57AbqzRXGzmVNCnrDbS7ex1wkXhgg7lM+DtTxrlxM4xx9JTPLliFoKswmgbxa9kG8xmZUOgG/b4XKf5MtpoU1vxQ4IbjO8q3RAzEJO9z6NJwH2cA6PiodrFbeOTwKpW2M3axWI0Fv+6/fGZs3hy/Jcuu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZOq0iz7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZOq0iz7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b379cd896so608025f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960958; x=1763565758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILLjcNFKCShCpCjFdgdkPREBFmKKVtEX1F/DK1p7azU=;
        b=BZOq0iz70zOcpAtmPOxSzKDpl+7PbUSZAntimF8njn4Yf9xY91zHMhTJGdD8JPcBme
         4av2kPiFcnDm3+FBlQTqOVnbwt5i3yshyEthtNFb31fDQBZlxCJ1V+G/jSCpzuF/tQlY
         4K2wuRDYIjH02fmCpSyEYyrXsSmKbcFJZdtaEGwY4Hjg0uAvcMDXbpMerAiNLN65Vg1m
         tdTj28quiuUgUW17druyQCgQEgGVZaVt9LpUTXfRKh0b5A37X5+T7bjc4ZpVrdOEq0O3
         uvnqJZ0/4knv0sK4hlq3E1fHAqG2T/SAK4W8l7k83safQL6UJIa9bphGBc1UpeYCAnMi
         csAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960958; x=1763565758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILLjcNFKCShCpCjFdgdkPREBFmKKVtEX1F/DK1p7azU=;
        b=SMg7IoE408I3sJmJS+RjEP1BRURb8JLXxwGIYeIEq4vawWsrBaXewqmQJCdVAkZXXU
         00kOFtRAqH1wDuPGMrwD70WM2f/G5TkLuWcLwUL8YZO0IFBwrq6subAXLoykNnInqt89
         uDrVPUqWR3Nn+C/7/vudtDKByfkcKBrsIiDL5+KoM4US0PPxvAs8BCedYGJs6n9n/fUO
         pnNQ8dd/zWZUl64GriSUQSjyAO/dYYF6CWPpMUbUbsPDX3s2beqG7G6VQyazwTCA21Ny
         1UNs9dOMcnq+joYhnYO35Ed1p5Fzg5gT41YozbwYlvfkvx0VCNQS4jP0R0r2Hb0qXOBg
         cfAA==
X-Forwarded-Encrypted: i=1; AJvYcCXU/GSdIj079bZqSrUAxyVfYictoBO2Fg5GT+kZjbQD/Cx0ojUIa9xiIo4VkBLCEOrhWGKtXpYqfw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4w8Dv6fKJ36y5BcfmLgU+3Sc8WeOjh+7ImcvqGmw7wsURaLvf
	bn0GtyWLYh0OI0QPb9wcBwEhob+Gski+gBhpVWKuN/Kgd7W6zzzXu4PdnmT/Uf4A+wU=
X-Gm-Gg: ASbGnctw5YFNbxDlqYoW10aRzn7t03vZ9xIQs/Xd0V7RUKp0hDkbikTD1Jsq6mEi0c/
	oFS6qv6k+Xo+u7Zw5oV0NrHiwaRgwhyR2ieRUvkgRx7oZzBGlRcEeFBCzIqhwQSRYTAzxdYqa++
	7GgFXQ5obQqCatRLZT1vaUGcKwM+Vb1rIL2UXoxmtaM5UVGhK29/+S8u+U7XeWWUClRKn+3W4Jv
	8O/fa60v0EstL2PrMSJMpBsQsz69Yo7INJsLxVdnQqR1ufF/Np3doP3sz+K0Eti4p8V+1wnncKI
	xKhyF8QhOy7WgV5d1+K4MLfPcXz8vj6iRMnXGXm4qqewAkEv8GjpDgG06p2PJFHcx+7z4GtZgpB
	PkcRnt07aAKfnLHgf+AEp3g3Sio4Rok8pNO790vvBqzhRsBM9IGLsL3Lq4hi9vfFHBm+dIOq5Kp
	GSgF66h28DLg==
X-Google-Smtp-Source: AGHT+IGjdUCcCG92Q/jqFroCRNOfWwVifVOKjjlFDKz+QCM71f6L1+0atNpuSmvuBiDEBaoYhQJwCQ==
X-Received: by 2002:a05:6000:420e:b0:42b:43cc:982f with SMTP id ffacd0b85a97d-42b4bdb0267mr3253494f8f.39.1762960957948;
        Wed, 12 Nov 2025 07:22:37 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:16 +0000
Subject: [PATCH v4 10/13] coresight: Remove misleading definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-10-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
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

