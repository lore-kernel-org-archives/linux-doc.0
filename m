Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B00840DFC2
	for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803065; cv=none; b=TiIX9Djw9GRl2qkBb4WibaIMeaHgvCYBq6btbsYmHCLCntC99e+KO6cbnTDvXtypG9/zZl8++BtUif79kwytLBBlo+j0LjV2rnQAR8ZQQ/v7+OKiMeRvPkoJhHTcs9FWUnzwOzNIHBHb980TZxVUBf8svW8ZoSgElV91b5IdvKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803065; c=relaxed/simple;
	bh=oWQ3dUmo9yoLEPTaG7B8EShIxhLaaU2aL433ClaMALc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJ3JWdLYn6YfWlNKBm7HKzZIRi3+NbNung0ggCzRpBJOF/y4oq8ST15GI7s0g5SXt+3WPR/ojGtGMqeXxzFr2pw0SnJY88InGLiJinic+9aqZX6QbLnbSAFx52caGqPbe0bFx0KX0WliVy/0R6RLndFyCcpj9eB6G56wCKHgSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDA6M6zg; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDA6M6zg"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso1514847e0c.0
        for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 09:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774803063; x=1775407863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKGEE8s1UkbnRvJSLOgyi7Kvp1KFxYuLcTMlybDKGZs=;
        b=UDA6M6zgUWXGgXc+QyH0DliadajF802kzoXDJya+vA/K9OeSaAiE3vtBiLlFviHB8C
         rAPGBOQQMFUa+D1CqBiBYmnFACA3uoL31q4d9NaHwxKjLG+0j0gEneP5SUb2YEmsmePf
         X1OW7ZvpcT9wT2vGpPWnZnEWt01GwaqdgFmOI6eGgTeT64ndIzhhaUlKjV6dF8EY+joU
         1Fd2FZFsUmiQIZC56a1LKcX8fcmtBKyRR726320hiGkXAMfvAKSZjoZwyzFrUBWh6B05
         QgOxahvTcrmtXOdkNef0ziBr3PvF4Azp0cM3r5rgRCMx8ltkSL23Pwz9Vmu5uWM05kJ6
         fgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774803063; x=1775407863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKGEE8s1UkbnRvJSLOgyi7Kvp1KFxYuLcTMlybDKGZs=;
        b=LlhZwpHcixrDNT5QhNMYpdTKxPkcX1vcSNmY+uz+U9V6kbllQ0syCQt36cBDfck++L
         selfxsd2AnJtEXuBfQTo+lNtTVKer32GgEV5zZ7/kROfjMYqc6CtLRAvdnWMkgqq1DLt
         6ovhVV7VNH3fDw7L/mTwx6QVU4NnmekT1ksSWW2jJ4dNO0+Fo3HDBVUf31Gc827Nb+R8
         KPk22MTgscQgnXGXlpqa28lckYMMrNaDmPdrfWF0ohNu87TmKmfdTSP03pQoKYrzO/hA
         A5NtKro4BKSjzXAtDNaQdRx3Qa97+h9kCfy0NuNtIMPamj0C4OwGF75iyXxbC2g70RuQ
         o7wQ==
X-Gm-Message-State: AOJu0YwYLqt/mZHv+C8lwI/w6H1hgnYPoKEbAIUuj/7KCO9K54Fpa6Yd
	3bW0H8Xpd1sBLqI/tUj1NQgbM+6qH9dlUEazov+Ywx8cLZu9kC8SGOxKY+PNGQ==
X-Gm-Gg: ATEYQzx+PU6U5BXnnkfL+2G8ZttiZSKPcb1qDxH9yawOuGJ+XH3/GrfzZUwVRhuNrbI
	CB4vk1MIrQuIJJ8vDGUWMoVuT0GKIN3QNY/EUUyb4t8jOjwW33isoQ/hcqCgggx0i3zO4JRpEhj
	lvNl5w3G/iR3vdjWTGjEtMYCzTtP95hWN+3vjUvUTmYpsI5+zQRdSfrXpqWY6xIgO9hCuFleJKD
	kjL+WhyBSKLgfACYBJRC4FKN8S93fejtlTco42AA6c9oPy1WcKgbQFveTtia9NxkxWQFhvUFuWp
	CNWq9aTFfr+1gseXtLLlATwK+4Zc9eSRXgiubK1/8Llh3OA8N56XENxkNTKFWQKKkuGUCkbx+EP
	P9bIe6zqiBRn3rW20M6rUbemnFSriXy7WWVAqwOC5qZMqwc141vnlsm9dmbLKirctgowAfZDvwE
	yJ50a0WJIzRKWfZX84sczRUcP9x7TkBMj+fS5esjMNAnu4HX5OX2MELjf8YKkUAvifLacsETQgM
	xJz
X-Received: by 2002:a05:6122:659e:b0:56b:8d2a:8c8f with SMTP id 71dfb90a1353d-56d4a606581mr3875454e0c.11.1774803062751;
        Sun, 29 Mar 2026 09:51:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:1690:81f:ccbb:2e4d:21dc:8ad9:527c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a7ba96sm5549740e0c.17.2026.03.29.09.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:51:02 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 1/5] docs: add maintainer-kvm-x86 to maintainer-handbooks index
Date: Sun, 29 Mar 2026 13:50:35 -0300
Message-ID: <20260329165041.831369-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329165041.831369-1-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Include the KVM x86 subsystem development process notes to the main
documentation tree. This ensures the new maintainer guide is properly
indexed and reachable.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/maintainer-handbooks.rst          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
index ba36df8ee..bf7a38147 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -16,3 +16,4 @@ Conteúdos:
    maintainer-netdev
    maintainer-soc
    maintainer-soc-clean-dts
+   maintainer-kvm-x86
-- 
2.47.3

