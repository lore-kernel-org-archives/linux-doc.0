Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5C31B818
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764182494; cv=none; b=a0MqSMgaTRjagReB6X1F1uyzhkUIEs9FiQFKYk4kzT79KlwA3VB8m3XhPJxgL0hPEKI9CwF7mjSuM86KlcBkQFldhelJqecZ1o0n41hOspu4+xWEJRiD4k8zaiJuAgMv5Dr/ny1YKg58MIsjZ3lRXqArQhmXjzmjtnS4rJ7eBBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764182494; c=relaxed/simple;
	bh=dfSf90CX2fFuCBXs9FEXQJWwoweCuaJmCw5t3YHWiD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W028F4HTipwfERoxnohDSgsVBWv+fSkjZyGkT/YQdJWQ98pV26whlZ+z0gtRxHAVN9vYzfhTJUF/JbFIkKojMaFOcB4iVXEzvF5j+twL1Pp3HJ7v+CBJh2F+6RzypZtNfO1BvA+b6TN9fdxidvFBaQPYmjNgci8Y3rOEA6OmbB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjfPpbkw; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjfPpbkw"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b22b1d3e7fso3959685a.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764182491; x=1764787291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r25epDAJMQ/dj4/lD+Zndgkln/iNdOm3o/jXssTljSE=;
        b=gjfPpbkwOlrreZCEjmzJFa/R/wub4LdHPIMHP/DljKl/gh+tnk7nnaB71CB6MpaU0I
         WQhT89k71G8Ii2kHFy33z0IyZ/o8pNH0lzrIB5LwsrLLN/Ib5Sem/1wkkxRbHYqRIfkY
         Gmn3/lAqaV9UPMIJmLJSp3D7+bmrkls/by8LN/hYp4bVZy2vie66Jf9xaPzQtYwnTvgU
         EIWGbzPtvfmbbTXyB8UJhumiBvQm2tS03GZ2oqR6otnuKC75YWO7zRMp9Pth+UZvyBHj
         8sf3zW/t2NYUA3+8zL0ZFS4++Px4JvxoNYjtI5sZXuLiCzkBPXJ2x1lkjtuKanDygwCN
         28VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764182491; x=1764787291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r25epDAJMQ/dj4/lD+Zndgkln/iNdOm3o/jXssTljSE=;
        b=VYrYPLxyiziStGzs9EyiFxvse3Go4ewtixpWiJYrhsaRfFWTXYJdMRO/12qiP1iKUB
         clINbsD8j8K+2slTF2aih75jeO1O7fJYwDe6xtMg4vGb7x9SX89U6VsmlRMvFwKReTv/
         65nSfjVV0Y80fgFlSUqxtnzJa3datU2zo+HVy04+xQYWToAjYKMhCNxIx0bisXTNAB3k
         JTVBJwmnsKY2U8jwwvXgkA/n/dlQherWURsIyfUMG3uvcVIOvtGi7etmeEDEul/paP2p
         72BAg9thQb8vi/aEumEtd4YzN0exBF5N6TKT7JdG4ntazqknzJgxaZFoBsd97ufeG4PU
         HS1g==
X-Forwarded-Encrypted: i=1; AJvYcCVVV0m9FAtpgjnxrsWhOspRlB9nTt0qBmYfJcNYL6Wk1tooxmM0lXHmllKzps8ioeg7952plc856mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAFyjmHfK+cpNosjXeyIm9nOjUd/PoZj1ZKcxx6bXWay2P6qIb
	EDqHL652iQB+s1v2Ym2J1fZV6v/GgEK/hI8AK8h8StbmHAIhTU2kOZ6D
X-Gm-Gg: ASbGncsOwhSWffloT5rd2BiJ1+RsX2wK7CH33hIRt0r+fPHbl+XZCc/2FsjgumuHr5j
	dqAizZqvOaqDCA2bFNsIS9lygtso4qsNN2KpB0rBGY9yIkZXKNfgtvUuibspEDbhuhGwa8nhYFv
	ErO/0Hh08TRJDeGMKw+eFswNXqLwjCKOQYa3/Bc+QgS30epuM9T/yJRBo+KuzkdtU10hJRK09BW
	MMYSajiIr50pYMnjpR5nkatGgyKILfjT8YJZ1jogbUH8+bRTp2aD3ACPwdzTgZGlj3J+0FK+itn
	rz4ymxTYqkVHM2HPUA6+D/gTnPEmU2wtQs4nRoieYRazpnXoejPBGwlGrFH/pE/wgz895O97bZR
	xnbUm9EO4TNiQ8NZG+xoYWxmmS3PTwenoPv9qzxejI5jSLHPVbB4iPAJolrkVGoofI9hwPl1RXx
	hqcEk0W3rYBv/HDtRFe562P1pPncs+KJEk8du20WZDvysmzz7NrBkBW9Vz8L9v33NGtt4hlcD6
X-Google-Smtp-Source: AGHT+IHqQ4vHalOGeJgi5wHcgOQIKhyE2K/ufYLvIbCrYdKKtu2YqgKcr53BfJEZTMvq2GMt0PmGbw==
X-Received: by 2002:a05:620a:1a9f:b0:890:62b7:5ae2 with SMTP id af79cd13be357-8b33d4cfacdmr2481832785a.46.1764182490954;
        Wed, 26 Nov 2025 10:41:30 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:9820:e89a:8e2a:90ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e445b1csm149919506d6.9.2025.11.26.10.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:41:30 -0800 (PST)
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
Subject: [PATCH v4 1/3] docs: tracing/fprobe: Document list filters and :entry/:exit
Date: Wed, 26 Nov 2025 13:41:08 -0500
Message-ID: <20251126184110.72241-2-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126184110.72241-1-seokwoo.chung130@gmail.com>
References: <20251126184110.72241-1-seokwoo.chung130@gmail.com>
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

