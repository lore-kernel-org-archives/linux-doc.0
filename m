Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE7028F948
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 01:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550304; cv=none; b=bjDssy0rGujF/GcCU7d5SwA3gLV/JehHG8fRtAlc6e4a+ez0h0gFdNt41bWVxNRgkAan+1K8oB6OMjlJEBXl/Eg5ME+LT/JgzUjiaXXe8Zh47o9h7HmcWcXxAceats9VfSHQPn5XvoTihogB8OpqOYFpl3s9gFeEKbgnFC96Mqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550304; c=relaxed/simple;
	bh=YFqRwDZh6NjIUlVojwMTqSW7In7Pd16pnHVzmRsjrMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hxEhsjcKT6/UfTqcW3/O7VRQ0IJKJaeTW5hYZIuZ7nh9tCgxqpLtnXKDmN27HGY18l8DQqKxuX3Ay4dHxDF2EJowAd0S0zd6dG4SKdo2LQdq23h8eBiPYC0TX2nBwbbTo00K5yroW0QOoKPV2M/sXvxdP6OHoSAax34VheWgtsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=cVf9Gkmw; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="cVf9Gkmw"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso5542933eec.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 18:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778550300; x=1779155100; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bquv7t3kUsD7keFlHzjXTIEb+QxEuCA3H6GN7PZtrYw=;
        b=cVf9GkmwGA69/6haFNwnJU4HtbcVYVdKNXeh4lt052YvQWgxizFSmfoNZKkVvpiDZe
         dwI6Mto2sEVB3i8VxOjA9HVh9lQ8pj0L9NsvrzcGCeBokOwP4qnXTHQffFcLhg6aJZBU
         Jum801k8WHX5OPDm1uE1eMIx2091zbRPdzXNEgKG6PrM0JbwT0e0UYzh2poAp5vKjgKn
         C3f2WyaMzNiZuIMZ4YIGRlRh6KYSU9qOWOKTj9yCOQQnanJpeA6ek5+8BLA/YR9IDU8O
         IKRAgq7wpM9D4k21bmQLSkcxNMtrvKBS+/vAy/K8kFYUdlV2Iqnmipxu7V+b/QT6GQTE
         yVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550300; x=1779155100;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bquv7t3kUsD7keFlHzjXTIEb+QxEuCA3H6GN7PZtrYw=;
        b=ewVN9bar2facvrbzKhOW5svQ+Z+1LOvw5fUx/ODtvP0iMz6fTdPkpBzO70yXIUBg87
         T41hC5G4qAhot0Lnk4b4kgfq8v45ISTyiGzNNYFm/RQ/41GuwFsgSraTDYtrZd0XcxqB
         /UwG8Ym4i8vzkZmSirNFfckrPVfS4755jmVP5vZfTwSgIqea9IguQw+QZvg/cwYYG9RA
         sayKOhg6GlA+NHmMMN8YbMLNPsc9WubLx+XrXdspDBGtoUIhpoqKysCoJ6Uq2y3RHfcy
         vN2hsTiIAjzHMcfjV8j1O7BYApC//oB9vwXOecr+i5TQjbUkzrcq7m6KeotjDwF7se7Q
         N94A==
X-Forwarded-Encrypted: i=1; AFNElJ//lvs0qkFhfEmE2qEj8AfZo+ynqW9XussmGDztRoCBM2F8wh8nfcyWfcA+r6luKiuSeARioO30UoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFB+bXKzNtMBiGOWOdXsAP4kUi4BkcQxM+PQbF/k6cj1cmbWH1
	E+3sxthPzlT3DhBNhbo1/t1x/szau7zAT+TzE4jOYz/vVGrXIGHene+yQINYV/JjaqU=
X-Gm-Gg: Acq92OEs+7J9g6Bf6/3AEws28JxFch7EkXv+BwVP9iMDyU4LrcuWgl7xQ4KEHU3bVpC
	kuu4K8I0vjJRCkWtgeelm5vD9EFTmgwKcv+bKxZiwMHIlimEhFZ3nEMWFcPtYa5KjEYVoMsaOY6
	78X/PrJ1ZRysjXuipj9JEJuolFuKrBECmdufUgrp21rmFRhZSmvH2RipYCUK7GCwGut+DEsYE05
	i5yY8nlvpCtuH1ZLDvXzcZZ6UGb58in7xE91IAAY60CM/VQAeYWm7i+V42T84fW65EqTvj+jeZc
	9NlVNlwLkUgL83KyN43vSE94uU/Bl3PxWodjpQz8sIBjf6HkbPQc5a2HQmehRuqW7DuLVU3rhoz
	Ap7zBuRmrQ8zlPMjysv+VlYEH9XbJlWHYOUZI5nUYCG5bYpiS5u81R1Hw8sFqAx4Wx7DAPqMNt3
	JHcKqZNxD3dmsd1hGT0Q6WVdftcw==
X-Received: by 2002:a05:7300:dc0f:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-2ffd77e63d5mr554526eec.20.1778550300315;
        Mon, 11 May 2026 18:45:00 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15815467eec.28.2026.05.11.18.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:44:59 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/2] hwmon: Add Murata D1U74T-W PSU driver
Date: Mon, 11 May 2026 18:44:26 -0700
Message-Id: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqFAmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0ND3RTDUnOTEt1kg+SkRIs0w2RjExMloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AjGVykmoAAAA=
X-Change-ID: 20260511-d1u74t-c0cba8f1c344
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778550299; l=1549;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=YFqRwDZh6NjIUlVojwMTqSW7In7Pd16pnHVzmRsjrMc=;
 b=xhnCb6pxOKl4xmYeOy1aIfKyZ1R3lAL/337Xfldg38FvMCJRHU+T/GSj0zr8lBl3araHcCDAm
 7g3DtwA0O0RB04qcDjCLsg0NA6+vuYKKXY9ITBgXqh0+Xi2JvJQcC4r
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

This series adds a PMBus driver for the Murata D1U74T-W AC/DC power
supply unit, used in some Open Compute Project platforms.

The PSU is PMBus-compliant and uses the linear data format. The driver
exposes:

  - input/output voltage, current and power telemetry,
  - three temperature sensors,
  - dual fan tachometer monitoring,

through the standard hwmon/pmbus sysfs interface. Probe verifies the
PMBUS_MFR_ID and PMBUS_MFR_MODEL fields before binding so the driver
only attaches to actual D1U74T-W hardware.

Patch 1 adds the devicetree binding.
Patch 2 adds the driver, hwmon documentation, Kconfig/Makefile entries
and MAINTAINERS section.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (2):
      dt-bindings: hwmon: pmbus: Add Murata D1U74T PSU
      hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver

 .../bindings/hwmon/pmbus/murata,d1u74t.yaml        | 41 +++++++++
 Documentation/hwmon/d1u74t.rst                     | 97 ++++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 MAINTAINERS                                        |  8 ++
 drivers/hwmon/pmbus/Kconfig                        |  9 ++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/d1u74t.c                       | 85 +++++++++++++++++++
 7 files changed, 242 insertions(+)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260511-d1u74t-c0cba8f1c344

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

