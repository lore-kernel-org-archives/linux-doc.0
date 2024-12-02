Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DDB1FCF68
	for <linux-doc@vger.kernel.org>; Mon,  2 Dec 2024 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135304; cv=none; b=MznIbd0xvjEsQ7d2b9Vg7bJdzNeaI77d+WR6YtTasLHSQq0Rt0M0YXLBa2qTwr8rJtIZzAwppdvQKu/dKOVWhtfcxtNJk0VoUrBoMuRJavoqGkhRfsPr3nb/Dj9nAUjQKfj59Rao8zpjuFUp34BDdlnlkvMeyeVMmQTQFsM4KjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135304; c=relaxed/simple;
	bh=3DyzDba3kopqeRQ1K/a+gHesiQRfQ1yKAi7khNpqLwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASZ1GI3ZWeea9PUWRNvFtcqmpTWE3BcQY4uQpoONlTfXkxZ3y5ayY6TJfB4lFYO/7fQ/xK48W1FWEKx+yzC11dY1aU33RnlEkra6l3wW4E4EOYQv4hTX99wK66e5fy7qtpnWPq0PEaRc/21srcoksrnFywaTyo5eA5IE6euVACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jVHLEH5p; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jVHLEH5p"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434aafd68e9so34122845e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2024 02:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733135300; x=1733740100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO7Tr0oqyOuX/5RGvAdaU0JDvqHNjvQ/glrffhR8miI=;
        b=jVHLEH5p6V7WUaB7EjCJHuKQyYDIusIRil5HblPk6oEjK/stYq1C0zlCZd3rDyuwIz
         RQf5jiuLwk2Id1Sf2rNKf92d4vh2ROhl+2FgpNE7mRDPi6XfpvHTYqyEVleyTy+WTo3q
         /R4/k0LxhWHoDs6op9cJCMJcsHzhp4p/xGGqOiLhfBs3t4TrONL7hbkT0GfaIsAWL24w
         vSPUFlEx/heqoKP0y/I3j/8+MC69ykHpbKGzaTUUMSglzn9VzeVs/JKp8BYMwlX8IT9X
         AzgW8u/RbkRfwukKzHzd1yhcbx0G3ifU/vnQNisfZX9tSnDRKZ5tXAGJXZXUrJMuQGmN
         zIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733135300; x=1733740100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO7Tr0oqyOuX/5RGvAdaU0JDvqHNjvQ/glrffhR8miI=;
        b=U9PitUhj1Hl2efKguqMPHXcP+Qw6h/Ee7YVoyxc1HEaQFEQrTR0hpk2RBBIy+OoRXZ
         3r2QyIdbweE301AGPJtx5L2XHwt6R6fZGgmmSjsRuZldZsaWE24L+Od5onaPirZXACZI
         qxJV6Etpu6h+oMbOb0PrVI21x8M0Zw4MdsVUx+SmkexRV0rI84tWy0In+7gG3r/SOZFq
         YguPhPPNXYhvWC+Mkr2o/xP1k31jpHz6q0LaikF0VuBoe6hCX5+qDA4LvN1OOdZMEZe9
         wpjhxL3fpodG57/bX+p4eEovhBztfylHgrEtP2Y2L04gpxsQStVU7anwRUlecUERznN6
         xIbg==
X-Forwarded-Encrypted: i=1; AJvYcCVJO+/2fhRF7vhS0kJsDmh+qpM1NKi7YpUkKlgNKMf3P2elLIV59C9RLBV+A3jwSkholZhc4BtHbQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym8TL9sGd3YJJdUqg3BKcU6iHpfjUnLGCScPCJsrot+XGy5kpt
	IHYHQ/0Tp6UAYa/ZrQ6LYQufv2lZbSwSuUMxhTmVG2cXNd4U9uaOIeypyTZU+PM=
X-Gm-Gg: ASbGncu5yShEKoQGW2Y1THi1oFCiEI5Ke3EI2kx5Ds/1xMQpJthTIhp4sVS1dLC76NC
	oHFdZk1yK8T48cEu5oHr9o58heGLX0zguMf6mqzlqGCABufx4nYLtsAn+Ww2JZlGJFempMKDvUe
	4eaQQIDK8XKH0WhJeMIMjA8374FscG4rSzESoKI6kd9Tqhp6e5Yq2Qk8cj5gmsBx8T1zb+iGoW9
	ZWFHB8yBMPtEL1tT7Q13jgUOLLalJrCIygdap3kzKvAzWw9P6IFMc3Sttum6A==
X-Google-Smtp-Source: AGHT+IG6uItkG+/EyIz2ExIrsRZ9Ufr1FGwtNB+JiBOzK+GKrORAmjno5MykzH+8443W3ZtyQ+9/AA==
X-Received: by 2002:a05:600c:6d46:b0:434:a5d1:9917 with SMTP id 5b1f17b1804b1-434a9de4533mr163840155e9.21.1733135300296;
        Mon, 02 Dec 2024 02:28:20 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2380:13:b62c:611c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-385e940fef3sm5757614f8f.42.2024.12.02.02.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:28:19 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 02 Dec 2024 11:28:01 +0100
