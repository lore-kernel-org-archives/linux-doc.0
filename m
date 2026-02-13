Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D99D191F92
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941721; cv=none; b=mWMwBnhekSMa6O6Mz46nbZZBLS/iykgVGRSNmO0ADT4OFOjpNpZ6mgJt0th/JkOk1aSDdiIKMNaG/SJGSTxY+phv+kENB9eUWoDljnZCb13AsrdZuBycSJ9iKEzT1njkjPhSRLzibDjehfLu8KF2uyetqP7idWunMOX+H+bU46Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941721; c=relaxed/simple;
	bh=fUJ50nNqzEo25SE79AYPaMX7LUUHzTN5oOiZ4xAgcTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OvJI0kMkdQ7Bbgd7SxE5FZoPHyEu18LE3hzcqiRVtTq/KMBoE+viu1nfmTegAZ5g7T7NgLyyxexO8v7JL6glh9/Oz1ulPM/rr6N9j5jQZEmcRhD1iaf/wfc+NqmkwCYVeVX4qgB/s94fegAVmvI/WugFKq2ixODuyKQT5+B6YNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VBu6gF5l; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VBu6gF5l"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-482f2599980so4555255e9.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 16:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770941719; x=1771546519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkC79iRLW3tdZGeGE0h/zKnK7gWxEm2JpK3spSL5h0k=;
        b=VBu6gF5lDHN4wM2GSGIrQK7vnK2gc/Qx7krUJonGeQwGXeZZNKP0POuLpnQORloUtr
         qHlfXQxuCFYelrL40lwXfDfU8HmupjgQD+fhxjvYpsyd4hWFoFtgHodpCnOgC4FEoKWf
         fzhDdH7ibqYQw/7b+U3WiUY7iZI2nsdhegQVHTR3I+0QEKZECwpg/cf8A2ROEDeWUvJa
         T7oXXR92DkusBTuQQR2PTrsBPPXeyTkQqAql350qygPicr8tNgdcED97eHXHUzpXvTef
         GochuteDfIj6HcjB3pt8uLJE0rRNGNyOjPH2M+jwxTYSDpJtwq/HzlE8Ua7gLtWDdTK8
         bXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770941719; x=1771546519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hkC79iRLW3tdZGeGE0h/zKnK7gWxEm2JpK3spSL5h0k=;
        b=vd2030MyaybwDdfDpaCarvaV8kzo1ddcy81oZnTLw0iUlOqaozdFN1w9AZQYtuNvYd
         vPNS4Tc6lIn1DwC9/tv/HWn6MoUc7Uv4GXcPncoO/1o93EdmCsMez2Ksc84/YvGlH4pR
         qFAekEheG1IwjGyC97y6924fJCqaWX3D2snJOpk0c9Flft7kZATExj9nRP6lG451dlY9
         NAVsGZfwjiPxw63itnwSCtOe3PQCP7/8Z4VhgswfvG3QEdcK+heybBGyi+86lS8pXpeO
         KTc4MtCYfjvunfo4WNeets5sILUQPB8jvzFgBEvYn1FoItiqnl5ZiTq6A2oyqx5smhIF
         sfmg==
X-Forwarded-Encrypted: i=1; AJvYcCVmV59FPd0LleHTLpsga6hTSVBfvIjY3CPvgcoRPiQeStM4U7LSrSwr7GaRNKqJjdyjw1uZnITEr3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoWSZ5izEGdGMl0In3tqqxZe0LTqGmwI1sR6tlMqHQ/5OqwegG
	h1ed6ENPc1QYmjGN0ZxNX2sSJp1cra00+XozeK0xpqZsqpA2qRW/CDJMui+1PLthQR4=
X-Gm-Gg: AZuq6aL4r7JHwmeXcmDFXIu4ZyqQeawrlb2crU/YJ8ywn2UeHUsy7O/iL1t1vyPROFO
	Jomipzk9VAzx59I3QnMf6Y3TU5jdYEVDG//pXQX0lC6lBDmMS1ZUXIv26cxJSbE3YE9maa60/fd
	uzc+wvxtsuZCNqK4GfduTdE6wsqKzrt5tBmdZHkKXyu4EFx65tO99RAkDAMHRofjeICenkFrm8G
	hLZ6g0Ku4VVU4nNinUcbdb6Lm8XKnk+MNjVNb8AAuIEZkHp80gk8XSvr63dAKghhZf0EpXbSJpK
	VvH5DbslGEaaRoXSvvWOyBJOOQEG8Bdj3a1xhztZerd/Vcay1Ci+TRygE1oGRQSYMOpHUFN2RAu
	+3yNlXCNv/ozYdNaUYHBhaDfYc/I2GDI4yBL36WhuQxnLe3Jow3QT/q3VktCQ5KnUm9AvPzS1i2
	rfRo9lQ/D9hGKajC8q1PFXT+ag6ovtCIfUqQ0c1PaBKYA3E/izgC+TxhtIENZRWR4BUWCRQaLBJ
	sPOHSo2dA==
X-Received: by 2002:a05:600c:4fd4:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-48370e18853mr16124895e9.5.1770941719083;
        Thu, 12 Feb 2026 16:15:19 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm234440945e9.6.2026.02.12.16.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:15:18 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
Date: Fri, 13 Feb 2026 02:14:07 +0200
Message-Id: <20260213001408.2454567-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213001408.2454567-1-sbogdanov@baylibre.com>
References: <20260213001408.2454567-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..973ee00c2c49 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.34.1

