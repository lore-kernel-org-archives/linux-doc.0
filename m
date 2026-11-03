Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718532;
	b=slrQ9BpUEU1Vk++3uf79ft5VGebLBq94gu+VUtPj/FIvrDB259G4AnlUGnTOlRWIUH+B
	 SoT3xVJ5+tfJ9NJbbmcF84xiUDTLhEuHREbwv9xCFW/UrXJlW55/xAE1ra5fk2wpLZQsp
	 9tJH+MfS9CwT8yH1vPIXH1xXyBZKm5XggA1cOxhutaZGqOA+aiAOCiplFSi1BCrm8k0LE
	 Rr/in1EnBlsFgTcaLfMdbH9nlnHSGT0Z//1uA2eQ2vX2Z8AHlTVatrxcr9D0wd+cWduSR
	 tf3F+iVM2C/dPHxCw36k7BwIqAg3EYWGmYnHI9ItIBTD3YHJzcxlaGo9iMJ5+ndaOBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ztc4qLkMwN1NoVUWOEPMzFNWuHwPq9rAxrAFP/pyv3k=;
	b=hmcCkphSbbhMIqwoOjA2PtkiDvbv7MD5A917tC883kCC2wGuxBF8U62BpGTuRQrI7Nsa
	 QD0T1xt64nCiV5U4lC5upHf3K7GwzOCze72jt1YpDFfsyhn7GiH7GD2jOUOc9C7KFhXWe
	 IMjyXwZTBkP1RcKd8pR19BGtLiV0b73v1aKRHtvLbWd/tFCgVN7ZZsirBOE46JKD0LXNQ
	 loFOiM0pW8MSKxebhsOzLuVeEV9idZTfmq167pfPTqVISFyVhgiMCdSFRQ9LuQ4naWxd8
	 H3ZcAtLJQPM0BbenrPhH7GcSjUkVM1JIyw7zjyU4NCbUgHU88PP4yQG58nrBWH7ZiCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPAosJaQ;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A78606FCC0
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 15:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A78606FCC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPAosJaQ
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso2039542fac.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 07:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718530; x=1794323330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztc4qLkMwN1NoVUWOEPMzFNWuHwPq9rAxrAFP/pyv3k=;
        b=LPAosJaQomkk+3IHBdKD17odPMqzTKcRQQntLNNF8saauK6Rh/eeGGF/aRJsr6Pmqf
         89D2mNvu8k13XA45/c6ZfhELpGbAs/+9ANPLrocgsTrV22jHjbWQ4i72WoBWv07wK/D0
         XcMkEuouJUjRghaccdaAzKgPsoAt+Vut83CeeKLT7h+wVQ5zx7Go8m80wYT2dYOqM0j2
         t+sDXay6dzIYWdO9dEGFuCl7Ck4Ut1zOB4adrqQKZAcJY/Z2helMv4nQ9GNGiV8bTCNx
         nDj4lWBNaWI7CaMz6RV2YcS2jlwNqU4AJaSYjcqfafn6v0pGG7ZB8dmp3U8IjhJgpP0P
         8rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718530; x=1794323330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztc4qLkMwN1NoVUWOEPMzFNWuHwPq9rAxrAFP/pyv3k=;
        b=pZtm03fyg9V9gaBk0zB6bWk6tThHsUqyoe4bw6BNMTB0BHeT6M2G6G9MhF49rXYkfp
         x+JfAAw5n+/qALPLpI9cUZ6owQCvufP7sTMJGh97EM8EpjRNKRdGIipTBzsq8Gwt9Vif
         f3iEuNg0GHvz9CGz4ahlR6R58JYnIaebP+fYenmTOJ0Sl6HcOibVjAr4OZNY3WTcmGzy
         yePtMb4kfUjadDMFGjoyiuA+pTZLBkX9vG889ujPFR+d47DWEAp3+dT3OZp1Qu3b1HfT
         GA56gClMiEzIdNtjBixdVLMwPjR4ynW5tMMmFjVkuzzoR50PpemByNk5/DA5tH69cCvP
         gYvg==
X-Gm-Message-State: APuU4Z/vMwuloQGuC/S1EUHXJ8ANcQVMHqLaMAT9yW1ghDcmSE/Omre9
	XYb+saykqzkk+W/BDNLFqf3fERDF6fxOe86QyVo+4aCZIYRExftjP5Ck
X-Gm-Gg: AYBFou19GIlXkE2FbD2FCnu/wueo64ERC6ABbWUqDAxdvs+LU4lSZ8rj29H/QcAwRs+
	Ml+1rWxOTCIw6FDzKUk8Ii7ebOcv+2uNuL69x1s1WL4Ba7aNodgIdMpR3y11tWcsvYyeJoEJK6h
	LEmXnFZPzXszpEMD8HbuL8yQliyZF8DJbVbk9QwCpqs5q0xBphVyeYLoRZPTCZ0KMEFmQou2UPK
	3Zgqiv2HkIDz/axABLFTlN5KKC/icKvICtQXHzCVerjqqJk0580VTUS+HSLuN8wTjI6Fwh+jDwk
	O5UJmZVqgXAkLAeTPIPcpY81uHfnZsmkLCMky6fO2Np6utIJ9acJFzFY6HP+S1RlpYwcmGd10jz
	nGRoeJcsZ4ScRjq4rKxdDC3hTDEgIjTw9Ebldj0hf8wcNNBiKUJepmhSaR23iUexGI2Fa888YWR
	zfFEwk/i9cpxfHMbnMhUB0uPyo68PmHHdMuM1WGn2Fi1sz2beYpv98etjUp85wJaFV4+A3kLX31
	iO8pd8WyXMio3r742gLRfDjBa8Oc4JF9Bp9V1gT9jXdR9H6rcU3DqCYpPESgDYnRhA3i+16GeEF
	B4UMaPuymzOF+RQNHN4VX9uVDSzO9cSChx7K/Q==
