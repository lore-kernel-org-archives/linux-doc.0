Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64062737F6
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562297; cv=none; b=VkAmNDoDnKYQTk4n7Esk5eefaRlwcZ14M7cHPVEQOqgi6lZk4s2nJCA+FrLCzOY7P+bZAwRwdjepiFicFKjXixuhgpTtyHtIcJqs45n6GQ2cWVGNZVcACXYvrPC20hSpxpsOenx4Kx5TSiIgjnXMB70d8QhRJUsoGZnJFoDiakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562297; c=relaxed/simple;
	bh=TNOReyKeSxvnchWjGZNXLUxlPtmF/TJa8GbVtAOOrqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fVfk0pCX0KRyM4oUoFnOUiFIedhIiHjq/5o4YqbLEdAM/Wizo8nriwbFu9mShCF2QAeKrNB+1MRLDINagdGxLB13d5YPf98932JCQ+o4A2MjpKKcZWXEiqadFyp6WYnFZfVitoQwqpSNAy/HfyF6KzefS5bMNowz4NYM2paaamE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkn3Q34S; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkn3Q34S"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64b5b68a9bdso3179128a12.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562294; x=1768167094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vX1nJ/KwU+ERB9DqMZcEiz8CUIvFleb2W4tNHZPrWVs=;
        b=gkn3Q34SvpvxvPXw8kwwczMEXscFEGvmkf9Q06uuyNY7SfFd84s1iD40sxzKCoH4b+
         GV7skoGH2uhHPvVqwbGHk/5c/WVsUBDQxG1JvpGjkLosRgZByEzTMbuOi9PpPCplb6xy
         4V4AWaAd+KAoAvQfJ2ni/VIkN6Ty6FnxX4QtWnG4HNxCnsZyoYvz2mO6jmVhF9Up+Tz7
         WzZhcQjxdoH5PZAKnIQO3vJOaLnElstZJuL7F63cwYe1PW/W2a6UOB63/56UXoF7a+3g
         O7ck2N/KMuJJKABctIsjGPN7gvJW1d2rBjtEfxOK/KpZLUx5meiSq/vd+tKu2B5xbw3O
         92JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562294; x=1768167094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX1nJ/KwU+ERB9DqMZcEiz8CUIvFleb2W4tNHZPrWVs=;
        b=CB1jeGfmcwxNMlmQAcZHqgQxk+oG6cPrmDkO4OF+NVwxXXZ1LCQsiYuku12r8PJaal
         LOSXMr11dtIpfyrdITSvdq3bJOZBjBj4ZPU5SQDh4ZgKrsgZflpi6XqAlDvuH8fPVaz/
         xi8A9QgyKXWEzl7iYYRG+58EHnDSUSFQyjox5Gz5Wc+3fy9SAVO7yHOZY52CJj1kdsc/
         oVESGt74scoxnZq0fbpl2d7EK7CT/w4/I320gsn3P+ofaaNl/Um/VXrmAq9fMNUMN5wp
         mCuCTRxuy05sA64v3wGKd9W2uS+2kQ8SF+GR0JCENaqDfca9CVQtlS1wacMlp1wzsmxF
         uUgg==
X-Forwarded-Encrypted: i=1; AJvYcCVWqX2ehSBDGvmvjrQdzFUeUyAnrkssOFaG9N6ioCElrT0uosu3wSJYU1iyN0BpsTDjhHhV1FldqK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdHXtToAF4Qx5METCpIBiX9TsU+1jYE5iK/1JCW/i4sKMtHoYe
	sQ+qv0vxkrhQK7QyI6YCRSoHM05XCdvTsnlb3nswXZUZPZWl3IkCkGe3
