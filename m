Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06092F12D3
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 03:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766461997; cv=none; b=qUhtFzKDu62zXyeUl30Jr2SEFfctVjqFReLmAyF2ZFu+jFcsK7EKCcgBQM+8rGo65qFN3Ol4Xq3cPpD+tbVbmtv6+i0sgjAnuH4n686V8FdGKX66IjR6h6ZVMfNMOlL1LZjEL5a2afSv10ekQQFRAwMg40/2co6sqNq6EKk7C54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766461997; c=relaxed/simple;
	bh=DXtpt15ljUJvy4IcaQmZEYk//2HueWPizjkcyHOaAbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiXwbaRtM8qNttwvdDNGe+vsPg30FRsR8fCImsEnEQKej5uVNvubITCzDzL810eW8vYqE06/JPdcVZUDTf6CHJMyrqQOpC4AW9fEshyduAt/1KKMdw/SLT1GFryyytLLxYnAyS1bT6Sp3yCIeY9wn/sTzxZtdeICxvaQtZcRKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAH8EmE7; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAH8EmE7"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a0eaf55d58so33280595ad.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 19:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766461995; x=1767066795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmkLhKMIC+Za+LDTK6hTj40JcY3syto03HXeRhDIycY=;
        b=CAH8EmE7nzeg4Kt2qU3W+8/60AHEVS+IizOXkN4xaQOhAXkKTF+VoENM0HcERz1KWv
         s1MkvjbPxnu/7TFMMVtb4RvaKm+XxvEZv9W2QvJoVOUnvW/ibr6EO6PH8tJ4RHHNULKF
         tA48NgC5J7ZoKCobQ+LSr3hbfYPvfiQDAIyp1QP7Pj9gGlscfoJTYPzriC07KHMrjbpH
         b2CjVMVSGn0bwCFLzI90zB2A0QIgddWhIMeubNyx3UHSB+iB2xchDkQh6zL5cLu5F5fu
         GglZ7AdD0wzphVxKpsvFJAM1FaZ7lgWGVmWZ04LeTspci8BgyMR0wT7YcTl5VBY6zHl3
         whqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766461995; x=1767066795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YmkLhKMIC+Za+LDTK6hTj40JcY3syto03HXeRhDIycY=;
        b=EDuAK59rmlgv1Zzjty4ENFX7PK9TfJ+XtKzQYMDU77d3Oiv5DNa1348mX/sFjqWJHr
         7sP4BXea3d/15ONf+g8L6NLymGF4tNvdxT0dWor50q7CkRA09FhUHc+fTnlUG9ww40BT
         Mp4/JjCnI1xiDENqTUf/hbiaW+JR3ij/l4uc0yX/yxd/X/ZgIW9ZUZAooVddlFplFTaD
         Ei+fGctJdI/waCEZe2aMquB+bonP9QOm8c0QHaqKN5L6dHNz2zjrWhYg+HsmT+FCshV6
         //MYFnUUHeclIq/VQvrXq/dhR/VsULy/39YF0YAGekAjQDL+TPcRgwcJ3BnsjiT2akL7
         w8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtr4CU2b0gRAYOMWJKhSh6g6640a15yxc9FRhQ3e7wEi3aZBWP184DSEWS761jYA4P4B9NNQa5sT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrhaivu9kvPbQpx1zt7HxDjcPTv6BqzCven3q0X3HzQ/1gOPfc
	q4ld+BAyOsv7GniyskzcA5tUxk1qg551M1uwROyvqEbZyG7HgkfpEk9k08rOCj9mSfg=
X-Gm-Gg: AY/fxX5l4qS3OG5CiD6MiLEKPkIdhKTes9SzfM7wocuFMzzO/vuvvs792ZnuriHU+hs
	K1XqTYsABaVvX1RCvY4I+Ipd9c8y3SgzA8H6xZOjviRxVcd4uaA0Os4aSIEdkeNY8necUc0Sd4O
	zi56/KUcozFaaf/VW5GJGqYwzKaxHITF8PRC8xZgA8mdjSRq93tvqpEc4pMCBR6hWJ6udaJfOOO
	2tt502a8tjfQDXfesu4w23DJYMK1Sd3TuohUSVKS1OFXhW9LTK1J0fryDpWSpHKyTMky+R/Le3U
	TKjROw5HI5RubIw9jwVtrSXCx68ee22xwCC3DlXr+uFV2+RsyrYPiz2z9zVY30Oz4XzyeEIull3
	FXDBIrZRviU8ahvnORgx4gb9uoAH7zqHBjtS3rqivbnuR0asU9lAePiYeqAESYUWFasNNtSxdvN
	fflTHHnLC7CG4=
X-Google-Smtp-Source: AGHT+IF4DD/Tv1svdFQY+LI2jISMEoF/Q+Tq7Q2Acd7iCdDpWJrbex/o5teyZuGdTws3Me+DHNpDnA==
X-Received: by 2002:a17:903:2307:b0:29f:2734:837d with SMTP id d9443c01a7336-2a2cab74c17mr189203695ad.28.1766461994571;
        Mon, 22 Dec 2025 19:53:14 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d76ce3sm112912585ad.90.2025.12.22.19.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 19:53:13 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2811A4272A07; Tue, 23 Dec 2025 10:53:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/3] Documentation: kernel-hacking: Remove current macro annotation
Date: Tue, 23 Dec 2025 10:52:51 +0700
Message-ID: <20251223035254.22894-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223035254.22894-1-bagasdotme@gmail.com>
References: <20251223035254.22894-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=DXtpt15ljUJvy4IcaQmZEYk//2HueWPizjkcyHOaAbw=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlegp7f8nbtCHlT+uyw6QnfOzXun1NCt7cq3A5cXXvj6 8Gf3yandZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiNQsY/oenaVZKdMudCa7c kPfWorjYf86SmyGvT1syNis472WSXMzwP3rrtXt3F+SVJpQfXub7Zc/SdKUNLzbO7GJr7pAR7Dj wiQMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Remove unneeded :c:macro: annotation of current macro.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index bd5401b924427e..a5f7a1df7fb97d 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -345,8 +345,8 @@ routine.
 Before inventing your own cache of often-used objects consider using a
 slab cache in ``include/linux/slab.h``
 
-:c:macro:`current`
-------------------
+current
+-------
 
 Defined in ``include/asm/current.h``
 
-- 
An old man doll... just what I always wanted! - Clara

