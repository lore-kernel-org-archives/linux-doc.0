Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4B3750AD
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773594337; cv=none; b=ea7T5oyv4Ts2MOYv133X7VQKButGVhh/uXEqk1+eIuzeLGw2Glng4K/JGsGTwDlmRBTAsHHY81xsCF8SSbIlEyTPFByH1BdeO030H3fgdbnwh7xi9bAI9Tyv7Ih9pjd9MqO4NC9IEUTeW1uXYo6PHEGZ9qn76YYs71+iZ8/ykwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773594337; c=relaxed/simple;
	bh=3CgPh5SkE5KRvY8VgEIKPCHGhOMr8ueOxGLL9lxetw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8t5YssAHY7He/FBnNWEC75p9394KdFx12bj+q4pD4DBHo0a3JeMPf9NAKjc6KW0ElnqWRyEkwAp9ynOjdNvn6MRvg4663zzC/xNMWg/LdaLvisMm/U+VZyVSFGjzFXpReikHTigATJO1gCNkUbprMVwfcr2nGJc1iZ5JhODc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU7XApSd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU7XApSd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439fe4985efso3433397f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773594334; x=1774199134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkDf2WuK8ccioVK5RbdDFkIaIC5K9PKCr8wBG5ZjcvU=;
        b=MU7XApSdRWoP3bIyc2iJPDexQlg+S+Ix2JG6hoZ+6qAej0YferkpSlcd1aa+QqISVa
         avvVWQfqSaLdcy885X+uDNs9/kIMo+fZmCOtzsOlvHddiGwyvFxGtadJvIZVWM+B5Eyr
         5bDbCSX82gXbiImtbM92RNdhpr/gCC3aRmQEiwdSSpkBT91u08ARe4TyhDCwFirjXAWT
         5y2Y9g7lVj45nQJeVZSjiWxBJJ+8QHEYSw4qvviSa8hALTlEPP7zcLF7R/Qxj7ZAdbwr
         zyXhxkEVnCkuv+wIig8qCQba6xBbVukjHiNhmSaoRAZiTjU0UJmfywnzvDobWe2J7rd5
         N1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773594334; x=1774199134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkDf2WuK8ccioVK5RbdDFkIaIC5K9PKCr8wBG5ZjcvU=;
        b=VxitGGQCw+d2Niu0NBWOwAOCLlfC4wJOt1KqLd8GN3zREkesBQIBi5tUS3qlPM9HEx
         yrXk+38Tx6591TnapodAccjbHC2rRLUAA/payzeLYjPTDj9DXVZaGd2IBH7VsLJlvqP7
         iabunj6jGOv5oENCqMpeCsiAkUwlD2CMNip+m7TcAjr/1cR25Jl0HbsMS+e88R6VSNpH
         DP7grio25QBsaWp6Id/gbtrO2c3YWNGapH49B0oi20fkWPOGJGvmaYM2O4OqArre8Jcw
         Yd9YZYM2zb94XUeDi+JbR7JMQdjAn7CJaXm0sCxuGFKXjr/ANdLLSRZnyqd/tkwrv8NQ
         sj1w==
X-Forwarded-Encrypted: i=1; AJvYcCX6EstXpbeN0IKwUwTjoijxgEj0Tg+3dQ+ppswy/gnsw8KX+IgrWsUy243lzyF2MXHlGaylZBRgqdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB+bYdptQjqrHo7uFvxjelmxtglnNgKV7APLm/dJq6XnqU2wwC
	+wBzRdSVtAv34Br1I+WMj8wDADXkC+QPH6brQQXmeLSqQSd/PlPlvU1n/DdZCr42eUk=
X-Gm-Gg: ATEYQzwtD+JWZi/ZFXjmg9J4DZC74c6f8V23oNw/oFKcdyWSXBdhh3+bRROv7bcMn7v
	CJPTzmscjS26Rh8DdBrDsrvqoqt1m3MAsqHubvGaiRgohb3zIIg4EGX5SNIa0Wbw6YdiJrkctJk
	KP7QFreSkcibGtVNAeEh1ETkZH4A09lNeVfC6tUDjNusb9UWw/fFCxiWCX27QE23Hl82gWixVPp
	VI4Oo5spdEcb1Cn7RgS5id/5oVBISyrc7pzxT8+3Z/a8seHR9G/yP47cZqY/DjSx19S9jDvrhUO
	u1K7Fy2jpHteYUzQLQE7eloDIs61CtXDfpsy7Hy07Ix0DH5c6UuySrKfKKC8MjdD+OpuZWUZ1rZ
	ZXJmYzAczY72TAkxroWOW/YX3gLyFnad9PK2rPJRW5K4p84tRLzbFLUtj4WAlRMGGn12MLAMySz
	Mt4JH3BXF9TehEkXtZg0370+BgQV3YSLDQ5Xw/FX2NwkMavN6d6CW46ppY73mwcOhSNQGENd/YX
	uh0QlY3yyfeJsMGvaewvd/Wv8divnaZc2MROG9R
X-Received: by 2002:a05:6000:2086:b0:439:b60a:b400 with SMTP id ffacd0b85a97d-43a04db4f99mr19634894f8f.31.1773594334164;
        Sun, 15 Mar 2026 10:05:34 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm34331721f8f.12.2026.03.15.10.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:05:33 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 2/3] docs: sched-stats: fix misleading 'per-process' wording
Date: Sun, 15 Mar 2026 18:05:20 +0100
Message-ID: <20260315170521.63794-3-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315170521.63794-1-xaum.io@gmail.com>
References: <20260315170521.63794-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

/proc/<pid>/schedstat provides statistics for the specific task (thread)
identified by the pid, not an aggregation across all threads of a
process. Change 'per-process' to 'per-task' to avoid confusion.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=202635
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/scheduler/sched-stats.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
index 9d6a337755f4..9187cb6ce1cb 100644
--- a/Documentation/scheduler/sched-stats.rst
+++ b/Documentation/scheduler/sched-stats.rst
@@ -190,8 +190,8 @@ of idleness (busy, idle and newly idle):
 /proc/<pid>/schedstat
 ---------------------
 schedstats also adds a new /proc/<pid>/schedstat file to include some of
-the same information on a per-process level.  There are three fields in
-this file correlating for that process to:
+the same information on a per-task level.  There are three fields in
+this file correlating for that task to:
 
      1) time spent on the cpu (in nanoseconds)
      2) time spent waiting on a runqueue (in nanoseconds)
-- 
2.53.0

