Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91923CF673
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 03:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778816190; cv=none; b=sOdq1hfMKB4M9m4Ncj8GEyw6tSsZeZ6Eo96CFrvmCs7yLyUL6D3mScbnME9xeq3kW2uAuUmuWaBJElYd9w5hPW0qS645vwTKo1a1R6ILXuu62i7H2gkm12JpnabA7bQmiZlxBTevtCBpDAqFR8Xg/cKHet9NaWajsXl39obmcco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778816190; c=relaxed/simple;
	bh=mw57ejDRtN0XX9EiN+uQOeymPLq6jvlCR5tyqS2rAHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVAI9TA47gh0TY2oMbCbp0vPGbgHfP6cLM++kDShf4tPgDhCM57nDn4lGPJlqLzPykU650cVEbVhjNZOW3TQueQpZ0DHXwUX2OzlHcue6UI8dG6qFyxJ6T0JaMtxRBezzBw42rJdk9fGFIXKxzxHOlkwNV2lzTt89XN5fzAgWtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0wgExO3; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0wgExO3"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f0ad52830cso12943069eec.1
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 20:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778816186; x=1779420986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzVesS1EcutlNeO/dz31GGyipwDrYuICjjBOEOxdGKI=;
        b=f0wgExO3WtSnc4cD8AykVfbifCqd7KndICO9TjZCq2u/ZuHXDyk8m8O5bieTL8Cxzl
         m2dnEvGM5iwCOAOWCLQcvg74nVxx1gTWuJnVOK7MaJ9XV0+KdSysDrOsgrApAX8dvDNE
         jdeDZ3jXl1c1/Y41y3vkWsw5XHOryyW5/pxUoscn4L7DiuXjm/KwThORfjtwo/V7nvrJ
         thUKQir6mp/CWOOSFrOhxfw1uJ9vKdg1Ms6qgB+hygyH0gkO9++Ldo1BbQqKbi4KNPT/
         E/20hwe5OPi2YFQHTWbcuuhjbtTqbCucV2pTdCGVQZuE27bBm7bkCkHkz0LF2FX8sci9
         DxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778816186; x=1779420986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzVesS1EcutlNeO/dz31GGyipwDrYuICjjBOEOxdGKI=;
        b=oO0ky3ffRUN0xpwvILwGJKb63QbM20z7qX9hemHl23QpIt0KTHv3GKk41pn/fSqBqs
         /91kwwrbbQ+pEojc8gFUrGjBTtJsPqBAQlS0rbnhxoYY7SmuNt8HwG3gmi88RsoI5yyo
         +Rbhl6h+ncMWF3jG9YmEuTQfEgJSxsRke9EvxEM0DgORd742MwT0JAxVoSdvbNQqqDFZ
         zwG9WYwwi5AykYazpjLKIcmLIKkOEt+YC5H3FZGVmC03RcExlY8tMbqPrUeHK/LhqQFr
         vS0uWHuGPuGLoSW5nowWm9DzKykSPOtLz10O2gN1L667rgU+QVVF+kAqbkmlj9GhoGgI
         akAg==
X-Forwarded-Encrypted: i=1; AFNElJ/bRUuWfFaKioRlPkLZn8V44HwhZKiKBWfeXARxO4gbdEBc9dOn6c1xx3zH66pu4Kc0hfQ6pp7B5z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfF3ahwiJ4ZAhl1MiqKXthdUZ73AGFYmDtOupdth5RuJ4C70G
	hoXzhrOjpmVTmWVEQaSjG8vHS9Kz/u1jh5BhZuhfZpkL7geE+Q/l31sL
