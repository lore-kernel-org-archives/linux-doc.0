Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC521E511
	for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 01:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768699114; cv=none; b=NLeMuIa8L/4bLElp5CfmFtXykvERvfqjrjLi+BHhVLeKuRZnGeiDeGS04/YuKIVGPcixqAnihBV+stz9U2K05EeLvR+nMFQ6dapj0rnplaucvjR/54nLoH1+j2AGW00wvF+XYRqRmCUZtKvfCZ9Qt0WQQhZXBUIsF1dHXwzawXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768699114; c=relaxed/simple;
	bh=ZDrrQk7+ZbCO+fyU001b1FgFHm9Go+TFY1C20mho8n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSB+2L5AtpE2HbcrcdbOQRPAN8tnaAgjXZXLXvYOGwOh02+0zkiEQKOgPe6iaBULDQ98VKRIZy8KJBnKwKhIj4zj4IkztKHz9an3WwIL9TpGiMhseBDkxHE8vgM6H1fYNeB0sRQrExA/b+kmYp2f2c1w0A29YuVOfdQ0F6vPVMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5jsxLwi; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5jsxLwi"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c5389c3cd2so351276985a.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 17:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768699109; x=1769303909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Tho2VqUNeLqQMboUEaDyPNZ6VVJ6gB0GGd5RNkCMkk=;
        b=N5jsxLwiT0SL5Wdimo9JYVPftYjVKiGF3mRlvZvV98W+RJYJXT81Jrr4xusGkvsEe0
         QmxS83+jvp5HAR2+VItnIK4E0rDDPPYNndfGcseZyevAiuPzSnsp32TywbQOAz5xXSJt
         ANv2TE+DjMBvKpdXJ87a4Pr3l8WL+pAzxZEDLMXBwzNXrW8dGZ2linDwqEHmjcAYBpTJ
         83kYXOTX0RRGJ20j00kB3rwNQZqAlqGc2f8jFJxglTjVwPnVwkzvtFQhiBXEBT9NpCLw
         YDU7J3R5EwPvWZtDoEEvERjJ75LxZQl3QXtcFZoHiW6dS0HjlCDIpl5nSCCV6hdXR5NA
         EUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768699109; x=1769303909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Tho2VqUNeLqQMboUEaDyPNZ6VVJ6gB0GGd5RNkCMkk=;
        b=tw4RTfojOJz99z25V+6Bld29wajBdxrqQncsCLxzGF6f8cixA70Va2FrEAQZpxuZxF
         i6XScV3lrC9Sq0i0N/NwbOmYEoh8vuN/41uhQkbfosoYxx0aQ4xhD+4Q7bVCjKIFyO3Y
         ALsm1hHFvZ8cHs+I5nksEkwDbyV+UHLf5nphIqZ8ApxnMS7rwAAYUgVywVCYErAKx2Ga
         VKtuTsGHz28yh6SK4qIjd9yWttMM85r4uLk+8Aw7gw9REwmnETf3XOY3aLO5bCSRNoSs
         Jq26s+NaAGuzzFYupQeMWTnc/OKR2lWBPJQEn9uatOY3hIrWJRm+9z/haI9ajkT3fx3O
         ZM0w==
X-Forwarded-Encrypted: i=1; AJvYcCWFwYyABw9C1Ixn/zfbLvziQTP4vHt2DyMWToBIJHur5oF8HNiaiVX8klhSegemUAxvrdlmFudT/Mg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Fy2uIfkPn8LZNU+I+22r4QAo5IJ/7+S+i1qVPM8dxItGddlY
	LZs/sMCFBVzhWTfyKXQrAqtAREnaJM/F9CglmK+ARX95bi1+R7JtCk7M
X-Gm-Gg: AY/fxX561u5k3+55Hv4nynyY5Qbz5ZCWeIuRZHl6anmdPf99Y9lii4iN8CGrOuo+IRa
	bvTvM14yKGP3jEr1BbIYPhkSIpPNh38VaoY79Tn1OOVCPvz99/PsIGDvfW0J1v+ONfVF0DxtXJy
	gR4pRth//4L8JD+KI5ZQMiZ/+P9MlaCDJiRUaIrEtvPnWra2CxrHqZKi+NXY+xZC+gI8T6MCaIi
	PEvwvQ8Gt/nOA4H1iaSnh2GTblNl8YcLlM14toMXgL7SOLwn/dRCyBITDZrKcUkSjU4y+K8pCVO
	Dh0gpmRfx5/l7m3NTLanp9dKRI+g5ehqoHTNdICLJJmA3XIFNUzfeId0OtYJC/g4mdw81m89Ad3
	sEAcpwFtjFfR87iRgEi608F+eixg3hq5li2oKedPmwtk9rhbmOurGAkJWwsXk291kLOdc0ZVwUP
	rtA8POIODxuss/jyu9278ZQkloN6Jljkhit9ho03RKZJxXqf9HmRtvg6ahJcSfGT5wJgrfnqI=
