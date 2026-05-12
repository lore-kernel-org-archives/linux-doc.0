Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CEA29A9C3
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 01:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549745; cv=none; b=KjYrQMzCmD76s+H67fusZG8Os7bdOe8neehRFXpXlTvXdL25i99s/rUxkwHSkaT/sj/IobP8yQGlkK/3kEVvsT7gxUVdab9UvuYbqeKtp8rMMbUPMARej85y9ogFBtao9L3bwwWiLXMqqa6iYSZJIN6cD55fa3ffLKPHu85g/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549745; c=relaxed/simple;
	bh=skbb3Q/KpEBzJJ4+xxmqbXyYsu3zxBB1F90017Iknys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9CXQR4jNKItUU65AkR0iOd5xcAUjgCkMiDgKBscNV4kcZTPe2WphsQBbzFCqeSvw6VSk2dA1sJBK6x45fmppDZVYOSku93AWRnL2c9a1Q4s/BSwHaSHOUXr/ObsNhpDIvQIoKQCYviByAhlt8F4+oAQeHvRXqbfNq0+fCBkEMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ie/49oom; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZn5pdml; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ie/49oom";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZn5pdml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778549743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=112UUGSndB0Np08m28dkWfuXBUXp3flZD9ag2HuDsVM=;
	b=Ie/49oomcCQZvMky/dXDblKk8S8TXBLLif0bLaz64IUVBMXXUbPvGjpw0c/1zts/XPoyhI
	G1jSUO+nO0WasVrH7dn5jx6svvW1oq0QpHMEMKUdN5wPmQJzDQFXVwEt5AuVc0M9eBl+lO
	qRE0UNpr8jpQVrreBDGfzLYbibK8Obc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-_Z8B3ldoNO-5Ik7_o9UJqw-1; Mon, 11 May 2026 21:35:41 -0400
X-MC-Unique: _Z8B3ldoNO-5Ik7_o9UJqw-1
X-Mimecast-MFC-AGG-ID: _Z8B3ldoNO-5Ik7_o9UJqw_1778549741
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b55b5aa8c7so112829846d6.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778549741; x=1779154541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=112UUGSndB0Np08m28dkWfuXBUXp3flZD9ag2HuDsVM=;
        b=aZn5pdmlFziVvA6r9QT73vRGA3LMYnETmTGReIRYfApgbVb4Nu4OGzWOB8FaoRBnl0
         lYlri1OCp5bTDUYuzC4vh17ftWWQ6D9zmiaAIoG6lVyJ+hNvzlZY2M7/wbzOlcXrZ2q9
         gPsx7MKoYd9GwsZkVrsepnavPW5dDNTg4HLSfqEIRssE+EEJjstealolgQu1ab7UBDDJ
         BtDCPPWCmLhMbFQ2mZNHyslHTwL2DhsONDPNgtWqQzNdj8ouViCIAuRQQHiAt5y59fg5
         AdBkIK57sm+5ORcvcfyxWnYulj/YxeJ0YSGQy/bshMz2I1WAsGGyrlr85HZ3ORnU/4me
         6Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549741; x=1779154541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=112UUGSndB0Np08m28dkWfuXBUXp3flZD9ag2HuDsVM=;
        b=CVzLgMc3Go64MTIH+m6wN82VyqJKwvfP00KZSde8qZFp31tixalhF4LT+g8sAHGHuG
         w2zywKxdJ011mnvOH+vl/h3T/DTeSuijK9AB5fcanvrJAkF9x5RPD/d74FdL1NAU1hT1
         lKvuI96T1oqikf1yPg70uJTdGGiT4DuQ4saPqhRL4hbQ72Ftgq91+eS/ntYFR/ZLlUMp
         n3DbHDKPpDTYrhaRp8XkqdQdNYWd3CnIEub26H39bKpbHS4chKFBOIUXqABAZ3GVvOrs
         HvGidYRDVQ5bwM7lDRXzpq0pAilxA9yl0lcI1PEZTsUjd63kJXm+BzBkTfIbEn4Clha6
         OA3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+tUyuHg1VGZYatg9gfTlPuSBza3FyB99hAItzz3qFmu12avVMmK8qGY53QcqXBKvmGAJje914YKnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcJ74HCTIjHidiQyspAzH1KVKKY3mgKSb/oVxs6s1nbaJ5HwC/
	RiCVjkAknfsEKgOM4oIh7EpdBKLYBYOFJqMC4BBL0ys64frlXGNMqs8DIWoPJU1BC5Vw7OxsT/s
	w4/DYp1MqYz3Yk1sLf6bXdPuZ3IR+yJSjoEeKuK3CPWhZcf+nKxJwaNDKJSd6ww==
