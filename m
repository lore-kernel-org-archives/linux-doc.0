Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0442F690E
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651052; cv=none; b=pq2nxBESsmW5z4GetZ4e96u31SxP9IB8IYcr8DrDq1JHxiTqaBqcGNIaLLX2MuyhGddJZGAoFK5vIi6n9qRGUxkpRoWKZ5gCGoOwKTmQLU4ZSjrulTIb4CeCJMrVr1wzEJxGVcBJlT+5Y6W//skdg/xkfUT2SnMor0MVyT5IjxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651052; c=relaxed/simple;
	bh=b6BI20BMK2IEOBYOvcYQ38lXIvPRhStadOPbX2TI+Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/cLWrhsF5ZzYgFRyNA4ygB9oiviqqneId6uLcETkQX5eba3bm0wEt/3zBbwBWc05DSe1q2Md9GuTBBqKIIFX7hcuIWZc5k77z8UeM0vBrgnnqPYKdSvDtCxnkkU72RT7JcVNA4NNBc+uYefljeOuaCv/lSeLaUFfngI4ImxvbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2pOu2Ag; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2pOu2Ag"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b99c2a5208so47303b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 07:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763651043; x=1764255843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkPK0VHC/yXCC9PuyhpwMb7qXelw5gbsqi7xSTGSMsc=;
        b=f2pOu2Ag7UGBBK52Vt2bYjPt+DBUshmYZcAxQQBhRQdO/YKbMf00Ftad59sz0gDJsm
         z+3lV21J3VpsSJoAnLVR+qJQcFk+4aYb54L5ivp26vYIPlCuEU6ZYcjnAmoI5hsXg2Cs
         fjeZqKO7KBpKUZo1JC/+EQU3anC7Vxo4rvRa7vdsXFyB+APhJYeIDFVBJlKR7naAj/F5
         wyLlAnyUxFEfYHkJ40Jx5y3J+5Z4qW9i6ldlvbEQLc3AFMdZimjPZj1aAs6HN8FoVWGG
         ZHhNf2/lY8ncARMjVdNF6/1yTEQ0guQAM2IprWMUXXPw1e8vedKeF7ulW8eqVJrz1o3p
         4cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651043; x=1764255843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkPK0VHC/yXCC9PuyhpwMb7qXelw5gbsqi7xSTGSMsc=;
        b=UndUc978cIfpanXsV/C3Ahs1PFdcRd3Spui/jPmeKQddUIVkdVHbtd33iKZNay6obr
         +X6wUT9lkEnT+gayTNpvvoLHal9vQl/qQMffspNzy6/2xcDxJ9Gx5IxtPHHFgSHbblre
         SWKy/RSxe/t+CBs8qCFK/Ynudtg04dqySY/smjC+GjjHBy5B09OxzgPS9KY7fhzIKQYC
         4ZiRbg5Zc/A6jKj/L4P/iKjD6Eg2ZXaf0CRt+mFgS30WjYk1CeZCwdbEZkQIqlw2HwpH
         Sm9WDpFLJG0wbJTjjWgB/TXJdDzq+HkO98XCUYeR0sgIsToC4RJKiId9JwT7VoBmmXzn
         WENA==
X-Gm-Message-State: AOJu0YyUbQr/yMzNE13UCm/ADeYkmlwCbGKyk8f5ijRIXdEcU+0VNRXZ
	aX4TqNAq8rUzI5p7Kcqks5NftHLK39ZqzNe1bD2PJLyLpQCh9VL8/k5XlnfhbyiXzsw=
X-Gm-Gg: ASbGncvG6wVCprp7Rs42TQ9LoP58tMvs0PB1Kk44O14Aaz2AdBFZk9enQ57PSemWfKH
	2zIpc/a8iZib5pNiJSroZdf5RQz4z+8SkVYlnZd9n/zcjLYlVsRdsGY38ttuED4uFU5+WjOYwkD
	6A8fGwUroOifScYs4bCq1dZLfozld3/bf4ylp7/WRkjcTwGut8JVLtzlXHxWdN9WNpWze5fsZ2Z
	HJoqQmgWt1hZcMEYgpBbbzV86S3Y+mcw9/tUJozEonmjXaUakqXmam3VRIQX/JRcgd2SzGw/HSx
	NjFinf5TPgTfI1SPvxT/JHi4CAvv4QW1T7hnEqOwK6e8utI06xOMSNFDSn19LukWKEGQTIemNTK
	T+oj6cEH2SY3bKrO0/4yF/DF35USScSlHkBqN5FGSYTvqxIRnTM4uHNyCMU0HlA5R+oNnzFNKaS
	S/yWhLkW9Ot1xiz1l/pJbHd8VuhZWZPbbrlJbrw2zB5NWwRHLLkvbgY8eY
X-Google-Smtp-Source: AGHT+IHtGWy1UHSsSAeGIGqMEXLtnkw9aP3io3ks6Of0nJVkQmTZZKgcpRxnebBqgo5n06Dlf/qygg==
X-Received: by 2002:a17:90b:4c42:b0:341:88c1:6a89 with SMTP id 98e67ed59e1d1-34727bced78mr2325590a91.2.1763651043007;
        Thu, 20 Nov 2025 07:04:03 -0800 (PST)
Received: from duke.home (111-242-117-115.dynamic-ip.hinet.net. [111.242.117.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472694f137sm2819259a91.17.2025.11.20.07.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:04:02 -0800 (PST)
From: Chu Wei Chang <chuweichang0319@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-doc@vger.kernel.org,
	Chu Wei Chang <chuweichang0319@gmail.com>
Subject: [PATCH] lib/rbtree: add missing space after 'if'
Date: Thu, 20 Nov 2025 23:03:20 +0800
Message-ID: <20251120150320.16712-1-chuweichang0319@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a minor coding style issue by adding a space after the
'if'.

Signed-off-by: Chu Wei Chang <chuweichang0319@gmail.com>
---
 lib/rbtree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rbtree.c b/lib/rbtree.c
index 5114eda63..ee06cc09a 100644
--- a/lib/rbtree.c
+++ b/lib/rbtree.c
@@ -107,7 +107,7 @@ __rb_insert(struct rb_node *node, struct rb_root *root,
 		 * per 4), we don't want a red root or two
 		 * consecutive red nodes.
 		 */
-		if(rb_is_black(parent))
+		if (rb_is_black(parent))
 			break;
 
 		gparent = rb_red_parent(parent);
-- 
2.43.0

