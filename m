Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286F37FF5D
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 19:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748028; cv=none; b=XhgeE2ImviEnpRtJY7SF1Q3PSEhAT0CzqxNRj22AGzodPDHph7ZhGfsaddJyVfZNpcLrxk1kriNGWkTXVY6r01DwjmdhjSC1ZFUzITVNXvfh0OhidAZmSiVIkfyOA+jWrrpexqPgABKuat52L09we4msXulYDqZeLwY93uNf9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748028; c=relaxed/simple;
	bh=wFnFepjXhk3d9KAku2SyRkA+5UdvY2YGAuzuGAufSno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsH2UwlmARd+GfGqRbk0cWbIQuO5zFQkcEQY2PphenUkJ5keSlPjbosteWx20N31zIdSOotIBmJjnaN/tK0eVAI3iOZEJRhEoVB41isgRQqkdxZ3Zfyma04EuId8/yWsiLm+hoZtdYA0C7ic3ljIOHQuvC5zrWEFufz1QL9Pqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmicvrHO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmicvrHO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso13028110a91.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 12:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784748026; x=1785352826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQzB294z8azDnddZeKlOTHpRuawaaJiN4K26cKT8f1g=;
        b=XmicvrHOcvRe+iaXK5xC6Wey0NsXgg/sBifMBAfoKfYvHWh3MPZ68cLbkilxNdEvCc
         CoJwspqSci0H/8+gBTI3rXi6H4VtpRy4ZnMyYQ5hoKhCGWF05aDVhtfjP5lP84RaLhz5
         PEww+aABUMZhIU04zfTeLjfSOQHlNLtem2FdkMVDqspA+e72wWSeaFxyYOO6d+aUa3Oi
         2CQF/fovqw7SN83Hi5nvuvnt8D0Ncbd2VZyL+RVvg7/U8V7zjamndfZ2lcZSRXi4MIJE
         Fi1Hf0muISKGuoZ7yIlv2ANn+Jp50tScQmoqW2P4m93oGmBZ7/iC+PegaJeJIjA8mbTK
         b78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784748026; x=1785352826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQzB294z8azDnddZeKlOTHpRuawaaJiN4K26cKT8f1g=;
        b=cM+JpM1PZv4eB0DqVcvSB5QYbhkmOGqjDBfuREUDilUcATmWRkD9k2IxCSeDUILUpb
         BiW4xuv/86g7XvjxpOh+w8tEteQ38RTxHvPPKfzeLqhn+B86ax3DjH8q1j+8B24fkADf
         YDHhTaij51v7HBVh6m2JWYN9lqHeFWXjvQRFnjFsArE8zLxvlFSijxVv8R1AWQ0j1F8j
         uHZ7s2vGI5i3OFeOgQc83nUEsmdHZUir1/PLOMHz0nnN9N4zWxXTuJJ7AIEOxreqBV5J
         oxZ2AS+p28ifNKbi7KDsPqseUUnV7lXJzy3ttz5ncKfx7r/G+63iNtpaSxbpqKVh8/zD
         ZVlA==
X-Gm-Message-State: AOJu0YzF3fVk7YFwGc7Tb6yiao2vnFQOXt65lIy9Hcyi//bGMxq+w/i3
	Rhnj/Mnca7E3KKlIcrfd7JhVsA29qBA0z2eOXfOdQE6hjEPYd+THNJsV
X-Gm-Gg: AR+sD132M149u2Q8Aj+S5AjepxDPsmURTutIqCMA/x7BBsaPwxhW5LByh6NlIP2glps
	oJzV7bxPIOBhAWVQNHe5hP5mEjWZBqsSqYKxQKq/FeMFjBarxREUDJwB+43Afin0G5AgetjDcpy
	qKLSeDfoh11cGVZgZXcqKIwUj+1NZorTIuqJxqRPm0o4yzHz7ez9xDGdDkfz/X8vfJYBncKMRz9
	Z6njn2s3p79HAALhE3LZ8XMCGbvMDac351+JgpAtBD9uyXd5AfGSrTX72nwy8XaqDc4WohWKENF
	/6XSoO+hgVT+KL3xKN4uGPo3VMgDAdu4M3s7uQJcdwKi138tN0oOfkWGzwN0Sb9x1MEA9xoKQ6n
	yAW9/oqytNZzMfIk87vRvCdhd4UGJ/Lp1xFESg42sQc2QwTu7myn3uckobiLn1uI+iPdXlxY1g4
	0FIOD2+of49vXvk7M=
X-Received: by 2002:a17:90a:c890:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38ec68982femr9232a91.43.1784748026339;
        Wed, 22 Jul 2026 12:20:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7aa9167sm1522345a91.11.2026.07.22.12.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 12:20:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: linux-doc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [RFT PATCH v2] hwmon: Add support for currX_emergency and inX_emergency attributes
