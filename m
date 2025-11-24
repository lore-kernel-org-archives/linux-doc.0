Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD73319873
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764007529; cv=none; b=bzhNDyWxdxSVOrrBz/Gkq1h52FP3N3/n66djI9tZ3up3a3pUi6khzbkUAXXk2Lz+uoNV823AzvcmUGvN+JrI3/02vm5QiPCapb1UwP7oOHaYFwFg5/GivSIQLZTbOkzJ72h0yZe2rTzHFIUK5+mltcTzInAxcaxmBft7Lq9xiwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764007529; c=relaxed/simple;
	bh=GM99jNtFBg9eAfZGF96theNI+24NOpjzjfDfzvMVYFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LzSYm+H/GxymYKZv168K++/EMgYBOimCuIDINX1UwP1V7HsUoYqHWHuIY10b8T9H27l8xga1O3oSisJD+2biJXg0jIs00K4iomBXt98ObyZuY5WH9+oDPcoquYpBx7PKA8h0RDekHneMS9qTqFhXgy7YXIfQUp8u5/+656abKj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiEt/pcT; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiEt/pcT"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8b25ed53fcbso668267585a.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 10:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764007526; x=1764612326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkyhXpuPT0zrloEd6KIaAv32fiIk6SauqOR2nMTqmEU=;
        b=CiEt/pcTRZYKWt8sU2KJnGDNFV5h6g0vskGYwBgj4L0d39X5KrNJ/fzkR5sRdClNMI
         4mzjX+/C4UMoF9dMJB9TNT3Gu0wYj/swDL9TJYGD7xpmnZULo0YgHBlJNbXA6iHeiwcM
         5v9AWhmKAEq4SXqK+jRZXs845SKZZfVkskukVsJeq6tfce2vBo4ebknm4Ydm6mtXVrcw
         cPOZvLnmQ8LSpKcVO7rFoYPPY0VTz3cd6pmWTpRg+u913eNzKytHfzvyCMrUatFjEUwO
         Jz8JV2XC0jr22kfWdO2+KXoRRL2b6HdwkS3XDk/S4XsE8xsGLbl+Woby+ov+fc7H3Fv3
         dMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764007526; x=1764612326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkyhXpuPT0zrloEd6KIaAv32fiIk6SauqOR2nMTqmEU=;
        b=ETbLD5DSuiPlnN43GmdTCWVBLpYhoTdEHOGuDHYe2HkFUUXiZx3UeL4I+WSLfbZDST
         /G9AgY8uPRkHz0A3UgnvS9k2CJVhR+oM4UVK6opwGG4MskvoMfrh5Xh/QRVikvHtzxrJ
         3l/JEB1T4kvKV/QjQYKRhdgnxgw8g6dXznF8pL9sBZOXCLxpbF4tGrT2JsCwumEeU+MG
         hG6ZrB409V6CZjLK/P+2qTrb4vbOf65AxMS0b+S/qIAwB4YA20DECjIJZJdIGIBlH+Y6
         d48J7w3X0OQpeGt54+HhMd9qWNCFWj0U/R0D4n+N47A+9TWUNkpipSnAlacHPr/jAM/x
         8aRw==
X-Forwarded-Encrypted: i=1; AJvYcCUXUo7afUhILL4GJxBgXx5o7hEIyQxQqiqSSUBRIOFunCe5bItKOiOVHwN5E5adGfV3a8F6f0ZGzp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySHjgKf//DFyaEvVwg0xm1Fcsf2/N922KAO0fVceJWYbHtX6Wy
	uAp+2Ur+rhJlHm+o1G6QrIbrF92oD1cCo1BJ8PZQwEQrjI0DtMzxngJZ
X-Gm-Gg: ASbGncubIYgelzUddayJJqldj4yahd4oVJspH5lQ4A0ZleHbD1VL0JgVPkHM/dKyJkV
	BE7RxPa2JY8azwXKDnr/HRMJ5RLAH/F/LQAA09O6Lnc9UymXoz12ZucBfZk2aNpmFO/oZOxB08Q
	tRSR14I6eSRyJG4M+gfShbt2fM9IT8gcr290Aa8TewDFOhTcM5ehvspDgNyZQls4bWqV8z7HNoC
	KuMKY97srNEjFahCIxqAvMloQ5cmQB9BTDhYJM+wST/rJq1ZccXpXigNcOuUydv+s7FunGkEff6
	BYMlrOmk/0Hq17yvjHpqZ21uNVrcDlYnD+FEYzk1dWkgsQ2zFOr7IjBi0UXVF/FOZiwUbUxijA7
	Vn4EtWwnN1/3xctcRNPJYAxsOCR2WiFBSk+Ib9R17+Frzrkp5oY95WePgNp6NpXwa4bKX0AiP/y
	0lHf4L7AELuCHbVrtees7B
X-Google-Smtp-Source: AGHT+IEZXVxnyRgBylh6s0H6pT4EOvLbvaL2Ql3+Vqt9j16ac/dnoqRTB2VIyVKPlOpq0Be09lszmw==
X-Received: by 2002:a05:620a:1a28:b0:8b2:74e5:b3e with SMTP id af79cd13be357-8b33d24b0f1mr1673428485a.36.1764007525780;
        Mon, 24 Nov 2025 10:05:25 -0800 (PST)
Received: from biancapradeep.lan ([2605:a601:a619:8500::8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295c13ccsm990309685a.26.2025.11.24.10.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 10:05:25 -0800 (PST)
From: Hithashree Bojanala <bojanalahithashri@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hithashri Bojanala <bojanalahithashri@gmail.com>
Subject: [PATCH]  fix kmalloc bug in bpf_prog_alloc_no_stats
Date: Mon, 24 Nov 2025 13:05:20 -0500
Message-ID: <20251124180522.5350-1-bojanalahithashri@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hithashri Bojanala <bojanalahithashri@gmail.com>

fix https://syzkaller.appspot.com/bug?extid=d4264133b3e51212ea30
vmalloc doesnt support __GFP_ACCOUNT
---
 kernel/bpf/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index d595fe512498..ffe2658ce165 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -263,7 +263,8 @@ struct bpf_prog *bpf_prog_realloc(struct bpf_prog *fp_old, unsigned int size,
 	if (pages <= fp_old->pages)
 		return fp_old;
 
-	fp = __vmalloc(size, gfp_flags);
+	/*vmalloc doesn't support __GFP_ACCOUNT, so strip it for the vmalloc call */
+	fp = __vmalloc(size, gfp_flags & ~__GFP_ACCOUNT);
 	if (fp) {
 		memcpy(fp, fp_old, fp_old->pages * PAGE_SIZE);
 		fp->pages = pages;
-- 
2.47.0

