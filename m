Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16B3AE19E
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283024; cv=none; b=LVOeEJBQghr7ugX7EQgEbz6Vc9vR0Ub4Bd0ooD6f9KYHtpKw1SYy4xbFbYPpReJCG0DIKoIt9TLWHWlovbDmWth48L1JYbQeqhyu6rPwhdNJAelGLXNbmvtujlUlZW0262ywWWYRUUHHzTv6P1idcCibrcJLnehBxZQqeUvd32c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283024; c=relaxed/simple;
	bh=ap0TrLyjgL2sHrt4HcatBHHq+Od3Rz+PN6mfF8vT6OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9uxxU+9/fqjByvnE+OnMRgOydx+KK8ZubhfYhUiWc2w7Rrki74MPfkjFJLqp0w4XRSjktCh7yqrzQGwwA+niP9YSIsE7WDHMzWXQVLssKE72h17sKlU/F+WeInPSR1Xg09ND3CtRm8yYFGH0MzWlBnbtRDSx8Yz08kTQP8dYHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2pazn/u; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2pazn/u"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c73e9e4cdf7so1175259a12.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283022; x=1774887822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Yg9JRwDdYyi8Z4scqEAFpoKv7+Tyn3lIsspw1t1xcA=;
        b=e2pazn/uNF5OhsY7oG3bS0ui08UWYHaza9ImGghm7v2B/+x37H5dEpYDrqVa5LDxis
         0NbI8d/Ryd9Q3VKx85OOVLkbwwSSTy2RE/QJSB/b5PPt+eUR3FX+Qw3AGrIjUcwAH8qU
         1tHEBdamFJBjUza2xe+XsZ2N5rpJa/cUuWHobXVsraTPlhXvXMXf3oKLfhQ/+ambIGo3
         sk9IDt3jT8zWNC7kKLt39Vw19QT3M0tOonK+29+UwQgUCa5UW/a3PStOgOM+E/V+8hwz
         NUUB0/o+Z/smqW21cLhEVp13eY+2kIAnoloh8CnGxdMwNf6s7uLsKFHs6W9KjeYY9vPq
         aKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283022; x=1774887822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Yg9JRwDdYyi8Z4scqEAFpoKv7+Tyn3lIsspw1t1xcA=;
        b=ijSWAdT4DR2/9UaHnjG4NykyTHHceoEaTET1pAbE3OVyPS450gCD5uOvyEQNJjjSCI
         tBM+6B6+pN5FGX16/id/dnweRl9gNpWIosAexbzZq+OunrAN8kqPmxUEsvITvMiIoy8i
         8XtJiqBqEq37KGFxJa2HZbw3KWcQDfr8MWIsrEji9/IulhVi6yMy1cAl2tQt2IgwCtzy
         8Y8vKgwvCVlr9xmz1IBVZseNY4U/WcMgS4mTtcnleT77sHOzAhywXey9vmOUdqE9ILaT
         68JPbfK0PFV6IaF348yIXxIh6iqVlG5KkYS8EJ1WHqG/KSkvzop7gv1+ZxBco19x5o6A
         216A==
X-Forwarded-Encrypted: i=1; AJvYcCUSKp92MBkpaWIB39+UhtBQeiRvTAKZhW87XfCd39EFYlKleNUNsPpnhUXkkoN8CkSXyOUJpWo3xVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNEVmrU0il154JH/3ftVJWOoBS5vdbsnFxxbcfZk14rDrRUz8L
	faluaRBS8PyN1XIzI9mYqyq59gsoaMPujE+Oz1pYlH9IQtSekMkJ2tog
X-Gm-Gg: ATEYQzy0qkDZdxRrWjkxKnOW9Fl0XaU3DwfDHLoy+6Q/5ae49xUsOFGRQ11W04GeW4j
	i2wV2QrRxg3xGs44N1VDrkAk71RBBlw2tYjTymZDHa7TtlLl1T6G+VCaha5am3HT3wGB49mpdVx
	j9THRjgw6rpN9qMB854lLyOVFLg3ThGJDcyX52u563GIYOGuLrjUBaH0efx0XtpF1TeLU5/4g1X
	SuuO9UDoweAjtLdfDqZWCnMc5TGi1tnysHGaiLkc7vWV/Ap8DBI2/kLXKiFMaNj8pNnX/6iUuze
	amQaBjoamZqYA46jUAqfweRHSDt3WnfUa4BWV420rBIDTOluhDxK11C1eXUuUOatM7qhyOt7ArG
	CQOstINtbZ4ovSWzfzAXw196Xh7eNxaUqhGYM39mTRLah2zyknK/foAdq6CKj3QQEewqCuk5HaU
	CsI3F40pUrzNlszIaDp8FxT+nQ52hKck9YbtoZ8ySkOgOsDPn55cpX1VUx8kXEn93qzhwNGAKZO
	oqYQ6nyRXbGtqGj77MQh868PNeqsB5CW92CT1lm5RySC9EUu7rN
X-Received: by 2002:a17:902:e54a:b0:2ae:825b:49a5 with SMTP id d9443c01a7336-2b0825bf592mr123540375ad.0.1774283022083;
        Mon, 23 Mar 2026 09:23:42 -0700 (PDT)
Received: from lakshay-piplani-HP-Pavilion-Laptop-14-dv0xxx.. ([2401:4900:81e1:cdf2:5b00:592f:5488:918f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm118477755ad.2.2026.03.23.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:23:40 -0700 (PDT)
From: Anshika Gupta <guptaanshika.ag@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com,
	Anshika Gupta <guptaanshika.ag@gmail.com>
Subject: [PATCH 3/3] hwmon: (tmp108) Add support for NXP P3T1084UK
Date: Mon, 23 Mar 2026 21:52:52 +0530
Message-ID: <20260323162252.15508-3-guptaanshika.ag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
References: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NXP P3T1084UK is a ±0.4°C accurate digital temperature sensor with
a 12-bit temperature register, configuration register, and alert
functionality over I²C/I3C. Its register interface matches the TMP108
programming model, so the existing tmp108 driver can bind it without
functional changes.

Add "nxp,p3t1084uk" to the OF match table and "p3t1084" to the I²C
device-id table so the driver probes the device via both devicetree and
board data.

Datasheet: https://www.nxp.com/part/P3T1084UK
           https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf

Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
---
 drivers/hwmon/tmp108.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index 3ea5f6485744..db46961a31d3 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -538,6 +538,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume
 
 static const struct i2c_device_id tmp108_i2c_ids[] = {
 	{ "p3t1035", (unsigned long)&p3t1035_data },
+        { "p3t1084", (unsigned long)&tmp108_data },
 	{ "p3t1085", (unsigned long)&tmp108_data },
 	{ "tmp108", (unsigned long)&tmp108_data },
 	{}
@@ -546,6 +547,7 @@ MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
 
 static const struct of_device_id tmp108_of_ids[] = {
 	{ .compatible = "nxp,p3t1035", .data = &p3t1035_data },
+	{ .compatible = "nxp,p3t1084", .data = &tmp108_data },
 	{ .compatible = "nxp,p3t1085", .data = &tmp108_data },
 	{ .compatible = "ti,tmp108", .data = &tmp108_data },
 	{}
-- 
2.34.1

