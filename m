Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF0D2D3A6A
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771571159; cv=none; b=oU+SpXw5K9DDOIww3+oUrW9VuxR3UJ0qNtTLQv9plnK77HxhntL6ueQZJYor4a5taoazYRFD3VMmYtXx91HwbxIZRtU2WBkGS8gWzfL8iO/f44uJIlWaChNJwU8G/yTO9WnbXjWkqCKTHLfUA0oPwQpme+1au4Y5p5Wx44sDpTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771571159; c=relaxed/simple;
	bh=+4nfO/MXU83pOeG2DXV/A8HvHCPLmR6w67tZZuPB84I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcdo2NwoAixvytxeg+VQJRJ84n8DmfFaoqar3oe4wPlAk/rGMd04PhArxl+eBvFP4l6oYcwf+OKpyvwooiGGOoJnSrK0Q5GjVhXK6DUfPdRD6Q3BwHlHEfmPLwJ5FzNqFxl93MEnp1+81+/5c7uRTIvgDsqJ0gI6KEKH5AcaYrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9HuPT7I; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9HuPT7I"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b82c605dbdso174725eec.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 23:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771571157; x=1772175957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCIGvEeI9Tq/VaiBgRhw0In7nNopiUbXBw8UFPFZx+I=;
        b=Y9HuPT7I1O/YS9sBVuowtWIpzq+IK3hu1XcX6Qtk/Sv0/trHeuvDk6a+wwzze2oiQz
         +bGN3XceFn0VP891/I54QZArzIK3fWQRWmNPXtZDt9hVHQxpswuf+EiFznYvGpYxsvU1
         RdrNf6WsvfGzoQMsPoDWRC77uRaQ8fKcRwqPbG/j/OtJXVeFjHTFWPDzbPKCotYbnY3Y
         IjJzdW8IfBOD5+HMT537p7k2mEdh8g6GAR5Z2g4gNvvrVWH4C+SDN+ZtqMxolpgTd2mF
         i73Gtn72noPqm2szZqyI/rTqGqif9LmMmVLIKHPVc1hWBSfI1zv75GBfkqsMDKA0f49T
         5XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571157; x=1772175957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCIGvEeI9Tq/VaiBgRhw0In7nNopiUbXBw8UFPFZx+I=;
        b=tuUS0dGPbWQYRirwdAKi2rw6iq2+Gz7zmMzWateIRbF610jaMSrafPhg4i/ikfUWb6
         BHK5LtUoDhGpwuTYUmmqv67QPA1VLRnsYGa36n6dRXbozHdEqSmN8SOyZdMPIegrfMwy
         DgLiAD9Ktl54WUbliplAiOqfqSCGItQEyDfrGNWmIUmtwGl21hylp7S035Hv1CooGAat
         sfGubE0jfxRXX5raggo6pnXYUYsu92DuGkPmn3Oovyp7vtstxInt+IyGG9JgJHAv3Ea1
         G6fM05w4ItBMIJnknZBCV3bLZ61CTQ5rxQsBrqD9CLm34SfpS2DPqHHm8sbl73Ir1yVd
         Q/jw==
X-Forwarded-Encrypted: i=1; AJvYcCVFyP+/a+ddKem1ibcmQslmzvbYWu/vDT3oYyS6JYbdXTmlCpVyCO4rLKB6gjXZZwGGCFJMkqSkx2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoN5u/L21MRyoapLDycKzmrvjHpo6QQzxmivtlXxB08aEErBZJ
	tCeNucY3kcmqy/2iXL8gMVSM3iMh/ffcyDdmEXlPH5MZB5fL9NbKz6RF
X-Gm-Gg: AZuq6aIqFvPz5XBwOwjBgNf9qF+yhesdCyTQS+ZFfSXmmIq4gPD5xRMkxS0QhefEn7d
	QWkEa4morR4aHdi49fpxpoP/8gW23hJ0BOXkFF1s7boTHTQVyOjxZtpIgBt7/G+zQoccHL92B10
	UHdfZObR51iuUYlmjbo281Uy1n0IbGbhcocQrxYvva5J6NucK1i7jD0akxagE7Y0YZ/p23/hKxl
	1BuCyhG3wCuEGFwcQWY0qnOuN7t6oD+1ngEHzIqW9PALvioMVfALOAkiaUYIOHlDbt7+xdcBLhu
	b08hCaT486TBKiSYOXRSrrYFl2QatsnoP10nrRs/YJ/49TaOG2X4ZJysuUMdkgfc3b/IC5yfGTG
	bk88aL7m4eF9Cyx7hyMLypIGDRXqbFDxW8U4p7N+7NXmARfK8Rha5oUo9l19DoxRY2KZFkNuxJv
	l4TG3CvO98vvDH0aboUf519ne+evwPiT/zgMS8uBoHYSU2MEbGlnQ3dtVMQ4aiXcr9Nk5X0PNHY
	rc=
X-Received: by 2002:a05:7300:508:b0:2ba:72b1:40c7 with SMTP id 5a478bee46e88-2bd4ffe8e34mr5486846eec.4.1771571157271;
        Thu, 19 Feb 2026 23:05:57 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb669f7dsm22163335eec.23.2026.02.19.23.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:05:56 -0800 (PST)
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
Subject: [PATCH v4 01/16] include: device.h: Add named device attributes
Date: Fri, 20 Feb 2026 07:05:14 +0000
Message-ID: <20260220070533.4083667-2-derekjohn.clark@gmail.com>
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
the driver by providing a subdirectory for each physical device in the
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
---
 include/linux/device.h | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 0be95294b6e61..381463baed6d3 100644
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
2.52.0

