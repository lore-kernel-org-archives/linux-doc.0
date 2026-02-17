Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422B2D8798
	for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315934; cv=none; b=rdC3NFSgn4GUhU4+uFi9SsZuD/KXzk+EH5hQg9pWrRL4TIZwnitGCpWioVb6NV6Za2R5Sbus66olIabP1X1Wfzd3szzR84ocQHAzeIsL/3yjOpUZolpfvy72guFPQX6tfGA8qS9ExTa/F2sRLGCiZvOHUHUA8apxO0qvehWyx+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315934; c=relaxed/simple;
	bh=fUJ50nNqzEo25SE79AYPaMX7LUUHzTN5oOiZ4xAgcTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OfQMdd0URDLCWzOiSiPfRpgQPsK96s4jU+ZRkK2C5omLdfHHrzYVFkMEGT13wNYP5oCEJ6rYBe5L17NeJQqBdUgDV+mHeoyQMx/77JMp2u+FJ4vmG2DFyjh8MZ0t09dt1sKuh8bhSLZcHiW8por88REN5Jluvg49DlqoRc0E+LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kCqAREtM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kCqAREtM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48371119eacso36419665e9.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 00:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771315932; x=1771920732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkC79iRLW3tdZGeGE0h/zKnK7gWxEm2JpK3spSL5h0k=;
        b=kCqAREtMYHy/35mt+VLAhNORUCi8CPSW3SH4WBjof5HePcmaMBLzji9Tr1EkIwjUNu
         8Lv47IxLWN817CnjY8hqtMeghkq85/5a4uif+Y4hTncxdEaOECWqkS+SjUXbB2T6yk3m
         1Cfmtq8XneIU0HN53bse1WMPhU0Q0JhwT0fZXpOj7MWs4v+J8PUK8uO/H6Wj69uOoqJp
         lbEiGMyKusehWy6Hbcrb4HSCG3oihzqMFA/YKnF9kCOtaeJOkMvsIERVn+/qaaoOpUAu
         09b/rhhuix4K7C0y5fkj7kIxnOArw945uksXk14EK5JnHQHG2whPquCe1w7OaprR37Or
         KQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315932; x=1771920732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hkC79iRLW3tdZGeGE0h/zKnK7gWxEm2JpK3spSL5h0k=;
        b=uaJM78HKsI/gJH32WgtB6jkTBgE6ni3A36Cs+OX6P/fD+PX+gBIEgmtNAdXrKaJoJm
         ewlCBlQg0cBXaADkRj5EA4MttwjCrJo8e8yFV/evusKaRvrwYYtujJI7TbMSvx7XZOQQ
         MTd94rvGBGhnDqpcjPrSWhQI0/vhVXc1oK5rwlmTaE+KBiV43cyWACkYdj9gQumXdzu0
         mMcoE7PPusNIO80Ujas13261NRagYp/NJg3KG4h568599cLmgZx6+HzyAw6LNw3PQ5wH
         aEtlW3mUyvLTkIJmWrxAjCn10n1zzj2Hb/am1BgLWC231W0VAyyLWf13MEm/RS48O4k5
         Ol2w==
X-Forwarded-Encrypted: i=1; AJvYcCU0E6lCvmCAxQUv6FuM4AXfCPJDSa8G6tbe5r3vUPt+eyrH8uLD2TLzOhvmPQ+J7kqP6wWqNxtBBTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEk9mspGN6hFWv14Q7U0rLbhimeo+DnK6UXawIDq/7x8gFkyAH
	ooGBEXuuvdJWfGnNQKMHDy4mFIIb+dEico//0Vw84HTkeeScTRXLkeLRkQ/XBLJtdRk=
X-Gm-Gg: AZuq6aIl1yJmyjqb5j48xwrYl04arraPnAJdJc5jP3ts5CdIzDqQG+cG5XUqzTxccDG
	AgEG0gWMRRFQvjgOC46z8S5nwBoI1X1NI4g2GZi2FENtRYzo1//vc2Gummswc8IDD1wWJ3Ts+cY
	YdbPTN9cazyYfwVfMlCE6qwHTg1EsOqQg1BLe6l1NdcECfC9Oi2aQtkuebI0hf9gLMS1o/CDw2y
	bm3WoXjoo2KWQFqHnLJq7+g4TBH3WaaxQkz0W77GtHcOjN/bqQnddZGutIqBCJe3T3GQmd/W7yP
	Owkya21LdNBL1d/PGADsiUv4Rw1CAk0dcKCubPZrg3WmpXFMXKOjJTgJkvFNXAgO0mCSv6plXS/
	g1v5npb/seGf4S3mzZVBmZTvWp5yxTlME1O4xCLoIsVKqe8I1GU8lrjDbgCMhRX9ZJXnICTVDPR
	MA4XF4KqEdSvrvS8xqb2nT/fuNlgrKCv+KHPcQjzDXpVfY11/BJkR7UVgnRLzBYlC11d9Oeq2p2
	FPjfNAvag==
X-Received: by 2002:a05:600c:1f8d:b0:47e:e87b:af8 with SMTP id 5b1f17b1804b1-48373a5ba01mr233760545e9.21.1771315931619;
        Tue, 17 Feb 2026 00:12:11 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm35757690f8f.5.2026.02.17.00.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:12:11 -0800 (PST)
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
Subject: [PATCH v3 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
Date: Tue, 17 Feb 2026 10:12:02 +0200
Message-Id: <20260217081203.1792025-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217081203.1792025-1-sbogdanov@baylibre.com>
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
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

