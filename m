Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3CF26B2AD
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775762400; cv=none; b=IPJ0XJCS2H+mCoexK/dGrSyBjk/dwxUqLFbox0y69g3z0kh1AeqEq9qacLkFU0G6OPq1IzVC6yaVHfY6TKw2dK47eL7wLehZjyFiBPreSILDPHc9ztFRFMnn5Zj9xm8PzTM/r6lqnHo7K2FMQkMOZXBVuKqFOY3n4+z7xzGL/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775762400; c=relaxed/simple;
	bh=MVtMTdBxI8Mji3jHEkeVKPrWVKpXoQgSTEjrYKpgVhs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kGcuKM/LaNkkV7sxGst6tgTgabDgUt5p2Fuz4XMkhtZNkLBwUoCZHXoCCMfGRoALUln5iw2jzokZDO5hCCFxfNsEwW/Pi6M9dxy4Em0svCYabHPPviz4d1O4TY/7ktpT8n3mUeaGc35Gswxkyx3uWUZlWR3KmVzYIZddpmceVFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DutVm8HF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DutVm8HF"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e4a04f059so1146849e87.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775762397; x=1776367197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtbjlEyX7k1aj3+I8h/x9ea7jkEu0oBZrUe1xMFVdA0=;
        b=DutVm8HFlXUg9FBiemPnJQz5SfRKIy6wvlok3zUPWtQCzkJId6wQWNZtKXVZKn80T7
         e6AWPUZk2+k/Pt36shi/OqV1FbKVqPYHUCm+rtC8VpGm13/HixDvOWumOkrG7qnLk6dM
         VlFCK8SNuhKxycBh8iu08tAbBIf9DBubAyolrL+nguwmnyTI/8WuohEkQJ5MHw14pmGm
         I8ZY6ZvDrIAtF9l2vAEN2nrdm3cvTF666aUGtSL9O74dtzGoAF+0RKIPWhPvyYd9PgJE
         qWpj32ne4UQtc0SPIplAJZXYOvSUB0sX8t9tXc7LagQrWoZL9TpQvRRXOD3zU/AF7DP6
         BLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775762397; x=1776367197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtbjlEyX7k1aj3+I8h/x9ea7jkEu0oBZrUe1xMFVdA0=;
        b=XDEgCKhD/2JNmK1DycwWa87i0CKYdEs9w9VKZ5n2Ai+IwjaSt9ZLGL3UfwNov2I7hq
         MRgT254sD0lB3BNyrxcQqGBWQHY0JaTL9nBF7wKVdP67EoprnhB7gUy/0i2BllX0N/jq
         UY5vKOH41XJDpHVglYPlAfejvRShKJhZHY2NWTbc17kCLUrGQJ+3DdBXt9Jk1IUHJAuN
         T8BPBlaZZH9QWAJoqVJII8kRlisbhTI0nBJDF28PkLerbsJwNBmT82aA3tSRHvQ3KgGE
         dxu2a7jc+izwPkb5aIXRw9vEVVnXYxrzdBaMGtrsqGo0xwuJHuRs3/9kAY+YyIaYPqw2
         F9QQ==
X-Gm-Message-State: AOJu0YyY7/isXJc57VfCGavSSjsBcs9JiEOx+YAmP2lo5XmlFgSXtJBt
	+4xRnLol8qTZYJL0M5YrmzBpM5puvpX8TT0XRR92Er1CUZ9WENe/tQwTHku6i6qlVGSwzw==
X-Gm-Gg: AeBDieuAt2KWbTSMc3ZapwIqyGGogQJsi3O0ihF4mn9xT8mpUPQH14WqlPmj7ILOwaT
	LqNJzEmjZPcmOSdZYo1eNowGWOAua3XfC/fY+6Y3jkUdUhVyKFA0amyi6BsqiWi7DPu7DvPuUB0
	j3Q6izXmEwec7FFVhrmb6r/4tdXaq8e0d2k7rPe1YR4qyjKrac0mlos3JpROS82FJZFM4/6C07y
	pVe9lWjc/n73CK1XJ3JYUeNobeVlGrMkuRMVj9g0QmMN+SqCAkRFcB1BCIn6QO87kinPD1et+QK
	yPlj85lsMDIplNdiv0k4sx0amaMPA437wb0sg+iD6iGuk/Che7R6iNH3tiwfUoB2RF9wrJ1S+pZ
	qVMeREFnKC4d5pdXBHAvCYrjSqW9vgVRQFI3HOzseaSDvlF/hdfZ1FV5KqfDd4nTLQ/zBNiL2St
	bBjohpHtdAnbbgEHzvX8hz5RJvBiV0S5ubZP8q+nEI5lnzaCtf/RD/mdffV4SMRuVf1Jd2oCdm7
	g==
X-Received: by 2002:a05:6512:39c6:b0:5a3:cc81:efdb with SMTP id 2adb3069b0e04-5a3efb8ba02mr111043e87.21.1775762396752;
        Thu, 09 Apr 2026 12:19:56 -0700 (PDT)
Received: from localhost.localdomain (95-24-197-185.broadband.corbina.ru. [95.24.197.185])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefba8fsm97868e87.66.2026.04.09.12.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 12:19:56 -0700 (PDT)
From: Gleb Golovko <gaben123001@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	Gleb Golovko <gaben123001@gmail.com>
Subject: [PATCH] docs: fix duplicated word in real-time differences doc
Date: Thu,  9 Apr 2026 22:19:21 +0300
Message-Id: <20260409191921.125-1-gaben123001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove duplicated "the" in
Documentation/core-api/real-time/differences.rst.

Signed-off-by: Gleb Golovko <gaben123001@gmail.com>
---
 Documentation/core-api/real-time/differences.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
index 83ec9aa1c61a..a129570dab5a 100644
--- a/Documentation/core-api/real-time/differences.rst
+++ b/Documentation/core-api/real-time/differences.rst
@@ -213,7 +213,7 @@ to suspend until the callback completes, ensuring forward progress without
 risking livelock.
 
 In order to solve the problem at the API level, the sequence locks were extended
-to allow a proper handover between the the spinning reader and the maybe
+to allow a proper handover between the spinning reader and the maybe
 blocked writer.
 
 Sequence locks
-- 
2.34.1

