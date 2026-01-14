Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9CE3AEF4E
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428842; cv=none; b=Sss9CpnExR0qbNmB6IcZ+dSFOm02yCGHULvDsPP1fjki6hnh8oFoLsaIuwgitWmDlsUMex979SqprAYz4nCkgG4TccfGyAlWhJQ/FKaltDv6qFQLKrd4gQyBC29Qs0XBQpgkzEzDE24i4SZZENa6plZh28R2TAbw5buk6Ncl//c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428842; c=relaxed/simple;
	bh=IZqAGizxkk9ErROuOBGZmrieBz1ow5xW+bA7VsOBVFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohm0F7u7s5Evw8nNP3R7TnZudP+LSRSXBmaPP8QrQSVNJqi318wO+EZOUVw67961lHD0Y21mKMoEiH8NXZabVGrb84a4tNDePBI9CvSXFonjDJnDdkXsYx5/rEpLtz1y/PI6qe+LNtQujJaQXmnaphCJ2PhXNDHcCUICvLZJ7Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WO4tddO7; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WO4tddO7"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c5384ee23fso32523985a.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 14:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768428827; x=1769033627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXFVdIECi6ilyP/TUQ5Ud/VbVwJbO6QDA7pbbRj1oPg=;
        b=WO4tddO7xAYYTf9hDsF5hBYqWylnDKYCtVCM3g5Bu2Ww9Xv17G0AZ3RiMCeQwCSxhU
         8kaIqew1Cj+bgucV+m8L8PZirehadkRbtJqDSRXPk6rEmt4UXf5ZLqLsN8FjeHxc2ucX
         rFRcPDiPwEPOQNe8SIkaXBwBbgvZJ7+vJ5fSAPZTG9rZ2gnmlRdiJ+kSSgGcfToaxhzH
         Efftzc2YdIxe+P/RPDi1LM553BI1MzUamD99yYorWtKzygvlAiqb3RSrYdqJeFvjy4og
         gTm3gpiSpRgyPK1krhxxxZE3LdXKsVKfVMiyPoamSL+EEuLS3ioJgR1gA/jh5qHQBMEU
         4hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428827; x=1769033627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WXFVdIECi6ilyP/TUQ5Ud/VbVwJbO6QDA7pbbRj1oPg=;
        b=aWo0+V/l9MzlTmKd1urSSXe0Fmxx7mQD8sOoVKGl9H8zaKisB09yrCCQrzGd/WtvFm
         eNiI3LTpj5Z07Mkl7reSpTFitxWT3O7beheXbhD1Ofyh5St6+KOtBBIDcSayIS5PA1EM
         kQ8k8O2Kq/20NdSVKy3CipvJXKYu3K/VJLTuCJP/35iB++0rYdnZuCRQ7O0c+KRc1N4l
         Rwq29w3uTi+ub+bLSkB9kHA3p4YLsenKyC/FUMil+8fKOd8Z+iz7TMptt5KFwnH1VO/s
         mSOE+OHMeWYeGqb4aZJcexoSGG5wAOtDVB2csjJT7aP/+thYEyxk/hqByKQtFZK0NjSH
         xwUA==
X-Forwarded-Encrypted: i=1; AJvYcCVjjQIJw7d8SXSz9NnGRm/OgmmdOtTBdtHrSfApdZ6CR0NLV9+9FC21u7u6qCgz6Ko7QgLszMWjfjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWMFccF76LX0D7M8T1x5wcqOGGflfnD8hRvN7HM/ub/F9TSGwB
	0FDkHvqqj0ndvyukT3jMLSTvA8wzo5LYzahM4WWXs9he6yI901AXGI8+
