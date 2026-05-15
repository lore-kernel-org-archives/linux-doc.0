Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE63C9882
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 03:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778814213; cv=none; b=pg1mpbYAI0ze+r3wJRSN0IIe7eHY06SAD5nZzAwdnpX4SIE8mt2K3JN//2Rksf/dKkaH3Z2/oPI0Mbq/0hHdRg4H0wBKdBGV46RpNaN5D4qTHXYS1U6V1kfGSvpF3FeIKG52CIYQCPe0jHh+xRTFVsf5WJlsMyifgQ3Va49SBdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778814213; c=relaxed/simple;
	bh=LE4iHKm4t9UfoFq/JD7py44dDWXkdwherx2HuxZ/YYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lq/1ATKh6tgmYo3D0t3u/k4EDg7enzRvcWY4u/6S0HNrEeRMuJV4bDr1KtAb8i0M52l2w/UbnVGLaQz1vBJNktDNuXXhbBCy1VWGII2JZe9ybxYuLNrBkpDoVgor0frAmpCVB6Jm063yKGcLEz5qmv0xRzrAlJHvwOAQBx4MM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ZXjIE5k5; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ZXjIE5k5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f7020a928eso12288101eec.1
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778814211; x=1779419011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sukG3LK43QSVOar4Qmd0GrtT53PCwKZDghqzgcwbn4w=;
        b=ZXjIE5k5n0agMDMRvIPITxpS2a7lzo4iCsib8uPY6EEfFWQEFEu2fjVgEHtMCEQ2dk
         JSb1JhWJ02Z9BGpE1XQxRSVKa+53WEbfXJRZtwWgJOHY0hml7PtmfKvHqHDv9j94s4kf
         vZK1TkA3/VYB+XgKCzzLIBkqDOaB8gYZjrsSC6mVmrhHdG14trGFCHqmMURqCUEN/Dkn
         xrX2W+2/HQMblrCBrrNOsk4oXOLvSCF20Q27hArnSrUdSFtez4g6eoSlEU26KeVM/DbP
         Z9qXi7W4f5NbLOI2aR6djCne6nx78CWgySHA7H6IejTUHokX4+lr8EL6Xjj1mTLO8Sb1
         BAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778814211; x=1779419011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sukG3LK43QSVOar4Qmd0GrtT53PCwKZDghqzgcwbn4w=;
        b=s6WZBDEj8g+/GDiIQkLGpLhM3TyisvTVtLDpbW9x06z5HBpxTPyaWdLCyUnhh1aZAn
         1lVifD9LiCY+vxcAynlJYA0xgGSZ51flRXSGNpr8/4Rzmh9BqFzsV2UBuuHYYt533gVH
         u6M5oM0GKHI7DEi6i8tqsqFyB62sPa474H0dw4G4f9FxhK3b6hqp/hfLb84AcFKepl85
         CAQmNs17yMSA98C+PM1afxVzIHL/4AHOLNEqt5zrpcOhDx1hpUX0V5L5NG42QHeVzqg9
         mt4fI1iTY3wM4zf4eHZfxqnKcbbxskAaKIk7NEsdr+FhFDzrt5cIju1lUl471jL0RbYg
         PR1A==
X-Forwarded-Encrypted: i=1; AFNElJ/Cf+CJf22ojzPxY9cGx9fw3GBSJCWMKaVWpV1XkTnHcXT0Rw66Z6YnkT8zr3nuGUdfcL1l+TKEVsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2/JV+8t1nqcODjv6LeS/DUH2jEjVEMw3s/dyas7sVfKJq1Jy
	9UKcVoucIYTxSNrG5bfYjt3sChQvkIuofhP4r0NQCfg3hPuDQOpS8bEYds0hWM+mnfg=
X-Gm-Gg: Acq92OHWnWcCpqpSoUzjRrtL0r+ixWBg+5ymmdESwGoYwgbj4gAFkyUWExHCfk/mpc+
	oosFyo/Ui+AgJtJDRubWO3ORyH/ilqHJsixO73tzhMCfY8L9A0Cmx3a6OYyqNDb3k/lOyh0GiKh
	6EM/n4OzJDayrhgihDLhMUt3BJVkhLDB47iWZY4Q2HiZTX8nkaoOI7h2tpNtgj9ucWQVMo9VRBQ
	kxbcNgohjK5dlxICpMhaHoqjTfw0xRvcZJkxN4VkJWvBNCovKCRTz99bbRx0WJuHfemBj1czzxS
	EZ8C9Ix5yJuZ18YEvRdcCgd1pthd+I/rlgCVdyvOE6dQ7bGPBgxX3WNAVGSb5jfqPGylllNswiX
	62+MLxAD74dq7L2jqGCFGBmtlOT77BLEtXhfkCe0oKwnrVqCwXnDzuyJMb/geIqK7iJs2Xn3DyA
	178uGnCfU5OtOJi+TiUZnIIm4Fdw==
X-Received: by 2002:a05:7301:608c:b0:2ed:e14:7f5f with SMTP id 5a478bee46e88-303986b4534mr1062366eec.35.1778814211151;
        Thu, 14 May 2026 20:03:31 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm6347011eec.17.2026.05.14.20.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 20:03:30 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 14 May 2026 20:03:25 -0700
Subject: [PATCH v4 1/2] dt-bindings: trivial-devices: Add Murata D1U74T PSU
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-d1u74t-v4-1-1f1ee7b002ec@nexthop.ai>
References: <20260514-d1u74t-v4-0-1f1ee7b002ec@nexthop.ai>
In-Reply-To: <20260514-d1u74t-v4-0-1f1ee7b002ec@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778814209; l=1648;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=LE4iHKm4t9UfoFq/JD7py44dDWXkdwherx2HuxZ/YYA=;
 b=/kCOYXl8ifIU2EnFxiX85D74yslO3ujA62IYMCclljKZkjlF8kisal3nsSXsDFuMMjCnbaVxC
 e+AZaPkft32BDikpqNhgtfb+pfX+iMQrzBsYQZnqdhXgpoiMCwTv8kd
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The Murata D1U74T-W series are hot-pluggable 1U AC/DC front-end
power supplies in the Intel CRPS-185 / OCP M-CRPS form factor.
Each variant delivers a 12 V main output plus a 12 V standby output
from a wide AC input (90-264 Vac) or HVDC supply, and includes an
internal variable-speed cooling fan and on-board voltage, current,
power, fan-speed, and temperature telemetry.

The host-side digital interface is a PMBus 1.2 port on I2C.  The
PSU's other electrical signals (status, alert, current-share) live
on the CRPS edge connector and are consumed by the chassis
controller rather than the host SoC, so there are no host-described
supplies, GPIOs, clocks, or interrupts.  Add the compatible to
trivial-devices.yaml rather than carrying a standalone binding file.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 23fd4513933a..19c8c7220858 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -352,6 +352,8 @@ properties:
           - mps,mp9941
             # Monolithic Power Systems Inc. digital step-down converter mp9945
           - mps,mp9945
+            # Murata D1U74T-W power supply unit
+          - murata,d1u74t
             # Temperature sensor with integrated fan control
           - national,lm63
             # Temperature sensor with integrated fan control

-- 
2.53.0

