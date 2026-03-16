Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16430384256
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650414; cv=none; b=qizpr3fYx40HM6gdj0ILIhcTl6UtldbOjpfVTFjzhSnKay87eb7DzqEnMlZPB1ol2yYgI+8E99ni13FPjIm3SseRmZXF8SKN7q6R92dUyVQlaAzPBkqm3jIdSW8rORggZ0sMuY9gS3WR83bwuUfKu+UHoA4rpdKXVNcf4NXZKpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650414; c=relaxed/simple;
	bh=9FSuapwL6VYJkBDXuygJF37yB4ZM2TQecc51n0jy4uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rykQV3aWsiQI+YANs4utgjuzfwHWkSjqzvp6BYBbexRLE82qQZJLQoEXuIzQ4VM3AlX82sTksLmrsJz+EPNHZTG5VAU1/OaXtCNSqtFOEZLufkD4cbGypIkGCqcWZvGwXjHjCogQssbv5yE/9hxPXBySbezyErRTo0oZd3AwXvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTcYbblg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTcYbblg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ab077e3f32so19380765ad.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773650410; x=1774255210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUrKY347+cvTpzMzeKy/hfhwRp97bHtF1nhnnAOOMMo=;
        b=FTcYbblggEWkAtHJZD0mJ415sC4SxzLXZlV483cMyiEcqj1yqogsTXfoy2LYwACX+J
         N4KOumKjH71qMOxjfUnwvUiDA6qZMTvqyafnCPRlqswIcjPeOlh2R90ENIu3zukYvvZN
         Z0qp37Z4o3p2qz0vCHP/6csC/J+jZNc31oJshkbBKNuV63IMRu7kvbiziH4fN/0Ubv3m
         MyMNoEhxprIX6Yxl3pgzhS8TUAiPP0p/uHe9gl9fBtSoCMae9z5MEKF9/1kmvYY6Z9Bs
         YG+2QovSFYAqwSY9XPI2ujLdJW14BliFU+ivqxjqfiNfG7ke4tQ5X2o0TbK2JMoskf1S
         V0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650410; x=1774255210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OUrKY347+cvTpzMzeKy/hfhwRp97bHtF1nhnnAOOMMo=;
        b=Z0YCoB/padWS8boAvQmAFA+ls/KEbjOM7qlv5DsDqK/G4NqS8U4AbHZfEYk6JOYZvj
         1uBorwE5L1B4NEcK9dmxQlqDpW9cPtCgrYThTyv4xThjq9k9lGnuGKKbRLYsMvkx5WJw
         ZO2ifvynUhNCCGYr0kcSdEmXJsLqkU4S4NO2cxxGmoxosicNO46+XFnN36cqNUGA/H2P
         DoU9OehZihQgAtdjrBzoVQ6H7pKc0o4XkXafGczm6fLBS1jmVhiQBzeY52asqlqrhaU+
         zr2H5WjGeXSasgPhr5QNlZoc5ROsNm3RC0Y66BJkjwhzJHYZ4wrQTvLQIzASSfNJ9Okk
         4GAw==
X-Forwarded-Encrypted: i=1; AJvYcCX9BnKchiPVaY6BxZYQh4KPvUz6n3+RRJ3JfdOC52eQ+9h4ShCWP4GDtybZFmyFXhSuF8jio3Y/2Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lIfIfeeJbFafqA3eG4BUoPdKcR9vYm1C5h497wy+SpHNCNPa
	728Ff0Vx95D0txo1ruQy9v09ZXztlqVfd9po1iIOxEC6rsidWXvsbxNR
X-Gm-Gg: ATEYQzzc6uruk/Phpb/kVPCi4P9WD3WSxZtHmYH4QX8sJlbVtTyoZnTGHz12JgDIGan
	lB6Qmd83ADG3bmiVr0E74rVCEjsgA9qXvvt7oD+FboDYmROMaKewkAkQqVGzd1PTD8G139PKPJq
	6is1RNdKnwvBeemRAtWec2xX3+YKU1ggA7ZqT+rk7LTPtPtrSYmGLCI69fPNwrny/Pg7vwAO2uA
	oVOBmKz4II8E6dYJ/LwjFg+nyiyGEBTtYJjT3BDrgBxhihjXAiSM3Zp6AG3JMO2/5lYl9hzVpZh
	dDREwkD9mbyglHqj2mhPtoHa2NRVcKLnMWDOmmKgBZb6GwQM3/SCqZ21dGiZhVk/ARvf6iCTZa+
	aJi0zXk0bmrZXplYRKB/xGhD0rwlyYgbnWhuFFXezBZSIyVpFl/36HkFj331aeCabzKn066IJzJ
	30Rx+E3hapAJ1cF1X3YYE=
X-Received: by 2002:a17:903:3905:b0:2ae:a70a:2af2 with SMTP id d9443c01a7336-2aecab1ed76mr139356135ad.29.1773650410229;
        Mon, 16 Mar 2026 01:40:10 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0537b663csm45946865ad.51.2026.03.16.01.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:40:09 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 16 Mar 2026 16:39:34 +0800
Subject: [PATCH v2 2/2] hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 chip
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-add-q54sn120a1-q54q54sw120a7-v2-2-60e6182cc4a7@gmail.com>
References: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
In-Reply-To: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773650402; l=2286;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=9FSuapwL6VYJkBDXuygJF37yB4ZM2TQecc51n0jy4uk=;
 b=Huug8Dk3UF2dSWSD4aGaQRdhri2+VHtZ6act3ArJCqCRfIcwBTnyjtymCejwNJNQrSn2wBDD5
 3xfUpJ6e+pVCqG2uUY8GjrI3FoLxOpq66Rq/C+6WHcynyd9a0AeAFpX
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add the DELTA chips Q54SN120A1, Q54SW120A7 in q54sj108a2,
1/4 Brick DC/DC Regulated Power Module with PMBus support

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index 4d7086d83aa3..06f9db4912d7 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -269,6 +269,8 @@ static const struct file_operations q54sj108a2_fops = {
 
 static const struct i2c_device_id q54sj108a2_id[] = {
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sj108a2 },
+	{ "q54sw120a7", q54sj108a2 },
 	{ },
 };
 
@@ -278,6 +280,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
 	enum chips chip_id;
 	int ret, i;
 	struct dentry *debugfs;
@@ -314,8 +317,12 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
 	}
-	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
-		buf[ret] = '\0';
+	buf[ret] = '\0';
+	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0]) {
 		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
 		return -ENODEV;
 	}
@@ -325,7 +332,10 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		dev_err(dev, "Failed to read Manufacturer Revision\n");
 		return ret;
 	}
-	if (ret != 4 || buf[0] != 'S') {
+	/*
+	 * accept manufacturer revision with optional NUL byte
+	 */
+	if (!(ret == 4 || ret == 5) || buf[0] != 'S') {
 		buf[ret] = '\0';
 		dev_err(dev, "Unsupported Manufacturer Revision '%s'\n", buf);
 		return -ENODEV;
@@ -402,6 +412,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 
 static const struct of_device_id q54sj108a2_of_match[] = {
 	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q54sn120a1", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q54sw120a7", .data = (void *)q54sj108a2 },
 	{ },
 };
 

-- 
2.34.1

