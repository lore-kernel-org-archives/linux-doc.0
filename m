Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B124925634
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714640194; cv=none; b=oHtiIzZSiXhY1URoifjbzG0hOqYOywms+ARa9dvCFjaPqcAlFicpCD5pcgvWXMkVI/8V4Ed+z/pQtGkFvMyoarD3PVBPC8UWrBlLb36R+d48wG70l87YfCq2JfPsQhL+R2rri/5U/X9xh2HCmz9ky5WtKl9Ld2lxPKC7Zz0XWDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714640194; c=relaxed/simple;
	bh=zD3WaKTHjXe0bH8np/EcN5qqqBT5QJbYWCraLu28ZwI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=gFcbm85bhqQmow20A9b8cWjuaDl199+Yg5y356EPn4/x7ncb2/F0/10IUhRKWOeduIu3XKGWSD2A4V9yAaWKS/rkB5c9L/OvIx1ACNgPHlvoN2+JGNdCF1/fAj488DU8eE0k/Aw6r8ww0yQc8XKdWDfU0P/Rlrnhm9B0uVFlh8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMTuNoOo; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMTuNoOo"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f3e3d789cdso5383475b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714640192; x=1715244992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3IELLIHnkUSE4jwgHMFWFUu4eQyZ/eHebcDgpCbtVww=;
        b=MMTuNoOo/A6b3RbwZxm1Q2HdWK8V5+NciKtyIT1Ad/coREySadecA+7RSuqRzDXFPU
         Qgq/VLkcJXozu4EXGOwPfGmJMpy1B6lHmSz2o7oQR/KfM8d+K4xGC/2pn6jExXIQ5acw
         LvqwphYZnrrUDKTZ/Rbm0qKTE1a2MkQLe3p+xZ38mhB7dZlYcy2JulWxuZaFAB1psT/5
         bY0v3KmxKsvXIRG9CmN88yPUgp/6EiIskIZCUZqgC0qkHsObFHh6tvS1dYQ9GGZdR4Qi
         kcJejuuma2+MtHXB3d2jkYJdZ7S2DL08bz8MYvy6lkrpgWqHSbm9rGN3Z2X7atnBgRcm
         tFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714640192; x=1715244992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IELLIHnkUSE4jwgHMFWFUu4eQyZ/eHebcDgpCbtVww=;
        b=o+SOyVWZ5a+zCw5e0VIeCrRfdCPLiuaQ6HWJFy2ppAyhXKxsjquoNfEk5cxc9pFwnB
         cjH1cXEHvsnC4s8dAzJtOL5613A8aP62O1StJMTwh6TK6uWFZv8mebBeR59doxVHdtb7
         3e2CNo8bD4WswEQEdbm1/GxYg5wBP5B4pKVAJ7QlxcoYw8MsTeznlqTlfY7oj1HTizbo
         V2bxBA7wiVXkDOhJuiCSDx/XzXjcTvDe4yzXSe/MQZYw8TqL59J090xJbLB6zlVhrgit
         21jCJHdEtiZ/zgW59wqcUgj+odI+RCUtAr1gpJalN4iQtBOa2jqNtJugMnfKc66Z2WsV
         CcoQ==
X-Gm-Message-State: AOJu0YwEyAN5mw44nR6MqaYDVEq/lRmJgpZz2Tsy2cAPz5E0lo9Xn5Ro
	KPCe7IhekGkHtmvqVyOuX5LxZ8S1Zh4NorwA8hE/4IT+/DlQguU3eHbajQ==
X-Google-Smtp-Source: AGHT+IEkhzhyzDqiEqXRBCPo+qpI03fah7J7e6kOKyAtrltUxtYjtJNTQKaZFex4SUmbcfH2ATQHwg==
X-Received: by 2002:a05:6a21:9203:b0:1ae:42f1:7e52 with SMTP id tl3-20020a056a21920300b001ae42f17e52mr1807687pzb.6.1714640191913;
        Thu, 02 May 2024 01:56:31 -0700 (PDT)
Received: from ubuntu-2204.. (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id m7-20020a655307000000b006136c5fc458sm615526pgq.69.2024.05.02.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 01:56:31 -0700 (PDT)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Tsugikazu Shibata <shibata@linuxfoundation.org>
Subject: [PATCH] docs: ja_JP/howto: Catch up update in v6.8
Date: Thu,  2 May 2024 17:56:10 +0900
Message-Id: <20240502085610.111739-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Catch up the update made in commit e49ad8530de9 ("CREDITS, MAINTAINERS,
docs/process/howto: Update man-pages' maintainer").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
---
 Documentation/translations/ja_JP/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
index 8d856ebe873c..872876c67896 100644
--- a/Documentation/translations/ja_JP/process/howto.rst
+++ b/Documentation/translations/ja_JP/process/howto.rst
@@ -110,7 +110,7 @@ Linux カーネルソースツリーは幅広い範囲のドキュメントを
 新しいドキュメントファイルも追加することを勧めます。
 カーネルの変更が、カーネルがユーザ空間に公開しているインターフェイスの
 変更を引き起こす場合、その変更を説明するマニュアルページのパッチや情報
-をマニュアルページのメンテナ mtk.manpages@gmail.com に送り、CC を
+をマニュアルページのメンテナ alx@kernel.org に送り、CC を
 linux-api@vger.kernel.org に送ることを勧めます。
 
 以下はカーネルソースツリーに含まれている読んでおくべきファイルの一覧で

base-commit: fcb5bcefdbfbd939bf4edfa71182df0b56d20a49
-- 
2.34.1

