Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597A352C35
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851652; cv=none; b=lp2yUWrtNbQU1dg/5otJv4IGM3m7W8Wvvl11y59T5yqyAT3CXTua+qT80qBAqOgkvFpNOp/VTqn73rAFBIrtYWfoYgSJ4pyLGSPg6/+Ltvin4oJP8pdirgnsz9Iql5yKLbVryFAVszr+QMJFANF8Obeba8lu1R+kOidjBEVa1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851652; c=relaxed/simple;
	bh=vzlM7EoA2wD/+foNKgYBRvz+A43IRugN/JdsYUaKQFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XLbgQL/VKl9i/ApXfcu44ntEFDFIWfg0ZPGTAeVX9+6oVhGCTtuaMLTi4qbT3sOMcFxFBrKXEylY14cxXOKSxHhtlgp0RdL5+NhwmS1CudGKrOauk8xUqEZZ8IFWB8bnz8jiVWEspFOorAmdMgMYNvgV8xrN5BEldW/AzF/lz7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Ddc3Hlyy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Ddc3Hlyy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b7612475so18101075e9.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851649; x=1784456449; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ywwed8aXxKxDBaWayLD+SS1tm8T4pSkCOY1Pvt2MpoE=;
        b=Ddc3Hlyyy3iizR2UFvXaIFYcw3xsZkm5TDenpLJBzGCA7mc8RotWEkyZIG8aU4RQuJ
         +O/IzHliSiazPrkGnIumYMXJ+Zn+dk6Dq7byekDMmP1SSu3kqeG7HTcoE8r9PJI3cwVE
         Suzao/7wL9X5kDuifIaxeCmWKaHlHA2JjCYoJh5b8R1UbArPbppr9zEpiDhPBODpCLEJ
         m5sRJD0g8vtt82C2XsXcm3d4Ch/cdcjLt8EX/P2C7KsrzipgklPyAyHEoRpNROrKbAaW
         w4tI9TUnGtYvm5z/OJP9+CmjNkeV6Isqkoy9cyBlAARLkcgkz2/BjrL1y6lBJK/HFU0f
         jipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851649; x=1784456449;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ywwed8aXxKxDBaWayLD+SS1tm8T4pSkCOY1Pvt2MpoE=;
        b=o29SowRnLVbKLNsyDzL+XiVnb9KDHMZ6lfBp9RjEjDGnPdt3pkK1ewKgHBWkFoTCMm
         jUGZyPXXGH5Ow3RoJ2pl+pyNfc2XFyfqdfW4iJXPbhbZLGzAQ+Pp78aPANgFAHOHC6QW
         lKl0RbXt8VvSRmnvEU1hRmcpi37ax9Jqfsc/Gfj926mKteHiyhCo270Cpqzthoip0AeV
         yF9VdnWClsV++hslKgPg4/lsplpdsH4Poot6MZIQsCNIGs4i285nVFv106c41vTCg8qN
         B9krRiEhpEtxXkc0NH6KBlntv5YhHJIopWlFGHCsNOqXltfBGlxtungpSTPihhkydcgb
         6hsw==
X-Forwarded-Encrypted: i=1; AHgh+RpfInVRnfc2wNwKo20//K2FBvC7AIV1CAYUW4UsCq0ciiFOVOJ4oJWOhbhLU+H2gNtPWtFe1HFvpPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiwB7R8bMWT94XvC2ZbQRidzxbRXRMXNXxN+aIdyDGrIcExhXx
	yGgtHAir9PBzz5zAyOGv4AYvRRYYq/wKgQ8Yf4t5TdMwuOtr3/lqgdfpPGQevVZqeUQ=
X-Gm-Gg: AfdE7cmQd+LlP018jXLCeKVbLzt2wC+Vfs2eENZ5f+e7yDA+BacFhnNIh7Y8NhMMv0O
	E6MAiSXQdP1Tt4/ht4xoyaompGOS6OgaaGjr7GO6d1N716ltuQ6pCP87SKfL/4Lc2mhVuARF3Ti
	uxcJkI3B/ssCvtD+qrlzBS3u1pBHPXujoWUY1A2kkkxwqbuA5HPtMcqOA2zXC5EC4xx7JS8aoqY
	GW96DDgDXRrcoY8S9gnFtf+QG3GLXorBdT2ebjPsBlxf4ejE4b9Topu5qXL9cfPzIrhlOr7+T7K
	2WcQ8r3AS6JLOxrg1snJpTAlWYrcKs/+1p76mleGHM9+5XAlDf2OfnB344OqP6dzS+4ooHSMvno
	Umcf349AWp2wT7TfIpIcQrudzKcy1gGX/idFpautzEvWEez9pWfr+7OPJ4jdeLHiVpZAHHVkg9A
	BEkUUi+LklVikB3t1YSyLatn7KkxlyZMSlqsfYDMqeGR/jmK+7wZ3aMryH4cJKz+jRnOiL3Y9Yt
	8SbofC7tvMpHuaQeulZR208kEhh
