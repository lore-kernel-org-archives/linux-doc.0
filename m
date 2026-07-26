Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3077D346AE1
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785049019; cv=none; b=S2BN1vfO2o48Ngz8vcZBWv8yJGjvsMw4sMVt4stIzBfvYqHo+G1AHISEdS5KdqS0wzd4EA5ljII0qQiJiebb+yatg0oXLYwDrkuKNb25n2zgiU0di+h5G8SUI92CK62Q4B9ipI2rHX/kg8LaashEviejSCwe0A4yYO0E4pAZq3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785049019; c=relaxed/simple;
	bh=lhgHy1iBIRh4d9vcZ9/uS9ude6ADN4FVBg+gKxaEiz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZyT83OcHnxyut1HNAVA6lgiG7ruOjy5x3/OKp3fPEwZpdnQycEa/fD44aqm7mmFAIE358158tVgpmQZKotC6Gcm6R8TATw9x1CXFhyaV7Y3jHXZ43wu225/sq3/tpW6tDHWEsc9C//tTXhXfkSVqwg4ARLxKPSxTD7R+odJ1mSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miD9ZdT4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miD9ZdT4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceae1ed204so17492365ad.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785049017; x=1785653817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZJbzfH1HmC+BKoSrX2U/UJckEHDlHY7b+JX9i+kqWE=;
        b=miD9ZdT4lrdt8ucbRTdNkeclI4aR4YhsfXVVSg9yTmG6UIb3f9f3QQ2hnlAbEsNgJE
         WtmaxYsw0R5/QksOFqSKAmh0BMZwlZV4lK5i7scQ08yvW/hmB9gSK0mkiSx2aAT1zVD6
         3NAhilygoQguLdOGLpRWrZJT+HvvprLxNTZhSpD9DC6URcIu/XubYQ6Mq6abmfK/5qyV
         fnX7/O/3lvJCchfCVwkKfFeBCyOpJ5U0FGkLWFqLG/o+x3MrPqfxncGE26wBMsXJOenT
         Iepd8LCeDhnaVImEXg8xqgRBfu0VoW3/Ea0m8ixOOK4ZRfluVMKe+876t9w58d4Avy9M
         IXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785049017; x=1785653817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZJbzfH1HmC+BKoSrX2U/UJckEHDlHY7b+JX9i+kqWE=;
        b=MwkRADihrrbhwpq6XrOBHdoIz2JApm3DSXrq//XpBoMHnfKkvBPhHx34NWTtZitvZK
         gQVpw7PtuMXARqSu+tE6lNGqzhAdnfp4weVnJmD4kibdpKxprtaWi4iXXp+0kFkWhM7s
         IPZYt0KHvPgF7rH4IHvRQmDizB0MjkaP8awOdhY1cKojYHRfMGwxn+Nfge+WdOb5dykz
         +obZ6I7H1G3qCl3zp3QcpkAyaWX/SCpkMtezG/hW8KmKkS9WwmWJBlRv354GvGcLUJnS
         7kVN3KZODdhh6nXHE/9k63eW5Vxw9sCMd6lWmqpB+p6J91aIq7SZP4VaYdZ0zcyaUd4N
         EJnw==
X-Forwarded-Encrypted: i=1; AHgh+RrhfDyJlOMhOQskw8+JFGXXQeEe3HiMQLo8Pl8gzkBqPTJfqmFuKcHPhYCYZkXqD0BbZ4bJkjjPyyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVrYu64huHfTcQRgjxeodcWMoFrb77D12VZJ+cGz3gJhMAZkYY
	89cifI8JcPkrBDiH9+s31fBP7J/6vgUAPtPZUuylRjQdjzlA2NF/lL64
X-Gm-Gg: AR+sD11QGqBPCCoi/tdrrVG3ukN/C87Ycv5tdjhi/ExuZvLAuGSFk8uYrLYQyMBLOYn
	dgvds3y+Ze/sw4glpNJKm/DPoXYK7YQOC/vWEE1Dg75pWUQ9HOo9t5QZCZ8NQLyqarKoJxD/wV9
	Hp0iIlA6OSj11ta4okBeYbHMf9cwRtMGi2XGwSX/UhItz1ouTsoy+v/zPhDWhb0IV1uT3UebVrf
	uFsuli36YMiHxm4822LSEyAz/zxzkAFWMM1JafuHXDb11NWL4AXALn+6a+nJXLnzbsg3Qntw/w3
	CMki3pn3C3N0PxIkGS+DNUxAR6u9K80Dq0hzvvs+WSrkUs1IzOrq8copzxpX6aMNU7M/TTS5R+P
	zneFlqUtM6mbnHqVmNGGvG2Z3zAJnLh9trTyAPeM2HYWeHaZREA398dTYcJlBWGT4tAm4LMem0P
	HJUpsqbBrrTdjbbStXvar4gmV+XLhok14=
X-Received: by 2002:a17:902:eccc:b0:2cf:8131:75f3 with SMTP id d9443c01a7336-2cfde683793mr44213625ad.7.1785049017455;
        Sat, 25 Jul 2026 23:56:57 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bb35sm17077565ad.12.2026.07.25.23.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:56:57 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: trace: fprobe: fix 'thos' spelling
Date: Sun, 26 Jul 2026 12:26:33 +0530
Message-ID: <20260726065633.20897-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: thos -> those.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/trace/fprobe.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/fprobe.rst b/Documentation/trace/fprobe.rst
index 95998b189ae3..46dd46a97c1f 100644
--- a/Documentation/trace/fprobe.rst
+++ b/Documentation/trace/fprobe.rst
@@ -118,7 +118,7 @@ will be cancelled.
 @fregs
         This is the `ftrace_regs` data structure at the entry and exit. This
         includes the function parameters, or the return values. So user can
-        access thos values via appropriate `ftrace_regs_*` APIs.
+        access those values via appropriate `ftrace_regs_*` APIs.
 
 @entry_data
         This is a local storage to share the data between entry and exit handlers.
-- 
2.43.0

