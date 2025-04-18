Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E026982B
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954466; cv=none; b=pDwrsjS8iCga1dS2SPzCRcjhJwh/l++oMQ9dnVt3QEry7ChzRqM985Is/xRI/6ftvfqlcVL0CUlllG2IoreBE959GGbYvsTUgxA71LKQ52sOIinBu7SKA4LbO3hhmh0gnvw4IseekmGA7FtxYAdWcm+dzjVE4hX+Ep6E2fl4UJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954466; c=relaxed/simple;
	bh=iNvtmhIIdE2E+xRjc7orMQlXMujypCVr1/7GWwD+Wzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m4uahVUFRi6FX/FYY6GJTcBGjcrnCJAQ2FJk9RnG56higWae6beAbbZgw1A5q0xjjpVBXQfX3GhKakzinBVqfkNacoXzVYTBVARbgxmNpBIcKjGsQJWikgxY4RlHPRw/QfsabzyuEr2HjXXWzq350PXP9AbFBOXqB2LVa9pl0/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GPcXYGaN; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GPcXYGaN"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73bb647eb23so1370312b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954465; x=1745559265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQs7uzZ6Onwkx41wDcc5ghYmXoSRb5gM/5WF7cFYuB0=;
        b=GPcXYGaNYoB80blbfSFnf/p2fhAS4CEex7JOsmlQjiOPEt1R/luOvKmZ1IadudkGyk
         xf4gXuCcUSTgfBcGYQop0Bj0JJtjI11KoaiKyoWryqpxqNxx2oZ9486COgxCn4NYFJQt
         cVWuuvnMlQbg8zHX0pj1TxMULsxxveZr+eSsTUF+uELpTuxtUx97y4UFGkZ6bKT+Wwyb
         VCFgtBanebl6ghRGIFC6NTrkbJ9t+EHitQszoOPRn3ZGqmpxpJ3GFAe4pPDLq8fOuPnp
         zOMX56yVwL0lBtreu0KrXKWf8WnAVu0ss2+IP/hoNupuuGroHPySDi+5GQgm/ItkqmFh
         wpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954465; x=1745559265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQs7uzZ6Onwkx41wDcc5ghYmXoSRb5gM/5WF7cFYuB0=;
        b=cOu9P9UO7gfCR/N+jfas65wiudvL6hMfcWqmkCHlfVCyzSGmkFAljgDxzi/SnBG+AQ
         5azCil5anO0j1FB8bd4d+naJYAL/85NFN1AOatWf5aNy6pRyOV1Ssvkm0xC/KfABaeS0
         XWEpaYQxd5GmNd81HJRuTiwyMAg4d9B5g97QM8EXsdaprJR8jpOSKe+MxHLJ96cy7Ofd
         QtyGInYC3hOtDUg+HoEwm20W+XgFPrsq26D3EJncs3jMS/mGCep3P9mmncJ3ja2wk4mP
         Al0/XB7T6b7qUWkuoLyRcCn1u9Czl1Df8Oa7fx4pMXPsnneaycgS9xJ1YpYHGyHgIYDd
         0EZw==
X-Gm-Message-State: AOJu0YwEII41mJv4icbc3OUFxGNiGj0CB/Ilh+VaBL3TVodh4DSq5fd0
	gc273ML4cmSph8hw6fhX0lixLNCrczkxxv0HzglE/MyjB32NlSeD8T3yqAzYfWo=
X-Gm-Gg: ASbGncvspztAKaOR22cHJgqBiGeQ+8At7B2CjcYx09p30dAco9hw4D5MeJKud80pzMQ
	cVIiGtFPZgaGYu8akwWA7IuIIbeCtAyBChPQYx77yAXtgUMZ6QRwE5lul1rc/LTS5IniOmlaUSs
	Jd2WJrMbznOn5y9ux2EJAUntVSoy5gZIN2XgDHM/b62iTfqgjf2xwa8Lj9xkQi+2IAgZ4wsnJ0P
	5b7iK6FN9eP6jud+JwIFKYt0wsSzcEcZEKODvXfwoygZ23zyBxip0kroIJgaJhiM/fiiap8ODVj
	UjyIBzxgyTDgW2NfUeZeMwTdm8fqqZMCVT9RJMttJrG2C22eWwITdNKoufQgR1zjfrtjpz210ra
	T
X-Google-Smtp-Source: AGHT+IF2DvMayvvtqWjev5K9y4IkVU3547WcTSfffFPt6RiuPH7JdExs6M3EHo0S62GLsq0ai7FbqQ==
X-Received: by 2002:a05:6a00:3a18:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-73dc14c7d0dmr1797266b3a.12.1744954464653;
        Thu, 17 Apr 2025 22:34:24 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:24 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
Date: Fri, 18 Apr 2025 13:32:32 +0800
Message-Id: <20250418053239.4351-6-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "xsfvfnrclipxfqf" ISA extension which is provided by SiFive for
FP32-to-int8 ranged clip instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d36e7c68d69a..be203df29eb8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -675,6 +675,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
 
+        - const: xsfvfnrclipxfqf
+          description:
+            SiFive FP32-to-int8 Ranged Clip Instructions Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)

