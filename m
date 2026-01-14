Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E63AEF36
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428746; cv=none; b=gPR4jLlTIkliZI2enzIHHWmzbqOaNihif/yhDnpbIjIwy2ebOznOb+uCx0R6uSJgTXBZoUwQmKVaRa4KmPCehU8kV+mLc5Uy65HV+V3RsPUNklRcsauPovpIWLtZ+1cq0BgCPuQDRwrTCfIYOPOcIYsHrPIEIWSPIq/HSZ/mfu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428746; c=relaxed/simple;
	bh=B+EeUoOuPx9EoN07TmxXUxT66Ycgj/cFpUNYnSjF3Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ugJ6YU54OLXe5nF381sHVp8cDdnF1lwRf/d1OJD58erVEziHz6TUABOQIQDc383wLAA99G7J1Vc9JsyJiE6P/yr6RvSAn5PMy4/OLpdFn0v+UA83OajjZmI62jg1ytVeTwRBL7ZKkcnefAqtNtztBKQGM7hVEE3WwFceTv5lWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=Z/jOFnMN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="Z/jOFnMN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so1795655e9.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 14:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428733; x=1769033533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6PBd6GwtcCIgrv3iBWDU0XhqJMJ/1w2COK3jyTWsvxc=;
        b=Z/jOFnMNEHCiPcZG5QV5Nz7+eGx6A9psDeE1N8wC7TswFWPHDAIaTFahZWvoO0Nesh
         V/E7iHesVVxH9gwXuyKItbphlNayU2HNIo/cCxj5Hn1wKl3sFryUIzNTfOcC2S+VB1Z5
         KDHOvZ2ONJxPEn0yA1hdF3cwvYqUWCuaqDGPaI3yOPWkdbTKf+ox2ADxxMMgV59KZAXg
         HYOz68xLnrGespjVH8aDJmxEXPFeflS8GjNjRB2DyP+vAo9goeWPyrx49a8WNWfRbPOh
         mu99TkooV8vwYbDMgdXstqAdZvLM8u58cSDHqV2eB6OvwTFk+1XHBISa0moMBixkJudg
         eSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428733; x=1769033533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PBd6GwtcCIgrv3iBWDU0XhqJMJ/1w2COK3jyTWsvxc=;
        b=faLynE9kTQniMNKwFIh6j8PuEbetFI0QtT1Vr9fpiNCRYbIZwqG095yuDH6Ow9pizz
         tsmSqFgpuutOvKoqXHfZfQrzJfHkl86ppa3XlUrwdzpa0o3o9z/fBqjyhGwNr81M3xR+
         qAMkSTSeMFKjEF3sZlhsAFRUn/uRhjhBtzOLKQdWKx4c5FIdpIB8E8xLm3fzqzec/03u
         lm01zOLa0G+rXvSbYIrp5wN6RjC3Vt+EvABk1dFm2DT0UCaBF0dgw7C8uSxaU58Sd/k+
         JBy3MkujOY/FcQs42x9N9a4IxBkPmwXrwMcLKUvKr7X0BEvybLvtLmraZjUxabtzvY6C
         o1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyVlL/o3fWm0dGId/vreEU8EO0Ca16lJsGylnbupCmYwHwparilb+YVy6FJdaZ+i7kLEr1WatVuVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVDOdkhA2gYMxJdgrICOli1/2Wt0Wbxc2r4avarJWz8r/FMupn
	9c4+3HrMnW6aR2ASfvUI5rlKpGKcSe+SFvcAVA6q6nlcESfSGRnH0VTLrkug7PiEdw==
X-Gm-Gg: AY/fxX6xWCX4PkZeW09HGpeF43vKlUmeCID84WfxXUBG5dNTHtC1tI9tPrOonj6Qg/2
	zwvK/EVSQqdAAczpSKBQ7T4/EqSBOPgIpCogtqBrVhnBuUAr2QLd8J/luZ77wRrJx7dFEEiMfgZ
	DD042YE4FRfycCAmal+lhyGiWJXJQyKQiZ3URPzTGHpMkRD9f/dwWWPmjLOTZCfnPi3fPAy2VcV
	MCq0OFMeXJcVsit5QEytFqHowug3h6ytHFF5WSXzz96o1JalGUdzMYwChtjP/f5L1HgkpBqbOmO
	fAokB1H+Du001YoxQjov8FA4qwuH2IBR/vf0YGIlml4w3+s3WYEfGukYb59CYgfyKlRtkwFjlxe
	vhkfBmrsD8Y4TXYKxs+us7Xa3d9a5JB7uGrUu9MXFJs7f4vEC/ihCXEXUzf89gZispzK7vJXQZo
	JFPRu7LWsKctPklgKtLieDCUv4fkjkXj+2eXRapvZ8Hx1cI4gOdCGNmlIdJ9f684NzGHpdVlCXY
	ZXPUh31CB6zbc4JGw==
X-Received: by 2002:a05:600c:45c8:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47ee3071491mr51525475e9.0.1768428733153;
        Wed, 14 Jan 2026 14:12:13 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:12 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 0/5] hwmon: it87: add IT8613E support
Date: Wed, 14 Jan 2026 23:12:05 +0100
Message-ID: <20260114221210.98071-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series ports IT8613E support from the out-of-tree it87 fork into
upstream in small steps. It first adds per-chip resource metadata and
new PWM temp map handling, then expands temp limits/offsets, adds
IT8613E detection, and finally the IT8613E configuration.

Tested on: IT8613E, MEDION B660H7-M20 BIOS motherboard.

Builds: each patch builds cleanly with W=1
(the only checkpatch warnings are the kept symbolic perms
S_IRUGO | S_IWUSR / S_IRUGO).

Changes in v4:
- Drop FEAT_TEMP_OFFSET and has_temp_offset(); rely on num_temp_offset.
- Initialize num_temp_limit/offset/map for all chips, no runtime defaults.
- Use per-chip reg_pwm pointer instead of type checks; fixes compile error.
- Keep IT8613E feature set aligned with the above (no FEAT_TEMP_OFFSET).

benoit.masson (5):
  hwmon: it87: describe per-chip temperature resources
  hwmon: it87: prepare for extended PWM temp maps
  hwmon: it87: expose additional temperature limits
  hwmon: it87: add IT8613E identification
  hwmon: it87: add IT8613E configuration

 Documentation/hwmon/it87.rst |   8 +
 drivers/hwmon/it87.c         | 447 ++++++++++++++++++++++++++++-------
 2 files changed, 376 insertions(+), 79 deletions(-)

-- 
2.50.1 (Apple Git-155)
