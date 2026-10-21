Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551732;
	b=deAinPKQ0rJ4RdO/e5yDnEGLbJWf5c79Dog+ZaEpnPjN64++ooLNTuetITUedNMY9oQY
	 u6GMKO9osm8xuONonpwIDzunXoB07IkpWlurOVqUy/EkoKb+EjSYFewMM5Tkegrwvi4T0
	 Smk9CcgYD//fpoxFkhbrKcVxXyarVUSc54jpkzhxHwqi4zGJ+UHqVhBwt8TQPCJcJrFDG
	 ES7nlqX8w24QzajpWAoiHj6ebVpejSIBuzmKZ28KZ5tukLkRMCh6HxTTyBiZbtJZmkchW
	 3jeCw8QhAPwt8nfbTRl1ynpcNO3Yh2CxcV++m5TI2WzkcgpIY+4Fh6vFE5UMCMQZ8dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ttCQgnuTfkTRykr2I2ffC9sly05P32gI/ZHKSArbVBw=;
	b=YE2bs0WTS5GnXK5zOmRtY5v5iUyjIpJ9xG34mr9z3NCjukQl7zfIBCgIBxYo8akHUsu8
	 ISAGlr8TGzBFglJk+nZnYkJ5LDW/XytRSbrFjxD33hGhQxOXMw/Xd+BPUcf4kx83dVRAp
	 1geqnH//s9sb5ncZFTd0iagGbrNQv2riNmQ/VOdzNrS3TiduwnfVAKmqqD8vCEiHAQuYA
	 RrX+VPCY/S0MydpN7pVDlrnJe6Hfob7lyadIG+xPmpVpX5nMZvqFiaHABw1d/rc6eFR5S
	 huD67pE8a4gSqX/TMA+e1DHFxFkvWa5K9fgTyN3zDr3n7p3i4rFz2zsPfY+KkC5HJ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NkSIyIey;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C5606A31A
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 03:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NkSIyIey
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so630993eec.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 20:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551730; x=1793156530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ttCQgnuTfkTRykr2I2ffC9sly05P32gI/ZHKSArbVBw=;
        b=NkSIyIeyj+gr2HD0pvtuTwcvM7iM0lcHLgdMm5mEm0JXvSg3/dCqqiw2MWrIdxHcgu
         iqn8f/NvDNrkyHqf0OLJNNmqD0RW4tpExkxHc3iZZsWDlwKiHkUsT0Vtw/n+22Qezyuh
         wa9Seo4Vj7E5OJBbeUGEU8RyqcelCQV1864dI2iCDGgI2Rhtb1068cl3CZjefwifbFbC
         FvCwB/E9PG8DPzb9unPRzB+EYN8U5IK5LfcXreR2+voJYEqqN6IAy3Etct4lt8PeF73W
         FTN3IeQeA7JDYyaAOy+LjWoZXjCF0HWNmQ8IdNL3te2KgHuKGQKHXSSQ/+2PebfTs0kC
         DFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551730; x=1793156530;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ttCQgnuTfkTRykr2I2ffC9sly05P32gI/ZHKSArbVBw=;
        b=xbbbOYk5fRwpJt5z6h04KxRngpkoD7j2AClUoFxrM8Zn4UCEVeXK1ANeQE2Z7G9qdF
         pWgj7JTBbXAgGTFzbiAmJ6/fS8TNHmIG0NBPn62QLVuveheMRhZI+YdRLrVgFs2uHCSz
         ugedZZqZulpztTMH3WJ7NpkovpmSWrngd8gUBwAKmV1tSOIbOOjtdAmV9hiuU7oZt452
         rTsmqPsBSldNIWpml11ZRZJ2OkNm45Z1WuDz+XpOd1wyk426rv31zNs4qpkW0VoeHiR9
         7jaIqD2NPkECe9cU/CyE8hr0JG+BkGI6pwnC4+uVt1Oqh1R4cIFO38iuVPvaINYCxQkS
         5yNg==
X-Forwarded-Encrypted: i=1; AKwUvBwRwGaok9xcvfECpvwIOy8W11NLWBJqeSeL9zoKzcWViogp8hphs43ikKG0vQWBBflJk/X/AarmekA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfY23Et8yelpRjvjbpnMEAu8Vt/gIyKkZpkAt9BJVWZALF8G3m
	QnzLNGY9j0qhD2RdS/pqV9oFVWYyJI3Me6rPCx80BecBI/Zsi8yNG95lwIM9QZf+tsU=
