Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0DB3AEF52
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428838; cv=none; b=iqds7dkClKg3lXmK+iyQ5CW1Wf5MLy8XcAdQtua9PESQOQ/fDJoF93nLlqGHSb9e3ILyAMj2oUwbWvc798VB1gjC9Tu+jbLc4g0qI2WU6PTjIh/dMya4USMZTRWxgANnfo4OtH1Dv4g0J6xauvLJAMApa2a5FHiDXkmemJFnjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428838; c=relaxed/simple;
	bh=v/6ny77OEhOTDZTQ79j46inEoAHozIzSVLV54SqB5XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hy7f9S5jQCZP2HImBI5C1O7Wm31Ncx5icKsKP/ikbTmNzrKuqpXg3OlUj7EF9MvBnzqE/gyCfGMX0LhhiYs87s5K6ussZZep90jnsV3YO+jtQUZw3sNIHnc5b5UgyTkLVPwpsCucGtx6ONA82At4Av2yyr6xG2FswCBeDWa2y/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4h4GaQm; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4h4GaQm"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso20871585a.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 14:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768428824; x=1769033624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckc2PkyYWXkN9ubnJOQKa6sgkDYo191+Pf3SF4+RdaY=;
        b=m4h4GaQmLps4eYd+p4N8j6XD1Cn4yDY+z9viJPYK/P+7okqaz4kgiHMQVVLTpYl7sz
         Vin+8Oo9UpDsZ3/tdYEkI9Py1gE1HcvaO7yMETh1JSO+9Z4B26oquOgunOjvWnMaDNk9
         xAPjkEds2ZuXntNuS7WHeS4jYhh+BuTKuOqkn67bUgGZdPFCxtHBSf+vjO/UnaMWSYyZ
         1BPPXCp7y6xPsm7SFLbfFbzzY7hr3fRsEWPHohX+/gr+kpIdga+RcYbfIxP61168F4+Y
         wKQ0d1Is3/aPyE7mTZhHua2wI/suXEBtiFaRzAj9TN5t69EcbZTnfkhTJmc59V+TEoFm
         ruGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428824; x=1769033624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ckc2PkyYWXkN9ubnJOQKa6sgkDYo191+Pf3SF4+RdaY=;
        b=I16X/QtPbVUraF8vFxx2Y9CL1aPhkwc36d2jCdSlSB3wKX45hvvt+vSFdWzui3YaEZ
         qnCPzJGGMNPlHV9AFtRNDyhuUo9+KvVyRa97WIfI6OY5QZ6ScwlgsU4/YofXVjtfLH5M
         wOBPyUyXKm0CPphKnxqFte+EpuFCRkCNAOP62YAcPjcate9YYr3cQm7n7KGZ4X/zqIuj
         PFp8swh61k/vA0vih3sfxUGiVzjFs3gsJUR9NmW731FI8CT0KXON7M8m3kza25mOvwWH
         fORCOtFmmPQaKFqG2TmyeSXCSUizC7H1q9XIFxieN73kBGekkV9i+knJyN9CUBoOu1wy
         Me9w==
X-Forwarded-Encrypted: i=1; AJvYcCVf0ohR0L83hY0dyAqMErVl51OCikTn5wPEACEjb90joBdkO5rZ/iEzTtCBLUcL/mDSaURs92/VEQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdui55hRSQu2mYkAmLCcauI4B+HbKUh39Sh5nKifsRKLbh0oQi
	NbMCu1HpM2yepR+eDyv7Q5UVRqCYlj438Hoa4GN7vNqKS5Vnu9JTyvLi
