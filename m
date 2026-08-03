Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25A349B19
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 22:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795386; cv=none; b=CBStwNcwibVCVkDOXLJZQbRSIpoOFPk12YEAqow2iaQOsNYddHn0I2DZqSmB0xFE4c3iM2E+5TCYyRo1kvYwGILfBHBtsIAP+2NX+ZlmIfrIvOEpG9F834QT/Sc552aGhKscqL/Qsa9g0NdyOEGOHxOPBZix5XM6u/2TiDjfCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795386; c=relaxed/simple;
	bh=ODSEOHVW4KYU9xP2cIISQVh2g4cADrCkR6ETTeHmPoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtPr3M6ax1fnm8kbT3ZWaOeCjy7JVOXIwYAyJQmF3IGi47E0lvlRgS1DYfSyUDOcI1+c4nl69FmBztDWQj++W5/wWt7k/d+XfwTpLO4NfnjXET4S/6xKji5eZwHkG/mw1jSNozEpqfr1Lpom4FUU41QH+N8PYvFLVGjnKUThHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8bXM6do; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8bXM6do"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf50c6f235so44030275ad.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 15:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795384; x=1786400184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtKu0FT85uYm4ILu5Mq1OuaF/iNH/TftNn4lcGyvoLs=;
        b=d8bXM6doaHydHzm6dzFOTn3SCRvyLcTVDpPyP7wmAcp6XXXCw/36DwNmzblGsPzaES
         Eh+WCh9n4xGq6/afaevwQOqTX64K5FmseuGSgMkprXgJ3CTC0LBAxh2s2m83ksTnUIvw
         T5FMqPBb/76hIPjmC8/c30ri1kuGX/f8eb8Yy/tFlPfZSiprQNVZN5zLRz66ZBaxVpZQ
         Z3bmLyGO3hzUypiRpiVHqYGRAp8+YkwFx3RAMxRTvtDEHX5QQbxlcWCA92L1MHYkZLVB
         S/KEZzhqncWHVKzUa/qRPxQkxGSW2KFwbl+fv41gUsYWFEgp3O+wcYo8n301rE4dQjij
         aeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795384; x=1786400184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtKu0FT85uYm4ILu5Mq1OuaF/iNH/TftNn4lcGyvoLs=;
        b=fDVKDuBlPJbRjfMrkEjni9JRkKbFAGrFO0qeJpexdFIpROdd97aI4c4lKKV897S/Wj
         IFwYx6LgvsWGAiFU29DO1ZimOytMK8PLd2+ntwhELXmWycyMRkg6qZrdrQrmDEF764ED
         bNAF8jXfW8b/30xka4p52XWsIsf4H6TLar9Pp5LxhqRpS5T/Othc42Swxsby4L6sGeF5
         aE6IOXoFbu17kHooSeN5aS9PkO2ZV+HBVGedBeb8Kc5daMILNJtbmWiRPFFbZnrvKZAn
         UuKol5ONJ6eN16lvr9T1LsjQ6c3wus+5E5RIEWHn9253JR4XjEIDJG7gN+1S5aYBvxQw
         u9oA==
X-Forwarded-Encrypted: i=1; AHgh+RpdItJKvjezJQQ+fkeCzSeD+ZCwovbhPfK9M7Y88C/rXs29uvUB5ONq/OcoIo3/Y5T5v0bbYD45lA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqiLcyy3nFKT6Ft078VwsIMeTpKBMUWPTDTp9Ty++evx21+CwV
	HnnQSfcTJpF7q9ZZjleUX9UyHiFJFwN7yhZ30y/YBRye5J6BBus37Sbg
X-Gm-Gg: AR+sD10uG1eqALJOyNSTeFZVh2FTu9vIB2n9j58xmYoLAmMmTM5D5Y1vv8i4fyWqbGb
	I1q67jyrCZAerp4oOuFzfrYhbGYgujJbsOdm/6Qi9hOa0iixjdeRSIba0dFI082OX90T2f76Pkn
	PXQhIRkSa8oRdCOegl9sPt2q7jYSqA05V/ym8Vus7hI0cUF5jMx1TVT/IK+Frh92OCFZGF5ETku
	8lamgPUx3IjtNbNEX3ucSdgd9G59aYcDKWMwOyGtZScMqxkDN8lrETSw6yPFr5GE+pEQZmm5diC
	+sz6+q+sUshR2tw5Moi0HnqGhz6Ka6TH7jCKthaq8Hkdx3wSEiqP3sXkavoALxw4BocUximjwgD
	iOsXT7zMr145vPDQvNjJvvcsN2yQtW/GsXnY6dDz08dQRhRHgmdABuXavwKP4X6x/ChY/Oo4COx
	D52gFNVeNmO7wd2dezbdHNOUbql8yCGhq92iogHDjm5OVXw4wgHKgL573EAMYUn4uNHPkzlubBA
	RWiYVjclrXBvlqmLOQh/J5oIeKHFfr3hIfk3MoCrg==
