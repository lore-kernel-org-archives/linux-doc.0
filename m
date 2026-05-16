Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A394134EEEA
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 19:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958093; cv=none; b=XEONVEgTmJOif8Zn09XQ2Fe8OkzhPwI9wWQmGG7M5dqGOehmYjxPcXrDje+gEO1y7sJqh//kC9Fd44K14KfUC3MMpervDlO9mS86Lm/aAqJC6AE6kg94uQJxd2fQDapf/cfl9teN5Xeiva9wnIuDzPzLj1r+P2hY1fOK6ls7/Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958093; c=relaxed/simple;
	bh=Q7hjCK61LwuTQY6yskK+p+41m4W+x20RkOQH4/PG+CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GlavYvqLv8bg3LjMlwSQzh1dlUkaH6IEGUyke4LfWg/zZxNzyzpNQ5b9Z/uAPgYfbBBK3hi6AA/Zn/4dbuOmGhMP/xuajqvziQhXT4cD4fyM0v5/+QSZXqj+zQz8z2X2CoxJbexCSeOS9pZprTm4Y2FYMl6+Bu1V1oJv1Bdggzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4cnHym+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4cnHym+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so10350815e9.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958090; x=1779562890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGHSLr5Q+XDF70m5E5RqpezGDL6n6KDUo6T4Dn6m/jo=;
        b=Z4cnHym+Xz9wylFWNGaA59njZ60zDBghEiGBO5M76J8QS3x2xFNZf+MjEeEhvxUFgh
         +EdWFJfjs5+oEp6W5RHDbJ+s7xiBRrrnROZ3hUa5GNh5z4aKzgAs6pSnnjninHdI2DOX
         r6BQ9BNxKf9yLeWzD09XD73retwWBVFs39zjyP1kF6CpIxvFQ9x+IDMfopLVo9fM8mCB
         cbU1Q4korU30UilNBdsi2BMwsUdEkNOfnGtxIrVbYNLxfTMpTNmIC5jV8ODQuSXIYAs9
         W/bUIV4FCRTXU7epFF89lZo74IpCpogpzRZptrabvlJrJqx/DUCwMbjV+nys1QmUWCrb
         mrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958090; x=1779562890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGHSLr5Q+XDF70m5E5RqpezGDL6n6KDUo6T4Dn6m/jo=;
        b=souW4EAIdZ07SsD2zho0E4gDzBQuU27oN7aFxOy35eEJI7RIXgjAVyP7frTNgP5lZX
         Fbi31bkTVZjwG5qs/jpxXftydGP8fopc5LkaYdrUsL4aUbwtritMiRBWLPq3UZrmQB+N
         JYmuh7lEAO4zy7/SgO9dJGbn+DhnUkKMmIrIJqMDyTnqyiuBlVeYUAOaslljWa+76Uig
         vJsme2sB0l431OaOjrpF3I3qJXqxpkAaYZnJEiFDJhQipQ3VQE5ajN1tbhj+ogDlq4I2
         rljOiHbaAbT0Ow19BWeRbIZb12LJ4ViHNEjH58aeHGuEdh94L81NhIaDlP/IPo1B+vZK
         Cbnw==
X-Gm-Message-State: AOJu0YwBKrv3W4o2JF6dSaljK2X4EgJ/YI7Qa42V/T6xcgcF78mTLriL
	/3sXp4t+7SQheeVytehh8dvqx4gd9sa66N+zGTK5pCXtojtpsOcHM9xE
X-Gm-Gg: Acq92OFRUYCfkj2+M/QubEK1ksACbhWz/m4pWPyhFkofzFcOPK84lYwPR1/YlWEBI7w
	DpUwjCtvtDuookEuWxaAjE0HXsmg9vC21Rp7QlS5CQhoN2SF9QxUISIgM/DznthdwUlG26g9rri
	CKgdWOKMOXHreox5ETzJuTAw3yneLkzXfI/zpIrp9ersX2JLv005MUDGH+bJkpEyAHZla8VyhMx
	7Sd1yaa0lQ9fgf0KtesMIYTgUU22FpVveSxFzVuKAtjvlH3EBBF6HDU+pKmxQIacGl1Tnps0450
	s8uis6LY7EdPkyqxxqW4sMCaGCCrxen1CVU923I3JTGNGEoj+mJWT9vbDG1e3wSAmG96G33vKAm
	E3e56VlhsnAlgUjU9ObYw85KmpkWh0Uy9clCNYpvY/MlrLPlxOKQddIrUJSaZn1YAjELD9NDUce
	cXLpSbvsrTiyEuALZgWvjclhxqSXTBAc8XDDvBeJY7yT6gOA5tgB/A4i7EiJGUvmvMScUImQ==
X-Received: by 2002:a05:600c:a406:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-48fe63297b9mr106298385e9.25.1778958089810;
        Sat, 16 May 2026 12:01:29 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53804aesm138278265e9.15.2026.05.16.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:01:29 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-doc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Alejandro Colomar <alx.manpages@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH] landlock: Documentation wording cleanups
Date: Sat, 16 May 2026 21:01:12 +0200
Message-ID: <20260516190112.4924-1-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation cleanups suggested by Alejandro Colomar,
which we have also applied in the man pages.

Link: https://lore.kernel.org/all/agW4yMK6CinJGqXt@devuan/
Suggested-by: Alejandro Colomar <alx@kernel.org>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 include/uapi/linux/landlock.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index 10a346e55e95..48c12ddf1108 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -255,16 +255,16 @@ struct landlock_net_port_attr {
  *   :manpage:`connect(2)` as well as calls to :manpage:`sendmsg(2)` with an
  *   explicit recipient address.
  *
- *   This access right only applies to connections to UNIX server sockets which
+ *   This access right applies only to connections to UNIX server sockets which
  *   were created outside of the newly created Landlock domain (e.g. from within
  *   a parent domain or from an unrestricted process).  Newly created UNIX
  *   servers within the same Landlock domain continue to be accessible.  In this
  *   regard, %LANDLOCK_ACCESS_FS_RESOLVE_UNIX has the same semantics as the
  *   ``LANDLOCK_SCOPE_*`` flags.
  *
- *   If a resolve attempt is denied, the operation returns an ``EACCES`` error,
- *   in line with other filesystem access rights (but different to denials for
- *   abstract UNIX domain sockets).
+ *   If a resolution attempt is denied, the operation returns an ``EACCES``
+ *   error, in line with other filesystem access rights (but different to
+ *   denials for abstract UNIX domain sockets).
  *
  *   This access right is available since the ninth version of the Landlock ABI.
  *
-- 
2.54.0

