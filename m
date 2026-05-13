Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDF039183C
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668388; cv=none; b=eUJ6QQvUAh2vC6wS8WqloGtMfvDXmzDWq3chlLd04FBIJVA45HoF+mx+062SVvGtjz8lHVI7LwrbqWQtSOFEKzEX3Z16rS3hiubkTgZX8gg8JIOu5eB9IFcLw/W6+aHhxHxe7pjiDHLmVR2ZL+UyiPInGEWKWdoiLAU1WYrkeX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668388; c=relaxed/simple;
	bh=XubH/O6xm8n3FFF345gC2jEfwCMEnkublF27VZ+i100=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F+m2zUY3zT1dgLtyLAhP40QcmTGCdrMhYknp/0rWaLZljpGIas7WjaG51OgYF/t4LMuFukbHqb2Rq2Z4SKLAGYIQZNcxL/q7NWZeFrHd2iKjHT+Odif2W6Qesex8emtx3/94TTjYfpceo73SpWw9rVaMoJ3XUi7AiE3SIuh1GHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=LzNfH1Ja; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="LzNfH1Ja"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso6468614eec.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778668386; x=1779273186; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6JXcuqkb4Uvvy0hPitb2uTD+GewzBCMOZ0/iRPS+11E=;
        b=LzNfH1JaU9C89EgffMuPi7uO4a0fG4Hak7EnVnMmmT70QaIkSuzQYG/1zgZM+2EC4t
         0umAy9MiXNWxwCwGhTtDuk98EK44fGn2h2JtyH7n1eYfnfhQFx5saP1shZyJf6hHtFfA
         hWvSg/L0o7Fru8fOR5KqUbcdoKX19TZIwg00kZLHiLAa718aIrB0hu6/X5+OsXRx09uY
         lNBTo5nV8K+w/O1WaePchinQMbFi3ac+S7migAWIdptXCOOKhVkQBmjrXUn5b+oK09bS
         Zy8x/sHvBnz6VUdF6XE+rKdqNEXZzkOZTVrfX6LGlw1MOMeyUnfKUF3RPF51N9YgAyD6
         gj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668386; x=1779273186;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JXcuqkb4Uvvy0hPitb2uTD+GewzBCMOZ0/iRPS+11E=;
        b=a2Ixbqkyegt+Jk/gGXzQNWKOrsBt3Yk3d77/F1pWWnS02B/ZGt8wog/9DHy2dWCBUU
         3QIffay2leJaM57HBWwGORfZfUsN/B7baUiwOEIKbInKfedk+gl+JhXcZHIt7iVboer8
         BhXduDvtnFOm/L9vWMQQhMTnuyav1Mkri9+sMwbZnWAoyaxq6x431SjWIIoUDt0BLJ+L
         HxAXaXq/2WxgZYoUL5difJSxPpENr3uU+uGXo08iENwKeqTzkfOb+s6F9IMitxnMHUMR
         XhoM49lX+Q1LdGFUa+sD3doLI3DXn6bJ7e8EsiDXXaTJlp7GMHGqh+jxB0e6E/DbWnhC
         gvvg==
X-Forwarded-Encrypted: i=1; AFNElJ8LkeQbQ3ii8RPYbYfDy+6skMRXJ2tSN7KIW2wv706U9+kHpHMjXIJWvB71a37uNXlUk2hcRy974fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyKcWPpuy9g78drPL/KZ1S0SkowijqWCe3w3LEuhOaheXET3tQ
	si50n3CjNy1bkG7JiPDIGWu78rVfoU/cn+VQImFGbuGKF77mZIb3K6WQRO7rOilm4594dJ1IgWk
	X7bygun0=
X-Gm-Gg: Acq92OGWry4bqjOrbSYwynwQE1rRWTK78ofRQ9AkYg/O+PkZH5mTrhnk7302/uaGiZ/
	oYoi+wftBlKHR9LfprEXicTzDQdbnE4Co4AwfYNjYbRtqMlOcA8p5DTz9k+JgFieHv1g8PYZvv/
	mDT9mGsb9RwLCo5gO5d4q7FRFdtc52Ds57nt2TTCB+culDsX2SFmwZRvG0Es6V4jkH1wuKyWGUW
	77qK1Nra0rCuvABVKfjxivn6bjxcjcf5QiH+CwRFUBo+PjOPQUP1Fvp2y6rbbfL0xmJJs1lH5UD
	m5DNHrpFsFSjy3n5uxai0AWO9GU/YzIahhv+dG8wejd7ntkBm6oH/N2Pe2h5sMo5CTE3IJbLyNQ
	U4wC5SjHTrraNwdoqz9qA4EnkRMC0PMlOz05Q4+houvhq3NX7MTdLB5R6Kds5K8kfvIBKnLJq9P
	fhT5JeHF38sYftxx5Up39XZQ0GaA==
