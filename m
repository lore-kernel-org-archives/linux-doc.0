Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231386;
	b=MoQYn3H6UQ1dK4vz6+3Eg/cxKZBbD+NoWD7TO53t94WaXDpixcJTiRpPTGdlFLdU/ABt
	 gs5gEX3u/xYdluZgV04e4HJhWDz/KVHZTscIBUsaLnG6yybm9dDlFYhBjy0kAXaMDS9TL
	 YvPAvZRkA42+NYbAFKd8ch0sUwFS0XI9lQY8jy5LWLdsrVSJX2eBmvmObNo3ekAVD3jpi
	 rM4rlKBFIZfS3iUAY/EQIJuDsCtYTpsG3aU+jQNXVOCmqKeiJoaDcoQmg2kqj92PyEM6q
	 Anhb2oDk7oefrgIOXtBJmWiIj9hIWbn1XZg0UQkp8UMbxPiM8iVWhtt/CWMAzswDy8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
	b=Mq7rObE1UGpicaAE0Lb6dk52Xyonupdt8IcuO00dHD4vtvLVugZwO7r7OxW3GW6FQtWp
	 FwpDZRnqvj+6pTN3BT2/vcLFn2T8wfIHdWBq2xj5JoFYrhUyiKTmHq0Eulbl4E2cIkiRH
	 F1E+RaNxJU9S8dvG8JQGecuqVnq1KPzbylyQpocCM048OQU0qGj+/S8kvIJIVPimeyySd
	 Gz9X6LrOoDNHQSFdB3WpYHmbraY3H2WBfRFRL7AAJChTN4X4ATD/oeePg6U/YEI6YF4bL
	 A7ym9lszSz+8nBbv4t9QtEPuo9WcOMVNAjwUgbguAuFEHGhb4OmSJMhBl47uQj4dt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DhbqdIST;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A76606D823
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A76606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DhbqdIST
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so7213705e9.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231384; x=1794836184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=DhbqdISTHqi9/Qrm2erP+otVKZ/GKoXVYTzI0mDD8dzKKOk2bTA3XAqVHTdt8jz8Bs
         3lniUKiPn7PK/8g1HEh86/lxDxd1eY5alocIc5OAlms4m1RgN/P2kv/zz6O5NlSc9hIw
         WVNz9mkw5dW+WQfBn33R5DydtwtBrFNu2SrJpgRLs3BQZZQzYFeYWeR2ye06kopsy40A
         9ra87uxZ3AD6ACCufHE8xaiqiEUMX3LLxibViSRSv1cYpfBu86Nw5hCGI7RUeoeH2zJJ
         FIzjtbIOiTuHeydUPqEweAI8u3nZdqGBssPMprCoIPZ59IXpu+5zrQ2n/sRT1nr+FCN5
         Du5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231384; x=1794836184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=Xa5mf47EtMoFx5IXqAuDmfws8kM4RyBa630liKhyFLMiZM4HMyHEY4og6RHwAW/ew+
         O4a8v7e6FScI8dG8jY+5vHFiK+spnaYk4E4bg/MV4nLYSilyoPuHqelYd1joZYhVKhL4
         zeS03NrlrUEkLgYiZ2hq5Qx+FcmeNcV52+icujHLKBn7n8f9UMqw2HpCRu2i68G4OO5M
         IS+QX7iJkYC/qUmyDwKmeAer7VYWvwBEeksTi1OIRKHqPWtB0bC82MmT7nEEVYP014bB
         y/feN4UN2hRSS2SNkpHIRCFzbWE1X38lbpImMDJddGpiuOwxb8Rm6fbElyv0zBWkIPTH
         J7qg==
X-Forwarded-Encrypted: i=1; AL+hErGBDwgP6EwugbowkCU5xH4gECPC9IjKkI0BZtQKL5v9jomAYl9PdlvVrJMyH/uHTYFx72HjPdAmtZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+QK3AmmjzZrpRel6tTeZYU29G9PcrYRxSXA7g5JrMK0XP9suT
	TCATQmzdpsrfhTnwAW8H1uJeQXt3TZeO1pUDlIKVAgeROHVynaSO5wTUVEas7HeJjoQ=
