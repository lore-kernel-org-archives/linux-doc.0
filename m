Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDB0312831
	for <linux-doc@vger.kernel.org>; Sun,  5 Apr 2026 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775407160; cv=none; b=Va4YXtfOXoRTK2quGqcVaSeEUe3EKHqTgge3zBUkImW0WH/7xnlZSWlba1ZUCLcBnIM7D3NVDSwaCjidCx9Q84lBX/1rvKTnvDc/T39fkp958ODdjcxOFJtC/B23KSiSXeHl51RL1WfySXPc2FKOFVuVK0m8ECBHRHXmkAQVRZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775407160; c=relaxed/simple;
	bh=k0u4N4f0VkVrnvs3LQrlN9FOtkjFp5bVcDpGR9ErXNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UdrE5so8BbQf8WqLl/rFEl2NEuDWFmqT2b1enU0CRY9/ubEi1C35S9QpQXLllzrBr8uoUkL1Wct/n3uP4Q15T5hAq7hVhPw7j6+w2rlJh41+Giiswhp8t75m5Ae/ocbKZPuMXoGGTO6zRf6//byzJQtNl9wMGkySMrhWHB55X8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YGzzOYqN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2L4kFsF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YGzzOYqN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2L4kFsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775407158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5LiNsMTv/b4oQHjiG7soW1r21z4Wr3WQGLyz0Cz6HLM=;
	b=YGzzOYqNokHl0t7YR89Z7zLHxpjI3UQzc7HGcogyAzO+d4mjf58RfQ7hnb4VyV79JuX/q0
	IYr/ZkCL8sCNVYftB3jo+MBsttrxXQFnqIuquSvoncEAGqfnX2hJHF1RC6FTU09sNgMq/K
	S6iKaH5MIHUOEa/sEgGDUexMb0pmkls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-5xgS3AzyMpmNC8cXhb070A-1; Sun, 05 Apr 2026 12:39:14 -0400
X-MC-Unique: 5xgS3AzyMpmNC8cXhb070A-1
X-Mimecast-MFC-AGG-ID: 5xgS3AzyMpmNC8cXhb070A_1775407153
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48886f1bbd4so27340585e9.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Apr 2026 09:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775407153; x=1776011953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5LiNsMTv/b4oQHjiG7soW1r21z4Wr3WQGLyz0Cz6HLM=;
        b=K2L4kFsF6CqdFXQHBsI8HvQbh5bxybClUSea/hO00OO5YhvELHZR0/eUULgwSPyxwx
         B9hoCCbJdojOjW2LAFM1KkYE5AwxeL7hO1dZjG8sYHfga7qeTIFZCU4Asch8/vNc5cjv
         s2I3vIps5eY6QMqLnvYNDnV2gftWAqOoOjUdu7f8nk92Teqc8f7eHZ53Dj1+MlbTBhvd
         UhYel2gev9xs2XgLHLw3rdWMHBY+nKZH7+NrCPLSxJtrHvmkbP1bd9IvZVLBGSNeljqV
         oxLhaDcOllkTgoUNFYIhiuH4qVQfaALAF4HjVBzWDikM7eVQGDukGiKdnLSECn1QB9Hu
         +cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775407153; x=1776011953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LiNsMTv/b4oQHjiG7soW1r21z4Wr3WQGLyz0Cz6HLM=;
        b=tI/lPuEpIi4jR2crd2EdSuTt+cig1gl++7j+0wli5UL9zcq6vCxUAOUbJd/e8/M1E1
         3khPN9C1hIMhuN1GVJ8NnEpdNI6LoP35qIv0xrxM6Pch8Jm468ptw+ZChE2vxAVefJoQ
         L0Qt2QHOOcr46Ugkis2iALKnj/Wp6ufC2rb85hkujbW+0CP3WpxA0nwp+9AmbF88GJmu
         thUd+EIH4/8bRjEcIw4HGvoGHyQbRO5+TiS7ELUEgNA6Y8sXj3SSmP//sxCTaPMb4AYn
         IwmwuTGZrJUu89yyrwJkea3XGX7Exk9PtmrAnjUf/P8XWB5awW+BewnJysyojxXZeyWU
         HWNA==
X-Forwarded-Encrypted: i=1; AJvYcCVk+hHXrz1szL+AiWMFID+Wp+pQi83tSZCnZKIsy4H4yRofu4u0T+LGyJySxPTNVpZwKKtg8Xw6l+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv82arGGAQHSGUQRJh+uca4zorzjachHZEev+b+H6QoU9BTz65
	p3pEB2alZhtqtnhUYig6HBKKoRz6Cm1PAfAV3m0XT4y41DnG7W8aXxuahy6GiPrt33LRFhkT7xQ
	uXGA4FSleL0JH3fWxjVDC1/UhfFnfctZcoK+fku55D4N7Lk08fHgcmdkl1ATK7Q==
X-Gm-Gg: AeBDietqVaaoYCDmrWyUU4aksFsGbi6HHo6BxVf9ikAYtmeiYR1bnUc6REEa5jvKMuz
	T1+nZuGhR5pAqdV7H8mVBakY6cusvJ3LBPfppzKweHNWSr8tvz9tgtJZZpSf1joplvRr+dy3bls
	u3EwALKL9gQnUmK+wM38zg0W7Mk3GESuF67/oGElMUYTvHvaxJNhYn026n77DS+7e4LK8Ko8pPG
	/KtSuTAYNstyNwiDuIs3KiGgodia62ixoGDNoBeU5kuaRp9ZTp9KQ2EtnETP+6ToOArQjSTvYeU
	uw5KFU4Y+E4igy0hOwBK27T3aKm2CjREzad1nYrq8u2C4Ufv8yxFxxbKWB9ukA+3OZZmlYQx6GL
	Bo6tiwti2bx8PJFaRj6IHJU0JsabDr1IEw44=