Date: Wed, 22 Jul 2026 12:20:24 -0700
Message-ID: <20260722192024.2314973-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hardware monitoring chips support three alarm levels for current and
voltage measurements. Add support for currX_emergency and inX_emergency
attributes to support such chips.

Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Also add emergency alarm attributes, and drop stray What: entry from
    documentation.

 Documentation/ABI/testing/sysfs-class-hwmon | 24 +++++++++++++++++++++
 Documentation/hwmon/sysfs-interface.rst     |  8 +++++++
 drivers/hwmon/hwmon.c                       |  4 ++++
 include/linux/hwmon.h                       |  8 +++++++
 4 files changed, 44 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/ABI/testing/sysfs-class-hwmon
index b185bdfc7186..24937054f0c0 100644
--- a/Documentation/ABI/testing/sysfs-class-hwmon
+++ b/Documentation/ABI/testing/sysfs-class-hwmon
@@ -81,6 +81,18 @@ Description:
 		take drastic action such as power down or reset. At the very
 		least, it should report a fault.
 
+What:		/sys/class/hwmon/hwmonX/inY_emergency
+Description:
+		Voltage emergency max value.
+
+		Unit: millivolt
+
+		RW
+
+		If voltage reaches or exceeds this limit, the system is expected
+		to take drastic action such as immediate power down or reset.
+		At the very least, it should report a fault.
+
 What:		/sys/class/hwmon/hwmonX/inY_input
 Description:
 		Voltage input value.
@@ -647,6 +659,18 @@ Description:
 
 		RW
 
+What:		/sys/class/hwmon/hwmonX/currY_emergency
+Description:
+		Current emergency high value.
+
+		Unit: milliampere
+
+		RW
+
+		If a current reaches or exceeds this limit, the system is
+		expected to take drastic action such as immediate power down
+		or reset. At the very least, it should report a fault.
+
 What:		/sys/class/hwmon/hwmonX/currY_input
 Description:
 		Current input value
diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index 94e1bbce172a..47faca56a979 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -127,6 +127,9 @@ Voltages
 `in[0-*]_crit`
 		Voltage critical max value.
 
+`in[0-*]_emergency`
+		Voltage emergency max value.
+
 `in[0-*]_input`
 		Voltage input value.
 
@@ -332,6 +335,9 @@ Currents
 `curr[1-*]_crit`
 		Current critical high value.
 
+`curr[1-*]_emergency`
+		Current emergency high value.
+
 `curr[1-*]_input`
 		Current input value.
 
@@ -529,10 +535,12 @@ implementation.
 | `in[0-*]_max_alarm`,		|			|
 | `in[0-*]_lcrit_alarm`,	|   - 0: no alarm	|
 | `in[0-*]_crit_alarm`,		|   - 1: alarm		|
+| `in[0-*]_emergency_alarm`,	|			|
 | `curr[1-*]_min_alarm`,	|			|
 | `curr[1-*]_max_alarm`,	| RO			|
 | `curr[1-*]_lcrit_alarm`,	|			|
 | `curr[1-*]_crit_alarm`,	|			|
+| `curr[1-*]_emergency_alarm`,	|			|
 | `power[1-*]_cap_alarm`,	|			|
 | `power[1-*]_max_alarm`,	|			|
 | `power[1-*]_crit_alarm`,	|			|
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 55a9a3ddd4aa..91a43fc35532 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -621,6 +621,7 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_max] = "in%d_max",
 	[hwmon_in_lcrit] = "in%d_lcrit",
 	[hwmon_in_crit] = "in%d_crit",
+	[hwmon_in_emergency] = "in%d_emergency",
 	[hwmon_in_average] = "in%d_average",
 	[hwmon_in_lowest] = "in%d_lowest",
 	[hwmon_in_highest] = "in%d_highest",
@@ -631,6 +632,7 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_max_alarm] = "in%d_max_alarm",
 	[hwmon_in_lcrit_alarm] = "in%d_lcrit_alarm",
 	[hwmon_in_crit_alarm] = "in%d_crit_alarm",
+	[hwmon_in_emergency_alarm] = "in%d_emergency_alarm",
 	[hwmon_in_rated_min] = "in%d_rated_min",
 	[hwmon_in_rated_max] = "in%d_rated_max",
 	[hwmon_in_beep] = "in%d_beep",
