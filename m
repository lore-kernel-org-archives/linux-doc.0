Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CDA37416B
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 04:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776572790; cv=none; b=SM1l/nx5jAYWdzuXq49Qn27NRi4WP9JmVOWQ2wNXzSKt0B42e5OeZKrkDfnJ393HUvqdY4vJ9Mz9j8rMZWN6e/l0haIlPS/H4nBVFWlK2zRjQqbRYJ2XWmB9GUDDBZLZJ+0A6Y42qABCdfM9ziyY7tOU+B8W76wucW2x80SRz8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776572790; c=relaxed/simple;
	bh=AuNP/KE4PnfIt2D31XxWMWPSxKrUM2knYybOtwht+WM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPTtQyL7xwuK337b2q0ccWyOizlgLfIFv6J/KGgldQR5aMLr7NJmhQNuYATCAulkipAcMhrtf8Q53O589XcBJSYxwdAruE21wOtjt6SAKW7EB0wskHGcDTQ6MenqryeHCHLhMZ/rJLDYcCWl5WOfKEfhtNNkQBG5ISpLchAWn5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kt4U5wxT; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kt4U5wxT"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1803891eec.1
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 21:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776572787; x=1777177587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fnym/LpHp0hp5zHbqP1JOO82fTvUYrWrx/rkcSLdtT4=;
        b=kt4U5wxTW3/4dO4675m1TeuXaD+kRxLkNLy0TFytey8BdNYeRZhNNF7vkkFQu4nbfU
         sqI56sMe7oXIuaRSHOdtlgXp7LKz16Ln7x7I9cD+xpvQpm7+cQRjKsSsX7YobSgprIHx
         h0PODLfalt8bsWXD7bx/gpYbjrLA3GIsrYkoS0wfjD3ctIDWqrnhVEm5PvKtL/08EsUO
         hu5Qcy0nFx38hqPBdlU2JQj+F82vK9IFrtlXn7oiJt4/6mhiKNH7Wqk6L6Z4DG8NKGYw
         qmlUEbIntYJLm/ZXa+Uyf8Qe6fst+PSZ1o8axliiq2He8TKHWx3YXdLI5pmFzmXJPtBw
         nosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776572787; x=1777177587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnym/LpHp0hp5zHbqP1JOO82fTvUYrWrx/rkcSLdtT4=;
        b=WNVvggg6RjiK6CVzTNGgZ6Om9SUjcqal4Ez4ypNuQI0s3ULM2ecuRA44j/fTtNhqRP
         ZTas4qVFZVzz9GMAv0ndmjWAFvVqBJzbOH/Tagmn2jeMV8ZuQu57Q8bXHI7Up9tksZyq
         mEqmg7fGQ/AgO/Ux9+fpracgHxDOvkBnMKdcm0D15JRWod1Fnq1QIyga2uxwfw4m6uyO
         6u8USAMesvT6JlGz7UaqesZOVL+hDWw12c6cHvKMSbpdLZhQkdNLqGRfK6ZDFcL5qW9G
         qTkaMBqjwkYlWmHI8eXVpFDDvKXHTJvx2CRAPvABXBn2eS6fiZu6F7d16lSsd41RwrDn
         NgvA==
X-Forwarded-Encrypted: i=1; AFNElJ9mEGRAbIwPl17tELqtOJLIZGf7jmr3FkwZcNKSrueLYiUniL7imtHNQy3m2cT207FT8nTkWr6T0k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhHmHcZRYrEuO8k+8JCoppaLSY744GEverxJjzQOpCcEpC/j6
	QfYUrtM7yy0WxgkDkiivCHg8HAhuUopYbHn6aXH1yI7LGyLunpdV5Dic
