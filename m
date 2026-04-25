Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB237CD2C
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121697; cv=none; b=eIev8ostJADRSlnhbuDH8a5JBymBt45CIpkLYQtf+7oA1r1FdU2GL2LIcJAUgFVENbR7C9MzHWY0ze9xz7YgvLmjNCQkOsOL9d0xb4k/MiqCla/Px6qQ5LUCCWGeIBZCDafwm4SbzEGSdXAwTjQF/ZMwO8E0YV3shBdWYi/Xelk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121697; c=relaxed/simple;
	bh=os3bytxGw2AOC8T4LmbMOxb3v9WrfYXIrI2AmuC6D7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yd2uLvWjIQD5HfumGLZPy4K1BOdDUGSmYHqq5tp1+SKVuik9L8/rO6z9hYmiXKjloIRaSEmvcV/98TseXHqYlEEtE9p2PX1iVIW9KX91LFQyVquPFPfGCIPIvHx1xQJnGnN/tUHTBIePig63T4BzLE+/5LKsQ+T7Qa1LWjPbA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiTns9ZR; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiTns9ZR"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso78094051fa.3
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777121691; x=1777726491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INZTHDtHLu0hLsiQAV4hWhdKZ29geUdagZMSnUDNr8g=;
        b=IiTns9ZRAfG3wTFDcgGbF3Zast0cvspVDYk1f/LThMDGDBrV+3iJHUZgDOpJ+TfHtl
         giSi2niMe3oBmvzvUeHA3julqD1x3j471i0i8x/WW6n7lSALRVUqmYQCjeeN9tCc+h9l
         GE4FPQDQI+GeQKmLr/zR8pjJOGTAPwtW67mj0Lm7Dsl/XjbcikBn4ifCDTbqbwWlyaaM
         Sl46Yr2/seaU4pOWTibQK/7Ux53YPPs35eeVWpF+ynZvlR4YbQWvB15EH/7NrqV6NhQN
         t+ic61PLvTrRbKuxakUMRoU0llkDVCHCAKBBuKtd5dknaephRgqNbgv8BPuVtNhCUo7E
         /fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777121691; x=1777726491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INZTHDtHLu0hLsiQAV4hWhdKZ29geUdagZMSnUDNr8g=;
        b=HBwSWhRKJwW/KO32HK0gqW+LtoJWIsSibzCL99IBihVQdH9+xfEXSke9EcGvt2zgxm
         r9qnjZX2QnU8I2KwsFi+qyNi+SB9yBmtGIm7W9Oeoj+C5MoARPnftshpiXMcGzRhcTGZ
         NC/0s5bkpviyjVw/jqvVm+SKHr8uM/ayGTLBMhzn/Kmb3eCMdpwPa2aDbrhCk/C3Qnaw
         9m8C8UNx6aPwBnj5GkpdEI4hf2Mom9TAq0ZHRF3hj+Fkt1dmn43LqivKtxC82JrHpxZW
         +pL3qbhLn6h1n91t0lWiHXkhKFVDRlGxlqXAAct2mB1OAzye97HTFSP2aCwczGeD7Mww
         F4kQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KoFZo6+dkdTuSIliHDZO3xPEzG0BqY4mH2G9/vMYtplNvYc/Hwjj25FzokOosQ+LpH43HK/Mompo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbyHwcnzXkN9vK8i+90M5jWr5GXFgwisfH8T+nlr8Xl1gIBrQX
	sJpQl9EsUq3V8fEsVLz6wmr3NjxLnqa9IqCSeyC8bNcIqMDXGyjKCTTi
X-Gm-Gg: AeBDieslZzAxfQy4X6H148NlI6/YJnFEURpeZusO9iabSVt/k7HCm/nTS33+XRkYCPx
	eqgQWW3aGFRl1Q+4Hnoy0bGrZL6K8JC0CJc3vHJO0GXMavl4hG/KMpDtW85Q9NMYiCn32DJP7sE
	UAsJ5XV5S5wYJRnEUP8dmA1krq78DtgDdRKOkmVHJr1tRMqbLvhKfC0HXahR24l196HgRgeFWxZ
	eYXjMCW0D4A8rFrMvkmTvcT3SbKNKN2DFVLHA0wX28iSV7zNLV/hQifbmwl8gLZLcWMsxdJwgYh
	cHMrlRmIWM4hIDH4lqb6D2Yq1f3XxI81thJEyOfSXGvE85Td4PiNd633ZkiZI9lFj89QBw8Ezag
	qLu/21pzWzR61FbsIHox1SBx8bIp/trXu/vgI7/IxR6Bmx7LMQ3i4R4gB2PCN0ia4Q80EgayEpj
	rTVrf2lxGEvG/V04LsCW7TYj7RZrR7OcGiNg==
