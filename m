Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E9218ACA
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 02:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758679605; cv=none; b=GEDtZcG6uKPnru0jWY+0t65YJeofVmva+MFrauD2l/R1n0w3cHuymkjjiUdh5u2C2X4jkWRYx5O1tUbDe+Csyu0WFIN11cuwB/RM43idAweQ1czsWug7OXKZQxuV2lIPil8xdn/BXBSmL+KLDF6BFsdfY1lwnXLZnRiNiPZmshA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758679605; c=relaxed/simple;
	bh=gaa3l1P1fPt9cEbyVgFnFgXGJaiAtmNJHG4wcmrJDkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5Q4gJ52M+aVGgJZhrlRhWG/tCCHTC6OTerkfoIlrjwWLulW8P2kP6UiPW+vjP6kA91ccNnUGHrobl7SVel3gvkpLSBSBFwbvYpi/J3v5+v2UBPKwTYUMUjwUD3NcD3HHIUfx41ww1kv+m+pquZzmj8AAMpN4z3Gnd1KfM/QX7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLygZeOK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLygZeOK"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-780292fcf62so15968b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 19:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758679603; x=1759284403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOz5HySBOFVhMskRvxrL+nmIrbz9l42R6X2LmKA1CXk=;
        b=nLygZeOKsXzyNuc4lu8R8Z82vDCeU46USixky7KVjVHCoHU9dbHpw86dvx0QKXs4nJ
         vJve6rPY4LLqYma5QkUlV1n/EeUP2j0tHs/5n4eTOKrY1//z08on+1laoFRf4aKrdzpJ
         dCJIiaS4AFhoWY7rH7kPZ4TecvKYqo93riMNE/ZNZDBCel9v2uZgoy2QWFxs/pmfmOjP
         V5ewFHBJ/VK3+7MfF17FlPDaiaPqKg5sYB0RyUTfwmxH/zqALX//zps0i9bmPHCphpK4
         S8pWNBnTXk43aVVrIYFQ+YzRRHMGuVsAwKosQZXIHNNDL4Q3r1gjASfPP77lNSclkubC
         uNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758679603; x=1759284403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOz5HySBOFVhMskRvxrL+nmIrbz9l42R6X2LmKA1CXk=;
        b=M0LwlSJZbALmJ7WkoJxdLMr85MX6TyO3alqkI/D91fHHnhQHDZt06RXy8HinpTeRLB
         2j6/8NZG2exBn9MzJod+IXD296K+u0D+/HC9ecuWObbitzY7hO5tNnbhK0COCRkEhK5R
         Nqj9xsoi2oPZ6FXY7A679LAb1QZmMY54GLXxlpLjpjjv4AZyA8ctetqHFLpC6ZthPqoH
         0Er7UlGLSwnO0zv3ghelvHB40BiwvZrjAeCCKV3l2ahWE/5reDp9/WXppKu0lkndV8jQ
         Zsw/uSiLgAkFWEL2lCJiL9kYjDhB4+b6gS7uNv9nupgowHHmAy2urr9re8J8IOb6Nr3R
         C/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCV/hrCs5LpTbYRJmiUv+DSZCEqM/9t9ADAzitqxPgYAaurefqnMg41nTisATpuyyKfU4aJoKp3sL5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YysXyo3M4+96Ikaxvohb1JXPJur7a6kabhy4mK6WrUibycI9+rD
	k1tns3NN7StuJlogcz9OaLGxc+R3DRQcCc/U6Wq2lAV58uF9Szaak7ec
X-Gm-Gg: ASbGncvF2Xu8Q+A5nlLjpsHu2WqXjub+MEAqcQFp7rTTzfD4RJlmj48cEyLE1I0ojd4
	l6y6YTgGP0CdRLDzSzxG6ZAZwfa5lA6V/qK9QoDw2FoTIsiVwZd6KQhHcAln7nqbdLWOsbgHCXs
	V4f+6ZX5IniLtZOibqlkhQ+Xb8LzOAyw+ptlGKCpDBb/436dDb++FWztibhpznjBjByd/JfJYGf
	uN8xzGlzOBdsEMTKYL2PeVsn5cg0jOOmC8bvY4nXzG54a05zHUbw1dqtokul8KkDa8mqbzN4TOg
	f4S/f+oBwY+9dxu6BJZ4FdIfN1X9ITJhmf5ZnaiczDOF63tD7PWUNrmJU5s1D4U+uqZnjOqK+Ml
	+sN6DH6FmXIJ8xac16Z+gqr0Kgdec0oUc
X-Google-Smtp-Source: AGHT+IEuUYkcZvVzgDknNU04kmG575LjqdFet88ax1daZh+11vPVjnvVKiaeqe4k8m0h/jJ+ROyOEQ==
X-Received: by 2002:a05:6a00:987:b0:77c:ddd1:749e with SMTP id d2e1a72fcca58-77f53a08fd9mr4910651b3a.19.1758679602841;
        Tue, 23 Sep 2025 19:06:42 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f286119f4sm8955740b3a.74.2025.09.23.19.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 19:06:41 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id AEE7C41A2EE2; Wed, 24 Sep 2025 09:06:39 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next v2 3/3] net: dns_resolver: Fix request-key cross-reference
Date: Wed, 24 Sep 2025 09:06:25 +0700
Message-ID: <20250924020626.17073-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924020626.17073-1-bagasdotme@gmail.com>
References: <20250924020626.17073-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=bagasdotme@gmail.com; h=from:subject; bh=gaa3l1P1fPt9cEbyVgFnFgXGJaiAtmNJHG4wcmrJDkE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBmXA9PaW66v+v921ueFSofW2qYIykxeHzzhu31D3iu9Q K65G1b87ChlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBErIwY/md9P9HC99X343pv o5iKRWsebGTclsWQXhW1bXu3w7P9rqKMDJv5d03mMDTkk96uY3ResJNrxcQMdRVxtt6c5/sL4gN XcwAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Link to "Key Request Service" docs uses file:// scheme instead due to
angled brackets markup. Fix it to proper cross-reference.

Fixes: 3db38ed76890 ("doc: ReSTify keys-request-key.txt")
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/dns_resolver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/dns_resolver.rst b/Documentation/networking/dns_resolver.rst
index fbbd2c4635cbd5..52f298834db67b 100644
--- a/Documentation/networking/dns_resolver.rst
+++ b/Documentation/networking/dns_resolver.rst
@@ -140,8 +140,8 @@ the key will be discarded and recreated when the data it holds has expired.
 dns_query() returns a copy of the value attached to the key, or an error if
 that is indicated instead.
 
-See <file:Documentation/security/keys/request-key.rst> for further
-information about request-key function.
+See Documentation/security/keys/request-key.rst for further information about
+request-key function.
 
 
 Debugging
-- 
An old man doll... just what I always wanted! - Clara

