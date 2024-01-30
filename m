Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B377EF11
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 23:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706656030; cv=none; b=XRsijEWGqJYVorvtaTtIHt7Q9Kr4ZQt3m63cABPri7atfVrvdpfqnhPJQfzqzhS8J/NHCj5YT0I3b+7B6dre0EBVz/gpXhed3QfoPm+vH4B/vJze/z//+mRqxqSWzDAILtytVe+M5xBSKkEh8JwW5QlX52lyl+cmNqzTv96CBS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706656030; c=relaxed/simple;
	bh=Quzl4oZDEPNpjQL8yEy8YSM4ZcrJbwUZ4aOuRk5Xgpk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Ad3mdtoPlpjkV9p/9bjSaMPL6Dh44viPSGyrOoFEYkX11/rv+imuFvFDLJmEuNL/SYq2HB3QA8ehzyqoPeGVksfQc13EwC09ZXmQnSDtnL3DK333/vJQ1Goo8ousLLWTxCJ9jA5Of4NxZ6jJxBlG+50wyXZo9hx6z63JfCRyeAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=EQKtjL97; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="EQKtjL97"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-781753f52afso363029785a.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 15:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706656026; x=1707260826; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Epf2KC/FEpd6pon/LPvJu29mO0Kvpnb2m/NzsfdKN4=;
        b=EQKtjL97eC2GGb+Q4kXM/CDYwMs3dgQ0DBL7c3uZH8aTsgawm4OSRw8A/ujxmv1G1P
         6EyzDIRiV8/NCemW5scYphWsDx1L7ZwtF28wP8syXF9JHErqKqccsn24zI6uO7o/TM9l
         PlW7cB68QGJoE+5x/KE/ryxEWqXD1PdYtqzYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706656026; x=1707260826;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Epf2KC/FEpd6pon/LPvJu29mO0Kvpnb2m/NzsfdKN4=;
        b=SR8fHNvCYMx0a5USrgruf6qQMdR2NIzaAxwBOdfmrM8wAhdya5e54Zqeq0uIGcYXTl
         b3A6Y02kb5L7iGbOyb67NBfGhdCgUioux+BgSmFtvPCBWK0C+Pp289SlSX7kyWkcvMHw
         5asaDGH2n/xbBbZ9U4b2RJB5qEtdhsNiV2Z71n6YAY0/WE5ge3bw8Z4mpcUg/TVtVVWq
         QVHfJs41tcj3ADT30YMPeyBIRA4GM/3m4dvf3F8b47hh6lxQg8GoVScRlXGZb+mArEwl
         FHtF8h/NlsSr4ljyaGceZmjnJuFoJ8OdeP4svx1r+ZPBzPTmrDl48vGwe0Gbj0RS8cWT
         eMTg==
X-Gm-Message-State: AOJu0Yx4k/8nqIOi8jXEfcqVwxXL8xeeyFl2aUcIsG8jFlJ2kuIxxjyP
	4dPiqB0p5PIDklyfIAov9h2NNkTVGHE7piWu+LHml+t/dnvSuxzTUtLGdN0Woc4=
X-Google-Smtp-Source: AGHT+IHjoLRRl7FtA9PjjP07nRCgbztT5Y+p53GUCQOoyhIcXVUPH4zHFCSvlvg8WWGngx/oVuljCA==
X-Received: by 2002:a05:6214:1d0a:b0:68c:360e:ca with SMTP id e10-20020a0562141d0a00b0068c360e00camr10305479qvd.57.1706656026093;
        Tue, 30 Jan 2024 15:07:06 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id di8-20020ad458e8000000b0068c47832171sm3081275qvb.65.2024.01.30.15.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 15:07:05 -0800 (PST)
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
Subject: [PATCH v4 0/2] Surface fan monitoring driver
Date: Tue, 30 Jan 2024 18:06:52 -0500
Message-Id: <20240130230654.4218-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Fourth version of a hwmon driver to monitor the fan's rpm on Microsoft 
Surface devices, originally submitted in [1], v2 at [2], v3 at [3]. Changes
since v3 are two minor code changes based on feedback.

Changes in v4:
  - Return 0 from surface_fan_hwmon_read instead of ret.
  - Use PTR_ERR_OR_ZERO in probe instead of if statement.
Changes in v3:
  - Removed type and attr checks in read and is_visible.
  - Removed assigning sdev to ssam_device drvdata.
  - Propagate return from __ssam_fan_rpm_get.
  - Renamed hwmon chip name from 'fan' to 'surface_fan'.
  - Removed unnecessary platform_device header.
Changes in v2:
  - Removed all unsupported sysfs attributes from the hwmon driver, leaving
    the fan input as the only supported attribute.

[1] https://lore.kernel.org/linux-hwmon/20231220234415.5219-1-ivor@iwanders.net/T/
[2] https://lore.kernel.org/linux-hwmon/20231228003444.5580-1-ivor@iwanders.net/T/
[3] https://lore.kernel.org/linux-hwmon/20240113183306.9566-1-ivor@iwanders.net/T/

Ivor Wanders (2):
  platform/surface: aggregator_registry: add entry for fan speed
  hwmon: add fan speed monitoring driver for Surface devices

 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/surface_fan.rst           | 25 +++++
 MAINTAINERS                                   |  8 ++
 drivers/hwmon/Kconfig                         | 13 +++
 drivers/hwmon/Makefile                        |  1 +
 drivers/hwmon/surface_fan.c                   | 91 +++++++++++++++++++
 .../surface/surface_aggregator_registry.c     |  7 ++
 7 files changed, 146 insertions(+)
 create mode 100644 Documentation/hwmon/surface_fan.rst
 create mode 100644 drivers/hwmon/surface_fan.c

-- 
2.17.1

