Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A2C5111A4
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572239; cv=none; b=My10f5U8O+Enr+ThzQTX4VRwg/6ISEfw2HviKAB6IXG5w62HjO1JodXv0tmRQ7nIa7kBsOoN3NgKm4Nyuq4Wg6ngRdNQQKqbOWQsd9kbw5xkRjk0JI1KW22XyCEEmjl7ZG67tW5pM4+B65SXXj9GBN+CyVRbSAlMaWMc46SYoFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572239; c=relaxed/simple;
	bh=oLl8fjZTbq37IaphHO2AVCVFYPM2f1JU6S+DNccp2cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aQg4JuYRYBPAnf54QbZOUl50A/y4UNqe7TAze+znNT8iSwW9TTKV5ePeO/JnFbt7zxtFZeKYuz2W0gUbHJKpiUZ4bYuMYcIxJmNr2+qF4+Ib63qxti9hAY6qJKDrSiYb1vPMe71vUQcu7vfQ5KGvwYBr8COlkdMWsyc0gR0rIHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=KNJZ23k1; arc=none smtp.client-ip=74.125.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="KNJZ23k1"
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-66f78e8fa0fso128942d50.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789572229; x=1790177029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5K768g5siM5TtZg6LJ3Bszma4LWRnch5JHQsrTQEf4=;
        b=KNJZ23k1LRkHTx8J9GFae2iES89F5nhd8hgUjJ/wiiI/st6OrcQuwXOoUocw4wVIdS
         1Nb5g7ylWYPQCvGoODGGh7Jt/I745z1J04hrye5zQb/Pf3QlBOQ7tIPA6K9Yeyf25CpQ
         WhKUEgb5Vdh/uPtK6seHGdl4pTvwI3vV+TNn4/MVpz16eEy6exYprgVhNfxmxOa4iBo0
         eNZD7tLwU7aUfJF361YKOmWuRWtVF7qXOsCozb8eBrMBaH8PU2dCxf9aTyXUFZdvPW7u
         E40+a6kIzQbr9bz1ya68zTQPeMrnOt71zZ2xMziHXqqFtnE4aGYS0ZWkvKr69peMojHi
         WGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572229; x=1790177029;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5K768g5siM5TtZg6LJ3Bszma4LWRnch5JHQsrTQEf4=;
        b=wEhmyEPq4BR+H6W7Ir5+4NQURhi6lGEDmygAa/TF+rhZ3x8EhJB0zyvOtARZLwZAkZ
         btGM0l0LHGDFS74M+FBcf7C2aB6SW+Hva9khLYA8pEBR9NmLNpVtGH2mrsG9AlrG8QlX
         hpI2TCHb8w3DfnYAQi5wP1hZzWXrqJFkoZLYRlw6i2hl1epBV24x966anIAWFUa1/Pxf
         xArAAeudELtJHiE4NPcH6Js8ZyE7vVYUCn7jAOqzw8CR09K/Ovv+7hTmsg9SOFXNesb9
         nXVPk1foOiasFz2VEcPUEPO/qtgGDRevpOqBDAboLJr/jt4Kl/AWnBAfA3cfU3zBF9rN
         3vIg==
X-Forwarded-Encrypted: i=1; AKwUvBxEYzRXoXTkkoQUfXhcSezA8t238+xpM5DhoC3HhrkYTirjF9J5RUViOUiU5FnxK+St6ZOyQC1Pq1A=@vger.kernel.org
X-Gm-Message-State: AFuF++myfo+jFDA0Tji1TozK3vU3YR5DkD8nGYdzitKkh5VzL93asdCC
	rLQcONz8R3JC1tTune+m3HX4DuiI3SBk+tiQqYiXMGY1S2I3V+c/0PLEBGjNoc3R70zN
