Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54883E8C67
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127783; cv=none; b=eBRLWOmqGnJ1vUSIw5Qg1Pj+KbNbjWsBQIdnb7ZAMGo6UNfFhLJLEl1EtmjMTSjEk6p22wvjGQ/UyutWEvWeEFMuODa2747DdJQqOtw0ux1ueoga68ijkdfbDo8bRphWvq9iw/OlPOvPxbcO2QrrsR9qfZks7/idUDRdXDrxdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127783; c=relaxed/simple;
	bh=bpBQJR0Lh7t53ADUklCY+fVEC2VAWri9ShCtFOB9yXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfTAG03ATDjmdbR/uZlxdFWdVKtZX3Ute8A5a/WjWJkCrg3D9pKuKoWsO6sCKnw21Nv8kPPCDQXmKNLh3F2rWOXm08kdonS4n8GBRWhoIApxLm60DKZx7HJqZT1P1yv82bi4gGnBb09UYf7WA1DcknH5Mavfu5fp6j/+a59yrwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmiPnC1A; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmiPnC1A"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2be26842fd5so4130511eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773127781; x=1773732581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XpzAJs17AL49DrJB7/7GFvQC9N3pX4aoTE0ck01glE=;
        b=CmiPnC1ADHVve5+P2uBi660XU8nmd0O7OKjZQIxEIaupAtgdg25ds4sd/8hAu2zgtX
         lx4cf2TUoAnom468+1WEjVfOTr4J4egqJmTndpBIztNzfEZSPRBh+fSVPDlcJTrk027S
         VoUYFxmOXpehBRrmWqcS5HolJn5eA0dq0SXwoa5JK4e0YXe2M5UVGO6St2C3UrzEVEud
         gmbbAs+zaLotT452odH5l2T74Md0DiHTiyVS41Rh1UAIlOcY4/xVSmOf+IHm8JAWrllw
         6xJXCFoNNT2kMGYLR6OP3PWEbNsF0aMM/DyJeKQmCtwg4bGZvhjHyd8LsqKiPy31PnUq
         Cydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127781; x=1773732581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8XpzAJs17AL49DrJB7/7GFvQC9N3pX4aoTE0ck01glE=;
        b=lzeFQ+AkRYfY0IpP8I8MhvlAAVUsYLHqrlHgFarLJTgGUWSOx0T5fRHkNLfIGwZ9ZW
         uzIzHrxvZPyhuy9z2KsFxWr+qh5NP/bl8Sy24Duj5P9wEnJiZLXnkBtw9vrCNtkHGgAe
         wo4/JwvsWD+tzsY62cyWaRnmAukvnKw9aBR1ZSZQsGQE0R6atu9v5ZsERHHbgMf+nB26
         XSqFzdIbOslwhh7g63C2s92ts12yYFCA6Q5y9SQqRzbXZi6vHwZHL82ziFgxuJfdV+z+
         4c1VxlVCHeeOzQ/0taSm5j13ek9COMVuEfKCKJXVD1+6s6PlQRzlYwBglgCRlF8rEeDo
         ZLcg==
X-Forwarded-Encrypted: i=1; AJvYcCUttYX7B5ynt25SBZZjatSunQ22poEJ2oQTbsoyM7lQXEjNd9Ahfzn4cMUilFOm3KmGpGiYXZIACCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR76J1Ns1ANp8A45FSGx8SsvLP9wdVfocLHdg93I6pfNfd0DdC
	03ZMCiC+SyT8iJ+PLGMKo4CpSRf1b7nL0M2coVw+YJqvo63qPqaeIX5L
X-Gm-Gg: ATEYQzyRnmCCmlF0jjuC0KkmF+mdqpM0SGnXycqHA/2MfRRhum+9Ol4KctC4Bk7klWc
	79mPXCBTinPb2iz5Y5PA/tQapKYWuJQJwzGMY+seYPQA4BfHBuA2hGPiLkabiASsVthziSGu4w9
	RjOz+jXdBnTjy5qX6kHUgktMZQIHTP4cAeYUOViSzLiQs/S+mNP8uTu4SiZVnJRW198aKYO1+gt
	o6VWS0aUHvvqyy35HiSE9dBPIcBQuPCbAk/9AOzH9CUVNhyK7qq7yOy2aQe8234mlaheMiU6Hdr
	CqvyU9wbw8DlEGQa3s5cvTng9Mz4rYYzw629EGYDLpQW6v52jLwHaM2zL+NfF7kow78K9fQGpNo
	j6F6h3KvUuaQDWwzDCeDHiFnoEu2D3dwcBNRme0hwacldS9ffPGfoCJfsOKCTyU94OqfnkSkVZG
	elmt7Q/po1x8tXKDFQKsc3DBXbKmdsTrCOAuLmZ1cBF3d4liS0Jex12e9xhTOSInwKOxYGuukXn
	F/o