X-Received: by 2002:a05:6a21:696:b0:3c3:a7ab:135a with SMTP id adf61e73a8af0-3c92a749b53mr11060704637.20.1785795383620;
        Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
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
Subject: [PATCH 4/6] platform/x86: msi-wmi-platform: Clean up devices
Date: Mon,  3 Aug 2026 15:16:12 -0700
Message-ID: <20260803221614.59324-5-derekjohn.clark@gmail.com>
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

The current driver has multiple minor mistakes. Fix them all in one
cleanup patch.

- Device names are inconsistent/incorrect for the quirk table
- Per the Windows DLL, PL2 must always be at least 1W higher than
  PL1. Give PL1 and PL2 different minimum values.
- Copy buffer before write to ensure payload is sent instead of stale
  data

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index fdc2f6f4ca7e..35cd35fc6446 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -124,8 +124,9 @@ struct msi_wmi_platform_quirk {
 	bool charge_threshold;	/* Charge threshold is supported */
 	bool dual_fans;		/* For devices with two hwmon fans */
 	bool restore_curves;	/* Restore factory curves on unload */
-	int pl_min;		/* Minimum PLx value */
+	int pl1_min;		/* Minimum PL1 value */
 	int pl1_max;		/* Maximum PL1 value */
+	int pl2_min;		/* Minimum PL2 value */
 	int pl2_max;		/* Maximum PL2 value */
 };
 
@@ -229,8 +230,9 @@ static struct msi_wmi_platform_quirk quirk_gen1 = {
 	.charge_threshold = true,
 	.dual_fans = true,
 	.restore_curves = true,
-	.pl_min = 8,
+	.pl1_min = 8,
 	.pl1_max = 43,
+	.pl2_min = 9,
 	.pl2_max = 45
 };
 static struct msi_wmi_platform_quirk quirk_gen2 = {
@@ -238,14 +240,15 @@ static struct msi_wmi_platform_quirk quirk_gen2 = {
 	.charge_threshold = true,
 	.dual_fans = true,
 	.restore_curves = true,
-	.pl_min = 8,
+	.pl1_min = 8,
 	.pl1_max = 30,
+	.pl2_min = 9,
 	.pl2_max = 37
 };
 
 static const struct dmi_system_id msi_quirks[] = {
 	{
-		.ident = "MSI Claw (gen 1)",
+		.ident = "MSI Claw A1M",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T41"),
@@ -253,7 +256,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		.driver_data = &quirk_gen1,
 	},
 	{
-		.ident = "MSI Claw AI+ 7",
+		.ident = "MSI Claw 7 AI+ A2VM",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T42"),
@@ -261,7 +264,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		.driver_data = &quirk_gen2,
 	},
 	{
-		.ident = "MSI Claw AI+ 8",
+		.ident = "MSI Claw 8 AI+ A2VM",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T52"),
@@ -1131,7 +1134,7 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
 
 	if (data->quirks->pl1_max) {
 		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL1_SPL,
-					&fw_attr_type_int, data->quirks->pl_min,
+					&fw_attr_type_int, data->quirks->pl1_min,
 					data->quirks->pl1_max, &data_get_value,
 					&data_set_value);
 		if (err)
@@ -1140,7 +1143,7 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
 
 	if (data->quirks->pl2_max) {
 		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL2_SPPT,
-				       &fw_attr_type_int, data->quirks->pl_min,
+				       &fw_attr_type_int, data->quirks->pl2_min,
 				       data->quirks->pl2_max, &data_get_value,
 				       &data_set_value);
 		if (err)
@@ -1259,6 +1262,7 @@ static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user
 		return ret;
 
 	down_write(&data->buffer_lock);
+	memcpy(data->buffer, payload, data->length);
 	ret = msi_wmi_platform_query(data->data, data->method, data->buffer,
 				     data->length);
 	up_write(&data->buffer_lock);
@@ -1266,10 +1270,6 @@ static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user
 	if (ret < 0)
 		return ret;
 
-	down_write(&data->buffer_lock);
-	memcpy(data->buffer, payload, data->length);
-	up_write(&data->buffer_lock);
-
 	return length;
 }
 
-- 
2.55.0

