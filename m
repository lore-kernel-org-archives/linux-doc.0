Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C0439C64E
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303904; cv=none; b=A59DAEPswFBQBcTgRU/RGRkWPKqyWeoQrnmhfNZa8ieGJlpGU40t0GOzb1vYMhOR8Z5PSVoQRQxw6EM+NiZjW0z5OwTrkmyjpitEQNzIe6VjXr1kXhn2UUvOQI33dn1BO50OAxRF4N9KEil902ACyWQBjeREdh0HJoSyR6JcmZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303904; c=relaxed/simple;
	bh=Tj4U2LsAV4so3kyGIEzWI1tMb2igQqarbhEpNBc/hgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSdMb/b68RyJqI1sYETVH/C3782LDV4yz3K95EFHlRyctjX70tHuRH46cwsC+EY3oLa7ERjZc1v1e53V6fq/T34Ihfk0ceMXyu7OXlsPp3xLoOBo4lC4FMMwMxpBZqLcBipPrW/cU96r17xCmuEom/Qd2irEj2X6KGeVku8a5VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBUgGlPx; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBUgGlPx"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-662bcc30fafso930749d50.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782303902; x=1782908702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iwM+oUr92p0Sav8gRLsM0TI+WWKv0eIk71UE2GR8a3o=;
        b=IBUgGlPxhkclhDRuqyO7ZqN+SgRuBARP//mRXpUcRtqumr4G8SJ6xMwhp9HU5HKTI7
         TP85gLzlHbxLe/rgGBFeMFRn8qmE9sjB5AvWlodunUVjnimmztmkCKUAcNIQpTTcDbO/
         0+j26Us7DeA/SRnYG4zT7r6/Ofq6QeVwqECryIzas0LdQWMIHJLcD/+uTVVJ2wGtKRQ2
         VbVcWilFEeAS9K+h54y6No67bEjdnl4/jgPLSZOAiWdsM5dRaaoRK+yNiFvzw0OR76z9
         YmB56ikzWI6Rn+RSRh9U2KmluILFKw8cnMfVk1Fy0SeeyeTDR8mie6hQuYNl49y7FWRG
         J7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782303902; x=1782908702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwM+oUr92p0Sav8gRLsM0TI+WWKv0eIk71UE2GR8a3o=;
        b=BPkZdm4jGhYoqRz4nDxl3xM1suvR7qc2Kj7Mhak0vGM82/CnQPrJvN3XVYOyS5eX/b
         6P5EIcTNVLgEhUXHiCwOSsBzkm0fKQ/oCC+uz3JunEdR5dXY5QQ70y7lWI7CZ0jVaaBV
         fUqkMTZTBVVgBF9IgogiCPKGTO3wkvZ7teoKHtLxO2kfJ+AQWDH5gvdOmZRRmT16SITh
         7qMuiyIglQVa+Q6rg6nGCeODgDCTyL4DJG/QRzA7LuH6QL4L44jIa9iNDVIe4Ewa7wrS
         xWbrmSJQYecW8u5HV1mDU847919Id3LBI53FcIAIylRIgEw/+5L55vt+6jhoJsDOFO8L
         Y4CA==
X-Forwarded-Encrypted: i=1; AHgh+RrJsCwYfDhKWtcE0BdbblUI6nJplbRgVB2HlU8flSm/1oNs39OmWdOwlCQFxKEYEQdcrcLfC9pzSj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuuUAsznZVxZo6PmGIuxIrAtfuz43wRyXzYdaMTTfJR/jsyZz
	/Y2kGRyLdYFrMdFPyLiOAPspVygPxfj+CQjVIS2eulF1o18jiXKDWBKRbYKJ5npUrWZCiA==
X-Gm-Gg: AfdE7clEyW6kjTw7VWRgevnbFXyOwZyH2G5QBSZfcZxtGUKWuTB3ebokTh1K3gEVLUL
	dKWXAMu94dGAEdSrHfhSOg3UNQe64FyqQPNRGsA7HgZDFAiK0RQJzsJKpavsLYOYQztFyk9dX+6
	Vq2Soe5Jf73zr/zDCNean2iAJIFKis9ZOAUgzSTakQeYNr8dlqVnyhukBE3BXdxgVRI9Rz/qj90
	Znz3q3mdFU1Q2HHkPrw3GdTdCvm/f5SBW4EauYC5xePzYOl571tv611rXD0xbZJJ2KmlA8IM8ch
	xNcvOVRm0A2ftjjh9yF19OYIGwLgT3igFiK3F7j9y5WpB42NrnRsxuIAWat7tQUxUmeWK80jAqA
	UieHJnBxPSxEmzjuBjt+qJv4yXuZ5bPE9RiMTP8qMh3IsyxMtqPUCh15MHqaneg4AfodMsGSsU1
	cjrO0GNysfgS5wkw8e/Xyw0tizF8Ib5ZZoHW7R
X-Received: by 2002:a05:690e:d0f:b0:664:77d8:ffcb with SMTP id 956f58d0204a3-66477d90f6bmr543453d50.30.1782303902078;
        Wed, 24 Jun 2026 05:25:02 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66469fae706sm340980d50.4.2026.06.24.05.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:25:01 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] docs: kdoc: fix troff output description typo
Date: Wed, 24 Jun 2026 14:24:48 +0200
Message-ID: <20260624122448.4853-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in the ManFormat documentation string that describes the
generated troff title header fields.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 tools/lib/python/kdoc/kdoc_output.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index de107ab4a..618b0d765 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -624,7 +624,7 @@ class ManFormat(OutputFormat):
     ``manual``
         Defaults to ``Kernel API Manual``.
 
-    The above controls the output of teh corresponding fields on troff
+    The above controls the output of the corresponding fields on troff
     title headers, which will be filled like this::
 
         .TH "{name}" {section} "{date}" "{modulename}" "{manual}"
-- 
2.54.0

