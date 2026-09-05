Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19573093DB
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 01:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570607; cv=none; b=cwePXkRCDsCgeZAOsFaAKu8XG6b4uTtBlgR15bTFH5pa/n2OyI/o8Czr5WRc9hF2fDiP8h+akLspOBe1sy1V9KIk8A9OUnktZihR9BviGnPp7emoSavB8Wtnb75ScHQ1TIamOo5ww3Acqlghn+lC9O6yHUogI6yotz8TYDI2BpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570607; c=relaxed/simple;
	bh=SNNxI2a3/gcWYIHDCxAJDmhPayrpr0/IkhzNYGEv84w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZXvw80rw5A61fU9pZ/xmcrca1rjZwYLANdg8jmntEJ+ynOIxpqk9cN5OQ6dEkl4bRkVqDaZEKMi94NbCxj17/YgM+w8hOGEGGldUo0K+zppxjFAqoJCzPOlFclDPxS/QIa/xjO5ZUS4EkQzeLrsj+V79Ks2kq0wxGB5BTg4/RBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHi7xL9y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHi7xL9y"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso13786925e9.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 18:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788570604; x=1789175404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6ZpKRzVLfUZkzvwp43ybMZ5F1LoVc1YWYaQlbCksdU=;
        b=rHi7xL9y49TaVbJBDnVbmylRopdqxP14MZPDOdORUp5nGACfLkplzpxXli/Pyclm0P
         pAS06otR0/0JOCaIeYFZXTA4kzGwuY47NeVco7qufKEo8Lh/DrDlvIuRHbGGmj/mOkPr
         iydU/LyqOxbq7wHT5n5NrDYaWM2V+X/heXEl4RCRLErnsTDcwgSlHsJf8bcy6cGDDPoZ
         V3ZaH4IBc/0s3kWRZbs+utUjb8w133K/XyfFUXQpp/Hoq36IYCGSQi2MHOkC3V92AOPT
         jwpCzkgmdCRu0Ue1JrOujMLikjS4lCMVVXdFjlHKhYTl2MaONxjMfJ6trxIqiw8LPpN2
         FtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570604; x=1789175404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6ZpKRzVLfUZkzvwp43ybMZ5F1LoVc1YWYaQlbCksdU=;
        b=ohGlfAof+0qhmcj0f9MMV9/Vv1Ns/NiUltk9g8Hkt4oQCa3CUDwGgphxepLtoaLgIW
         xC52wnoJvEAPPunwjzxhcuh8Y+qwHdt9KrAD9SWdhBPwnQvPs/HlTPJ09i3jJTEnOhbp
         yH87EUrRFB0vH0bVvLLa2//zAb5j/MaXnER43LHE+MV6/NkyTBfvRb+O0f5qUpKZc7IB
         1aRBEJyCbgnae2VWaVitlwmyYZUVHYxoMJWs3JjUx6w1qcl9fUQaSjBLzuCQCMkdNoam
         O5f1roljlut4FbrIM05rQRhdWq4PW/qHYP0na8dNiZRWXR20DNXv9AJ/Le+y/h+sFwJj
         DE1A==
X-Forwarded-Encrypted: i=1; AKwUvByMugv5WuvXhPiXJOzos2Hsrw6YcXtahdjlmS/uO0XxFo64BQoPnjSckPR/2BEGJjqv0NlmtVqzZ0I=@vger.kernel.org
X-Gm-Message-State: AFuF++l2VyIPshP7KtW7MWUxCit/u2NbeskxEKfYHfNxSgmknYTTrB2Q
	vCLckoJEU0528wFLm7w2kHMSBF4P464bYGP5NCzIXrPVNtxJBpvffjy9
X-Gm-Gg: AYBFou0yt6yx9E3wB/vR8hQlLslYM4S/EMQwB9QzsDIhWt32IhChwHRMJ3p6dFs/1Q3
	auOIZBspbbYM5HL69LNoxRCcxClm3QJmUBWma8FU3BI57r3DBweGO1tmGEXy9xneg3+ECV5wrWg
	keO1hj3Yflt6+/xKSs0/qTYGxlnqJgbrNGCJuWfQ+cPoZ0izabxa9LhJdyvIQ4CuCMIdHeqjz+U
	0VcrJmk1WgPdHN9yNQiAdedaDXY1J4853j0TqDKah9opmkDt8NEp60JPnMT4ePZ4pV0P9Av5IZp
	15UAgc2vjgpkH2h8Fp7S2VKH3Xgbh9p/jmQsScHINQ+x/dovK5fnNOfRC5zY13eqetMXdpSMTGD
	qzFgC+bo+fyvsi610bsM/UGkUsOw+QP38bg/X9IY8+h+q8xcmbarCKsrOacMwVyEecJUt6MSQBB
	boY/sWot+qSxk6JbS54KTR3bhS3oQLYKe6r3dO/rN+nFokoSTYxEwKRxoY7Qplg6d5CPwbnFksg
	qGMX4mI+GyAFbFW8jfDqOC79DiC7U3qvNYueTIeb4HaIvlvA1F9zCiKFHF54bGyn2v1ov3T2PtO
	WPtOcYslVesx3EcBJ0v3O2NH7ml8v120QoIbWX0CDQRLXeRWnaBqQrmpcMLN110liAA=
X-Received: by 2002:a05:600c:8b05:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cf82787camr96628895e9.15.1788570603897;
        Fri, 04 Sep 2026 18:10:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4f2-6901-14a0-23ad-a35e-aa8c.310.pool.telefonica.de. [2a02:3100:a4f2:6901:14a0:23ad:a35e:aa8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm183156455e9.1.2026.09.04.18.10.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 18:10:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Yang Erkun <yangerkun@huawei.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: sysctl: Remove obsolete sg-big-buff entry
Date: Sat,  5 Sep 2026 03:09:52 +0200
Message-Id: <20260905010952.57451-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sg-big-buff sysctl no longer exists. The documented SG_BIG_BUFF
macro is only a compatibility alias and changing it does not alter the
driver default.

Fixes: 50209dec14f8 ("scsi: sg: Remove deprecated sg-big-buff")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e9..d9e9b12136eb2 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1334,19 +1334,6 @@ seccomp
 See Documentation/userspace-api/seccomp_filter.rst.
 
 
-sg-big-buff
-===========
-
-This file shows the size of the generic SCSI (sg) buffer.
-You can't tune it just yet, but you could change it on
-compile time by editing ``include/scsi/sg.h`` and changing
-the value of ``SG_BIG_BUFF``.
-
-There shouldn't be any reason to change this value. If
-you can come up with one, you probably know what you
-are doing anyway :)
-
-
 shmall
 ======
 
-- 
2.53.0

