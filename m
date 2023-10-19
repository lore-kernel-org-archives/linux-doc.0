Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C2027477
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monoid.al header.i=@monoid.al header.b="NJ6zwTDu"
X-Greylist: delayed 353 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 Oct 2023 07:03:33 PDT
Received: from out-191.mta1.migadu.com (out-191.mta1.migadu.com [IPv6:2001:41d0:203:375::bf])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCA2131
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 07:03:32 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monoid.al; s=key1;
	t=1697723856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VRxOEzF/DS5Ox8tHGrklu3RK67HNn0EYzNtroRBbeKU=;
	b=NJ6zwTDuDXga4dSQHGU1ASUZ7/FmT03Ln4ldnJ2aO2liVnVdTHDSNG8tFsfnsqM31o3Iv1
	PP8TC5fzlg7NKLcFBMZkQvos+rk/LepsOox6M0thx09qjEKwoeM9IHd2mK6N5jSzpPbmnr
	Lex+Eo0VT9YeezKlTacm5DqVUOwZzL3aiUO0HNM+Cxpj+kt0UrAfpFGvSAXh6OIPb7DRxo
	BNs05zLnD8mH2MTpMZbtgYqK2HHhjDN0my3Q29ipCy6+Fv4woa89g+q9asvR82dAuAVlTi
	kpXzZ40HdMRpcEhQ2DCK5wXnnyjpFj2uWhvUQlEIn3iqGyMr3CHDh28pRMxSiQ==
From: Ellie Hermaszewska <kernel@monoid.al>
To: eugene.shalygin@gmail.com
Cc: Ellie Hermaszewska <kernel@monoid.al>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.
Date: Thu, 19 Oct 2023 21:51:58 +0800
Message-ID: <20231019135640.434752-1-kernel@monoid.al>
In-Reply-To: <CAB95QAR-UbfVULOCaZMO4H1AgvzbiHEoSYk-DiYPY6Pg-i7Vag@mail.gmail.com>
References: <CAB95QAR-UbfVULOCaZMO4H1AgvzbiHEoSYk-DiYPY6Pg-i7Vag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

These are two separate statements, describing the set of sensors
implemented (those I could verify) and the specifics of the T_Sensor new
to the X670E motherboards.

Best wishes,
Ellie

Only the temp sensors that I can verify are present.

T_Sensor is the temperature reading of a 10kΩ β=3435K NTC thermistor
optionally connected to the T_SENSOR header.

The other sensors are as found on the X670E HERO.

Signed-off-by: Ellie Hermaszewska <kernel@monoid.al>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 7e3cd5b6686f..0bf99ba406dd 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -15,6 +15,7 @@ Supported boards:
  * ROG CROSSHAIR VIII HERO
  * ROG CROSSHAIR VIII IMPACT
  * ROG CROSSHAIR X670E HERO
+ * ROG CROSSHAIR X670E GENE
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
  * ROG STRIX B550-E GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 51f9c2db403e..36f9e38000d5 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -244,6 +244,8 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
 	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
 	[ec_sensor_temp_vrm] =
 		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
+	[ec_sensor_temp_t_sensor] =
+		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
 	[ec_sensor_temp_water_in] =
 		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
 	[ec_sensor_temp_water_out] =
@@ -344,6 +346,14 @@ static const struct ec_board_info board_info_crosshair_x670e_hero = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_crosshair_x670e_gene = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
+	.mutex_path = ACPI_GLOBAL_LOCK_PSEUDO_PATH,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_crosshair_viii_dark_hero = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -490,6 +500,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_crosshair_viii_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E HERO",
 					&board_info_crosshair_x670e_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E GENE",
+					&board_info_crosshair_x670e_gene),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO",
 					&board_info_maximus_xi_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO (WI-FI)",
-- 
2.42.0

