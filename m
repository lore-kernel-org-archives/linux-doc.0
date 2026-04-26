Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7235C1A1
	for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204492; cv=none; b=HrkK3ugFS5Wzkj2k5NZi9tzWFGf2W1nA3FoPVf07EENaVm5IeyJhdXWtwEk8Q8MpnuInA76aMtu2bIOzQH4ec8qAnBoB9AfQirihLxvo7bydl3osbkR3JL9fGizR7vQkb7Ar8In7I/9pkI+RV1uYfTia+iFI+miCGhF1pYuJV1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204492; c=relaxed/simple;
	bh=bXEAu8dm/Md2Hoo00nr0sADiZPaa3JrZAFzkbiCSNFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xg+35vEjEl9u0aiZtZSFPAfz9WwWAC/fSwus7pvwn/QJuTjL5HfbgCK6UB2sB6+cU0m3gfV7Ob78oxr93XyR/pscLXa5TSIfuf4aAZy6mDC2Lq/krV+qzWC417dJf7+HePY2E+BLOC0Jw32l3DoUeLx5iUPLzB6X9d96NSf9leI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEaUvsk4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEaUvsk4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso7935822f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204489; x=1777809289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFRtYnMfqIjWbEB7Nm5EvqwrTpEBb8Zy5pR0tbdz/Oc=;
        b=IEaUvsk4N4gSFGGOeQNFGcAFcindjpIpEHeosXEryJgxIhMgKIEFJsjLxzJw/CpbQW
         OBZtSMNnxfLQfqZQSFs91cyZNBysIsR0V8UnCJ0HbxDCqxHj/hkJ5p0joGEiIzeJchFA
         L5A9GSTI8eTxKKRb/78NtDNQeFarbj4AqFC+scZxh5/ccWbtE1qQQeXGztvFvpA3wnFO
         OOQbg0K/6nrj631toc6XYragFfQKoxeFfNrGQS8Q4zqBfbo09yUGA8gVzPHsyB+je31Y
         ZL83OUlYHfaXarJC0dO28WD8fNkP72U1IK74LuUahzTArZDlQPsczhlGupt+z52/Ax4K
         rRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204489; x=1777809289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFRtYnMfqIjWbEB7Nm5EvqwrTpEBb8Zy5pR0tbdz/Oc=;
        b=QyrPRgkzC6eZbMMgDCSpOSXVmeYXKSO+eEyUx2MEkcB6iq+aPTQG2HbPfq4PWHGsyK
         R07jkI2a6+b7Izd2RvzV/4OuiQr70OfqCvEgjCqvXg0wP/Y81oPQWg0jKH3Qzd4r6nS3
         VpNiUJGrXjuwAB2lil/ae9CMLR2myisnI+GC2u1aOqeiMzCwCGOBPE+QwQ+wJt7mXqKE
         gLv8W84zjlTaEsurL/nt4gB8ZBlDEqlSTbG0lUo6Z5ThzXt8nplJYQS6okGap05NnrCP
         Ub668qR5LaRw4a1yv4kdAvjZtMrrXDr6FU3r3T/7iy38ZgXMtkU8AdaJBSw52zgVXIPw
         fAgw==
X-Gm-Message-State: AOJu0Yxb7bSgVoulpjryyvkOB5R6+7mOuKcooVm6oqJgzInodao2SQwH
	tHSfdKQMm3DksHJNYVzzUzDBMhiY1FBA7hGQddwMH1Sg3tC9i+Rx3mctnmx84SfmnoU=
