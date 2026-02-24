Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754AA234966
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771896745; cv=none; b=X06EdC9d4DR+/ke48/IkUTAbO6olAtDd3hFtecTEZlx5/WAcGkgglmvJINDDlI0wF/EXhQYnHThH7zXA2xhGuPYakomlQ66JVugZF3EupQNwdIm2W8MGY5Y/d8JZK2YthlmP4m+tdOxBr1BwuZW8KreIFr+6Dv5ZsRaaDWfGfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771896745; c=relaxed/simple;
	bh=duKkFzC00NILWdTsFDQ6jxgfrljHThYgPkLQs602iSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jg3LkBTcIBTOg4C2MJfGU4o3CRG9jlQXHTe1P9owH7W6vsfJal65tBzH2IyaMnUJTYVlzEFtSiwS0O2TSi62CjkyU/6hIXsfjXgOf9u5+EpLtJ+wO8BFmIuCwUKaQtNaOfXfor+KG0PC181gwZw06hYv4gMrUE2YylI4VfXf0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9fAQVrI; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9fAQVrI"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba90683995so2048200eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771896743; x=1772501543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv5oSk0V/ZX3YgLXFixXf44tV2AKjxOWJjiuXpaRukM=;
        b=G9fAQVrI7WafhLbX718/eTrsiWwA6quxcUuhsAe+0+To25tvWl1KMojEEZfteZ/zG4
         fPBjPNouuorhApgB7fD+dfJRrYIu2+UV6+UE7368EMHaBTnSenQQ1K4EXqLAnJRSwsfc
         qS/XsKdosYJDrQplCFVYJgiG3vHD7j9BhdeJERl3XjGa5A22bAI4YGPOZRjiS5YB7mql
         Pc2+1TXlM+mY1ZVCPjmRILNODHkgfl8fDM07eQecRybCgcML8WnpYVLsRbb61ISLbiRw
         aM4X28XGuR4HSi3/Y+JFogzyxkr0qJOlq7t3OBEJjuU8FzPe9PyCXTxm+RLm9MkQy5zo
         nfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771896743; x=1772501543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zv5oSk0V/ZX3YgLXFixXf44tV2AKjxOWJjiuXpaRukM=;
        b=Ei6M5rykwiEUVXOAd3ZxwM/ExN06CLGVezNrz6xH/taVD7h3fIU45Or0kxKN7wN5LL
         T01Yf6yMhIoXWC+vTEDNFyPUoPJFSRGW5OfrYTSaCY4ALSVzQPIh4/jjDWzkh6K6H6zh
         s+wUPUjZvZv+xlfqbCLeXqiBuUxtPYdlyp2upeS78GlbVV5uLK2gKf1kjheVOJF1MhUO
         GsJWEN5SctZP/nHsFTKc1qZugjLd0M5W/FG7jfe+F7zSNMJMk6047mjYPwYaI4LDfp/7
         BDVf3f8W/IG6PCq/2IeJxStKkT+8V+HipVMpAsiOfDn39Xp/pCcV6EUBGSkyRs0PkFLp
         5vtw==
X-Forwarded-Encrypted: i=1; AJvYcCVYDXgbOPBn8jLi8Hw1vC/yy8P/DuI2XxmAwy781OoWHfC5jMevEppPBYahgs7MBl2U7o8VpRN/1CY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF5JHfSWqG9aS04C01JrgWW9XWt0cYlyjrwMiEDCtG/M2Xc8s0
	IPmWRHtmXbsoupXybPH1q3eniQ4FhtfbkhHd79NkgHoIXuqmZWhyyo05
X-Gm-Gg: ATEYQzwrgtvUCBv8cL2BThrrVsbx3IxFV3LzkC8zBBjtS2l44IhmgBcs7+DF+r4zW+2
	0dU63DKjPUHw+e3OJ3AYBcYkockqQmtRDoddsZc8iTA8NyiUsUrwTL9BHpmiCrkqR7vc9kIKQZj
	Ll+q4lG6IHfEma/w1sBvbDiNQCXBFty6+1uRnP0QU6tZU1D8wMhf6UB+0vbauMEPpId/Pj1/FrA
	d5XBcLyJoym91TaEyjHgGYbBtAesWFuIWu+F7GQAu156pTWDGILn/iJp39fHmYriuXEfcFJJIGg
	7bF4UpPmpjm6Y9AzlUAHL0XYxgLuIQGRqUPIw+2cUHwyTFbVDWtiqQdbfWzsHPHGeA8b5oSi6mB
	43mnei1huSM0EKLnpf2ZKP9QQIfOM2M2n3UG2R1nyphYyfdawrXKd7LVmfiPoTgz9vA4YqxcIZp
	/oi+n13pe4T2sOY/CAyo16Q5Fel9aCPd6kexhj7vTfGPRKHF9PWLudp2mX2qVPzRJqWRll1/YTJ
	ws=
X-Received: by 2002:a05:7300:80c7:b0:2ba:a387:92f6 with SMTP id 5a478bee46e88-2bd607e8679mr6380408eec.13.1771896742472;
        Mon, 23 Feb 2026 17:32:22 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa027fsm6485015eec.9.2026.02.23.17.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:32:22 -0800 (PST)
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
Subject: [PATCH v5 01/16] include: device.h: Add named device attributes
Date: Tue, 24 Feb 2026 01:32:02 +0000
Message-ID: <20260224013217.1363996-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
References: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
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
---
v4:
  - Use dmabuf per request instead of devm allocated static buffer.
    Resolves bug with side effects during suspend.
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

