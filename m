Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753477;
	b=eRuqrkcuuc7W7QtjNnZmTTdds3RgeFQWSYDIOp6SlwBxD+/Zzi/583VMXV2SyeG338+D
	 z7L4Y9PzlKlhIyuloR+xOLtw1E4fKKVwp6hdpBULQ7sq6hW5C49HE2/Tqc4b0Q2pqDJtE
	 P5vYmNYX1+HytWWR3k/K13m6l6JuWscRcIB7PWxGPzQlIoJkyceSHl9SRQMgE30t4DduX
	 43KjvhN1qTVmdIw0Pp3Ga6ubkzrAwdBLEAegAZ3dWQwu4ClfGg4s5RkerIhvrIqP0kBQ+
	 Nk+rwwtAROt5yti3R+wPCLKxAsa+eA4t67BDbifSi0zch0zKGSNdYBiacCl20ivByIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
	b=XV6RsU1VPMmjCM+rQ0biyR/iwkH7P+67UzjxMybToKyWxjAzvLISS6GGqUq+nsj1uBLw
	 ekFXJaKIS7k700guRq34lJHwBaT3OnhazTheUMpsf0PQ2p4uY1mVEGCmjC07c4RKos4b8
	 Rx3w/ia3WfqcbyRCAns2jVd7xrkInOusEy2MTyTcHbCS602wpECMOZbDSlCr+wNiqTpVx
	 jTorg0Hwnm5LGEzvsoe4qK3eCzQNEmq0q0nEtRiBOp9DQuZU6+G4N9vhqPsWLpoRFEAWg
	 Kzo1ItDWs8Ed53Je5pcc1btqYwICUd01BttCsZ0D4ALXURTprABT0f9EGgnGokS3c5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgMM1oCm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E4606A332
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 14:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473E4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgMM1oCm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28187385e9.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 06:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753475; x=1795358275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
        b=wgMM1oCm19H9nkfpQbqXJxER76d+59wyUvMYQQhTVXQpWtQ5/IJums4X9JieCNAkoa
         uS4TvuU6cFBvxMyzTZMkJYuYCml8vOkWVNUNobgQlAhpln0BktuIvlqeM8yjdyEneZAN
         FxmMgwOB28PW+97NS0GJbnJJ2gqsQF+QBmow96yCpnSgNylEfzANlhJusG2LWYZXpjkT
         XC22o4ftVL0r26urVxpoQ3FuDKXFnxY8JmCue7hV9D4bDKR2Mo2iRts2nrQky5a/kt4O
         8VXHZfE2tDqN06BXri9YI62j2zNMQheowcBlAVZF/822McJEXAjbHbQ1ebGPAul3q4So
         1mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753475; x=1795358275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
        b=OQovqV1Wrl//Qn9R2kncwzbD/ZWtQijsN1do1vLEE2GuXV6DDGTiTp7LChHIGH/hNl
         wIwt5D5/1VjeP6+WD3z/qLuA7iS/BgxFp1KLnA+laSV4hDK/4Gwg5bd71orV5latZEbA
         S5wkQCVYMW/FdUDVGLp0WII2H1yKXxU/Av4Pxdx/CsCZuOccJpzVl/BxU7OU6n2mAA0X
         eEHKN09QtsJI/7un5iYKG8gLsQjXJMFS3Nwk5cD/8F0T18vKz6XCs5KWB380vKJi68In
         yv+hbqIq/Wy9zfMmhh7EL8TNrAxd3DrlSorrVuobjkmrRIadDMC7Is+W/0yOVGigrtB0
         0fGQ==
X-Forwarded-Encrypted: i=1; AL+hErGLmRBJpgcpvAvqyaDXHLzW4Y3V5sc/N3BvDVI1UUD5TRjmfbJzt9I0JRUU8gVV0ou3NNCTbMiaWTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vX0l0z3HurHaNtzlG44SAKcitJS/Sy8TpfgJ8BxI4L61A3ca+
	fkJRLif6YET2JO6JNszNgDtxgDUcw9/ZhueR2fp7w3CRgr8bEe8RxVOm
X-Gm-Gg: AYBFou3lKYAIA2dE/NFnqYN0xa9tevEL44M7AdLqAyeshMkTh+84PBHadyW67ESvd03
	5hogvPYenqjWMvAnfkhmfvICMspRUx4q5zlpdi9rEFlnC3TQQ6u1ibq26K5waMScJV/cQDuzw43
	UZ4oB0muTeqEymzqMqbB++ombwq0F+vcJhQZZVW5ourRuldX5Hhys+PAcjBoel0PX14m0sAYXY9
	ILaDhaic5XgeiwZ3BE1m+5TDN293tZvCJrBv+kmPhWTutese5gfWUT4jvJHJW6LNTgJvYm4s7hp
	QVAJRYb1oJDEv2JBz30OT/obbVS9CPj/CN9hNyKCIrOjKLOcbuNfBVTRz9S9qubbjz7y16oP1Hm
	rVc+aBsMJRR2FoDTTMiBiSsGETy5xk11QOwiFDfg5bzJTw6RaKYQk/D/ztSUQEIduAKFGGPRU2X
	9fNxfQ4QJoz1HDhbfgpjb61LEv15uSm3gopsbhzhgpC/PrpTDU85/4/srnQiAH4BILuFKMJMeTs
	DzesesYPb5/2Svwou2C8ozA5rZdQGT9kkE7TNMMlaG+H2AZ0037riQFcJSlEa9q8jaIp8oAfRCH
	UVGkSuJEeNJOT09wC0kiFv/65+jOamzPbHspwsMeQhCUxaDWr0KiMA8BTxuJBS3fVGgU6LUjGxK
	ct9Eti+fAPF7trUE=
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb69b2d82fmr44982955e9.25.1794753475500;
        Sun, 15 Nov 2026 06:37:55 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:54 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E DARK HERO
Date: Sun, 15 Nov 2026 15:25:39 +0100
Message-ID: <20261115143708.492883-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115143708.492883-1-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ROG CROSSHAIR X870E DARK HERO board, which provides the same sensors
as the non-DARK version.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index b22bd5c8f491..b3a061bd10db 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -28,6 +28,7 @@ Supported boards:
  * ROG CROSSHAIR X670E EXTREME
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
+ * ROG CROSSHAIR X870E DARK HERO
  * ROG CROSSHAIR X870E HERO
  * ROG MAXIMUS X HERO
  * ROG MAXIMUS XI HERO
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 6c4565b0ce2f..d86f3614d557 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -991,6 +991,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_crosshair_x670e_gene),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E HERO",
 					&board_info_crosshair_x670e_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E DARK HERO",
+					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E HERO",
 					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO",
-- 
2.56.1

