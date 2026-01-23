Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87B26E6FB
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192541; cv=none; b=sm0tPbb0ybFEmyl4i3ENWrD6Z6FjTNDHcuIU672rHC0PKXNjgwGYSGHpVahg970LFp0g2tp4xir+5gNEnjniB1KVdsG8WTjYPdm9A9SiisOyjH6Qd09bK/yzHJRadhtADvmuBiULbvnhjXDCve/13BSou25Id9kd0hRAkHQx7Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192541; c=relaxed/simple;
	bh=SIVuQucr0XUIbRjwS0Nu80xS1m3kZ3OXWbHv6X+sf9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXRYsyzVDouhGf0KZ5KrviW2UipmR7tG1UIuzOFE5ieaY6ofvdaPVl0E8eVVhOcDPYWZb1qIKXi09M8XRvzQR1pCDcvKw+sK3brShu9DPw5I/9WlGilM8Yg2ZbmbRTlEbjpWnmb6rmOCTatDG02OKuRMh2CYY0GqwEbQxEVJFMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im4JyzYT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im4JyzYT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82307c6902eso1082972b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192539; x=1769797339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKM++0ITaCmDLPaI1GObBl9/EOl/aYbw0SPRuuisulc=;
        b=Im4JyzYTdISApslmzIeaKSzYVrb0P1/35xRULrzILzBqYy7L7EvTujaL7fi516pAhi
         JgCqaL104H+KYc8nyo1P677feR+xFmDjUOgxkQDuk74hU9MuY6lotKm5CvX3+lagu8MF
         Vo09dsyAwqapItulJmSgceQ8smvCOjfns2RyesQ0EUeQhP7S1KovfuuJk0pFWdF4ojOg
         DQY2A1AzJxv7uONcFdCyq+y1oagiQPSlynXr/9jCOvhYUZeAY7hGQM8gAbjaxaUwm4zN
         BRePxFztkta+gk98qBRUo6qgIP3PIopa4LktS2gaaKb45cX7SBQxwWMEYWWd6cTA9eRt
         0wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192539; x=1769797339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKM++0ITaCmDLPaI1GObBl9/EOl/aYbw0SPRuuisulc=;
        b=JqGMQwujRnnRvXvT0JLgA6vX36qFjxXvBbPONVoeM4WXSFkru02uhwk/FaXilw0Eoo
         6+V39AMYWg46+jAQCPoTyl+h2fcavzn0j12j56Pa44l46JGrkn3p0OvF6ITnJBPjODSD
         9lvlBMuSE4eukAGtTZHo92NCK76B0yWCuvWLoJ9pRIRCoScy9LblIyqExiaJwbLmyp0Z
         RZIVq07jCDMK87ZMu/VcwXv0z9ix7cYtxuK+s0huEkgj4dgYwWte3KB3mr5cT1177LcY
         WXH4dJnWeAxmbYzTBSOcSHKxBExbQbCdSBaynxRSU7UWM77LC7cFLpGQ/NT3GFeKQM60
         oFoQ==
X-Gm-Message-State: AOJu0Yz5bkOoWbnpjAZMh5BUMu8iu7oWkim2aVJFSpqJeQ0ecDaw+Pt5
	dgXb7cAAFz0UjCizmnuVhX4aLi2xlTalVNtHUAfFe0NaYJE8RP/OlQKN
X-Gm-Gg: AZuq6aLLuQHz5HtxyiCdcF42bzTvABs1tQ8vFnLPvJnJpylF8AVdeZewNnK2+7XcNyV
	pu+PRj8hx1R8F53eB2ANGlPrHJ4LQvyvpdn6MkRu9+dT8X15hjMF+gkIMQJckJL4bWWZcrgnqDD
	G6o04wETRjjqaUO6WnGNV0wC7A7CDuCUfpI0Fs4LxmGUhh4aU1kVTYL5FMZOAELaMisj6ov6NcM
	1JLEPP6kiBnW3Sy4RkLgfIJRIu9s87Yf42eXNMhfXKkR9O9mTYlGH15tyuoqZvRxtw0uja14GWl
	tiJcWppIjFBQg6760HqVEE4syLyZNKZ/8ve87bIa30byjG8tJuEIFyxWOzviWhhOIDQfZR2CPxn
	wFEsW9P1BK36baF5pkbd2pQBPRmqkuwxDFQ83D1zDeTUkyzBHd4hfm9BObPjVyGvvDv67pBJmmE
	osOrGd7Ini8o46qWJB+AnTSK9e8hal/XbMy9c=
X-Received: by 2002:a05:6a00:1c9c:b0:819:5db9:6ac0 with SMTP id d2e1a72fcca58-823216f72a9mr1820886b3a.37.1769192539277;
        Fri, 23 Jan 2026 10:22:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318663d82sm2792223b3a.21.2026.01.23.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 3/5] hwmon: Add support for updating thermal zones
Date: Fri, 23 Jan 2026 10:22:06 -0800
Message-ID: <20260123182208.2229670-4-linux@roeck-us.net>
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

Implement support for updating thermal zones. This is necessary
to be able to handle updates to sysfs attribute visibility.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 1f35285ca7a0..cb89218a0b6a 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -276,7 +276,7 @@ static struct hwmon_thermal_data *hwmon_thermal_find_tz(struct device *dev, int
 	return NULL;
 }
 
-static int hwmon_thermal_register_sensors(struct device *dev)
+static int hwmon_thermal_handle_sensors(struct device *dev, bool update)
 {
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	const struct hwmon_chip_info *chip = hwdev->chip;
@@ -294,22 +294,42 @@ static int hwmon_thermal_register_sensors(struct device *dev)
 			continue;
 
 		for (j = 0; info[i]->config[j]; j++) {
+			umode_t mode;
 			int err;
 
-			if (!(info[i]->config[j] & HWMON_T_INPUT) ||
-			    !hwmon_is_visible(chip->ops, drvdata, hwmon_temp,
-					      hwmon_temp_input, j))
+			if (!(info[i]->config[j] & HWMON_T_INPUT))
 				continue;
+			mode = hwmon_is_visible(chip->ops, drvdata, hwmon_temp,
+						hwmon_temp_input, j);
+			if (!mode) {
+				struct hwmon_thermal_data *tzdata;
 
-			err = hwmon_thermal_add_sensor(dev, j);
-			if (err)
-				return err;
+				if (!update)
+					continue;
+				tzdata = hwmon_thermal_find_tz(dev, j);
+				if (tzdata) {
+					devm_thermal_of_zone_unregister(dev, tzdata->tzd);
+					devm_release_action(dev, hwmon_thermal_remove_sensor,
+							    &tzdata->node);
+				}
+			} else {
+				if (!update || !hwmon_thermal_find_tz(dev, j)) {
+					err = hwmon_thermal_add_sensor(dev, j);
+					if (err)
+						return err;
+				}
+			}
 		}
 	}
 
 	return 0;
 }
 
+static int hwmon_thermal_register_sensors(struct device *dev)
+{
+	return hwmon_thermal_handle_sensors(dev, false);
+}
+
 static void hwmon_thermal_notify(struct device *dev, int index)
 {
 	struct hwmon_thermal_data *tzdata = hwmon_thermal_find_tz(dev, index);
-- 
2.45.2

