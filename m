Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A8C303C97
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 01:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778981970; cv=none; b=kLAYRZReoN0HMT128HbWcWrOuqCglVdOvDsW3zF6J7LyYgAU81lRob29e4p/MRugsn/5vWbnEJaOWzq6ORZNPq7d0Gfe655oO1bcC7UNTcvD8FY3d58QtD0mArK4lUq/JVk2iBYv6SPlEZiI9z9f2E0jUxl+VmX+2OnBGbGUBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778981970; c=relaxed/simple;
	bh=pPbH/0fAZCTMfBo2AlodrAijJ5me0bk98Uy/Q8uG59M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+XeRBFaq/u/uCaKZJQGViYI9IAuScVcvxg3G0N3HNao1dFTiD3BrHfcQRQtsuCFejdowvoo77KX0oOkFp9eCeOjRhP+u6KvrPG27Z24hyJspFMWRcAo7aSXLRktKvUYQ+LncI6b+u6mKLrFIIx1mQVeyBWESLsHVbi7l5tyhSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8INou/b; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8INou/b"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1332772f6b3so1148887c88.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 18:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778981968; x=1779586768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2NlxtySzo01FfuK8dPO1udm7bJRoM/LnmyF6z8QWTE0=;
        b=L8INou/bMHnoNRiPlCv18iM5cbNVECiVzp+WTfP3K3SsbieJYsuNOdeJDMdoYW0Ya6
         BaRq71ieFP9PHEs2q2XswQxNPdzL+wkPt5FLvCD9IBs2s6lRqWuzZ3TvJUdU3kGM7cFj
         2HGm+OILWeUByFbDNAGoMHB5XxHJtdCg2D28dhAOT9l5c1NEezuz2KFydpphNLZNxGOL
         G3AkDZOHMkCpIZGRg573CWQ3fJ3eXMkykN6oFgcZl74J2xfEqapwQoAAxkA8vr2uME+x
         7xgG7bexlsNRO+4WQOgchlsRr+jRwCWCmdeRfQXR5VPPy5lM3Xyp5Q8WLP9mYUCx0m5u
         Z5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778981968; x=1779586768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NlxtySzo01FfuK8dPO1udm7bJRoM/LnmyF6z8QWTE0=;
        b=Mz9nu3AGNVUHMfL4E7wj/1IsWvH9qkhqwW4EfB5XIOnzMHd/H1oDlOsQm20DV6osgm
         fyrq/3u3mM9hT6st5EWKULDp0kw2suZANGmH1Jss+1dN2O09pjjVSOOf1XPBUI4Wzio1
         pxEwLKiYReZhSxcZju6y158FrQGRH+Vvq/yJGxWFBdCfN3dLf69eC0TByxjb28UIM1cH
         vYoWPdfgjxUhZMfOjXyFkk3FhmvxO1OZm/XP8FabaFAMtvTjeDxrG8SdM/Q8pFkeMoap
         irIumuVcWRxGqZXIdchMR6EWVmgudQAfk+Y2tsRqaeyQ6po5LEirGlNsMPPpRg8uFGT2
         yf3w==
X-Forwarded-Encrypted: i=1; AFNElJ+VBIhwwaUU02KjJDwFVO9vJ+KW9fkrCWzxA0EF/5N/+njyWrf9aO8Yja/wWfAerZ0uZGE1nE+fhyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3u8NdLtE7m28otZ2Virwi5O0z5ddkMrEe6WJy00IOFh/H55WH
	qtDcDto6sjtH4r6Fa+50Y7vPQsZvLwfIfa0p3huywi/JJfG42S+Ky1uM
X-Gm-Gg: Acq92OEnfVhURCTnat9pdk+3oFlhcHmnP/1UX1ygCPqnTvYb19dxRRD7y83fm+PpKJO
	wMTM/CuWo1+NcoETI1o7tLObmqVUNkya8tf7DQ0Y+ccUtLcJFPh16sgkcp0fxqBGM13KdirYF64
	M9nFmedNa57cadqrtGrTxydqfl/PWi6KwMyQ5LWyIEACuQN6bsNXKlmxLFZQOQZyCsymvJOU15R
	j4W295E8oENUBZK8gYz9KF5XQzJePPDWTptcWK5ndTajHJ1z1XVVdT+Nb2ucd2fC0ZFIIGLi/3/
	0pIJaJdXRPasa1zeOxfJMNJ9bUZ1KhTaKlwuTb4SRL0xKgcjuuWVMcw3YcdjJLgkVrOz0TFzhCg
	zJL4B6ib3/I7/iMAQJerri691Ze+/6SIT6RqvMx1PByCqgef9xajB2UHuRw2ScbbiaMi5B5h8ua
	v6xCtQqdJ3YZGjXoqAyUPk20wDEFcDqP0QJck/ZJgcVhNlw37Hx1uPx7TIX+ckbtwwJcosFndBm
	nqU
