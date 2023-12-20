Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BD34644E
	for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vAPPsmdx"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e3803643cso880015e87.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 07:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087863; x=1703692663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szFuFOaVPRcoa/3KGK9k9VHnKNMXDyjWXMloTHpkWuA=;
        b=vAPPsmdxmpPkKNHR7Q6UiwoHoIUub4UZ2JgBahZHAT3mql7Ys/tWKMdaxz5nZo8A8t
         +L1ssKIjhyYgBuZm3ArJmPa217f7sO2MvsTwuiVhtTLVVh/cPvmb5gDhDgrTtKb7IEmh
         yZSUxK3+Q2XeYJVW31c0Jl/hWok0zkAjukQ3W46MwgMku8e0qze69tJsIf/5iKOaaJDq
         jC3mvFsQNnydzz7UPE2u2AZzhpxdpeqZBVcrrDrZ/5kvAhbNjsdOk/fK/mEXINd5uEoR
         whQvqSDnDfhptCyx4xUUtuw6jXL15GVPfjw/CVVk9i0ooPb9kDFMbUhU5xbYXtneGHV/
         q7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087863; x=1703692663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szFuFOaVPRcoa/3KGK9k9VHnKNMXDyjWXMloTHpkWuA=;
        b=e9ymf1doAlzSNKF4tWii3iegIKu997Zu3Y6aO5HQ0jtUrz1lm9cO1n9Hub521edAdn
         6S+zIbC5WVzyyPq8w+NDGBflKqVn2mLdtwYbrOE4i0vKXGX/C4q/fq86SsXPEJ/0O2iz
         atfh+yJlCBTn6iuOJAvkyEGuWxNUZbFYsdZQtPsPgTn+KESxAsPRVzzecmLIrH1WPOYn
         ufuL1Ib+3eu9mz5vWTiRWjtot5kGK15xG2hTxq62P71Gde1iHM8Vf/nbV6HIT4NlanIH
         oqhj4EQQh5fLy8Pmlgz9kVgTVNFDPg9bEIUrPR8i1ZDjsffiN932CXxwgtWn95dsd575
         oBzg==
X-Gm-Message-State: AOJu0YxJIC41NcttQkSCMfe2spPq4daeKVR7UMaGLSPOSS9eY6Iw0oLK
	tPGcawSfHqxWa49cd1djsU1MFl5FhQ1WrnfeUi3udw==
X-Google-Smtp-Source: AGHT+IEMopGLd13u7V/5vIZqrC6QZYkg9U757Xi60NRR7tKxLQz11Pc5U0+SfTyL2OoD9i8imBIJRw==
X-Received: by 2002:a05:6512:1592:b0:50e:4ec1:7d2e with SMTP id bp18-20020a056512159200b0050e4ec17d2emr2327025lfb.2.1703087863205;
        Wed, 20 Dec 2023 07:57:43 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:42 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/6] dt-bindings: riscv: add Zacas ISA extension description
Date: Wed, 20 Dec 2023 16:57:19 +0100
Message-ID: <20231220155723.684081-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for the Zacas ISA extension which was ratified recently.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 3574a0b70be4..27beedb98198 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,12 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: zacas
+          description: |
+            The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
+            is supported as ratified at commit 5059e0ca641c ("update to
+            ratified") of the riscv-zacas.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
-- 
2.43.0

