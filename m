Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E351B3F39CB
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457352; cv=none; b=jROQf2dpuKBVKvgvcNKdMDDwyNB/CDFuHAzUHZygedvKhgSvbWiDlgwPwagqdvLRdZrT7gkieeFEKM+ul3Sr868eUHcvVGPbWFq2bs/k1sGGwBEpix8Y1tauIpW4K5j8zlBJLSzv5fsE835uuiig0c68k6w+6kFxlr/Ocb22kek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457352; c=relaxed/simple;
	bh=jG2redhEjCAzt/rTfg+v2gYbLiDjnuNP6eco1Upctx0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrFirPN3raKZKp2AfG24YuF/6lIDKTzXsnJc1l6jsng7z6YYCgQhslx1hfapIlzsVIY0pJP10zEaEJjwPPgOd0J/9FFvoAOT6uFyjQNmEIvTelJiEqxObeqQv03RkFUR3hh3gmmOlg+Q/+X2wfDEJ+D2r3t78f33lu9LjMKrnwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=lCflXLcv; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="lCflXLcv"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccedaf0b54so27714186d6.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457350; x=1781062150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeknQ7K2aMvDWr+2KhWa4BnSPX1nCQezxpcXmui2530=;
        b=lCflXLcvhzy3ULEDF2l/7xPcmX9O6D0UVGqZJgDOvrnCbQ6PH18DqXZt2JIL5bxmNx
         l02ccIVVgglDj1+u91/AAgreclkHHEfYMS735D24zwVQOFUDQlEwnhnOmCUGOw9PufJ8
         rwFleZViMs1N6rTznEwX8G/MKpHTz/iC60f3nqC+fUozhkBhYzG+A+WD7g3kycFHqE2K
         /rtSikOYsEj/uUuJ64rmkhCvSDoKqGJle4K9C6lFnzXl9pn8kNjMJurGbXyA4jHdWi1d
         I2sDiBbmwchzR5w/fvgfEuTOO3/LgbyEzWW73xgQOVuZXev6hmor7frzkiha6m4dmFq0
         0NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457350; x=1781062150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EeknQ7K2aMvDWr+2KhWa4BnSPX1nCQezxpcXmui2530=;
        b=ZBWwg5lXEXemT0noHwpigNXjVFRlU9GlWlCtwYlfyUlAeuCFyfFPbFUZ2/l3ZkvwDD
         8zv2ooAzNqbdMpP1+QGx8YmXG1NX7WrADQyKP/o0M2AO801psYvZ6/ipsV7ozxgpC6b5
         OQrDA5D5Az2cW5vJcyo06A0vwNBj2pQDR+XFfRAe7vwlqPZBT0dWkxlSQImwuZ4PAmsQ
         97dGgu69KMHmtOi5k3XiXlDHebGFT5sPtPSO0oxhxWGVELaPJ6DDbXm45dvNFJze4pYQ
         s39QoodhjtihrmHEivvRVgAnE6neUjQSgPZ/AfyJu7yLnAUpP5UzqNHuB67d6ziTBa/l
         7F5w==
X-Forwarded-Encrypted: i=1; AFNElJ9NqLWVttXJy1Ga/qMUQ7zbluz8dLW+iz6yF8ksCAysjLFx+6c9QROrmQx9h+jAGTaTcexJZEcnrzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCC7u9SYZuH0/r5AUPSdsUK+dkpKBDMZ0qO4YovPXii1cfYkn1
	JF1ObWH3Y0V6x+WTnil7QJoMXk6SQMoWjAit6xwsmGmbZhdoYuDwMkuinl0xVjTLrnc=
X-Gm-Gg: Acq92OHsCsfj3HQizAUZ7pyK+Jn00jxfhEguCJK/q6fzrC1yyJbItv/ynWz6oIdgf6f
	9hzBlHs4Bytxp8gPyC8xiGj6wd+L+sGiOyHFgQk10wRhW+vAJuTHB/DZ2/Nx1ACfBF9uuHH/Kmo
	tK22z+BAMI6mrIcqOwUrmH/IwajQHBSc8OUrz2j7CP3g0bjjIUM1oI/XMKbPNHhShdR4yAcuxOs
	WUTQBevaPa7Xa+myROn3JjBMIIi7CWjm2IPFLdP+kYi6KMAn+26eCik93Bc7PgJ4+mAQuF6Dtqj
	HxMuog6fmySH6UHtcxemDkbZO/YJmzNkMVEW0EiOplxMV+3j+w3jTO2LTdi1+OcSIWbYRnE1Eeo
	cxvThIcnpdb2yF81OLPcd20xXbzbS2hq7CF4AlK2wWYNfoyv9hyjlwk34RmUlIWQxCaIXlqCHvF
	EJX7zNKNAyRlRL6Gfvom7XTU+H/kH4Ddix8oSEAe9wKe7/JuEWyKinyv5UnR8hyA==
X-Received: by 2002:a0c:e086:0:b0:8ce:ade5:e8fd with SMTP id 6a1803df08f44-8cecdf0cdfdmr18753906d6.25.1780457349833;
        Tue, 02 Jun 2026 20:29:09 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:09 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v6 02/13] liveupdate: avoid mixing cleanup guards with goto in luo_session_retrieve_fd
Date: Wed,  3 Jun 2026 03:28:53 +0000
Message-ID: <20260603032905.344462-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603032905.344462-1-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring luo_session_retrieve_fd() to avoid mixing automated
cleanup-style guards with goto-based resource release, which is not
recommended under the Linux kernel coding style.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 5c6cebc6e326..47566db64598 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -291,10 +291,11 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 	if (argp->fd < 0)
 		return argp->fd;
 
-	guard(mutex)(&session->mutex);
+	mutex_lock(&session->mutex);
 	err = luo_retrieve_file(&session->file_set, argp->token, &file);
+	mutex_unlock(&session->mutex);
 	if (err < 0)
-		goto  err_put_fd;
+		goto err_put_fd;
 
 	err = luo_ucmd_respond(ucmd, sizeof(*argp));
 	if (err)
-- 
2.53.0

