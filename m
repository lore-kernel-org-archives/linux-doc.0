Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E54119440
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jade-fyi.20230601.gappssmtp.com header.i=@jade-fyi.20230601.gappssmtp.com header.b="K8UgYGnj"
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84716115
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 16:17:21 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c9b7c234a7so1808045ad.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 16:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jade-fyi.20230601.gappssmtp.com; s=20230601; t=1697757441; x=1698362241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1SYtz8MTwaDmIrwT6SovO+Nj2e+MoTIYdmy9vtmT3Y=;
        b=K8UgYGnjyXVwpRN7hH1i8Zj+gvDrdndmiQGt3he/LQ4e4Elq/Z/9U0edPr0TCQfnQL
         I/ta43dsx8ke+Oh9K041AMXT6HoqQCtdf5MMSpzkfCBUIRCzPlhWpKEzfOJEklDp1vPu
         JwX4wEa+FxchR47hPPZSyCv3w9ay1qvmwExbaOMMMim5EbXSrHYHsYC/XyihlKsWj9fe
         UlYaNHG3bKcRXWohXz5EeshXamyT/c0EBqrPA52aMmI+CJZubizaJuxO0XSCvRmo10Av
         t9yNjDotrtWqxrNRGrA/7aPMyAjrLUaTsBpJE2vmTRHA1TQrnXnS6R0E3/7VM3Q0f0lN
         rZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697757441; x=1698362241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1SYtz8MTwaDmIrwT6SovO+Nj2e+MoTIYdmy9vtmT3Y=;
        b=iAkvvd9B4Wzw1qYkwtzpA2I6vqVG8jODw3C8A7eXLVpPa4jBDz8JaUlJ/3QikSMGBn
         ykBAr+Dli7FU9pC+a+YDC5y3v9DMlOn3wHP2yDTPWZYcZQQ9IR3pKWLO3MmiWf8VJokd
         6xsFTpNnb7S0xSK+ZRRYG/DEShVWOmp6Qvv3zlNcNOYI3S/7Tuw+d6RCCR0ByHJtIfwr
         Pgcgzq4+yYjPGSXHBkKnS2CqViZDk8TH6JfEKbyYvUsclvdmAoX5x+fHrz1hho3cFp9+
         olVBYvbqKn96YbwLYKcgCxYFK6bR7jDKMOMEsexUFVxfpDt6xoUiO1EAMCKDfOqL3EZQ
         nm8g==
X-Gm-Message-State: AOJu0Yy9q3twIEpcLVCIiZ9GZJquAGITqOYYaTnUvotlKh0u61efXbzt
	uL5M9TXlG2QS3Dk6SvwQPq0DcCjwNPhTljNnEFp96g==
X-Google-Smtp-Source: AGHT+IEW5YX38Eabky5xVaCufvHvIlXJGExjnzYhAwB0zziAcpYzwO8R/t4BbFQfx7dtvJyggWHipQ==
X-Received: by 2002:a17:903:200d:b0:1ca:754a:692e with SMTP id s13-20020a170903200d00b001ca754a692emr314766pla.30.1697757440882;
        Thu, 19 Oct 2023 16:17:20 -0700 (PDT)
Received: from localhost (172.103.222.8.cable.tpia.cipherkey.com. [172.103.222.8])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090332d100b001c32fd9e412sm254637plr.58.2023.10.19.16.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 16:17:20 -0700 (PDT)
From: Jade Lovelace <lists@jade.fyi>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: fix typo in dynamic-debug howto
Date: Thu, 19 Oct 2023 16:16:55 -0700
Message-ID: <20231019231655.3162225-1-lists@jade.fyi>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jade Lovelace <lists@jade.fyi>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 0b3d39c610d9..0c526dac8428 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -259,7 +259,7 @@ Debug Messages at Module Initialization Time
 
 When ``modprobe foo`` is called, modprobe scans ``/proc/cmdline`` for
 ``foo.params``, strips ``foo.``, and passes them to the kernel along with
-params given in modprobe args or ``/etc/modprob.d/*.conf`` files,
+params given in modprobe args or ``/etc/modprobe.d/*.conf`` files,
 in the following order:
 
 1. parameters given via ``/etc/modprobe.d/*.conf``::
-- 
2.42.0