X-Gm-Gg: AYBFou00cHjzFeJHDEo4IX2a/+QWwrzhmoWK1K4gdTbTdH5flKsEFh/b+oymgvFTQ6Z
	ZeoRbCqMwj9ujSf85OOfGw6gOx0a9X4KmkGqhGvoJcszrUodSTw8CtXK64vQRb/nYXvaxlllchT
	Gy2hIYiKmgoln1kFPRuZhserG4k4tn89peX+aYSihc+iiJ1YRm25F+Yh6Mtzfr8E+q+cms9wmx+
	ekKtvdgbSriZtw+YSC01x9zyXIB3/bWRi17+vcg1PEdQ7uXz0mSKoQZ9fgMQN3K8W6uH3z4Jdv/
	HF26JQYFGRl1m8V+Rk7XHgGI6kcpGtEIP09Qkx0r2e8U6zdcpB22dXp6zBVDPxRetivIMsxAuIR
	VsLdr+xY9Ta16301r24YDMWhpugcNKCnloEymhwckQ991H8ftu9Bm01aekXKZr5w2XEb8dlCRL+
	fPRaLOXiMulIKYX7xrm/HkEFhN/2wqBs/S3yv4Z8nyJBCPoZ2iQSrAbGyci6MYTqeqPZJUGrPEh
	BLepAZXZ94pQg9qesCozSzdbKGRxKbJ8bwIQFQ=
X-Received: by 2002:a05:690c:4b81:b0:870:48aa:472e with SMTP id 00721157ae682-8921c5494a9mr14065377b3.0.1789572228991;
        Wed, 16 Sep 2026 08:23:48 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8943ddc0220sm67927b3.18.2026.09.16.08.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:23:48 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: landlock: clarify TTY signal scoping
Date: Wed, 16 Sep 2026 11:23:36 -0400
Message-ID: <20260916152336.1589383-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LANDLOCK_SCOPE_SIGNAL documentation does not describe how TTY-driven
signals interact with signal scoping.  Holding a PTY master file descriptor
is a separate capability: its holder can cause the TTY layer to signal
processes running under that terminal, even across a Landlock domain
boundary.

Add a concise clarification to the userspace API guide and the UAPI header.
This records the capability boundary identified during review of the
TIOCSIG discussion without enumerating individual TTY signal paths.

The documentation text and changelog were drafted with assistance from
Codex (gpt-5.6-sol).

The userspace API documentation builds successfully with the kernel-pinned
Sphinx dependencies.  The patch introduces no new warnings; the existing
missing-graphviz and undefined-label warnings are unchanged.

Link: https://lore.kernel.org/r/aqqJAZfG9FC7PgMW@google.com
Suggested-by: Günther Noack <gnoack@google.com>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---
 Documentation/userspace-api/landlock.rst | 3 +++
 include/uapi/linux/landlock.h            | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
index 84cb7bf6b3ed..33a514ebc615 100644
--- a/Documentation/userspace-api/landlock.rst
+++ b/Documentation/userspace-api/landlock.rst
@@ -430,6 +430,9 @@ The operations which can be scoped are:
     This limits the sending of signals to target processes which run within the
     same or a nested Landlock domain.
 
+    Holding a PTY master FD still grants the capability to issue signals through
+    that PTY to the processes running under that terminal.
+
 ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
     This limits the set of abstract :manpage:`unix(7)` sockets to which we can
     :manpage:`connect(2)` to socket addresses which were created by a process in
diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index cceda3b3b961..6485af37dd25 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -501,6 +501,8 @@ struct landlock_net_port_attr {
  *   related Landlock domain (e.g., a parent domain or a non-sandboxed process).
  * - %LANDLOCK_SCOPE_SIGNAL: Restrict a sandboxed process from sending a signal
  *   to another process outside the domain.
+ *   Holding a PTY master FD still grants the capability to issue signals
+ *   through that PTY to the processes running under that terminal.
  */
 /* clang-format off */
 #define LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET		(1ULL << 0)
-- 
2.55.0