X-Received: by 2002:a05:620a:191e:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8c6a6704482mr1057363685a.27.1768699109428;
        Sat, 17 Jan 2026 17:18:29 -0800 (PST)
Received: from pc.tail882856.ts.net ([2600:4041:4491:2000:8a64:ec6b:4:f1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72642fdsm512290285a.46.2026.01.17.17.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 17:18:28 -0800 (PST)
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
Subject: [PATCH v5 v5 3/3] selftests/ftrace: Add accept cases for fprobe list syntax
Date: Sat, 17 Jan 2026 20:18:15 -0500
Message-ID: <20260118011815.56516-4-seokwoo.chung130@gmail.com>
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

Add selftest for comma-separated symbol lists, exclusion (!), and explicit
:entry/:exit suffixes. Verify that excluded symbols are not attached and
that enabled_functions shows the correct probes.

Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
---
 .../ftrace/test.d/dynevent/fprobe_list.tc     | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc

diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
new file mode 100644
index 000000000000..45e57c6f487d
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
@@ -0,0 +1,92 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Fprobe event list syntax and :entry/:exit suffixes
+# requires: dynamic_events "f[:[<group>/][<event>]] <func-name>[:entry|:exit] [<args>]":README
+
+# Setup symbols to test. These are common kernel functions.
+PLACE=vfs_read
+PLACE2=vfs_write
+PLACE3=vfs_open
+
+echo 0 > events/enable
+echo > dynamic_events
+
+# Get baseline count of enabled functions (should be 0 if clean, but be safe)
+if [ -f enabled_functions ]; then
+	ocnt=`cat enabled_functions | wc -l`
+else
+	ocnt=0
+fi
+
+# Test 1: List default (entry) with exclusion
+# Target: Trace vfs_read and vfs_open, but EXCLUDE vfs_write
+echo "f:test/list_entry $PLACE,!$PLACE2,$PLACE3" >> dynamic_events
+grep -q "test/list_entry" dynamic_events
+test -d events/test/list_entry
+
+echo 1 > events/test/list_entry/enable
+
+grep -q "$PLACE" enabled_functions
+grep -q "$PLACE3" enabled_functions
+! grep -q "$PLACE2" enabled_functions
+
+# Check count (Baseline + 2 new functions)
+cnt=`cat enabled_functions | wc -l`
+if [ $cnt -ne $((ocnt + 2)) ]; then
+	exit_fail
+fi
+
+# Cleanup Test 1
+echo 0 > events/test/list_entry/enable
+echo "-:test/list_entry" >> dynamic_events
+! grep -q "test/list_entry" dynamic_events
+
+# Count should return to baseline
+cnt=`cat enabled_functions | wc -l`
+if [ $cnt -ne $ocnt ]; then
+	exit_fail
+fi
+
+# Test 2: List with explicit :entry suffix
+# (Should behave exactly like Test 1)
+echo "f:test/list_entry_exp $PLACE,!$PLACE2,$PLACE3:entry" >> dynamic_events
+grep -q "test/list_entry_exp" dynamic_events
+test -d events/test/list_entry_exp
+
+echo 1 > events/test/list_entry_exp/enable
+
+grep -q "$PLACE" enabled_functions
+grep -q "$PLACE3" enabled_functions
+! grep -q "$PLACE2" enabled_functions
+
+cnt=`cat enabled_functions | wc -l`
+if [ $cnt -ne $((ocnt + 2)) ]; then
+	exit_fail
+fi
+
+# Cleanup Test 2
+echo 0 > events/test/list_entry_exp/enable
+echo "-:test/list_entry_exp" >> dynamic_events
+
+# Test 3: List with :exit suffix
+echo "f:test/list_exit $PLACE,!$PLACE2,$PLACE3:exit" >> dynamic_events
+grep -q "test/list_exit" dynamic_events
+test -d events/test/list_exit
+
+echo 1 > events/test/list_exit/enable
+
+# Even for return probes, enabled_functions lists the attached symbols
+grep -q "$PLACE" enabled_functions
+grep -q "$PLACE3" enabled_functions
+! grep -q "$PLACE2" enabled_functions
+
+cnt=`cat enabled_functions | wc -l`
+if [ $cnt -ne $((ocnt + 2)) ]; then
+	exit_fail
+fi
+
+# Cleanup Test 3
+echo 0 > events/test/list_exit/enable
+echo "-:test/list_exit" >> dynamic_events
+
+clear_trace
-- 
2.43.0

