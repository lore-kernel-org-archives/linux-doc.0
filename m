Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D6834D3B0
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 22:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795388; cv=none; b=kc4XbJug9Lr6BotBDmdplUoisOB4jjjsVGejuIxvZIHVOWpuwcnq7xKhVdFahruUsrOpK8+MoKO2RHRp++Umy+eudWgCWqh1d/HeWObEWzyHEDZSx008sS+BYgSwRhJlW8TGVORUiAGjCTBoZh8WSgA8PAfxzYXd4cPIQj5wixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795388; c=relaxed/simple;
	bh=+Fd4D4G24Lf6HeULnGUvJTIyL+0ZgRwVDOjp2wWUOEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhaC1oWUyXX/2tSiolZlru/BUzUVXtWVbzraTrMKJKxL/2Dw4DG95shux1mpPECGfITz3cRyo3JDiDlJEX4bsaKwf2aBB8Z1U379H9zAo9WMYmkaUZZQ3giKkB80jPahSJjwohCWL8FgJpvmYnvG5tzvZcnFs0Epf6G29Xqz7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kly7RrAf; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kly7RrAf"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8486ac3f347so365169b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795385; x=1786400185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LM51EciHqg/+cWUGKzq5pQNwGKYXu9VyZMTqMOay7I=;
        b=kly7RrAf2OvRFF9VWX+StFLnWWvJXla3DMbnHjiuM2BH1wKrki+M9DpTc+m2qvFVeZ
         +qr5LH8M0+gDdTFbHeBrtsrO2lOeoKgN9IMbC1op/fiP+gzHf1oQrvDtf1KflkNQ35yV
         DdyOuc3lAYp9wE+eT+++dx1XMK8/rdOA8j70n1h+tzJpoDJ8eTCEHNv8s6lzLXa4sfga
         OI3fll1t9/m29mkrpd+JIHdmIhRz89oL94BhYgZQHNP95V0G878rjV8CRZ1gQM+OEMIa
         UQLoFxBNQJEziNlT77hjdHLW9VBLM2zkuv6OQaX6TY7IIcYPiuALm/T0f9PMuW/AoLy1
         C6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795385; x=1786400185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5LM51EciHqg/+cWUGKzq5pQNwGKYXu9VyZMTqMOay7I=;
        b=VRqTUdX0AiwlA7+dXUDyFtWGv52mHUuyEBi2hr7TSlwixDylE3ycoEqYfDEDVZQEBG
         2Z/7vFlGvHbTTxg2bw7kX1OAQ77+5sHxoE3UKqui1k5cuIznj5LE9p0ZFqCNC1idU2q3
         oLP97EsZvWTLBxvYHGF0K6nF/Zkq2J+F8s6Yp4fRRNZwCFPE+9zcVBilgZgs+RwYvtHc
         yXikb5cCdqe+0ysIFcikfwipDU/7gLwLpF1E6jv1yvySuVupm8P+KsLv54SkYuVaI4nw
         svw65Ze70xJCTLcG38bvPschxgJOntVpUSCgtnLvd+bUzYAyCyD10vVEv71us71amwYj
         xtMw==
X-Forwarded-Encrypted: i=1; AHgh+RqtuMxEu1VbGPO6seeMsEH32g24SA4Lasy1RMN5fBBDOWOoFc5uarud1gwO7ADVlPuKk7cMeh/N7Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs8cSRUveLDOovgorsSO6UPiDm1Nsxx9lBG1UFmnJ97jQ4YuLD
	o8wjxolL5EokUTa06F4nCsS8Ygg3omlZBM4Qac0AYAUmSTxQCIl1r3Hu
X-Gm-Gg: AR+sD11wmy8SQBCiXNw7NkgXkKHvMAf/6wT/75/OC9fxHiBiED4c1TS3NZo+K0Cu1yU
	IdlAFVFuEnMA1x8lq7LbiQWGzUjC4j6T8WDQFXE2JvS2cZgpfOf7IOsQ0W94QVIUP/8PXbiC9kf
	rjz6ZUklmXfHP/oi+xDEhF3JW+T8dIv+PcjJtzQa9ivsuSrAc2jucH+D1sgvyfC+YJk3PaWcpBc
	ruiSXK4G6gnNibUhYFyufD2oEiTUlqQnce5JLHTbBZ22PU6y26QcecnQknjuyF+F1c61GeKjxUN
	VSqvj4x0G923qecN6FsGTC/fU81twJTA2zDh+5uyzAxp7vgOKsZX45KjP3/SbE0GrRqEGErZ904
	ygk/xaNPp0kplBfQH+xUGXicv2SVdCgPDXIY7bF6EC8e9zu30vgZthvxa3bN+tk8jLSoGA2zCGA
	Sv+qUE0tSIOZwejrvX/ujoF/SHQTwE8+QKwBm8q4ZK0JPCoT0DqTp/oNVBq6SWrko7CUllyZSlL
	0UWEzvXx7G/Xe016uQlcryqOhpm6qRMPg/VQ7TukMvszj8eFEJM