X-Gm-Gg: AY/fxX4AHIA76E3X5kZ+cr9WuE398IBM3VYjkKerkqk2PVBX0QxtfrI7xL8RLXxOoTt
	tyZGaz+1cJTq4OFo45SimJVAQEwiQjIGXUHLSrkbIF73GoxP97rdUSqaazPoscHwfS+K3uBMuEE
	udpbDqrHjWB7nLvPsg8RR0S0Xe2ywsBcMhoDjA1UmrYdBDwnaeiHH+31M2K/N+J39WL1Qs3nivi
	SmW6HmjI3YZ3UxYHEtNaaxx5I7BqjL24evSJM0tXvtkNSchgAs1dpp0/uZQsomfkSjpZY14IqdD
	Gp4RIOJz0SFEeT1EemrdiqF4Y4bAi1Bj9qYeJORw6WoFFkAoi+TeZO7ZVxemCqWW2MFRIHZmZKg
	Umb3jQteZWfAMEL8T3H4Axdyp+tbFhXktvV65gLYOeyn7VaPvdIrYlLFaXjPhX03hqAoIKrIH3D
	B5SL4vrGqzaNdsNYmdm7ta6dEtl31CJH23MyGPSuJ2iAjMiIwbuU0PUhgx8slhGSUV
X-Google-Smtp-Source: AGHT+IH9VObKoIZ26E6P6XUYtsRgGhF4IuzPxCVXmWX+XnEXOUDYTOW6tdmIebLvOtmgM4+nvN5b0Q==
X-Received: by 2002:a05:6402:268a:b0:64b:76cb:5521 with SMTP id 4fb4d7f45d1cf-64b8e94bf43mr26815826a12.2.1767562293872;
        Sun, 04 Jan 2026 13:31:33 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 0/6] Input: New EV_BTN event for generic buttons
Date: Sun,  4 Jan 2026 22:31:26 +0100
Message-ID: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds EV_BTN and it's handling to the input system. It's main
focus is to add a simple event for generic buttons, not relying on defined
usages and meanings.