X-Gm-Gg: AYBFou0Fu5GvzoSxbt5Ofq/oyeG+6gS2V3Xzkw5ZlOAXcpOy+fZLqHzGXcNr/dnvAAA
	t8WqAnw89U7cm3l3VZhCIGruztfR1pWL6t7EZrTXPsJvOb2F3lPPBqsNZ+7zc+OWF+8m73PRkKX
	1TcRym89J2OGoTYsFaRc3NBADjP1XqxLBma53mvv0okuUN4dyIm9QAPby+j2EhVTpd365tegRBg
	XelssgVcOWB62jKdZpocDTOJf6jfTlZxTiwuYcJcAKv/D0QhOr/RGDH80cTt69mJU+y4iQNjP+E
	fZFsuAFmeA+sltib2ZilQjwJ32HeBAB4kXh+3FEtKBuQST90S89f+TcZMTN6KgQAfR2KIjI2g2M
	S3AKzez3/ovp1DJ+xedsax+Q3BhZ/w3nz9Y46LecOwmnwx+fiRv1VZV1Y6Y7d/VX5nnObT8wEeY
	9Cnf2rs3GSxCXdKvEPgR/Dyuro9oLSjKxKrM+cr2+j56qnsg80RJZ1xlX1H30elnPOztWGGm5v4
	qH2DXjBKGGsI9sF/eqbDV+gzX5lgbWvB2LzmkagyYnNZ4rGY2+EhOmHvPzVCcrD3Drc5Espz7kp
	f2W5WD3TfDCa3QMhkkpArAuyyubjUiOdvCHJprVvS7KEX49UwD4Q+xOSIMzDzWbLk16UpNNB4RI
	0DdzkYdo6Yk07OMDIsvBzkmYdyMa0B2SRygeqfs16nM9whym7d0Pn7jZ4YunY5SgipJY+2RPVSP
	7MNQ+BuE7n5tfub8DWDcO/n4C2kg==
X-Received: by 2002:a05:600c:a312:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4b94d7632aamr58126985e9.2.1794231384302;
        Mon, 09 Nov 2026 05:36:24 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:23 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/6] hwmon: sparx5: separate temperature reading from sensor dispatch
Date: Mon,  9 Nov 2026 14:35:06 +0100
Message-ID: <20261109133609.810876-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move temperature conversion into a helper and dispatch reads by sensor
type. Preserve the existing temperature calculation and error handling
in preparation for adding fan monitoring.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- No changes.

 drivers/hwmon/sparx5-temp.c | 54 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index aa91780737446..0fd5c147f8167 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -37,38 +37,46 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
+{
+	int value;
+	u32 stat;
+
+	stat = readl_relaxed(hwmon->base + TEMP_STAT);
+	if (!(stat & TEMP_STAT_VALID))
+		return -EAGAIN;
+	value = stat & TEMP_STAT_TEMP;
+	/*
+	 * From register documentation:
+	 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
+	 */
+	value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
+	/*
+	 * Scale down by 10 from above and multiply by 1000 to
+	 * have millidegrees as specified by the hwmon sysfs
+	 * interface.
+	 */
+	value *= 100;
+	*temp = value;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
-		   u32 attr, int channel, long *temp)
+		   u32 attr, int channel, long *val)
 {
 	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
-	int rc = 0, value;
-	u32 stat;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		stat = readl_relaxed(hwmon->base + TEMP_STAT);
-		if (!(stat & TEMP_STAT_VALID))
-			return -EAGAIN;
-		value = stat & TEMP_STAT_TEMP;
-		/*
-		 * From register documentation:
-		 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
-		 */
-		value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
-		/*
-		 * Scale down by 10 from above and multiply by 1000 to
-		 * have millidegrees as specified by the hwmon sysfs
-		 * interface.
-		 */
-		value *= 100;
-		*temp = value;
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			return s5_read_temp(hwmon, val);
 		break;
 	default:
-		rc = -EOPNOTSUPP;
 		break;
 	}
 
-	return rc;
+	return -EOPNOTSUPP;
 }
 
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
-- 
2.56.0

