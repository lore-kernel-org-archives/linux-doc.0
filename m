Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE824CDA31
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282539; cv=none; b=W7nvV84YdzsW9N76+kmJpnNRj5v41ruv8fWVQB6J9J0sP6T3VgWYsDtHRFEKGNiRkZJeTr8Nc1nN6oHPiMMvDUb+Ccu4dulgC446/DwRq3Ao39YfNUZZUat+l6KsuxrX7OpZ8cbfsI/K7kRD/f2CFrQJ1HnwZsEd4eSnmaIzkSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282539; c=relaxed/simple;
	bh=bBi9t3/XNj2fxZ4GFxBaUZi+HB2ny2QNyH+RsLcMXqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDeIH/pbRsfIEGeyWcPP2xWatxCsacGa192bwSNi+XFar82B3cjoWHwdswMcT/uR9Z+IySV8jBAgZWCfKyFfs92fNd47tS6nBe/Hb8T570UFXfu+OMPdnnpUW2G6mA/s7jdtN7pTkA0LKV0h8uv9uOFujTtJ7SkaEz3ulnRvCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKyfQYUq; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKyfQYUq"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-333868a177fso79493eec.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 13:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282532; x=1790887332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Quf+BJxgePyIzaM/U+UOmAKPgAdi1GCD5xdWybO6rFI=;
        b=KKyfQYUq27vw2IMBkBhWY6gQ56fu6eoVeoWpmuzsLB3KTG9v1+7/LpUZC/t+tpSe1s
         3IRWzR27WvyFyrVJD7Op8kqMkjpsuPPxhyNfRtWKP9R+FB3Oi5Ai/aHclCBHmvMbeGUS
         Y0tts3OujfRoP98FUXek2VcLzR8DGb1ff06ZwlYFPncRmZD4c1lljGDD/vT+dwN6LufW
         y5irk3THLuzvuFKR2tOBKbjpMwvAXn1iALxlq8BqTz4Urrp5d7QM1lUpEsYVO0j0LPA6
         gQraca6Vb29uALaArMixJMGa2vT4bOb57vFXlbXnmDC6fP2aiNwSSr+FfJbmvBQW1hWS
         q9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282532; x=1790887332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Quf+BJxgePyIzaM/U+UOmAKPgAdi1GCD5xdWybO6rFI=;
        b=hkYsTP5yQzrAKCoqEfk5negymJG1VkbdZnmz9rsf9cG5BRzfsFov4RKma0lztM3P3s
         dG9/zQ3iUW2+6dAXzzj/O6+Seij7+QE77OuVTWRYuMclFOhm/sbRjlmrtf3KXEWxm0OA
         PTEBZn/YzDe2ys25ervl32giuLRB0gByr0mZ4aS5zIJ307Gq9zbbvGUhT8zj7ZEDOAbr
         vufp+v0l13pv2NGdCEMhS9xQ1uY+2cJb9Ex8SzOaDoc4vbp2AjQz6SbezheETCqoYDQV
         SqvNtC8y+i7sDEYYS7KEnag7b1qc+AKmp/p9w4XiBe3otnYeqVE3jNZC3ppBdB/GfOU1
         CD+Q==
X-Forwarded-Encrypted: i=1; AKwUvByzNfRLPGhInNT9bsKY/RiUi14f3TAhi2+JFjsF5gBz0omRdAqoj6M+hbSgoh+Bavh1elzfxTgaoXw=@vger.kernel.org
X-Gm-Message-State: AFuF++kchcdF/FwEh0JI0XCe2Psb4bq/od7EoFaxrrq8OcPjtZzXYmEx
	gWtCgE1aLbYSfN1d0RPtvPeQ1i/retQEv5ZeW7bOoqYfH2HPQ8VkUFO8T81t0t7q
X-Gm-Gg: AYBFou2FzL/pMs0qnP6PWQAw5Uc7ympPAvwHxGSTtIt2JJdDh5wHwwJNlQjJrcy0q85
	2lI5I9zpM8ewN8BMl2kwr2FAUo3OHGQQ7gqufoDPBPNW7TDsp7qQxbB/8Z/hPZCPnP0G0ujKTEu
	WIqAk89jYeii74IQySQK5eFE9Bp7/Y8xhd3zGdMIou4UeT8FKE2WEmUxl3Xiw/JmUjGV4m1UD3C
	ChDabpFTwvb80Y0G6nb1Sa0Y1i7coLJYIgP7vllfCBD1gM0bv3klZQvnx/1nIMT1a03o+Sr1wkk
	WWndPxCP9adRNzvs9budGFC5kKb70xoAiKlCle0zxR9CWOxnG7DzXG1v9WdHiogX9YlAZrM3iFz
	w+BKflOQ9CdEFyiZkRmjp7OzufpTi58JByZJQTrjmXu+DzzCld9ENq+S1ECPNjcpUK56LRDuClp
	YbI/V8A0L/m8Luqrt4zVZUjMOTU0i9PIhUIXd791BKcIJnaJ1Lwxk48rQZeJ8IpMXK0o9jAdh7j
	oVfE98aMk9XF441R/Zw5jtDRmDM5/d+vV2GjGhQeA==
X-Received: by 2002:a05:7301:e0f:b0:33c:29d8:bc21 with SMTP id 5a478bee46e88-34004a89af2mr2406330eec.10.1790282531857;
        Thu, 24 Sep 2026 13:42:11 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1073470eec.4.2026.09.24.13.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:11 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/3] seccomp: opt in to restarting notifications before receipt
Date: Thu, 24 Sep 2026 13:42:06 -0700
Message-ID: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

Sandlock is an unprivileged Linux process sandbox that uses Landlock and
seccomp to confine untrusted programs.

While using seccomp user notifications to enforce process limits,
sandlock encountered intermittent shell pipeline failures: SIGCHLD can
interrupt a pending fork notification and make fork return EINTR before
it executes [1]. The same pre-execution interruption can leave an
intercepted close returning EINTR with its descriptor still open.

Receiving notifications eagerly only narrows the race, and
WAIT_KILLABLE_RECV protects the task only after receipt. This series
adds SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV so applications can opt in
to restarting these unexecuted syscalls after the signal handler
returns. Existing signal-driven cancellation remains unchanged unless
the flag is enabled. The series includes regression tests and
documentation.

[1] https://github.com/multikernel/sandlock/issues/235

Cong Wang (3):
  seccomp: allow restarting interrupted unreceived notifications
  selftests/seccomp: cover restart of unreceived notifications
  docs/seccomp: describe the SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV
    flag

 .../userspace-api/seccomp_filter.rst          |  29 ++
 include/linux/seccomp.h                       |   3 +-
 include/uapi/linux/seccomp.h                  |   1 +
 kernel/seccomp.c                              |  16 +-
 tools/include/uapi/linux/seccomp.h            |   1 +
 tools/testing/selftests/seccomp/seccomp_bpf.c | 354 ++++++++++++++++++
 6 files changed, 399 insertions(+), 5 deletions(-)


base-commit: f2c53ea949c5048f96b3dbb5a5ee7131ce4ff2de
-- 
2.43.0

