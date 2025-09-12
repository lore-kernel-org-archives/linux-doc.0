Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583B320CAE
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689835; cv=none; b=kInGHe6tKlae3WqP5SMsxQqwTsOokhQCJoqmPA3v2a4NVM0l8uGDR05TsIlgZ8E2K3aZ2WSckeKq7o+Y3Pw/nGCu9LSFcMUm+ij9tNog8fDdkf79RckkELIeVFASo1AqlFyptur2yRGtNJFmWFyg8rb9bOndq8o7FfO2Jgc5y6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689835; c=relaxed/simple;
	bh=k5/I3UYTWdnJjKzBx+/VZfwmc+jXcyZQNgYc3CqZv50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVaMuSHjiU9AivxsdCAdxzKNwdaJprSGmRKy8GPV3jA6ErlCD2AU2eXSqodywbbc3Xy/ZcRWuWkUik6Udar6d9uayzIjB9kaBFwXpCOFM8QR7xeO7LdjIxN1apVt8SMqLirDUdlgJuyj+z4vhQ8FYkV/Hzd10vm15psYn3ATwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWZ0DllT; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWZ0DllT"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-72485e14efbso12117507b3.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689831; x=1758294631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1ubFmujdan3yUawwr3ZvZLjd/mUy6/pR3VRzzGBTTA=;
        b=sWZ0DllT4BQ0jI3qqkg+XD6RTzjidkX4MxjJia4EeeNc5bXrnz+bG3bw8URL9PUYWO
         +sSP1xwl9ipPyC9kHfPp5/11hMMugNY55NggwsdyDYgt6OONEMiodLwMFjkAoJmyT597
         r0Bt6FE7vP6ZcYipiv0ddHKggikm9iHpIF/bzZ8NovLIeq2DwR+P5xIanNGeqGDi+4O4
         alHKWBpiQPCvlncXdI79f/JA2hpchOfrcTetMi43L20OmVTbzd+FbOHnF0DfZ5q8do0I
         b1JSnkdNq8Zgy7f07l+0Q1C5Y3hrXb4Nmyv4A2gKyIqWT0Ru/niXKF1+6AwFQYsekmsP
         4eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689831; x=1758294631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1ubFmujdan3yUawwr3ZvZLjd/mUy6/pR3VRzzGBTTA=;
        b=KlxoerEgkGaNH28foPHHprDByK5BDaWDbeiEaG3zlC73/0HnyJdMXd4FE/W3dG77df
         4vcFtuTK/xV6jRLrOg91KHKvw/FIDeO1NlBKrTO22X3GkOPNoEQ5NNH8SFEfXe+vLz5U
         8PpqstkvgZQ8GgNok6+lmy4YdktENxE/dXj1+HCSv76HBcsKMM/FQyOk7Q55LRHQOpSq
         27QmtcvKp/8bOwFOVawjO10RyQV3qkhPqSX6eW/I0ShWYJwd4iQZZGo5g/XuyYMqvcKe
         aDzfwMVX5DWPFaA8yPrDWfPcBGl+z+2evNjHfcIzj8q56dKfXJaDvx6E7jpH2ndrG1gG
         gxKA==
X-Forwarded-Encrypted: i=1; AJvYcCWsDl2AA2zzmyR78wDHg6cYh5mdGA5Lpm2xZrvHRIwSK1VuC0Q++N6FhiDWnKupSiXnI/FMLYWAl84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2UXBQgex04Z3JXquf+TF/Bpcm74v8kadQNhd8l4rEMxbxOjr
	Lj9Z7zTw5TAs28/gU5dzaKKzv2XzAonY9slkFDdaKANL8awd0KBBEYf/FDqEbPBkSBo=
X-Gm-Gg: ASbGnctFRdvvS3rirg1sHr6xEWyRGXkF8+/URO3IUvT8IaaFYYMe6sx0014yjE9RjGr
	W9yBShm3BX7lc2tdNvC2O9wtox7KzpjWKzELpIEv6y8DK1vLNhtTqmpIvfCfKjjjHaodf3322mQ
	sxcHK5pjBDATicVQvUv9EEJQG3Md6boOzr1JhKNCwqtw71tx1mlIo1whcJXUBmYlsTPXiAIqozH
	b3OPtrV5yES3Aer6TDmDrd7s2zC4dU+8rPINAuja18tQ4FZpbpOGlS3EtgvEyUtEI/v3ZWq3R4L
	uFhkcFlev7mIRzIyLPVgMkn1kYM3Qzg1pJRkJybRbMt4NumHPGL+/YBWRU+oYlh74pHCJOx24sG
	DfxtxpPOPAuVSWPcRY8pXCMJ+bd/0Sl4R8uBiyCKuRSb+
X-Google-Smtp-Source: AGHT+IGQPX6y0JKi888sfyXxAah3q3fQIwu7cpMyf9JJWf5Y6/yYrim06D3kAGSOfpN7Gh01tRPdkA==
X-Received: by 2002:a05:690c:c08:b0:72a:2d15:a2a2 with SMTP id 00721157ae682-730627c9015mr33553397b3.11.1757689831515;
        Fri, 12 Sep 2025 08:10:31 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:31 -0700 (PDT)
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
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 08/16] init/version: Add banner_len to save banner length
Date: Fri, 12 Sep 2025 18:08:47 +0300
Message-ID: <20250912150855.2901211-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add banner_len to store banner length.
This is useful to save the banner into dumping mechanisms.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/printk.h   | 1 +
 init/version-timestamp.c | 1 +
 init/version.c           | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 45c663124c9b..5bc617222948 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -12,6 +12,7 @@
 struct console;
 
 extern const char linux_banner[];
+extern const int banner_len;
 extern const char linux_proc_banner[];
 
 extern int oops_in_progress;	/* If set, an oops, panic(), BUG() or die() is in progress */
diff --git a/init/version-timestamp.c b/init/version-timestamp.c
index 043cbf80a766..1fdd795be747 100644
--- a/init/version-timestamp.c
+++ b/init/version-timestamp.c
@@ -28,3 +28,4 @@ struct uts_namespace init_uts_ns = {
 const char linux_banner[] =
 	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
+const int banner_len = sizeof(linux_banner);
diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..68d16748b081 100644
--- a/init/version.c
+++ b/init/version.c
@@ -48,6 +48,7 @@ BUILD_LTO_INFO;
 
 struct uts_namespace init_uts_ns __weak;
 const char linux_banner[] __weak;
+const int banner_len __weak;
 
 #include "version-timestamp.c"
 
-- 
2.43.0

