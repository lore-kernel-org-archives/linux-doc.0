Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC377EF12
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706656030; cv=none; b=eQYDEzkBLNST8QG7sRmIco0ueNhWuRWsID3yHA+9lQWDRqN0qqzwt9eeAWkD66pMc9um8+6eo5qDr6T2d6RBRUz4sVddQjaiK/C9XN1jfsWh5UJ3f9L+3yXNQpxQWB7xgcxQfACv5116DHRnjYH5x9XuxEnOXXqVdjeCVqY+oBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706656030; c=relaxed/simple;
	bh=NQbNim9Kl9w3hMZilkX8mghToO2vPsILhxHQxKtN3Mg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=DVyYi5WJgJHae113akpxiYK9eXcGEkyGbI2KjEJY1T8kg+PRV7cBMn0UAiCsExMZFHRbFXpgiJDFTrpkawlFWT0uh1UaoCtPdOEkp1T7gggzZ4l2O4CNoSH4Uo55uZojr2VgL7GB/6VI150MwG4FX7NQMcW1fxy5YYDlzQDtLM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=IDFVj/lk; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="IDFVj/lk"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60406f4e1d0so3318007b3.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 15:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706656027; x=1707260827; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyHH5Unq92X0kSKpyQantcGDB1tT8ugB/3UImkmNwAE=;
        b=IDFVj/lkAES27SD7y2PE+Akuu1uEcLvjm1pV7PsKvh1mqDPmiEnZqXYUtViiNbR7l6
         VDkXTTkz0Hqx7eTMM9pDE91rV5p8KBew1Od+J0ZCzAfw4YA8HU+I5S/u1Wo3eAdTFrEd
         PEypRiIv+MaBGxLu4FRZv7keu2qR6yQ/Lzbxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706656027; x=1707260827;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyHH5Unq92X0kSKpyQantcGDB1tT8ugB/3UImkmNwAE=;
        b=Yvmepde/vRbkRx28GJb5co3MQs1AuZX1OV3Y4krWIunX3juhYdIjPPJuPrbS7OYFxl
         VSldRHZNEVneabm0yknF0wAtrPqvc6+wwOwdIjqswO/xKtXTpfCp9nX8qcfof8Tn39ZI
         czK+/12yyVZo0rg9wd2MBUcpUmqbITd24XS+u3xEC11YBtG/yTaLUdq93hIsuk5woOTR
         zkFzNczDR7EWjKf0At0UAPqxa6n5CIasTW9r8LRCzUXeKv1MN0rNGAu4PveIpiPF10C1
         6etWmlulY3+AeLD46MYNzEeC6OMmIWvGWtBA0RyvsOuiExZcGQtDazK6DNqBmFbPSlZY
         6HNQ==
X-Gm-Message-State: AOJu0YyAN5iFkJeQeymHCKPsCq6NayPHGKI/M13mDS7QS5wWX+MQniq8
	SCvZPYfM5lqcceQbt61/yCjNfGxnvVqv7RmqjruTcTETuaO73dN/v+iYGLV56Iw=
X-Google-Smtp-Source: AGHT+IEQXgQHf7sprO3/WcC9qBEGZ9XfRvNABgddgUIxPgQY3kLczs49/FKD+DKLZeQpM6lMZetBhA==
X-Received: by 2002:a81:eb0e:0:b0:5ff:6084:421e with SMTP id n14-20020a81eb0e000000b005ff6084421emr7017803ywm.32.1706656027480;
        Tue, 30 Jan 2024 15:07:07 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id di8-20020ad458e8000000b0068c47832171sm3081275qvb.65.2024.01.30.15.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 15:07:06 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 1/2] platform/surface: aggregator_registry: add entry for fan speed
Date: Tue, 30 Jan 2024 18:06:53 -0500
Message-Id: <20240130230654.4218-2-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240130230654.4218-1-ivor@iwanders.net>
References: <20240130230654.4218-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Add an entry for the fan speed function.
Add this new entry to the Surface Pro 9 group.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
Link: https://github.com/linux-surface/kernel/pull/144
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
---
Changes in v4:
  - No changes in this patch.
Changes in v3:
  - No changes in this patch.
Changes in v2:
  - No changes in this patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 530db4db7..b0db25886 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -74,6 +74,12 @@ static const struct software_node ssam_node_tmp_pprof = {
 	.parent = &ssam_node_root,
 };
 
+/* Fan speed function. */
+static const struct software_node ssam_node_fan_speed = {
+	.name = "ssam:01:05:01:01:01",
+	.parent = &ssam_node_root,
+};
+
 /* Tablet-mode switch via KIP subsystem. */
 static const struct software_node ssam_node_kip_tablet_switch = {
 	.name = "ssam:01:0e:01:00:01",
@@ -319,6 +325,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
 	&ssam_node_tmp_pprof,
+	&ssam_node_fan_speed,
 	&ssam_node_pos_tablet_switch,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
-- 
2.17.1