@@ -644,6 +646,7 @@ static const char * const hwmon_curr_attr_templates[] = {
 	[hwmon_curr_max] = "curr%d_max",
 	[hwmon_curr_lcrit] = "curr%d_lcrit",
 	[hwmon_curr_crit] = "curr%d_crit",
+	[hwmon_curr_emergency] = "curr%d_emergency",
 	[hwmon_curr_average] = "curr%d_average",
 	[hwmon_curr_lowest] = "curr%d_lowest",
 	[hwmon_curr_highest] = "curr%d_highest",
@@ -654,6 +657,7 @@ static const char * const hwmon_curr_attr_templates[] = {
 	[hwmon_curr_max_alarm] = "curr%d_max_alarm",
 	[hwmon_curr_lcrit_alarm] = "curr%d_lcrit_alarm",
 	[hwmon_curr_crit_alarm] = "curr%d_crit_alarm",
+	[hwmon_curr_emergency_alarm] = "curr%d_emergency_alarm",
 	[hwmon_curr_rated_min] = "curr%d_rated_min",
 	[hwmon_curr_rated_max] = "curr%d_rated_max",
 	[hwmon_curr_beep] = "curr%d_beep",
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 77a6f2bffcba..9ebd482a42db 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -134,6 +134,7 @@ enum hwmon_in_attributes {
 	hwmon_in_max,
 	hwmon_in_lcrit,
 	hwmon_in_crit,
+	hwmon_in_emergency,
 	hwmon_in_average,
 	hwmon_in_lowest,
 	hwmon_in_highest,
@@ -144,6 +145,7 @@ enum hwmon_in_attributes {
 	hwmon_in_max_alarm,
 	hwmon_in_lcrit_alarm,
 	hwmon_in_crit_alarm,
+	hwmon_in_emergency_alarm,
 	hwmon_in_rated_min,
 	hwmon_in_rated_max,
 	hwmon_in_beep,
@@ -156,6 +158,7 @@ enum hwmon_in_attributes {
 #define HWMON_I_MAX		BIT(hwmon_in_max)
 #define HWMON_I_LCRIT		BIT(hwmon_in_lcrit)
 #define HWMON_I_CRIT		BIT(hwmon_in_crit)
+#define HWMON_I_EMERGENCY	BIT(hwmon_in_emergency)
 #define HWMON_I_AVERAGE		BIT(hwmon_in_average)
 #define HWMON_I_LOWEST		BIT(hwmon_in_lowest)
 #define HWMON_I_HIGHEST		BIT(hwmon_in_highest)
@@ -166,6 +169,7 @@ enum hwmon_in_attributes {
 #define HWMON_I_MAX_ALARM	BIT(hwmon_in_max_alarm)
 #define HWMON_I_LCRIT_ALARM	BIT(hwmon_in_lcrit_alarm)
 #define HWMON_I_CRIT_ALARM	BIT(hwmon_in_crit_alarm)
+#define HWMON_I_EMERGENCY_ALARM	BIT(hwmon_in_emergency_alarm)
 #define HWMON_I_RATED_MIN	BIT(hwmon_in_rated_min)
 #define HWMON_I_RATED_MAX	BIT(hwmon_in_rated_max)
 #define HWMON_I_BEEP		BIT(hwmon_in_beep)
@@ -178,6 +182,7 @@ enum hwmon_curr_attributes {
 	hwmon_curr_max,
 	hwmon_curr_lcrit,
 	hwmon_curr_crit,
+	hwmon_curr_emergency,
 	hwmon_curr_average,
 	hwmon_curr_lowest,
 	hwmon_curr_highest,
@@ -188,6 +193,7 @@ enum hwmon_curr_attributes {
 	hwmon_curr_max_alarm,
 	hwmon_curr_lcrit_alarm,
 	hwmon_curr_crit_alarm,
+	hwmon_curr_emergency_alarm,
 	hwmon_curr_rated_min,
 	hwmon_curr_rated_max,
 	hwmon_curr_beep,
@@ -199,6 +205,7 @@ enum hwmon_curr_attributes {
 #define HWMON_C_MAX		BIT(hwmon_curr_max)
 #define HWMON_C_LCRIT		BIT(hwmon_curr_lcrit)
 #define HWMON_C_CRIT		BIT(hwmon_curr_crit)
+#define HWMON_C_EMERGENCY	BIT(hwmon_curr_emergency)
 #define HWMON_C_AVERAGE		BIT(hwmon_curr_average)
 #define HWMON_C_LOWEST		BIT(hwmon_curr_lowest)
 #define HWMON_C_HIGHEST		BIT(hwmon_curr_highest)
@@ -209,6 +216,7 @@ enum hwmon_curr_attributes {
 #define HWMON_C_MAX_ALARM	BIT(hwmon_curr_max_alarm)
 #define HWMON_C_LCRIT_ALARM	BIT(hwmon_curr_lcrit_alarm)
 #define HWMON_C_CRIT_ALARM	BIT(hwmon_curr_crit_alarm)
+#define HWMON_C_EMERGENCY_ALARM	BIT(hwmon_curr_emergency_alarm)
 #define HWMON_C_RATED_MIN	BIT(hwmon_curr_rated_min)
 #define HWMON_C_RATED_MAX	BIT(hwmon_curr_rated_max)
 #define HWMON_C_BEEP		BIT(hwmon_curr_beep)
-- 
2.45.2

