Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F07039C636
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482770; cv=none; b=nTccfDaradzr2ND2JBhMO15Er4EF7mM+PlbVkq7Nx8dRzWfD0tGDBFY0vl2QISaCGhWTDYr1Re/AUyRf9xi84kBz6v+hpZnK6K3meKQJDLqE1w989dibRQ0Zg9gcBRgyOaRgULDhiernij0wwardyj2w6Er9qcmVwxX78auvq70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482770; c=relaxed/simple;
	bh=62suQfreoiy/6IOtX/iHJTSMxZ0uXFmLFj3BP9KodwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QSseIxR3kWYX/FV+upwP3htMqlkf/oH5ykoU0YEgHXFGoe59y/TVDWKy7saSiz1h1DIF/+x4yc2MiNty42PcXy9IKFiruaRK3YIWOcvsT11dg25A13sKVb6T5GQcrpoggxNek5Uy0l0SuXZj+l+EodFKYxIUDM4R3YRRnFzpO1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hk8uBpUV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i33Jp1PV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hk8uBpUV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i33Jp1PV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774482767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mtlEG93DWMiKtmpTAPwEdHj6VdNNl773QdBam9e/2o=;
	b=Hk8uBpUVD0p5ImkXi6X0i2F7IbR+M72ebHMIP92zKqamyHUUdWL/7V+Dm5TNKN8/e6Hs8V
	3mCaRqbIEMd8IYyZMzoziA6ZRqjhoU2xu3p/K74vZEWO+cwRb4R2sMh9C4ypVcIZisFOb/
	M0znCKmEu75UTUZaf7MdItIQ3S79CQ4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-LCymqgvIPoOzXFehKgWhqw-1; Wed, 25 Mar 2026 19:52:46 -0400
X-MC-Unique: LCymqgvIPoOzXFehKgWhqw-1
X-Mimecast-MFC-AGG-ID: LCymqgvIPoOzXFehKgWhqw_1774482765
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77e5e187so135635485a.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774482765; x=1775087565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mtlEG93DWMiKtmpTAPwEdHj6VdNNl773QdBam9e/2o=;
        b=i33Jp1PVDj8MzLCNf5rYvf+svy9xHALy88HkMdbgcRpdgrwOCru1i7UpIGZORP+dMf
         HH4wkcUAvNi1ngzGa2IpDxYSzdeo+2y8+K+dmYnzH1syIqowSsb94V9tvzKaUuVkbsyh
         U/WEDVFg1zw6/dH56Qn+f4e9t9kCBMPdbm7q+var5Ener2QV8cvo88AXr5bV/TeXT+0D
         98k6vcpd0m6dZWJJkETcGqKY36JhoIMSetAEjcEjiRUQ7OzDMokd9BUJzyeEjUy46XA/
         /ucntOFqZaZCyB8wjyq5WoRevuCexHRk+M1lGVTpLMzUjz1AlXZY7v6PCiERZ0Z8sChx
         HtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482765; x=1775087565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2mtlEG93DWMiKtmpTAPwEdHj6VdNNl773QdBam9e/2o=;
        b=K4RWjpJtzJ/1s4pVEE1wgGL/t2Ey6L1a6cLQfhPshWTnEw3/ar2+LUCygf3vUCOb9/
         KhrJcxppaIsxS+brpvkKf4EAJ/kmDO3E3ndiiT3BfDL8Zvr0qEnWO4SIosMMI3yTlclh
         yETmiaolmNjUHbZm2vmsAuHlXBGK44spob25J7mI6CE8eED96xwlYw1tj7VyBAqevZZy
         Q5KjGZV+Lk3dKMl3zT5TISlZ2LEM76qTrV/t8JHt+n1S2qIBi8C09o5lGPuSswuLhGYV
         ss+k073b7qlBeFd365Dso9J4ro0IL1ksiXGmfu9/1ni6gjQu2t+dcwcs5Oul7HoyXGcz
         fWBg==
X-Forwarded-Encrypted: i=1; AJvYcCUjON3ptssvg2nFBxEvloTW421aG5YCP9dClZZYNXBewGDyvQfTI8uCk01efszeHvXAuGJS8SaWzeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmn2X4h9/rhfHWPK0nld0fLZi8ZhJXNIAXyvYgEHC8UOrIMmvs
	rE/5jZDQDrk8XdQCKE3NZYESDi1E8H8jby2ZuILFhXytbeMHnyTR6ZIIfbuzzm8ItF/IZvkjn1A
	dDr5kruLJByFMmU7lF+ye+8Q8bRjgHamB0oHJQcQJUFIlIdz4doORWkTfny+OGw==
X-Gm-Gg: ATEYQzx4dcfhsdT92ipG81+HETzCHuJOaQ9QY/zOkyNqvDE3YDCxdfTeF6O9OMGc7G/
	GwsUHMMnALUOdbjfLL0P3qpGIzZIh2Fb72JKtbCepZFw6gRapYE5IRUHjYAbdbrfygWoo/zJINz
	f4iuoW3oeuXtSHyEOwFTr3HV1ISGNwmlUBZRZAY0QfUezYQUWR181VARkINlPov4vBOPYasi+kQ
	CODohv4tG5m/JF0PdKewZjAIsie/Tw3nqs6VmU4vZNpSlQ+PeDUm+cvOezxieWUIs3IDmt7BxJs
	XGzc5nFKhVTaIe5JOFzIzUUItw7OFE2cfd/NIX2pTEbh0ff7wwIlIJShP/rUgqrWiUhnJh+eAOw
	6m7p0FS9Tv6VhQ81Rddr3rLPAlT+J+T3KN6rDtDVWx4Z/bKfCZ0TTTERNjW6N
