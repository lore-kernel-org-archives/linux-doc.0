Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CF38F232
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 22:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970897; cv=none; b=Hpf+sKz/ur5/ebBX3ZgvDj2QUa7dXYYfoZDpLOl3WMml4jDaWbpoMefMkw8l2H515y5ThtuEjuyGKgtwKq9YFQYl+xTPlprsDEAW2H/Wsl6eMJVgXNYBJ2pkJrQWNtgagY3+lfMOEH0R18gKlnZdmxGaWBuikF5UuLmXIVCpIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970897; c=relaxed/simple;
	bh=6TWoslMuzMBm6p3WGtEbFUBe97Opnv7r3KdrTyJtUCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFjAMmOB99ihtWxtxmsC20FVLrh9GnMtbeDnB+ePt8cMSfVYciMf0ueSAnIHIh5GQzsYdK041Yabg++mE/8+XQ8yPJQPN9hiPcGU3AuWoKPjQ/fDBMYdgu1AG8XRsroLeNvPdYSIe6SmM890nYbgZAEVYijnaBktZzDl6Z/Y5w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HM7ii1X9; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM7ii1X9"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-7bdc947aaa3so4694567b3.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 15:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778970895; x=1779575695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJ4eRCsRtGruvU7OzNvMy5LtAnMvACrX8iMrvGPwu/M=;
        b=HM7ii1X9GQFsCXCYcDmBz44Xbq2GF+lybz2Z2UjERPfSEsY9uOv3vzZB4pM6mrvLrc
         Q6xfGNvq7rhOwpgrUeo3aEnxNpmcUJcmgOxl3MVEpCn8zUeL+nWaVicqBhawZm8ZMRB/
         cQaQSQGAsAI0okWIvcMR9iQpXu1x7Snl7CvlRuDtmzYzxc/RGFyq78DLZhw+km0xWvpL
         S6+1FxLzVaCHZJ5xyxo+mMcvwTmyRSASqR1Lp8zmeA5NKhFuOOONIkqsqs0Do0HYy+Eb
         2oP+FZrP1fH7t5VhF920yZ7Ha+Sl2U9r8gXqAuv+lD1Cn0j+gpPWcNW2mQKXDVJL0Mm6
         OyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970895; x=1779575695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JJ4eRCsRtGruvU7OzNvMy5LtAnMvACrX8iMrvGPwu/M=;
        b=cldneGRoXije5w+vkHtnkKIRYVknlAG5ylZoDTwc4sHyKNflxp7IiwBOdGj0FB65fB
         BtdRMBp1M8a9KfTkKCPahgMx4TQHv/Z81HnMEJyeFZCJQZxuxseKN/S7D6XtMbW0jet0
         /qQ9h+MzDaUrvrssAvH22F5y6Oj1i2nUeZfC3u9Gnk5lXorZFnOnzyhi4B2VjEW8Ay+y
         a6fKZ4EBuE0aCOtMIkqXXuG9oZGySkzQ3lJgbFnx8CGvj8f6V76JNe3NiQPbnl1lO35b
         hMP5q0dB3SAM1RWOcOf1zxqlOYIb7HrDQaBva2JdY+2yjPN0CaMXD0arolquu0FrAXeI
         RPog==
X-Forwarded-Encrypted: i=1; AFNElJ/peY4VIFez69XUwA1Oke1JdLojbVjpHzalOu8dBWjGcGv+4EcusnsgrM76vneq9QFx4a5iHDREG2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrpu/e/1l4nuG3ex1Ce/Oq9nbF+cvj6lAW6MWtUXO6GAgFQO+
	kqSXs36se+u377mzd3T5vKSPDWUpwvElq1S7OmB+vfgq/1vWKrSb//Y=
