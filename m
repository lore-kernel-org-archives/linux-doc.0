Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753481;
	b=bcc6DeR8rXH5wmAsMO9wsbF0IvXvtVtWCEM/KLJE4dc6y+gPy3YRNF8jfHN2cgYI/GII
	 fou8aUm3YofwgKk010g8zQpyjv6/7zbtf7q/Q0Cd7YrJatFUkw7XaxbbSnz/xyNvRoyl4
	 BL8jduBiZ2CH+5XQ9hH2o62aXYe92RAgux1JrbR1X0l3HQwno3nq+LHfKj+533uRZqgRy
	 GKj3ba3iwMYc6I1r+yXZWPEkhoncypbWRbNXjyk9tSZA15qlUYTAJkfuRLjtiF1vmfB75
	 jYFTnyTiMVoCQzB2CMtPkqzBVEFy4y0N+Rpxla+DCYlOj6FWFwD6mQFO6EYgXvwoRqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
	b=VH2MJuiQjuE7PlBwQtBwy9We1CqFJyE5mQvwBYf4ZLc+6IxNE0jv54EnlHOLRhnkgs6r
	 AACCE9N5Uu4aDsB1FbP5EhmVqDZ7gv1JuaTkvVGWghfcz3UV26T8OywvnYmMEuee9QgiW
	 pL2gsaqvlhI7wLYjgfyfGiydxewuYxcTwhs3rlo22Mx7VQ1+F7hkE6OewuOKIYoFMso+2
	 1JQfiKuip9DfcPy1Rmuwr3I0ZHgTh323Fdgka1+ZkBbdeKR9BN4QGFbg6haAMKIhYMQH2
	 UoeS2kl8AmbCDUMfqFxw2fzDxj7FrNTCrJ22ZK7VEG4qyKGeJSOR3gLwj0a2Qrc5acA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SA7w7fjj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD958606A33A
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 14:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD958606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SA7w7fjj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so15959055e9.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753479; x=1795358279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
        b=SA7w7fjjruQZnf4O5mdcIdBHyaqX5GaOq4CquECmWjYzqFCzAZD4IGGfm/ivxkzNUt
         RJfnocz57Jma8fkQsD6xB8yEDIQt/+555ogJpLLHFwBjxq9t547frWhbrGtSkaoPzq5p
         hAZ40tR8I0/eiVWnZv17F7p6RgHqVYtinebAcdLGeWrnzC0DpaSJqPbNk5bBq35pi4DJ
         qvZH3qG+xylsYGOVXzMFZMKmxdGfNbDAyb8daZVkhmpzzW/TXNQ95Bqr1O02TvOpIOe9
         Un2VDrhtePUTYi8C1vfTepx6SMkNdI0u/cEeNfA8TMyyXYFBIRLwQbVIFGDj8DwQju01
         +mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753479; x=1795358279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
        b=QUdRDNVw1/Uo9WZxi6VEL+8prlRQyTrrJPZk4dgOZGcrQMXGplXCqv8FWEroP8VKAl
         Mpgma1BmcSE2mw8Weq4vlsdUSacBTi7g2TKRHlNxtohsf+opXR/r7po3QqNrKGQNuUsx
         Ghxj5z3BLgKd62RRSAbYIsm7HmI+F+e+aYEhwDdxi2xBoijDCTzMrOPxQzbOb0gzQsjh
         bsVaq5TpzCp6psYP/3QXrRCXyNig1L5EUWX5Z1fYNOwnZHuO+Mw9/vSWgD4uOdcpWyxB
         zJ/HouSUQnuEt4aPWMrMjDqtfL0fft5D5mT0oVkZJDfei9+TXecr3dKVD8PpZ5tiDh0m
         RB6A==
X-Forwarded-Encrypted: i=1; AL+hErFo3K36adGZxtl51db9Ee8oarSjQDuCP7pt/OvmDoWSYYes7HrI673l0KS2Rkv2nUyiSWp6Xe4rRvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rge0EMU+nRTL16Afw6R0STjPrv4v1Y602k3Dju3pbM/btvnQp
	T4PSxkh+vaRbldhl3P8EBsgaHkvwRfArt5nQmRFL7h3sohGpAZEa4tiD
X-Gm-Gg: AYBFou0lXSoMSa9DIZekYzuG/Y+eT8j3PIbygCXBQmi+HLiVjLJfzYaezWRd9dTnCKo
	6NQN3xRFPtkx1kTy3qjDxbnSuTVM4GrQTzZtTSEemxM+WNUmMGZaF+nnhBIl4OrJoD9oAtVcl84
	j+Xx4tq/Q5ytd7aMUd1Mkw6YuypwUCeErj+jDxsTxNY7tTJuUxozU3BZCvCYOspczekeJBHq2Zi
	rAhw2fnpTzpp1oyonoCR0tzxN6gnGDcWfMzSgZXgA9k08hMew7LEXKqfg6dEZdwNm/KGnt7bPeI
	/0YipIXuxpTC8LfdJC2+O+jM4DQX8qXDExM4brHxK0XCDSk1l+C7nGOmq4NXCwxyKOW6Ph06KQm
	naa4AIBSwRyJA1vsC5i3Don9PvTNOM8P+Kfc46BwZM0CizBtTmmQZvmzjKcBqBTMGulbO6EQZmq
	pJJ7cK50XMXnxw6Zq5fGSjvhlQ2gNW5QWYmGqoa9h2sp/JSwiv4V3q+g+s6DI/mdUFbA11aiXME
	hNJdUJu9qK9kP8uUYL+cFjDVLULNrrifPmM22z00I6GTofU3RxMc8LtAi2Na5C8yz+obLhsgaSp
	cT5MmxAl0gtHog7ShZl5TXdjoIUVXs62xaCWnIAj34TIawBPmCssGv723L4r8vjxTZXsiMjjBH0
	o5KMDlUEUdSLMQzw=
X-Received: by 2002:a05:600c:6099:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb55a753f8mr160792155e9.18.1794753479132;
        Sun, 15 Nov 2026 06:37:59 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:58 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: John Roden <jonathan.roden@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwmon: (asus-ec-sensors) add ROG STRIX X670E-F GAMING WIFI
Date: Sun, 15 Nov 2026 15:25:40 +0100
Message-ID: <20261115143708.492883-4-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115143708.492883-1-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
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

From: John Roden <jonathan.roden@gmail.com>

Add support for the ROG STRIX X670E-F GAMING WIFI model.

Signed-off-by: John Roden <jonathan.roden@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index b3a061bd10db..fb7704c46d8b 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -50,6 +50,7 @@ Supported boards:
  * ROG STRIX X570-I GAMING
  * ROG STRIX X670E-A GAMING WIFI
  * ROG STRIX X670E-E GAMING WIFI
+ * ROG STRIX X670E-F GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
  * ROG STRIX X870-F GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index d86f3614d557..d0c01b825377 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -822,6 +822,14 @@ static const struct ec_board_info board_info_strix_x670e_e_gaming_wifi = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_strix_x670e_f_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_x670e_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 			SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -1035,6 +1043,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x670e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-E GAMING WIFI",
 					&board_info_strix_x670e_e_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-F GAMING WIFI",
+					&board_info_strix_x670e_f_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-I GAMING WIFI",
 					&board_info_strix_x670e_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-F GAMING WIFI",
-- 
2.56.1

