Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE99A1E1DFC
	for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 01:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768699108; cv=none; b=NSey9Njk96UHxTatTJZ1qDCkZ2SLRr9cpgS9CgS7KU0utq1nTgQwOyuT0K9dMrfQx8Q2za9BKUsnvZ1koXExIkhW8QWr2PVLc6wyLAVwO2olOW9J4qh1ySKghc/pVNk3DPeyakjT6Ya6kV89iZ0fSv7pv8pCK1zDMljxyqLIN4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768699108; c=relaxed/simple;
	bh=dfSf90CX2fFuCBXs9FEXQJWwoweCuaJmCw5t3YHWiD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1EwB7ile9vxi2Ex8x0Y9gMEydFZGi3fTdas2edglExGC8vH/LreOijC0bMLldaIQE5HLIvm5dIwJ2QJwttnHQLfhXXQMvOMduL1tyynyXO5koDGyGgDcqnHRQUY/y76p2YJiB6BElbw+rrZoKTJq48+c+fukb+QOJR+4fX41Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2a/e9nS; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2a/e9nS"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c6a001e3bfso198719785a.1
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 17:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768699104; x=1769303904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r25epDAJMQ/dj4/lD+Zndgkln/iNdOm3o/jXssTljSE=;
        b=h2a/e9nSut3T9bIWO0kthXjxhHwLDoDsmipbNksu8DHVIoxaPmx9oofgNhIjBqenQl
         dN+zDz603mq1S5dRHk8TMWrQ58Yymi9I5Qg8XpYN8DQhJCGc+4P9J5Sbt4CxAZnnKmEe
         PALtArlPAxHrQl0EUIwpENv82N3XHuxSvHzwTq5oohi45dVQuzG5Ssd1MQGru4i/MNUH
         /xMYDjglX8ayPeTRkQQbw19LvdrfYAPcS23LTrgCIoyjxJEXOaYljMyhm/tFBk1aLTky
         lPw/raTGziaDUJuoP7aaxzrGXlXrabwPCTcKO71qMMPY2Q09+RrmxFkP6J4V3AYfuc7G
         4AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768699104; x=1769303904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r25epDAJMQ/dj4/lD+Zndgkln/iNdOm3o/jXssTljSE=;
        b=sHbVfX70LsFM/mqE1GTIVCj9SYMCfVlleyybFXIQbPdv4kLlfGvFQgHsyti/fxacqO
         a5SQFQHQC1mc4NB3qN/mi6cX9qgxZaADvjFboCcB4P9tvQ0EcKttVCXl3Z0yDqVZc19W
         FzXUWTDBcn2mzoJBR1lWeuj4+stgzxl+nYNX5nfkEU5eR1q4hQbeH/hJWdHjCQ5k0AS2
         0MAAI05oY0Ej4Q+U5MuEwBztx4b6FJ2vm8AEmK0ht2xt9PdNoqXhVHISaum6itEhxDAd
         8Nrs7W5nuJoM+rvhuAvEG+OQyC1xZ9ahDM2VaFJIHFSaIGbuKuiJyRUHouQb36rAmzN4
         gOnw==
X-Forwarded-Encrypted: i=1; AJvYcCVnFkhnacBRyMITSzUkl8M6RwlN1IB+i48GT/H93F0K8kfcmx1vJg6qGFMBerpZUeZRzHvxUs6MBOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YysE9iYmxAtZDO8Qz1JGsuNsmvDHavysdyBvK0FvKND29Jv9iSP
	cNOgN1MbgsWUayR6vrHFqz6pXm+QoKtB6rEOPC3Lv3vfTJZo84i6xDrY
