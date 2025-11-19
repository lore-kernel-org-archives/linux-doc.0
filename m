Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186663A8D6B
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567170; cv=none; b=frSK/ISujZpwTMVl6IR+DJqgKE8OXKV/uGiPnY7n9Lvf76oE6ZYq6QFzubRszhQPU7aweljsD4I1HtMye4vlqNW6sTTXiPTvRVQGZIsZTiTTxRjzalb4k2iprbsiSgysmz65qAPcwib6XhA+FQQxGmHmJc2h3zVTVpgoeceFlWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567170; c=relaxed/simple;
	bh=Vs8lQW7BawUxmkOmLvkVao/jUHVbMrAhKW0MzITmHHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=INSR6ppy4VY6oed0zmceUCJlOoP4S3IltptIog9xynKLfORRgqiqUUA08O8y/S/gjpsCcMY8GCIbvpVMFPm70h/3nSLFlf8Xz3dFf1yFQCNyx/ESuCa0iizI4MghO/eyFI9TR/eWkgn7sxLvFQ9abbAKUhTqklVSCDSYqDjgiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5VN9gtA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5VN9gtA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso3464433f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567161; x=1764171961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plmpXAswm1LBomkuKtBG6pEMvq3kPgWo3F0t41OaVKo=;
        b=s5VN9gtA7BI7QEVyZFA8bNSEEtzGadJpV0n75+YSnEQFbezbHy0V9//G5xZOOBKNy9
         w/dFXLVOJAGqEChl1FE9CuIi3WdPHYT0C7emqe3w5/eAxEPF4lTjCDpCOfPKuM1OxdxG
         VfxOhSXpLpyvUFKSe4R6FXxwFt3xjVEq8fpT8vy3fSk2d0ethXkqeMBhlLKM3gBYnspH
         /WaE3rgjBZi9tX1i2OjQR4fI8Ubqbk3BzV78jghkr3GTr/xiNPoZZNk1NgHpEXrLADPj
         o0K8GM49h6Vz7yGMKgEq8moU5p/xGZwKTyQFzpwXbiDxSIbrsvD/4tAX7dBJ0XU0jvrB
         JqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567161; x=1764171961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plmpXAswm1LBomkuKtBG6pEMvq3kPgWo3F0t41OaVKo=;
        b=EKdAnPYiWpq0J7j8ps5x79uEUOlT+oTV3LSHAmy3m0VmhA586KRhurpZ5DiapBSbI7
         SPbRY6BAk1HsyXPLa5WZAX0Uiy3NnvN+6QZEOWtjgmVQ7LzN/ZzrHnThwms2LyUo/5Hj
         FAt5d1klR2u0H8dAYc4KOBsniULQr0cA/vBn9fH2PcXzxmBu9D7KtIGLRVs+PlP5ZCiV
         xY5FNEUMdsGi9ZZa7LgPvDvmSNg+1I1okHLItVcFQqfn1v/HoQBIwz+CuahJBO5VastS
         zwZBEs7hlf/XHiJ0lJt5l/H4MeJ4bNPyvlGsqfXTHX9sa2j2j37DOwra9iZl77dIA/qV
         /GrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWndG5wKCCritjpM2pMx/gAtElx9O04ozvgUzULkpHfmd0AbRjg78PYBLwRgYd3UCog+FK0aToBBVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFuNueOhv0iGw2wgpdOhozQ+2lKnKxttEd2gpM6KGIv6J78Qt
	1OIPIJIfIRe0uOgPgxDOHqykmg79ump8W+S/a0/KOxmGEM8LX7YLolndvqHai3YcD6E=
X-Gm-Gg: ASbGnctKdaeiICV/EV8xKrlunElZ6ORQbeG/OcvfjqF+JA8xQmEMAUYbHyke1jGm/OP
	Glbc+aske3QVi+rDZzB7b7A/9v7XD8LUi92o1tlHKBKY23e45e3b5iZZjrPZFTfMooiY337GAzY
	ssS9R7E9HKWbdAFkly/P2GuIAabGITVNz5+HTrwa/HrVE5t/YJVsntH1IiiXGtarSLIkP2Jh9lS
	kdhfNNoS1Ptmqm3Nphhwh4RGWcZwDJ40j0RUHoR5VUGxB5dr6el0JjBisW2W0K1u2Ux7RHqy3yO
	BQsozAi4v5BO8ZmhMz/Sg7ShJn7Gk9TgLr4HN1lauvi7WB4JyiQ/ch/Co2Zyv4m6IvoMdT2M3Yo
	YdMPjAElhlP9DWWzY7dApY7f3Wf3TioZORJffB0FLt7Rn6QOU5sd++246Ow7R9a8cdW2JRXXHtC
	gceFZLh0MNuydXYKySNwpdLPATh7WgK17r2nIyyRYu
X-Google-Smtp-Source: AGHT+IE/UWqNyS6htQwPVCsFX9f3Bqg52uzu0v0K2d2YIVRMOF1vqDQaElTCpee5ClbOZybd51PSbw==
X-Received: by 2002:a5d:5d0e:0:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42b595a4ffbmr19851079f8f.40.1763567160526;
        Wed, 19 Nov 2025 07:46:00 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:46:00 -0800 (PST)
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
Subject: [PATCH 25/26] dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory
Date: Wed, 19 Nov 2025 17:44:26 +0200
Message-ID: <20251119154427.1033475-26-eugen.hristev@linaro.org>
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

Add documentation for Google Kinfo Pixel reserved memory area.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 .../reserved-memory/google,kinfo.yaml         | 49 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
new file mode 100644
index 000000000000..12d0b2815c02
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo reserved memory
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+
+description:
+  This binding describes the Google Pixel Kinfo reserved memory, a region
+  of reserved-memory used to store data for firmware/bootloader on the Pixel
+  platform. The data stored is debugging information on the running kernel.
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
+    reserved-memory {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      kinfo_region: smem@fa00000 {
+          reg = <0xfa00000 0x1000>;
+          no-map;
+      };
+    };
+
+    debug-kinfo {
+        compatible = "google,debug-kinfo";
+
+        memory-region = <&kinfo_region>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2cb2cc427c90..8034940d0b1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16164,6 +16164,11 @@ F:	Documentation/dev-tools/meminspect.rst
 F:	include/linux/meminspect.h
 F:	kernel/meminspect/*
 
+MEMINSPECT KINFO DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/google,kinfo.yaml
+
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
-- 
2.43.0

