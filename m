Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D993328F3
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771571167; cv=none; b=sOjsweG4ARv9i+7umLnOexJR2PJGqSofVxKzzzKGeTd5OsnWpn7MUlbfkXSyQJ2qzxEVZCyKxOVwqMAQEQe0NQIx+MIXQMu8a9RVJNyxad2669meYZNEcHUICmBI5CnJMZnj8Hfc9PnTZHS3Ok0PFOgZWLmj9N+IHtxLKGwWejE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771571167; c=relaxed/simple;
	bh=hUo1MvYccpbWMaWLjJzMWrm+A+W/DdILFntNUVeXgaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgKigm52VlXv3iIcQYDEGAcCf9c1jbWC/OgGffjHBY1e5CfKgP3CXKBYqL1g++hJIHjKuB5+xePGGchQkeKatN28+hjM1cOF4PCcuucW7ftNJqiywp5XQp8/carwNhKb2fQN5IW7JQfWzXUcl6cRZX8Tp8cfhB8PgtaohZzFa98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QawXKLT3; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QawXKLT3"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso3446903eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 23:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771571165; x=1772175965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFj2OTG3aeriS2nQMueP/Sb6Nx66D9fuh6qoYGYRpGo=;
        b=QawXKLT3SMqxUWfFiTplT2EObJ8unPc8IiC7S1bBNjE0+kCRUwJNzOY262YVQpipN6
         0/lzBOs8+xtHxMCbffzwkS1I53x8Y5Tx3B1dcz9U7ZXgUVir+eYJmgvwips1Ao0eBN4w
         7NP90PsGW3m1DoZmmXH6vQSss5vHsVTVvfJW2+Bk0ZF11HajBwwUy3OD+NJC2bsyzuUz
         mb3e8OqTVgIBAdldVVL2QwHt+kT23Xcez4dbsHS7X2ecRevD1EJUxXEEAUr2HSy/GWWJ
         0+Be4S69HG2cdlnIGS54UO4KiIUCBHM0XyhrJxczuBsKMYnj0r1qwa1gH8VQlli19/ut
         UFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571165; x=1772175965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFj2OTG3aeriS2nQMueP/Sb6Nx66D9fuh6qoYGYRpGo=;
        b=H34mteb8PObXyl+rC4IknoAvNOCyO7dgB4+z1bVCqxJsMuZpYRSFtCnUI8bk8xS6wZ
         9E1OcV1FtXpR64j4pV/HJBsM6X9t7obHSX2vcHG0Tryivg7BQbje0jJfWQ3juKWqgXLB
         x3qV/6NcNLJgHixyzPub2b6K9xcLsDhrVF5qB4c2js8L9L4XWmLYq7gR063rlAtXrBlC
         JdequcVqHRJGBhcXBpyn3HmJbiYhtpsIVVfQPO/+XasssuD/0iISUAwCqAM+BX8qt3l4
         5Mm8n0wg7zT6l0fdyaFfmlqXx1Z165zACkv1hFRiO/CPlmwe6IQzkFCEXAgVlwRM1RpB
         01ig==
X-Forwarded-Encrypted: i=1; AJvYcCXJxIOOyQ2vm7RiOmZmG8K/w5IHz+NwU7M/nbfHIAuF/FIS8loCwlz/P9c/rLfKDVEZczO0SqOcfMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGHzakN5og1pXCG0oeK2Whd6kuwqCgHuG0hqq2p1m1kO/LzwT
	FyKRE3K78DFLZL58mYeAE5psMNQYsQmDz1SmEyj5kK5U89BET+F2/0FGyzgjew==
X-Gm-Gg: AZuq6aLcZAAI+EQ/QyoIzGv9MZm8V3S98S7yff4zlGPBoQKbHVUX6yOPwJcDY612SG5
	PgiMzJF+/CHJdRlgzPUoKEq9huaBCJJ/xzPLWR2/rBqIteVbnclX2/Z3Bchn5ji4Wgb23YdH35O
	OmDSubPixBm8R24rdhV3jY+bOHBQ22JjSIS9UrdRlMBUe+xwyvs5Sy2YfL4P1j+LZFTCZ+b06Af
	bcrfZgIvrKIfQuOhepGtORRR1QJ94n77KbntjGX3CboSoXRHfQal6nx04Bwx0U95uVVt8Dz/aCT
	RWSwXg0e33W+oQ5L1jQ5gSU/sEfwGXtyHoHVRkIqv+LhQH3jYfj7AsHHv8SkoqdOGV6EFyoGl23
	BKxT+ugijLSIsunF0QT3zoJCxolbLwrLCqUMZPSTn6W7hiuHKsiHmFX+2i4p/8UL2GHkxVxhY7f
	InMHBD6s3yd7MYFoeB0L8MtUh4Mn0FYFy4G7/U1UdyfEQMPlce0DDhOOEcwk12UPDUDV194T1zk
	IlzHXC8zwBVaA==
X-Received: by 2002:a05:7301:1f05:b0:2b0:571a:28a5 with SMTP id 5a478bee46e88-2bd733590e1mr318113eec.18.1771571165046;
        Thu, 19 Feb 2026 23:06:05 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb669f7dsm22163335eec.23.2026.02.19.23.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:06:04 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Richard Hughes <hughsient@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/16] HID: Include firmware version in the uevent
Date: Fri, 20 Feb 2026 07:05:22 +0000
Message-ID: <20260220070533.4083667-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220070533.4083667-1-derekjohn.clark@gmail.com>
References: <20260220070533.4083667-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Userspace software fwupd probes some HID devices when the daemon starts
up to determine the current firmware version in order to be able to offer
updated firmware if the manufacturer has made it available.

In order to do this fwupd will detach the existing kernel driver if one
is present, send a HID command and then reattach the kernel driver.

This can be problematic if the user is using the HID device at the time
that fwupd probes the hardware and can cause a few frames of input to be
dropped.  In some cases HID drivers already have a command to look up the
firmware version, and so if that is exported to userspace fwupd can discover
it and avoid needing to detach the kernel driver until it's time to update
the device.

Introduce a new member in the struct hid_device for the version and export
a new uevent variable HID_FIRMWARE_VERSION that will display the version
that HID drivers obtained.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Richard Hughes <hughsient@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/hid-core.c | 5 +++++
 include/linux/hid.h    | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a5b3a8ca2fcbc..524f2b9ed5121 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2887,6 +2887,11 @@ static int hid_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	if (add_uevent_var(env, "MODALIAS=hid:b%04Xg%04Xv%08Xp%08X",
 			   hdev->bus, hdev->group, hdev->vendor, hdev->product))
 		return -ENOMEM;
+	if (hdev->firmware_version) {
+		if (add_uevent_var(env, "HID_FIRMWARE_VERSION=0x%04llX",
+				   hdev->firmware_version))
+			return -ENOMEM;
+	}
 
 	return 0;
 }
diff --git a/include/linux/hid.h b/include/linux/hid.h
index dce862cafbbd3..ce728c8d5bdc4 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -698,6 +698,7 @@ struct hid_device {
 	char name[128];							/* Device name */
 	char phys[64];							/* Device physical location */
 	char uniq[64];							/* Device unique identifier (serial #) */
+	u64 firmware_version;						/* Firmware version */
 
 	void *driver_data;
 
-- 
2.52.0

