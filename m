Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E03AEF2C
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428759; cv=none; b=A+nCl0afP/oAbEQvBCVpormazaCtrFmzlhXurwbiTvInIEtT+URwNRrhOAolmSLwi5qQRvWaeIYN4Tw3c1bzUzn4J5ovIZ+4krYNLJSThQpEEHR4zNqqMArLUGOcbiUOd/M9maSgihDc8A89X+ZR6Ta+qHx97c66cmoL7tp5Ytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428759; c=relaxed/simple;
	bh=v/6ny77OEhOTDZTQ79j46inEoAHozIzSVLV54SqB5XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vD7IE6GOExCjf1OlXp1vjfN9OIYN10guBm7qLP52MwBTvX3bG7tfLM7+TRuazNpclbWN5DVBNC5j6L9DwYUtOak6HQPdcgoI8B1sGj7KDYPRlw1pI3+CYhKuoNK7tA1X5TBspRLpswdxCz3Ejpk0010kvI0GCqmKWX42lv378hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddWWI+FR; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddWWI+FR"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5018ec2ae21so2795021cf.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 14:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768428743; x=1769033543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckc2PkyYWXkN9ubnJOQKa6sgkDYo191+Pf3SF4+RdaY=;
        b=ddWWI+FRLumCuusgHg2nvzmSWJc0Ve1vPjN0qxW3mKB7ybPluQdol7T3MJfDcaW840
         woR2r49G1wj9G31aWOSJptkBrwK5yQYUUWort0yJMvFhc/eCEfv3tvIGBv1BFkACMkOt
         k/7Z03hf5gKEn9FPVZ58A/PM4/xQ4vSZHtGzS0iInqeZP1ypwBUJ9XYby7Lprs1gXkCD
         9DhW9BUFb3+5iWGkVHx7MvOzySCwUNXuSIq5Y+xraCVPkYooFcBqV09c97aPqYY5VMbN
         K24M39GB9uTFdiYO2lx/wA6VfiNWIEupMYhnCT8UkuSeT0dhtFZAlDx6qxzwcRlsLcIW
         2seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428743; x=1769033543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ckc2PkyYWXkN9ubnJOQKa6sgkDYo191+Pf3SF4+RdaY=;
        b=WFCLsrCEgX9575RkyBJtRKpX2ygDVM763WcrJueR7hrLYpWq6p8L/06yDppEqOSlTX
         29Pm9yL8++4wx/OzMc0a49T2Az4goB0nrr1WfGPeq75Fjc7do2YrUH51UhUk4REqozM9
         2IvxpBQtgmWzWBUPNrzla9t06HoT9tG1N4KHGnh9bD/YD982r8RNyEnF3uQpstOS4n5p
         Rpe50Ld0G/xfEmK/Li9w929ifpZJkV2heYJ4yoTtpHKoAEiqKFnRPOpEbzOOQqA060uE
         mwkYiiPTSs5SePKp0/WG1qz/txuDSV9VmYzobsjCr1lcRdndGNRy1Pf8XCwk8PJEFRjO
         3jbg==
X-Forwarded-Encrypted: i=1; AJvYcCWYPaJ14rk974+pkNlF6DGyfCe93eidHs016w+9bVlSoqdOUxOZyyFmBiS3luI6R/ayEKuUtOhEjzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvONWdqxs4JsRUYgKDOzzoM0yGOmP7ZKOMBEPaFTezeIZvEoC3
	BazDo3aZ7FHUih0IcyUIokknwl27457wnvf1bnlG85Zv8AFRAWq3OfYU
X-Gm-Gg: AY/fxX5twuRCKVoMftZYan+rtOgP29IVfUFQjYFiURPFAI6HAz3EmTvBTweCgQmT6UU
	b/82tndzzbWNCbXe70wGPwyXem1MGNN4CewHDMJqH8dg9sQdOUjqHGMgQMerMKPB+vy9rf1wwqP
	A2CbwOlH22relxlA/hOq0gObDaY1lKqh9RvWa/Qcp96rpjVaB7Td1223MjVhSLr1pCycyfwY1QA
	OdEr9fnrLa//CDX4L4TOqZEnwKVTGKz3Va0q8c/GoMfpc8YPlUlbp/vyebW+KLbOJnO9V33J1Up
	XUJsyRWfxiT8xoU+jfvg6gS/BQONuD/I5D9NeReUbvZDKmMFABezepO+6icHLKcpRw+DIs6sSAy
	5IxLSgsAkrAetEPSLiGOwDnMz7lPSNbJ14GUU95KexJ+ZNEPtt0GuqUqwkd1GN+5NAqib/8Ds5f
	nhtV6Lq4heL05hc8dHl8OHeP98+4M3YWQtbdvfpXipUUonr9QXGvEeb7CRse+ajjVtGGGk0XM=
X-Received: by 2002:a05:622a:ec2:b0:501:48c4:28dd with SMTP id d75a77b69052e-50148c42c2cmr38121401cf.72.1768428742964;
        Wed, 14 Jan 2026 14:12:22 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:c1bc:6046:8762:e96])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148dd766fsm21715341cf.7.2026.01.14.14.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:12:22 -0800 (PST)
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
Date: Wed, 14 Jan 2026 17:12:16 -0500
Message-ID: <20260114221219.127777-1-seokwoo.chung130@gmail.com>
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

