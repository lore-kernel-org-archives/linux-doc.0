Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D9432C93B
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724706; cv=none; b=tLd8376ABpsjI1yY6WXUJID4sJBZZew3ShCvfOICtNz+fWT76zZXjzbML4PhXIRuRQECVZROwJpCM8BuNCnE/nOPvgzgVNkbjO9vt9b3W5vgeycVFNM9R9AIHzcBNCUFeBl722NbE49QoiRG5QGREZQ8m96aKWcYIie8CWIcyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724706; c=relaxed/simple;
	bh=r3dihmDf7EmTwHyOQk7Zkgw4snf1eF5k1wp6/pUMG+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PoAaB7/jQs6z/YTETlkWG+CuRAVlqGh+woZHkrSa3i6id+GZXCXKOwQ8toieBvUPq741uaRzCmjuIPnF8lxtLMSkDJTMVAlrYK17wo/TUORRH0vdc3EUtXuRazxpfFR6R0AgnLo2rqlAngPTyotgGrFJuROnqeQGdHkgcxwQz+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl4OBVZl; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl4OBVZl"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781001e3846so2129012b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760724704; x=1761329504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFIEDJTAopNEIqPSdh3Jplcei1xeOHRhpzrjHf2iOMc=;
        b=dl4OBVZlGLH3QZINSVf9RfP3FLWtOp1hDEcpU56LB/ck2q7dy7iBk85r9prlZs01mb
         la8iwuKAsdssVw6rtHthQhzwF7EJCDa1Q9XEH8jnWt8DM3bRIz8QztQZuuFM5sRWW0yZ
         iTUnjGWqvle8X7tUtXd7uZEGIKnIC2u8uV5KvdOcI6HasgF4rYo3E1Hp244fHcpxGeBV
         k03ssilvPliiIgA6beHebkKRwRUDuFOcmVMfyoBNPj7Wmm6V0E7NIvs9BJolOQjj8cKC
         2/QbVuopRzIeIH+xsiAmoSl0sOShQZZfn8vo0hsuC/oG7WDjE6No/pmRsYQ0Ddyppt1J
         5ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760724704; x=1761329504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFIEDJTAopNEIqPSdh3Jplcei1xeOHRhpzrjHf2iOMc=;
        b=MYD386bA4yXvev4S+oiAshLEkXnu7gemf5oKi5Ym5cVxbufXa4cB84nZ0/9lxgPCG8
         r+yOS3PhO6UNbyrVJIwe3pH2xk/cVEpAe2ERuUeCgpltNYtIRuLxvaO3arEuERX/d7Gy
         Tj4i4B9Kkw6BLtUYjoOOikqVKdffch205+OyKRB+QRxf5Jt/Qq5zSzuiTJzSGY6rbOFm
         HYp90gQqQyxgZ6EiXEYIrjAXW5IwkaQw/1RxOy45swhxQj+TXi6XkpU25g+wGEsQ4AoD
         yE/d0WoNQLPeJ/xEWWmV63/RQ/4pdXypmbuVU+CX9jvsF7VUBxJA1Yw9Oh4Dre/UApFe
         Y6uA==
X-Forwarded-Encrypted: i=1; AJvYcCVJf5qH6KUPfYNjBvuN9tAQHqCIfmNHoULebZwZTk2zakifn2uSfzTJt9uzubPkk+qOy5Y5l45wvM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxACEZelD2p70nJz49VhOk6pT8DNi9avocB8YKr3z9BA4jIawfn
	stvUy0e533lwAhUoEhR639cOiQVzmxxTiJTG2htfRcQk4GMCeslzDe0h
X-Gm-Gg: ASbGncvcpxFwi92veLaksL/fW2h+Fz8LiN60dzr0/xoZwht804HKQeo0n5+uKoUq+YE
	rI/61j67RN66hu9sKoV1yRWO5mbthoZ1lpsNj74fcXK0GBZ8NB1aIL7Fbr6UiKRU90RafY9hma+
	HMCfn9Gwt58VLYDh2p4eni0hkLsTjCsFjWBFdGC8sLPNwKUS8BALmvaGjBSuoZ2dmAooqoo9dvm
	dpTHGJ0f4ISkUlADfibs5O2StQO+XBL85wM20SeNteirzvhj3RARrZSzhEZs2FUeHZykiVpJLrg
	0sD3FMO7ZbY8uymm+zVq5VjSjGTB47bZaFJFNo4nq1ynaCBAQgQ+445QYkFB/cwNmst7+1+A4cX
	ioII690MYrEnJm9y+jNig+0sjBQglD/v5c5ZPc2DexInn5cSsnmJHG5bM0dxv7ZHvQSu8lJ49DO
	XU1p9tr/MpuGyNZ+qboGY=
X-Google-Smtp-Source: AGHT+IE1h8o5AFVacUuJYOfSDEzDV+0FD/VCXQsxR8OMX32EA6L/ZDfNJDJ4BWWf59gxnTA0758alA==
X-Received: by 2002:a05:6a00:182a:b0:781:556:f41 with SMTP id d2e1a72fcca58-7a220b07183mr5214886b3a.19.1760724704302;
        Fri, 17 Oct 2025 11:11:44 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24desm200093b3a.48.2025.10.17.11.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:11:43 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: zohar@linux.ibm.com,
	James.Bottomley@HansenPartnership.com,
	jarkko@kernel.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org
Subject: [PATCH] docs: trusted-encrypted: fix htmldocs build error
Date: Fri, 17 Oct 2025 23:41:15 +0530
Message-ID: <20251017181135.354411-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build error and
warning in trusted-encrypted.rst:

Documentation/security/keys/trusted-encrypted.rst:18: ERROR: Unexpected indentation.
Documentation/security/keys/trusted-encrypted.rst:19: WARNING: Block quote ends without a blank line; unexpected unindent.

Add a blank line before bullet list and fix the indentation of text to
fix the build error and resolve the warning.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

Tested by running "make htmldocs" before and after the change,
ensuring that output renders correctly in browsers.

 Documentation/security/keys/trusted-encrypted.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
index 2bcaaa7d119b..eae6a36b1c9a 100644
--- a/Documentation/security/keys/trusted-encrypted.rst
+++ b/Documentation/security/keys/trusted-encrypted.rst
@@ -14,10 +14,11 @@ Trusted Keys as Protected key
 =============================
 It is the secure way of keeping the keys in the kernel key-ring as Trusted-Key,
 such that:
+
 - Key-blob, an encrypted key-data, created to be stored, loaded and seen by
-            userspace.
+  userspace.
 - Key-data, the plain-key text in the system memory, to be used by
-            kernel space only.
+  kernel space only.
 
 Though key-data is not accessible to the user-space in plain-text, but it is in
 plain-text in system memory, when used in kernel space. Even though kernel-space
-- 
2.43.0

