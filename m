Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B7D1E5724
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859584; cv=none; b=EdmUtieNynKB+g1FVvPdoSprmug01KzF0f8E145hVeb70Y2ZDijnvW0hzQSMyoYmhmJRA/WRfek7OnS/dLZrJGMQv41nUJNt+4XHT7gaBPkAlIdcB8QvXmhRJCJ6rltga0miqc+6r+/C+8glupKV/Y39v4rF3iPDSqsKO5/wKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859584; c=relaxed/simple;
	bh=0sGt7tGb/oUppsoQ7+XY3YPpBC8TN2PAJSBkXI7Yb/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VTjSoAIdUQApdDMPD9egOFHJbrWQ8K3ToYK6AM3dSEijfZ+yhfB2J6aJ64HpoSEeLbYwF7kx2oGu7ptWtpLTIw49DGnk3+lqdKS27gfrqwNtcA/9QNE3cKn0nl4L5/sqyPcquzjYAR5tHaaOAih8/SBoNmylV5fxtwXzyP55PZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=C8RwsDW5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="C8RwsDW5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso3800523b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776859580; x=1777464380; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRukHJ5+Ru4qIAkKpP+16WGIqlF7mx9ZTtZzr3fi67c=;
        b=C8RwsDW54b7UzhlOmaV+WB+j28pmzbhFFH/KQwbSTK584ENhXxp1XfIz99lY/7WHhA
         RHa6tqZfqlFJE6ppi2K9uq5Ic/Ui+j+i5QmfaK2vxU3dubpq/9keLPTxsnwLcB5igNuL
         iUf7/OMLCsHDugl+rQfo568d5iaPUzFrxP9VECTt5dVuShGXxUBUV1EyegBknxpX6Pxl
         kABJ1TK3K/KwRdqnW4xkpT0GY03dOiYLG5esHWzOqu1siIcjPpfjL5uXvZQLAvcfEySh
         fyUFyNFISOsps8StIzf/Bz78LaAKBJq2nAuyiroGYgYFMCpE4RNtMML6J4xkvt2qfPu8
         RmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859580; x=1777464380;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRukHJ5+Ru4qIAkKpP+16WGIqlF7mx9ZTtZzr3fi67c=;
        b=dkz7JNQ04ZVWieFxxy15libGfGKoEXTSGyKiSV+jTBZIb+FzOktMQw+JxfEcIbU82/
         ZmRKXDiUp83XOZPLK2zSxiv+MR8eJr2X5uzs897IQn0Odp1avEHlLkepBWrZhD450Ih5
         n5bMlG8foW7vmb7FMVL4cjYQ4Jogz4HiABcctpwgXZ3+JldxdGNRGCBj94OXduK3VED2
         iZog3FBT7Mm1bUtgX8PkhFQRyUKDdSPoTE19mtICdqhJnW0pfSs8bc8XGXlqG2GNTUpb
         Y/uJ41muGkpmsK5sAIBQjHzs78987KQMioPqaFXy9iIxweiODE/hLlW6/c1HgRczsCts
         k8Dg==
X-Forwarded-Encrypted: i=1; AFNElJ/JOqPeEJlRZZFlhkRGRZfRKDBIdloeRcYiJS+HJdxDnxAPQTZcklLqTc7e1QjHi66k7J61HP4H/3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YysvKoRUKQjUU02kA/QVYRIm2L9EJ9y34/ZkcNYnAzu2aK8BgWg
	29tdnLxMUd8EKoC7UmFelo/QoHgQLd14Iw76UwkFK6pJ9m5wFwAStcu6SPOMwIijeRk=
X-Gm-Gg: AeBDiesZUwI8cfV3TCm3El6cti5d/Vw8DC1/nUfIxT+MjUQfbWxAgGgBf2UOBfKtPzg
	ND1XZx7jPIckh5BFlwLNSFczcFs0/b6LtgsMguSvZ9Foxv5KJsow8fwet1MqX/LcwgbmTUjXKpP
	s0/ts01TgMWjPULd5UpN0ZaMEZETLF8KTrxOedExGOcYLZdEmq60mWx9MMYkx+8AA3fGGrOZdkb
	GgVR2KkKN+eCHy38dTLCBlGOBGE4Tl8ccDh4k07vyZ1+KDjDW8ECk0VAzxMXe1mrrDropoZVrLP
	RVRX0blNLJIN9InTkWkRwqvZTs++SvVHUdqPwTv8GX65NcofLy8CmeTT5e24gljXi+tA/iBSHuY
	/y9PE9S8Zv1kMlP1mNlDH7R3exn6X6b3O9utQl8RDoodoaWApvk3BAHhXtCG4/OPe5b2adLqe8h
	/B/EAWyLnA3a5ZknZfiBBOylfvMybzUqvDUlS6Vf9vdxiRn435RkZfpgx42Y1pTg1EENC/sJ+he
	lkW
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr23037967b3a.1.1776859580609;
        Wed, 22 Apr 2026 05:06:20 -0700 (PDT)
Received: from [127.0.1.1] (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3fa2sm17086636b3a.29.2026.04.22.05.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:06:20 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH 0/2] Add support for LX1308
Date: Wed, 22 Apr 2026 12:06:14 +0000
Message-Id: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALa56GkC/x3MQQqAIBBA0avIrBtQK6muEi0spxqIFK0IorsnL
 d/i/wcSRaYEnXgg0sWJ/Z6hCgHTaveFkF02aKmNrFSN1jlMZwg+HrjdqpQNKlPbSktjR9NCDkO
 kme9/2g/v+wEbj6xAZAAAAA==
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776859578; l=1370;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=0sGt7tGb/oUppsoQ7+XY3YPpBC8TN2PAJSBkXI7Yb/w=;
 b=N9fuTYJgRN5ExWOTg4bq6rBoSG4vqQoFOYuBiPaCc92mrGji5hCouycK95XY1YZ8OKgv4Agu6
 15LNYUcB4ysAH6tdCHg3zMLOEO+cTWQm9R2jUxG1WkjXMgEsN0G+T8o
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The LX1308 is a high-efficiency, non-isolated power module. The module
operates from a 40V to 60V DC primary bus and a 12V regulated output
voltage. It can deliver up to 860W continuous and 1300W in transient.
The built-in digital controller can store and restore module
configurations. The fault status, input voltage, output voltage, output
current, and temperature are monitored via the PMBus interface.

Add support for this driver.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
Brian Chiang (2):
      dt-bindings: (pmbus/lx1308) Add LX1308 support
      hwmon: (pmbus/lx1308) Add support for LX1308

 .../bindings/hwmon/pmbus/luxshare,lx1308.yaml      |  49 +++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/lx1308.rst                     |  90 +++++++++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/lx1308.c                       | 204 +++++++++++++++++++++
 8 files changed, 365 insertions(+)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260415-add-support-lx1308-165a4206ab69

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

