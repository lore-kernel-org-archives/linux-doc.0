Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A5634F26F
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612249; cv=none; b=dHv2Z70azt/LohM8ssE+FtkCitvxBtdIvm5Q9Rkl26pNHI1yK2p0SLSIQeF7A8ayfA/PvCawubltvZERwFNWgQWQB8tMeQd6eykF6s6RCI+x75OdZgp9UuHLXAP+TbknMTnTXWmoWTPeJsgEWpEZdmn/LLpQLl7uLAk8ygwldqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612249; c=relaxed/simple;
	bh=yUJryAc78QywzKxvy9s5/gwJBGvfK/H8iwrIrSa5vK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dx20Iao9NU2p94B/WcjgWIYP8H9W6yX/ut3LytRksgJnXpc22Z1lC301ieqMCbVHyOavv5HXZ6oEcadPoYEVUymylOjbY6fPoSjbzOx/d4CNIj3/u0hIsCABbeBsjOdWFPfI8uP5scM2GuM9rSe47/rXIoXUGd9KeVzvUfDngIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JesR0hCu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JesR0hCu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8296d553142so1080831b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612247; x=1775217047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJMnSBAlfPyJiWYWvGUXnllg08hGZfO99VU+MtZ1rZ0=;
        b=JesR0hCuOPkfJQAbJ3K9Bl1lK3R6h52dmk2wsib28RQfJls4dsTT8KEkqLLxwEUjqo
         2jveJOYDmhhg4JwbuAdG+IBc5dSIT8o0vAYmgMedE6AX9mAwNUzZr/xkUhqjS3TsOevA
         H363411SUxf6uzC0Yfbg1+vTxoRRYiNxd6dEBPrjY9NRq3gOrV9w0Tx7jPN0UA4Qb/mC
         k7wl0M0kjgymkwKaItEe3xTmTNMDZHNSHAu5DARPk2kpbjm/soFUJhId9WLUtNBpNEvD
         cx49SPs8W1j60ahkW+5RFx1vxZI9yEevH7x4jLYdBlc7qOjPPBC6qLW33/7x6dVDW/Is
         DSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612247; x=1775217047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJMnSBAlfPyJiWYWvGUXnllg08hGZfO99VU+MtZ1rZ0=;
        b=jRDXFGeBIlj4o8ZNwwrq5ie4jbAr5CgRzgoJgGGO3q1Evs+4/64aZ4amK9FlNmH6cV
         8+R22RSPdluajau2/GJttef59xwwhofkSSlryy+5QX38XUqXMHxFdJ9umjxP0tAakBTk
         IAb4w6jY9ZQRgk019ZtZdNQQJBG34xgoQnjUMgtYd1paXdq5Fg4e0cG6aAd1vjsDf0BT
         q0IpzTpEpMEtv+CN1fWQQDrFJ5wouIfQtEurxenHN+D4WDb8vY46E7A9QYHNV+he85+t
         Xhp1QgIEZnCLLRa9df6CyjMZGzZBZ7QaK7TXGkPdQGyAiRhZu6VEE8LjIZ4ma/FtZBzo
         XdiQ==
X-Gm-Message-State: AOJu0Ywe0MsrzEywWW34iLi8davbuq8UQI0x4Q9RRLSbxY/qBYY5a2dR
	WZUKNRpFQ80cFmeXkH/TRE2CKW1RGaDzEXxtQxKX5TPMTI0p+3GpCzMRtc4jkYdG
X-Gm-Gg: ATEYQzx4CXQyrAIhY0VFK7ic4OEiX3PMvGiBKOhkMTShfuiW56w2gWAsjrLpWVHRrBt
	gGgMWaj54gf02+bbpOBxCzMZf+PwQSMwY/7tFfclBm7poQDLtYba2yBIjjIU6tdxMAkvh7GVhFW
	jY2JF7AQmmv9E1rMN0hYeHUqf17czQEVdGHeEoiHLDGnUicuSagMAjo7fzb1UJ9TciyCxJLlRpP
	svLkL18+YSnUIvr7CMJ7LafQs3rejoINHR9vWhG77T9d7Z+sugPvIYgGDCzfMewiz9TbfQastGy
	Rrf+NskVsPrmcEmwlxCHhIHUCKnLZR4/rtHEyfKJRGUUsjD6eO/Os6HRO0FxrnD5nyueFLN2stg
	l1kypKwFULaOn3H8MY04JH88XJjfyQ5lK4YXy1DjfDIytY/zX4xLgYzKl1p9ojZAVi0d0RtchrG
	TaVGMJAzN8ABPGxvjhwSTiOHjTjc0Eg0fFwcc=
X-Received: by 2002:a05:6a20:3d06:b0:398:7808:10f6 with SMTP id adf61e73a8af0-39c87c2e998mr2650844637.63.1774612247299;
        Fri, 27 Mar 2026 04:50:47 -0700 (PDT)
Received: from localhost ([220.247.131.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d400f62sm4961307b3a.55.2026.03.27.04.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:50:47 -0700 (PDT)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] docs: fix grammar in contribution maturity model
Date: Fri, 27 Mar 2026 17:49:40 +0600
Message-ID: <20260327115014.2210-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the incorrect phrase "such those" with "such as those" to
improve clarity in the documentation.

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/contribution-maturity-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/contribution-maturity-model.rst b/Documentation/process/contribution-maturity-model.rst
index b87ab34de22c..798d1d9dd8b8 100644
--- a/Documentation/process/contribution-maturity-model.rst
+++ b/Documentation/process/contribution-maturity-model.rst
@@ -65,7 +65,7 @@ Level 3
   authored by engineers from other companies) as part of their job
   responsibilities
 * Contributing presentations or papers to Linux-related or academic
-  conferences (such those organized by the Linux Foundation, Usenix,
+  conferences (such as those organized by the Linux Foundation, Usenix,
   ACM, etc.), are considered part of an engineer’s work.
 * A Software Engineer’s community contributions will be considered in
   promotion and performance reviews.
-- 
2.43.0

