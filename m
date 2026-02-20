Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A113382EF
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771585107; cv=none; b=JUlRN9cmc+sjxYPADh0jT+cwRaL1uVqyfXGQwuExMeRUTLYWt/PTY0ardnq9o0Els1VpIZM059woUU4JEr3qN4poW9Prq4KV8HVu3it/zBlbUIw/naFWdVZnMZNOPdtA9BNLnimIWvbRsc2WmLWOFklHU+YFC+iPJAkvRz/jPaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771585107; c=relaxed/simple;
	bh=ZPsdS+wHgzw9QeW9jt2d5f4gTTX82BrqYLt3i6HF1UY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=psI9b3tPDJ+ECKoEaPr2spUnnDS6X4E0mmr3/ZIA7mdPkF4RmXhqO7y1lW/Ylzqnp0aIcSqoO5wJlBBxuT6BQMuk3tnE/DTnmOCm0+6XndKN7h+5/0a1ZRN/7KZBeJQGnRYS9ETYGH6JDoxUSiMV7xV1HyjEW0ZUoxGlyWeDUdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUakKLln; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUakKLln"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e646a4b9eso1728876e87.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 02:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771585104; x=1772189904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74lRYbjOb2rRE375diWhyXReQIshWq2MXS1nfSaGpxk=;
        b=dUakKLlnjHGirT2UL0s7IRlMvS2Yik5Y3Ce6wYqykvVojTlHYktg/nLOr/H7X7hBh/
         CKoIwfQdDsTikFC6AteBLxQn56Cno4E6CgAo+iYfpiPDy0Rc7o7bg3FmehZ+lfUf3li4
         S92rKCx+Zr2eqDaFCWFzsNh254Zxa35MFLDsexyDFHjPJVNZPiLUCv4ATm4KGG5Zas/u
         HhTeIxbkRHDhhcQHNzM0bXeDuYWHZvI/fFgYwJoisVBQfyg7fzdbt8JEvv7ryJSaP2vK
         RcHT6bGUVsE0ED0f9VzvE1Ok6qSXPXDTLbd2yMKRDzPDcTiIQm1t17tmcPo8kfsCX34U
         a5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771585104; x=1772189904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74lRYbjOb2rRE375diWhyXReQIshWq2MXS1nfSaGpxk=;
        b=ihKbTfyrJVlI/aqc18O8oGv6lc22lawEvmoeJKKGyCT3jfbgBEGQBPAnj3uv//uVF9
         e+DJjeyLdqGMC41hLj6NRekpo/cQR0PfCdYzOF+oylMDflT9jsGtx/La2pn/ad/r4AD4
         RhBvWiJ3HRlTVTqTUViPefsEZ2DoJSybTQRxkM4Jz4WIaUYsRcY9/1rs0mtq1HmqT268
         BuPHdRSj1xfb3neDjqpEc6bYGCEHTwJGD2eyk8o3OtFX1XOxCEu9TMKOWAJ8mIaB4Gz5
         r6FPXB0JE7NHNA+GZHM5qo5e7W9wejVtS0b30qedl5y7I2GG/gVXsDfGoLynYRqLH0WS
         WX2g==
X-Forwarded-Encrypted: i=1; AJvYcCW4BB/oFBdXLGYmQli2f9OlVNlK2agXgT3rtAPWLKu7z7I5K9g1ucWHMUvgR4lb8h7CJAJpkA3SVAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9tN2L+DIvYNFzPwYGHw/VAW4Z7Gn9CVdjVAlgmqJ5A9IRjMFa
	T5lkjaw5dbSWnjTv68cPqulkSEIAte8Sa1sn4ABOoWp/D3DeKwZNjTXH
