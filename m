Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE1344DA1
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789366; cv=none; b=JKrGBnwcf/flrnRvWxXudao/KImu3KeVGR6ri9f6ith6USzlaElUSYyldwYUBqWn+YEgf82XOZTq0D5yKayeLEjZNtpvPIkzd31CfP45iFNqOpyBYJUoaeucB8ssod3Ho3tnAY0ROSu4CSziUjpfyJh2loBkzWpuLhPN+KgDnoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789366; c=relaxed/simple;
	bh=y2lw/Q3lvb7J4K0Jt3G5Y2uLnwQlHXz4jZdAft2h0nI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=trqbrifkNCEEb+agxRKYLRnR3DLlhPw63Qgpeoadl6pOOw7U0dSePXFGum2hL026PAiy2SmfrVgAdQVIfJGFmWQu+G9PHRlDXwgRcqXqXt9DOZwPrWiTnK2CAWUeKtwu/KqvmbLEDz7BOPEV9ofeC+d3cGkbwn1hCoZ0zrO/qcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtRVosSf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtRVosSf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6611f41eebcso2972328a12.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 01:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772789363; x=1773394163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ODTnxXdC8dJfVMMnO8L2V2ZpKV53Q2IrgocU2xbWhg=;
        b=RtRVosSfBr5aTQqQ7Wohj5C0fG+JgeAWldRsqD82g6TGCNcfSvj5EpcZVZVLCS2+XW
         RxFilylK0kKnG9GQK0idEMy50Ro63k48IAu4r4zgKhMdML+FlfiTQazh0q+1JLHMUqMW
         DfxUfI4G6zuqdRmZ2U+ovLW+iOuhn4vlViVnJVDy9PjS4B38T7aiK3iVVizbY4o2+RnV
         WowzZUuwxIjXERP76cFOYppqVP4DrXfIXAbIu7WXovlCybfsAUHy/yyfh7KRBhVMOB8g
         9qt2rIME9tN6RzUBzGtHlU3v0OGh/oJHZOQ5w60QBi10iAvFD9rTYuoHA0WbrZcIkUf9
         wYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772789363; x=1773394163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ODTnxXdC8dJfVMMnO8L2V2ZpKV53Q2IrgocU2xbWhg=;
        b=eVYkFEDq54YTAE7V8x6AinxVuNWpce1fetnzC9HC5vZV35MuGig5rHksomlgbqqZfn
         MCQBQA9YnucMec2HDr3P56UBBriPaaYF/+waLMIjcejuJqbCclnJjTgoeSMULCYhBmPm
         /+ywe6oL25AHU4q+kWSxDvHRNNSS4T4Vc2jHclC498aU09RyCFNhZ3FgtQvIR1dS2NbI
         BqK2HcN/8WLUyNDq4yZkj81VECxZGvT8eSbjncIKXf8tdqVt8TIqTqH4DWpOcXEhk51l
         qAgKF+cX1QyPUWR/75MTTPpNPnNrP2N/aoTbX7iv6y5kZtH3x1mXdKXnL4JcZYa0tuKL
         sMYA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/OafxhqI1uH6SOqodLYWbiNp+vQ8Hay05zBTSnQC4puIg1igCo3cTjzmOU86O3TAe3n+JUopfC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEY8BBxp8kfL6c5aVzlj9Fr2bF5bAhDNQBRy18SDA8zDyLZbJV
	WFpLyFgYyuihy0YFOsTNfpqNyCz52KIbYbq/tOY09dLW5VBvpQk6V8b6
X-Gm-Gg: ATEYQzxm0fHxcuwFZudIO2HRJNDUpE7raVWMJpiGsJlOeFcXqYFolTQgG8lFnMo0SdW
	A51MblA32+BkNxQ3am28xvLJyKj2zjQDLnc6iWpd+F9UO1uir8lfq248mz047QkP5sQ3f9hslvr
	qWoFKKGzVM0+OaNMGQwX5w9y6k5DzUWmSXORPnhLwF3Pjc7AMLMnFiIZqEg/0m7RhUA4p8C8tPt
	jEJMHiYgy0bXN9zgWpFjK+kBVPd2pH+kqJh//AffpXoYblc0AAeM3YlG6YNTNDoiQoxD5HfKBbr
	mMoIq5C+y6e7ydAPw3kPL2dV1p71deRWZeH8Dxh3gxWNASruCjcuurUPPpVK4UcQVYwxLmJjoxK
	uCqZGG/bOKTHxil9kj72wZI2V9ngMbTzGOL7FrjhXNFlPV9b0UA4LgPEZAA88fyorzbXBLOhoSq
	sHg2UPL23x1rXjn5uzUHNtd+p0IK8AWstVOpfNQOm2th7CeQg2rj/j43FP7htm3l8g6sMqzZbyF
	CmRouYg+TGfBI0kS6VC9fCF/DGbKcxLpi24yqe3hlhzeiA=
X-Received: by 2002:a05:6402:1d4c:b0:661:7ba8:a49a with SMTP id 4fb4d7f45d1cf-6619d4c7749mr847027a12.18.1772789363257;
        Fri, 06 Mar 2026 01:29:23 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl. [84.24.131.219])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e87sm307163a12.18.2026.03.06.01.29.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 01:29:22 -0800 (PST)
From: MikaelRothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	MikaelRothig <mrrothig@gmail.com>
Subject: [PATCH 1/3] docs/gpu: fix typo 'varios' -> 'various' in todo.rst
Date: Fri,  6 Mar 2026 10:28:20 +0100
Message-ID: <20260306092822.48393-1-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..33678b669339 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -269,7 +269,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
-- 
2.49.0

