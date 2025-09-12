Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916032F756
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689875; cv=none; b=Ti/vAIK132ND2uWEos8PhBx1AJo2gZufKeXgbh9wWjnVb3XcdMEwgkobycsedpaWsJ9ONhQAn4pPs3fksCUK5hFLq+qrxwkOeY/1AmoUNy1HXYUI2EWQSGwirZ03GTPPCu3hS8RI3Zxw/NegdHcRzdtohtmqZDTD1rSHiQcZyz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689875; c=relaxed/simple;
	bh=SaxLNwPjG7byVt6l+p6cg0if9w4/pkHze4tv4MutSeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twafjJyjDnUnAF3JFdP3zCLiCxo8enuDIVVA8olCU+PNiC9GQSbmkXqhX6S+pp3Ll+fxBPfyNJhx3th1GbeCvJ2k+YaMecEHpHg0dPQhi+gUzum5wnpMdaMSMtvZ5jCy3Q8cQcv2Yzr/0eQbCSRHfUSU/WJLa4AKChpMwcXWvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VjAiS8Xg; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VjAiS8Xg"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-724b9ba77d5so20276287b3.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689873; x=1758294673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNs2h9oqVJ2U55pyNU2xzrbkzs9MTq1sjEL+cOU6gkc=;
        b=VjAiS8XgtXdzKrUmMwBmLiNbs2EgyM6GmNxbpZai9EZhieVl9fu/1Lp4nbNLwhvzQP
         8wpPed/SEK5/wi4s35QCMhrNkKEf10JMs8CtILbmBESRW3ZP/etDBFt96wyMychc1chG
         LcNRs6mLqth8+U9L6omrCfSmW8im4VbBEmJ6MMRLry8tpYVlbhRWTxEq7LPyjHELgiw5
         QRzsqRBxeqV3e8otKZ9yXyOD3u8wAynvR1NKs5e84W5emwdpMIGepeUzlrRa/PmIBtR1
         ExuSg/Tt3vScbYc6rEbzRSa8Mh4Me1W17/K4p7HAaaILzo0WrdPPG/tKMKEF6/rhqLCx
         SX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689873; x=1758294673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNs2h9oqVJ2U55pyNU2xzrbkzs9MTq1sjEL+cOU6gkc=;
        b=GxpZb9Us8zjRyQZhX4V+e+3ius9VATd0ylbcmTuwEcv3JDDjggtAD8f2f6uZz5TsvI
         z/1Udx4ZUtMQIjBybGzII4BwAH5LN3s+ikysJdxvGL0G0PiPiRR856IK3n2n1R7za12l
         F50Nz7aDkTw+0Z1ubGzkvidpu9taP0VOXX7qPsIqN3DRGLOZMhZsVscsklzJISkt1UAY
         fVETZ2ejobpq/FzmutgnKUttCCsywx+9xGO2rP/72Zq87tVdK4k5MxCOBMvFo0beP6JF
         d5lphYdedl7F4z2Jd5BP0Yr+HorShV6roASh27P3cplKFka2u4jYctNzpC2sBT6TQBad
         3eRg==
X-Forwarded-Encrypted: i=1; AJvYcCWLSYJjXgDCCTCIuOnjdH45qKiKqUvl4/OXZdP70oDGfI8/xb28fS7ZxIiB5Zb4eLuCSAlPctTNTmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxygfD66mIjgkUjXrQqD8e24Ns4+eau0GOKWGBwzhIcT5P+Y8rq
	9GdnscZogjjkxkKtiv9T2k+XpBeJpyiiknv+6eks561YRWhzvf5zj7jVItGC0C2YHLQ=
X-Gm-Gg: ASbGncvEOTS9yYT5qS4n9dr1fBw1tmHJiVETMnPdLs/5G9h8XRDTz6HptaMyP8aRfVO
	La0ASSv2GP/qhp5wTt5fG4H5Hi1gwkVlODYhO4cv1cj4jYq76x9/00njB51YBEnIGWz+0r/SQW5
	UwDFUgNfeQiSrOD3KcE2kFY22+jazIYosgh53AMsCAjTGVf2k2T77rdYHcVRvBAULwv8TxVQqmB
	p6DcA0IS5fBhkuK0Ws1y/QX7Nf8BZNXi/wEI4L1y6M4pNxel8nvHlXB/50TksApLFJnGK0+WOg5
	JtoZJ9GEdH/lIc/PT/qwXClbWgtjAyVe/NRtWBHT63NUa+BujIfbbzPgGa0jCPvac2vVuMnvQtx
	MZO7Rm5L7xxsCqFgMIWECkQ6oM0BSh4uafw==
X-Google-Smtp-Source: AGHT+IEpiP8vlE6JAkelU9ryV0aqgK+NNUoCmR9E9pT/XsbUls6aw+6SDhLPMx2e7d1wIx+kCxhExw==
X-Received: by 2002:a05:690c:4a0a:b0:71c:1754:2696 with SMTP id 00721157ae682-730659ba7ecmr33141997b3.36.1757689872581;
        Fri, 12 Sep 2025 08:11:12 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:11:12 -0700 (PDT)
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
Subject: [RFC][PATCH v3 16/16] dt-bindings: Add Google Kinfo
Date: Fri, 12 Sep 2025 18:08:55 +0300
Message-ID: <20250912150855.2901211-17-eugen.hristev@linaro.org>
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

Add documentation for Google Kinfo kmemdump backend driver.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 .../bindings/misc/google,kinfo.yaml           | 36 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/google,kinfo.yaml

diff --git a/Documentation/devicetree/bindings/misc/google,kinfo.yaml b/Documentation/devicetree/bindings/misc/google,kinfo.yaml
new file mode 100644
index 000000000000..b1e4fac43586
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/google,kinfo.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/google,kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo debug driver
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+
+description:
+  The Google Pixel Kinfo debug driver uses a supplied reserved memory area
+  to save debugging information on the running kernel.
+
+properties:
+  compatible:
+    items:
+      - const: google,kinfo
+
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the data
+
+required:
+  - compatible
+  - memory-region
+
+additionalProperties: true
+
+examples:
+  - |
+    debug-kinfo {
+        compatible = "google,debug-kinfo";
+        memory-region = <&debug_kinfo_reserved>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 65d9e5db46a9..6a846c51db04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13821,6 +13821,7 @@ F:	mm/kmemdump/kmemdump_coreimage.c
 KMEMDUMP KINFO BACKEND DRIVER
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/misc/google,kinfo.yaml
 F:	mm/kmemdump/kinfo.c
 
 KMEMDUMP QCOM MINIDUMP BACKEND DRIVER
-- 
2.43.0