X-Gm-Gg: AZuq6aKxrvBbZH6vwGKlGal2IG7I954DVT4T/INuvjW0ffcYb+usD1JqwrdHUzhi4jH
	AO3bHaWC8pUWSDs7xq8nHhZOJp60sAq3XPwEL/DoDm0hI121jzrr51BNztF9zBXa8T0EWe4hHkH
	d8vv1Xy8hSoiY+x04t68A7asr23KK3CnmAGretb31MKi5OHmaiv/jyYHd8rYxD0nuh5jH5QB7l6
	8JI0eVy9dvqCIYfYtFt1o21cHWR5RnypV94G42XYlPqneKDp3d5oKmNp8Gpu4aN4QspH322ENg2
	ogdU96cfBNhAkt0pGzITzfl4l26tCxbtzwM8SReaV3y0kyxrSZEskeAMLCKvgYVRmnDY2IAmITC
	ZpCAY1obAHBjqIIoNdV5Bb6Gkwp7XRL4UEcGMs+P939rjRXxNq0PjwStE/t3NaWN7H0dlJoQECE
	Na89qf3K0fCnWl5ZUS7R1mIqkSJ3vqAmQckVXyTtBf1ZEcrHRofI6IBOoFM7xRSV/WJ06FHEVO/
	7mmWtikIeH8dpI5a9dBaYNRuQCFkSHk+Dk=
X-Received: by 2002:a05:6512:39d1:b0:59e:5cf8:56b5 with SMTP id 2adb3069b0e04-59f6d37997cmr6519932e87.26.1771585104127;
        Fri, 20 Feb 2026 02:58:24 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b2239sm5902530e87.81.2026.02.20.02.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:58:23 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 0/1] alpha: add support for SECCOMP and SECCOMP_FILTER
Date: Fri, 20 Feb 2026 11:50:09 +0100
Message-ID: <20260220105757.25104-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds SECCOMP and SECCOMP_FILTER support to the Alpha
architecture.

The seccomp-bpf selftests exercise syscall tracing, restart, and signal
interaction paths that were previously untested on Alpha. To support
these, the ptrace/strace syscall path is updated to reliably distinguish
internal skip-dispatch from userspace invalid syscall numbers, ensuring
that syscall(-1) continues to return -ENOSYS with correct r0/a3
semantics.

Supporting seccomp also requires correct syscall restart handling when
ptrace and signal delivery are involved. The traced syscall entry path
now consistently tracks syscall state using r0, r1, and r2 while
preserving Alpha's a3-based error reporting ABI:

  - r1 holds the mutable "current" syscall number
  - r2 preserves the original syscall number for restart
  - r0 and r19 (a3) retain their traditional roles as return value and
    error indicator

This separation allows syscall restarts to be gated strictly on valid
ERESTART* return codes in the ptrace/strace paths and prevents
kernel-internal restart values from leaking into userspace.

Alpha also lacked support for PTRACE_GETREGSET(NT_PRSTATUS), causing
ptrace-based seccomp tests to fail with -EIO. Minimal GETREGSET and
SETREGSET support is added to export struct pt_regs directly.

With these changes applied, the seccomp-bpf and ptrace syscall selftests
(seccomp_bpf, extended for Alpha) pass reliably on Alpha systems.

---
Changes since v1:
 - Update features documentation for seccomp-filter/alpha
Link: https://lore.kernel.org/linux-alpha/20260205133049.526-1-linmag7@gmail.com/T/#t

Magnus Lindholm (1):
  alpha: add support for SECCOMP and SECCOMP_FILTER

 .../seccomp/seccomp-filter/arch-support.txt   |   2 +-
 arch/alpha/Kconfig                            |   2 +
 arch/alpha/include/asm/seccomp.h              |  13 ++
 arch/alpha/include/asm/syscall.h              |  90 ++++++++++++-
 arch/alpha/include/asm/thread_info.h          |  16 ++-
 arch/alpha/kernel/entry.S                     | 123 +++++++++++++++---
 arch/alpha/kernel/ptrace.c                    |  83 +++++++++++-
 7 files changed, 305 insertions(+), 24 deletions(-)
 create mode 100644 arch/alpha/include/asm/seccomp.h

-- 
2.52.0

