Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554193AEF37
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428847; cv=none; b=AQKgxuTo2lNaFhFZbTD8g1f1ZjUBVO782dRun+92aCroV3vwskMM2KTHWxzdrvKQDnsXGYHWFMDONaH+l7dPXzqrNdG2SQYTMHKKIZJIjaKuQygvFhfoCiDya+IyQsWSAD+/yNru+YQKH9Y60FQ8EWtXMySxs9YG37k0VBfS75c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428847; c=relaxed/simple;
	bh=A8Qn2ZXNyjvn8gNDuWwA+Rtb50kD3BeNv2696tgjRjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pad0hFQSUcZd3/jAYKwk3AsBemOpkn23ROm6m+FTgOiQijuHpBU4SwvNQ63D5JI6+//XZW2CoMxpOK97nHxGe6LW1DkysJhF0+6W2ZSGoLLjg3z4e8edj6KkCWbXNzDuA0nTPYK9hDh/hI0oOYM4YfnnkeNcgXsVu+JQoyT1Mk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkFSUbeM; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkFSUbeM"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c52c67f64cso32088285a.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 14:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768428828; x=1769033628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVTV9saCiqOGcBv4/N1kZOQdjcejYiLRdluYVStkd9M=;
        b=KkFSUbeMrfhGDKaMkcBs1gAfFq6i4S05xZsadrVDqLIjDc58XprImxwIwuuNeNYowF
         gP+Dc3oOBEHLBWJ81YZvIZaYPHFQZJS/eayyUVt8WEBjMGAPf+g67kQ9sLe9rZ8XRJpC
         BkQLHHCsA/+9pCdqroGPtuAeuaeLK781dhZcGJeKNh89MKrdzUyQJjwT1Vd9IsV4esIl
         upz8N1YbOjI3Ll11oaCts5RgRnZCVhFv4w5JTiwfmDoabFCGYX5snatjYlW+qIlSAJnW
         TL2us52c6ZFX5vPc1RescPzu1E/6IYJvM+9JxAPgKIJm+Gcuqu+ryoyML14NrM84S/ii
         YIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428828; x=1769033628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVTV9saCiqOGcBv4/N1kZOQdjcejYiLRdluYVStkd9M=;
        b=XQy6BJGLwboJ8V4SfB1Sh9cY4h0JUbp/8HuC/B5bHQTkkh8on0za06PWkB4nbIPn0Z
         kMEPn12B7OmZBCA4bspR0IFi8c85ZMh4osipsM4WDuy7bFMZjy+W22+KtI7RnMGOgTq2
         Vp6bSyc8ebY9misTv7s4iB0l5Zkw4T7O+TzDtVw2r/aHdbyWYbv11kzCNvYHSf/6rvF4
         0F9HtjxQENOrHT34wqcTHYEJKlINbtrjvwzBLKrIhbgOy3zqDcmcXEyq92dc4wByc3P3
         VoUSkhQ5UoAUweloKq+7pTswloppSe1mX0N4d+aS3phjyqOA/R6mKDIbBkMPLwl7JMFC
         D99g==
X-Forwarded-Encrypted: i=1; AJvYcCVgZc2h3IISwdhKKx+1fJDPKVx0/a2RRqgQKEaLlNzG7PjkKY122b4GAgFvhsgSGT4feOaskQ0cn3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YWcie6oxiuxHHSUxOYh24/0vhtEeBaUfCINKLxX3UXzrBECP
	aB98h930DTzjdLzcY0TnaVlFlMffpk/Obov4n4Kylyu4WjBZy2Y52/Zn
X-Gm-Gg: AY/fxX7dLy49UC1DH54Ej1oT1NlzOIKGrJLDLmqfsXsXtUuce6IrXF3CTqqkEuC2GKq
	+tgce5GAZ66nR7cNzcqeAVhOp1zCEKiFZzIoORCHd8K1Q8BZtnu0UgZpFfGC2J20Tn57ZxsiopI
	rhJByaWZePI3pJAI+UAidIOG2YPg/PhafdE1vpDSrNWz1oVIKZdI5ATvdxjbVtDDQU+3HXUVwlP
	7R1R9ybxFFy+1yDujcdHP0ak4m7jZL75aBXUosJcg4HgFG0Nrk9kNdp34ZwK3LDXDlGfwC5i3D6
	oJR66mCo3XLnjUmKfcBbyBG3N2niFVqvsOj9hJwRwg8xoEYYwHiYAZXqJFU+7T0t/yQrfxYRo38
	45FoyS/9Y1+tzKruFbdwHf+lxyGEXPs6RnVjWWy4G9G/xtpeqjJpDdPtFmNV86Sqre4Z3+sAv3d
	TNVhZ8biR10D0BoZXtrJ6hGgYfkVQ6eFrbZ7OhCdiNQWdeI4DM0NIMV6hzKdriZPmXcIStY8/Pi
	bXij+ArQw==
X-Received: by 2002:a05:620a:2946:b0:8c6:670c:953f with SMTP id af79cd13be357-8c6670c9641mr44853285a.58.1768428828498;
        Wed, 14 Jan 2026 14:13:48 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:c1bc:6046:8762:e96])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bb685fsm250007785a.44.2026.01.14.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:13:48 -0800 (PST)
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
Subject: [PATCH v5 3/3] selftests/ftrace: Add accept cases for fprobe list syntax
Date: Wed, 14 Jan 2026 17:13:40 -0500
Message-ID: <20260114221341.128038-4-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114221341.128038-1-seokwoo.chung130@gmail.com>
References: <20251126184110.72241-1-seokwoo.chung130@gmail.com>
 <20260114221341.128038-1-seokwoo.chung130@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
---
 tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
index 45e57c6f487d..79392e268929 100644
--- a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
+++ b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # description: Fprobe event list syntax and :entry/:exit suffixes
-# requires: dynamic_events "f[:[<group>/][<event>]] <func-name>[:entry|:exit] [<args>]":README
+# requires: dynamic_events "f[:[<group>/][<event>]] <func-list>[:entry|:exit] [<args>]":README
 
 # Setup symbols to test. These are common kernel functions.
 PLACE=vfs_read
-- 
2.43.0

