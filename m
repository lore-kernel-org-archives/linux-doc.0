Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15CB3D6493
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629673; cv=none; b=qbkp+IM2gAZOnnFR3aGnF3mwSsTGDzk7pTive4t96PDK0W1kICXBquea6RYEDvODrT9qzGlfeboN6i4FYWzLszQs8FnggKLgyINc+l9pgkOtXPBhp2FcUtcrGWDcqPDdUM7SOcJeWtQLKi75s4pT5am23Dt45NHARFzxAG+u9Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629673; c=relaxed/simple;
	bh=m+G+JuVTGfgM5TT9FSekcHZI3EJdPTwx++YovSUhQno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pu7c+kvbqlPv/pc/VQWLaQz76/JynlEm4T2NbjtX4YKlm6a8C5PnRix8IAV9pDm2FwTetAuSFwavwxHrPEsrFJ1jV59w4xzbp9oTK2RX40rJ3xReg+IGKFmSNPRqARqNfVvHD5YXDyL+S5oAn5vOwlPgOp9i8BoUe/Mjt/vjATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fthf5aXd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fthf5aXd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b1710405so941885e9.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 13:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783629670; x=1784234470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6V4Vm1s8ZF3aI+yNeXFElkc91wk6n/W+vZRyVog1qQ=;
        b=fthf5aXdsYEMJ6u+Lu+HCA/zDWG33EN518O3Jquqj9YtgiJyktM2mHjaK2XT+Og53+
         DpL+bRrDvPuVYs5Z/+9LIP+y6IE9H6RF1U9EDwK218C2eUZMRi3iGmfFjSPi/kKsMVFQ
         JM4SZOVZUNrXyY5ot/lVG9OY9ztl18nZtCaaejdojrAvfQ9ooWQsb+po4HbQLC+pffoh
         jruqFxvhVyN5gP7xmZpaJ7sa1ky+QIwXOjmi8wqNyQsa07zubS1WLTNh5HCPhBFM42cO
         j8ffCiRCtksLiA4rT5jTHRn3gGM99Gw7ARkrdc0qShhgO3PZ+Y4GDX2vHbbK+PAnQpz6
         oKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629670; x=1784234470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6V4Vm1s8ZF3aI+yNeXFElkc91wk6n/W+vZRyVog1qQ=;
        b=Pn7aT+4mW8Odh1dOBkqPu8uKgR+cnV24Z3xkdFp/UEj7Ff9lU7xuMbSIqaGA5+qHGA
         xT4QKr2poCO2BK7w/W5RzxpVumWvm/4zBX3Ld3I14q0MGCbcLnh/6jlPqPuqYVO4WY1o
         jeRAWuFQpQwECLe8t9AqTE2fz+9FnMs+WpXInXH51CvuKtFy9qIIrSSJVILqWUPDdCgI
         WtXSaBYVYpiPXP1pvbFXilKFYLkV5M3fJmwgUuCFR0wJU522Wlk2MaPCww5agkwRBfNF
         Fd15NkIdWppMABdHUkL+ge6xYDD4wbilykXyqtAeRfE/wUMuO14yPk8kFzr+ZfZU/JMP
         v2kg==
X-Forwarded-Encrypted: i=1; AHgh+RrLJGD8LKYPObXmkN5RMe3BIuvvEzb3uiKafzfhF5LvEY9Hx/0x43l37ByPyNpXp8+YKPsHEEDQ9L8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjS2uUOOglZmISrMruBlxHCxtf0umgCYupn0ivCcfc9oD1VoRQ
	zkBo1ZeEQ4Az+b3BKowow+tSr/XquUL+2JREHiJa45jpJ9Jo6au/MfWuDzTAJ1S6
X-Gm-Gg: AfdE7ckMUBW+vaqZwDSCk10WLYh42bV4T8ReesLwu1fnBvGQoDEGoBhVVFfg5jKcc1h
	k1VhfwsoSdx+EMUHQenQ7crtba/Q1e5kGk6valURBEpO32XmI81V3YoGLw18lnzOmSKI3kdlqTz
	7GuZ3aQnkkC3nkwhdo2XnEpmuwXT3VwofBR0kjpiK+J4sLujUt9sptmSa6yFOFmVsk3pk9B8x1W
	i/lROYe8TtAFQiYUvRzERZmKQMl4daO5CMVaDpBPsbvxUa73yTAh3G0OJ/cB1YQ2rJIPUnqW7m7
	3X7emrs/jHftw4HR/T55DR14qhpNW16nBdVx2cePFshfQJGgFhl4iWNh+FpHgUqSQkHNur7XLEa
	wLXCDDx+TBtvVry1m+k0faJ2UIoD67H6nzvzvlsebpeU3PBwBfpI1QkCwVh78FKaqjNGldBonAH
	Ar3H15Vvg75UXp3lmNox3cu+7ScErwR5s=
X-Received: by 2002:a05:600c:3acb:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-493e687d05fmr79588805e9.36.1783629670078;
        Thu, 09 Jul 2026 13:41:10 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm87100785e9.1.2026.07.09.13.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:41:09 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI7 R2
Date: Thu,  9 Jul 2026 22:38:35 +0200
Message-ID: <20260709204037.1998433-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vishaal Saraiya <vishaal.saraiya@gmail.com>

The board sensors is a copy of ROG STRIX X870E-E GAMING WIFI7, thus we
simply reuse its board_info struct.

Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 77a709517437..e288f8ed6602 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -47,6 +47,7 @@ Supported boards:
  * ROG STRIX X870-F GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
  * ROG STRIX X870E-E GAMING WIFI
+ * ROG STRIX X870E-E GAMING WIFI7 R2
  * ROG STRIX X870E-H GAMING WIFI7
  * ROG STRIX Z390-F GAMING
  * ROG STRIX Z490-F GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 742520c485ca..473157b5f739 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -927,6 +927,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x870_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-E GAMING WIFI",
 					&board_info_strix_x870e_e_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-E GAMING WIFI7 R2",
+					&board_info_strix_x870e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-H GAMING WIFI7",
 					&board_info_strix_x870e_h_gaming_wifi7),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
-- 
2.55.0

