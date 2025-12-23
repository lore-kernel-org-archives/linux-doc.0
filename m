Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796672DC320
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766461995; cv=none; b=r3z3dQrO6MjPAKGA7uSAUPIvrf1G8sqabE/O7xADhkVO5zDa40SVMkmSxrdbmMhCox21Tv6rWeUCVJNPIyEZXAyOm/q5ptFZd/F5ruWiR31RymKM4Sl3BRhmdjd+tGEocLOyNAnQt3DegG5AIcITWZeqpROnvC81rDGNTFb7bOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766461995; c=relaxed/simple;
	bh=l8vpVY569Oyckx40UX5H0330UfQOdKlUhrq3Q1dNFf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rT6A1Kl9lyA0p/txBPZzzPc8N54pr3D8hlhsNj/wdEyKJsLiEqjzKncRAb8N1KDRKPBJsYToKC3pUCxA2H+apQCs80f2UDmc5vvIoCpkzfXsuzlJucg2RBcSxXrMm2XPYoinErGX4nwSvEDbJNx4ubPKSaP5tEQl93sAQ1OBF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PulckeHh; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PulckeHh"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so4185636b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 19:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766461991; x=1767066791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D24J6uXd4deKAojVFzs7zUHCvmT7uQTdrQcmJj/QTQ=;
        b=PulckeHhEi1vUUHDeh0c6cNUZIU0nkZOyIzz8IBHCE0G/WDVLEb7Hw0zQMgWo5ojvz
         8O9+YKOUWekX2pqsiN2dfkT+thiPYb0p9Ng35Sqy1ytiM2iK87hUseel25NpOiN/txub
         s9ek4f7UubugP1NIWOBjHAiocIFK4yLx5BnINV3ollKexcuYEfEW3YeWkIvyzt2AxGTY
         gN0yoTcp2T5oyiKxWNMOHKcnHnXtV67zxtGG+P/vpdLBBLvz13pAuOLdxTBpnu+S2joV
         4KoqthsCXk9oIVWCXAIM6Z6tkNQEG/5NZk119iZFMM/wCVyIrsusdZoB+6dSPjFQGR4B
         wkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766461991; x=1767066791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0D24J6uXd4deKAojVFzs7zUHCvmT7uQTdrQcmJj/QTQ=;
        b=MLqYAiPKlUx2lVpXL+WwMCp1699RmPejANi5u+bBLYQIvdm4T3qtadxbwW1GAdf8Zl
         lwQUvFB+Gra+vIkDD54VdktmspWWLWEuXrdh4yvgu0CfkYjFZe76pqQl3Wj/V+fcV4aD
         HClCFSCcZitpXmU9POP5xyrXzl/RG29nBfommIa47zFNxfqJIvVhY4Q3G5YtsBJdxKZV
         xNspoUxXMIhOvhjjiYdRkS+Mx6VTETDZFsuO46hoEdGvI/kiMGsPaXuacUiVW/2CxIP7
         n/U4fC2q8dSMgSZjfqQyrnyrNy/1os2GHcDbwjdFjRdxdX99X+hiPzrhoWPqo6adxBd2
         wdCA==
X-Forwarded-Encrypted: i=1; AJvYcCXmbTVuzlUYFdRSLpyYH+JRy4bo5J4P04MJ8LZ+3TYQFgvk+cp5oTUUe1DoP+9jfzaxgjFWt1MnxqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH/iRyK6kh+Z60LOkl8Z1yiuGRsyk8MfkiXGZLlYo/uH46cESK
	l55Wzef6TWfryYnOoaE4RsS+pVTa2MMG3nWbVBih9YsaKSW3j4axyTimqAh8lzXKxRI=
