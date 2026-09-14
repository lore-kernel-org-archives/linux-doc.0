Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C349B208
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409416; cv=none; b=ErBV2N+JL7wdjsVqCtQUvXK26mXc94arT0yqvF7hPhax58vyK5skuDd2KXWRE3K3QPnSia7JLMhhOinz/iyX3dL3injiwUZLPIrR2vyurEVfQnMCuTCskefDyjs11cKN1gm7qG2TcvebFS+62cM5qDTLTbH3macmtY0IZykdzho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409416; c=relaxed/simple;
	bh=BYAdkqFw+JhFCbVAYMWPqM8MRr41rR9mE0Rhks0Supk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M8tawII6eNRgzqg+8KuFkzG1mwdXU/fHkKkhOFV/scs1AfVJcNV4VOqONAFrFyshwABgoMbHn7Mobjwt3ik9eGHG/TUxuG36UZFdOFFruas7uyewdZqTs6QQUOwZd5dt3TH5pcfHYdQ/TqlyNy2kqQLaICrhQy4smiUZzeoRX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=f9J4rNKn; arc=none smtp.client-ip=74.125.224.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="f9J4rNKn"
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-858ef75b39fso839487b3.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789409406; x=1790014206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OIGXq9LPdM6hJ4yEHsUVyge0A5woOLwG6L03+WxApo=;
        b=f9J4rNKns/0LpxZsG4KapWQ9XfPOjMaVjJ0DMIfPd6PHGm0iqm3yVF3dA3MS7RAwBN
         m5y6f9rom2lfcGmvnz3RxOoT4ckQ2mBhMnQJKmknpnpzymt3axCpXUU7lG6b1qWTM9Iz
         uQPnlQT+AjssfbI2SjUNnXakEFxtkAO9+AnQXoIBjAXKh6dnPDhCbckxm7bqxE9L5q/1
         EFEFmnje9/XnNC7DahGWUWCaKO4I0JEIS8IA6Zdp/oJcxi+pmPdsaZ/PR+Hty1hGcbIl
         I6MyXQUH7hENNBUevAo9vZeWmq0zN1CTMU/x14rdqlghz2k0PsnCentJHo0J6xmscaB1
         jBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409406; x=1790014206;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OIGXq9LPdM6hJ4yEHsUVyge0A5woOLwG6L03+WxApo=;
        b=Eoztk+/Fj/EGGRD1wnysL67S/07V51fBKhLIQ9U0CkVoV84pY82KBOmAI/3CzMbdSH
         JSsRkdIYvnKwQz/jtOEtS62P75M9+DwunWisfROlrmUQP/V3diI3ce9ZvN8IEfd34rtb
         3DbRazq93hyZbpghptBIXgjBea/s9HN6aWHN0R5+AQED5d3w2wZR+VqQ4hREEtyQzFUD
         7Sw4SVeBNYaq7YcK3fmO1XSr93YPXyUn2kswqDU+5ImjkP5Rarr8x6j83nJKp4yLbiY8
         Apv6De6WaQgumLpi6DnYnY3HeyqeTveY9Pm3nuIdof7LSZ72gTf//uZJrII9O3zPdTS/
         t7YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE65/lLIXTSX3v12+zs0/plzMRr0yLRGDrqj5l1IFegnGV3s8PwK/IaNQvAGvOZjePbn96vNufcMc=@vger.kernel.org
X-Gm-Message-State: AFuF++mscE55fToSLBNpODHKjwTPwB+IS7MQpCaRH/wikz6lbn1by0iQ
	mMKn3s6lqjxF0zDezWYkD1hsmsFRJXhT6GmnKyWmJAYTR6hIhmFLoSmTwFhqSBvYOURk