Joysticks unlike keyboards, mice and even gamepads (though that's debatable)
define arbitrary number of buttons that don't mean anything. They can be used
in any kind of software, but mainly games, by assigning them manually to
functions. Some games even carry default presets for devices based on their USB
VID:PID pairs.

The more important issue that this is trying to solve is the longstanding
problem of limited button support in Linux. The use for arbitrary number of
buttons wasn't considered some 20 years ago because Linux wasn't a good platform
for gaming. First, Joystick and Gamepad ranges were limited to 16 buttons, later
extended by 40 additional usages in the TRIGGER_HAPPY range. By allowing the
usages to be incremented up to KEY_MAX, Joysticks were able to expose up to 80
buttons for the past 15 years or so.

Many simracing, simflight etc. devices actually expose way more then that. 128
is a pretty common number with even more in the wild. Usually the numbers get so
big to support things like positional rotary switches as one such rotary can
have 12+ positions. My Moza GS V2P wheel has 5 such rotaries and that's not
counting other buttons.

Doing something about this limit was brought up maaany times in the past:
https://forums.x-plane.org/forums/topic/299033-xp12-linux-winwing-orion-2-throttle-has-too-many-buttons/?page=1
https://forum.falcon-bms.com/topic/26403/solved-winwing-orion-2-on-linux-only-80-buttons-detected
https://lore.kernel.org/linux-input/CACa7zynMpa3BOJUW=s_Tj1TwH5txDQOuta5Fph45PYhDOtQQ3g@mail.gmail.com/
https://lore.kernel.org/linux-input/20200710065112.18286-1-cpuwolf@gmail.com/#r
https://lore.kernel.org/linux-input/20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com/
https://lore.kernel.org/linux-input/20250201113906.769162-11-tomasz.pakula.oficjalny@gmail.com/
https://lore.kernel.org/linux-input/20251119163844.1343-1-Hunter.Moore@garmin.com/
https://lore.kernel.org/linux-input/20251220194100.GA12646@altimeter-info/
https://lore.kernel.org/linux-input/665df7c9-0d32-4ecd-9f4d-fff67deb5878@endrift.com/

But some considerations:

1. Usages have their actual meanings and we shouldn't use them willy-nilly to add
more buttons, even if that approach works with naive approaches use by SDL and
Wine alike.

2. Extending the KEY_MAX will cause additional issues when it comes to bitmask
sizes, mapping usages and reading them afterward. Basically, we're moving the
goalpost somewhere, but a device that would define 1024 buttons would break
things again.

I must give HUGE thanks to Dmitry for forcing this into my head to a point where
I actually understood the whole issue.

Thus, I thought up of a best, long-term solution to this problem. I do think
EV_BTN should be a first-class event so it can be as easy to handle as possible.
If there's a need, it could be hooked up for Gamepads as well as HID gamepads do
the same thing and only expose raw buttons without specific usages. The usages
are a best guess when handling generic ones and only custom drivers can actually
assign proper buttons like BTN_A, THUMBL etc.

In the future, the Joystick usages could be completely removed and joysticks
could rely ONLY on the new event. For now, the old way is kept to not break
compatibility.

I'm eagerly waiting for comments, recommendations and critique. Currently, there
isn't a way to poll states of all buttons like with EVIOCGKEY but I'm not sure
if it's needed? I added INPUT_MAX_KEYS just for some sane limits BUT I don't see
a real use for it. Instead of this define, we could just use U16_MAX. 65k of
buttons ought to be enough for ANYBODY :D

Companion changes to consumers that already show the working state of this patch series:
Wine: https://gitlab.winehq.org/wine/wine/-/merge_requests/9853
SDL: https://github.com/libsdl-org/SDL/pull/14758
evtest: https://gitlab.freedesktop.org/libevdev/evtest/-/merge_requests/25

Tested with my Moza Racing R9 and Moza Universal Hub (both expose 128 usable
buttons). hid-universal-pidff driver was disabled for testing as it contains
usage range hack.

Sneak peek from updated evtest:

Event: time 1767559522.509446, type 6 (EV_BTN), button 12, value 1
Event: time 1767559522.509446, type 4 (EV_MSC), code 4 (MSC_SCAN), value 9000c
Event: time 1767559522.509446, type 1 (EV_KEY), code 299 (BTN_BASE6), value 1
Event: time 1767559522.509446, -------------- SYN_REPORT ------------
Event: time 1767559522.656447, type 6 (EV_BTN), button 12, value 0
Event: time 1767559522.656447, type 4 (EV_MSC), code 4 (MSC_SCAN), value 9000c
Event: time 1767559522.656447, type 1 (EV_KEY), code 299 (BTN_BASE6), value 0
Event: time 1767559522.656447, -------------- SYN_REPORT ------------
Event: time 1767559523.737498, type 6 (EV_BTN), button 112, value 1
Event: time 1767559523.737498, -------------- SYN_REPORT ------------
Event: time 1767559523.807477, type 6 (EV_BTN), button 112, value 0
Event: time 1767559523.807477, -------------- SYN_REPORT ------------

Tomasz Pakuła (6):
  Input: Introduce EV_BTN event for generic buttons
  Input: Add info about EV_BTN
  Input: Fire EV_BTN if found in ev_bit
  Input: Assign EV_BTN event to HID Joysticks
  Input: Realign rest of the HID_UP_BUTTON cases
  Input: Add EVIOCGBTNCNT

 Documentation/input/event-codes.rst    |  5 ++
 drivers/hid/hid-input.c                | 77 +++++++++++++++++---------
 drivers/input/evdev.c                  |  5 ++
 drivers/input/input.c                  | 10 ++++
 include/linux/input.h                  |  4 ++
 include/uapi/linux/input-event-codes.h |  1 +
 include/uapi/linux/input.h             |  1 +
 7 files changed, 77 insertions(+), 26 deletions(-)

--
2.52.0

