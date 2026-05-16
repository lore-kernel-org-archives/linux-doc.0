Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26AD374731
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968449; cv=none; b=jG2I5j2uuQM5GM2TqZiojl7IradHcxbQ7VeBBIN2WLnrrsxFUyPFrk7lJv8MgkEB74VkZC6Khi09c4lwgM5VMvOie2nPf6YfJhLnhUc1acc3XAnAr/Oi1JyVPM53U583bUpFBA3qriOUqOgwAvXYjLHNmrgrFM4n+jvcPgIrPeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968449; c=relaxed/simple;
	bh=jz1nzUaADwE+K1cfDrDlEU5HkPkq87A/JGOsmNuUTl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4V20WPT867lyd1wHqPy3fy0E1sspHF7N+IbvhdNHYupF+qzeqZhGPDUcNBXIy+c3XsNaNTEMgsde3dP3EtH8vI3kmx8bfps0AG9RXpuyzpP6F1oIpo/czRRfCHKLMtWZCJIQFFB2JCD7G0KDQahCgQ2suAjEwv635padtD0Ssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JshZZZGp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JshZZZGp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso6115365e9.2
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778968446; x=1779573246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra4pEf8zZZm6HhF+DQ/toHqE83w/pN0bRu9e9oIN56Y=;
        b=JshZZZGpEBZAVzz6+EakEN3xOMEYQAOFnwucy7PU86hDls7D64gdM68+Ps1Opn5Uk+
         Sn3E0VMNI4de3jDzYdBbW/rpJbJAeLPLwV7LgXvyNp5HsNNuDjIzTpNK6B+v71jpsX0N
         Bo9u1hqhDZ6bpa1F8SpbE2sA/qIY2OiR+BExjbAg+bhs72LSokkNA8XAVZWFPKH11iaz
         X9Qa+m0LQrPL6uePlUXSdCfvmPCWea9mM11JjtoP6765UuS+BXTj8nxlbyhy3Al9kfjF
         9T6lkHKC2GVXUJLkhqgehB1JIpHEQjMr8OgZFZB1MG3uxSD0REpZUQz+jYR1iiKF19ff
         w2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778968446; x=1779573246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra4pEf8zZZm6HhF+DQ/toHqE83w/pN0bRu9e9oIN56Y=;
        b=cad/g2slhJp08mKiFxOK631n1tN+1cSpRMBcedJ69r4ZyeASMZRSBnxR4cKPbbgvSa
         e2AXDgY5FOiQD9J2BMo/onwsM0LUvxLNghSEHvk4AFpARgDwnA15S0ZMnE7J9grksXZ+
         pdQqT/vr+0F4qeSLjsljgOf+DEqCTkGm+V9U0H2WJghj1IWUZIuL5WyjxAztANu1sE7f
         t7159Eq4qVQUj+oTPRzUl2rWUfbnuOpkQ9c2suwEkPH187r5AqoHwsDTIGcbEj6H0ufO
         xuJImlhutSwdTLotHf1eOciehKFCBETKhSlM5SXAyBLOwjk3BDlf4kIq3venNEo34C8F
         b8JA==
X-Forwarded-Encrypted: i=1; AFNElJ/wLOfGC4sbAywkCHkh8Ealy6W1qUKVHmQDka9hBh115KjbnVQp4vih8Lp6drME6T3jdUoA3nlFI2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1eSG3Tb4bXvk/mQXLgd5NuwDKy/KJcTus5PTFuERD4Y5pTSr
	Fl2Jt8zL+o/R4Q0ZJRgiQfb6+KgF2/19MPSrjBsB2bOH+Wnc+YLztBXD
X-Gm-Gg: Acq92OHuZOOwHDv+BL+EeVw6Lh4UCirwGZILOisNu6kYTIAW55q3Rb2fE9Aena4CChS
	gh9rce7QWgeQEBpli4inG7s8eThdwsnrCZug1+ZHeS5qcogedtJqLv9CanmisjXrSGuOgZ+UB+t
	gy6vZzu3YA/bHFjcHXVTpIlp0mX/LvCXzcdEsEuUhtbOVe9bTQXvrr+V2yB2yIf7s8NQfgZ8Bj0
	wHd6DZSNRy0aVszxyzkX2Bg6eZL0+6d4gh2Yz2CafQWOkLsWljLkl33v+JKijGDZ16bpTLfbkTi
	eMgtFO1vn8L4q2nv+ILPenTDPOVVXwkrxMwpLiDWNCqi1vUFYmKOdZo+/CetTWN9NQ1JMirFGEF
	kqXZnp5J3G21anwSLdycY7yGgRe9ZKU6dtE9F9qUclP7hiW59pF3xxGb8Gd6q1DemV6Y0PgK5+g
	fk1Y5VuunUSrxliMsR4Tyu2sqCORgQ5PNhbRNfVewxTrURUqXdIfmJyUI=
X-Received: by 2002:a05:600c:a11c:b0:48f:a75e:c21 with SMTP id 5b1f17b1804b1-48fe5fcdee9mr93789275e9.6.1778968446077;
        Sat, 16 May 2026 14:54:06 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm158383415e9.8.2026.05.16.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:54:05 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: jani.nikula@linux.intel.com,
	akpm@linux-foundation.org,
	gary@garyguo.net,
	ljs@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	yann.prono@telecomnancy.net,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH v3 3/3] MAINTAINERS: create entry for kconfirm
Date: Sat, 16 May 2026 22:53:54 +0100
Message-ID: <20260516215354.449807-4-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516215354.449807-1-julianbraha@gmail.com>
References: <20260516215354.449807-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer of kconfirm.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..8f4f5a009228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13824,6 +13824,12 @@ F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/
 
+KCONFIRM
+M:	Julian Braha <julianbraha@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kconfirm.rst
+F:	scripts/kconfirm/
+
 KCORE
 M:	Omar Sandoval <osandov@osandov.com>
 L:	linux-debuggers@vger.kernel.org
-- 
2.53.0

