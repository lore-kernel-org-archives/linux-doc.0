Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016BE1DD0EF
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111403; cv=none; b=UVId9cPFXpkNl89OZb150yOgnw9cyb9XA5Ge9exOqXDW2X4qpmL7ZVB0kslzNp/V/Wzjw+HnTyzuIpopSoh2fyv3U/rW4m1F8tuh+L9m8Tu20OwlV4cTpNHAh1pEIK1Ibg2bcaal7A+pQpMazKbv2S4hRPehGfD8jTWDMBrqGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111403; c=relaxed/simple;
	bh=YZfh4lOFhIfDRifl19Rkforp38T4P7E5soEAMEdMEPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDa8LeVjMhKAZdGOaCQ6XXUrL0Jvd6VyVPgvnCt4QdShFyN9qtaVwY1WBtMlYSH353ZwESosQbf3BPrg3x/uXMDbnc4VWL1+/BlcwwBEy6FlaDLLDJ2yD0t9+QOFMa5eIJcCMj2qYlL/UOcacIJ5nX643mMnfRDzYH0rPYDiVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMvS46Ue; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMvS46Ue"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so15696235e9.1
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 17:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111400; x=1785716200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mF95jYXUiLPtf4O2Fy8j4aIn774igpRbGR6wn7JFZYs=;
        b=gMvS46UeGyx1ZFUFDBVX5dmaai8vLS1woWwpW/yLBU+Wr0pNsuADr+Op1XW0cFzZss
         xewRmcTm1F9AoYI/6RlSDlQxI9JlKOx0W2pyTnXMvqOWr6tK5bBYYSxGl3xb3Ni6bgzA
         SAA2W9nD+On2sANURx1wpjLux0O5H6quON2Het1ADuPGFVpK87Ape5AORzXmJY/5KqHG
         ylcH4zaGIl7MwHh/NYwPjEqb+lurj/yL9Zo6lbed8t6uPn002+kLeCyg6sg7yCgaOVZy
         zvOI4RfyG1XhX7mcr3VJCBQaeNGc4RZjPZ5P+8jkXd6qHm5ov0D7IhdO4+cnxYo36ELv
         lTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111400; x=1785716200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF95jYXUiLPtf4O2Fy8j4aIn774igpRbGR6wn7JFZYs=;
        b=jY1n9y8l16TAQovydNl5rtrq7hDgW7jlKH/4vrI0YEQwedR7d5dsuXGZUzak3jT3bZ
         efY1SN5aCKmZZT2gBiAW/vaBexbkLnnWa9w9inL4QLQYy9FpxPCSc1cXZnxBkZvQtfYC
         MAv8bFLvyAwEKaUYH+irJSfCsq852jRHhDMcFoNI0XmM3EDvAvTpzWfyfY9W/Z+MBb01
         1nadxjXOl/k4IkSqlKxue9n2NzfTmNkJ+31zK2YTiomADJf0HJwnOcEHOgQt27cMIhBL
         0kU2LjkL+5oH0FQnvR6ZyFUBP6OuzAPWLTQx7wzxbHs59ddSnrRMbNvALiVE+Gs23osI
         3QEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEgx9722iA7tIS/pWKb2uBBPK6Ogi0knBqAKJa1QiM0Z11GISBMzSMearBYKvyorCxA0yUZYi1crQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeNS64yw0qD0rvbkvL86mgx2AYlE43o4auvfgdwG83pmqHe1EP
	Zyg7NkVdTsKu6d0GXSBfyTsaCX/9QAPeyWPuz2oXdyBxUt5PRhk8Jlkz
X-Gm-Gg: AR+sD13lHlQqp5LVF0S0q9of7Dj9G+4Ky3Kku/XMIfnPqHNk/LChJoPl9DqFOo/Ua4u
	OntU6GvPY5PwQc0g9gI0tdkIFessXf4LpCXbCVeFmU5qnCbpEVHGBXoyDNH1wP41oxNsTelLJyG
	f7oCyENjCkAFRYyTYarAcVEDwI5ScnDyQEYuDG7tm7I8J4idVdctOnWJdFXYshh5ieNw24i6/uI
	VhByX1jUJnpIMWERappGnTC2Z2eQf+6zK2Sv703L2flpUnuGRBDKDRdOT5rAlSVrDuV0qoTQXdn
	xELCbCo+eI8bR4RGB89l42jyYvjm3bmwB0uVk8PxAHno8rR5aYJyTNrYstWN6rg4gIplXu95faB
	4xEX4Jsflvo5Ymz7vLfs18y1PchBVyygpr8UsQzmgsM9M3X9wwBSnzuiQIGRENp9mOnjrfn9uAv
	J+uG78HpVFgvHByy5VfZ3LCUFuASEaenJgRsBW7lpTgd/iLGmrBDYv4XHMHF7hOhOGXA==
X-Received: by 2002:a05:600c:4ec8:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-496b56f3705mr84130915e9.9.1785111400175;
        Sun, 26 Jul 2026 17:16:40 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485f65csm176403555e9.5.2026.07.26.17.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:16:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	akpm@linux-foundation.org,
	jani.nikula@linux.intel.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ljs@kernel.org,
	andrew.jones@linux.dev,
	masahiroy@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 5/5] MAINTAINERS: add entry for kconfirm
Date: Mon, 27 Jul 2026 01:16:23 +0100
Message-ID: <20260727001623.2794156-6-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727001623.2794156-1-julianbraha@gmail.com>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I will maintain all files introduced with kconfirm.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3c01eecfa2..c7066ccef6c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14041,6 +14041,13 @@ F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/
 
+KCONFIRM AND KCONFIG BINDINGS [RUST]
+M:	Julian Braha <julianbraha@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kconfirm.rst
+F:	scripts/kconfig/kconfig.rs
+F:	scripts/kconfig/kconfirm/
+
 KCORE
 M:	Omar Sandoval <osandov@osandov.com>
 L:	linux-debuggers@vger.kernel.org
-- 
2.54.0

