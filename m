Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51C52D948A
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753102463; cv=none; b=lmwlCH70EUxOXSuNN8v06G8oP/FtkbwTrl6UtA9mnwy089Ahx7LTH2Evh4FKqxmqkjEssal7XPIqIm8a5Qmygc1USQpZYE57jEy9P/bk79qx/cL5UMizmtr9O9796PrDQEjS8x7JdeX5DgbaUGaoXrOs0AZYEZG8jgRC3J28MzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753102463; c=relaxed/simple;
	bh=luIKfiwgtXeAFEj50ve3W9I2lyEw3hMNW0iXhyMCu40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uq57oUkLpVzg8iYDS8kOE5oJ1djbKygD2IUBqj1HKmyktgvBm/D1omo6tBYQ2K/MJBsCebv/RbdmSJdA5P9X+grY9jIJlIbLkYetEzgVeJwbeN++yZr/XifDRVYbR9FKTN2VIdS+ZvU5qdyQz9VdLNKX12ED4S01F3UZkjHlWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yzeReaVt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yzeReaVt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so18384695e9.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102460; x=1753707260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=yzeReaVtC1gTdZ22qQr9laznUR9VsPBzpt83ldD/JXfdyYsctknu8lvST5EDOiWss/
         cwj1ui61wPe7h8HomQL/vIhHSThTeJnHmx+ZPpHdgXN/tILKuIW8K+vGo08KuTnezV0p
         AtEoqWjfqUuxaKto73hsk80vMSm8GK43NpqZgSKlDFHz3f7DdDmHaHrMBCj5xojTXGeH
         Fc9tQxS7FrvZV8QPVaVz1Q9XyvMtDuJR9J/6N5+dY8V2x+ePF9ZDPOqhD8n7Nw/sK0Im
         6e1abmjwv6Z0uuBw5DDGtfLyD0B2PAyHlF/za77nJlKXaB4VvXifxQCIbVHRaVcUr3QZ
         Lxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102460; x=1753707260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=Ucx+ZCXa8Ed1nJKTG3235VRK0uhmYwJybm7a5dATfwAR4k1DFZhm+nNvmeIsUE2yrW
         upOwdMH9X2cbTi72bqd1yTohJyefAXlLv/Ol6Nfj5dBRVgmzAe++xMb7lJrzeG9YYiCS
         yjhWg45rzgyjs7n++VLq8HWP6oFuPH8RYGfjr0SmnhdxYIDD1arnU0lu3PSDEcBgn49o
         MzXz1XjuiDwIWTAFfy1Vo5duWVI92fIVf3nsz6SPicUQ67v3fnwWUavbo9jy2CYCH+tF
         jwTIuhwt7zUnn200HjliAHZOT/DhRgM5D+UItgKeIFQLXCVLT6FPUR7JRtS65HEtoAOw
         Vz2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1tA62zKyEV0L1MhWoT16Yd1Fvzah5kwEeEP3xWENrhbNDIFXeZOFeW+25qkChHIszDLyL6VXyej0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKy9wGFDq2M3676ZSe5ZeK7fEHmdzGG68dbUedNpmf/Vge41FE
	LJuapxkVUKEhxLyROvcY8pNn5LdciBD8ajHdcN10MXSaAZVgSOotoTsP9fZGRaFeZcb0koimdS1
	GEFeUWNk=
X-Gm-Gg: ASbGnctqKaZm38sOd8UnUKNG0w8QqR3zHpHEP4qi7zv/7vRZLlxS3eV6PkdgCugUb0P
	TDunDbuPf0eCW/+dMVGRK5LDkYk0VzpqkLgKNKXldJTbSqcKR7tyCQwYMKYa3C02acZYHpDpAjX
	EB8PKY42BbJNqBnHS2awmRitLjV8V2/xXZgaOiEz8fVtFh+QvFBTTDFxCeFL3yavtsGHivZ0co9
	XbIG8cDKktZjXRxUQjOds8dbHw231Ngsak4wMYfVmsDd1mB6gxvMvTyjvxE+2kLdow4MaR5AU2E
	IpGPmYHJH6RMNIa95GaTai++ewhXsnPv30nYOTM7hkPAuEac5dIAsaF0aTvJcRONXNRrRJkMt1n
	ed3mcuQYaK7PzUpdLZKzAQg5YmhOmyil1eDfkX/H5GQ==
X-Google-Smtp-Source: AGHT+IGxBZUjqF1XoJ+We5sWi+shDrL0KCK0BKEfbRSuVRqaPLjbWwQUIAjCsxGeF4Kf4L6TaJ/XuA==
X-Received: by 2002:a05:600c:45d0:b0:456:21f4:a0a3 with SMTP id 5b1f17b1804b1-4563561a6c1mr160172795e9.5.1753102460225;
        Mon, 21 Jul 2025 05:54:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:39 +0100
Subject: [PATCH v4 08/12] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-8-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
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