X-Gm-Gg: AYBFou0GQuD1ZQr2DB6FlhFz22ReauqIuoyaZIxyW1v7nnooKSkkCXnjB7XbC1TklQR
	MQKIuPpRuZXKjkQSpJaPzho2Tdxe8k2Ae2WxZXhtDC9I4tjKTNu24JZFKe+9obggoSvUf/XHDT3
	OXuiUFf4ydVQT+wbvI5SVio3KjicK6Z5kya13DlYiLbtGZ7ZNjtJpZbc2gMLaXG5MAydPB3ff3Z
	srJvTnaEJW0z533IFsuZvxOHnQPvdChYUUsMHUvyjVtgh+/2A3jkRWqCx05o72XIoZn/L6dQudp
	mooqUQk+2tLYCrV1vinGOFh12UiP25hKdDiqDDWRJ/vf5n48uZ3GQehcA9PCe1b9qGYDOyVZjCd
	E8Wgc/ARkWO6oI/9T2e4e6sEb7MGP6DdNTtdYImAKtUssH1sqfPm6X4xbryq9VQnQ6s3NWwgg3Q
	6elHtGuMEJcovOvKeXV2TlmnCTGOiFeAOu67HAw/YTuMmblUhnPPldL73SzJZigjzwHNIF8d/wh
	Rc7M6/b8GQu33l/OhNPfI3TE808bmX215XKYkv+UGKbmQ+EqRz4uoDPhoc=
X-Received: by 2002:a05:693c:42c9:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-3674d347be7mr1062638eec.24.1792551730166;
        Tue, 20 Oct 2026 20:02:10 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:09 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v4 0/4] hwmon: (pmbus) Support relative VOUT mode, add TDK
 FS1412 and FS1525
Date: Tue, 20 Oct 2026 20:02:04 -0700
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNTQ6CMBQE4KuQrq3pawsFV97DuODnVWoCJS0gh
 nB3C240Gl1OMvPNTDw6g54copk4HI03tg1B7iJS1nl7QWqqkAlnPAHGUlrfGtvSrikGT7UHCZz
 qSkohFagSMhKGnUNtpg09nZ/ZD8UVy36V1kZtfG/dfXsdYe39PBiBMspyVBgjSpRwbHHqa9vtc
 0PWh5G/GJx9NXgwhMiSUuQs5fGnIf4bIhgxVDrhGYKo1JuxLMsD7uddT08BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=6068;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=P635YMoH6bcSwkiW3N5b1e+xtcoxXztYjq+04Gb4V/I=;
 b=XuCBz2zBUSKUoFlpM3baIQQGX6rPiS62ng0fT0DhXGULDWjrrfyLUU+zI8aTKeGO/rfc95aXF
 hT4Tk2cp4QzCU1fzInufGyn9MHsE+kVGR7ob2ekGIeZmaS/idUDnY+x
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
VOUT_MODE of 0xff is not treated as relative, a VOUT_COMMAND of 0 or
one that decodes above INT_MAX mV fails probe, and a limit whose product
with VOUT_COMMAND would exceed 64 bits saturates instead of wrapping.

The FS1525 over-voltage fault is an analog comparison at the feedback
pin, so with an external divider it would read in feedback-pin volts,
below in2_input. The part cannot report the divider, so the driver does
not expose it as in2_crit on the FS1525, as discussed in the v1 thread.

---
Changes in v4:
- PMBus core: reject a VOUT_COMMAND that decodes above INT_MAX mV, which
  was truncated into the int cache and could wrap to 0 or less, at probe
  and from the regulator (Sashiko)
- PMBus core: clamp a relative limit to +/-INT_MAX before scaling it by
  VOUT_COMMAND, as the reverse conversion already does, so the product
  cannot overflow s64 (Sashiko)
- Link to v3: https://patch.msgid.link/20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai

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
 drivers/hwmon/pmbus/pmbus_core.c                   | 141 +++++++++++++++--
 10 files changed, 452 insertions(+), 10 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-hwmon-pmbus-fs1412-fd4434717c19

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