X-Gm-Gg: Acq92OHXJlJqRWKVwgkeApxCizyWhDtIfOXuseesZGrmISlUna9a8kB+DanG1jnOf+c
	AGYcfSVNX/fjOsjxSMalIIgByYirC8PA0W3bsuFXPRQ0/u4iuW1zyIKHmn03/J7WJYEX762RPCj
	2vKhPqWynHvM6pkioCmUICRRBc9qqTpiCrmC5qRDg90EwHv8Ol09Aze84vv+oHg1+qFpxuJ3Cc1
	mk2LZa4ioPil141to2h+Vq1+FTyhaDSimwyi5FpV08m0SckhzmDDrlzHgz1GAf+zgpQIb2tU2ns
	aqVpKd0ra+zq/7Ikm48SXkMhValRX5qCjOOXs9RGYCaZYFozT5bQpsw4nwVTkkwukde0x7uI26V
	zmq5RUvdOO1sTKEtB4T9EQjPcBOgxxoPss0zZ4uoP+G45dtjuSsSOUcpduqlWujKHPV4/RLNwaH
	H6ONCqzgpoqNYcOiO6XT46i0frXyXEYBWXpOERHro6+CK9T/Gzj5uXM43AC+ULjOo57jedNkk/y
	uslFqYzKc60Zso=
X-Received: by 2002:a05:7300:fd10:b0:2ed:e12:376d with SMTP id 5a478bee46e88-303986bbeb0mr1111031eec.35.1778816185684;
        Thu, 14 May 2026 20:36:25 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcc5asm5430789eec.22.2026.05.14.20.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 20:36:25 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Denis Benato <denis.benato@linux.dev>,
	Zhouwang Huang <honjow311@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add MSI Claw HID Configuration Driver
Date: Fri, 15 May 2026 03:36:18 +0000
Message-ID: <20260515033622.2095277-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds an HID Configuration driver for the MSI Claw line of
Handheld Gaming PC's. The MSI Claw HID interface provides multiple
features, such as the ability to switch between xinput, dinput, and a
desktop mode, RGB control, rumble intensity, and mapping of the rear "M"
keys. There are additional gamepad modes that are not included in this
driver as they appear to be used in assembly line testing or are
incomplete in the firmware. During my testing I found them to be unstable.

The initial version of this driver was written by Denis Benato, which
contained the initial reverse-engineering and implementation for the
gamepad mode switching. This work was later expanded by Zhouwang Huang
to include more gamepad modes and additional features. Finally, I
refactored the entire driver, fixed multiple bugs, and refined the overall
format to conform to kernel driver best practices and style guide.

Claude was used initially by Zhouwang Huang to quickly parse HID captures
during the reverse-engineering of some of the features. Since Claude had
already been used, as a test of its capabilities I had it implement the
rumble intensity attribute after I had already rewritten most of the
driver, which I then manually edited to fix some mistakes. I also used
Claude to review the driver and these patches for any mistakes and bugs.

Assisted-by: Claude:claude-sonnet-4-6
Co-developed-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
Co-developed-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v3:
  - Add mutex for read/write if rgb frame data.
  - Ensure claw_hw_output_report is properly guarded.
  - Remove setting rgb_frame_count when reading rgb profiles as it always
    returns garbage data.
  - Ensure rgb_speed is getting drvdata from a valid lookup (not hdev).
  - Use scoped_guard where necessary.
  - Reoder claw_probe to ensure all mutex, completion, and variable
    assignments are in place prior to setting drvdata.
  - Ensure gamepad_mode is set to a valid enum value in claw_probe.
v2:
  - Use mutexes to guard SYNC_TO_ROM calls and pending_profile calls.
  - Rename driver to hid-msi and add generic entrypoints for
    probe/resume/remove that call claw specific functions in order to
    future proof the driver for other MSI HID interfaces.
  - Fix various bugs and formatting issues.

Derek J. Clark (4):
  HID: hid-msi: Add MSI Claw configuration driver
  HID: hid-msi: Add M-key mapping attributes
  HID: hid-msi: Add RGB control interface
  HID: hid-msi: Add Rumble Intensity Attributes

 MAINTAINERS           |    6 +
 drivers/hid/Kconfig   |   12 +
 drivers/hid/Makefile  |    1 +
 drivers/hid/hid-ids.h |    6 +
 drivers/hid/hid-msi.c | 1662 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 1687 insertions(+)
 create mode 100644 drivers/hid/hid-msi.c

-- 
2.53.0

