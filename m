Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615FD3563C1
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762861121; cv=none; b=b/EodSh2dzE4aAl7W6TvP92YuvFYx41NWuWQRoEFJUWq0bF6jUbZrt8pxJFBNHjKUcfpZ1VoJ4zc4Zf+qxv8GsYWjougDd2wJvZJ2L5Sg+m0RvkrHNNAbVc3zsKUGukKWG2XRGJuddIlOw+jITqcnpL3T3LW2+yZ56rOrz/HcaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762861121; c=relaxed/simple;
	bh=b/ttJae4xiEHONrSB61gWYPCVcnCnqIpQyNKL5V/Pqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYT3yFq/chs+YS2kVzqcR3noIFexVHMj46JW/tGgKJb88zDtGqfbt7/UaXACvmsY11yfxBrALcx19rXm8INXJlivXkeEkv/poLit0XIDoeLLvk/OAdsfGX/RyJypfVwA/QEiTXq+9wPQT9QGn6eRScr/H8bqiUEgdumyN4GB4qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDehWl/b; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDehWl/b"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775895d69cso21297305e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 03:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762861113; x=1763465913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=vDehWl/be0EvJq+Cp0eB1lTOJLz767+Fv4g5FD2lEo74N9c+Zs5J9LeU2Tam0+/3t1
         h3pM9bX0q8OffUmbFGVIohlru3qgrN1th+Ph9AezTjXqg1/phZu+2aciX5fYZc1cW700
         FTEGgRttwZc9gSY9lZDuEeR4y15jWQNb7uPT1uMVcCgezJIV6M7KaRBDnUye+xkMDwds
         e5Yco7m2yAPi2Edo4Gm4KRDGJzwk9VVclCPKWnZfSY/66r4fHib3xKcQn11W6Nwr6gqq
         xzD1gT2vszWqzsaAe7f/phJC5P6lr6QZ/0rnxMlbEzEuFnIh8bOZ83v76ZDYMBYnOdmL
         XOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861113; x=1763465913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=OaSTjmOwTOSI5JfGAyAPXJijKft/fr4SGopv1T6eV0njCZKGjgB3zvZgyerN1KrCoQ
         vMGEGit8huH2WRgM3PkNayZiKRwuUf+z5onjXfCd4Ze1GXANosSIWKq9DKnoo9JoR83A
         /kTUrjhyZZEihT/kN6e70tfkXNUUgLmp48NK8If/iyU6rqlfGDimXZxb6PRV9bWCKEWl
         hvYRhkN1XNAeV74hQQajxOptRMQlOnHMD975hfewJoThss3v57UXoe5w1I/eHo0m/NGt
         PLVkez2yL3ZHNnj3KSbEvQjxahAV/cg10rFo9JmdfZJWYD8A5AF0ZQhITRUVrXSSudL4
         jclA==
X-Forwarded-Encrypted: i=1; AJvYcCWmGS+IXdyJ+dN06LDvvG106kioFMMt6mCWEFoZwjLNUmwxpsDu40Igb9sQWoW8F4O5swdleTXyO/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3JSyTVGil/JU2xcmIa9HS+hRdNmXEQ0XfDlJly/rso4XnvbuB
	OUIyGR/Ko2rbCjUrvK4RqAY+eYmsPgoD7Q1KhevKo7/vcX4AYhOxSC6IZFWPARqja6M=
X-Gm-Gg: ASbGncvB1ZLhSIx+qZKgNfFKw4BRO/7/fHOAYzSJWpLi4Uxqk0IKji8EZb/Ei1SCzR7
	R/DW48nA17xXkjXCSOi7F6loRjLPzp0dXV1JBqKVX91TnWut8nz0AkvBPiHI2/MSHkYyHvy0010
	zgEbjf5YneXPDf3gdqgM+UX5LRrUjPuYu5z6YT/QoCW6G8R2D8EeYu220ws0zp5jN3QVXhaIcrB
	bVG06lhcoK3dd2EIaCBJIeo8pJZ3OByP5v20EqgImWwXszdGDKgkcFKKPFk1wUOLf8FqmD9b8nw
	bUYrrQDgx8cjrKw3i73sUHjviMR4XaGJ5FQk41ixy2itIrCTKU8AF1R9dSl0xbQ3xEQircaM/pt
	Ps1NvkbBGIcwxRid8y4WvLO+iU37Zft/mNlbfn5Xf0z0bgRO4vOjpZEqUtU3Kwbgr43GdZIBI37
	keljWKI+PbklJaGVvtkAc6
X-Google-Smtp-Source: AGHT+IHHKYLRfVgN/W/e843ki5ckqj4gtDXuwTA8cbEV+6RFtEvcngH3q04dA3ZvJO4NaiMzNyBD6Q==
X-Received: by 2002:a05:600c:1c14:b0:46e:4246:c90d with SMTP id 5b1f17b1804b1-4777323ed28mr117807465e9.11.1762861113334;
        Tue, 11 Nov 2025 03:38:33 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm28133486f8f.22.2025.11.11.03.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:38:32 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Nov 2025 11:37:57 +0000
Subject: [PATCH v10 3/5] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-james-perf-feat_spe_eft-v10-3-1e1b5bf2cd05@linaro.org>
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
In-Reply-To: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

To pickup config4 changes.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
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

