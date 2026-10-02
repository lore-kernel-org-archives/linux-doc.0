Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7450129B
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961064; cv=none; b=K8Ax2ddnuUOd6m6AP6ms1HET3Zeku4pZBNIVeizuB8ps2xYUWjZnkEcSqGdASniHlfZylYmD8BhweTBePu2YJWEy1izEf9MC3PiLCdmALxODupMhx0tA+wkefzFpV5IpagbSebNj0ASPv47MFJ6dRnjSNwGxyyDixa/fU3BXFjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961064; c=relaxed/simple;
	bh=bKK6Ka9Gp+vtwgFDDZYR/jwqeinj7CuEjE6r7sAsMFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIKJfNKMkPiDmToxkDH15eNra+klASzwu+PeY/xf91zJApTmbF8S0u6PWxDqt203gPiTLwOKfw4PZn1b2T/GeK3rfj1TqEEumFUb7IaRU/hzHO6wBlcdX1c4NpsgS/9VgGmVVKTXYwkLdWkENbM51yE6CqxIzO4EfbnGolQid1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PT5MgHF4; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PT5MgHF4"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so121804a91.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961050; x=1791565850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=PT5MgHF4yyEUUQ+6sF7B7UQBFmhWMgpeWvlxpmjhS5yqEywN50roF1rRY+bflK48kp
         7uoFyOQWZk3RRJpObvmHVnDzjkkwFCeAKSyawrdXj4dSbIESpMBR/PkMEw4m7YiQe2Cm
         7bnm01mMLCCRkjMe/2qkkmRJ2XofwwtFbI2Zo2DtOAL1OVPfanUPZ9KWKJ7Y+bP/Fmlg
         qJxCc/bqWmjrPs3Q/v5KIWa1oW0mvS7fpdJUb3SKpw5eFuf1LsXxBNnXulikuWI68E7r
         mv674X7M255u41gG2lp710eyVDqLkb21cuqu3LfBXDZaSFQM05CGMkgu1bCDb4EIkHLU
         p2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961050; x=1791565850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=bfRoCvmWvyBcIwF0V5vCe643OcUMs6BfQcXBYY+Da1VXb+gKv47nGnQiaRiIDNBnLW
         lvX13Gd0pgz23ROH87+efQJH1ju9/Y5t/PuGLLHns+8P485a1Zgb6ViqZOWThpMoJCU6
         4MEYnwfpO9iHVRnf6lHVu65S0ykMgnkSoY4+CprXeutetEVuIjmufGQRyxFUFGy6DmGc
         5yR222F6ZRAlCTT16w5XgiQsQySeUn7gLy+uBOnEXsSfnTf6x2a2B1g1q0MqEXiR0oxz
         xgZiFeiSzP2tQrnZIexjZA1Q1fHcyPfhKdRYix3lYXg5OLa1e4Nib9/LAwkSJuBOmyrx
         c5uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCxPV7W7yPB/cl9HDXM3mdaEafdX8oW6I+1rNoMHcYMALUVK46LZi0OJsFofAvlzN5CVdJ8Z+CaGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ4vaXsZvQOVJ2kPGM5uuUYDqyA+lIquN9tk9N7RWuq+vDNjDJ
	bcC94dyj2MCHoPKYfmDQ5+AuaBr8XLnYwJgWSFPlZCJLIwMm+cjAWbB+
X-Gm-Gg: AYBFou2vD1bNxdT4Ck18V8/d0NUx0GEy90KsKKzdUFSxYaFvWX5Y4FG+waqZOONVJWH
	mohTfokJtPYTnOi/WBy6J3z7koihmXOV1p+WsBMQrhbCzgCP1X5h7bM7Q/zw8wkJl8mNNaPo41t
	QDOO5cOZYZhzgbV3NgG5W8yHtxy2rRF+fIrHBfNfFchrp/OTA2Mc17zxfpAWz05uzXe5xVOfjpY
	RsZ5WbkNLlT/l9mrWk0Rz9vAN16PAHnXZqHg9gUKrXSguZ97dAV8zNJsZq22V15lNIQoOZVxao+
	YL1l3bSmUjul8lwG3lPUJ1nafTCV5NSdE5aoyJMlUWnxxO9VQ5Q1r0mrr7cMf5n/aZKf3j/lPf8
	c5pMWBb8snSPUAc/wUcfiGbqtC8KJSG8OHt4AJhIqTsZO3FvccYAID8hob+CGuD+XDTpR4Z9XHK
	YDxPKkJplisePfPYwt9iCOUEb8wGT0ofkzd/ulEgOx6HDGSoB5SlOyhWCnL7b6GtRVOwa4bKn0X
	zqtvFS3C3vvaISsgr4PD5LcA+C3
X-Received: by 2002:a17:90b:28c4:b0:3a4:97ea:f0d6 with SMTP id 98e67ed59e1d1-3a6cecb5167mr2765857a91.42.1790961050063;
        Fri, 02 Oct 2026 10:10:50 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:49 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v2 10/15] hazptr: fix kernel-doc of hazptr_release()
Date: Sat,  3 Oct 2026 01:08:42 +0800
Message-ID: <20261002170847.3653663-11-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second parameter of hazptr_release() is named @addr, not
@addr_p.  It is the address passed to the matching
hazptr_acquire().

Fix the kernel-doc header to match the API.

Fixes: 17969a0e7f7e ("hazptr: Upgrade kernel-doc headers")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 4ee02d23abc9..07f5d9ef5a6d 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -293,7 +293,7 @@ static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
  * hazptr_release - Release the specified hazard pointer
  *
  * @ctx: The hazard-pointer context that was passed to hazptr_acquire().
- * @addr_p: The pointer that is to be hazard-pointer unprotected.
+ * @addr: The address passed to the matching hazptr_acquire().
  *
  * Release the protected hazard pointer recorded in @ctx.
  *
-- 
2.43.0

