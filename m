Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDA280330
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192541; cv=none; b=OHOJ1ORrBc85m6C7v36RTd4iUDfTx+lAuEx59k8AZhMkj2zsjiTm2j+xNljfu9KMny732uBnw0QT3yTt5JPjU19bvB9+ikf8YPzlBLFqZ7tQbrr3/BJPdjZh9N88NBiLHOdXVRUKfQmx4tsD3n3QhPsQOn9J7ua9BeyZ+hGEjDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192541; c=relaxed/simple;
	bh=u8UanGH828x/wa/TE/D0ClcvT3TQ3+GCvwMRIjSql6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYnVqqWItsE+xCiLJsgbS1VMrcHpnNNSWBHf+9eozJTaIIgyDOIJF/owHPZTH1Zox7TMnUZXuW/8BgghO/neajMJKMQNRxZpFO1dXwyh+42yJkjzZbBxcRVeSsfqrtswkd0taQAdztQxsD482kzhFsk7Fmg/x0IIK/VuJJayMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnMpkFdt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnMpkFdt"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f39438187so1385008b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192538; x=1769797338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wgD+Lhq7HXYqBeKTh5vKd8poAoMtNS0Hz8zr8Bfuzs=;
        b=VnMpkFdtCCkWqz8gI1uZPEWjtKAsIA6IJwXIourWANLuXwEiIUbWXAHjB3jG/S3u4z
         KoXWHwShLxSW9nVJAoksvRQbdMATcUD/Hie87RS/YeGvvzlQZ3TXf2EhGRA58WYEkvbv
         z5tDQlXAOjDtG08rGqjDR4gHI5ar0UjpEag8r8vzRX9fmX8JX8kG2mkTzDGYAKdS5H5p
         MmH/43Q7GsAHiF3gRREtuDKjbYc9oaCKqnXmlTTUyA8Hzx3JxWZmVUY1dPv/HUQaD1va
         DYVNadZ1WVwLDImV8YMppT3nBCnfODj0T4n58xWbZ+Y7SqFHUT6QSyUJXoh6VgrwyNfA
         S06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192538; x=1769797338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wgD+Lhq7HXYqBeKTh5vKd8poAoMtNS0Hz8zr8Bfuzs=;
        b=dLCaiomr8gCU/bLZfO1/Gby1DFvNoE98fZAfMOo687UKUVYFWVT+PHo6iu+o/rWl4u
         nGvwr3Hsr+madqUMVoaSTKpLyqoGU/3BBvWAwer2feCumDFyhU250QfNk7MmFy90+8Hy
         6msC6BLruo4Ha27/I+q0NCSmuzXyABnSy3twY2DLZK0tl0P+D+1rPZxnvu+MlUua73ai
         zuZjTP1vpUfSyPvkbF2xwa+D9S30mFFXuoyf2LGLyOr+L48PQQV4e2zzjrloZbiOuhZc
         AjBUVYEPsgtND4+wBL3DOEGgqDayb7wVjHx5aeuLQQQrcD/EtcrB4JFeY2rWQTyfXvTA
         yeYw==
X-Gm-Message-State: AOJu0YwaE2u8L59qste3OlidF3SB4iW7WDBKfSC63C27zVDPRsgOgWYZ
	wINedGE6jE9I9hPq0GIrgCDZ2K9YZ7nZNRNiRtF9oqG8TznNel3K8EYR
X-Gm-Gg: AZuq6aLZcGfbMZHKu+HYGi714448AwvZci2Oy20X1BuyvrU3D4SWAD6uJTI3saOM8oN
	tXttCBkFkmZhqb7PhZAKr6R6z3Ml7b5KYvizrqXahVVL3dL4rSx1nPE+xivgkZmT//C81R8poKy
	vmDrNMHWBd8yWnhtlbNcN/4+feTO2RXXx7ENh+F9/9LiR5sJWY9YK8ZlswxEw4Gu+PWAF5IKe+N
	WXS/atn/wlZZD+Z17PZGyajmiCRkkKKefT+d5VT7vYszPju2+yateIUYDHsfgCNx1WPoHucnB0D
	LkAsJGxQbF5G4lMfUlTCVVrU6lNijjtO8J56fWnaq14viKZNpIp7u+4NEZvf6eASvUBaGHvJRd8
	VLyHGRAyGUE+vVfbXqR3t/Hvh3B5o1xhhHUuNw2kDw0L4ap9dIZljuanZyJN+itn3HsZXgFx2ai
	Qa1K+SrkGfVsO0TVPWhxRIXLqj
X-Received: by 2002:a05:6a00:22d5:b0:7a2:7458:7fc8 with SMTP id d2e1a72fcca58-82317c0fbbfmr3029305b3a.13.1769192537702;
        Fri, 23 Jan 2026 10:22:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871f97asm2759775b3a.40.2026.01.23.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 2/5] hwmon: Provide helper function to find thermal zones
Date: Fri, 23 Jan 2026 10:22:05 -0800
Message-ID: <20260123182208.2229670-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260123182208.2229670-1-linux@roeck-us.net>
References: <20260123182208.2229670-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a helper function to find registered thermal zones
and use it in the thermal notification function.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9e9ad42b6d7d..1f35285ca7a0 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -261,6 +261,21 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
 	return 0;
 }
 
+static struct hwmon_thermal_data *hwmon_thermal_find_tz(struct device *dev, int index)
+{
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+	struct hwmon_thermal_data *tzdata;
+
+	if (!IS_ENABLED(CONFIG_THERMAL_OF))
+		return NULL;
+
+	list_for_each_entry(tzdata, &hwdev->tzdata, node) {
+		if (tzdata->index == index)
+			return tzdata;
+	}
+	return NULL;
+}
+
 static int hwmon_thermal_register_sensors(struct device *dev)
 {
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
@@ -297,18 +312,10 @@ static int hwmon_thermal_register_sensors(struct device *dev)
 
 static void hwmon_thermal_notify(struct device *dev, int index)
 {
-	struct hwmon_device *hwdev = to_hwmon_device(dev);
-	struct hwmon_thermal_data *tzdata;
+	struct hwmon_thermal_data *tzdata = hwmon_thermal_find_tz(dev, index);
 
-	if (!IS_ENABLED(CONFIG_THERMAL_OF))
-		return;
-
-	list_for_each_entry(tzdata, &hwdev->tzdata, node) {
-		if (tzdata->index == index) {
-			thermal_zone_device_update(tzdata->tzd,
-						   THERMAL_EVENT_UNSPECIFIED);
-		}
-	}
+	if (tzdata)
+		thermal_zone_device_update(tzdata->tzd, THERMAL_EVENT_UNSPECIFIED);
 }
 
 static int hwmon_attr_base(enum hwmon_sensor_types type)
-- 
2.45.2

