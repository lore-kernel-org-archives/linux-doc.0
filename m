Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30A828CF6F
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877783; cv=none; b=XcOymrnY9ynZpTr33yasGDDuUcJIswWGE2xTDKn0EgeWBpSIclCgOIuAsY+Nb5JRMYcE/NXOgZszK4wBff3gJsbYK6fwn4iamEbUJf4eaERNQIC4tySnH2zMyJiicPC7KhcDFflbuKZHllfj8uuiBHqzlEx8/dpNLr5eyQXLeOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877783; c=relaxed/simple;
	bh=UTMK3ZhM9IkfZJUouvYZ6IjbHuKYy2aYEOKvdsJXar0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GeafqQ4VevCOxudPsAb1RCAfmtZaeESdIAbaAtjd19a4R64oXcXkbsW3AUmBiQxvGiwgdZGTB3+ckfWKuEe/aD8JkRHZrbNYpYtci6EUahWHiRcEotM6z6hbZs7wzKQrXCfIjRAPpzdaiu0sMjc0/rnN0M6C+PxKEGXjnengkCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyxjFrHA; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyxjFrHA"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c88d1d4543fso1269872a12.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781877781; x=1782482581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vp5Iv8ybi+OJb9OYUbOqMvBNTKfc5oo9osYd85fa63Q=;
        b=LyxjFrHAxXm0Lf0t52rblTw3uS4pp4ETBzgOJJMUt/EttDkvWIitlBB71hPzJePBMK
         BJIaXpbSaq4EOW51HkOaXwmgDikLkwBP4z8oMJJeDRIy5QfA1A/n+Y94LIkxOXGAez7y
         wBndV51e76PcYbqplYbJ7lzZ4uFooxGvWx7eF0BqfBB1CuvuXkCzhvSd5LIbkGO0jLYU
         807n35gAPnLGta0bj3aSaORZV6lwCz/bYuap/0LEocVUqI5mBxQfV9Ymjt96dNRNVjH9
         PQ2f35W3Qul88uJVBXpQZLKA6okfSaGtrVOK2iSLCGc5kyEw9ARdYaC4RjNmiy4ljMxI
         DVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877781; x=1782482581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vp5Iv8ybi+OJb9OYUbOqMvBNTKfc5oo9osYd85fa63Q=;
        b=VoKp9y9NdAY/z5y5epizwRwDX9vFt+5E9dceiP+rUmfs1OcW9goDZmrNBJ8oYqlndX
         PnKMOvQq70XYbJaHGbloXRnD+wbtG8s2t2v3QZXNtKG9+hdL3MJvnRpkLm/q+1smXZx5
         BcBhqN44xkqIUvS5NL93s3BAmRKfHrKslbnvPq4jgOvBw1kHbsvoXGQJSwaKRarHjfyz
         p2diH69S+3VHINm/2xKns/K3MsNygL9TiDpY8Q2sum9zXD9ms1okNwJaaMEHfosRH0pw
         dWxIks087vI5oRrDxWVcGEZcN7UZxIBHBr3SDCC+2E/CF9c5oXhbTS2CI3X5C1JcBpvq
         Hh2w==
X-Forwarded-Encrypted: i=1; AFNElJ80QlFuVZWhPpAmfrKroovrRDxLu5RgClG+RCTVmo7u/0oRS1jJobX5ZzFdwTQRprjS87C5pIpdVuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIYJWL9ywXrjjp8WvydKQTU6eZHksnIbToADf+lTi1YC7OkL92
	dhsKtyiPQvLtqQdVu+plyeNooL5yl4Vli+W+4DidyCzMND+FM0B/qIQ2
X-Gm-Gg: AfdE7cm2HS6tGtJzFqVah75dI3lDZpJdCEY8uFXuro4a4yUXtQZPVqwJhw70jji6nfh
	lN/x8G5stvtDGfyNQwupvoQFO+ZxA919/AtLvYCrsXiKT6oy8iOqNrOv/7c0oRbUu2EBGGrBNgk
	VdiHsp/tngQuxlOv49Z30OxrdUkUSi4cmb/lxyQRJFXF4x3/FVxfr+8GXtwEo/jz3uuT40w0nPD
	K43Pzx7NInS2i6pEpQ6/qpMFAlWIR3IVI4AI3RPY7EOadensBXc/pr3LCCC6nJ6sHgierygFKp+
	IZ8X0yQq+JPiUwysY+QwrLDVqhVawRXi1cC3UUMxdwZCytJMg8GULZj7muibWXZKQW/xdBwmMpn
	repwbX47ddE1ip0zml0uevY6U32cyl024qS3a+Mmwrg3lanvViBIsXohsC+PSZafVGcBkZcU2tq
	v+tVraE2lJaz+OeNyRDA==
X-Received: by 2002:a17:903:2ac3:b0:2c6:b429:f100 with SMTP id d9443c01a7336-2c7195c4e8bmr33436275ad.15.1781877781044;
        Fri, 19 Jun 2026 07:03:01 -0700 (PDT)
Received: from archlinux ([2409:8a4c:cc1:3c11:741b:44f:bd4b:7c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c229cbsm24795845ad.79.2026.06.19.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:03:00 -0700 (PDT)
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: [PATCH 0/3] docs/zh_CN: update translation of doc-guide/sphinx.rst
Date: Fri, 19 Jun 2026 22:02:38 +0800
Message-ID: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is my first time sending patches to the Linux community. I have
been reading the kernel documentation to learn more about Linux, and in
the process I found a few places where I could help improve the zh_CN
translations. Comments and suggestions are welcome.

This series contains three patches, all intended to update the zh_CN
translation of doc-guide/sphinx.rst. That translation appears to have
been out of date for several years. While updating it, I noticed that
sphinx.rst refers to process/changes.rst, which did not yet have a zh_CN
translation, so I added one. During that work, I also noticed that
changes.rst refers to llvm.rst, so I added the missing anchor in the
zh_CN translation of llvm.rst.

Jiandong Qiu (3):
  docs/zh_CN: add llvm.rst translation anchor
  docs/zh_CN: add process/changes.rst translation
  docs/zh_CN: update sphinx.rst translation

 .../translations/zh_CN/doc-guide/sphinx.rst   | 165 ++++--
 .../translations/zh_CN/kbuild/llvm.rst        |   2 +
 .../translations/zh_CN/process/changes.rst    | 530 ++++++++++++++++++
 3 files changed, 665 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/changes.rst

-- 
Jiandong Qiu <qiujiandong1998@gmail.com>
