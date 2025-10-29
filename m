Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8C34573C
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752806; cv=none; b=fiI6RZFfKxLR1VIBQ4TDhG4eU5zykYVYPJ4iKdEfI67f8LaGsM2UvltjFzwaQi3Hb3Akvsh2+3dfg2gtU+iMSXkkRpk8zps8+9gl9fv5uqLj+e3Gwhb+uQjf/OzGXEBFysAt4QlPxyXVVV0oe5ya3pj6eBM3ed4UVmRSebLLtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752806; c=relaxed/simple;
	bh=b/ttJae4xiEHONrSB61gWYPCVcnCnqIpQyNKL5V/Pqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5McCdiq4N58bZ2Mgyalew9N96MKzdjGAoYhY+uJP7MnUBdua4EPdi5cyvOT52hhREO88Q2/Y8kqfnAQH9zPnh/oBHTg83iXCoSalqu2zB0kiW8ZQAjAvgR5sUDkAOfy68USMmB5/u8ALVKIFcBlr0VR+9AL7QWZcQ8FG9hA+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ShHmGmuZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ShHmGmuZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so21817495e9.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752803; x=1762357603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=ShHmGmuZPoA1hsZMLL+v2PKUW+6LomOA6CM5WM7kgYjUwXD4eYlgD0U2wtJexjZjjR
         afeKDzSGq692VY5s3ykIh7OLAHx5uLGfy1n3f6oI61BhkVKy9/38UsUprsxQXzQpScwD
         SFOwqjj1aj5QnkzClwBp0Jl8v+huqoCxUlPHp6KaQRJLt/kzny7X10LtWT242SyFGQHp
         fWDuUGbkiEFNktK2iVRRLkTTsJa8++dW+t5WimpXSOhD9olEIMw2hlxGkXfNXaDPeaza
         scKD3gIxK/aGS9bROQ/hwSE8I+T7q84rulxrU0nEbkX8+esoUTuEMTFv/PkzG2zww5K3
         zyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752803; x=1762357603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=pdYQzgPEebcVphbkexb3gYL61UUxrs2L0Zc4d/GcnRXDMPPcR0Vl3317XkjYg2WAh2
         vPdUsCAWQZpE87kUjNeuByk0l0+th/lhrh5wLJ4QTX+nFzAbyTTob9LJbbHzwx407aqG
         RvCreye/ypIc5dhPwDunKr1ar8voCN3fjf3QaBAFyWWgzGLIqU0yQDM2KZP0ttGi5UTX
         EcLr12Dhw8A/g7305WnXrMa6cFsoBwSLSoZOdubUaELTZ0HVw932L0+DTETxO/5Wcqxs
         wASKsk9RnC7mNx2heT0hXGr6DHAgDOkJlfX53lCc5qEizzK0Hkf4k7Z4IgetXa6LoUXX
         hAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSgE0R8pyZ16K8Z45b5y447v0Q0IZTVH9SrFDfKbbWFpjRjJjTO4VIB7VHlnJ2ib9Kvh11WsFg8o0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08QHvw9pfx9cwf7yLKmoTMzSgsfzJmJTApauqHegVgh5B572J
	rsHCPCAHqzxXzPzvAc0tRY08Ks64t0wuTVXhJ5OxwTJVpH5KQi0oluyP8VTFoo6h/wk=
X-Gm-Gg: ASbGncuPpYRKOPLSSaMEr7o27xKlE8BTBl29eJqOUgpnKMkXbh5GHWbTXqHayLwxihY
	jWzQodgx7+y7kUYkFgakKVjBS6EiuucoDfBu+HFC1EJNQDqrlhqvPFeshInRDFeWqwFY1QxUvzT
	w4SohN/oYEsndoZuM1LjBT660NhTw71qS1GoHsM4RIIxeTehUkbdVOUAervPBseALziUYzVIvjH
	cJXeHRYj+R59jhE0cjP1KwKVxT+zm6LtAtyoyenZay+BeBjtgeHH49qPv1mogxIzQL3ewouc5fU
	+lgNTvXLhHRyx9tCtfMGDwND+HWqm7kn9GDkzjBF8jgcOW8dM6EpUdH/I6zWb3T8AxOZ0oSyIdw
	RJb0ADrcKMVcUi0Z1zel98sT5KuwuLs0xl5P/tlRZwDPD+yfX+OK2wK/5ofdMGld7zE8uurG8Ef
	Dw4Dys2K/7hLeqwBKqvd1G
X-Google-Smtp-Source: AGHT+IGgMpgZEFzxgXHO7KovTsc5aHb3zJSnvVbjxNijmQFt3YOgqBA/a+6DV3XDRna+PgQBEaHpRg==
X-Received: by 2002:a05:600c:3b29:b0:477:e09:f0f with SMTP id 5b1f17b1804b1-4771e165a0cmr33584695e9.8.1761752802900;
        Wed, 29 Oct 2025 08:46:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm53745535e9.16.2025.10.29.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:46:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 29 Oct 2025 15:46:03 +0000
Subject: [PATCH v9 3/5] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-james-perf-feat_spe_eft-v9-3-d22536b9cf94@linaro.org>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
In-Reply-To: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
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

