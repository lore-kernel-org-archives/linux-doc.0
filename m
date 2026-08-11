Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6089433BAA
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 23:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786491601; cv=none; b=kDLQvWk6lkSgc9pm3jGCoUHgAsbYiVT7BpXtOuI+P76ks6vDLYoaK8v5QEaP1aaNOkBfyV/TMXXbKoBYili38YD6qEuMD7R+2urVA+pLr/yyoHllkJfQAoYT/AB7jSTxs3ZH+VjNx7oEWBymw6wTkmjzRk/5P54ZdOtCiJCZ3aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786491601; c=relaxed/simple;
	bh=k2RXB/lBpEZb0Xvy9dDABovXMTpTDSPEDT43rkEWuCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpIGe/9ShclYDGCtFXY66vROIrHU5lQj1vQ3GJvYeeMnyUNYn/awcg9rPQg28v03Jw63h04yw2EFiS55lnCMPNKyQYjjCihYX5aMdx0i3f7up/lXR673V92KnGpd+ztxYNJQDX497708Fw+jIt1PM+wG8JbIRJYQOiXobbmG64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=g2RObF+9; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="g2RObF+9"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c8e2e39easo4810501cf.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 16:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786491598; x=1787096398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIhsby11fc8DrjdIUcLHC64tuvgWtC8uYK9JmHgOEVw=;
        b=g2RObF+9IKZ0uTyzZg6T0hPl3E/ekGz67U0tlcMwmEFHoro0c/CpEFumwDsU+MwqeP
         RMP+EznZJTDOwqFB+gos4RnM6JkeD7NLwMtmNbrlpH4J6vmG8DV2i+jx/GsTwIVTGnCv
         EQUWtWahZWt9Fqb5CxkMnRt/VmCFcK63PdJeFr3Lk+FNJsNsDQ0GDnJ00GOfiD4b++rJ
         sVtC/SLGcgMFvFmTQs/yUs/o/cm7zK7kpvmv9OvFzzKXIPeZQ99uAYi2K2TC2aKdiX4j
         t749GZF+1HSnI45sAU90PsHcy8wFZK5tfnxPT0VtvwU5C+2twhyGFZJxGTSRD1xNcF0E
         +1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786491598; x=1787096398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIhsby11fc8DrjdIUcLHC64tuvgWtC8uYK9JmHgOEVw=;
        b=B9UYPkMXPDExKdkkrHETb/WdrNeJxxrCdEM3Ffa7CDN/bL0bEa1XM69gaHbdLZ+hZc
         Pd0YvVBjigLPlktBLPlPywg1c4xLjWbYvvO8LADhZFwBdVOmC0Z+CtfvFwueeCq5I1fy
         8eUsokENHV6CymwQVCQtR+IYtF4n80jwIZ/97QXfSvUe72Oeneypldu1xEdBhQH8NgkD
         zBQqURhRZPsyVyMhorL6rZWngVGCzCXzpWzHeIkhLTyPhtx6UP1uIYwy8dw0AZ19Iste
         j3qpBMIr9eUSx+EqCDB3SUyyIRhUm1kAwqlRvIP43pdmNjACg5iL+fMovxeJlOPwS9gU
         9smw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4iqBtJmNjmtOTk4WRNPt75BJvusQ+m3aeYLcKaygEWUr0ap67KU8Un6m2DozOYKPfxh9SG/wV7NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRkh+y46jqDczmlJR7skBgKMZFE3FSVRi3ZAdvOiztLeHPi6vc
	4vUqTjYjDYBzTITNXY0UsevgkohcvLHa3APzIvBv1edllz/7Q2VYoutqW/aAPbkEsk0=
X-Gm-Gg: AR+sD1371rgz6fDw1KoZh0GCNy2iP+n1v6IPrMAzm1mzLZ79EL71OJRblZK72aUto3y
	fMMNOYNVB4LJ5ON5Rd5Z7bSYHM/P66fio6pfCJdYR9CGYt+spLbSLwyfVddv+c90m+9Q6T5kaHa
	5p8kf6I1SkVXubOlfMdl/62WLWnnY5MruVMQ6jAKrqAulAtXryGxsHmrGL+3H9KopZW0P11LIkP
	KdzQweKFJF3x9sPXTpVC5GVx+t4NHMmUFFMbJbK2rPSZK2ePKMrnXJUmXFqMaxFVhpC8Vnmdm2N
	mMSpUgK/8QzzYjkgkK5GISuajQUa/7+Vz0u7EDLqL1/lX62OKzHrACwaXjdqeGl2msnJKXqVZtb
	jqdOfWVTcT8Q9DyrFEL5RfIDpkb0w8ryU0g0SPsPt/YvHRjkfnwkNhpDL8zNwW/nQ4S4UwSCzUh
	0AZZxpMT0h+MZ67eU+p50AW798PsnASxVs3ztdHx71eqnAuVCRa9LJWFfqUe6r4kKq/3NJaQC5Z
	F2PQrS9dxg6pQi1AjcwygQF67xl3OjaRnyyH/8C+jkP
X-Received: by 2002:a05:622a:229c:b0:51e:aa39:4fca with SMTP id d75a77b69052e-52d6482ea4amr9766111cf.34.1786491598602;
        Tue, 11 Aug 2026 16:39:58 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c3c1d73sm9607256d6.34.2026.08.11.16.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:39:57 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH v2 3/4] hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition
Date: Tue, 11 Aug 2026 19:39:42 -0400
Message-ID: <20260811233943.319729-4-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811233943.319729-1-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Will Smith <github@notthatwillsmith.com>

The ROG Ryujin III White Edition uses the same report layout as the
other supported Ryujin III variants. Add its USB device ID and list it
in the driver documentation.

The device was tested with the driver on the author's hardware.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10
Signed-off-by: Will Smith <github@notthatwillsmith.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 Documentation/hwmon/asus_rog_ryujin.rst | 1 +
 drivers/hwmon/asus_rog_ryujin.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
index cfdfe3712f19..b0d7ce8dd921 100644
--- a/Documentation/hwmon/asus_rog_ryujin.rst
+++ b/Documentation/hwmon/asus_rog_ryujin.rst
@@ -8,6 +8,7 @@ Supported devices:
 * ASUS ROG RYUJIN II 360
 * ASUS ROG RYUJIN III EXTREME
 * ASUS ROG RYUJIN III EVA EDITION
+* ASUS ROG RYUJIN III WHITE EDITION
 
 Author: Aleksa Savic
 
diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 5bc60c6036de..9b34c6e06bf7 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -19,6 +19,7 @@
 #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
 #define USB_PRODUCT_ID_RYUJIN_III_EXTREME	0x1bcb
 #define USB_PRODUCT_ID_RYUJIN_III_EVA		0x1ade
+#define USB_PRODUCT_ID_RYUJIN_III_WHITE		0x1ada
 
 struct rog_ryujin_device_info {
 	u8 temp_offset;
@@ -587,6 +588,8 @@ static const struct hid_device_id rog_ryujin_table[] = {
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHITE),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ }
 };
 
-- 
2.55.0