X-Received: by 2002:a05:600c:1f8c:b0:492:4c2e:9613 with SMTP id 5b1f17b1804b1-493f881d4ccmr48601465e9.18.1783851648251;
        Sun, 12 Jul 2026 03:20:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:47 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Subject: [PATCH v3 0/6] printk: nbcon: deprecate boot_delay in favour of
 printk_delay
Date: Sun, 12 Jul 2026 11:20:31 +0100
Message-Id: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9qU2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0ND3YKizLyS7OSc1MS80gLd5KRU47SURJNEo6RkJaCegqLUtMwKsHn
 RsbW1ALRrum9fAAAA
X-Change-ID: 20260711-printkcleanup-cbe3fda4a2bc
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851646; l=3962;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=vzlM7EoA2wD/+foNKgYBRvz+A43IRugN/JdsYUaKQFM=;
 b=bF8W11xQvYTcKEkkriis3zgtTbb/moYjtKbeXde77fUfMSPcaO0TSgfTBgtqaU4Yd4XNarMmO
 avwao487GhgA/PMdcW2Ebo1/U62rJoo2hk8Yon3qQ/lTvrrtg6O2v+B
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay
sysctl are two distinct mechanisms for providing similar functionality
which add a delay prior to each printed printk message.

boot_delay provides a kernel parameter for delaying printk output from
kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
configurable only via sysctl and thus is only used post boot.

However, since the introduction of nbcon and the legacy printer thread
for PREEMPT_RT kernels, printk records are now emited to the console
asynchronously to the caller of printk. Thus, any printk delay added by
boot_delay/printk_delay continues to slow down the calling process but
may not have any impact to the rate in which records are emited to the
console, especially for slow consoles.

To address these issues, let's deprecate boot_delay, extend printk_delay
to be useable from kernel start and ensure that delays occur at the point
where console messages are printed rather than queued.

Please note that this patchset results in delays occuring after a message
is printed rather than, as it is now, before.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
Please see the following related work for additional context:

- https://lore.kernel.org/all/20260503214214.3475670-1-rdunlap@infradead.org/
- https://lore.kernel.org/all/20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk/

---
Changes in v1:
- Rebased onto v7.2-rc2
- Moved emitted field from nbcon_write_context to nbcon_context
- Fixed comparison of char field that used > operator
- Used unsigned int and bounds checking for printk/boot delay
- Moved delays prior to allowing handover
- Added additional information into commit messages
- Link to v2: https://lore.kernel.org/lkml/20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk

Changes in v2:
- Rebased onto v7.2-rc1
- Correctly handle negative values for printk_delay_msec (patch 2)
- Add missing newline in pr_warn (patch 2)
- Improved patch descriptions for (patches 2 and 3)
- Use new emitted flag in nbcon_context/nbcon_write_context in place of backlog && wctxt.len checks (patch 3)
- Use unsigned char for unsafe_takeover field instead of bool in nbcon_write_context (patch 3)
- Move printk_delay_msec and printk_delay from printk.h to internal.h (patch 3)
- Revert regression added in v1 to __nbcon_atomic_flush_pending_con (patch 3)
- Move printk_delay later in console_emit_next_record ensuring delay is always after emit (across nbcon/legacy) (patch 3)
- Fixed typo in documentation s/boot_delay/printk_delay/g in printk_delay= section (patch 4)
- Link to v1: https://lore.kernel.org/r/20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk

---
Andrew Murray (6):
      printk: sysctl: use unsigned int for printk_delay
      printk: add bounds checking to boot_delay
      printk: remove BOOT_PRINTK_DELAY config option
      printk: deprecate boot_delay in favour of printk_delay
      printk: nbcon: move printk_delay to console emiting code
      Documentation/kernel-parameters: add/update printk_delay/boot_delay

 Documentation/admin-guide/kernel-parameters.txt | 31 +++++++--
 arch/arm/configs/bcm2835_defconfig              |  1 -
 include/linux/console.h                         |  5 +-
 include/linux/printk.h                          |  1 -
 kernel/printk/internal.h                        |  6 ++
 kernel/printk/nbcon.c                           | 13 ++++
 kernel/printk/printk.c                          | 89 ++++++++++++++++---------
 kernel/printk/sysctl.c                          |  4 +-
 lib/Kconfig.debug                               | 18 -----
 9 files changed, 108 insertions(+), 60 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260711-printkcleanup-cbe3fda4a2bc

Best regards,
-- 
Andrew Murray <amurray@thegoodpenguin.co.uk>

