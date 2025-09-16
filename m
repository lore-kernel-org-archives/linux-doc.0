Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92B2D6E49
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001345; cv=none; b=ugUWdEZVGsdVHy/opA8s0uSq6KQ7WAVEQ0fEu6llAeZf3lpuVhk+/dGJGa2+kusXwiE8od6f0sxD8+z8WRSvne8jhg4KbCO/PNCZlsqzbm706O0h3Bt0f22oHud6700Vlz91qoYC4/OXNziRMILUPTlDn4eS9FJlOLiIId3PfBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001345; c=relaxed/simple;
	bh=d2Ks+Ez2kkiMgnmwiuOB1yzGYoU50hvL0gFy9bbawNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0+qgAOP6d4X7RsJHJ1n3j5S80ZT4zMwt7ebOsdvoA8glEeI5XE9CJGw6U2+CJtVWxOXwDv4lv93mMX5e/zYhuSOI7iWRc+lTalY/kDcx9EnpnB8pGJI3dxvJez4y3O1DOBPX0e1zrPjPoIXilGbAxU1N6OX1m5N6LtdIo2ozk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLdtZX/c; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLdtZX/c"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7725de6b57dso6245974b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 22:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758001343; x=1758606143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OrphTQTPcPloMHaTWuSR0TqiJdZDQyGVN8eE5nU/kg=;
        b=fLdtZX/cIxnrc7ADRhhzQS1AQUgaMPH/yx69Cvr/3wJj7pAnYlP7BVb3vtFMmmtgD8
         kG2qfDKXTf3Z9BISLpCcgHw3E6rHS87OexD93ed98M+1jd6zo47KSaz5WtnPhCYjElWc
         wbWgqdcbVaShig0+q/FXrcNBMyu2O3an634R0YmPHaL/Y3NWciWfO1UsqkG8PqYmyMrX
         5oj0u3anQocWmwX8OlvMcDB4cy3QHmBWrO7WB3cNR4ULh0yC3Xt+PWr0PyVV5oU4gmKi
         vW2j3Vqp4nL19bzZZYwUkP+F7cFjhPFGS8JEqEXK9eA3ImWyHUAkTdv0fBYhI91DcNaV
         BGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001343; x=1758606143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OrphTQTPcPloMHaTWuSR0TqiJdZDQyGVN8eE5nU/kg=;
        b=Cyd0F2U4lUNo+8WQleqNsFKy9ZEYMq+7I02gERIqWF61Jsh/00aD7/Vuq1S4QD0yRx
         OgZILpo2ecnu22X3e/M3Iik2E1fkZQd2hMxf1kKlxeMbERznYLRLhJnJQZkk39GrKNUE
         ukvrLzJMoFJIETsTxk3SzhTuXQ1OA6NPXAWiuPtd+SMx8JFWJxVro9Z4CX+qUzeuMvRs
         4nMTkSCQYxzuwQvcCKjhBajLST5ikmhM4eutZvJ4tK8H5VpZLMdr2YmuYswYYt6oyw2/
         uwbOk/lzTXl5Xr+G8Zfw/k31djmE8wvGfr4rzuw7UIbIJaV0DgWiWae+7J7tB+MweAA9
         2zVw==
X-Forwarded-Encrypted: i=1; AJvYcCU1jMgHRhYCUclDsWw81UEHcLmMWFQNFSR9Hd9VbHeuPJHMtfaeXCNhMVpsfDnF+1Cx0Vrs8TT2CKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx34iw0bzK0qGzk00PlVjNZd9oTdNbeZG4kEvlrBDY8yXW5S//g
	0rFQP43DqNeaACy0fhVlwLzhl3qkAmtk7UPd0J6evx3zx9volcOkIbt2jd+s9Q==
X-Gm-Gg: ASbGnctMBhuP/ONTdcijodWi0i0kUkN6lTnVPECG/27vHVuFNyhLpOO13Xxmm9Xy6rS
	qRpX3kg2ezrvIES2TKZ5kQ5nMQ2YsryQVlMlr2Kv7y2Vx6pjS24cd2X50UbbxB+XhYZPMn9isvb
	ifvIWcqnobKJDPXphenpwTxB0gPzWHLmQHujuo+9rV987oODaYND0x9wGXNYFKpsaOUBT8RO8Cr
	vOW0dIuAnM9u/rrlZwo+/S2kR9L2/CjdXsBm9/P6uOI8JbEFykMB2E0pyaLUGLyu0Pb4orB9xX6
	CxDOxwc5dJuu2vrd8nVuPeTFHCtmAAm12HHFvkllquDRIMYP8FBUQvDhlO5zpy/i6g/ILkAPzxK
	cgjTluYG9Zo+EwV3F0ndZWCyXZA==
X-Google-Smtp-Source: AGHT+IFjkDAeBD3m3VhlVk8jYHDU8nrvwEkAOBqjFcy5ibI78SkWM7xIqAKJtkrXYmtLfgV7adazMQ==
X-Received: by 2002:a05:6a20:939e:b0:249:d3d:a506 with SMTP id adf61e73a8af0-2602ca077cbmr20640551637.57.1758001342621;
        Mon, 15 Sep 2025 22:42:22 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77654a55d08sm8626719b3a.77.2025.09.15.22.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 22:42:21 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 817F84227236; Tue, 16 Sep 2025 12:42:19 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tom Zanussi <zanussi@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 4/5] Documentation: trace: histogram-design: Wrap introductory note in note:: directive
Date: Tue, 16 Sep 2025 12:42:02 +0700
Message-ID: <20250916054202.582074-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916054202.582074-2-bagasdotme@gmail.com>
References: <20250916054202.582074-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=bagasdotme@gmail.com; h=from:subject; bh=d2Ks+Ez2kkiMgnmwiuOB1yzGYoU50hvL0gFy9bbawNs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBknfpirH3M5u7rrglCKnIn7+0dSGWyln3SvTbzr6rjLs ke2dA5zRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACYiycrwP5Yv/PU6v5fdOt+8 b4b73JbunH4qInOCllbor/XsKwNX7GVkWMJ47OTmLQ1GPuXfZziWlzSuSPl91IG/8dll7j8xDzk F2QE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Use Sphinx note:: directive for the introductory note at the beginning
of docs, instead of aligned-text paragraph that renders as definition
list.

Reviewed-by: Tom Zanussi <zanussi@kernel.org>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/trace/histogram-design.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
index 4faff1669b77bd..ae71b5bf97c6c7 100644
--- a/Documentation/trace/histogram-design.rst
+++ b/Documentation/trace/histogram-design.rst
@@ -11,13 +11,14 @@ histograms work and how the individual pieces map to the data
 structures used to implement them in trace_events_hist.c and
 tracing_map.c.
 
-Note: All the ftrace histogram command examples assume the working
-      directory is the ftrace /tracing directory. For example::
+.. note::
+   All the ftrace histogram command examples assume the working
+   directory is the ftrace /tracing directory. For example::
 
 	# cd /sys/kernel/tracing
 
-Also, the histogram output displayed for those commands will be
-generally be truncated - only enough to make the point is displayed.
+   Also, the histogram output displayed for those commands will be
+   generally be truncated - only enough to make the point is displayed.
 
 'hist_debug' trace event files
 ==============================
-- 
An old man doll... just what I always wanted! - Clara

