Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1E413250
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378789; cv=none; b=qCQOkiaRglYAxmTqlcO9ITbp6wYVR/oNU2lTrFskWO7gL9v86kreDmd/ft7CHZ5/5JAMb2OG8/xihBWHWz/Dbp4bdSNU8pwL+VBjFGaC6CH4v4OtOH0/6Y/fB8IbcQnwtjjTbvOwnweUtJMWkelD57FknS/oLlArZIZgxHGb+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378789; c=relaxed/simple;
	bh=GpiPsYASiqbAHQFZCILpVMlA6CP9faFuuzfrDYjZMIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LltMhQ+YOUqagUUTCFC4DHxd51PpYSCBy5mmKYS5sXsdi8bvc8T2Wi3B46GmvWDodLKSuUvKwIUquXJAweXSUPJO0Ti4OWscbOc1nx8qgWOXv1QXBmmZQg16B/4AMdLNKN2S6yi5cN9hzznhKPxa+2xpvnnKDMGZFTJ3yOvW8ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=OAfU7K9F; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="OAfU7K9F"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f8b60e485so4721441b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 05:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777378781; x=1777983581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vm32vRoZZ5yFrCpJ+KYjb2vzes9BEArqT3PAPVNaYwI=;
        b=OAfU7K9FCYjmrU6xF/JFNjk1GsrejmslTGiNDtPESRMBU47BBf7Pq7V3GCOlxU/tEP
         o5YCIK1aFhkE53XesuwqWQdsCPexThO3vTrd4t57kpfR3IV+OVWbJDoQB90825qYxW6G
         9Ue6v2QmA9Xn5LnSgD+O+H08dV78suvJxEtHT6Jbh7j3gJGtOS0EFpGDmtbzXkNrG+Rl
         9qZ0rypQSLNGhRkS5RHfnV7VC7i+UsR5IIG0/I9qPIS/7hPKm5cVKTvb97v1RrF1ErDz
         EFd3hwvuGFY5JEd7ld7fk4uCu7QVxWFwi7sNVdb0Eqo2YCzlXTIm4WmQOe4ClhYN9N6G
         8zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378781; x=1777983581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vm32vRoZZ5yFrCpJ+KYjb2vzes9BEArqT3PAPVNaYwI=;
        b=BqzD/5a3lHfdJbQ25joS5EFL2ijc/lZa40tUx5g8eWeufvYOVi/66bKBLwPbgRLIVJ
         y3AwFi5vpiB3IAypiqmAd468P8aNPL1eAlW4plh565Lu1fmvTlIeDigSvRw3hG23K6be
         wcCyQOZXC7+SWwTw+TNOADQfl4zqtduoBsi3YbaCLjaD1jIC366lxWGQxPUbtZoNIW0V
         llEWv/ja/kBtWmFOxPQ1vPFnfS7S5reX88QXySUMvT6gNSefLYdPG+LDbivrK9kGtjCT
         nD/Lzd2zJdnfFbW5Y9bdZKCXmnrTifW7qODyszGT3tLkD3eY+DogBXlDT5eZbuz0u8wp
         VvOA==
X-Forwarded-Encrypted: i=1; AFNElJ9mgf6W9/BQL0URSS1zZgfFS/xSk5SrQK/hn2jsO1tRiDhwMLocwT+VEWPURzb49YGtbLBmKkZDrLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOBY5AyXD0zy9+G/2diaXiv19nGiarOG9LJAO3L/p6R7uaMtIq
	JDIIt+/CgLqRjWLSTdG85TnFiJ2RaC8S/oD7y0RXC3Uq0DNro/1giERvEs7S4MnHFFE=
X-Gm-Gg: AeBDievo6MBxS4FOU1AiS0BpRUvPqUYy5q/HH0B9EiM2pZjJ1Bw0g8v9aa8jxLqWFpg
	UtJt8K3KPPJAr1V5QNBBXUHA93dKREY8vJpwVLm5jtLQlPGISO0VeH1XAHnxNBC2aZNqQFX9SIc
	CzM6PnKXVck4VL1enK3kwfrRjHhN8wvR3JXwrOrRF92P20wV3BMYiTpECzBBga3F1l1y4HN9OTF
	ZNVejfCT2C2p8bRxFzM02ZJtX9TG5Ez9J1AvFn9BrYvcJQNeXd5UIn4zZyLGei1Qy1sPM9VeQOu
	sbWp44zHcDaOLiDMhVp7dEc9E6gryfPyNndibuk93PFEwJpulFzfpRYw2TNB2AxnIK6qrK+Z3w/
	ePUen8elu+KWBMF7l0+is2lbnaTWT4Pu+LDWqnJro7+6I+cQlbL3e8jMpKPpCborUCDrsDkoUWE
	HO74Msu2POAmUJ9ep+2fUJekSpSyBEMv8uYhYJfL0t
X-Received: by 2002:a05:6a00:1885:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-834dda62ca5mr3222108b3a.7.1777378780756;
        Tue, 28 Apr 2026 05:19:40 -0700 (PDT)
Received: from [127.0.1.1] ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf5705fsm3254587b3a.42.2026.04.28.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:19:40 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Tue, 28 Apr 2026 12:19:28 +0000
Subject: [PATCH v2 1/2] dt-bindings: trivial: Add LX1308 support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-add-support-lx1308-v2-1-90f115954143@inventec.com>
References: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
In-Reply-To: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777378774; l=1627;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=GpiPsYASiqbAHQFZCILpVMlA6CP9faFuuzfrDYjZMIA=;
 b=tmE2g1bOGOEgdkl42iKy3s/qc4U+BujOm/diKonrLdCGc3P/Tp7el24NWT8VRY2aGaZRSmsmQ
 tfekRdhFruaAGBUwbWnBJYj2gzqtgsS4GwMfoF2YXkAqe5A5c8CuBEb
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

Add device tree bindings for the Luxshare LX1308, a high-efficiency
12V 860W DC/DC power module with PMBus interface.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..037baf4cd67d 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -181,6 +181,8 @@ properties:
           - jedec,spd5118
             # Linear Technology LTC2488
           - lineartechnology,ltc2488
+            # Regulated 12V, 860W, Digital DC/DC Power Module
+          - luxshare,lx1308
             # 5 Bit Programmable, Pulse-Width Modulator
           - maxim,ds1050
             # 10 kOhm digital potentiometer with I2C interface
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..67fb1592daaa 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -967,6 +967,8 @@ patternProperties:
     description: Shenzhen Luckfox Technology Co., Ltd.
   "^lunzn,.*":
     description: Shenzhen Lunzn Technology Co., Ltd.
+  "^luxshare,.*":
+    description: Luxshare-ICT Co., Ltd.
   "^luxul,.*":
     description: Lagrand | AV
   "^lwn,.*":

-- 
2.43.0

