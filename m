Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D131274650
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236217; cv=none; b=PR0PeLlruNHpOoPBDz880TS6PKJiyxFyR8wq8Jfvqk1Nx8i8gzirjM1byiKxKGLX1shYGnVcOBLt/1WI944QQpRQKvxwZfYgDM2sWpUi4mgbPXq+ZTbcWCL2tsjtMcsU7yNbB/fpeKWMt1LbPtx/ZsHLWy3HPpW8oQxhOnjAObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236217; c=relaxed/simple;
	bh=6KxXEU4mM4Etl4EqYEr6dcFBIew34rXPGITTvbtaPVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UV2RBTkGnGB7zgKIpyfTBS8G4WC7Pa/KlLBHdV5AuQwpqDCk4XlslbU/w97EBBcC65XG6YgzUSP6AnwO4io8VWV8f1/kLsEreW0Rc/I75J78GRjZLpUopYh+nCDBY5rwSI9SxBFYs1ORH3SuJlPhsF/8WduiyuP60UppENmjlS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gbo4U12o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnbBwGwe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gbo4U12o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnbBwGwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780236215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oXRHDWuf7kdsdZ+4dW4PM86Io+i5QtdP1dIiEDt0g1c=;
	b=Gbo4U12ozvjN5631d+8vuEcs1K6QrmdGdqKlnP2YaVYU9i/Vfm5PbIaMe8H+D5FzBc5DV3
	cPUI7lDu7gDxt4iqHbo2KYu2sbbfaw6N5BulWV1mIqSUjmEc6PDeO7VXiGbq0gGQ7ddhZ9
	n5riMSYCjOcAkU+I2bJwpeodW73gD+Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-_h7BfdviP2WJJQzvqyWGeA-1; Sun, 31 May 2026 10:03:33 -0400
X-MC-Unique: _h7BfdviP2WJJQzvqyWGeA-1
X-Mimecast-MFC-AGG-ID: _h7BfdviP2WJJQzvqyWGeA_1780236213
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91550c9d0f0so114956285a.0
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780236213; x=1780841013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXRHDWuf7kdsdZ+4dW4PM86Io+i5QtdP1dIiEDt0g1c=;
        b=SnbBwGwech0hsYmnDRbtZVqTJNiZBh2j5lAyLQMUeo9pm02eRDC+eIylCBPrMHMEnJ
         3hYA4nMc6w7YQyu3xHJODejYhimTIEsz6Q22qozG9n07dIJqzJGzI2dNjMiD9l1//yb6
         y2e8y2HQk9aveqLxWx1ttdKvZNZgfOvk2XrrB+UEvaaimrUVUIG0szjba8hBh987up9g
         Nn2oEAB46AUg2V8Q5CRRTkyxutNY04IfnsK8kiiW2ucFd4j7f2Q3UPPGnBVMCaLGpeI6
         +5+jTZFA8SkD/FSIr6k8nyd4ytw/49QITT25uFT0uKeD8J9ZiUS5zGC2cxgJpZNJVkU8
         j0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236213; x=1780841013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXRHDWuf7kdsdZ+4dW4PM86Io+i5QtdP1dIiEDt0g1c=;
        b=oN5tY7+w1ZgXssWeLV5pz/4EWErPXdnURJehyFrC9hnQDNxY53Ckw31UHL37nFVrmA
         WacYG6GhCRJBh3KUwIwJEQQdOaK0ETHXOGOkJDt03brLgcB0+RzlIE3lGOLGr3r1lzBb
         wCyRCgeqgMrPyHfvUI/tIxlpxqHAp3B57CBg3YYejibg2XoLuyK44tGImeaRcLRhHWX1
         aT7bWQG03WaWc9sA6iBV628F7he0RDEheAj7eHbMuE6k9wkgt/eZrk9humja2PxMthzk
         OJuWx6ykbJ+7xIBbHUH3t3HAs+3ii7GZA5PvFeWm+t6ZzCRqEQKiGlCPO58Y+ZUtcHWT
         kDjg==
X-Forwarded-Encrypted: i=1; AFNElJ8oA1f0+Jghall3jbv9ZF/GSVdROzXjbETxXG2lpGqwddVYmdTGhp2v43QXpmsJ9TykrXAX/DxgIWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYWclIo7fP8HvGKxJlJdd1n5/GP15JqFjusiMG6WPKpTFzy1TW
	OrufdNo0i0QvMNjQYkG2v2IohGX5ASgMAMnARGRlWPvwvEvTUlQqoyBczCvE/gupDoYYRRzWcAC
	ypMJXWTKzCyVEoYoIS2zZtRvpLnROSHeY36G8Jj1wvPvTgF32EbODZX99YupzTw==
X-Gm-Gg: Acq92OGyQkbUEjRNtYhP2c0MJb66s8+JZDcoQV6ZqB6gSHSXaSwfmRATCWa+/pPRlby
	REoPdEDgEp4XA/J+A26rppZBttP24ETJqd5/Su5a86DXzizQeJWcJl88uE1ShcE2tXEPQCMgU5y
	sv6DHoGBtqZida3QUsuqZnHCnVGrBUADD6ut83ypW/AC2cTene7aN2Yig+PItY0ggwpjQa3/rwJ
	hhwPubi+HSTuGxt77CU6zNRYu9tJYz7c3hKe40Oy9nB4JpV7OSl6uuuI9GqyDthHjiFl6FTHJHM
	u/omKlqp/J/A0MdkhRhs9dq9sYHmTafOcTXQHbx1j3lXvJ+xSpFe8WIdkalpaKJTqa5MW2WK4qN
	7XuhBvEz1Yc+DXw44hPXf3lyLBljnUJrBrWTVPTFITa38tw==
X-Received: by 2002:a05:620a:458f:b0:911:9e67:44cb with SMTP id af79cd13be357-9153d9f5e56mr1146957485a.38.1780236213059;
        Sun, 31 May 2026 07:03:33 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:911:9e67:44cb with SMTP id af79cd13be357-9153d9f5e56mr1146953685a.38.1780236212601;
        Sun, 31 May 2026 07:03:32 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153249a5fbsm799732285a.20.2026.05.31.07.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:03:31 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: omap/dss: Fix stale modedb.c path
Date: Sun, 31 May 2026 17:03:22 +0300
Message-ID: <20260531140325.4115024-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The modedb.c file was moved from drivers/video/ to
drivers/video/fbdev/core/. Update the reference.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/arch/arm/omap/dss.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/omap/dss.rst b/Documentation/arch/arm/omap/dss.rst
index a40c4d9c717a..9d39679235a3 100644
--- a/Documentation/arch/arm/omap/dss.rst
+++ b/Documentation/arch/arm/omap/dss.rst
@@ -314,7 +314,7 @@ Kernel boot arguments
 
 omapfb.mode=<display>:<mode>[,...]
 	- Default video mode for specified displays. For example,
-	  "dvi:800x400MR-24@60".  See drivers/video/modedb.c.
+	  "dvi:800x400MR-24@60".  See drivers/video/fbdev/core/modedb.c.
 	  There are also two special modes: "pal" and "ntsc" that
 	  can be used to tv out.
 
-- 
2.53.0

