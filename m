Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514908;
	b=eIzRsPKlzWp5r8WfqJ4JSQmNSy9Mdi+Vlrp6ORIrx8Zu2J0E/uMr0PdQeKqutSYlZqUo
	 ewdm54cThezxKU7jUfz4hrIfM3h2pdUHzHJK0boLAL2N2hoUc8uETPPFk6s+iiWqfaNGr
	 Ik/bh0yM303OIOsDkXLUBUwB3vfP2AzI5IvGZLiWNf0PXwxwRI/weYMHQ7zKVE3H0WHlM
	 a8/Dlq5OCWPyrCo3EHslp690Yuvnh+v0OnOXmki/1glkYZ7o4uCEZv1f369klrdP35sCy
	 0FearMwtgBxq8PwxbXH9uAzbTSvhO4c/e3ANA06WdsBR1NQi0n3Xf9WEyt+gsAeb3OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
	b=3saCAhaIh5bl2uM3UI38Juc6oVtQ6iRCAyiJOeGEcaOQ7Imdw3c/6uLBM4XVT/tgx9BG
	 sE7q05xiH4HfKtGOX8NRnl6TuI+2dPZyx219AZ05kF19eF66e8OkY7uc9jNPCIc2oC7un
	 gr4L2n7S7lcL1sIC6Twhk91dFx/DgrlCSMznX8WRkmSvBSHL+lXtJbcs0I7C3Hq+KFio3
	 SjdjnXLXz5A2PfhbbDkiQgJQO7XWZf7MQDj5ymUZUpJ4VGynl4MDYUK5/IDYM1cCA+rfJ
	 QfzgCYPDJ7BtfYUqC9+hB3TJCBPqVhrhwOxPiviKa9+N/mXLjNcjxLfTYFKLO7cAjPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=FkLbLHGx;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938B060A262B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938B060A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=FkLbLHGx
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-16079d54c17so756058c88.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514907; x=1793119707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=FkLbLHGxUFPGWavUL/q4hkUoNRsK118bbRxFJCNTpuuIttGbtoqfdd6p4cKXl5+zyv
         DF1PrBFXEi6HpZ1+JMXGDUt/nk7fz095xg2d/1rqbWx4NyF3xuUHzNOxyem1vNECh5i7
         8N0VSj3ER+O6IQnnAWjPyKAbmBli/5qVGW4oIQ+5Rzpawk+G7yYPkuo04EnzK+WRWllx
         +e6cQ//1HFFEH5JfR5+nLgUGA65+ta2+GAzocJYFA66heMK1dDdzpSBGt8qYwpVbEqpD
         HYB58beoWISVwlEmZEbHxTdVyhKtdq6FbMsyObjm/VQeFLsK6NorKTRbvJEp83OYmzCY
         KMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514907; x=1793119707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=C0eF+7e3Lo5AHYswdHW6ImmWUev9GzJfBQ9NmVTjO9T5XNJ/x+lxJAm28jUDrFyYRX
         wM5VnvwWEtZp4XRSv73rs+t5G6K+sZNJGRMIkGEV1lB49/JYVt2acjdyD2FdD3dAqyHg
         PAlcgZxkhUQo0oxorkUd73RPbgt0YYDqqJiDGozSrxkHVEO85f3p1fqqgD/Fir1NpKsD
         DP7R94U39BE1a8i6xQB1yFZGsE45LMcWNV30UHWvFRsOH5yVjpBAZg2PY+ng+79vmu1O
         ZkhErKtR7VmiDhsp5FzMWgly0/T4opCpswncadI4z+Som4Rle64Xf+MO5OSYzDsgoXXT
         fImw==
X-Forwarded-Encrypted: i=1; AKwUvBz75pTpXJov1zqBq+vaTyUBwT5kP1BDX7K1SZMOtnAxwdeo2apyGT84/U8WLeQBrOxWHYt8Qosc8TU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpomc8vxPmUQ9y/C0ap7FWdlZeyqNxWOUOdCt4B0H7UY/svlEC
	L4vUjGKTcmvuJ9DHhgffienQsz1i7IP6v9LM7QcVxWGmSmoy95B/UH0+5pLZw0/sdCw=
X-Gm-Gg: AYBFou0GswvmMWBw1k6qFtYP8FikFZfs1juHqj6UrYO281zsaBhZ/aHsdMpXjCl0Qo7
	uSJinT8N/80ffgNivKFuvfxmd0XCi8M72Di5HhV7+0Ul+mEsedKxpye8HurNwN3QN/NhnzVHEKr
	6u0hwrRcTWUjoQi6r/GI0xBMu8qOLpd8oz1thNiBDezPAFxRs3OEKCg/DAhQQJmfEWQz6kMFQMw
	laIDz/+kZ39nWkzRggwQVV3LXL7s/SbSMOD1voiGL61OEI956VdBjBnK31DKmXmB5qlrE3MW2Hy
	KpvcBpHz+AzKg/0IvjicG4s/5xuGgyQKq7d0AcODe8msb6VNT2AbUuWOetpUN5hNSrXVtrA2Dkg
	7egcUj39ZYPTacL+y0VLN7D7yomGyNGT0wQ6TKok2AsYXjSe+6z81HQF0GHZwGAlcERrN9eLJ/0
	os6BnsVTgriyyjHiPOSPXCzJV1NhICe/HfseNDVLyo143x8wdl9wTf2M4N0e4pC6QW
X-Received: by 2002:a05:701b:42c1:10b0:14a:5d07:9b with SMTP id a92af1059eb24-1851310b0e0mr15711482c88.28.1792514906047;
        Tue, 20 Oct 2026 09:48:26 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:24 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:15 +0000
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=1668;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=vv7jc6T42fhaJkWqiEeKPohXQukidcy6joILhcZ0eqE=;
 b=vd9Mh9E0vGBxVgQlbvK8XjOPWj2RIAXhnuQwwJjS/QF1HgV7E52cWY6JCExf5hFUgRXo+D9fz
 gqBuJKTqEPzBceMMK0WoDNiGBDb3oSPIX7d+GG85ii8oILKxpA62pdr
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
get their own compatibles.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 42527c7ee9c8..73bc8c130802 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -466,6 +466,20 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1006-3300 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-3300
+            # TDK FS1006-5000 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-5000
+            # TDK FS1603 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1603
+            # TDK FS1604 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1604
+            # TDK FS1606 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606
+            # TDK FS1606-0600 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-0600
+            # TDK FS1606-2500 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-2500
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.43.0

