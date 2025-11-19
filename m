Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8036C5A3
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567149; cv=none; b=VXFJeoQOB1JNATRVE2v0z4s7HyZGwsZl0SH+o7OR9/ObEgEbWOuxrKlAea1rtYGfalv4M/Y/ZjXVIa2Kt/TNMFxj+3UCQkMTnxOlXDJk4EPuEni0STPQ/besfu6DtFaN1UCxwiCsHPkHs0jPCf1IUYavMy7Vsm+WzWoYL4787Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567149; c=relaxed/simple;
	bh=b7ZOQzNfYMyF79i/MOcMgt4XB6zny2khgQb+AuAIOw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWmpcax5KFxEyQQ+ooajWizCeNYnmLKsLcaLoKF2p1EDuPETQzJB1SD1VGAPWakd+Qla76UV/AemJAiSoE6x1hfWOXLSvYTslWehlomgAculr0YBazNAk9Tig7UQjCGTVSv48XGwDgOyi9BsOFO/KcJ3n4C/MTiGboY5b6xfrbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XeaDF8kX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XeaDF8kX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b427cda88so4949246f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567143; x=1764171943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=;
        b=XeaDF8kX7ZMHl7X8ve6YNTs6euc7cDzNwMF9/a96PZftfKYfkZ/jXE/thXL/LIiIaQ
         Q02MWmIB0O+JZ4GbrTxisOUMxALtAyHyz7jTCadkeqf2n22P1NIagu441f3tgFfM7QcK
         dPVYhDfsgeVsAh6mkKLn7q2BI2RpjPAWudhIFGd5mliSmMThEjsoxYZzUd8k5X7CyRsw
         sHUf1zcJWaopAFbyIAHxwLNqAwpL2GPHXcCGTngCCzojxG1y0pFkuHuu7f41aalfT3XU
         P6RMp8UgCgz+zFoKCmXIQRXYYotpvNuXYRt/Q/hWzlmcyHHgx4Vpn62xuszXtlAhNHlv
         FbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567143; x=1764171943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=;
        b=RaHMKIGcmmi9U9XlJUE7KN0qGH6iU2aJ2GOzWafK9XQXOS4N+optu44tAqbcGDJDKr
         PnRcCgOQxupAAIadbS7vGzil9EwA9HU7/iVk2vHugCgEuW2NKwjjG2pnmVsqfbPT6jod
         5N5dRHoTCpd2UA3lZk/DBoa89gE1WY0SUQGMVV3cNiXZpe7kZolyrYTlUfKqAORo4O39
         5GjvoOWn6KeEVzo05yt1/otzSkoyBFPfg0IJpTjA6Oou0LVPpapb8QmFWUniHtTOz+hF
         CC3tRrejDPgJ+n2H46EPXG6tpbL+Cvligk6z2BFjc5cKadhOMFYRtIg2v9pLkrKRW1fB
         548w==
X-Forwarded-Encrypted: i=1; AJvYcCV8oXvfBrBaQ/jK+x595et9aGewWCsdKA/QaVrdOUFOJb/fVc9tVezmec+6ngfhY4W/psYLwOjkzEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVPkk+7W97UAYbIvhOnj3qRAPMabAV3A6RmMjJJeYMlRW8jLZ
	G5InF3qt3IaljbtZ1frb+Ud7+W4EZ18uf5WXz7XUk848Qt5fjdpz+yKmf68KH0gRRQ0=
X-Gm-Gg: ASbGnctq4B0uK2CpV1E2Hvh0dK/0wA7gcTY0XOKwTIdXcCQytxXyMK8CY+cfPpDKzd8
	5Q81N5lH3LL1d2ovKUzPhf2Bs5DZuoxrhO0pu9BilOlNymv3kVX13AmZChBf+XKYhFiK2BT4uoh
	GLLHgmurvYjyQP+mD2YdurskDGoUPe3OyIk4ze/rVAoFl7aYPGkLieTLwAgitpAoPOqRwpKLPQ+
	kGW4qEcRBbCxBn8tMxlHdyQLIRo8rfiwcC3YrzpWDap+M1Rqqgfhvr+8yfrMewN08iWLbV18/bx
	2J+uq7qCI0LR3We5GoDvNlS2uxf21b7ZGJBJ7zGOvGvqQz2qbY8r/CcwcFoEaFqzpZC7/Oxkuy0
	PYQ3L9mfbbVfJLH3oolUbfyJNfaLbY0ZvCbeLGQdvg9NiO9EmR9qLuE66DexjtpQkuzIoaYimIT
	pt6P7Ht4WvPKip1VEoSF0vb9jvusb0pg==
X-Google-Smtp-Source: AGHT+IEZRkUZWC9WWo9OX6jj9I/ZWQe6urgV7WqPXknOd3CwNTmQvHOBkmKtLsoZT2TI4A/OTOkOYg==
X-Received: by 2002:a05:6000:200f:b0:42b:3806:2ba6 with SMTP id ffacd0b85a97d-42b593394b4mr21022814f8f.25.1763567142926;
        Wed, 19 Nov 2025 07:45:42 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:42 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 15/26] kallsyms: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:16 +0200
Message-ID: <20251119154427.1033475-16-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into meminspect:
 - kallsysms_num_syms
 - kallsyms_relative_base
 - kallsysms_offsets
 - kallsysms_names
 - kallsyms_token_table
 - kallsyms_token_index
 - kallsyms_markers
 - kallsyms_seqs_of_names

Information on these variables is stored into inspection table.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/kallsyms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 1e7635864124..06a77a09088a 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,9 +31,19 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/meminspect.h>
 
 #include "kallsyms_internal.h"
 
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_num_syms);
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_relative_base);
+MEMINSPECT_AREA_ENTRY(kallsyms_offsets, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_names, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_table, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_index, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_markers, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_seqs_of_names, sizeof(void *));
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,
-- 
2.43.0

