Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E333ACF0E
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 22:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779143382; cv=none; b=awtuaHh4YTg+RvOfm6Ln6ETDslg7QgLYC9MwtHo+0FySqWbUwqdgJ70ETMmtnAc7aQkqy9KVXqF9ACoxLdnbGxZIloQVK4jgaQOtgObHHIs75FyK9j3Q/M8QbHfbo/YbYm6QfHOKbr9FJ1l8xalzXQBaLZKcEyYkwweutY0fEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779143382; c=relaxed/simple;
	bh=JRGL5wZBb3oL+bnWpkoEk/q+HYrwhDzUrlKuFgdfihM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+TJQM8JRgTHeWf3cM8sn1br5N/fwKiAwK9OPak1OdD+uuKoNrvINJjbHHOL9aBrBeIWoc9D+BbKBTDPLVE0Gals6ZYPgyWPeVsSOXvA5PJhKuAqQicgfujo/r+MOQAmAnCZ2rx3mUF4bexwcugQ3ED0euTIA5I9ZvFgBfdPF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kokZpiIu; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kokZpiIu"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f0ad52830cso3446559eec.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 15:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779143379; x=1779748179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcpgSIiQdf2cAbmXhw2oCtEbUOvcbWqgvHUYe0xVm8M=;
        b=kokZpiIub/tBlUkujSMehZwuotJE8jzHluyL7/06veA8mfKMDJlgfRv01vteXC6Etj
         ByiwdbJFDbvaJdmh/3u2SMZoM+zJ1wgUmYMwGD1VxkE956uF1iTBR0zoJomdO+fC3Ct0
         q19SbI/amgjoO5TQupDa+n6J8K7khkvMbsVVXXEsD6LXSRMJkBn0CUMBeJldR9tc4EWV
         iC/P6KolRoBMOTUoH0G0DTZKlWWZQ3IPvfs2gYG9Yy9ZU9T1IHeuuNu4wPutpAgqr4RP
         +EgnQxcGrbxUrxeThD7K9y2325BWhNnv234cXuerzuuAbvx1Bpp29E/r4KibvSxLTY+5
         8NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779143379; x=1779748179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcpgSIiQdf2cAbmXhw2oCtEbUOvcbWqgvHUYe0xVm8M=;
        b=a4kRO6Kck2eJzM00iGJJ8/uWWIZrQqCjOIxGBxzlyKn6mJiPrJxTqaesLGxAKpkD6i
         h2+tfygOhSWjPUEc4b8/V+jm3djEaoUvFwqsnb16t3ip9p4dUl3et210j9Bx+GAAF8rM
         U8jiCO4HW7FgwASjmoWAkr2Cds7gbWjlSj7x6zuHIu/bzF3mE2T16lY2mNXdaHSbcPP4
         QPMW4QS7VIWVp73cB7iVh98Yn4OEy7Eqvm0mJcqBPyqFnJNuDUppF/QM+nSAjogKvL0V
         6n7dGSpcFToXGk1pdKEEtMnUwDhevqf2rfDaSUx6e8lyVcn8KL0Ta176Hy0cCa46d2Ss
         7p+g==
X-Forwarded-Encrypted: i=1; AFNElJ/1HrkjZ77zXrFucVzzJRVy/1umm5BXct1w015HYA+7TQddvk5NZawkEK9p50XVecYZu2mzRGyBMuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG3oD88ncHcpPbLEh2nosiIkKT2her3WcmyFGNQzlvhrOCIvau
	5jkpt+7ITQcNTDyDfx/flbfuwcok49JTUFTdzfQvALWOFNbgAc5KsV89rm0enA==
X-Gm-Gg: Acq92OGuONpyoBANrB0Lf5DT7RG67UHIM3JwdRuzEc+Z+PvW1m1tyCb5p/cn/KCkneq
	OFhqy4KHOnDk+KhTNN14g2ABPKT779i8b/WiCNAxn0+jPKm8AcIdD2OVr1NphSXBBeoacovqLYf
	OgVgf6V59PU3Uc+oacr7SWU2n25LhY0XA7H3kihxtPy1sod+CPBFDSJKNzqjl+clcVeYXJEz51g
	MO/vw0YiBzXHOH+nTGGF4Df+acbvl0EuBXTBpPBTs7pv8c5zsL+eU9xDgykS4uDWHQaD1HHS+Iu
	bpfWYj8RJS9q1HESqh1ybnrgipiQl/lxbIo7Taa6q6WOwfl9iuesOPR1erK2xikbCzMw+fuO1LW
	0yIAFf7obiXYxpyAWrQ8Hz2VkQgnBSycOmh4ydAbpu8SEGKWZRB3FhpCulydkK1NB1pt2t93Z5h
	ncf/6p44BqfG/NsCOXPXYf7fGSiK/+AJEKPi5Z/xHzqKpLUiD9vcfAf5XXqgk2edWTD4GfOtrBM
	tiz
X-Received: by 2002:a05:693c:2c8d:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-3039818738dmr7825863eec.11.1779143379124;
        Mon, 18 May 2026 15:29:39 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc464sm15797095eec.14.2026.05.18.15.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:29:38 -0700 (PDT)
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
Subject: [PATCH v6 0/4] Add MSI Claw HID Configuration Driver
Date: Mon, 18 May 2026 22:29:31 +0000
Message-ID: <20260518222935.1802071-1-derekjohn.clark@gmail.com>
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
v6:
  - Add send/ack pattern to ensure synchronous acks.
  - Use spinlock_irqsave instead of mutex for read/write MODE event
    data.
  - add select NEW_LEDS to kconfig.
  - Make all timeouts 25ms to ensure at least 2 jiffies in a 100Hz
    config.
  - Gate all attribute show/store functions with gamepad_registered or
    rgb_registered, enabling use of devm_device_add_group and ending
    the need to hold a mutex during remove.
  - Don't set gamepad_mode on resume, MCU preserves state.
  - Ensure all count variables are checked for > 0 characters before
    setting buf - 1 to \n.
  - Re-arm cfg_setup in resume if it was canceled in an early suspend.
  - Remove duplicated argv_free macro.
  - Add spinlock_irqsave vice mutex for read/write access on attribute
    variables.
v5: https://lore.kernel.org/linux-input/20260517013925.3120314-1-derekjohn.clark@gmail.com/
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
 drivers/hid/Kconfig   |   13 +
 drivers/hid/Makefile  |    1 +
 drivers/hid/hid-ids.h |    5 +
 drivers/hid/hid-msi.c | 1766 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 1791 insertions(+)
 create mode 100644 drivers/hid/hid-msi.c

-- 
2.53.0