X-Gm-Gg: AY/fxX5KGbmHPs8vh2+Lwj01sgnoVJrGW+MSILgNagUFfGgh6tt2kxCLJzKH0QavPNz
	74GhOEOPGORIh3J7iCL6PgautQqdC3zVcZ1TZ6Oa9DgE8S8DHucqfkDerrWeNA9Vj3N7LIh9g4a
	/C8UFw+XOZvU1TWS24Ctzj+IyjVWV5HjkmoIFNctot5IRa6lSpPtEPWYO7B4NsatVTrGghK4lst
	i7w1r3n9YD/4q790/WFfwMcupyXRM9kvjzB8c1yi0VaGAPsJKJlLTDW5BgrmqGbbk92P5VskTVR
	k+mXOkzLkl1A7Z5PtAeDzDdN65YAG/NwEMIbq3f6Ws30OigiN0A+p8Dc7iDKZQRClXWZ3K5ne2t
	B9P2P68ddOGmhGnJ30Dcqs9uaSZBCoKPZN8i6XHhuvfc2RDrYhisyIgeDPIyyk4wdi9IwFZ2WzE
	dZ8Ghh76vf0LAmwYRmV6bkU3FNtlCmq0Z4ybuIJzvQ/oBg8BTi2sla3q0aY8Z33ZJcg+I0t9K78
	HSTdgow3Q==
X-Received: by 2002:a05:620a:4052:b0:8b2:e5da:d312 with SMTP id af79cd13be357-8c591a02e83mr164610885a.39.1768428823769;
        Wed, 14 Jan 2026 14:13:43 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:c1bc:6046:8762:e96])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bb685fsm250007785a.44.2026.01.14.14.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:13:43 -0800 (PST)
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
Subject: [PATCH v5 0/3] tracing/fprobe: Support comma-separated symbols and :entry/:exit
Date: Wed, 14 Jan 2026 17:13:37 -0500
Message-ID: <20260114221341.128038-1-seokwoo.chung130@gmail.com>
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

This series extends fprobe dynamic events to accept a comma-separated list of
symbols and explicit/suffixes.

Currently, fprobe only supports a single symbol (or wildcard) per event. This
series allow users to specify a comma-separated list of symbols, including
exclusions, and to select entry/exit explicitly using /

Examples:
- f:[GRP/][EVENT] func1,func2,func3
- f:[GRP/][EVENT] func1,!func2,func3 (exclude with '!')

Logic changes:
- Refactor parsing logic into parse_fprobe_spec()
- Support comma-separated lists and '!' exclusions
- Add / suffixes for explicit entry/exit selection
- Preserve legacy single-symbol behavior (single symbols still accept %return)
- Disable BTF-based signature lookup when list/wildcard is used, since one
  function signature cannot apply to multiple functions
- Reject mixed legacy/new syntax where applicable (e.g. list + %return)
- Update tracefs/README and fprobe documentation
- Add ftrace selftests covering accepted list syntax cases

*Patch order is adjusted: code first, then docs, then selftest

Changes in v5:
- Reordered patches (code->docs->selftests) as suggested
- Addressed review feedback on README help text to show both legacy and list
  syntaxes
- Added missing traceprobe error IDs used by the new validation and fixed
  parsing/bracing issues found by automated builds
- Removed the dedicated list_mode field and infer list behavior from presence of
  filter/nofilter and keep struct trace_probe as the last member
- Link to v4: https://lore.kernel.org/linux-trace-kernel/20251127151218.4763b25c751bb2aac4b1ee36@kernel.org/

I am not fully confident the runtime testing coverage that I did is sufficient
across configs/architectures, so additional verification would be appreciated.

Best regards,
Ryan Chung

Seokwoo Chung (Ryan) (3):
  tracing/fprobe: Support comma-separated symbols and :entry/:exit
  docs: tracing/fprobe: Document list filters and :entry/:exit
  selftests/ftrace: Add accept cases for fprobe list syntax

 Documentation/trace/fprobetrace.rst           | 18 +++++--
 kernel/trace/trace.c                          |  4 +-
 kernel/trace/trace_fprobe.c                   | 49 ++++++++++---------
 kernel/trace/trace_probe.h                    |  2 +
 .../ftrace/test.d/dynevent/fprobe_list.tc     |  2 +-
 5 files changed, 47 insertions(+), 28 deletions(-)


base-commit: f0c13b210e4366e03bd9e8967347b06b227e20a4
-- 
2.43.0

