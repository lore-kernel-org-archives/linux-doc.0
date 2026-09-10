Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAA93537E5
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 03:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011148; cv=none; b=EzJAK8fZ3oGYOPzCyS2k3sr30+ug3krgar3cEsMVHQBNb02B3f3DU5/9BU1/07Sd4BJOYe5bKE612ofhmSQdWeo5qDFBrBqYqNTItRIQG8bU98Atf2ZUcs3tDQ72o9tJVXTQ1EDt+GM/lhKgn0WYaKVZKVn/dMuZmvrf3jW8JU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011148; c=relaxed/simple;
	bh=D4HunRvKzwgbz3wH3A5yR4Me0etry0KENkQiN7rdUVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LtWEzYzfl7zevukcrcm18SlljQKuTwMNL/6n+VtvNO926sb5eumVwrHVb1ojbD2evho+zBpcvd5tEUKso8Ur6iZ7+QVX+6RO4//iKEXgoucTGPJVPFAwJI8FkPoESK6ifOcgEuTyelbcQuFAboA89UYqH2vUBt7HZzXaSaD5Oco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbOInQW+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbOInQW+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so40952125e9.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 20:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011145; x=1789615945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJRPReMfqlNULQmo1hdhh0WFJsW8FZ4M2mPbCe/HToI=;
        b=fbOInQW+UDgoKHz12Y1wQZPviQs5v37yubpHd+FmrWQ4XNfofN6rGfDsAQfZ1Ote4V
         t+zF5vx8Dr1ZQzJ6TE3WPWWf5U9l16+5cMfhFhzGQDByOLSYY/Fbx0uvjwW1VnsUGMqf
         7jG/EbDKIyD0B1F1GxayKIvdEup3yHWEx7zPDPc9zaVbHwXR6dBPSCvj/1KP2ti6g6hq
         IejpC+3p0HoD3wSwU9qOKwOgA2Grb8+A3YXYjayL+kaq4E0MGi+TZOla1+II2CNJO+XU
         hmm/OkH56vI+TRpN5YLnUPObctRQF4l3ptfd2ZuAcinKLa8rpVIHRWjPAw8OKRBhchj4
         7A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011145; x=1789615945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJRPReMfqlNULQmo1hdhh0WFJsW8FZ4M2mPbCe/HToI=;
        b=blKQ+00iO/ar46NdKObiigb14e5e4ipX7g1MdRpE4lgM8mr5Sbs4+mTz6wvSmv03Pn
         tQf/cqFIzAS9LngN2AXoQVaeXsZX+3YVRbkfKAF8RoKS1dvBfo404VRdVcbtpWsfoGQH
         8qhASRYQOzVezUhtaW4GN632pMQN32AoTyCQMrJq2DmPzj4nVCjptCzIT8AcQvaZjSru
         g+dL62Pl0B1DeUoD6c/7MxRDaXEBSKQpBLXdwVltpkQwrBTNFYry/Jda5IWOmtjpGp96
         4S/sDqlZlncG+EHfzM+kFAl0jUJmjw6ktTvd5F2RpAXHTanKv9t5BoEAxs65VLNg2jBm
         Tw2w==
X-Forwarded-Encrypted: i=1; AKwUvByjJYmlKnzbkHlEvxSuIvjlw4DvnJsGsJciI/qgaaQs3LtZZ0s4bEk3VYQcUNiZaPZqAcitLisTO0U=@vger.kernel.org
X-Gm-Message-State: AFuF++kX1bFWkHJwvhUvSoQnyPZ2jNO3b0qWP6MNY/91yXCN6EENDIkB
	1VRIC+leCtZjfKErRFTTsvBE7cXuy1LzgRdIHUfVdmtKBBcDqz/Eg5S/