X-Gm-Gg: AYBFou1gHDs+b1Bm2zjtzzHklaHUrTmweyOa0Yoiwmjn1kxN5jl7vgL5JKCMGFp5aMK
	VXmntH1VZfzztlm0SyxVvqC3RaRsfVDwc1vrqj7Zrv2pDweGXU8lE4ylPFVebHtr+WCqfZr1+U5
	o6Ceg2XldkFF+192aTGyO3l6EuDJKb4ARnCCY/nprH2TkE5urI7DA3XsNjuRTozHAgqDQ+jV+Xo
	GrAJUF26MRAY3VpJsczXD3qaroFBP8if5EjplpGpG08w8q0wKmiELw4ql2LEghFaNrn6Q20mFDU
	jYcu4qwaM38SckPq1MPXXFruPLDnlOa2INAitR/bp8lS7Rpmh32KlBJKqgObL8fQatkOSPlgsTr
	Dj/sqjvPKwfCIruoi57ALMKC02dJ8BbdR6L2JUQzU8ds+VXxoHssJPuIxTYjhavWFZZnoNNoUce
	sEqNGWFk2EvnRI/mfNcNqh2NGZinBZrsuX9anPYK2KMrDwdH5F5dc3wNZWSTtUExadUNAWjnuET
	J/szwsMYEH2pUMPPxoeUTl4Uu6K2RTWcEVGQMI=
X-Received: by 2002:a05:690c:6c87:b0:861:a34b:7de6 with SMTP id 00721157ae682-88d1992ba59mr15916227b3.0.1789409401043;
        Mon, 14 Sep 2026 11:10:01 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88488856486sm39517817b3.37.2026.09.14.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:10:00 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: landlock: clarify TTY signal scoping
Date: Mon, 14 Sep 2026 14:09:46 -0400
Message-ID: <20260914180946.1462099-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914.b8a029f9abb8@gnoack.org>
References: <20260914.b8a029f9abb8@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LANDLOCK_SCOPE_SIGNAL mediates signal delivery when a sandboxed process
selects the recipient, including SIGIO through fowner.  It does not mediate
signals directed by the TTY layer to processes attached to a terminal in
response to terminal activity.  This distinction was clarified while
discussing TIOCSIG handling because the PTY master acts as a capability and
the signal recipients have attached to the terminal.

Document the TTY-driven signal paths which are outside the scope and advise
controlling access to the terminal or PTY master instead.  This records the
outcome of the RFC discussion and avoids implying that
LANDLOCK_SCOPE_SIGNAL covers every signal-delivery mechanism.

The documentation text and changelog were drafted with assistance from
Claude (claude-opus-4-8) and Codex (gpt-5.6-sol).

The userspace API documentation builds successfully with the kernel-pinned
Sphinx dependencies.  The remaining warnings are unrelated to the changed
Landlock text.

Link: https://lore.kernel.org/r/20260914.b8a029f9abb8@gnoack.org
Suggested-by: Günther Noack <gnoack@google.com>
Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---
 Documentation/userspace-api/landlock.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
index 84cb7bf6b3ed..64418b09840d 100644
--- a/Documentation/userspace-api/landlock.rst
+++ b/Documentation/userspace-api/landlock.rst
@@ -430,6 +430,21 @@ The operations which can be scoped are:
     This limits the sending of signals to target processes which run within the
     same or a nested Landlock domain.
 
+    This scope does not cover signals delivered by the TTY layer.  A process
+    holding a PTY master, or otherwise driving a terminal, can cause the TTY
+    driver to deliver signals to processes attached to that terminal across
+    Landlock domain boundaries.  This includes ``SIGINT``, ``SIGQUIT``, and
+    ``SIGTSTP`` via the ``TIOCSIG`` :manpage:`ioctl(2)` command or the
+    corresponding control characters.  The TTY layer may also deliver
+    ``SIGWINCH``, ``SIGHUP``, and ``SIGCONT``.
+
+    These signals originate from the TTY driver in response to terminal
+    activity rather than from a :manpage:`kill(2)`-style request.  They can
+    only reach processes attached to the terminal.  To restrict this
+    interaction, control possession of the PTY master and terminal attachment.
+    For example, do not pass a PTY master to a sandboxed process if its slave
+    has processes from outside the Landlock domain attached to it.
+
 ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
     This limits the set of abstract :manpage:`unix(7)` sockets to which we can
     :manpage:`connect(2)` to socket addresses which were created by a process in
-- 
2.55.0