X-Received: by 2002:a05:600c:3b23:b0:488:869c:edaf with SMTP id 5b1f17b1804b1-488996df052mr129887895e9.8.1775407153030;
        Sun, 05 Apr 2026 09:39:13 -0700 (PDT)
X-Received: by 2002:a05:600c:3b23:b0:488:869c:edaf with SMTP id 5b1f17b1804b1-488996df052mr129887685e9.8.1775407152541;
        Sun, 05 Apr 2026 09:39:12 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980e3b55sm72143575e9.8.2026.04.05.09.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 09:39:12 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] Documentation/rtla: Convert links to RST format
Date: Sun,  5 Apr 2026 19:38:45 +0300
Message-ID: <20260405163847.3337981-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Web links in the documentation are not properly displayed.

In the man pages web links look like:
  Osnoise tracer  documentation:  <  <https://www.kernel.org/doc/html/lat‐
  est/trace/osnoise-tracer.html> >

On web pages the URL caption is the URL itself.

Convert tracer documentation links to RST anonymous hyperlink format
for better rendering. Use newer docs.kernel.org instead of
www.kernel.org/doc/html/latest for brevity.

After the change, the links in the man pages look like:
  Osnoise tracer <https://docs.kernel.org/trace/osnoise-tracer.html>

On web pages the captions are the titles of the links.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/tools/rtla/rtla-hwnoise.rst       | 2 +-
 Documentation/tools/rtla/rtla-osnoise-hist.rst  | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst   | 2 +-
 Documentation/tools/rtla/rtla-osnoise.rst       | 2 +-
 Documentation/tools/rtla/rtla-timerlat-hist.rst | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst  | 2 +-
 Documentation/tools/rtla/rtla-timerlat.rst      | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index 26512b15fe7b..5930bbca4522 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -100,7 +100,7 @@ SEE ALSO
 
 **rtla-osnoise**\(1)
 
-Osnoise tracer documentation: <https://www.kernel.org/doc/html/latest/trace/osnoise-tracer.html>
+`Osnoise tracer <https://docs.kernel.org/trace/osnoise-tracer.html>`__
 
 AUTHOR
 ======
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index 007521c865d9..6ddea2c6d490 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -59,7 +59,7 @@ SEE ALSO
 ========
 **rtla-osnoise**\(1), **rtla-osnoise-top**\(1)
 
-*osnoise* tracer documentation: <https://www.kernel.org/doc/html/latest/trace/osnoise-tracer.html>
+`Osnoise tracer <https://docs.kernel.org/trace/osnoise-tracer.html>`__
 
 AUTHOR
 ======
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index 6ccadae38945..b91c02ac2bbe 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -54,7 +54,7 @@ SEE ALSO
 
 **rtla-osnoise**\(1), **rtla-osnoise-hist**\(1)
 
-Osnoise tracer documentation: <https://www.kernel.org/doc/html/latest/trace/osnoise-tracer.html>
+`Osnoise tracer <https://docs.kernel.org/trace/osnoise-tracer.html>`__
 
 AUTHOR
 ======
diff --git a/Documentation/tools/rtla/rtla-osnoise.rst b/Documentation/tools/rtla/rtla-osnoise.rst
index 540d2bf6c152..decd9e11fcf2 100644
--- a/Documentation/tools/rtla/rtla-osnoise.rst
+++ b/Documentation/tools/rtla/rtla-osnoise.rst
@@ -50,7 +50,7 @@ SEE ALSO
 ========
 **rtla-osnoise-top**\(1), **rtla-osnoise-hist**\(1)
 
-Osnoise tracer documentation: <https://www.kernel.org/doc/html/latest/trace/osnoise-tracer.html>
+`Osnoise tracer <https://docs.kernel.org/trace/osnoise-tracer.html>`__
 
 AUTHOR
 ======
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index f56fe546411b..dab75677b06e 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -104,7 +104,7 @@ SEE ALSO
 ========
 **rtla-timerlat**\(1), **rtla-timerlat-top**\(1)
 
-*timerlat* tracer documentation: <https://www.kernel.org/doc/html/latest/trace/timerlat-tracer.html>
+`Timerlat tracer <https://docs.kernel.org/trace/timerlat-tracer.html>`__
 
 AUTHOR
 ======
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 72d85e36c193..05959f1a4661 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -127,7 +127,7 @@ SEE ALSO
 --------
 **rtla-timerlat**\(1), **rtla-timerlat-hist**\(1)
 
-*timerlat* tracer documentation: <https://www.kernel.org/doc/html/latest/trace/timerlat-tracer.html>
+`Timerlat tracer <https://docs.kernel.org/trace/timerlat-tracer.html>`__
 
 AUTHOR
 ------
diff --git a/Documentation/tools/rtla/rtla-timerlat.rst b/Documentation/tools/rtla/rtla-timerlat.rst
index ce9f57e038c3..63718c52aa3f 100644
--- a/Documentation/tools/rtla/rtla-timerlat.rst
+++ b/Documentation/tools/rtla/rtla-timerlat.rst
@@ -45,7 +45,7 @@ SEE ALSO
 ========
 **rtla-timerlat-top**\(1), **rtla-timerlat-hist**\(1)
 
-*timerlat* tracer documentation: <https://www.kernel.org/doc/html/latest/trace/timerlat-tracer.html>
+`Timerlat tracer <https://docs.kernel.org/trace/timerlat-tracer.html>`__
 
 AUTHOR
 ======
-- 
2.53.0