X-Gm-Gg: AY/fxX4A36isIgNodhdyIvyQgL50bfNFwLCIrjOHfZxQIyWYQZYClP53XjyF5TK/8tC
	GXv+G9SwbuXfCHpKAXI/UZzFsm6BclsCkwPJNkQCeA3EtiVZMemAGSxvFpch0e+XXxau6B/ISf7
	eobLYghWwr+uayiXWgNKbpcdHEo+mXwVCbzLoHxfiqXWkVB5oqaXn9S7wHvCueQGTfnr8CGc0ft
	pTXrt33JHmd8jyBZYSjnl8QBssi/Saw1tr+Euxq8YfeRdD6o2do3+qCpBbDTb8TxaUltApnEaRK
	71SnRPVPLJXGgHkGqP09atCqDOgjBRcpkzWWNMRCsY44WbrtFajizrkz0e4Wajzql83PHi5j5f0
	dLZS9JSkhorsXoGRUcSu2zmqT0yvoCmqJqe/Tsx+TSwN8p4R9sJs42rBxT63cpUMsyVkI00mniC
	pE9sLG4sLStx3ZsfAq4j/f8I8mFGTwOuX42OVNZ5eUiZDxMnHBrXfzhQx4buXKz2UE+dOPgZg=
X-Received: by 2002:a05:620a:29cc:b0:8b2:e1fa:6eab with SMTP id af79cd13be357-8c52fbb918bmr575020685a.62.1768428827000;
        Wed, 14 Jan 2026 14:13:47 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:c1bc:6046:8762:e96])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bb685fsm250007785a.44.2026.01.14.14.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:13:46 -0800 (PST)
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
Subject: [PATCH v5 2/3] docs: tracing/fprobe: Document list filters and :entry/:exit
Date: Wed, 14 Jan 2026 17:13:39 -0500
Message-ID: <20260114221341.128038-3-seokwoo.chung130@gmail.com>
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
 Documentation/trace/fprobetrace.rst | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/fprobetrace.rst b/Documentation/trace/fprobetrace.rst
index b4c2ca3d02c1..5efd9c374365 100644
--- a/Documentation/trace/fprobetrace.rst
+++ b/Documentation/trace/fprobetrace.rst
@@ -25,14 +25,19 @@ Synopsis of fprobe-events
 -------------------------
 ::
 
-  f[:[GRP1/][EVENT1]] SYM [FETCHARGS]                       : Probe on function entry
-  f[MAXACTIVE][:[GRP1/][EVENT1]] SYM%return [FETCHARGS]     : Probe on function exit
+  f[:[GRP1/][EVENT1]] SYM [FETCHARGS]			: Probe on function entry
+  f[MAXACTIVE][:[GRP1/][EVENT1]] SYM%return [FETCHARGS] : Probe on function exit
+  f[:[GRP1/][EVENT1] SYM[,[!]SYM[,...][:entry|:exit] [FETCHARGS] : Probe on
+  list/wildcard
   t[:[GRP2/][EVENT2]] TRACEPOINT [FETCHARGS]                : Probe on tracepoint
 
  GRP1           : Group name for fprobe. If omitted, use "fprobes" for it.
  GRP2           : Group name for tprobe. If omitted, use "tracepoints" for it.
  EVENT1         : Event name for fprobe. If omitted, the event name is
-                  "SYM__entry" or "SYM__exit".
+          - For a single literal symbol, the event name is
+            "SYM__entry" or "SYM__exit".
+          - For a *list or any wildcard*, an explicit [GRP1/][EVENT1] is
+            required.
  EVENT2         : Event name for tprobe. If omitted, the event name is
                   the same as "TRACEPOINT", but if the "TRACEPOINT" starts
                   with a digit character, "_TRACEPOINT" is used.
@@ -40,6 +45,13 @@ Synopsis of fprobe-events
                   can be probed simultaneously, or 0 for the default value
                   as defined in Documentation/trace/fprobe.rst
 
+ SYM        : Function name or comma-separated list of symbols.
+          - SYM prefixed with "!" are exclusions.
+          - ":entry" suffix means it probes entry of given symbols
+            (default)
+          - ":exit" suffix means it probes exit of given symbols.
+          - "%return" suffix means it probes exit of SYM (single
+            symbol).
  FETCHARGS      : Arguments. Each probe can have up to 128 args.
   ARG           : Fetch "ARG" function argument using BTF (only for function
                   entry or tracepoint.) (\*1)
-- 
2.43.0

