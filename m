Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D73B28D
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873230; cv=none; b=RFdloXXvRLYI7XVexu7uMXfDI5mJMY3iDMNH/qvhlebcwUkMbvxSh5rpKJQ49Wx66qC+Cy3H13AEo0WUakpIdRm4d5nwAM6xlwk3k2UeEjOpfBMwjKKaRz7dwviJJ5ytMSrEBl4ohBeP/MY7X9QO1L+e7RcWIOU5KXmy57I4yRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873230; c=relaxed/simple;
	bh=nkSGKxkXQSgZW/tVB/+ws37NMdsVyeuYk43hgq9gANM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kWu/7UZIpg4BH4NjlWusfqaDUgTtSLfLRW59iYltORA3DBht4xp/AAXgBYItTcG9EEpkUEKhuegOM1oA56sKB5NZrX0iRyXd2m7Bu+kLuHFh17kRoCbk7s5du7DErb50PzssJZym9VPtRkPLb52nL7My3MohWiAT/6b/0a/+eRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlOLxAwI; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlOLxAwI"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-950c26b6b05so186447241.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773873228; x=1774478028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GdkyodoZmDFICxGX88mtAbSwDBRJCn9otY2R6mSHbk8=;
        b=HlOLxAwIMcsXMINv6cGlpcNOKEIFwXC1VQUIFZmzMOyVWds/YNXzEFNinMbAax4aAR
         7qG4ANb/6QS9Urb9/HdW1hOp98RYKCqV/opaPU+04WO6h+cBwHoP5a1zrFVApZKvR6RL
         //jQGk3HBs8xWcXIwPgDxl25gF2+OfqTpgWdVePewbHlknUOl/RclfqSjGgvyZrfE81t
         sAq2F440IqH8YZO92Kx3WcIGd1LvqqoKHi7UstnVGUa266+eJZihfFRUHuSWTJSdxpwp
         9+8xgGx0w8gwVql/ACekJ0Vk6M46D7CoCS5FTYqWJggaVe0jCx3wJtZs0f4h8JWOdFd8
         1/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873228; x=1774478028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdkyodoZmDFICxGX88mtAbSwDBRJCn9otY2R6mSHbk8=;
        b=C8tW8iL+1wqVfk2I+XfRc6xbO8sqbeno11SDOHlAkh2x8tGnYj+UYZE4+RIznC3QXJ
         h9PSrEdDTwSh7ykBdQJbbzRXS8js5GQ/LdiaxIMfbRS1gsfFz1xK4m4cWAUuohHY6Y8W
         ML44RvMH8JfJy79IyELLtKrEJWSEbWeS63x/foYmWs/rRCns4DkV+oaFnIs/f4Tp7eOf
         ynoK13g981jA5zY5vQl7YW9SxofWJDOtlwy6SMBj01yrV6/1j1ayCUsD/Y9/GKBqpivF
         Lx4SyqDiZtmvhOSP4XeGVg8YfbJqv0jzSSFYKtyOubw1Pkp9AAr260ZmKbeKStoWDOfp
         4o8Q==
X-Gm-Message-State: AOJu0YxloRw1kutqZn+b5A7UIcnWXzqzmJtU/H/sbhYczJtVkq8LIy2Z
	AvlwR3AQSdQSbW4SXtHDd7vZkHdv69WEOhZxbGxhUDd/kbB0qUaq6I/Z
X-Gm-Gg: ATEYQzwqMidaTWcv0Bn0eRfUlH9d9EsuHDckL2tihljm1K8vA5rToeT3DGl3FkKT2wX
	JlTtYdzGvYQICcovvm3B2ouTQMveApJYWIGX4Ym8vRv2J8Jjh47+aGjo/lK5QlXyM1e22u4mvU5
	JeFtKaTzaK3gJFIGxIbbmsWTZuOqUfyjPZn8PPBwXfb9zrugrzlZ7YupzajnqXfGiD8566OYxFy
	bBnm7cKa/1lLT28OJF/MCrQq3K9lOXBBrcHls6oW50n/U7JvOQqf08vs8w16ktAMa5AzsR+rpAf
	yaBnPKt/LybVnIRrFqp1s7Qq51+CwS2n9otVrk3ziIlvemVawFhBibgIvMPpP+cgWEFHScN6V/c
	BYILIXvhYbnYFJaML3osOcBoNXbFjXe/EAer1FjvCVT6mFDm5tWaLbUwAd76E9EavmCnfC89yLs
	aKlxDyJYzAsmxn148LmRb7xJCAAkqaCWEfbVthHGRaHISiGjseEtPSrUz9zcAYsGPO1GqbN5IU9
	2QgwA==
X-Received: by 2002:a05:6102:3913:b0:602:90b8:9840 with SMTP id ada2fe7eead31-60295f9d591mr612668137.18.1773873227803;
        Wed, 18 Mar 2026 15:33:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951032d062esm2044071241.7.2026.03.18.15.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:33:47 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 0/2] docs/pt_BR: Add SoC maintainer translations
Date: Wed, 18 Mar 2026 19:33:21 -0300
Message-ID: <20260318223325.386762-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the Portuguese (pt_BR) translation for the SoC 
maintainer documentation files: maintainer-soc.rst and 
maintainer-soc-clean-dts.rst.

The goal of these translations is to improve accessibility for the 
Brazilian Portuguese-speaking community and to continue the ongoing 
effort of localizing the Linux kernel process documentation.

Daniel Pereira (2):
  docs/pt_BR: translation of maintainer-soc.rst
  docs/pt_BR: translation of maintainer-soc-clean-dts.rst

 Documentation/translations/pt_BR/index.rst    |   2 +
 .../pt_BR/process/maintainer-handbooks.rst    |   3 +-
 .../process/maintainer-soc-clean-dts.rst      |  28 +++
 .../pt_BR/process/maintainer-soc.rst          | 222 ++++++++++++++++++
 4 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-soc-clean-dts.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-soc.rst

-- 
2.43.0