X-Received: by 2002:a05:7300:5712:b0:2ba:9cc4:aebb with SMTP id 5a478bee46e88-2be7a0ff626mr852103eec.10.1773127781051;
        Tue, 10 Mar 2026 00:29:41 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be81209142sm721925eec.12.2026.03.10.00.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:29:40 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 01/19] include: device.h: Add named device attributes
Date: Tue, 10 Mar 2026 07:29:19 +0000
Message-ID: <20260310072937.3295875-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
References: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds DEVICE_ATTR_[RW|RO|WO]_NAMED macros for adding attributes that
reuse the same sysfs name in a driver under separate subdirectories.

When dealing with some devices it can be useful to be able to reuse
the same name for similar attributes under a different subdirectory.
For example, a single logical HID endpoint may provide a configuration
interface for multiple physical devices. In such a case it is useful to
provide symmetrical attribute names under different subdirectories on
the configuration device. The Lenovo Legion Go is one such device,
providing configuration to a detachable left controller, detachable
right controller, the wireless transmission dongle, and the MCU. It is
therefore beneficial to treat each of these as individual devices in
the driver, providing a subdirectory for each physical device in the
sysfs. As some attributes are reused by each physical device, it
provides a much cleaner interface if the same driver can reuse the same
attribute name in sysfs while uniquely distinguishing the store/show
functions in the driver, rather than repeat string portions.

Example new WO attrs:
ATTRS{left_handle/reset}=="(not readable)"
ATTRS{right_handle/reset}=="(not readable)"
ATTRS{tx_dongle/reset}=="(not readable)"

vs old WO attrs in a subdir:
ATTRS{left_handle/left_handle_reset}=="(not readable)"
ATTRS{right_handle/right_handle_reset}=="(not readable)"
ATTRS{tx_dongle/tx_dongle_reset}=="(not readable)"

or old WO attrs with no subdir:
ATTRS{left_handle_reset}=="(not readable)"
ATTRS{right_handle_reset}=="(not readable)"
ATTRS{tx_dongle_reset}=="(not readable)"

While the third option is usable, it doesn't logically break up the
physical devices and creates a device directory with over 80 attributes
once all attrs are defined.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/device.h | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 0be95294b6e6..381463baed6d 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -189,6 +189,22 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_ADMIN_RW(_name) \
 	struct device_attribute dev_attr_##_name = __ATTR_RW_MODE(_name, 0600)
 
+/**
+ * DEVICE_ATTR_RW_NAMED - Define a read-write device attribute with a sysfs name
+ * that differs from the function name.
+ * @_name: Attribute function preface
+ * @_attrname: Attribute name as it wil be exposed in the sysfs.
+ *
+ * Like DEVICE_ATTR_RW(), but allows for reusing names under separate paths in
+ * the same driver.
+ */
+#define DEVICE_ATTR_RW_NAMED(_name, _attrname)                            \
+	struct device_attribute dev_attr_##_name = {                      \
+		.attr = { .name = _attrname, .mode = 0644 }, \
+		.show = _name##_show,                                     \
+		.store = _name##_store,                                   \
+	}
+
 /**
  * DEVICE_ATTR_RO - Define a readable device attribute.
  * @_name: Attribute name.
@@ -207,6 +223,21 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_ADMIN_RO(_name) \
 	struct device_attribute dev_attr_##_name = __ATTR_RO_MODE(_name, 0400)
 
+/**
+ * DEVICE_ATTR_RO_NAMED - Define a read-only device attribute with a sysfs name
+ * that differs from the function name.
+ * @_name: Attribute function preface
+ * @_attrname: Attribute name as it wil be exposed in the sysfs.
+ *
+ * Like DEVICE_ATTR_RO(), but allows for reusing names under separate paths in
+ * the same driver.
+ */
+#define DEVICE_ATTR_RO_NAMED(_name, _attrname)                            \
+	struct device_attribute dev_attr_##_name = {                      \
+		.attr = { .name = _attrname, .mode = 0444 }, \
+		.show = _name##_show,                                     \
+	}
+
 /**
  * DEVICE_ATTR_WO - Define an admin-only writable device attribute.
  * @_name: Attribute name.
@@ -216,6 +247,21 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_WO(_name) \
 	struct device_attribute dev_attr_##_name = __ATTR_WO(_name)
 
+/**
+ * DEVICE_ATTR_WO_NAMED - Define a read-only device attribute with a sysfs name
+ * that differs from the function name.
+ * @_name: Attribute function preface
+ * @_attrname: Attribute name as it wil be exposed in the sysfs.
+ *
+ * Like DEVICE_ATTR_WO(), but allows for reusing names under separate paths in
+ * the same driver.
+ */
+#define DEVICE_ATTR_WO_NAMED(_name, _attrname)                            \
+	struct device_attribute dev_attr_##_name = {                      \
+		.attr = { .name = _attrname, .mode = 0200 }, \
+		.store = _name##_store,                                   \
+	}
+
 /**
  * DEVICE_ULONG_ATTR - Define a device attribute backed by an unsigned long.
  * @_name: Attribute name.
-- 
2.53.0