X-Gm-Gg: AYBFou0ZME4WqVjiI0xhZWWuYwg9+i0fZssWwfKVt31zgT3UCrmpZcXD7tZ7vDWUlW7
	fOUYdXXYOn4xk5pjJUlFOdxpL6cOatWhTD9z79Amj1Jywnlc6Og8i7kos+TM+d/+q8TUzNpzDFf
	tEFWZe6ZqvBxt7ES9kgkvj6x02NdaskVWX3cDybaCDwthwIKUF7ZYsSBv4YAElySZRWTCabUMpl
	S3wqrbhoIX8fbse4D5RXPajA1Z3De2NW9yWW8IKKnbNvnT/Yp3KXm8GdTtLcTWiuJWnvLwWUZR4
	TN1S0ykIGx15FblMeiD1ewGYrZ+JDSvg0gvE3DttFGOSmOlVQHw2QwTl6KMr8FPcslbyscxZRb+
	+3Qe87/Nx1OQeRUYjIh1lxkAsluD7+sx4nQgAG/+3+Hy6TXbtfnt2kfBL5nHJgyUY6op0qPnFdn
	wJq7iRmeludpmttsUWFkClxbk/H9VJP1wEO05eetQ3eCJ/PaFeZ8hWYBMhBgf7pHICg0ugk2j+p
	eOISFBj7nJFq9sNjeGymy+8uyjU4MWvwnndgYTwcamvkCZi7ao3lYuBZTijuwZQ/vAKpyxNe4FA
	jxKF1Q5upc3QS4LTP05Eurtgl2jBFpKHI7M1Qoi1/O6t9yVFpCOV4IzDQ9hKKEcLJzgPuR9vSKM
	FLq+BJUT67A==
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49cffde8d95mr350363235e9.23.1789011144508;
        Wed, 09 Sep 2026 20:32:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c494basm34734585e9.12.2026.09.09.20.32.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:32:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] spi: docs: Use the multi-lane mode constants in examples
Date: Thu, 10 Sep 2026 05:32:19 +0200
Message-Id: <20260910033219.15996-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The multi-lane documentation names SPI_MULTI_BUS_MODE_* constants,
including in the transfer initializers. The interface introduced with
the document uses SPI_MULTI_LANE_MODE_*, so the examples refer to
undefined macros.

Use the interface's constants in the descriptions and examples.

Fixes: 05c3bd745bb0 ("spi: Documentation: add page on multi-lane support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/spi/multiple-data-lanes.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/spi/multiple-data-lanes.rst b/Documentation/spi/multiple-data-lanes.rst
index 69cb532d052f..802aece35d56 100644
--- a/Documentation/spi/multiple-data-lanes.rst
+++ b/Documentation/spi/multiple-data-lanes.rst
@@ -127,7 +127,7 @@ field to indicate which mode they want to use for a given transfer.
 
 The possible values for this field have the following semantics:
 
-- :c:macro:`SPI_MULTI_BUS_MODE_SINGLE`: Only use the first lane. Other lanes are
+- :c:macro:`SPI_MULTI_LANE_MODE_SINGLE`: Only use the first lane. Other lanes are
     ignored. This means that it is operating just like a conventional SPI
     peripheral. This is the default, so it does not need to be explicitly set.
 
@@ -149,7 +149,7 @@ The possible values for this field have the following semantics:
         ----------   ----------------   ----------
             SDO 0    0-0-0-1-0-0-0-1    SDI 0
 
-- :c:macro:`SPI_MULTI_BUS_MODE_MIRROR`: Send a single data word over all of the
+- :c:macro:`SPI_MULTI_LANE_MODE_MIRROR`: Send a single data word over all of the
     lanes at the same time. This only makes sense for writes and not
     for reads.
 
@@ -160,7 +160,7 @@ The possible values for this field have the following semantics:
         struct spi_transfer xfer = {
             .tx_buf = tx_buf,
             .len = 1,
-            .multi_lane_mode = SPI_MULTI_BUS_MODE_MIRROR,
+            .multi_lane_mode = SPI_MULTI_LANE_MODE_MIRROR,
         };
 
         spi_sync_transfer(spi, &xfer, 1);
@@ -172,7 +172,7 @@ The possible values for this field have the following semantics:
             SDO 0    0-0-0-1-0-0-0-1    SDI 0
             SDO 1    0-0-0-1-0-0-0-1    SDI 1
 
-- :c:macro:`SPI_MULTI_BUS_MODE_STRIPE`: Send or receive two different data words
+- :c:macro:`SPI_MULTI_LANE_MODE_STRIPE`: Send or receive two different data words
     at the same time, one on each lane. This means that the buffer needs to be
     sized to hold data for all lanes. Data is interleaved in the buffer, with
     the first word corresponding to lane 0, the second to lane 1, and so on.
@@ -185,7 +185,7 @@ The possible values for this field have the following semantics:
         struct spi_transfer xfer = {
             .rx_buf = rx_buf,
             .len = 2,
-            .multi_lane_mode = SPI_MULTI_BUS_MODE_STRIPE,
+            .multi_lane_mode = SPI_MULTI_LANE_MODE_STRIPE,
         };
 
         spi_sync_transfer(spi, &xfer, 1);

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)