X-Gm-Gg: AeBDietA8QmGy7AUUlWXqld1o2OBOnWUHcvWI0/fG9fCachiZMdEafzkEqF4NxNQpnK
	OLeaDzljrr4x6TfYXJVlFz9LAJZQYHbrEdBv1DNTIkNoAfvwgpvGjAECKFZOd4cq5fA0VYYaHKs
	fv915p3Ikh/kJQEBgo42UL3vkvv+vtfANfTQAzUD7mk5H1arR7czirgTdHihmwxdzhrMP9tg8Gr
	qfCSxFGWCzTWVjyD1w7vOoa6SnW19LNwqwXgH/kJq4aam5SNJGLDf77mfewUlt3NXQ3brm3LN7h
	IEf3KvFiI3mJ9kSSP3fZSvVLNoa0GDS7hpa7pZXEIu6Hxj8dQEiY3MSMqhHco0VPazB9FIDJoEQ
	WkAhV98w3YKCJZqldkJ14s+OXmNDiF7DL9Za+ls3pdpdx+iDcIVp5yb2jRIrcPAl3UjTcnDDEq6
	wZJX86/7IPDXxRaIK4KI1cekyLJgrenralGkejdQyY2hcz2skG2Vl8SU3SB2CTK67EgDITqXPS7
	3JWhIMKFsoW6Xw=
X-Received: by 2002:a05:7300:6413:b0:2da:a813:a60c with SMTP id 5a478bee46e88-2e4786462fdmr4426224eec.20.1776572786653;
        Sat, 18 Apr 2026 21:26:26 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm8796469eec.31.2026.04.18.21.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 21:26:26 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Lambert Fan <fanzhaoming@anopc.com>,
	Zhouwang Huang <honjow311@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Add OneXPlayer Configuration HID Driver
Date: Sat, 18 Apr 2026 21:26:19 -0700
Message-ID: <20260419042624.625746-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an HID driver for OneXPlayer HID configuration devices. There are
currently 2 generations of OneXPlayer HID protocol. The first (OneXPlayer
F1 series) only provides an RGB control interface over HID. The Second
(X1 mini series, G1 series, AOKZOE A1X) also includes a hardware level
button mapping interface, vibration intensity settings, and the ability
to switch output between xinput and a debug mode that can be used to debug
the button mapping. Some devices (G1 Series, APEX) use a hybrid of Gen1
RGB control and Gen 2 controller settings. To ensure there is no conflicts
when the driver is loaded, we skip creating the RGB interface for Gen 2
devices if there is a DMI match.

I'll also add a note that Gen 1 devices also have an interface for
setting the key map and debug mode, but that is done entirely over a
serial TTY device so it is not able to be added to this driver. There
are also some "Gen 0" devices (OneXPlayer 2 Series) also use it, but
the TTY interface also handles the RGB control so no support is
provided by this driver for those interfaces.

Signed-off-by: Derel J. Clark <derekjohn.clark@gmail.com>
---
v4:
  - Make all delayed work part of drvdata & ensure they are canceled
    during remove.

v3: https://lore.kernel.org/linux-input/20260412213444.2231505-1-derekjohn.clark@gmail.com/
  - Ensure default button map is properly init during probe.

v2: https://lore.kernel.org/linux-input/20260407041354.2283201-1-derekjohn.clark@gmail.com/
  - Add DMI quirks for certain devices that ship with both GEN1 and GEN2
    MCU to avoid clashing when initializing the RGB interface.
  - Add left & right vibration intensity attributes.
  - Add additional mappings for keyboard inputs.
  - Add a delayed work trigger to re-apply settings after the MCU
    completes initializing after a suspend/resume cycle.

v1: https://lore.kernel.org/linux-input/20260322031615.1524307-1-derekjohn.clark@gmail.com/

Derek J. Clark (5):
  HID: hid-oxp: Add OneXPlayer configuration driver
  HID: hid-oxp: Add Second Generation RGB Control
  HID: hid-oxp: Add Second Generation Gamepad Mode Switch
  HID: hid-oxp: Add Button Mapping Interface
  HID: hid-oxp: Add Vibration Intensity Attribute

 MAINTAINERS           |    6 +
 drivers/hid/Kconfig   |   13 +
 drivers/hid/Makefile  |    1 +
 drivers/hid/hid-ids.h |    6 +
 drivers/hid/hid-oxp.c | 1580 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 1606 insertions(+)
 create mode 100644 drivers/hid/hid-oxp.c

-- 
2.53.0