X-Gm-Gg: Acq92OHGpy4ZkDfdhPnXMaseTsUUGX+YVklEvHxUu0pTc1o90P1DNOoehclwhCrPJEt
	gqJUze7nv12NFZvbhqeeReRwSidjITmpO+Hp/egDE1Zs+yROHBVTjPfICVf1diSf58KbbTLRhUC
	U1jlwD6SMJaRXxLHSPkbcGwUJC006u8PWPwyfK8X3XUy83YezGzvTR4ixFtpKMS3a8U5CqG6DQi
	7w8ttfMoQOURBTmQ4IXTnKf4YhR1KDtdZ67Q6Zim/7N/Su/gBVuqO4NU/As1NcVX4ualSsnMOX7
	kTCZnAUOYv9puTcIPcX2Y29pADvV/bZ6kSCvGcyp0VT8lxqur6uOFUmfMEPe8+xKk1DfxnOyanF
	5svI9SxDtVMqaHbiNeTjjzRHTMh0BHtmxeMstaDz3NhEBk6L0g+dRnEDLF7+9at96UsC/7fVBOr
	HgScsh4NRVC0ChNihi4JyGH+fDjhRBBYFiU9sJdDLtEeJJ5fTugI/R4wyW6CW/Jz4YImxV+8TOf
	FlXrJOPd2w4
X-Received: by 2002:a05:690c:95:b0:7bd:9ce7:164c with SMTP id 00721157ae682-7c95caea6camr98089637b3.43.1778970894660;
        Sat, 16 May 2026 15:34:54 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9cea0642sm643557b3.45.2026.05.16.15.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:34:53 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	bharata@amd.com
Subject: [RFC PATCH 6/7] mm/damon/core: accept paddr_ibs in node_eligible_mem_bp ops check
Date: Sat, 16 May 2026 15:34:31 -0700
Message-ID: <20260516223439.4033-7-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516223439.4033-1-ravis.opensrc@gmail.com>
References: <20260516223439.4033-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_get_node_eligible_mem_bp() and the damon_commit_ctx() validation
path reject any ops.id != DAMON_OPS_PADDR, which caused paddr_ibs to
always get 0 from the node-eligible helper.  This caused the quota
control loop to run open-loop (esz doubles every tick) when using the
paddr_ibs backend with a node_eligible_mem_bp goal.

Introduce damon_ops_id_is_paddr_family() and use it at both sites so
DAMON_OPS_PADDR_IBS is accepted alongside DAMON_OPS_PADDR.  The helper
also gives any future paddr-family backend a single line to extend.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 2aa031cbc70b7..1e52161f4c015 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -83,6 +83,16 @@ static bool damon_ops_is_hw_hotness(enum damon_ops_id id)
 	return id == DAMON_OPS_PADDR_IBS;
 }
 
+/*
+ * Returns true if the ops id treats the monitoring target as a
+ * physical-address region (no per-task PID).  Used by paddr-only
+ * gates such as node_eligible_mem_bp.
+ */
+static bool damon_ops_id_is_paddr_family(enum damon_ops_id id)
+{
+	return id == DAMON_OPS_PADDR || id == DAMON_OPS_PADDR_IBS;
+}
+
 /**
  * damon_is_registered_ops() - Check if a given damon_operations is registered.
  * @id:	Id of the damon_operations to check if registered.
@@ -1787,8 +1797,8 @@ int damon_commit_ctx(struct damon_ctx *dst, struct damon_ctx *src)
 	if (!is_power_of_2(src->min_region_sz))
 		return -EINVAL;
 
-	/* node_eligible_mem_bp metric requires PADDR ops */
-	if (src->ops.id != DAMON_OPS_PADDR) {
+	/* node_eligible_mem_bp metric requires PADDR-family ops */
+	if (!damon_ops_id_is_paddr_family(src->ops.id)) {
 		damon_for_each_scheme(scheme, src) {
 			struct damos_quota *quota = &scheme->quota;
 
@@ -3041,7 +3051,7 @@ static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *c,
 	phys_addr_t total_eligible = 0;
 	phys_addr_t node_eligible;
 
-	if (c->ops.id != DAMON_OPS_PADDR)
+	if (!damon_ops_id_is_paddr_family(c->ops.id))
 		return 0;
 
 	if (nid < 0 || nid >= MAX_NUMNODES || !node_online(nid))
-- 
2.43.0

