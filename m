Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C12356BA
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192534; cv=none; b=KYZMf334KK2oa8RuqwK85h1WqLGnbhkLsVz1EdrY1Js0VJsIiI8P2tJTEf3Yvoe6bhFjQCaEI6x7Mnhdcy7OqMBxFiRf9yoQXNbQXKnjAFnNNq3RTlI+AhN07gmYNwR3wvy3T8yl5cu0gfGUepub9GuFw0iTB5qVzO48A0qIFlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192534; c=relaxed/simple;
	bh=X+vzha3uDsnPnM+IM+PTr3EVnBo+QCUEiYzUQt4XCrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dK+MvUFIDe81PqrOPTXXZNwLOmw2rnd46ordrV0jV04pjz2+ljydhWhCdNxfZOfRvE8sti18rate5E2fC8gkeLyXDQpWsCDZ1zn6wIEKqmF7RzhwmItCabQwvIKrpuE69Xxug2em1aCKy5TL5X3Co59R9gPzBVDZFm0ba1aunh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYrhmwqz; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYrhmwqz"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8231061d234so1914163b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192533; x=1769797333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pvSsAXU8r7zmE5dE+V63iueefcjWX6018262qDf8VSY=;
        b=aYrhmwqz6W6u3TGXYebS6fKpJnKR3WRiXRN8fcxS6m3pRt+WrF/FIgqsm8vJj30f1t
         UJtbLoDjMZwMqTD/01mh3rM4GUVpR/BkP1Bp/kfaAt0Cp1LrHbt+gm6MHklpiGPYevFM
         G5dIoE1PxUlECOLDfBR5Qb+kdWtxpstTe1xtbNe1t24KQnZuFSnoXAVAJIGRsNU8Yo6T
         P93Fr6/63SysJuB7Qdb2Kf1wwK0oTWizqtpuD811nlswPsQYOt9KKCynFkrAPgCFO27n
         rPbhVBMXGJBY2aJj0rG3gQKoMlj4eRlLb4YkzfLT1hh10Z0bTPEpZi7TQMrxgYUA7Rrx
         atqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192533; x=1769797333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvSsAXU8r7zmE5dE+V63iueefcjWX6018262qDf8VSY=;
        b=sK1cbu3ACsNB7zJKgIbM3pSfoVypIBeK/g3fwO57xC8cLE2yMJnqh1pXRcTEf/TtVb
         i2Y/Wdqcx4mh4ZAy4n4J9ZX+yQA68A1mZlbEgeczz5HJT5Piz8X0pe3Plgf3pF5YGxRw
         Pwmywh4+etGQ39aiPjtwxRiMkAaOdilSM9pecRgo+RW3sn+5kzChBiTFWHFshH6TEAQM
         T/rLpt8kSkiMSgAKuZLkgZl8nemag5WpE/S+fv/+neN0ig71YmZZNFo6Uf30Gjhi0Zvi
         kXoGSR43k3wpJX5e3m26RM2us1Jm2RskVN6TWZI/F2jxyuBKDK1z/ATYI9XD1BJ0Y5CR
         O1GQ==
X-Gm-Message-State: AOJu0YyYqPm0mbMeRBTHFz2R7kX2bp73aT5a+9qtSWOtG1+dqhb9IAjB
	yT+3OS4c4UqTl5fClc1UgX7E8kO+0akwfb1PctpKwwxmJu2iuRF8HYXxWiLM0IPt
X-Gm-Gg: AZuq6aK3YOdHulmKGDpOTpRkC+UFw4BCscBf8HIA45W5Qs+ROaO4JGTHs8Lo0wkWgkw
	41BV+YKxZJt1mXpgewiG6UVXIDSGP+ebxCh5R+qTlZC5FfbHWhVN3WsKuyEcwj07GNwLAEEzIk9
	NkGW9JPnovdF2THiqZknvz2QnFn4XWGxO7QxXveotjPNDnVBuVQiUiG6XTC615+Xe0crJlr3tjw
	ZDun0MrK2o7bAtT+FLUg4U/a5fk0lVBR1v4lOFvb3YZ/NuHm1LHxE0pM+RSIVMuxUnwYfG8pz3V
	wdrNQrieU4hnyZmzzf6jy+v++eszx7+rY4fHhN30LO/DApYUy6sNU7cGw8gley8lnVhc7aHtSJs
	JYcALvFeoWxSaZc9e7dxmb0N7PL1iFvxDpFhgIx2D8kPfgx8SLsfuGWYO4rffP5QcYVlBVJm3R6
	I7DHe+vhCPYxe9U9cdwHASG7oI
X-Received: by 2002:a05:6a21:1505:b0:389:8e40:a13a with SMTP id adf61e73a8af0-38e6f7bfaf3mr3839713637.52.1769192532855;
        Fri, 23 Jan 2026 10:22:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a43c795sm2688079a12.34.2026.01.23.10.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 0/5] hwmon: Introduce hwmon_update_groups()
Date: Fri, 23 Jan 2026 10:22:03 -0800
Message-ID: <20260123182208.2229670-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce and use hwmon_update_groups() to support changing sysfs
attribute visibility dynamically without having to re-register
affected hardware monitoring devices.

Use the new function in the ACPI power meter driver.

RFT: The new function was tested extensively with a dummy driver
which changes attribute visibility every few seconds. However,
it was not tested in the 'real world'.

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: Handle attribute visibility evaluation in device core
      hwmon: Provide helper function to find thermal zones
      hwmon: Add support for updating thermal zones
      hwmon: Implement hwmon_update_groups()
      hwmon: (acpi_power_meter) Use hwmon_update_groups() to update sensor visibility

 Documentation/hwmon/hwmon-kernel-api.rst |   8 +++
 drivers/hwmon/acpi_power_meter.c         |  37 ++++-------
 drivers/hwmon/hwmon.c                    | 108 ++++++++++++++++++++++++-------
 include/linux/hwmon.h                    |   2 +
 4 files changed, 109 insertions(+), 46 deletions(-)
