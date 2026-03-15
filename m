Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6636E462
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773589309; cv=none; b=r0IBO64y2zezK+NrgAGH0byWzluuvSU3XuuLC8UiexuJmgPCqxf4GMFKksYqzxoNJMc+HmhoLZawR3fD8z4ZlmFjC/eRgC+9zwMx7mDWfGbIdZb/kyhoPDbflM+Esq1fg8eWdbiYeOa5ad4RkfC/XNsnVCW+yEB+Wyr+mZyeFmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773589309; c=relaxed/simple;
	bh=cWkrBNir9Lz5R5fhZcPYI5U+sL2up/qqYUX5tzdZspM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=irUtSvkRYO+6uD7BIMPtpcRBm1t1YTfkaHHZk9jj2QH9TLFPreIYoLQKGF3/TlJMhT0HxH7lxU6FB4R1G65mXvb8mCEfLoM1vkMk2NQAouwP6XFprx8xnJmWPUWvmjKd3XP60Keg0+mhX6gbyMxgUHRLt4CpnXc33q4tLf87wf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf2zSn/i; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf2zSn/i"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so29322045e9.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773589306; x=1774194106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1iYCZl1hqYEjGMAgvB41gL2ct3+wl60oH9/6Ue5b2A=;
        b=Mf2zSn/ie24dcxlkMZu/vgdAQG/Ei2GDyuV7LzR+2VoYQ7Z8HbXDgXTZlfRbzRN53f
         kw7fSatzh3kMUtpem2hUh2IZ5Qd9bk3kc0lBhGN4inR42jAOZMmV/rBegY7/sF/90MUH
         R86ypTefygqCX0MGqxtCTUVExq4n05IoYu25ldxeYqNI8ViHstWhkn63Tkqxc7Rpec+J
         GJ/HzONKlTrukQObUVaMYJNZNqX8VFEIv5shPoCcyMC3LWYpV0fGDRqUfxVTTUqoWtce
         Xs0MqmAbuUACj00XEi0xy0f4ubTXFo1wzaN/HucvpCh4R9wYwhya6nCUaop88b0a7CaW
         7h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773589306; x=1774194106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1iYCZl1hqYEjGMAgvB41gL2ct3+wl60oH9/6Ue5b2A=;
        b=MzORTOECJcC2ZhKXkqCEyU+btUYb1iduPeIcWRee4OOJx2VABVA4bReahImEz3PNgB
         R9GkCJW8l0LVEa/DgW38D1peQ3vWadawJ09K3k9beGXeQ0AWOcAIZAStCflRq9/k7+D4
         O6L1xpIcJm1E3Vu/Aq7B4WAWhHUEyH2KoNVTfAXhbHC81mBGa9bgVqj90iWYZSPg2UNi
         RiT2Ct7s+7PQNzBwAdoEOydaH56vweqWUWp6QExvv334m7YdGho2pNIY4OOr3EUuXKZY
         g8yHa6GNKDiNuSUupRkfVuxs6NmSIpigxnBwwBnq7NZD50L354K9/3DqE1CXM91Z4kYw
         hyDQ==
X-Gm-Message-State: AOJu0YzwJIHJ+aov0fNat4kFjym0YTTzKzDi1nf0bmXtIiEBpQu3wm4Q
	8RPe6N4hqjIu9wdiHYUjDEAWGH80KCTrcwU42bml29yoKbSgwzt478gc
X-Gm-Gg: ATEYQzwZHjc9RkCJg3P9pCgjlXzub5gXYMXyw0E6rv89V6BUM1V8E1RSTHXn8iCkZuA
	PpxAfAJOeh/Wyt1+UlWrfSs1k4sv6Luk/S95qiBVsORpQJyPOUlxgTO6bsoykB3k3GEkvgsSFbj
	MI8IeDdEdLl+UKykLvHx7AdjbeQAHa3QBsAEvBMRK3TfRQJEerPqz1vWU58crrxOycRsXEfixm8
	SC2rASGgsxdKxDuC69qwDVGK6Z4JTXOCnPN4XGpcdai0GPidqYO4bY6rmhvFrJ36m1SnqhkSg39
	qC4laAppVvLxy+k000RxKtbQ4U9gjtBDcy/MHxhxMDl+6Twufrno56SlfOdDE09/fFAmrqq6S2C
	CDyf8y+EDhm0RSnxh5JfkVUlwPCz8bJBhuCjjIHIrJKPgfcsa55IGtxxK1Fgwmqmv5Vyjr728sq
	B+cY1WTxuaHQ19lnEUJqckhHriz4qNc/DTYLtbZ5QHIM//ur9uZUxO59IFHEoCIHuFow/uVj672
	d/GLPF+UpKRUdT41TZa/2SHauQ1qw==
X-Received: by 2002:a05:600c:8486:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-48556700ca5mr162074635e9.22.1773589306111;
        Sun, 15 Mar 2026 08:41:46 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm35055968f8f.31.2026.03.15.08.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 08:41:45 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>,
	Claude <noreply@anthropic.com>
Subject: [PATCH 2/3] docs: sched-stats: fix misleading 'per-process' wording
Date: Sun, 15 Mar 2026 16:41:35 +0100
Message-ID: <20260315154135.49893-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

/proc/<pid>/schedstat provides statistics for the specific task (thread)
identified by the pid, not an aggregation across all threads of a
process. Change 'per-process' to 'per-task' to avoid confusion.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=202635
Assisted-by: Claude <noreply@anthropic.com>
Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/scheduler/sched-stats.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
index 9d6a337755f4..9187cb6ce1cb 100644
--- a/Documentation/scheduler/sched-stats.rst
+++ b/Documentation/scheduler/sched-stats.rst
@@ -190,8 +190,8 @@ of idleness (busy, idle and newly idle):
 /proc/<pid>/schedstat
 ---------------------
 schedstats also adds a new /proc/<pid>/schedstat file to include some of
-the same information on a per-process level.  There are three fields in
-this file correlating for that process to:
+the same information on a per-task level.  There are three fields in
+this file correlating for that task to:
 
      1) time spent on the cpu (in nanoseconds)
      2) time spent waiting on a runqueue (in nanoseconds)
-- 
2.53.0