X-Received: by 2002:a05:6a20:431f:b0:3c3:750f:3cf9 with SMTP id adf61e73a8af0-3cb6c7b8475mr1065933637.11.1785795385301;
        Mon, 03 Aug 2026 15:16:25 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:24 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 6/6] platform-x86: msi-wmi-platform: Add Gen 4 device
Date: Mon,  3 Aug 2026 15:16:14 -0700
Message-ID: <20260803221614.59324-7-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the MSI Claw 8 EX AI+. This device uses a unique new
shift mode for custom TDP not previously exposed by this driver. To
ensure that "MSI_SHIFT_MODE_USER" can still be set in the future to
CUSTOM platform profile, store the shift mode that applies to custom in
the quirks and check it outside the switch case in _get() since it is no
longer a compile time const.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 38 ++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 8d11dad99776..0b1b64182cc3 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -271,6 +271,17 @@ static struct msi_wmi_platform_quirk quirk_gen3 = {
 	.pl3_min = 10,
 	.pl3_max = 48,
 };
+static struct msi_wmi_platform_quirk quirk_gen4 = {
+	.shift_mode = true,
+	.charge_threshold = true,
+	.dual_fans = true,
+	.restore_curves = true,
+	.custom_shift = MSI_PLATFORM_SHIFT_MANUAL,
+	.pl1_min = 8,
+	.pl1_max = 35,
+	.pl2_min = 9,
+	.pl2_max = 45,
+};
 
 static const struct dmi_system_id msi_quirks[] = {
 	{
@@ -305,6 +316,14 @@ static const struct dmi_system_id msi_quirks[] = {
 		},
 		.driver_data = &quirk_gen3,
 	},
+	{
+		.ident = "MSI Claw 8 EX AI+ CG3EM",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-1T91"),
+		},
+		.driver_data = &quirk_gen4,
+	},
 	{ }
 };
 
@@ -805,10 +824,16 @@ static const struct hwmon_chip_info msi_wmi_platform_chip_info_dual = {
 
 static int msi_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
 {
+	struct msi_wmi_platform_data *data = drvdata;
+
 	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
 	set_bit(PLATFORM_PROFILE_BALANCED, choices);
 	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
 	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+
+	if (data->quirks->custom_shift)
+		set_bit(PLATFORM_PROFILE_CUSTOM, choices);
+
 	return 0;
 }
 
@@ -816,6 +841,7 @@ static int msi_wmi_platform_profile_get(struct device *dev,
 					enum platform_profile_option *profile)
 {
 	struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
+	u8 custom = data->quirks->custom_shift;
 	int ret;
 
 	u8 buffer[32] = { };
@@ -829,6 +855,11 @@ static int msi_wmi_platform_profile_get(struct device *dev,
 	if (buffer[0] != 1)
 		return -EINVAL;
 
+	if (custom && buffer[1] == custom) {
+		*profile = PLATFORM_PROFILE_CUSTOM;
+		return 0;
+	}
+
 	switch (buffer[1]) {
 	case MSI_PLATFORM_SHIFT_SPORT:
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
@@ -842,9 +873,6 @@ static int msi_wmi_platform_profile_get(struct device *dev,
 	case MSI_PLATFORM_SHIFT_ECO:
 		*profile = PLATFORM_PROFILE_LOW_POWER;
 		return 0;
-	case MSI_PLATFORM_SHIFT_USER:
-		*profile = PLATFORM_PROFILE_CUSTOM;
-		return 0;
 	default:
 		return -EINVAL;
 	}
@@ -872,7 +900,9 @@ static int msi_wmi_platform_profile_set(struct device *dev,
 		buffer[1] = MSI_PLATFORM_SHIFT_ECO;
 		break;
 	case PLATFORM_PROFILE_CUSTOM:
-		buffer[1] = MSI_PLATFORM_SHIFT_USER;
+		if (!data->quirks->custom_shift)
+			return -EINVAL;
+		buffer[1] = data->quirks->custom_shift;
 		break;
 	default:
 		return -EINVAL;
-- 
2.55.0

