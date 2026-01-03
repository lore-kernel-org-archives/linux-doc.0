Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA8213E9C
	for <linux-doc@vger.kernel.org>; Sat,  3 Jan 2026 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767460814; cv=none; b=KFb8E2lEsOPIo1T0QhhzFEz3Y6AZhkVCvarUOjltwyIBmT4jGcbjrYBH6prNT68x9XyPBWpLU1ZSPzi28AmsuskoeTBNtK5HjHG0xjP9nKSeTXn5p3UazxODekc5dFCetSR1pfKMbfvjbJxw/KmZi154plVvJL9xFF8zU7NCjCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767460814; c=relaxed/simple;
	bh=YTeSwjdMDF9Fv4vr4WD4lMNBFqNm5a6SF2yK80Ijfxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=am7zo+CXQVQU6qreMNZhquG5d/r+KdW0mgFmQNScReqfRQHkludjWMeJZTAha25HQEx9t5iJq+Ol9/Bm9uCWUvXRBfJ3D6NfGOOTfjgViIwqDgtCZrY8kvDxPbX4qzer2P+5vQdt4TCslUaTvIoJ41763VKRyS6k+HARTpP6ij4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAvDxIGK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAvDxIGK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a110548f10so46085765ad.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Jan 2026 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767460812; x=1768065612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2wxSS/YWyznqySDQa2OVglbr+N05T+UVUoTDxOOOjE=;
        b=aAvDxIGKKDuoDUCihpF3nVubeab4mNj219psZLBwCzL9buXNVwHhcPFs0V2jcJ1fUR
         tYV7SyAobs4ecgHCK77dqTXk/PuUi5SbQuPK4pGFTWNHvtLUv6zU63tZDwjtgjwrRmdh
         iXlEjZynTSp8M0XWM3CauCKoV4G/ZJ+nvuYVyuxSJbPDSa533II2bGfpc0+WyEFM87wN
         YGzL3zDbPKdHCxPax767kJLm1GTHj3oMsANCumYT9vgdGElDnNLO60EcpSyhKZ0XAvDb
         aStrbRC+tJiY0jxB8Mp0uNPRNrQqGb/DF8fgiWP/AsUkPZR4gP5+q1w3S+gIsU6PYfkC
         lINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767460812; x=1768065612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n2wxSS/YWyznqySDQa2OVglbr+N05T+UVUoTDxOOOjE=;
        b=XkShVy4Xoqql2aBeBubnTdhjHzRMxL1ym22vMHHuH3201nMYNTkh/ozZrIZzfSu6/P
         xZR19y4oY/8Ho5wSdZI5ypDWV/1CXGft/vvhANCgi7gf4bHpbyCtoI1YZKGHpJwCXM/9
         moiQh0uTehKoZUxZ3M9nDpWWkF5kHlZYhflw0nP0PyVdgsd9RS2on+Ce4QIcgGUNR//G
         RbVDRn5ATIrfgN5dDwchAnwnzfb6kmJv1XV744rIAG8w4UMUSXJ5naDhoShkzWCYawUb
         SQRPDQ1+DNGTch2PzKyNYM5zZuah25sUay74f7ak5zxc+apjgs54gxDhd8x1vCqloLnQ
         oVQQ==
X-Gm-Message-State: AOJu0YwZ7QGKN9snD7JLOq88KXkgRgch9553mrD7zAk2Jzm2pKFlh7O4
	k8EzH000D9YwmjNHj/T880G5rhx/gc+zPyNYbUQ8UdRNyfhzk9YFC0tEc0TgEPRT
X-Gm-Gg: AY/fxX7OgJmyF2tSLePfI5nzCJ/KYvv3ZS2qx1v8W+ozl0BehErF+SQuErSJqYWqGHo
	W2YrvBX5x+44SBYpPsNyXIOkbUAi7kV2LNvWkvcXCIWZ4SFjTkWpzE0NlRqsvb554oZpLx565wT
	AM7UTrG9ChmygZwmeRob7D8cJAb3xWuU36hiSl52qFHQpU/SYvGpxqnJi0lS2KGh/VE0OAoT4js
	e5Co9lN2TykZZ5QPKYMR7/qiDsKh8+Z32f0uNAMDkJjnEfvN9a5pjETeuaoHN/1ukmTa6opuci7
	tvFgtUfR7Zcwhb0kojySRMbOroRbwwrtZhrH9KYDrv+psCEQ9OQ6BCvqXkNuUZ8rwbrHfrVgGhb
	bjTtI5PVKK1O0tGSAqvaXu6diEIOYVCodS0cQBCoGZMs66L+PK/MK75v3DqH9KatQxx7ciykeWS
	qQdDddSL+DjVZIuGTLTKk=
X-Google-Smtp-Source: AGHT+IHxZfqhR1TZJodCCfKdOOW3fsYrQbQlKVy8LhWYa9OlXMJBPLoi8/FnRxG1eVgr9DsNZ++LSg==
X-Received: by 2002:a05:6a20:4c7:b0:341:730a:ef54 with SMTP id adf61e73a8af0-376a81e2c15mr33292991637.1.1767460812149;
        Sat, 03 Jan 2026 09:20:12 -0800 (PST)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c62637bsm38318087a12.30.2026.01.03.09.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 09:20:11 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Sun, 04 Jan 2026 02:19:38 +0900
Subject: [PATCH 1/2] docs/ja_JP: fix typos and duplicated phrases in kernel
 development guide
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260104-ja-howto-v1-1-53e5564a47d9@gmail.com>
References: <20260104-ja-howto-v1-0-53e5564a47d9@gmail.com>
In-Reply-To: <20260104-ja-howto-v1-0-53e5564a47d9@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.2

Fix obvious typos and duplicated phrases in the Japanese translation.

No change in meaning intended.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/translations/ja_JP/process/howto.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
index 5e307f90982ca39576c40b008a80697559e40b45..a47d7679364aa3da57b9802807a3571ca23b7122 100644
--- a/Documentation/translations/ja_JP/process/howto.rst
+++ b/Documentation/translations/ja_JP/process/howto.rst
@@ -61,7 +61,7 @@ info ページ( info gcc )を見てください。
 発手順について高度な標準を持つ、多様な人の集まりです。地理的に分散した
 大規模なチームに対してもっともうまくいくとわかったことをベースにしなが
 ら、これらの標準は長い時間をかけて築かれてきました。これらはきちんと文
-書化されていますから、事前にこれらの標準について事前にできるだけたくさ
+書化されていますから、これらの標準について事前にできるだけたくさ
 ん学んでください。また皆があなたやあなたの会社のやり方に合わせてくれる
 と思わないでください。
 
@@ -363,7 +363,7 @@ linux-next の実行テストを行う冒険好きなテスターは大いに歓
 
 あなたのハッキングのスキルを訓練する最高の方法のひとつに、他人がレポー
 トしたバグを修正することがあります。あなたがカーネルをより安定化させる
-こに寄与するということだけでなく、あなたは 現実の問題を修正することを
+ことに寄与するということだけでなく、あなたは 現実の問題を修正することを
 学び、自分のスキルも強化でき、また他の開発者があなたの存在に気がつきま
 す。バグを修正することは、多くの開発者の中から自分が功績をあげる最善の
 道です、なぜなら多くの人は他人のバグの修正に時間を浪費することを好まな

-- 
2.52.0

