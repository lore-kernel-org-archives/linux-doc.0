Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014012;
	b=AS0+g0uajkcl1zSHv1YB4dMglfq1l8OjpQ4HnoI8jkkq79PIHwYtqG/itURPxEINeDnx
	 3JLDJuVZ9jf4M9FDydBnSuuVJFLbXz8+hG2IG900ocyKotuw6WCz8oRZ2mNjKycttiX44
	 ynz0VgG2m/ZRI7xpIY1shgDcSFxelDp+NyoZcmW9zlrHQYBjpEMmdy+QEti7ycdw5++Pi
	 enDCsoZ3mMMQG+Dsfn8hbzPsexwovyEjkIaqPtc1DPXFnVv3GVwr6ujZ/I744gwO1TRPA
	 fPR59Bdlcj4ZOg6fSCEUz/LAZipvufnes7n7wWTKHW32pbP+cAzYNjsIGSFdmFBHWVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=sEilWQt6Xf8SeL6f3xmlWFKcnQWSknDf8DdIPF1cvBk=;
	b=lidNXnoZKXdbtR7z5InY47L2EyX9TZvuwsSE836O6yhdj/EHXGMgVW7B8XxJLu+/KcvQ
	 GiP3Y7s9+dnKYACOLQF2blR3MISHQ9mDQcyKimg9A4BK5JcqPOlIxjM2gQQxMKZvbN7bm
	 zbGbljKpl2LAPiZRmGOQnaMg7HF7AOlbATyx6quzZNxrqftuaaqDZMiP59dsXZt64Wpn0
	 KsMoH5ksHJOS9wbD2bSYiBgvKjcJOSPPQogU62GfmJTogC9+2jvaGaeReTmWG+9u6mOTy
	 K6lY0kwfu1wppCX/b8VY3AmuU5ferX0H53EVHfir2xJCSRoEsfIlPY9tPfaM9z+LDsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ip3R1yKG;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FA7606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FA7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ip3R1yKG
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e609985789so7953735ad.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014012; x=1793618812; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sEilWQt6Xf8SeL6f3xmlWFKcnQWSknDf8DdIPF1cvBk=;
        b=ip3R1yKGlZoaSpGvnTajMCMIJ8NcqyWohhMV+OctYZNpWfTXSXSbAQoD/6i6j2/bnU
         vuzAyTfUOXfcJdKl5OGTYTcw3JKNsR+YhKpm6Tb/6sdeL2l0EE5YrFX9SX8v0GEfDQ9T
         cp5JL7QHBdi4Kt+YgyRrMzlaLXZnukqnngDFh67ZI4iMawQYKI7qG54rWmyLOxWeL0Wg
         hLFs9ra1p1PbHQO6zgOPSqPPEZNU/DPdXNWOSFxpafz9HNexWLckfPQz8UFwolyOfo4/
         dCRAACYguNN/BbtYsoOZ8/p6qUmJwQvP6W7j/qh/4BHPsFe4y7b7ZvT8e8KNWPLxEcZx
         EOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014012; x=1793618812;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEilWQt6Xf8SeL6f3xmlWFKcnQWSknDf8DdIPF1cvBk=;
        b=GBxrQe1b7vLk1Umi1YLFVi2zw1E2r0V8hZAC1xNlSkhlLnkOYzMolffP29UQNsCrJE
         tZ1zsh2PtOfWjPswbLS1jP1EzUUyLr3ISesplqBtYRykS9TEIjxt6C4qu9VCqUCfQCzI
         6eUskt5LXp+H2Am2OOYKgkbYd4afAKIWOH76AkuvETKbShb9yjT3Xt8Cwb8PSvu0b3Kf
         bquyo9zJ94BpXE+uEwdlaX+9xVp6rt8/9zFMD6KGnHAaORa1J6pfReuRaTyHQQ/sQbs9
         MiKbUb/o839jgD+jfZk+e9vvGopzeGjFTNmGddCwzpTZcs3QREt86Gn/PIU2uUaF6aDx
         Yo/g==
X-Forwarded-Encrypted: i=1; AKwUvBztRR/Tr2ZK9czXZM8udH3HVerC8QA7UpeUCae55KGLPBGX3vgeqkmFTouTsFeWNI4CCX3a+JYwGcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg0OjvhBr0BvpRfpL38Q7XYEMnsd5VZeThezI5xXupdTGdCv05
	aDKoiGYtJf4eICIUxTzmEUx8KpYYPg6/EwD8pftD78VLS8Vr/dLHLsVR
X-Gm-Gg: AYBFou1VnadU1fIWbiAUgf2Ra1okoJmqj+sGi8aoCJI/qQdovTxYERuIl4fsSXWnDrK
	yadQHS5XMreHqwGOeon2zh3Ojw0/znSSjdDV/wAUsJmQGKzbjMu0D9vbyjYNvGT7jwO/7j0fEjY
	ZAHX86CzFYe6VKr8v5HYYGNl/QTHpF7nvFANoti0HRAmGLb0TNuAVKr0PXaKDYxV4C62dB2LC4T
	sZ6Uzqx9zikOMjjmmERe+f8E6Be4GDs/UAWgENOsE9yllhs69XBQb8a5hmWhHShefsxH/REtPR1
	HEHL0oMlo1PoLSReC8+TFwpgKroZpxZ5yHiMMU08C/Jh5s0JFnuYizJmkZ9iVKCp5+h2ESgBAH3
	a9Gmjinp/HrPogrrJfeepbcJV1+rTD7RfyWeyl5GAK1PYY/qnuJBCOrLwMokaEGsthQhwwURB7e
	m88w+OjVeXQI5KHUNg1wmpjvd67PWMkWwnbzVNqCjf8hIAvdknBRQ41m29H5Y65FsrwSt4CeWGg
	8IiqcRQddMF9J9y2tfcW1qPnnmExjrMZb/m8fdK0pETSdDmJujHdMaztX3xiIySBjF68ohV9Rsn
	LG0TKsOZoqKqwfxDZyykgJdqWF6RhIlqDY5VEebIaYGbK6z0Dtwy
X-Received: by 2002:a17:90b:548e:b0:3ac:8741:e2e4 with SMTP id 98e67ed59e1d1-3adeafad105mr5506790a91.52.1793014011466;
        Mon, 26 Oct 2026 04:26:51 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe9078asm7950626a91.10.2026.10.26.04.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:26:51 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] Docs/mm/damon/maintainer-profile: fix subject-verb agreement
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Mon, 26 Oct 2026 22:14:39 +1100
Message-ID: <179301327249.2.2109326531018240569.damon-docs-grammar-7@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

"The DAMON maintainer usually work" should be "works".

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/mm/damon/maintainer-profile.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/maintainer-profile.rst b/Documentation/mm/damon/maintainer-profile.rst
index a7c135233937..c48269032024 100644
--- a/Documentation/mm/damon/maintainer-profile.rst
+++ b/Documentation/mm/damon/maintainer-profile.rst
@@ -63,7 +63,7 @@ management subsystem maintainer.
 Review cadence
 --------------
 
-The DAMON maintainer usually work in a flexible way, except early morning in PT
+The DAMON maintainer usually works in a flexible way, except early morning in PT
 (Pacific Time).  The response to patches will occasionally be slow.  Do not
 hesitate to send a ping if you have not heard back within a week of sending a
 patch.
