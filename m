Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B6D2C21C4
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755031968; cv=none; b=GleLUnbH0ZRsHLjjk/t+wP582qgF6dRnSODzlkzJ/ZrFcZvyiZMKj1XqaPeqURgMFzUUKvqM+lCL/WyMw2Az2xuBL+QvBfZjuEFvT+U3haHCmwrvJjIYEJ1Juyc9gii0bS9DctEyB/jsnwvnuLXAuxkJGXCI7rbftLQM3bLi+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755031968; c=relaxed/simple;
	bh=G9IZNrwYZ61htAsy9aM1e2VQRFo2Dq9OFnY0wAam0cI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kn/46paoGWuGBDxwTIOWBg5UVL965cpKwq9rAVAu+Xc7I7Ozuhqd8qqZjoQOYHfIryx5/ddfWlP2wj92KpzgEmivgciq1efSaPFYD4nvbjpm5yHJE73ffKhHPwJ7Iiz8wlTL7leBlOuBsUFUuwv1/6DxKpjWu9dWCkznLziGYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3qaq/aL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3qaq/aL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23aeac7d77aso50865815ad.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755031966; x=1755636766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKdqkBsgb8sVcM/PyhPgyMjptZ81BESp0fKKLIlCrE8=;
        b=V3qaq/aL0x+AT0qM0GflmIhYYCTvQbAGlThQ6NxvySUrTrW/tq1bGwcHOxCXrR5yeb
         HJpXrb8H0XsPx0Qd8XuLuoI3GctaoKzxGsbLQuK3WwgdgomgtnhqNCVaEKkxPYxK8l/D
         RX0Ik014xoTyTVeIyRjAHC9AwTNxgA3ySIZ4j23V3Da3dFHILrhjZ9Zgv/gm/ucikjvS
         xT6T5/CgmXuLwtR8NxM80Os1Ltw9e69ifHJrtOAYRYINXZw2JK049QTYk7x9oL/m2zgS
         yWX0I6tahaz3VngclhriShkdv9f0+EOQY/Pgfa4k6ztsk1ta4KUfEYfDOKBqr4nTazPi
         WmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755031966; x=1755636766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKdqkBsgb8sVcM/PyhPgyMjptZ81BESp0fKKLIlCrE8=;
        b=plCLxYw3Ag0Ye7w8HMXFn5sL5H3pxNrcKVinv1Wz1dBdSA5m10PKxGdouqQ13h64+Q
         uZ3Am20NTk5hDOwen2r0u9guVv6yhPaH6itmZzQ8ABfxdevZdWzzeU174Jh0iQv/D8dG
         jCVDdyNb2xpkeho6ECzyvIRDHe/klbwtlkMgIUcrMRe9JWhqHA9yAnQXqjR4ZasQMuX+
         JQeBiMNeKPXPsNqRupRfJVR7aDrK+GaBKJG7LEzkGrdB5gpCXLolqjodgcDK/FObisqR
         hhcuuuh/CCS+A1o93TVIzV8VabBGFQrGbg4I0yJCy5VlGuK28keCikX/uskSz7vuLZuo
         Lsng==
X-Gm-Message-State: AOJu0Yyuy87WyzLGl1qellZN7FmqX8reM3KUyLSXhmP8Ru7wMup0Jucu
	gFZURsnXCd1alNfhS/FPFT4A7/vLSVkpq9Zr9xmnCEZZIKVg2r76QcwXeri32IjF6cc=
X-Gm-Gg: ASbGncuY+Ki87XoxC+0rFm1K5I+YD0Skq4qLqDtjOMnddTG1zdDExbKN0cAiXoMRyTK
	2oP5vgMbrk5BSb3THS9wOznqw6PuuCzgR+RTCiUl91mOVJrMZNB4Yw5QbwB7SNDWBBkt07fhIXB
	FzjZd78kd34V8TFMVnZSQZk09Km1nu74AvxrVxvPGazRKHFjUrA/uoUo4PVR7niwuXZbex8l3hc
	TboPZ076+G5yufqdetsuE1RWqTc9sljCKQApW25X+DIO3FxN3DZqJFS27tklOrKdOyEwKBgVXz9
	m6f6teB1gilsWR26FItbNa+j5QII2lQ56IEjlIiZRLBWiwH/yZgwY89eq92KbuejjyASGu28svu
	kxNJeysdx4mEd0Dix/mnG3gL+LNL52Ew=
X-Google-Smtp-Source: AGHT+IFgFMX1RhujMsG9we6nXKVttkMfV8WFbd5L9WXgoutdEQl5tNFIRuuQJ04bmfjMzKiUh76UjQ==
X-Received: by 2002:a17:902:f70e:b0:240:2774:8372 with SMTP id d9443c01a7336-2430d1f86c9mr8512545ad.36.1755031965598;
        Tue, 12 Aug 2025 13:52:45 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:52:45 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 5/9] docs: alienware-wmi: fixed spelling mistake in admin guide
Date: Wed, 13 Aug 2025 02:19:48 +0530
Message-Id: <20250812204952.73136-3-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- aproximate -> approximate

in `Documentation/admin-guide/laptops/alienware-wmi.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
index 27a32a8057da..e532c60db8e2 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -105,7 +105,7 @@ information.
 
 Manual fan control on the other hand, is not exposed directly by the AWCC
 interface. Instead it let's us control a fan `boost` value. This `boost` value
-has the following aproximate behavior over the fan pwm:
+has the following approximate behavior over the fan pwm:
 
 ::
 
-- 
2.34.1

