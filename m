Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0801B346777
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125265; cv=none; b=muws0zjOaHNUzHPsNzmN9Ko3dx+wcFStbni2MMPbx0WhI/X4JPN/mCZRCUiMQq79BBFIMUUfDIYCEy6QGELnsN0MYZ9wD1t5mYDUVxDYDixoceBH6kkCS0KvyeAuma558bTP3oijJxkPiZBZM5bJ+DievW2zWUaCjK3vxGgAvGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125265; c=relaxed/simple;
	bh=0EJEd3P4J84Lpc3/olGmNZUeyvOQ0lRb2ve9MrVzkRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l8NFQpvHX6OCyD/gq3bxWfxshrlb6CZHDSsOY1u/CEHC3026eql/PqWP09U1k/wnoieffezzoeQiSo7r7h3CFNIuZJBEhQbF/WcFTbY601srkF9OJofiOrP1igdtHO5vew+UJ/OONBeHJHmCWoWk6taEuxKsLN8LgGHCwV2kAV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uvki86IS; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uvki86IS"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d75371d873so1598535a34.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 23:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773125262; x=1773730062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hKDdoVBKtZmwxQAbbxNIdkk0aLXW/mXKHyUCjCyO2P4=;
        b=Uvki86ISU9/AZGs/QpqKaN1BOTlKaBbEmNxdDQLP0XtXN46WGx5paf2jMs/okWU88h
         IeVEK1zxAxUWKSbAGbGwW2oCxoaNcaSoPbSl6PZR2JDZy7NsldQb+kj6qdhaGoMUPoA0
         33m8JeaAO4E8BHtxrLPSEhi7R1l8m0TvTxJme5dmeatqZT/Pwg4bnn3tuYSpR8KGJBwh
         WrX4KkYY1pkcDl1abrvYFFGYWYLg2n9WdyRFUO8lQBLCLkRyjHGjhG2QanQip1Q/rBXO
         IYAZ5tLiggO2sBybpzH3FIEpkm6pPPNVvWwwOdei9yexirReZwAZRrfkkYsuYQNY8Epq
         nSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773125262; x=1773730062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKDdoVBKtZmwxQAbbxNIdkk0aLXW/mXKHyUCjCyO2P4=;
        b=R7JIc5Q0xYsuJzRjG8cPIK/iFA4GrnxZIKpAG59LJj+q8U9fttaP6X6zGlvN+efSNo
         MXEtvU7/4t7751iyKPPiMuznKKotwYWmkYW3Ni5Lict55MVKxM73BEZLAkYdyc1CnA/f
         mILggsdvnjmUjG0Sty+Rwjk85DcFnuAX57ULJFQdT0jM/XYJMbeGm8cVCAYtlYoTEMOL
         B8+jsb/4hXf1R0Ra1DrLTHoozT7XFz8KonBf0Y74vbbWFGo+dP2PtY0g0KImmwzUTz4p
         YGnvq5zThRbJNsdWQDgSlbI5p4YOeayasYxdTQfbEUXul3UClup9G+pG21iK/Lfrx0yJ
         uUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmpWLSROTrqAGmxqxP7AWhlhVNnlcg0tUTH+7p3w9qKit3JpMzVKLwgG7lUUFK0nk0+yBGRb41TIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Ds2zNtEzJuvy/t4e8HxL7bDEnMJmjgr9FBPHw+9x7U2Omm5z
	wkqt7w77PewK69fOwTw+eIsfZTmvyQN0j4uvz/QSO1e14KDq5o3+uCZSwJNd56qrhYM=
X-Gm-Gg: ATEYQzxkmWYPlZZ5NM+h3vxWFim89vv+nLd/7/ebCVaDlXFwcoe27n+0ylNxmeGMf/D
	dSSaYVo1Gr4NAI30aPiag0NhLhax0V464uD0PMbOj3yJGb22tWfUHgH4b2dD83d/FzUTR3qxX+N
	GT9ROQQDlxZjOotxsKdT9GS+YnnmtxZ6jEYbGGWjaZLGrJ3//n/zLZqQqLJ+Tkl9kzjxC+uKATp
	SbwPq0c3SLJVgMQziXUlsLwoObdqE6qf1Xv4GkDnne9U95+z/Yf1yMNai5lY9BgfSIiE5UPBioH
	erL2ftXcksclA7RDOWWd/Ff1OIJCEzHE1wDSoP9xeqRRLUJhg58dCuRBMqyzjsi+fN849QOZi2W
	8rrvkvf3XXN3sLOrZbvIrHUDBj/U4+rRn0UH0gWhZYbtUAFO/u9ztqgPGh3ZU3YnV4XBaTY4CpM
	k4ceX2tw1xwVyolDtfHoMFLFq5z2hSAfg+vusNDDWlMN6WXOrlNAkRJ0BWpybbx+FiZPsgvawev
	N5uo79KIHZiBHddOlJOF7PI4/n10fOqd4Wbb2B/F7Y6WDzc
X-Received: by 2002:a05:6820:168a:b0:67b:bc25:2675 with SMTP id 006d021491bc7-67bbc2531abmr1725902eaf.30.1773125261880;
        Mon, 09 Mar 2026 23:47:41 -0700 (PDT)
Received: from localhost.localdomain (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bb666de5bsm2600618eaf.7.2026.03.09.23.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:47:41 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH v3 0/2] tracing: preserve repeated boot-time parameters and drain deferred trigger frees
Date: Tue, 10 Mar 2026 00:47:13 -0600
Message-Id: <20260310064715.527906-1-atwellwea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 updates the affected early tracing boot-parameter parsers to
preserve repeated instances in the format their existing parsers already
consume, and documents that repeated-parameter behavior.

Patch 2 fixes deferred trigger-data cleanup so boot-deferred frees are
drained even when the cleanup kthread never starts.

v3:
- Patch 1: use a shared trace_append_boot_param() helper
- Patch 1: document repeated-parameter behavior in kernel-parameters.txt
- Patch 1: reframe as an improvement and drop the Fixes tags
- Patch 2: no changes

v2:
- Patch 1: no changes
- Patch 2: restore the dropped mutex recheck comment
- Patch 2: clarify the synchronous fallback drain path

Wesley Atwell (2):
  tracing: preserve repeated boot-time tracing parameters
  tracing: drain deferred trigger frees if kthread startup fails

 .../admin-guide/kernel-parameters.txt         | 18 ++++-
 kernel/trace/ftrace.c                         | 12 ++-
 kernel/trace/trace.c                          |  3 +-
 kernel/trace/trace.h                          | 29 +++++++
 kernel/trace/trace_events.c                   | 26 +++++-
 kernel/trace/trace_events_trigger.c           | 79 ++++++++++++++++---
 kernel/trace/trace_kprobe.c                   |  3 +-
 7 files changed, 145 insertions(+), 25 deletions(-)

-- 
2.34.1
