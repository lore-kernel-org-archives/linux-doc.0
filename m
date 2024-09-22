Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E5E11712
	for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2024 04:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726978055; cv=none; b=Oj1HH1SUautwLqR7vrmfZ+KRtBoIZIn0kHwgSfixxeisasibdZWVOLYInzTng/22haTjFjOZcAt5Jrpfk37XHaTzJT8aDuTnQBYDZ4QD9HBYBRoOfbEyqzEo1CulqjM8gw5dNPA3Jri7zljpNCl+tVSjo/9SMAFLJQI/dar24rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726978055; c=relaxed/simple;
	bh=w5Wj5m9mDC/I3C7aKByt/Bh56UkWXtpnu1Ov7QbuECA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iSY+3CyVp4CwCZ7eVWKlFhb4NQAnW9fD5K7Hn/ivo8HZMn7Ivg2y/3b+CjbI8oZIRnoVtH0ELxlIAfVkdiJv/wyR8lVdoB1rbszNLHGNFPLxMjX8Jkbw+mdiIrlxG2n8FOFkxnx36bZWFB0iTCbEFfy84dsSBqLcF7iWXLSYa8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhf6EtFr; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhf6EtFr"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d8a4bad409so2186665a91.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Sep 2024 21:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726978053; x=1727582853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYnlCR+mJRvDB5uaSTj2gQFcHzYDHuvczZgM9uxSasc=;
        b=Jhf6EtFrgdvnfwbRZGCo81daZhJ32eSdV3crbXIgI3fxOUujYsIPz8iSvyBvNUiXPg
         g8WfoFdk2TrFLtKdReBxqL9ppNEPpNfNogUGgOTZ1f4fuQQyEcNHacTAP8xVbjJ18Cbb
         K+R5LIw91UKgDAah/waIBBG5yEKp9JP6VfOQolw8OsgkP1Vol4iVyR6c/4gWNF4T2Bcq
         dFRZrrq4EFQt39CgFWTml7ENrnUD5a6TQyCOt2BqeZXZNSgKJOe25vCEev6m/dkEiKDt
         tReXVC01dP6HdT05aOchYZK37IXCrbtwFdv2tjwYEFnmqCP0G8LkwzvyuzXYhFa6LwI3
         bQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726978053; x=1727582853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYnlCR+mJRvDB5uaSTj2gQFcHzYDHuvczZgM9uxSasc=;
        b=ZYziZJTLcrYnMfDZf8lwddNb5q0K8HCJB0BdNKLV60ElIillaQJlh4r1uhitZIEYzS
         hsbqYnOR1l8YrBOQcRMmVKnKjqHWzCE3NjUBUZc1VMLN5iqDbEzjvKFC6FT5KnRWO7di
         ChtmOr75SdotW2anHv4qOU91GgPBURu3Y3NZ0Kz6WWfAG4ZwzzG/Rm4uCHWx6t8WpSh9
         Ql/wdNXIxX6mZ8dlv/ljgpaONi5x2pJWi55WmiyPy3oTvVdCjecrf8fc0yWqoScAZAyn
         phk3Q6w2TPLRF/xi0dezjLHYvkYe9XUmFdUuwvwCzlMj9Gkyc14vHAAqx+5fVZqyVTee
         LvNQ==
X-Gm-Message-State: AOJu0YxWG9n0SCMZ0Ps+VLE4C4jyJ2CHcK2sReaiJtcxOkIssTXs6S0B
	pFfJr1vO0gZMCOZ1Cgq/Ed3WSgitaFt5GhJcLDFcnK9tsSYzqLoH
X-Google-Smtp-Source: AGHT+IGP+5nHhwp+U75e9ynhWP+eaSP9Qp7UcZqeYLe4655tjDosK+hNGt7ONOZeVXvlakVQMpBKGw==
X-Received: by 2002:a17:90b:1b45:b0:2c9:7616:dec7 with SMTP id 98e67ed59e1d1-2dd80c4cad3mr8449269a91.6.1726978052893;
        Sat, 21 Sep 2024 21:07:32 -0700 (PDT)
Received: from ubuntu-2204.. (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ef3666bsm6860822a91.45.2024.09.21.21.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 21:07:32 -0700 (PDT)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Tsugikazu Shibata <shibata@linuxfoundation.org>
Subject: [PATCH] docs/ja_JP: howto: Catch up changes in v6.11
Date: Sun, 22 Sep 2024 13:07:09 +0900
Message-Id: <20240922040709.44490-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Apply changes made in commit 413e775efaec ("Documentation: fix links
to mailing list services").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
---
 Documentation/translations/ja_JP/process/howto.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
index 872876c67896..d9ba40588e46 100644
--- a/Documentation/translations/ja_JP/process/howto.rst
+++ b/Documentation/translations/ja_JP/process/howto.rst
@@ -361,7 +361,7 @@ https://patchwork.kernel.org/ でリストされています。
 全サブシステムツリーからほぼ毎日プルされてできる特別なテスト用のリポジ
 トリが存在します-
 
-       https://git.kernel.org/?p=linux/kernel/git/next/linux-next.git
+       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
 
 このやり方によって、linux-next は次のマージ機会でどんなものがメイン
 ラインにマージされるか、おおまかな展望を提供します。
@@ -401,12 +401,12 @@ https://bugzilla.kernel.org でバグ報告を調べようとする人もいる
 は Linux kernel メーリングリストに参加しています。このリストの登録/脱
 退の方法については以下を参照してください-
 
-	http://vger.kernel.org/vger-lists.html#linux-kernel
+	https://subspace.kernel.org/subscribing.html
 
 このメーリングリストのアーカイブは web 上の多数の場所に存在します。こ
 れらのアーカイブを探すにはサーチエンジンを使いましょう。例えば-
 
-	https://lore.kernel.org/lkml/
+	https://lore.kernel.org/linux-kernel/
 
 リストに投稿する前にすでにその話題がアーカイブに存在するかどうかを検索
 することを是非やってください。多数の事がすでに詳細に渡って議論されてお
@@ -419,13 +419,13 @@ MAINTAINERS ファイルにリストがありますので参照してくださ
 多くのリストは kernel.org でホストされています。これらの情報は以下にあ
 ります -
 
-	http://vger.kernel.org/vger-lists.html
+	https://subspace.kernel.org
 
 メーリングリストを使う場合、良い行動習慣に従うようにしましょう。少し安っ
 ぽいが、以下の URL は上のリスト(や他のリスト)で会話する場合のシンプル
 なガイドラインを示しています -
 
-	http://www.albion.com/netiquette/
+	https://subspace.kernel.org/etiquette.html
 
 もし複数の人があなたのメールに返事をした場合、CC: で受ける人のリストは
 だいぶ多くなるでしょう。正当な理由がない限り、CC: リストから誰かを削除

base-commit: 052f172ef127e3b76f31e11f71e957e552cdb94d
-- 
2.34.1

