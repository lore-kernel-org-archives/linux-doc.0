Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B8A326D5E
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330963; cv=none; b=pi7VffRjvhMLdyLxrh1GqV+8eo5DDmWrjXtJCmoCxPfVY4sL5mRFi7mKrtD2aqCa+3lANVVmxfP+sYiWT01sHxoScjGJmn9cX915jDaqURv7t5w0U9NhZyROTwTUI9BKCgkM2qpWeAywteOvtkEKD5xcjVhQ5YItYAlZxIwRbuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330963; c=relaxed/simple;
	bh=C/+rg8IAxTevzxpO/Se4XE1tccwa/+JqcQ3ThDH0/l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHmoOJxqB5t7Mbao9vOUiPeA4THpZROWJFJJ4plSB5sCqywSgfiTXOU4YjYM2zPRtpKqcd/rwOky/6XxcDAzRG5oCMjC6jD/erdAVQBslRnf0XZakE2h10eeJdlIhAQ7moOxefahmzJaE9rEUs9pRqr/7o4D5+hQ4Pb37iFvoog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yc9T6+W/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yc9T6+W/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso14571415e9.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330959; x=1764935759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ae53kt1kaP5kLWZ/U4gl1GbpsgIlbD/90J2vkmwtJMY=;
        b=yc9T6+W/9rWbU5yNQSCUdbj77YZB0RdPpXz1AqTOlNiZDM8BM8lbDpwwR/D42FA43p
         zzne4prx+3DtmhpVCEICrMF2Gx5XPPSJeCAqtslqWFci1nkxr0fT9UI0IYv5t8ysNMhZ
         9HA5LSjy2F40mbxD/6e2VLXUz4QgV8ggZR4BOpUm3Yw/fV9OeiflJf6PMIW/6qltthO3
         JIkMy7TY9eWrX33ejC7wCpQ7tiiQLek3v9mBZi8hxn7AtleMsRwAs29dNT4+AtGomdnk
         YikmRXsFPikmjvfuYvzxcFZwFOIGR6M6C+hEx4im0zsK2jKy7YqNIRw4LkG2gbH0ax5J
         qN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330959; x=1764935759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ae53kt1kaP5kLWZ/U4gl1GbpsgIlbD/90J2vkmwtJMY=;
        b=LDu/wi94jC9JpaSiywewrH4poyLZtxIs5eaZ4kqbief6rPJ8R5i7YF+BP+j5wXycos
         YCUSLErj45Q/0gYZPEFtvXdmM77NRiKd06Vwg17EiE09a4Ijj1EhaQDGLd55/D+LnJaY
         fC4Lmrom9fFS5Q3DiK75lDYPhU8sdKnQWnGy/gpo+0+QzbKTT4wdfs3/J/J9L0JG+Ajy
         jf9o/PHTVz8Sa3sV3p7pL2PvlLVbdn5O1/lqpHNjOY3i+ge3OhtHh1mKoTQ8/9pqQrxp
         FEvsnxTXxValRaGPiPhtofj9QOXpAZUtKMtFkhHbLZ7sU+WTPEsM3AgjRNJh8vylcm3f
         85mw==
X-Forwarded-Encrypted: i=1; AJvYcCWgNbo1+BAH9TqiY1pwmG+3euZOzp3chIYMOFatySwlZS55xpQ1KZdAQLPs2e36XWHM5lYsKxZjyOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0WM5wqED3gNx2tK6dcf9RFXuqYT+ppiHjxAeAY8BgCxkgNDIm
	r6hHHBP/WXQNnORHw351BXZmpeb4nYK+Wgksam9glXzR7c/LsnZ4yGY+MkSedPSwFms=
X-Gm-Gg: ASbGncuHNVUbfRCthXbixIH2MlE3NWERaEuLFeopl2bZGRv/HWOrKn9mcL8JR/MYU71
	aKwOeqgst0QiIDC0aDIE61c4mTmGvMBY1K9/kxbP6mif8DpLg2jXtE6AGpLIa1I/GBNZHuLlEYp
	pbCzkmtb2/azZK1z2HZDoXGJr+8TF0CjaX8JWVtw644g07rL1HVDZQDiXgk03J4hemqxHnwplN3
	0a6lTJ9u+K0XbPvaFNiiQzyJ8/DGGBc9MYrbwY+XgJbwP2NC/HqTZHwLY286V465Tqhduiyc93S
	HVaxtqvnIsKmD8MeB6oW/rxxXs30PT6yfY197izG1c7IIKkaewS6kRd1L5dlUod7rWF+MWiu37Y
	eJDe856OeSekcrLRX8mx0toarR4r0ZAEQxEelmWRQzY3P4KIpjsSbdVKJs4PE5oAoMthJmQMYAx
	Lz4gkNISVkSgDtBnfheLi+
X-Google-Smtp-Source: AGHT+IHmmXmZWvxFJIN++KvkjNQAu8BrPSpq+PPtR4UIJjgdT7j1BzkY1f2m+jA5FMpwm/eknom5XQ==
X-Received: by 2002:a05:600c:3784:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-4791348cca8mr38526545e9.9.1764330958941;
        Fri, 28 Nov 2025 03:55:58 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:22 +0000
Subject: [PATCH v8 10/13] coresight: Remove misleading definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-10-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
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
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
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

