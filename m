Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24AF3C415F
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837371; cv=none; b=JWqwRmFxfPUDuG/+0siPL/2Pu0g8hM1Ka5tJrndHWIlnCFeMiBJz28O6KT7elwoX7Mi8QF+jQ1Xn/kPZVSFtmwppRAt0GntMkZsBYhFapbe2XpSIT2aKaQsF61ev5R8HLTJHOcQIJVXguSgMw+97CtvJo5XBJsBdTM5GEcvf41Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837371; c=relaxed/simple;
	bh=ySXKBmJ/U8bqVEuShkxwbboi3HlloriRk6YpRGniIko=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GmK3E1Zjf3FmvO2GFeBRZd95vfoZDFRtAt6GhywHKq+iwhMWizX1fMIninhpBbC4PCusVeznXnSNfpXYlAfN9M2DyLOBWGQVv47EVi0C5X5qG7GZY8QmNxYQ/pZXCocGQ4c2EGbNOWVrAaELE+B8HG4uas1OpC71EgWVC/sZvD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=IuGbDrLu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="IuGbDrLu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4924593f45dso59959675e9.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837367; x=1783442167; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlOvwkoIjqQ3dyIBe+7i8C6OqBUbb4KmOF29Y6QRtEg=;
        b=IuGbDrLuV0N3Jj3Ikmh1T/iHWguCU5C40wflZZ2MSNGMTjzggZUBl2KitCJxITX5kb
         w3qAbYGHp6IIGM5vRXD1ZdWCqUaNudiXhDkPrgXHeJrvop7vGDekDSGUzepATvmuWfTd
         x5kQXjriz2IrJ1koF6vPcS2vDzvjjG1s1H2p0VgYDtfXgjrMH6HU6kH+J2GNb8eAPOzB
         Kfh9rMLTuBeHA5vOZhuFD80yfx/KxxvZjkbPuLhbM8XFA0EaDbQIICu00g3PbN27bJa2
         Tgmb4Q+7EsNw1HN8hYkD52YiO2oVni1CW5UZtufLjJG4bOsqFdawbMCnklwKMU3CsDHx
         HSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837367; x=1783442167;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlOvwkoIjqQ3dyIBe+7i8C6OqBUbb4KmOF29Y6QRtEg=;
        b=fFkdotCOWUlIDSTQJVMdnnlXvtob1DiPkjL+FmFNKZhdJay/lsQrNHqPA7I/iMo4+5
         +y5xPfbWmJJLmZtiEBEWNtkJn0yEFSuxruyv5OtdrY9irtV+QDUDe1SlsoDEROpv5Fvb
         Pb3dOSnI2Coecz7pd6oyjoJv0JrBDuOtly7JVkhpJy9OxeouxSU9ru8H8XjjuW/i1bfz
         4mp76SwaTgv+uiy/zJdp27PPdLNg2ZTG3qLTv61APTbMGhm5fSNTOWYGS1yzldDdslc+
         HuHaB5JASmBI5lhCFDisl3GCcXeME807zZm7tge+VBPGdTMtw+Yrq34iIgZHUovWIs0f
         FSrw==
X-Gm-Message-State: AOJu0Yxzlt0LxCn+JQooPa6g50yerh0eMrFX574ZOxQN4FMNpPtLEdtL
	gGmCfJGNcmerrY4VXrxPEaZe0vNJj+Ptflw6xOb6vd2PjRiiNe919OcOTLZMd7e5jwc=
X-Gm-Gg: AfdE7cngsu61sKiLPTmkpARGnqJ2qkx3VSFzGFa1rIt/2HgfQf63WVdiWghbVhOMHYj
	64pdSaiQdDYka6WwcLNAJpG9ptEBdMUYnguAfuPOGJ3GHKxc2PpUZ+VA3f3DH8+c9Pq2Fggi2vS
	IvffJaIAqE08BcbF9Qq1HuDrcX0VW/FVY/PXXBJ86xOxOt1au/4luEJg+elBUz5qwDu0YKr10id
	1Y6OrEFftL2FRs/s/QE76OGHtOGePW9SdbOIgidYAVgCmsKWcyn9aH5bG6P/lGLIDlYxczS3/uR
	tNDg6aAGyL3W3aI4aeKi+hDl71ozEsXeCldG3XS2B/gB3AL84kvJmDzjWMzclhIauNPgCZkpWFC
	uNowxlEyKRNjLKR1FKex74Kpv7WaP6aPbzoIK4jZwM2ORQNp2Y79HvrtIg/1cGJ2m25V4x7IyWz
	whOIpZi6zjdme4AzBE5Tzef7dSIVq6NijVZ58AIvXq3HtLX+W0dpQeUC8EA9SrcmIUSCQfjpIvI
	cmF2sDBaLmkFiWdhzESzelTAUXS
X-Received: by 2002:a05:600c:c16e:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-493bda41fc3mr20284025e9.11.1782837367139;
        Tue, 30 Jun 2026 09:36:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:06 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/4] printk: nbcon: deprecate boot_delay in favour of
 printk_delay
Date: Tue, 30 Jun 2026 17:35:56 +0100
Message-Id: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzwQ2oC/22NQQ6DIBREr2JYFwMoaLryHo0xFH71pw0YQFNjv
 Hup3Xb5JjNvdhIhIERyLXYSYMWI3mUQl4KYSbsRKNrMRDChmOSSWpgDGJ1guHufBgsvvdFGSK6
 srtpaapKnufLA96m99ZknjMmH7XxZ+Tf9CRXj/4Urp4yaqja8bXgttOrSBKP3dgY3LuhK48vlS
 frjOD4CEMX/wwAAAA==
X-Change-ID: 20260515-deprecate_boot_delay-72516da3845a
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=3474;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=ySXKBmJ/U8bqVEuShkxwbboi3HlloriRk6YpRGniIko=;
 b=O86itWXgtpUvHd6jHgcUSDYONHr8uM4FtjVKgxr5nMaMcbfYVqTugJVOlYcUmoahEOOuQHZO+
 MNX9KPA/fAIAGn9TedwW6ewrNcoYK9JZHvG/qKvgLYQ/JtsDREPeuXO
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
- https://lore.kernel.org/r/20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk (v1)

---
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
Andrew Murray (4):
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
 kernel/printk/printk.c                          | 84 +++++++++++++++----------
 lib/Kconfig.debug                               | 18 ------
 8 files changed, 101 insertions(+), 58 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260515-deprecate_boot_delay-72516da3845a

Best regards,
-- 
Andrew Murray <amurray@thegoodpenguin.co.uk>