X-Gm-Gg: AeBDieuhOFkDVLbL8Fjrpf9XMS8fPN6NBKK2ZZ52ow7BcA82gQdZ3Oc4tcAj8HKsDyl
	xU7fB7ZgO73V5xt3DPcp0/1IzUrrtZVQhxEVyL3M7P6bg0lxq3jVF4NyIVuW6uRgFJIUW+K/jbD
	pst2q0vyXL6nBe2Ym724WMVsdORRda9+ReCLEqx1qkaYVI6cH+naTBhsv9m5SLDyLO9/FSX0TaK
	QM41oBmS1ZtGgSRyvVykLKZuw/hLEKzrlbc8FCXms7HWvWe47QUmFK5EPOPVq5xD1zz9KtMVJqQ
	oHCBACr4b1TeoOcSAstALKdFWxWwYDldcHrMW+6GgZPeeDE+X5bff2zywOGwaEhQOEk4vyybLMe
	8PI9ZaC1uXvb9hv0dfgwrvto+TaKjh/PLZSuJcDqiWyYJKyLgCUmu/PpoKX4Lel/G5PvPe3ZEfh
	eef7RlE0D19WvzJkGCf466A4kXniCI7GRG3grn1KH9cr2MTVVRrmE=
X-Received: by 2002:a05:600c:5295:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-488fb77facemr543233015e9.21.1777204488689;
        Sun, 26 Apr 2026 04:54:48 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:54:48 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:14 +0300
Subject: [PATCH v6 1/6] dt-bindings: arm: zte: Add D-Link DWR932M board
 based on zx297520v3 SoC
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-1-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=bXEAu8dm/Md2Hoo00nr0sADiZPaa3JrZAFzkbiCSNFY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+L8bHJ3v3mQmorkdJFu/1k1Q1rxfqFwIAj
 RcmfDEnmGyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLSCRAAkC+A/ax7hQyrpCuXnczMhBdavq5k6nz
 1/7GrMB9U2uGk0Uh7bfp2ryxtObfOnxC1ru8NJYgmIGzvvOAZHwLxugoladVsQ9V6PeZK0y6MfY
 KlFVoq0xjVECtaycoCLPkbPG8HZ5V4uAy57OARxd9M3r2+uqGamoYfcD2K7QiSv728ioT5CKmhZ
 lewVdrF8Yek6FpDtgyLHxRpHs3PqgrhhobbTQNs+SG2uawCvPOr+gKdA0MoWHcccb7N9Bn5uAAs
 1KqSciDeXRZ2kuPoiWz4PapElCh9ghowPPZrOnb/iHXlZsPuW5+9RM0tut4GluqeRDv7o7BSQiK
 +EacECiBMZK3EtelUqe2zT6z+25iieUVP20mcY9QvcoDWyWw9uDgthKQQbJiJfXRXq62InRtRpf
 lZYQmIrCeqrmz5P36pttfbGJqT6v86264RCJbfVi5l3VWNqW5LIQ+Hq0qef6sb78Ajdm3+2D9yu
 FnQvDmEacrLwa+oc3wvHRUcBkkTIVOXqRHoJBfI7S0nY8yuzurgzbeqSbMg6snGblGDIslMXg4d
 7k9DhlZc+O/DNXSp7SoEhFWwQNcpCgPwpJaeTOZYrIvQYlmRXx7m0NUFvG9TPXwJfB0/vWFFsVw
 pbDWd0/wwhkB/KMUJv3mkDG1s5usMAJNDOdSRAjIERTcz1Dvb1mU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This adds a new binding file for ZTE, containing their zx297520v3 SoC
and one board (D-Link DWR-932M) based on it.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changelog:

v6:
Removed extra boards, I'll add them when submitting their individual
DTS files. Rephrase the subject to add "zte" and remove the redundant
use of "binding".

Moved the devicetree bindings patch ahead of the implementation patches.

Moved the MAINTAINERS section from "ZX29" to "ARM/ZTE".
---
 Documentation/devicetree/bindings/arm/zte.yaml | 26 ++++++++++++++++++++++++++
 MAINTAINERS                                    |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
new file mode 100644
index 000000000000..f028d2cec7ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx platforms
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  ARM platforms using SoCs designed by ZTE. Currently this supports devices
+  based on the zx297520v3 SoC which is found in LTE routers.
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - dlink,dwr932m
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e12fe1f..b768b9da37a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3772,6 +3772,10 @@ F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
 
+ARM/ZTE ZX29 SOC SUPPORT
+M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/devicetree/bindings/arm/zte.yaml
+
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.53.0

