Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F084C30E856
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 20:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831540; cv=none; b=D6r7AW+6SyTSzB7K78/obq8YoDCB3/zfGYe4WEon7KAMbVPDPneimYKOYWukGuOLhO244m6A1ZBY9PZfVWzlJcOaofVzWy6xBB1+3wN5lKHx0ie279MpAbNwOmkEnHsjm2O+FRrhmkc11dGMGBI22ZdwEJlfvxAGsMgpBVkApqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831540; c=relaxed/simple;
	bh=+vvNZyxRS3Xoxg6CruZvRqd9NCHpfT+CVjjMzGhZYXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f/4rSertQ89/DupAbsphmrTPfTynXSaCrtPdMusCAZkTXfbv8l5DZ13BYIwbglLw2jvu7bzJe5PWBIlaEWQu/HSYGEj9JUWgJT41xAuVMB5kPYKAzYWIyEbqgS8Z8HINmmY6ng4kdXQTS8UeGAEtvx7IExJKsS1gGttZGmzBKcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPCsBkKx; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPCsBkKx"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-6498850d3f6so5086584a12.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 12:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765831537; x=1766436337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuQ9eewBOQMSnmOXWjL0GFqYN2ItoMopMM2RqCWXMKg=;
        b=dPCsBkKxGQKICjNsLyrVwq258y2NPVh9XUfMITUPU+6Rm7nZ97rYklaD/UQOcRE6hz
         8zSN5wbvudy6CuT7b0V9hIB/z7KRoiU48nOLTO3+pJhyF0lG2hcx7T9j00eesKt4M3Tx
         rl3rf/N3SlTJx00DC4UbB50m88bRPrm2uKYr4T7OQkI2PCI8Oa9qmQufOluqXO5xgVC5
         4TO55RmSPmnrBTbiR4sohwkFFQZYQuL2M62MHzNAOYetOkQXAHGDaGdWarYWcN0ICwD0
         7yi6QnX30BAmEZVIGxFLmuorD1nU9rJoTz96PkOmOfj5c4QEcfdt0I6y7A9cDUi6B3sl
         hm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831537; x=1766436337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuQ9eewBOQMSnmOXWjL0GFqYN2ItoMopMM2RqCWXMKg=;
        b=lUiPeVFQkx8GM3yDxSmzdZUoE2QOgiwcKiU7gDC/5rYsGqJGZGsjFb7iAYrgntPvcU
         1YHco7ynlUQfwB5s009CN4b+cV/By15nRC8j7U6legjyQwLQM4OJsCJn6WCqkHyBS2ZW
         7Id8VjIklIfai3bHOzPUHmI2B+x0A7KXNWlwAOe+1rS/2gzOcx9EMDF63MBbFOe5rMr3
         Ej4IjNtSsz9udKFYoLz4qHwHbKMLIFfGG4a+wktacQ7Je0iWaAoVhH50ZBimbgNAoYWe
         VZ+6cmImL3VwGAQS1C4tb7DJOAEJdiqxA95hwtybNZJniESRmVinpylWjysVBwKinw1C
         ihSA==
X-Forwarded-Encrypted: i=1; AJvYcCXD2rH7tJdmbvVnbC+jBzhSTR6TyPR65tHpF8mJCXd5MYl28Mhavy+V8QsL8F1MEeBXwPboW4b71jU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOl3QZfiJTp8sKLM7gMWx8CTrJ+l6hGqfOrFKH7guGnkYEF0n2
	BUuVY6RxZwcrVuUOKlKr5Z8EiYsShKHchxCEBqpMPOui109mkZeYqE/t
X-Gm-Gg: AY/fxX7TT/B3ugeKY9KaR0phYoWgioz0Em1oQC+LPH5lRW21ovjzM7TIf1AKKq1vrrE
	LlntmbmKgQ9lNcJSMwltnhEXEBXhRoaCmLVKKQ2xgela94byyKnZJkE2PwhGNJopuTS4eR0oYFN
	E1RE9/SXE1MONGgEkJtxMe5vvqYfpFwsiPqzWjJ4L41rmrUrtKYrz7Yl9nT3TCNebx5xpnxDfpB
	/a8jJ9G4WmxC+Ap/hOkI04ZTMAQDY6CEioZXwizlfnlq9sN4ORfa53BUZ3PMeUF9B43VROkuf51
	XhrlotmaUE3hCO3V2oeQJ51prtAURyw3v0c+hdHIMToQM9F8mgsDOdD12h/TJ78QFZvKPXaJdV1
	OP7+N1j6nvHABMMsHvt9HqgOigw8OEAz9Mc+KBfFfLvOET7LcEcs5o1npT3uLLNJsmy1fktJOHe
	zuQ6BlG4is3MLOfhUNAc0+nw4ykplD8xwHhwmRRl89F6S501ybwuvt4bWJDw==
X-Google-Smtp-Source: AGHT+IFeLfaMsoVz4vyw5NJpr5OM7cmwpPUCViP3fL751zFZdxKjdqmTDEh8jEiQ3fFTafaLrvt4OQ==
X-Received: by 2002:a05:6402:2083:10b0:649:aa77:5ec3 with SMTP id 4fb4d7f45d1cf-649aa775f32mr8232246a12.18.1765831537121;
        Mon, 15 Dec 2025 12:45:37 -0800 (PST)
Received: from devbox.corp.jeyes.co.uk ([46.1.184.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64982040b8bsm14348069a12.2.2025.12.15.12.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:45:36 -0800 (PST)
From: Okan Akyuz <okan.akyuz.linux@gmail.com>
To: linux@roeck-us.net
Cc: Okan Akyuz <okan.akyuz.linux@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (DS620) Update broken Datasheet URL in driver documentation
Date: Mon, 15 Dec 2025 20:44:22 +0000
Message-ID: <20251215204423.80242-1-okan.akyuz.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The URL for the DS620 datasheet has changed. Update it to reflect the
current location.

Signed-off-by: Okan Akyuz <okan.akyuz.linux@gmail.com>
---
 Documentation/hwmon/ds620.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/ds620.rst b/Documentation/hwmon/ds620.rst
index 2d686b17b547..e2d915a988a2 100644
--- a/Documentation/hwmon/ds620.rst
+++ b/Documentation/hwmon/ds620.rst
@@ -7,9 +7,9 @@ Supported chips:
 
     Prefix: 'ds620'
 
-    Datasheet: Publicly available at the Dallas Semiconductor website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       http://www.dalsemi.com/
+	https://www.analog.com/media/en/technical-documentation/data-sheets/DS620.pdf
 
 Authors:
 	Roland Stigge <stigge@antcom.de>
-- 
2.43.0

