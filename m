Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438C37268A
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 23:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780269478; cv=none; b=LVoBv4bwNw1Zcb8HbLtkOUC+57162MLvVXf7T/a+MyTSY0r0bznFPPs4gk2zcu7G+Wd5ZEFY9yp5QQ4WBPUjS9q4YgzGc3hSaQ6YDZaTWo/gwEBcgDl7SvlexrMl4MUK/Jxie3wMD4tdZjmTSlIEJjavfZdqboWnsi09xbfZ7HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780269478; c=relaxed/simple;
	bh=P5OF0xm/mrka6NiH8mLXOVcDYW5VpWJ664tJff57hhw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NLhy6cCgxeVEJC8DKVZzsgmpKLHbUtVVZSUDHDCKinZXEqJtyOkYf1WVeKi3DPxoFlq7Uq91HMDHk6UeW16BV3/5ABrXzJBeuEEzwM8Xe2Va/dy3toWUz3NPtRGtpxwZkwwREAMV/qBSkuc7tSbNl36A5AouEmjuzsDM9emX2pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=D0YbTNED; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="D0YbTNED"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef616daf6so2083633f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 16:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269473; x=1780874273; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvVfxmpNQG/L7irzhFPgpD1+Jj3XJwtNjmfXwxZzw3k=;
        b=D0YbTNEDorCX7dtXm2Q4A67KiIbyQIz5i8hvSpICb+aK5nDQFYBKpcyRkUaltobkLP
         cuhmhpy39Onn5mtRM07fRAMO/GzlFEhUZ/DOBHD14cSaMgN21qvjyJykdMpa+HMFuCAU
         umOcVGD2HaM2aUmEtAmWOkTp42hJbcF8kyINMqmxyBy7SEYAhBiMA1Ql+80pU/GktoTR
         WSeSE+R3+y9Q6BQdMcPvNjeUHrYaYM8LUDtS4gQsmEm9UHNDWhSPDnlk8yUjJ9H3m6Qp
         SpUXPSZ+uwHpwzufIvwytjEdvh0u7vNy+Fw/eDxvxAXFJaoeFe0Ob2U/PdToNf/zSkTn
         DfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269473; x=1780874273;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvVfxmpNQG/L7irzhFPgpD1+Jj3XJwtNjmfXwxZzw3k=;
        b=bwTeQWnqtbEYWS8tJ63sWx3BcfZz+TSJPx6wNXaCRFBEbMaDqNAFI7fJP2pXgQmDpX
         W53oQ0PET2GEmpicJYtas8yREF/cdvdJjiI4CfVI8MEUev8HjUG3Fyk14V82qvBhTGbq
         WlykZJobZhIJqDDf+gdk+cSVxaJ0jNazMtrTAbLeNARI6m2A5oSdWd8ZBZrwjmWobRuh
         aZrubDw7UoQh9tPDzXfmIrUtbcV0j3EXhJzBio7ri4P+2IxCoq+XCOCZ/CXrN8bJJ97U
         2NkSz/0q6a+/SCyEsUhSpv8G574YxFyHrV9VrxtJHlfilIDwjHLfBLxJtbD9sbMO2HY5
         ZaFQ==
X-Gm-Message-State: AOJu0Yy+85pozZyw1Z2FsjDrqefBV+OgaTA0JWRPt0lf6/dqIFvLr1ik
	XVwlvpWkmuwAOBB6LrZPntkTkDe0kz8E+KVdz4PDDN+oAXKiiQKc6jIo+4f/Qj7rBs8=