X-Gm-Gg: AY/fxX5W1aUQorRcm5W4Ufuvw8CC9eJ9CYbuoK69e/TMqmpWannPKW0uBNUGRpJDsTq
	G4cM03rhjDwFP7Y6LH8JiUEkbgNc5nMOhk8W7kHntGMP+M0j+Eus732ge23qwrq3W0LbdIMxfmK
	j0fE3WPRXsSc8LWT7y7KhF68AEqvuKz2jar5QpyaLizt6w0CfVkGhzudEFYV8vrhMKf68DaKd9Q
	HRqyir8QL1RDuWmscZtkVwmQG1XXuEygyxmV9JnyneXPA4a4cbCGkrzxh/q7FzuH0I2MWb2QRPQ
	mePZKijWAlL1QrS/rpX2dTvi/pguxLrSTuE1lpSMumiyKWg8xPOhEexlQTmWyn8Rv5PbBecN+ax
	hN0Tsr6c3CehUKPfSpVDMRoa6PPCWwXL1FEB9ONdRqtavtnO88V9CoCAZUZFv5rXebdUGI9HCJ3
	W9VILzvTd9NJ08rkP//s5gd4cy4y7UNsI+vv2djHC+GRafVs4Hv5lG83efn7jjbV9/L4kC36s=
X-Received: by 2002:a05:620a:7082:b0:8c5:3881:da8e with SMTP id af79cd13be357-8c6a67b0933mr1054464285a.65.1768699103670;
        Sat, 17 Jan 2026 17:18:23 -0800 (PST)
Received: from pc.tail882856.ts.net ([2600:4041:4491:2000:8a64:ec6b:4:f1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72642fdsm512290285a.46.2026.01.17.17.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 17:18:22 -0800 (PST)
From: "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	corbet@lwn.net,
	shuah@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
Subject: [PATCH v5 v5 1/3] docs: tracing/fprobe: Document list filters and :entry/:exit
Date: Sat, 17 Jan 2026 20:18:13 -0500
Message-ID: <20260118011815.56516-2-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260118011815.56516-1-seokwoo.chung130@gmail.com>
References: <20260118011815.56516-1-seokwoo.chung130@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update fprobe event documentation to describe comma-separated symbol lists,
exclusions, and explicit suffixes.

Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
---
 Documentation/trace/fprobetrace.rst | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/fprobetrace.rst b/Documentation/trace/fprobetrace.rst
index b4c2ca3d02c1..bbcfd57f0005 100644
--- a/Documentation/trace/fprobetrace.rst
+++ b/Documentation/trace/fprobetrace.rst
@@ -25,14 +25,18 @@ Synopsis of fprobe-events
 -------------------------
 ::
 
-  f[:[GRP1/][EVENT1]] SYM [FETCHARGS]                       : Probe on function entry
-  f[MAXACTIVE][:[GRP1/][EVENT1]] SYM%return [FETCHARGS]     : Probe on function exit
+  f[:[GRP1/][EVENT1]] SYM[%return] [FETCHARGS]		    : Single function
+  f[:[GRP1/][EVENT1]] SYM[,[!]SYM[,...]][:entry|:exit] [FETCHARGS] :Multiple
+  function
   t[:[GRP2/][EVENT2]] TRACEPOINT [FETCHARGS]                : Probe on tracepoint
 
  GRP1           : Group name for fprobe. If omitted, use "fprobes" for it.
  GRP2           : Group name for tprobe. If omitted, use "tracepoints" for it.
  EVENT1         : Event name for fprobe. If omitted, the event name is
-                  "SYM__entry" or "SYM__exit".
+		  - For a single literal symbol, the event name is
+		    "SYM__entry" or "SYM__exit".
+		  - For a *list or any wildcard*, an explicit [GRP1/][EVENT1] is
+		    required; otherwise the parser rejects it.
  EVENT2         : Event name for tprobe. If omitted, the event name is
                   the same as "TRACEPOINT", but if the "TRACEPOINT" starts
                   with a digit character, "_TRACEPOINT" is used.
@@ -40,6 +44,13 @@ Synopsis of fprobe-events
                   can be probed simultaneously, or 0 for the default value
                   as defined in Documentation/trace/fprobe.rst
 
+ SYM		: Function name or comma-separated list of symbols.
+		  - SYM prefixed with "!" are exclusions.
+		  - ":entry" suffix means it probes entry of given symbols
+		    (default)
+		  - ":exit" suffix means it probes exit of given symbols.
+		  - "%return" suffix means it probes exit of SYM (single
+		    symbol).
  FETCHARGS      : Arguments. Each probe can have up to 128 args.
   ARG           : Fetch "ARG" function argument using BTF (only for function
                   entry or tracepoint.) (\*1)
-- 
2.43.0

