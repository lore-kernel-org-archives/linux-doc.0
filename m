Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533937;
	b=ujpPqoIPnSTbwmZqKDe0kQwHI7KzFQb+kdU3FOYfUK0iaJlrWruwnC6imA/PCxLpsSci
	 DoegeSppywhnxopPCORJM8kWu11UOU2/Tmb3GR/WSohkY58cwpyDVpg9c8j/1mllEZC+u
	 RUTjZ/D1GhK1mzI9OqBQUWo8iQUJoHGx+UDBz1Xqc3o8WT6q4Tr3mm1Sg6zICM2QEFeqN
	 F3gVHOaL0ZWslJOQueRiKI2bK++qZVCaUDQOFTYukOmKxNDKsUdEVD/Y2FatxKf6FxJ87
	 wGuKf/lvqgcs27/tEkYsQQK/JyfxnUAc010tKWXZLCZkoovZG0jW1PJdGTUWW2V6GiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
	b=BnNR5YIVamgg3mnfD3p5cIdTAvETgVGQnkI+w2MQWZs/5QIJLmui/b53I0hRW5Rl05vu
	 4qSW40QVbFAeuqNr7VSIGuUtfY5LhhrOPJcmgJMnGwUJPg7bW1hzgIKC51NBCN3TrwTd0
	 cICggXFdGi2XFVeVZeDyhmZ3m/eXVmT9nHrC2UJ/7V4JcBRXX4iXY2Wjg0wozFaa9fWAH
	 d6DT0qpGWkwVSBo7eRKki/eZj2zg4bKo2f2t9qtR/Zst8oSnZPs86tQoCMln7n82XSD82
	 mKvR1UXn+CXku0V6NBTAItOvnt/y26+qHfnItfQMj7CFmfyM+E+hi2V7xH35ojy9fbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=P+hfWPaj;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A9606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=P+hfWPaj
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36681e85e87so51849eec.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533936; x=1793138736; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
        b=P+hfWPaj0ZPxfve8iCN8u9BUJLrC8WLn6r4NUIbKt8Gx5HF2A5CwU5Gur33AAqzDw/
         9CZFYtoBrBsFRmerRBGkGhqyyFkMFkZy6A9A1mbCzf5SmJyoUlqg8hmeux7tOhTjbIE1
         5UZ6LPQpMxtbCjlW9fg2F5unmOt6ornkZLav9dqi6pBtnr9FsC70ur6tZu+eA/sy5BVk
         BO7xukX3rHv5oYnjCx2mqaFTvPcbVWBTnbl8iD4uUUQ+0Ka/ghVnkyYazuHkdOv4exFg
         R3BAcq7GS4vGMfnCQEiOuAdz/7aZwG5jpiWVhCvGjpNwgVeqoLRNyQZrKHcckn9ityMi
         MgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533936; x=1793138736;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
        b=qj06jR6WCZvAXMC91nCVG9Do5+zM4AQ66wbZlekNXTJbHlwPzAm9NQrIAeCQJ+zpe6
         NTWe5gAfsu9JD0j2wk0/vMX312Q0TJH7B/W6LRBRlGtmNdNCZbQKHZYjqdZKmAuiAUTH
         jSxI4NFT4fUSGdTez94kLbCFbqwFVQNmOFa0ZAeWJk7NhK7/qlDpzXgFliI7PvGGmVHT
         jtxFid3uRdWggpMsZLByl2Jnan9Nv6aXMl7GkkR2u4E3zC4/iyXjmjgzO4fehCAb+elc
         R+SB9VzA1gqP1f+dT4tr+osN4Gn2xpKL22nOBfzZW12B34L3hZ8HOyW3gcuIJQ+3J4Bv
         X4/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwymLrVT9qRdxnKhuLbG8j99zh1oLrdZ95KbHI9tsxxS13gxRHfO3fkgXVdCzjCB6VvvezgjegFWJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeOser7W9PDEdpOJ3rnSpxnij96/3qGRvb36iN8Zd3dKBUkHXu
	MWaRX65JaT3Z691+620nEEGOzno30hYqbhvJqSklUZ9rDeKq/41THekEVpjqzDD6s7U=
X-Gm-Gg: AYBFou2NTtYMM6KgGKOXJZoHhMxvHEr0KMxNjeEO4+hhy03inI3nq+DhfPhQTkIIDXd
	Cc+Owk2gWhkUqzvoyWW/JnGOQ+q6pbsg+sYzlXWS1W5TusgjhvPlZDpSNABnNNlwRnNkcCEuEGi
	ja+uYVu0hDuXzSy3XI85qCo0+iaxOKR4RioY6WyTG4lkDC2uBnfSN3nkGCD0WlyyOXIRx1fu6cK
	daBFqbEm0qsPI//xZMoNuKrK/rgW7XE4lmnwzuKTQ0cJPdA9XzjqTG3mLhyC9z6B1dv8owhkU64
	5keokk9VSLmdpV7kdYFjADnp7Xk+6XzOcqjJv6pRlOtlGsHKDbH/Sie6IXBZu1bN8bCQIB6sqTp
	Njl4u7Id0TceIwKapqpRqatgc9uDg/FoGeDgCObSmsKqn+o0/X/a1eOVbqfvktAh7pFc1Cz8LgH
	vzuvfmpvr868oxoDs17e/4x3aU56xIozPhpEJyNZLSJcd5W4U0ifro8R/u+Oo+A0/bY6RD9E7GN
	w==
X-Received: by 2002:a05:693c:829b:20b0:35c:4800:4da with SMTP id 5a478bee46e88-3674f71013bmr798597eec.41.1792533935562;
        Tue, 20 Oct 2026 15:05:35 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:35 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v3 0/4] hwmon: (pmbus) Support relative VOUT mode, add TDK
 FS1412 and FS1525
