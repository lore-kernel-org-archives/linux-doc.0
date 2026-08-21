Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E7418C332
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348859; cv=none; b=oSicqYJ0wAXwldEBH8/pV15PB+NtT4eRxyRuqiIBVTdaZmb4mtrP4OA+ona86+kX3j40hmNeZo52opBaqSP+apL51HwaWgUk8xtQW/klsnP0m+5eCANv7tvFenrRZpo2yMvVd6I1CpKmvZ2IlVKGBU9YCkLpXifJYlYgjwkNn/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348859; c=relaxed/simple;
	bh=5Z2Lpou+idaDjMdbBLj5870okjZ93hYD6gJizvIkOTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=howL8wALgZDAp0j+umJsRHXT/ZQSRAfcYLEarBuxlKscnu5dfni0shsIW4Pq2kJbD5PwvffSG2RlYjzsTMQ6TI6s9IMRMOkY3a2pNmy/FmfgauXqSosxZoq25S8QeM/wYD2UJ3KftzFxJl2YA7YRvJ2vgv2cKlWTSEI+7Gk+S7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSoHFjH+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSoHFjH+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacf197759so20662155ad.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787348856; x=1787953656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSjgsk8Yvs83A8c6v1zqzSAqyvIC2+XLW+Y3mp3uQzE=;
        b=dSoHFjH+UTqPqeLtzrtAgF0CDXKh3AMuXJ7+Wmc9Rnn5jF1vTkDXKHAiB19pPYh8+p
         9/9py2zqtMufVoWPRABVnr6UMxKXZrXU1OZmigB+WbYtqT3XmRTOPTTc2y3ilfUBucPy
         O2kqQec5Bd0FvdRflpZsniymUKA12W+sS8rFMwzxIrTgqyuO2LSOCtcfMnQ36yVnqWA5
         1p6phqLgV/IAkU4rtI1BOXPHpSgSsCoY5X9muU29sjNLQphzYoVHHcyLQTNKf2t0pv3F
         rZ6KiIE5byDnUFTrLwcy8P8mqmjNTtba0JRBm+1TRXk9QqqDaEWCDZ3sf+gXiE0DLDbF
         6S9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787348856; x=1787953656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSjgsk8Yvs83A8c6v1zqzSAqyvIC2+XLW+Y3mp3uQzE=;
        b=bbMeMtPG/8y3jZt4+KrH5vskzbERlFk+9o2Y7IjF3Yf9bQ4FDGg0/TQnYp9bKYegmg
         Iy+S1kylU/S4bOPrlnC5U7Vyfzr23nJOsCnRLXvC00qDd3auweAu6JMbp77pq1Y0q6yK
         Zrf18z3G6VV0RJw1ieWULDZ2fFxXElrZyQ0kcEYSRO7IWMUEr4dMg5Hu7VnfTOpnoGHO
         Vy4q9qxw0luo1EVS2sDzlSYr3t6VQc6EoRdnSS9/Vek+5hgDQrUYdQ6Zv4gZbK/Eripi
         QPbUwrrPhU9tJON4+S8gzRVSFnYzzA6nHCKbGiVUigMVo1/U+9RK+tJDptb7+Y1famRS
         aDcg==
X-Forwarded-Encrypted: i=1; AHgh+RocxDP+lZ/9yie1pBu2oV6Sh/p25ujBn8QT2Q+uaUtTBhxH9jzmTb7PdHhgoPATk18Xpb9hvUMhsZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++ni3NZM8erv6vM7LoUwOvZ5v+nuaqD8QbxklAyGba3wiIP/ye5G
	mDiVDrAMn3sCP2WA9y5DvhsdN96kMLg5CPdSFUl9l+2sImq7+F9V6CXK
X-Gm-Gg: AR+sD11VH+cH9e7zg1idE4Q5gbku9rlcBPCBt6UMTYUtx/nVpY+0GazOskGDVQ/j0ED
	fHUD9SCdQjoqxyHusPpqb2oBtLiUrKs/zdMNwD80jMvMXO+DeKK2Z9elVBF/FpRFNzcmMNPRJNe
	P1smhAX+vVj7KKresq4Ck56Em14AQiFurW0TTaAN6qtR7lV3oO7n5myxFr26IeBqLlm/k7xV0jc
	IfDkalCqmVrucDmtfnht/hZSKkE9RAQWE2pl1VckqCb63i5R6m2kldPJNqqkC+0hZG9z9x9oLUK
	s2zh7wlG734MQhdMWQRM66Ce2LGoYPzIoFXmGOggSyYeB5CY9IDk5VznACctdCSAPaWVTjYW/EJ
	7RlLjozlNbQTptL/AzQCi8Zdl76ShDpf/cMIfnKMQIU2vwRvpowXqS18XVDYeKJcqV+P819UqqS
	5tPEJfr8cEkEJ1yKq2K+8YRE8JYaKg9UmhiQxYuZGEunYLdFr1+PvmsbJ/r+G2XU72+BaCdrlAf
	DdXV0hgwwmLoPTgEwc=
X-Received: by 2002:a17:902:cf43:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d64ade9363mr188665515ad.3.1787348855568;
        Fri, 21 Aug 2026 14:47:35 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm45664198eec.14.2026.08.21.14.47.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 14:47:34 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 0/3] platform/x86: lenovo: Add Legion Go fan controls
Date: Sat, 22 Aug 2026 03:17:24 +0530
Message-ID: <20260821214728.87773-1-mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Capability Data does not cover all fan controls on the Legion Go. Full
Speed uses a separate Other Mode feature, some firmware exposes an RPM
reading that Capability Data does not advertise, and the custom fan table
uses a separate Fan Method WMI interface.

Patches 1 and 2 add Full Speed and the RPM fallback to the existing HWMON
device. Patch 3 adds a Fan Method driver and attaches the ten curve points
to that device when both WMI interfaces belong to the same provider. Other
Mode continues to work without Fan Method.

The open question is how the firmware control range should map to HWMON.
On the tested Legion Go 8APU1, values from 0 through 115 produce the
observable fan response and correspond to Lenovo's 0 through 115 percent
range. Lenovo software shows 0 through 100 percent to the user, and 115
reaches the RPM observed in Full Speed mode. Firmware accepts values
through 255, but no RPM increase was observed above 115.

This series keeps the native values unchanged and exposes the fixed
temperatures as read-only automatic points. Should the driver map the
effective 0 through 115 range to the standard HWMON 0 through 255 scale,
or keep the native firmware values unchanged?

Aditya Dash (3):
  platform/x86: lenovo-wmi-other: Add Legion Go Full Speed control
  platform/x86: lenovo-wmi-other: Add Legion Go fan RPM fallback
  platform/x86: lenovo: Add Legion Go Fan Method curve driver

 .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
 .../wmi/devices/lenovo-wmi-other.rst          |  14 +
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/lenovo/Kconfig           |  11 +
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-other.c       | 215 +++++++++-
 7 files changed, 649 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
 create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c


base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
-- 
2.55.0

