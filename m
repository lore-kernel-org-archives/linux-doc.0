Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B31B31DDAF
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154669; cv=none; b=o3OKhDM0tNgI3g+xkWFs3+YHKd3aqQH0jrj735bDW2tQyrVy1H+c5hWzlehWut74DDx0k4Udt/js5Q+4SkAh10F7KT6JYOghjkp3mRxfFOOESogz11ufOPSu7lt3jPRB+eBpBdKppG231QQnb4ilhwIIRGqH08yKcm4w5nRTZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154669; c=relaxed/simple;
	bh=UMG09p7aajwgYeIvV728JxOY39zfyOs7svUDvZTqzVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jn7bhpLLgCHeJbdCe7T3x4bXUshcYknOmYfgmOXotoZOB/a+mNRYXPtXG4Ya8VfyTzZ0qGoBDi2FRNbIfnRvKXit3CYrGfy8uwXf/ZQOSGxUrEtyhbPh81UsZ+A7OobkOQUpTbnXoNA/sNslIBWxzEfLYFSQRRdRaLIP8mQDssE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqyXpVV1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqyXpVV1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47789cd2083so38851965e9.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154666; x=1764759466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eB34ho9tLNd3EJt+3+XUDw0cEApe270YLGk56wWE0A=;
        b=pqyXpVV1i3FjwN5QHXuGksy4qzXyFxGZF1yhvJAUzINrtDVVFk+8wQi6yOQ97xCMkR
         Xej7NiEPetZ5tEsQPoZz2jcZYEjy3wOoQ6dMLW3KzcGQqvEoxQxzOY6T2Obdgz6z3MMZ
         /xYpEnl2hpaQuGj7QP8yOEYLLeywfQdcLLkwjB5+XRFy3xTroEdiT4yHd+6iymXToY0X
         9gOfvaDSV+6yZOqxi9lRFLO+WPxtW/4rmDyVF87E50YZbGOrH2l98Ta9BDfIVl1mlIq1
         lHDLvE+0XblAb60B5tou8Hf+XEzIqNKH6T2//clW1ZMD8NdxByyPY4WaeSLf84ez4Pc3
         fckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154666; x=1764759466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4eB34ho9tLNd3EJt+3+XUDw0cEApe270YLGk56wWE0A=;
        b=kaM3eIwm3MiHBlttuYzFEI4K2G3RCdKhF//G0mkai+jWXsXMmE+dYMN3sABRfeQU2R
         iWdDEAmv/2r5E79hIEq7MxCaca4vWfYadZLRs46QYZ8pLwDKz9FboX3IlEZ9fbOnjf9M
         rNq0FalQ3PVOuxcpdZUb8lu/yMEciylf4hRopNI6NcNLiPQk5Jm2zUqMVKpk1fJ33VFl
         9yju95JBYYSlX4o/O2JWyR/+wbX/yEEQr61HOZcaLUca6Terb9Wuq1IavNAmEmlzDNK1
         A0g8rOWYjZMmlmZzETX79bhxEleP/oHApJaWcn79FD/8naniCXFW/Keu9EFV3DdvRleD
         KXLw==
X-Forwarded-Encrypted: i=1; AJvYcCU/dJLg1UD/d2lRhnE32RJ9l2F61IqShNI+QbZyzp/d1VgddMe1xZLUMcM+PvfNmBmK7mjvT08QJqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuhYhe+1NBN042Ofz1488uqs2IQ4SEwcXAJ4yi/eWysNNK7dUs
	ovEfNdP309E/G6GIcUR9l1AdfaQ/oCeFkZj5cfdtANQmhb1lN/idIfMM8t2Mho9lo3I=
X-Gm-Gg: ASbGnctVEObxVMXOGfDpQgEgLWWvjKP4oUw3UHlNPNARwoLw9WUFX16r67cYI3ecYpM
	e8C704hQ0JmybOYGAAP7EPEM/69iBsGF9hk9jCQ4z1TaoVAUZQreLG2kbCFslj7F2JoSs1MIXOc
	fIpMdoSyq/HL4dbuKLKbEhUKdxzSHUyHTPU0MJrsbMhHNxoUL06rtuYQrpIDf4cNpxe9RRrPruC
	WCu/J/YnTbCGuCCFa8L+99jFjKYv5hCE6qrYT5NLSy+3bVjU5A09LgsiCgRHN3RL5BzzVniIzyK
	ZME5CZD6lqARifoLvrOzcGTkCOwAK9gUwsexf2FK86tPr/+NJAvng7QZWMrmAwciIVCfb3I0hb1
	5btuarKezP92Ei3gE9tQH013FW+tv0+ebkDlbD2qxoHRAb1ZNLx9dxvvH96WvkeiOa23ydc0u3M
	1r5/2tqn2AQwvAfU1niJyW
X-Google-Smtp-Source: AGHT+IH2BvopeuRT0S9+xRNSYbyM4nOqRmPC8UzC4Hx7OfiHrAR6M+pqTSqQVntjYyB7HV7H6n6VHw==
X-Received: by 2002:a05:600c:5491:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-477c110e391mr180110055e9.10.1764154665624;
        Wed, 26 Nov 2025 02:57:45 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:45 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:33 +0000
Subject: [PATCH v7 04/13] coresight: Hide unused ETMv3 format attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-4-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

ETMv3 only has a few attributes, and setting unused ones results in an
error, so hide them to begin with.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 37 +++++++++++++-----------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..3805282b97e8 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -50,27 +50,23 @@ struct etm_ctxt {
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
-/*
- * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
- * now take them as general formats and apply on all ETMs.
- */
-PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
 PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
-/* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
-PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
-/* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
-PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
 PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
 PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
+PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
+
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
+/* contextid1 enables tracing CONTEXTIDR_EL1*/
+PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
+/* contextid2 enables tracing CONTEXTIDR_EL2*/
+PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
 /* preset - if sink ID is used as a configuration selector */
 PMU_FORMAT_ATTR(preset,		"config:0-3");
-/* Sink ID - same for all ETMs */
-PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
 /* config ID - set if a system configuration is selected */
 PMU_FORMAT_ATTR(configid,	"config2:32-63");
 PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
 
-
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
  * when the kernel is running at EL1; when the kernel is at EL2,
@@ -82,27 +78,34 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 {
 	int pid_fmt = ETM_OPT_CTXTID;
 
-#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
-#endif
 	return sprintf(page, "config:%d\n", pid_fmt);
 }
 
 static struct device_attribute format_attr_contextid =
 	__ATTR(contextid, 0444, format_attr_contextid_show, NULL);
+#endif
 
+/*
+ * ETMv3 only uses the first 3 attributes for programming itself (see
+ * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
+ * sink in both, but not used for configuring the ETM. The remaining
+ * attributes are ETMv4 specific.
+ */
 static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_cycacc.attr,
-	&format_attr_contextid.attr,
-	&format_attr_contextid1.attr,
-	&format_attr_contextid2.attr,
 	&format_attr_timestamp.attr,
 	&format_attr_retstack.attr,
 	&format_attr_sinkid.attr,
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+	&format_attr_contextid.attr,
+	&format_attr_contextid1.attr,
+	&format_attr_contextid2.attr,
 	&format_attr_preset.attr,
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+#endif
 	NULL,
 };
 

-- 
2.34.1