X-Gm-Gg: AY/fxX6vOPfUZgsOIqqYhd1HoAMDnPUZnl/Uai+kvLFukRAlqAfkGHdg/kd6tBe9VB7
	pultaE0VXG3d1COHV95xo87tY037Pin+AkPw8SUmiq9b9CBGzQDYV6a2/FX/PJ/jk8dTSrfiDcZ
	gMTJhGsUWi/3Nffno04zaqCstO2w3cDxUPfXRhVsrbJrantr2vFLsCjSzoLTT/2BYBB6G+gPTcz
	NQ3Sn5d1ImP0BnRy0xU+T3IZ7fj6POrmBRQaAfazptJxkY/1lPaOc15xthHJyukcCWQkvK1O+kT
	SIg0Poz6PqWKTPfxNoMbMTZ7vUPwRoaAgXCWMvP4IV1ca2OSBNaed+hI8/9iLgcn+7WYrHQkKsx
	tIbbzXrbSBVzaMN324giHoQFncPKpt7Vh1UP6fmo1QKqLZ8VLkW/jMdGbzlH2R3w4aOZ2iR/e+T
	sywB6DxSvxKEw=
X-Google-Smtp-Source: AGHT+IEx8Kxuzpauxz8j5bexuvVg4OSB4GXVnot/Oby6DYNgp6h3jjSxVX637GGChiCWB3TqaeT9eA==
X-Received: by 2002:a05:6a20:4310:b0:366:14ac:e200 with SMTP id adf61e73a8af0-376aa6fb43bmr9894669637.62.1766461990991;
        Mon, 22 Dec 2025 19:53:10 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c14747csm10427342a12.27.2025.12.22.19.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 19:53:10 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5DA8C40AF86C; Tue, 23 Dec 2025 10:53:07 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 3/3] Documentation: kernel-hacking: Convert internal links
Date: Tue, 23 Dec 2025 10:52:53 +0700
Message-ID: <20251223035254.22894-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223035254.22894-1-bagasdotme@gmail.com>
References: <20251223035254.22894-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=l8vpVY569Oyckx40UX5H0330UfQOdKlUhrq3Q1dNFf0=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlegp5dL18e+5V2kv/GmwwhbZbbviyynvf62bvXVqvcv aMRcripo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABO5NJ/hv9cDFt2bryLWyah5 sW6ZJNfFHfEo/Gi1dMIJ4556J6PtXxgZzohelu6+ErTlieerhJ9pKvZXdznvcu4t1l4q11frMvM 5GwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Convert internal cross-references in "Putting Your Stuff in the kernel"
section from inline code to internal links.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 1d120ff80f956c..ef527bdc5f8daa 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -735,7 +735,7 @@ make a neat patch, there's administrative work to be done:
 -  Usually you want a configuration option for your kernel hack. Edit
    ``Kconfig`` in the appropriate directory. The Config language is
    simple to use by cut and paste, and there's complete documentation in
-   ``Documentation/kbuild/kconfig-language.rst``.
+   Documentation/kbuild/kconfig-language.rst.
 
    In your description of the option, make sure you address both the
    expert user and the user who knows nothing about your feature.
@@ -745,7 +745,7 @@ make a neat patch, there's administrative work to be done:
 
 -  Edit the ``Makefile``: the CONFIG variables are exported here so you
    can usually just add a "obj-$(CONFIG_xxx) += xxx.o" line. The syntax
-   is documented in ``Documentation/kbuild/makefiles.rst``.
+   is documented in Documentation/kbuild/makefiles.rst.
 
 -  Put yourself in ``CREDITS`` if you consider what you've done
    noteworthy, usually beyond a single file (your name should be at the
@@ -754,7 +754,7 @@ make a neat patch, there's administrative work to be done:
    it implies a more-than-passing commitment to some part of the code.
 
 -  Finally, don't forget to read
-   ``Documentation/process/submitting-patches.rst``
+   Documentation/process/submitting-patches.rst.
 
 Kernel Cantrips
 ===============
-- 
An old man doll... just what I always wanted! - Clara