X-Gm-Gg: Acq92OHTt/nsWxtqv4d8MNHulkY3WRoqxBb8O4Rj9hRYCDqZ6j/gnGBDsp04Nht1SgX
	tNf8mEo09WFbccfS3eASdcxY9gE/0gVxbFldaH98i776ypKciggAyyrxK4K70UxU5H+KGVCb9S7
	P+sL6XCXam8aMnRqh4bZOiNzPHtOeK9Ng7F8ByA0VaeY/Hf43Uwm/lsILYjOpTn63/q+qqhSS8h
	3XQiD5xF2+DURk9B17Yc5LsljB5SsZziPBQd2lveY1GtaWpelR63zUCR0qXqCodiJYfsibc5Kwm
	dSayCshi7TfwCO6Q874wi64Dmgwx8kocRpUgmBYXUm92MwowmRBCKiEm6uIKf3iIL9FcS9srF+4
	CRS/MakftGLzfcEgsVZaiTwV62MzJdXKvc/VU+1T2O9AND62TuJALl6CXrAywpw==
X-Received: by 2002:a05:6214:484a:b0:8b7:7594:b37c with SMTP id 6a1803df08f44-8c6619b4bbdmr15253086d6.17.1778549740912;
        Mon, 11 May 2026 18:35:40 -0700 (PDT)
X-Received: by 2002:a05:6214:484a:b0:8b7:7594:b37c with SMTP id 6a1803df08f44-8c6619b4bbdmr15252816d6.17.1778549740505;
        Mon, 11 May 2026 18:35:40 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm109704006d6.34.2026.05.11.18.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:35:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 May 2026 21:35:06 -0400
Subject: [PATCH v3 3/4] docs: clk: include some identifiers to keep
 documentation up to date
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-clk-docs-v3-3-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
In-Reply-To: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3303; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=skbb3Q/KpEBzJJ4+xxmqbXyYsu3zxBB1F90017Iknys=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKYmp+eStNSy2efyhoat3uV8vy/B+6dM/Zck7c3voclv
 WtaWs71jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYi68rw36eteYq8jJ7a44U5
 lUZHezyvHn339Lpq2v0XMy0ETOr+8jIyXLztI5/OPu3B4bYEtcNNTafXqNXzXi7xOhdwNtshjv0
 hLwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The clk documentation currently has a separate list of some members of
struct clk_core and struct clk_ops. Now that all of these structures
have proper kernel docs, let's go ahead and just include them here via
the identifiers statement in kerneldoc.

While changes are being made here, let's also include the clk flags.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 Documentation/driver-api/clk.rst | 58 +++++++++-------------------------------
 1 file changed, 12 insertions(+), 46 deletions(-)

diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index c6aca8186a78..294ead519bbf 100644
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
@@ -64,38 +51,17 @@ struct clk.  That api is documented in include/linux/clk.h.
 
 Platforms and devices utilizing the common struct clk_core use the struct
 clk_ops pointer in struct clk_core to perform the hardware-specific parts of
-the operations defined in clk-provider.h::
+the operations defined in clk-provider.h, and can set one or more
+framework-level flags documented below.
 
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
+Core flags
+==========
+
+.. kernel-doc:: include/linux/clk-provider.h
+   :doc: clk framework flags
 
 Hardware clk implementations
 ============================

-- 
2.54.0

