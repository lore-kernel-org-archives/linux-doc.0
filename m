Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65155415F32
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529089; cv=none; b=tiCEjtYbu+uwcKwjZ/p3xCgy0T8JFkS2qEESScr7mJBBPC8jaz9v8XOnRT9Y2r6DLSomJvkrv/korWr8kwWR7G3xOkt/O++yPLkKCH5ZJptgonSI64tol0lW0EBKgKOq8UJBqvcr8Vv8s6rDgrUFF0l7X4mULBX4Ku54ROcHVkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529089; c=relaxed/simple;
	bh=WoRaB0EVawwkliHkuJGoRlvGJWhSJmMEuytPdrNemKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bm/Igqza86KmyUaR9MAGHskfayKq6LT322DquDzdGZ2KC9D171dQhZSs5U+K4O61zc/m9qp/yvSbYmDvzuxfXHYQKBj780UB5YPHHO10Z9qrSS9duMJKEcgRiNdrq33e2oaTxF39gwrGfH2d8UTwML/stoUwDwnbb2mzA5s3wYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmJEgiy/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmJEgiy/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1094267a91.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529088; x=1787133888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlE/rwBm4Ajsne+/ftC1sXbsOIllDwyjWRq3dt4Owgg=;
        b=WmJEgiy/Q9YnXd2ohY+c7f1snMLqGf0Q9gO4aROAKoovQoODKrk0JBNz7XVVKTJC/X
         CjuDpmiNMYbN3Rv+YBcYRimTv41iP0lMFbpljF6g/Hc++oiZWau16uYcesO5XJxM5pG2
         7lhiInMBdijxCN7SiqaG0Rc5SeAFV3zaG7gxH4+tu9fKivfBgwCR3uBag+Zigxk7mLZR
         uPo/cyM29ve3orILDEcIa59Yq+F8oOqzGb1Y7SdeIhc6SoNz3IrjN9bkF/mCmFp9eQUB
         aVgGzZSDPwbSPRpsU06yZDhda4/tac243zwnOjOHo0O3HS2azGaZvNjx3HMKDAGPQ0kH
         BUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529088; x=1787133888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlE/rwBm4Ajsne+/ftC1sXbsOIllDwyjWRq3dt4Owgg=;
        b=plCzNNIsz2JQ1e/yHACGLfv+00EKt1JasogxrlE7k4P8dTKinphMq/9F7+Q4eaN4J4
         mT/VB+3NNf7Pmql3iPD4/zvqihUjAkz50GYD1ijr1YzQ/mp1qK8AQ/o1NiPDTgo48bBh
         PwjCeyGvrCdG+jrPwe7xeesJUD/6Qn1e2//uV6X+ejc9JYowFkwqEpG4TWdpDAYADE2V
         zOM0As9LJxIAc7Cos7op1HvPQ37soYyeANGSzUril4Woo9404JaVFORdi6yRoZ41eIQY
         a94VwJGB1aVfM+F3hiUiaNwkfW56fBoRs+JIhlLZKbIKl4y5rPLmsOl3tjvMx6LPBkd5
         o6aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp7haGerATz/vnetS0snfcSBButmB33KEWfyfYKb/37DEmUuWo/npv6IjiAicmC9I0DuEJa16RPlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgHIPDPa7t/Ohn0tx8i6czUYDTN4gL0vna/Za80/xErTnql3V
	x41uxJlxJgLH2ILKvyR4durHR8MFlII3DrQ5bwFH6fhGrFhxoLSYDlVr
X-Gm-Gg: AR+sD13crzNDmHQRE7DtOke+UetB1s+0DKt/F5Mqe1/reYzun5+PsSiOH5xb7iLrIwk
	ikaQZX4E5vM2VmqAGBFJYRVKwJ7+wYdBY1eaPMdn8KuHi75MaHEZGFlm/rKybdP5FG7PNChHh2V
	j5U1VIz3t5yTw1sC5GJnkb8HkbnErX+2+iRhZYeSHCjgFUuOaO56gfWCDDnyxQDgq8zAdS6bzwl
	ie3/JFn69J2Xt2ECHi4Qe93a1hODTRSro05d0Zokk4jHuKmsg130F4pzjbXvn9VEa8O3zn20DtE
	PfAFSw3e2n8cA5vQmTKGOW27GzL0cCZ5AVD+H9Rlf+ZuFMNvK88sMoupOH5UCa8J6YTHmmZUpQR
	A9cTCCdUHiv4WWX32wQpwb0aCXxPxNb2lH27OLRw3H1+fjAKe3+mTplC1xRL70kL/82irkZ95gk
	ILP4TpT9ucD3PjIPzkIf5CUlhW+XE8jfraX4o+eiDfrnCVhjNfliVLqoCTaZ//z6nRT117JUh1C
	JZnl9M+LJc9RzEOqatK4KktXQ==
X-Received: by 2002:a17:90b:5443:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-393014b4064mr4301528a91.20.1786529087671;
        Wed, 12 Aug 2026 03:04:47 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14124454d3csm8821247c88.2.2026.08.12.03.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:04:46 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH 1/3] docs/mm/damon/design: accurate semantics of nr_snapshots
Date: Wed, 12 Aug 2026 18:04:31 +0800
Message-ID: <20260812100433.6288-2-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812100433.6288-1-aethernet65535@gmail.com>
References: <20260812100433.6288-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "tried to be applied" -> "tried to be completely applied" to
maintain consistency between the documentation and the code.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 Documentation/mm/damon/design.rst | 4 ++--
 include/linux/damon.h             | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index aed6cb1cf483..1739aeec6eb9 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -846,8 +846,8 @@ scheme's execution.
 - ``nr_applied``: Total number of regions that the scheme is applied.
 - ``sz_applied``: Total size of regions that the scheme is applied.
 - ``qt_exceeds``: Total number of times the quota of the scheme has exceeded.
-- ``nr_snapshots``: Total number of DAMON snapshots that the scheme is tried to
-  be applied.
+- ``nr_snapshots``: Total number of DAMON snapshots that the scheme is
+  completely tried to be applied.
 - ``max_nr_snapshots``: Upper limit of ``nr_snapshots``.
 
 "A scheme is tried to be applied to a region" means DAMOS core logic determined
diff --git a/include/linux/damon.h b/include/linux/damon.h
index 0c8b7ddef9ab..33914594fb48 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -357,7 +357,8 @@ struct damos_watermarks {
  *		Total bytes that passed ops layer-handled DAMOS filters.
  * @qt_exceeds: Total number of times the quota of the scheme has exceeded.
  * @nr_snapshots:
- *		Total number of DAMON snapshots that the scheme has tried.
+ *		Total number of DAMON snapshots that the scheme is completely
+ *		tried to be completely applied.
  *
  * "Tried an action to a region" in this context means the DAMOS core logic
  * determined the region as eligible to apply the action.  The access pattern
-- 
2.55.0

