Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD4B39524F
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 04:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769144269; cv=none; b=tda/0k4o+Y5mMenGI9P18NwhHpWF7Hn2AgHq9LpgSurHFZn5sfmWtu5YIhoCNlKAC7k0yUy1QkDxkAuQac7fUATuWWrr1VZA3V9DrdkE6lGHCnXfIcdtCxcAYkJaYob0itT5A6ceIAmQ9tEHlKho8RRWsg/BHC6/N2O2OFF6lqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769144269; c=relaxed/simple;
	bh=gNJCsIARzmkXf+EBb/WlklHpeUg8wMqbpfoVNXrZwnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoOopl8y0qlWGbkfDixAVqQc/eIOtJIZ/HftdU1gXtdiAFse9TSgb16pnUr+pwVrNEGJEmavm6Z8h3I9Fw4wbgRlo37k8ziF4/kdTyi18NMyCId8EV+fKYGuMtpdRvhadnQ6eaPcd7cEah3qcLNoNp/PucI4B+/jM6mnNPGUjIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAfnPcxf; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAfnPcxf"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-790884840baso17898407b3.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 20:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769144262; x=1769749062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUE9K2FZw5Ls36EWUpBYNIoEjPdLY+PpGcwmuAyPWmY=;
        b=UAfnPcxfvfE60Fb0LZgoT4W5QtwBlFogKyGXfpdqO3NbpKanIdIkK+Zbl4mzYXbKn8
         j/toS1Ca5SSR02gcjQH45Q+jtRfGPTVZx6QPCX6m/X2t6p9CHVrQfl+NEslzH+un772V
         XnTHc9dbHopkzi2FBLQcp5CdPeSLFBGv1hrU+ro3shhMrVcpeDgaHw0tN1/8R0MseNPn
         ySqC2qCFdT3WKZX4gxmUHMxYuqdmsYpUS0/rpt6WrexFs/c28VOjJTCnEWqMSFphrmtU
         9M//u8+Jrj1SLLIzwkAsUANIVls6H5aF9JzR7VvEUDoPloj2bXI8vv9BZSTpXZV0pP18
         202g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769144262; x=1769749062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zUE9K2FZw5Ls36EWUpBYNIoEjPdLY+PpGcwmuAyPWmY=;
        b=BweTI2ko9GpA3EKCEV3wKJWdYnlSmiagzoTj0bUxAf4zPP5LF95xwgDs7RXl9gWwhL
         OIkWVmh4EJmJJfyruQiShfg/g5Lx7CyuX22N41/9+lH3/W3S/6Hr9Zz816nMeNBSPknr
         tK39AlVqYWTEgWKq1d//tKdIDMcJDrDJ45R7K7Q/X54GJVyXfv/JhzkBRcLKku7F2skY
         cak2hcQoWQjCUtYCR7T+wkunwbDAKWGf7tcxRX0RvSLGj97u+W9N3n5qxNGza4lcYMMt
         5U0o3rIafVhQZdIyM4/BS4aj2uuyu/V0LwCHOdbWCl10+CJvrrkP81vu4Chl/NpXSU+g
         vJrw==
X-Forwarded-Encrypted: i=1; AJvYcCWo+yySjmAb7pjNnp4ZeuFJ1BpNsNOQt4682DCYsh5KW6b7tqkmW+9t4Q/SldPRk/yhabZxXA0kwYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuji0XbEb40JcsQPM+Ub9deepwwEKH6D0hDTwqIo961wivqSIz
	3NL2msblhDxlB69vR2tFfkxsByU6c81S9qB+2WZdPon57d4aUyuyn0U=
X-Gm-Gg: AZuq6aJM0VslLvMKXrQ+Qs+J0YeAk3h5W+52hXke5Pffi6LKAxZJn/eaoE6PNlygUDf
	/2GdFabTHSo2gaGQstJNKpmiU1aEyCtkZODKoWkoEilQmZ9fTDRHBKItOxytkvtxgedMsHYKPDJ
	jm2BiJ1z7MfScJl2Kdj3S+yZotW3aBJDcplcl/fMrAwjk/xreYUVQpkpqlfA63wGlz8eiO2uF0U
	4dKkczOSNZ3TteulkwcrSgu4MRsYqxJcNNfoGYgoZbb5iphalgYak+8YRhNmdLXy9KYUJiRBEQ4
	zaeZ90E88covyDPZ8qnQHC8ZYLDdUdylrIlsMBOshMWeTt3yUtzbpJZHuZ54rvkrdjRIJ+ujRds
	gWFitVXepsj+OK/eRw2BFW7daqqJ2hGp6KTXXQbexWy44zsiYTtaqZGuKHiJA5UXxA36/p2uOZT
	TVCSI/MeSESq08NeLZqDzPLioJGeiQ/WJIBgoNCYaHasDq6jIaqlfB+F7upxtxsQ==
X-Received: by 2002:a05:690c:39c:b0:794:4c3:65ec with SMTP id 00721157ae682-7943992fbf6mr17105327b3.22.1769144262401;
        Thu, 22 Jan 2026 20:57:42 -0800 (PST)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b2b9bfcsm6436687b3.38.2026.01.22.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 20:57:42 -0800 (PST)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [RFC PATCH 1/5] mm/damon/core: add DAMOS_QUOTA_NODE_SYS_BP metric
Date: Thu, 22 Jan 2026 20:57:24 -0800
Message-ID: <20260123045733.6954-2-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123045733.6954-1-ravis.opensrc@gmail.com>
References: <20260123045733.6954-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a node-scoped "system bp" goal metric for PA-based migration
control.

This metric represents basis points (bp, 1/10,000) for
(scheme-eligible bytes on node nid) / (system total bytes)

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 3813373a9200..ec5ed1a217fc 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -155,6 +155,7 @@ enum damos_action {
  * @DAMOS_QUOTA_NODE_MEM_FREE_BP:	MemFree ratio of a node.
  * @DAMOS_QUOTA_NODE_MEMCG_USED_BP:	MemUsed ratio of a node for a cgroup.
  * @DAMOS_QUOTA_NODE_MEMCG_FREE_BP:	MemFree ratio of a node for a cgroup.
+ * @DAMOS_QUOTA_NODE_SYS_BP:		Scheme-eligible bytes ratio of a node.
  * @NR_DAMOS_QUOTA_GOAL_METRICS:	Number of DAMOS quota goal metrics.
  *
  * Metrics equal to larger than @NR_DAMOS_QUOTA_GOAL_METRICS are unsupported.
@@ -166,6 +167,7 @@ enum damos_quota_goal_metric {
 	DAMOS_QUOTA_NODE_MEM_FREE_BP,
 	DAMOS_QUOTA_NODE_MEMCG_USED_BP,
 	DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
+	DAMOS_QUOTA_NODE_SYS_BP,
 	NR_DAMOS_QUOTA_GOAL_METRICS,
 };
 
-- 
2.43.0