X-Received: by 2002:a05:693c:2b08:b0:2f3:c3d4:382f with SMTP id 5a478bee46e88-301181aa331mr1540032eec.8.1778668385703;
        Wed, 13 May 2026 03:33:05 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm22241537eec.2.2026.05.13.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:33:05 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v3 0/2] hwmon: Add Murata D1U74T-W PSU driver
Date: Wed, 13 May 2026 03:33:01 -0700
Message-Id: <20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1TBGoC/2WNwQ7CIBAFf6XhLIZdaDWe/A/jAbbU4qE1QElN0
 38XamI0Hid5M29hwXpnAztVC/M2ueDGIYPcVYx6Pdwsd21mhgIbUQPwFqaDipwEGX3sgKRSLI8
 f3nZu3kKX65vDZO6WYrHLonchjv65PSUou79oAi54g5LQENQS9Xmwc+zHx147VqoJvz38eJg9J
 aEVojMGSP1467q+AAcoB2znAAAA
X-Change-ID: 20260511-d1u74t-c0cba8f1c344
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778668384; l=3943;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=XubH/O6xm8n3FFF345gC2jEfwCMEnkublF27VZ+i100=;
 b=4ATJFkhxDu3NdxHh+vWA7EQwBloSZK4elKxoxL7VYGX+KmDgFYez6Iu7tEo7F/fqs5gCbG8oV
 mQQJx/u95UJDrfoZYAJhLUDYZVAEa1UbuZW6NyksHH495jHPvxfL8Ng
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

Patch 1 adds the compatible string to trivial-devices.yaml. The
binding declares only compatible and reg (no regulators, no supplies),
so a standalone binding file is not warranted.

Patch 2 adds the driver, hwmon documentation, Kconfig/Makefile entries
and MAINTAINERS section.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v3 (addresses the sashiko automated review):
- Patch 2: move the new MAINTAINERS entry into the correct
  alphabetical position in the M section (between MULTIPLEXER
  SUBSYSTEM and MUSB MULTIPOINT) instead of leaving it wedged
  between CRPS DRIVER and CRYPTO API.
- Patch 2: rewrite the sysfs-entries table in
  Documentation/hwmon/d1u74t.rst to match the attributes the chip
  actually exposes. The previous table listed the PMBus-spec
  maximal set (crit/lcrit/max/min for in1/in2, crit for temp,
  max/max_alarm for curr1, etc.) but the chip only implements a
  subset; pmbus_core consequently only creates a subset of attrs.
  Cross-checked against two D1U74T-W units, both expose the same
  attribute set. Also fixes the in2_* descriptions that incorrectly
  referred to "input voltage" rather than output voltage (in2 is
  vout1).
- Patch 2: use dev_err_probe() for the MFR_ID-mismatch error path
  in d1u74t_probe(), matching the surrounding error-handling style.
- Patch 2: gate the MFR_MODEL strncmp() on rc >= 8 so a short
  block-read response cannot make the comparison read stale bytes
  left over from the previous MFR_ID read into the same buffer.
- Patch 1 is unchanged from v2.
- Link to v2: https://patch.msgid.link/20260512-d1u74t-v2-0-431d00fbb1c4@nexthop.ai

Changes in v2:
- Patch 1: move the binding into trivial-devices.yaml rather than
  carrying a standalone murata,d1u74t.yaml. The device only declares
  compatible and reg, with no regulators or supplies, so the
  standalone binding was not warranted (Conor Dooley review).
- Patch 2: fix the d1u74t.rst title underline (was 18 '=' chars under
  a 20-char title, docutils warning from the kernel test robot).
- Link to v1: https://patch.msgid.link/20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Abdurrahman Hussain (2):
      dt-bindings: trivial-devices: Add Murata D1U74T PSU
      hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver

 .../devicetree/bindings/trivial-devices.yaml       |  2 +
 Documentation/hwmon/d1u74t.rst                     | 81 ++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 MAINTAINERS                                        |  7 ++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/d1u74t.c                       | 86 ++++++++++++++++++++++
 7 files changed, 187 insertions(+)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260511-d1u74t-c0cba8f1c344

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