X-Received: by 2002:a05:620a:31a4:b0:8cd:cd30:779e with SMTP id af79cd13be357-8d0010044e9mr743189185a.42.1774482765576;
        Wed, 25 Mar 2026 16:52:45 -0700 (PDT)
X-Received: by 2002:a05:620a:31a4:b0:8cd:cd30:779e with SMTP id af79cd13be357-8d0010044e9mr743187385a.42.1774482765098;
        Wed, 25 Mar 2026 16:52:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e501eedsm106346785a.40.2026.03.25.16.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:52:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 25 Mar 2026 19:52:12 -0400
Subject: [PATCH v2 3/4] docs: clk: include some identifiers to keep
 documentation up to date
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-clk-docs-v2-3-bcf660e1ceb5@redhat.com>
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
In-Reply-To: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3478; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=62suQfreoiy/6IOtX/iHJTSMxZ0uXFmLFj3BP9KodwQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKPlDoWHonXTH5Ws+rgsWApvgNJZuVBf62OPU3sPqJVL
 PSz9PXnjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaicZbhf9gXvUSTMK7Wu+8v
 VJ/ufBz1tqhKSvmwzec3W235biTMSmP4730qvH33R4eP+dO8Xh76+b8+q3vqqZSZK7axON///ls
 whRMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The clk documentation currently has a separate list of some members of
struct clk_core and struct clk_ops. Now that all of these structures
have proper kernel docs, let's go ahead and just include them here via
the identifiers statement in kerneldoc.

While changes are being made here, let's also include the newly-added
enum clk_core_flags.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 Documentation/driver-api/clk.rst | 58 +++++++---------------------------------
 1 file changed, 9 insertions(+), 49 deletions(-)

diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index 93bab5336dfda06069eea700d2830089bf3bce03..d3e93519114637b3a70067128192dd302bedad4b 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -42,21 +42,8 @@ clock interface.
 Common data structures and api
 ==============================
 
-Below is the common struct clk_core definition from
-drivers/clk/clk.c, modified for brevity::
-
-	struct clk_core {
-		const char		*name;
-		const struct clk_ops	*ops;
-		struct clk_hw		*hw;
-		struct module		*owner;
-		struct clk_core		*parent;
-		const char		**parent_names;
-		struct clk_core		**parents;
-		u8			num_parents;
-		u8			new_parent_index;
-		...
-	};
+.. kernel-doc:: drivers/clk/clk.c
+   :identifiers: struct clk_core
 
 The members above make up the core of the clk tree topology.  The clk
 api itself defines several driver-facing functions which operate on
@@ -64,41 +51,14 @@ struct clk.  That api is documented in include/linux/clk.h.
 
 Platforms and devices utilizing the common struct clk_core use the struct
 clk_ops pointer in struct clk_core to perform the hardware-specific parts of
-the operations defined in clk-provider.h::
+the operations defined in clk-provider.h, and can set one or more
+framework-level flags in the enum clk_core_flags.
 
-	struct clk_ops {
-		int		(*prepare)(struct clk_hw *hw);
-		void		(*unprepare)(struct clk_hw *hw);
-		int		(*is_prepared)(struct clk_hw *hw);
-		void		(*unprepare_unused)(struct clk_hw *hw);
-		int		(*enable)(struct clk_hw *hw);
-		void		(*disable)(struct clk_hw *hw);
-		int		(*is_enabled)(struct clk_hw *hw);
-		void		(*disable_unused)(struct clk_hw *hw);
-		unsigned long	(*recalc_rate)(struct clk_hw *hw,
-						unsigned long parent_rate);
-		long		(*round_rate)(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate);
-		int		(*determine_rate)(struct clk_hw *hw,
-						  struct clk_rate_request *req);
-		int		(*set_parent)(struct clk_hw *hw, u8 index);
-		u8		(*get_parent)(struct clk_hw *hw);
-		int		(*set_rate)(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long parent_rate);
-		int		(*set_rate_and_parent)(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long parent_rate,
-					    u8 index);
-		unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
-						unsigned long parent_accuracy);
-		int		(*get_phase)(struct clk_hw *hw);
-		int		(*set_phase)(struct clk_hw *hw, int degrees);
-		void		(*init)(struct clk_hw *hw);
-		void		(*debug_init)(struct clk_hw *hw,
-					      struct dentry *dentry);
-	};
+.. kernel-doc:: include/linux/clk-provider.h
+   :identifiers: struct clk_ops
+
+.. kernel-doc:: include/linux/clk-provider.h
+   :identifiers: enum clk_core_flags
 
 Hardware clk implementations
 ============================

-- 
2.53.0

