Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AEF128395
	for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 03:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774149380; cv=none; b=Nwkc3PVOEuUkTdeG/U3xtkWrRpvCRBwAAv2RF3WJ/ALx6yJslvxFc0TtRd+wbO5grUS6AZ3yXn6wSLwzIKsBO5xhlFYRHt2D6KcmarCXSinYJt/21/mIbBNIqVWpoANDaXHa4XSoybp0kgP1zL4P+72gRqplPYj506VtChh+wto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774149380; c=relaxed/simple;
	bh=H6PgkDANZTVCiCYueGZ4VDqAHVuGoTAHrFT/u1/OncQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hada1nkMRqhs8DyJXfuYBLALbn9IHG4iK3T+StjBgR2lOaOT8+Fd+OQtSdIimd0mI6jy9aveNHCQNRiBjXYHhZxBl7JZUOb6/o5NCO6AlfAMdzJeVX75MSPBDNuA7Ry6Y+4OdlNLmiIKbCbzowFI5csLpV2rgBOHCucJMUB/Hcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4rrDt4d; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4rrDt4d"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso3195080eec.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 20:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774149378; x=1774754178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L9nXD/mD+l1Mz7junnW36Q+i6fhLMe8N062hMZ4dDb8=;
        b=N4rrDt4dOSXWbvg0XySheKsLaqK+2klkVVZTOE2aZZiLrRjo1MsvX91cUsCYDsH8YO
         c8PirdRzdNkxVxg03xxGymC2ugOMhdh8GG3lZtTG7cKwlm802RWChexpH0woPjaWNAV4
         CIdPRIwXuHyH6maBoh+OMFEPAMuRwPhQbn0AeAjiujlffUHqccMMLyhJaYbFgtsVi2q2
         q6sfHdgb2H2pUGt3D8kbh8dCOKVb5eCWLEIhsvbSv7+NAFgluULMhkrnX24jgGLmt+ab
         B136k3evBr2FQcNAg+ZtReT6Rk3ur5eAKAYKt3moSzEuc7ktypvDxoP248OMzBTZK/bw
         aegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774149378; x=1774754178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9nXD/mD+l1Mz7junnW36Q+i6fhLMe8N062hMZ4dDb8=;
        b=YAcdQODTixgtc+ahyWearTB/lchWMJ+Um1yjTYO4j9cS+UCtf7J0LX8P9ISRAi9RN9
         gPZ81W0W12TrbZAQcaSfkS7MsgxbAULKK7uCbGu4YmV+n8rO37H/LqO+2r9TOmuhi6Ig
         mdoTq2rOklPkrM99pF2pcLonC6TJ5bXy4U+5IyPL3eOLVK4SKB+pC4j1qg+gOA8E1/VH
         mCLuA4p8qRhoV7yQ5RpaRfFDvkPbDYMmYEpmOQBX2LHOijCOWYUrFdbvAaSJFpVJvMhW
         1bXP/mMzDm+we7Rcoj0z+05FyDKqJpf2BYGsjNG54JtYNTgeBOwW+Ct1P17lkuMVWZpA
         9qiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoIEMlygK19nryLJCpMRVp5SFOCWU8wktGfSh2ssUHC+wk9ulV/eOwwiVn5O2Me1sbkpkcWTS9y8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVNIqkx3FZ6S8b/+ErTh+54x8QK5cfDojsD7j1S/BZjCpvwAzx
	xS5S5rXDvhCj+4dd85nULSazpxGu/WGCr7px+8Gpub69FiuhvUDdia8a
X-Gm-Gg: ATEYQzz1MI47PMMZqIEQepbNcsqyNYDNVHmCIo3P8I2JtE4EQm3B01VTqzqhth23hrF
	dbJwAYqV2cZ+NQu6sPHaWOnldAQyo2WyykAGeKqNMtXSUTsmzz5aSx/sdre+qZ4FHRn8LzJxmC1
	NbtqXGmizS8mYr9ANF6H53g8G5mBqen/YIh+4BewyjnHNIo8nemYd3I18H946Oye2J20kKyLHeQ
	lnfFyuCECLikuWIK0ei5SGOmg+Vzqr3vLq48JAjplagUWoFqJYqMy8Xp9WhqR7rP3Tz24IcZZ+9
	Nn6o1+SOclQLmrCav+YLcR5XFHPODPVLbhnLpB7Vw1r04dFHUl2RpmuL66ra5hbm0YjSwA+L21T
	/0SnBUcN7MRrtXgT7Rch6Me95U7nVo4/4728r5Ys2bu+mv7T7izB05G0nZtNItJ600FxMmgDVZn
	9FOO/GeyTHtJQ4hfwMoOpxieOeA79QSegHBiz5g+dyWpd+rIoqAwCaB/kRIgmIYX23dxeRtzU3M
	rcz
X-Received: by 2002:a05:7300:2382:b0:2c0:d04c:a6a7 with SMTP id 5a478bee46e88-2c1097c0a34mr3899512eec.28.1774149378073;
        Sat, 21 Mar 2026 20:16:18 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31bef1sm11220460eec.26.2026.03.21.20.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:16:17 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Lambert Fan <fanzhaoming@anopc.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add OneXPlayer Configuration HID Driver
Date: Sun, 22 Mar 2026 03:16:11 +0000
Message-ID: <20260322031615.1524307-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an HID driver for OneXPlayer HID configuration devices. There are
currently 2 generations of OneXPlayer HID protocol. The first generation
(OneXPlayer F1 series) only provides an RGB control interface over HID.
The Second generation (X1 mini series, G1 series, AOKZOE A1X) also
includes a hardware level button mapping interface, as well as a
"takeover" mode that was added by the ODM for debugging the button map.
This takeover mode can be useful for exposing the M1 and M2 accessory
buttons as unique inputs with some userspace tools that can consume it.

Signed-off-by: Derel J. Clark <derekjohn.clark@gmail.com>

Derek J. Clark (4):
  HID: hid-oxp: Add OneXPlayer configuration driver
  HID: hid-oxp: Add Second Generation RGB Control
  HID: hid-oxp: Add Second Generation Takeover Mode
  HID: hid-oxp: Add Button Mapping Interface

 MAINTAINERS           |    6 +
 drivers/hid/Kconfig   |   12 +
 drivers/hid/Makefile  |    1 +
 drivers/hid/hid-ids.h |    6 +
 drivers/hid/hid-oxp.c | 1340 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 1365 insertions(+)
 create mode 100644 drivers/hid/hid-oxp.c

-- 
2.53.0