X-Received: by 2002:a05:7022:4193:b0:12d:de3f:d84e with SMTP id a92af1059eb24-1350494d102mr3763558c88.39.1778981967817;
        Sat, 16 May 2026 18:39:27 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm15898086c88.0.2026.05.16.18.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:39:27 -0700 (PDT)
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
Subject: [PATCH v5 0/4] Add MSI Claw HID Configuration Driver
Date: Sun, 17 May 2026 01:39:21 +0000
Message-ID: <20260517013925.3120314-1-derekjohn.clark@gmail.com>
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
v5:
  - Swap disabled & combination mkeys_function enum values.
  - Fix bug introduced in v5 where claw_buttons_store would return
    -EINVAL on all valid key entries.
  - Ensure mode_mutex is properly init.
  - Ensure claw_remove is calling hid_hw_close and not hid_hw_stop for
    all paths.
  - Ensure adding "DISABLED" key to valid entries is done in the correct
    patch.
  - Re-enable sending an empty string to clear button mappings in
    addition to setting DISABLED.
  - Move adding the RGB device into cfg_setup to prevent led core
    attributes from being written to prior to setup completing.
  - Ensure frame_lock is properly init.
  - Change variable names in RGB functions from frame and zone to f and
    z respectively to fit all scoped_guard actions in 100 columns.
v4: https://lore.kernel.org/linux-input/20260516042841.500299-1-derekjohn.clark@gmail.com/
  - Add msi_suspend/claw_suspend.
  - Reorder claw_remove to cancel all work before removing sysfs.
  - Add mutex lock for removing sysfs attributes.
  - Add mutex lock for MODE command data read/write.
  - Change dev_warn to dev_dbg in claw_profile_event.
  - use __free with DEFINE_FREE macro for argv instead of manually
    running argv_free, cleaining up scoped_guard goto.
  - Fix frame_calc validity check to use >=.
  - Use spinlock instead of mutex in raw_event and related attribute
    _store function.
  - Ensure delayed work is canceled in suspend & canceled before sysfs
    attribute removal.
v3: https://lore.kernel.org/linux-input/20260515033622.2095277-1-derekjohn.clark@gmail.com/
  - Add mutex for read/write if rgb frame data.
  - Ensure claw_hw_output_report is properly guarded.
  - Remove setting rgb_frame_count when reading rgb profiles as it always
    returns garbage data.
  - Ensure rgb_speed is getting drvdata from a valid lookup (not hdev).
  - Use scoped_guard where necessary.
  - Reoder claw_probe to ensure all mutex, completion, and variable
    assignments are in place prior to setting drvdata.
  - Ensure gamepad_mode is set to a valid enum value in claw_probe.
v2: https://lore.kernel.org/linux-input/20260513231445.3213501-1-derekjohn.clark@gmail.com/
  - Use mutexes to guard SYNC_TO_ROM calls and pending_profile calls.
  - Rename driver to hid-msi and add generic entrypoints for
    probe/resume/remove that call claw specific functions in order to
    future proof the driver for other MSI HID interfaces.
  - Fix various bugs and formatting issues.
v1: https://lore.kernel.org/linux-input/20260510043510.442807-1-derekjohn.clark@gmail.com/
Derek J. Clark (4):
  HID: hid-msi: Add MSI Claw configuration driver
  HID: hid-msi: Add M-key mapping attributes
  HID: hid-msi: Add RGB control interface
  HID: hid-msi: Add Rumble Intensity Attributes

 MAINTAINERS           |    6 +
 drivers/hid/Kconfig   |   12 +
 drivers/hid/Makefile  |    1 +
 drivers/hid/hid-ids.h |    6 +
 drivers/hid/hid-msi.c | 1728 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 1753 insertions(+)
 create mode 100644 drivers/hid/hid-msi.c

-- 
2.53.0