Subject: [PATCH v4 2/3] hwmon: (pmbus/core) add wp module param
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-tps25990-v4-2-bb50a99e0a03@baylibre.com>
References: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
In-Reply-To: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3DyzDba3kopqeRQ1K/a+gHesiQRfQ1yKAi7khNpqLwo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnTYu/ZSGEokuc+lm2iUhKSc/nTRxEiPA5pmuTK
 XJB9trbV82JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ02LvwAKCRDm/A8cN/La
 hcJ+D/4gKJaHaEL5SU02alG9ZM0bq4XITk2so6lmkr2BWKpLFFjTiX20K0d/wHoAe5i1cP1i744
 aspxWxk75Cs1bksGR0i6drgjhPXDkejehL+VGRZx/f1uE9iXsqrI8h6Co4H8mXpLhzOo39K7469
 5E2R+7GRq70aFtr+ly+5/uzXRU8MLxTOywm2tz3VbHoW7kbsNQpE+2HS79IVHSX65L/cwQPMRoy
 5gcQ0lUwffCgQLHfsRWfamx05GCWbkCDguj/KS1naqeEJJxMlQt+c5dm8LR6gejYwtpsJtat/79
 2F7Dwhh5rj4GB4d1/SmU0DqmJ+ydn1viz4V2I3UvlFZ/lcV+pJgKyu+O5nNkh8ZbalFORPfPE8v
 Lkuv2YRkCXKTiIElLw5MUBkMtFifQ3xbbQqdLWxEPdINeGgrgn42VDB571QaE7Z50jbWT1v2aYC
 tE4SuFUyFHPxb2TlOF0Hk7E77bGMUy9+deoATKlPJtp43hIVVhV3Z9HX7ASwYhW634mPZVxR6cM
 hBwjG40YrytDCl1QK/URpzy8wBeQnQpdeRsCpr0e6zq0+YdsZ4WoDuL+bHJ+elt+BOWESWHpIQ9
 /bE0esTdVcCD3cF+Fld9CTCB4BILVGv+7gXEIHaenxAoUIEd6Bm9L0SUJPJTWKhBfDVF6tPOWsl
 jxEGjohgC3UI6+w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a module parameter to force the write protection mode of pmbus chips.

4 protections modes are provided to start with:
* 0: Remove the write protection
* 1: Disable all writes except to the WRITE_PROTECT, OPERATION,
     PAGE, ON_OFF_CONFIG and VOUT_COMMAND commands
* 2: Disable all writes except to the WRITE_PROTECT, OPERATION and
     PAGE commands
* 3: Disable all writes except to the WRITE_PROTECT command

Of course, if the parameter is not provided, the default write protection
status of the pmbus chips is left untouched.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/hwmon/pmbus-core.rst | 21 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c   | 29 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/Documentation/hwmon/pmbus-core.rst b/Documentation/hwmon/pmbus-core.rst
index 0a251960f8910ffb121d82b45e729d06f98424ef..fdfb237731486ce9977b337586333d28f7419d1d 100644
--- a/Documentation/hwmon/pmbus-core.rst
+++ b/Documentation/hwmon/pmbus-core.rst
@@ -387,3 +387,24 @@ PMBUS_VOUT_PROTECTED
 
 Set if the chip VOUT_COMMAND command is protected and protection is not
 determined by the standard WRITE_PROTECT command.
+
+Module parameter
+----------------
+
+pmbus_core.wp: PMBus write protect forced mode
+
+PMBus may come up with a variety of write protection configuration.
+'pmbus_core.wp' may be used if a particular write protection is necessary.
+The ability to actually alter the protection may also depend on the chip
+so the actual runtime write protection configuration may differ from
+the requested one. pmbus_core currently support the following value:
+
+* 0: write protection removed.
+* 1: Disable all writes except to the WRITE_PROTECT, OPERATION,
+  PAGE, ON_OFF_CONFIG and VOUT_COMMAND commands.
+* 2: Disable all writes except to the WRITE_PROTECT, OPERATION and
+  PAGE commands.
+* 3: Disable all writes except to the WRITE_PROTECT command. Note that
+  protection should include the PAGE register. This may be problematic
+  for multi-page chips, if the chips strictly follows the PMBus
+  specification, preventing the chip from changing the active page.
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 94252e420ad79fd3e932c0f1df9e1c9a5d8a13d0..f6753004e40af3c258a2d85e3aea3e412ae4029e 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -31,6 +31,9 @@
 #define PMBUS_ATTR_ALLOC_SIZE	32
 #define PMBUS_NAME_SIZE		24
 
+static int wp = -1;
+module_param(wp, int, 0444);
+
 struct pmbus_sensor {
 	struct pmbus_sensor *next;
 	char name[PMBUS_NAME_SIZE];	/* sysfs sensor name */
@@ -2669,6 +2672,32 @@ static void pmbus_init_wp(struct i2c_client *client, struct pmbus_data *data)
 {
 	int ret;
 
+	switch (wp) {
+	case 0:
+		_pmbus_write_byte_data(client, -1,
+				       PMBUS_WRITE_PROTECT, 0);
+		break;
+
+	case 1:
+		_pmbus_write_byte_data(client, -1,
+				       PMBUS_WRITE_PROTECT, PB_WP_VOUT);
+		break;
+
+	case 2:
+		_pmbus_write_byte_data(client, -1,
+				       PMBUS_WRITE_PROTECT, PB_WP_OP);
+		break;
+
+	case 3:
+		_pmbus_write_byte_data(client, -1,
+				       PMBUS_WRITE_PROTECT, PB_WP_ALL);
+		break;
+
+	default:
+		/* Ignore the other values */
+		break;
+	}
+
 	ret = _pmbus_read_byte_data(client, -1, PMBUS_WRITE_PROTECT);
 	if (ret < 0)
 		return;

-- 
2.45.2