Date: Tue, 20 Oct 2026 15:05:28 -0700
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBQFf4V0bU1fvFz5H8ZFKRdbEwppoWII/
 26LG02My0nOmVmRB2fAo1O2IgfBeDPYCPyQIaWlvQE2bWTECCsoIRXWj36weOyb2ePOU0EZ7lo
 huChpqWiN4nF00Jlll16ub/Zzcwc1JVNaaOOnwT33aqBp9zcQKCaYSCghBxAg6NnCMulhPEqDU
 iGwDwcjPx0sOjivC8UlqVj+7di27QXnDTnzCwEAAA==
X-Change-ID: 20261008-hwmon-pmbus-fs1412-fd4434717c19
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=5458;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Cgjr4yL6yoxtDFniz9+AjdbJjyXyIutBZSiFTyIWcYk=;
 b=xGl9KxFh//d+o4NO62M4Y4oDaLxQZUCGhPiRJwVguTHEFX3erMYQLxOQl/6+KcN2vE+iH4tZF
 uE3g7uXMvf8AlMBVOEchrh0/T610N3bc32oAyIOPM+AmLqe77N+M1eb
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
telemetry. Their VOUT_MODE is read-only with bit 7 set, the PMBus 1.3
relative mode: the VOUT margin, warning and fault limits and
POWER_GOOD_ON are stored as fractions of VOUT_COMMAND. The PMBus core
takes bits [7:5] as the mode and rejects both parts.

v1 worked around this in the driver. As Guenter asked, v2 instead
carries Lars Petter Mostad's 2024 patch adding relative mode to the
PMBus core, rebased and fixed up, and the driver only adds what is
specific to these parts.

Patch 1 adds the TDK vendor prefix, patch 2 documents both parts as
trivial devices, patch 3 is the PMBus core change and patch 4 adds the
driver.

Tested on 7.2.10 on a board with four FS1412 and one FS1525:

- VOUT_MODE reads 0x98 (FS1412) and 0x96 (FS1525). Writing it is
  NACKed with STATUS_CML invalid data, and it keeps its value.
- Neither part implements PAGE; reading it sets STATUS_CML INVALID_CMD.
- The output voltage limits read as the raw fraction times VOUT_COMMAND,
  and writing them through hwmon stores the expected raw values.
- With VOUT_OV_WARN_LIMIT at 1.5 the FS1525 sets VOUT_OV_WARNING
  against its 1.094V READ_VOUT with a 0.600V VOUT_COMMAND, so it
  compares READ_VOUT against the same limit the core reports.

The PMBus core change was also run against the board's other PMBus
devices (ISL68225, ADM1266, XDPE1A2G5B), which bind as before and whose
regulators still register.

The driver registers no regulator, so the relative-mode regulator path
was tested in a VM instead, with i2c-stub emulating an FS1412 and a
test-only regulator: set_voltage clamps to MFR_VOUT_MIN/MAX when the
chip has them and is unbounded otherwise, list_voltage agrees, a
voltage that encodes to 0 is rejected with -EINVAL and leaves
VOUT_COMMAND and the limits intact, the limits follow a new
VOUT_COMMAND, a non-relative chip still clamps to its margins, a
VOUT_MODE of 0xff is not treated as relative, and a VOUT_COMMAND of 0
fails probe.

The FS1525 over-voltage fault is an analog comparison at the feedback
pin, so with an external divider it would read in feedback-pin volts,
below in2_input. The part cannot report the divider, so the driver does
not expose it as in2_crit on the FS1525, as discussed in the v1 thread.

---
Changes in v3:
- PMBus core: reject a regulator voltage whose VOUT_COMMAND decodes to
  0 or less, which would later be divided by (Sashiko)
- PMBus core: decode the regulator margins with the register they were
  read from, and in relative mode bound the output voltage only by
  MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with VOUT_COMMAND
  (Sashiko)
- FS1525: hide VOUT_OV_FAULT_LIMIT, so there is no in2_crit (Guenter)
- Link to v2: https://patch.msgid.link/20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai

Changes in v2:
- Add relative VOUT mode to the PMBus core (Lars Petter Mostad's patch,
  rebased) instead of handling it in the driver (Guenter)
- PMBus core patch, on top of Lars' version: check VOUT_MODE for 0xff
  before testing the relative bit, use signed division and clamp the
  written value before scaling, reject a VOUT_COMMAND of 0 at probe,
  update the cached VOUT_COMMAND only after a successful write
- Driver: drop the VOUT_MODE and limit conversion code, keep the MFR_ID
  check and hiding OT_WARN_LIMIT on the FS1412
- Add the FS1525 (driver, trivial-devices, documentation); the parts
  are told apart by IC_DEVICE_ID
- trivial-devices: dropped Krzysztof's Reviewed-by, since the patch now
  also adds tdk,fs1525
- Picked up Krzysztof's Acked-by on the vendor prefix
- Link to v1: https://patch.msgid.link/20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Abdurrahman Hussain (3):
      dt-bindings: vendor-prefixes: Add TDK Corporation
      dt-bindings: trivial-devices: Add TDK FS1412 and FS1525
      hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525 driver

Lars Petter Mostad (1):
      hwmon: (pmbus_core) Support relative encoding of vout related commands

 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1412.rst                     | 124 +++++++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/fs1412.c                       | 171 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.c                        |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c                   | 121 ++++++++++++++-
 10 files changed, 433 insertions(+), 9 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-hwmon-pmbus-fs1412-fd4434717c19

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

