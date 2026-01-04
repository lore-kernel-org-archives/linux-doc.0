Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A816288C30
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767527953; cv=none; b=LP30nUA9MhvRXP6lzLQWhTzEX9ZzaD0KPG1s8OoiGOH9EkGqK5IxvArxzF2UMYNf7BRbU7NQN7G2K/Tx5MjIRL7HVumUPGLtrFu436FKN7vp1P0jV5DfPhlrRDI8iIEZ2OOC4ARfI5ffI4P+3xLq273m4NHrmnzSq05g551lDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767527953; c=relaxed/simple;
	bh=sZlUU8XZMi16KXC6RXSZEJR8JaD6HMfRP1CvyHziHtk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c/rTvmMR60aYnLYKMd1gCdxe5TtEV2vsZAkgMJ62CKvOhvllyYaogreg/bH02EdMoGuy/bldJHIKwTaiVksr1oJVQnUBHtlAB7tXUdbey9MhlMffBdvQBMWCUDGMp0bRrqroZmAbOf/t1PaU/EJ3Nb3UYxgGXpbeiDEqO+Rjjlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9IvzBgJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9IvzBgJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f08b909aeso33415885ad.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 03:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767527952; x=1768132752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zP3YSDQhOjoevSelxOIkt+zedJcy9IPGLvYvbmycIbM=;
        b=g9IvzBgJJI+iP/C64pOvGZWVBSM60Er2KnGSeZGP36Cg86QYAlu0EU7uVo3Cs9bKUh
         9WpGnSKhPC60aWbaR42Co6FvDcPCsGFTtdRKQq9ZaeGRx7rQizxQiFIlovXlkaPCMWtr
         cX0AUitK5ePKGhBxqOn7XF+QV8gUtUZ5DRRAiwnIIqupKU2jf6lqO/4ptCOGjO7uL02j
         ywdzIPA7ZOnEYawA/2jiTVBF021/ACfFeKN88jo4fAMx5u42JIxv63GjLlMz/dIk35r9
         2G4dryitCnyQogA6ukK8JiG7vqtyEdPs8bJGYoeTYHjGpttLr0llRQE96TZqG+JsIT0k
         djuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767527952; x=1768132752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP3YSDQhOjoevSelxOIkt+zedJcy9IPGLvYvbmycIbM=;
        b=GXZHqDnLXuFzq5oHCsooww0xuj8fYgwb1odubv1ev1YQoDE6ImiwQ5kOx3NnPlTpso
         r8aCwK9eoockXHSbPs/Rq0or+HBTW2lBXxcplAVg5ljC9yXDoiK6//CIMgHdY6cn+MVZ
         CY2b6+5AVSYNxe8l8GZUjNcB3YNq1Wb4p1k/vVSi5mDCc9M1BVChHz544M6CwINQ4ing
         YOG1qAqMMv/OL7xBQJulKs+kanQYhGOkm2aGO4nyqe3dJyZV4Gy0NYgvGovmdpejipxq
         qrcPXrxgzpMYSKC8jLHnN0py9ZUN9Syz1VEIFWCPyBAAsIxqFwSW06xDzjahRSwk4fJE
         bd+A==
X-Gm-Message-State: AOJu0YxyxsCSoh8i0psvxKwz/BDDD6vLsR/oUhgm5dheHeG+UupMPjrN
	aw77mwuBmU4MTabt5oGJJv3whICHqpjCoKjM6kif5ReqePJMcEtP6GOGmaOMLlri
X-Gm-Gg: AY/fxX6iVpXbCre2zOVlomQVmxbUS8pnO05sN15Uzz2zVqG5Qv5DNAL3fo9DHZEtY5t
	V0E9mH9LYSUA1uKVWy2oey+Qni14AfbDL0q0RYWXbrnRP4gaOjbw2gRl9UZoBlvLzlyFsubBd9U
	bHFGF1mAjpS0lo0tIcVsyGRc1waq11ceC7P0kvvCyFEd+P4DsP2ddBcsGRXXBKto3Ve475C7M7X
	Toph0f/KFKewiCYkGuKbxx9NfXCgsPHXm8fuJu87a7UtW/IUPnnSBQzd5RZYv8WW8rBgDFIXmxF
	s2Khe2IAi6LP5Y08hmFCTT2BXiYbDJaGh1dS4ZTZ8Yf+yn4KCLXl/JrU3c4wu69nGXYRo056Zv0
	WktYjH/C/6xZwNFak5mdH9lkf6wZxgHWIlIMBOmE5Gl8g/ClbB4B7L7GzuTB2kgUquRWosZNye4
	l7HZKZuCMW7F9I9WHrM5g=
X-Google-Smtp-Source: AGHT+IHRDJEjbjAOOvhYNNO6lV/PbqmjFP3dGSFantQoj/zZSbS39RobxXqR2G6mJOxVb4wpDEIVqg==
X-Received: by 2002:a17:90b:374e:b0:34f:4416:33b5 with SMTP id 98e67ed59e1d1-34f441633f3mr2428231a91.8.1767527951580;
        Sun, 04 Jan 2026 03:59:11 -0800 (PST)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f47709616sm3621148a91.11.2026.01.04.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:59:11 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
Subject: [PATCH v2 0/2] docs/ja_JP: fixes in howto.rst translation
Date: Sun, 04 Jan 2026 20:58:39 +0900
Message-Id: <20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQ7CIBCF4as0sxYDCK268h6mC4RpGWOLgQY1D
 XcXu3b5v7x8KySMhAnOzQoRMyUKcw25a8B6M4/IyNUGyWXLBVfsbpgPryUwPuBNu+6ojJVQ78+
 IA7036trX9pSWED+bnMVv/YNkwTjTB9S6VUZ17nQZJ0OPvQ0T9KWULytGAWmgAAAA
X-Change-ID: 20260104-ja-howto-0feb5d784ac2
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.2

This series contains two small fixes to the Japanese translation of
Documentation/translations/ja_JP/process/howto.rst ("HOWTO do Linux kernel
development").

Patch 1/2 fixes obvious typos and duplicated phrases.
Patch 2/2 fixes the translation of "freestanding C environment", which
previously implied that the kernel is independent of the C language.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
Changes in v2:
- Adopt 「自立した C 環境」 for "freestanding C environment".
- Link to v1: https://lore.kernel.org/r/20260104-ja-howto-v1-0-53e5564a47d9@gmail.com

---
Masaharu Noguchi (2):
      docs/ja_JP: fix typos and duplicated phrases in kernel development guide
      docs/ja_JP: fix translation of freestanding C environment

 Documentation/translations/ja_JP/process/howto.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
change-id: 20260104-ja-howto-0feb5d784ac2

Best regards,
-- 
Masaharu Noguchi <nogunix@gmail.com>