X-Received: by 2002:a05:651c:420e:b0:38e:2aa7:3984 with SMTP id 38308e7fff4ca-38ec781824cmr101464481fa.11.1777121691174;
        Sat, 25 Apr 2026 05:54:51 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f6b20sm58334271fa.18.2026.04.25.05.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:54:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 2/3] iio: tsl2772: Add support for Avago APDS9900/9901 ALS/Proximity sensor
Date: Sat, 25 Apr 2026 15:54:28 +0300
Message-ID: <20260425125429.65154-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425125429.65154-1-clamor95@gmail.com>
References: <20260425125429.65154-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Avago APDS9900/9901 has a similar register layout to the
TAOS/AMS TSL2772 but features a unique set of configurations. Add support
for the APDS9900/9901 into the TSL2772 driver by adding the required
device-specific configurations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/tsl2772.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
index c8f15ba95267..9ba8140c8bc1 100644
--- a/drivers/iio/light/tsl2772.c
+++ b/drivers/iio/light/tsl2772.c
@@ -127,6 +127,7 @@ enum {
 	tmd2672,
 	tsl2772,
 	tmd2772,
+	apds9900,
 	apds9930,
 };
 
@@ -221,6 +222,12 @@ static const struct tsl2772_lux tmd2x72_lux_table[TSL2772_DEF_LUX_TABLE_SZ] = {
 	{     0,      0 },
 };
 
+static const struct tsl2772_lux apds9900_lux_table[TSL2772_DEF_LUX_TABLE_SZ] = {
+	{ 52000,  115960 },
+	{ 36400,   73840 },
+	{     0,       0 },
+};
+
 static const struct tsl2772_lux apds9930_lux_table[TSL2772_DEF_LUX_TABLE_SZ] = {
 	{ 52000,  96824 },
 	{ 38792,  67132 },
@@ -238,6 +245,7 @@ static const struct tsl2772_lux *tsl2772_default_lux_table_group[] = {
 	[tmd2672] = tmd2x72_lux_table,
 	[tsl2772] = tsl2x72_lux_table,
 	[tmd2772] = tmd2x72_lux_table,
+	[apds9900] = apds9900_lux_table,
 	[apds9930] = apds9930_lux_table,
 };
 
@@ -289,6 +297,7 @@ static const int tsl2772_int_time_avail[][6] = {
 	[tmd2672] = { 0, 2730, 0, 2730, 0, 699000 },
 	[tsl2772] = { 0, 2730, 0, 2730, 0, 699000 },
 	[tmd2772] = { 0, 2730, 0, 2730, 0, 699000 },
+	[apds9900] = { 0, 2720, 0, 2720, 0, 696000 },
 	[apds9930] = { 0, 2730, 0, 2730, 0, 699000 },
 };
 
@@ -316,6 +325,7 @@ static const u8 device_channel_config[] = {
 	[tmd2672] = PRX2,
 	[tsl2772] = ALSPRX2,
 	[tmd2772] = ALSPRX2,
+	[apds9900] = ALSPRX,
 	[apds9930] = ALSPRX2,
 };
 
@@ -530,6 +540,7 @@ static int tsl2772_get_prox(struct iio_dev *indio_dev)
 	case tmd2672:
 	case tsl2772:
 	case tmd2772:
+	case apds9900:
 	case apds9930:
 		if (!(ret & TSL2772_STA_PRX_VALID)) {
 			ret = -EINVAL;
@@ -1367,6 +1378,7 @@ static int tsl2772_device_id_verif(int id, int target)
 		return (id & 0xf0) == TRITON_ID;
 	case tmd2671:
 	case tmd2771:
+	case apds9900:
 		return (id & 0xf0) == HALIBUT_ID;
 	case tsl2572:
 	case tsl2672:
@@ -1898,6 +1910,8 @@ static const struct i2c_device_id tsl2772_idtable[] = {
 	{ "tmd2672", tmd2672 },
 	{ "tsl2772", tsl2772 },
 	{ "tmd2772", tmd2772 },
+	{ "apds9900", apds9900 },
+	{ "apds9901", apds9900 },
 	{ "apds9930", apds9930 },
 	{ }
 };
@@ -1915,6 +1929,8 @@ static const struct of_device_id tsl2772_of_match[] = {
 	{ .compatible = "amstaos,tmd2672" },
 	{ .compatible = "amstaos,tsl2772" },
 	{ .compatible = "amstaos,tmd2772" },
+	{ .compatible = "avago,apds9900" },
+	{ .compatible = "avago,apds9901" },
 	{ .compatible = "avago,apds9930" },
 	{ }
 };
-- 
2.51.0

