Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B754255222
	for <linux-doc@vger.kernel.org>; Sat,  4 Oct 2025 23:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759621836; cv=none; b=ieVuak2l9HSJQECxn8kEVRRpMOraLIiS41oO+FrAezHXiJWDEdEslcvV70N84zQF8nhwt4/unTG6o4Z2o2W907eP/X6GfUhbPD3tMmkCJODIInrof4/Q4tiRFoT/FIirZHc0I/aQmXWls7ltAnA1lTPcxhEpICY57NCfUhUgi2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759621836; c=relaxed/simple;
	bh=z2ogZjxuTKMpoCR+MQb93w82gXJuW+Rka1YSqoLx4LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvYmesS04L5IVuUGF+y/j0GEcMb6aoGIz3wys/aAljd77yqwIXen8KGNnm5N68Z40fq7FfECk/gqGT08bG0vnVZwNz9zTRukv/EOsHNttUY3gE8CpTvbL5mW3zGeeKiTanMH1Vzjm4a5UaVYVDGrriR1nNnXtPmG3CdFDTv/rTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPemoOJA; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPemoOJA"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-796d68804a0so44737896d6.3
        for <linux-doc@vger.kernel.org>; Sat, 04 Oct 2025 16:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759621833; x=1760226633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZrEnyLevXoIcXltBXj1n0pXN58lCz/lcC/iI5a2jGg=;
        b=FPemoOJAyHihAj7y/qFgGq20d3xX6mgGMln21Jd3Qp0yV+wgtHI4M2DR1/2AsAPLbm
         hFMsBpLNXg01/z5srVi2CFWrhu3lNOLPI54yGb0yUMqP10IqjFFPIMYfx4EX5suLrcRs
         YkUQpOWmrn9toPbYvwuIavPJVuXtXpMAAgjwtEAtivi3sS/xdLMZb9XBFxQ4pxEHtfhZ
         eU2tptPMhKoSg/G6UiZaM17FuKKd9VWisXtUHfqoVScn09R4hGqUIEw4RErCNV/x+4MT
         1QG72udVg+yUC27R2D+weDAE1tbSXbQigXpVOCHH1jIyUwoDTMb7S9TfAGaYiVk/SFhS
         uiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759621833; x=1760226633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZrEnyLevXoIcXltBXj1n0pXN58lCz/lcC/iI5a2jGg=;
        b=AksDUnLkEZYvQ05ef1oJOMCWD0IJIGCgTei3BJ9nq77/7h5S7zVVqAg3xZ2r0fBDUq
         R3h6seOeCVa6100abIC/ygarRFioCmBWx9FhsFJgUI2NErq0E+xnqIqZS1LOMCGvzvzb
         +TwCkAGdK3v1I8yQ3DzeIxOa8J4Q1ZsTM8TQD9gxbvKtHn1WMi0bI7b235SeWIPrTwIs
         prHaQdltb8OR2X/us2CLazYkKphFnNLsAXCEb8LPgcN8f34QjJo+S3Uws2nlUkBwrXRz
         Gd4zTFTq/efBWTc0mSy+2EgOKunK/4cnkMNrO1YyCooyVYyfLLsrUhYjylRBgd/ZexYy
         xwTA==
X-Forwarded-Encrypted: i=1; AJvYcCUWB3Ndg2mzVHt32TM+UJP0IqnnflBq7SXSOCqggOvHKoP4oap0C+6o1cIhi4Ks5kwkK2KpIFOY3xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzRfjYsPDjL+1Imo09a/HmQIodvXrLnioEjgBntYHyql81XzV
	rl5XRe4RXUvgqxgd+e+hKz91wbILR081JHkPsOL2gPRbhyrtOoy+vZk5
X-Gm-Gg: ASbGncuxLTXKZ26s26pYJxcfHQ9o0edGaD/lbKC35w61L9lj2i3Frf49LhmnEGrDXsv
	su6eNUnv9oNatf9yYOZ6UwdJbtCdC1yqFSmDOHiu/4JaqgKUfnadRjB/k/uuCB/X0xR9lQiApY8
	nq9pVj3WRrvVUh3PPnB8JhwOvhYQ5+iPmMOGTAGOvZxlCeCxjIIo/K4Jm/v/gnNhNasrQz90V6F
	7oY9gvfibQUteXa0QftCNbxzAqRseJ4tsRtF60gBqqXG9wo4Um/gDwVM4jA/9FrBhJckaFbnAb2
	RzeDa00sMYq3oBEESKJT0bwKlnkAEjK3boFk/1ElzYR9UW9mbrNDeNEXrx/Wn58Ws6RgBbQQHZ5
	n3OAHDIVvZG71Mlq7Ett/iXhHb6kXDmTGiF/d227F8BNZwuuDg1gfKjj0vPVZbaQ571MupzvZsY
	sQB0pRRX4QyM5ZRulEtrO0XcSxvg==
X-Google-Smtp-Source: AGHT+IEfRMsUaYJ/XAJjWbILMrV1deJg/SxAXLDq4HjDEvGxveOHDphSf6WABh59w/bzNL05Mif4ew==
X-Received: by 2002:ad4:5d69:0:b0:818:54be:2381 with SMTP id 6a1803df08f44-879dc8303d8mr89763246d6.42.1759621833194;
        Sat, 04 Oct 2025 16:50:33 -0700 (PDT)
Received: from seokw-960QHA.mynetworksettings.com ([2600:4041:4491:2000:dd54:e5ff:d4b7:cf43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bdf5383fsm76180216d6.56.2025.10.04.16.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 16:50:32 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	shuah@kernel.org,
	hca@linux.ibm.com,
	corbet@lwn.net,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	seokwoo.chung130@gmail.com
Subject: [PATCH v3 2/5] tracing: fprobe: require explicit [GROUP/]EVENT for list/wildcard
Date: Sun,  5 Oct 2025 08:46:56 +0900
Message-ID: <20251004235001.133111-3-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251004235001.133111-1-seokwoo.chung130@gmail.com>
References: <20251004235001.133111-1-seokwoo.chung130@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 kernel/trace/trace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b3c94fbaf002..ac0d3acc337e 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5524,7 +5524,8 @@ static const char readme_msg[] =
 	"\t           r[maxactive][:[<group>/][<event>]] <place> [<args>]\n"
 #endif
 #ifdef CONFIG_FPROBE_EVENTS
-	"\t           f[:[<group>/][<event>]] <func-name>[%return] [<args>]\n"
+	"\t           f[:[<group>/][<event>]] <func-name>[:entry|:exit] [<args>]\n"
+	"\t                (single symbols still accept %return)\n"
 	"\t           t[:[<group>/][<event>]] <tracepoint> [<args>]\n"
 #endif
 #ifdef CONFIG_HIST_TRIGGERS
-- 
2.43.0