X-Gm-Gg: Acq92OFr7W3gky742jVEjCrJIeGjiG/1NPW2erWUFrkSXpAib1STsN7RmCJKr9Ojv0c
	7tjZwI4aZy2YZfORUCLZZOb/chVmiaMovkMuubQJ7gV8lmzA9O73oRjfnB9G+Y+ETn2p3sbBJV1
	9SMz+JLnQd+lWvzaTBH2u22NYK2jzJltfd181lf6uxm28zlHIrzTNFVky/LzvwqC/DBc5aTdzL4
	MyqPZWExVnWpyK9+CTGcvPMqnz+Grklfc3XzbXJ1HhrmkvfXjsXTwOsRM6uTJ5SJ3L5h3QI/znQ
	oLDu1OKN8N4UyWSKUosWtxf0U8oAxSuyF+bgexcWsvDL6B3Tb4vwVh/ncywnRDOdqSD2pwc9b9c
	NVm62OtOOtecBv8J3DvEfgqq3rzUdm5Ew1R+dhVD6TUzXV/9pWOpJ4HquhnmsGshsrc5DZG1r0T
	TPcp2GvTv8O6W4NSqn+Pea32AsQsasAWsFhaoW/4SaKjUN/q+R+cmBsGxjFClRb32oEH7wWJvLb
	hCE2YbWRrByuT8HUW06lS2UnF9PqIuJwepJ4ZKL8biWRfFyRA==
X-Received: by 2002:a05:6000:22c7:b0:452:c246:ab69 with SMTP id ffacd0b85a97d-45ef6b19d61mr16050820f8f.13.1780269473022;
        Sun, 31 May 2026 16:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:52 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Subject: [PATCH RFC 0/4] printk: nbcon: deprecate boot_delay in favour of
 printk_delay
Date: Mon, 01 Jun 2026 00:17:36 +0100
Message-Id: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHBHGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3ZTUgqLU5MSS1Pik/PyS+JTUnMRKXXMjU0OzlERjCxPTRCWgVqC
 StMwKsLHRSkFuzkqxtbUAVnWPGWsAAAA=
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
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=3561;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=P5OF0xm/mrka6NiH8mLXOVcDYW5VpWJ664tJff57hhw=;
 b=jd4BdPXOYhA5C3VuBpHOxuYvDhRxj3UK3/Zy+o2fPRXdYrjLtNEoXK00YciKDgId74ES5IXcP
 mZ0yIKI8+zZAjR7XEjXvu4nEGfHk/dmjZPVgChukvcpwwrhQBkk/QyX
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

I've marked this as RFC as I haven't performed sufficient testing on nbcon
and I'm keen for feedback on the delays added to nbcon...

nbcon_emit_next_record describes @wctxt->ctxt.backlog as an indicator of
pending records in the ringbuffer. This is then later used by nbcon_emit_one
where a comment suggests '[returns] True, when a record has been printed and
there are still pending records.'. It's callers then use this to determine
if they should continue around their loops for another attempt at printing.
However, backlog is the return value from printk_get_next_message, which
returns true if the requested record was obtained, rather than an indication
that there are additional records beyond the one about to be printed.

For this work, I needed to know if a message was printed to the console, as
far as I can tell, if nbcon_emit_next_record returns true, then it indicates
that it still has context, and if it does, then if backlog is false there were no
messages to print, if backlog was true then a message was either printed or
suppressed. Therefore I used wctxt.len to determine if the message was suppressed
or not as printk_get_next_message will not the length accordinly.

---
Andrew Murray (4):
      printk: remove BOOT_PRINTK_DELAY config option
      printk: deprecate boot_delay in favour of printk_delay
      printk: nbcon: move printk_delay to console emiting code
      Documentation/kernel-parameters: add/update printk_delay/boot_delay

 Documentation/admin-guide/kernel-parameters.txt | 31 ++++++++--
 arch/arm/configs/bcm2835_defconfig              |  1 -
 include/linux/printk.h                          |  4 ++
 kernel/printk/nbcon.c                           | 13 +++-
 kernel/printk/printk.c                          | 82 +++++++++++++++----------
 lib/Kconfig.debug                               | 18 ------
 6 files changed, 93 insertions(+), 56 deletions(-)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260515-deprecate_boot_delay-72516da3845a

Best regards,
-- 
Andrew Murray <amurray@thegoodpenguin.co.uk>