X-Received: by 2002:a05:6870:15d5:b0:483:bdb3:a524 with SMTP id 586e51a60fabf-4a9072ccf3fmr7956354fac.4.1793718530479;
        Tue, 03 Nov 2026 07:08:50 -0800 (PST)
Received: from penguin.lxd ([2605:3f84:842:3300:216:3eff:fe58:9322])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm4730448fac.8.2026.11.03.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:08:49 -0800 (PST)
From: Matthew Weber <matthew.l.weber@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com,
	Matthew Weber <matthew.l.weber@gmail.com>
Subject: [PATCH 0/4] Documentation: Add kernel minimization guide
Date: Tue,  3 Nov 2026 09:08:41 -0600
Message-Id: <20261103150845.13008-1-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds documentation and a script for measuring source lines of
code (SLOC) in kernel builds, supporting developers and system integrators
who need to trim a Linux kernel.

The Workload analysis section of the admin-guide already describes tracing
a workload. This series builds on that guidance with a worked example of
using workload observations to inform kernel minimization and measure the
resulting configuration. The guide is intended for developers working on
embedded and safety-critical use cases, including work related to ELISA.

The series builds on the ELISA Aerospace Working Group's ongoing
minimization discussions and iterations in
https://github.com/elisa-tech/wg-aerospace/pull/257. That effort explores a
generic, newcomer-oriented workflow for tracing a workload, iterating on a
kernel configuration, measuring kernel metrics, and understanding userspace
metrics. The ELISA documentation aims to present a complete containerized
workflow, with analysis steps to guide users through successive iterations.
This series contributes reusable, general-purpose kernel documentation and
tooling upstream to support that broader process. Clear upstream guidance can
also give AI-assisted tools reliable steering context as they help users
iterate on kernel configurations. One likely early application is producing
minimized release configurations for Space Grade Linux.

Rendered drafts are available online:

  Kernel minimization:
  https://matthew-l-weber.github.io/linux/admin-guide/kernel-minimization.html

  Workload tracing:
  https://matthew-l-weber.github.io/linux/admin-guide/workload-tracing.html

The series and its review discussion are in PR #1:
https://github.com/matthew-l-weber/linux/pull/1

The patches are:

  1/4 Documentation: kcov: clarify coverage example
      Clarify that the saved count bounds the printed entries while KCOV
      remains enabled until the disable ioctl. Document the relevant
      config requirements and PC symbolization.

  2/4 scripts: Add kernel-sloc helper script
      Add a helper to count source lines from compile_commands.json or
      estimate distinct source lines represented in a vmlinux DWARF line
      table.

  3/4 Documentation: admin-guide: Add kernel minimization guide
      Add the guide to the Workload analysis section and add its
      MAINTAINERS coverage.

  4/4 Documentation: admin-guide: Update workload tracing guide
      Expand workload tracing guidance with ftrace function-graph
      tracing, syscall tracing under QEMU with the GDB stub, and mapping
      observations to kernel configuration symbols.

Tool-use disclosure: I used GitHub Copilot CLI while preparing this series.
It helped revise the KCOV example, edit parts of the documentation, add
MAINTAINERS entries, and integrate error-handling revisions to kernel-sloc.
I reviewed the changes and take responsibility for the series.

I checked kernel-sloc syntax and help output, and ran
checkpatch.pl --strict on all four patches. The GitHub Actions htmldocs
build completed successfully with no warnings from the changed files; the
published documentation is available at
https://matthew-l-weber.github.io/linux/admin-guide/index.html#workload-analysis.
I did not run make htmldocs locally.

Any feedback is appreciated.

Thanks,
Matthew

Matthew Weber (4):
  Documentation: kcov: clarify coverage example
  scripts: Add kernel-sloc helper script
  Documentation: admin-guide: Add kernel minimization guide
  Documentation: admin-guide: Update workload tracing guide

 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kernel-minimization.rst       | 413 ++++++++++++++++++
 .../quickly-build-trimmed-linux.rst           |   4 +
 .../admin-guide/workload-tracing.rst          | 139 +++++-
 Documentation/dev-tools/kcov.rst              |  44 ++-
 MAINTAINERS                                   |  13 +
 scripts/kernel-sloc                           | 299 +++++++++++++
 7 files changed, 903 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/admin-guide/kernel-minimization.rst
 create mode 100755 scripts/kernel-sloc


base-commit: a592a36e49372172d7c7551ec19ed18184c935e1
-- 
2.39.5
