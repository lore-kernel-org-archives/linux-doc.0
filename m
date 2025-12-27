Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB32E17993
	for <linux-doc@vger.kernel.org>; Sat, 27 Dec 2025 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840148; cv=none; b=Xnm0Pw62qZvxARkBkPMAKBN6BfAFx9Id1O8/3VxlSZCm3o9Y3JpNWr501zS+iVghxK88hQ1avlvsJpSvra1yiBHWU37aM+I6d9aHZuPeFxsbVgdo1Apycb5GOQ9hQFQrrqKzgtPH1z/pWrt7BnL+c+o+yAn8DjTN109F5N8ngm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840148; c=relaxed/simple;
	bh=a4t4aeiqwYHeKbZFJ8E2uM1R3FbuCHOHNu2himfx/x8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q9ZWtJJfu9VvcpJZKBk6ZNNbrTaU51XlC8CcmWcqB5qh+ZjjEFCz6vcJXvjxK+tkS+aDfyOLTxP8k8zaRLjzJlmMzvJ0Aunb8opqLHKtUHoGQzxOElTr0eCn7Tx/bg1Qms021LxdtwmTI+ZuzpsFp+OcTYiIjoEmOm5cb3lQ1eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BytbE5zc; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BytbE5zc"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-431048c4068so4265386f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 27 Dec 2025 04:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766840145; x=1767444945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IueLC0I+lVb6Qbt0ks5icQeQ9Cq2EAoaOypYMEZKv38=;
        b=BytbE5zcx7GlUJxEUUrRow+nwWkkQZcIP1f7Q4I49nNo+c2uqvB/HGqq9UXPF7mNqq
         mgNERIjkdFqT0OJjpH+zK0aej+adN0c+onGAENwDFnt2gU+dKmjDSuvN43K0U6EjPBIY
         YsvaPbgXwJAucRDCnlKYTNU6x84MekT4h+bJgA9D2+yhLQw9pf06X6EoPn1ot2CLQtln
         /hZ4AW658w/6PWVHGj+/baE660ZDrp4+TOprxOhyXM+nF3saANxWt8N2YINiKxFBUq3W
         ac3J/0CtHD4k1k30MpHIM3Ots/aK6FhhXPaaUdA1/idmiA2kTJPvxKyUWX3BTTBFEhnO
         DOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766840145; x=1767444945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IueLC0I+lVb6Qbt0ks5icQeQ9Cq2EAoaOypYMEZKv38=;
        b=Oec/hVwa4X87di+MZic6E0v0XFfxVSksyTpuASqbRoS7KFmTRO3kN5D4vceOlIYZxk
         cAPZsmunV6JBqIIG9x1zIpQW2v+maO9GKOjsqjHJsaOd0Y01U7X5RvqPWYeAoEKGlHmC
         dw1x56zYR+CZNQY7khrGWIZ+zo1vJK++cONXJeM6vLKMXyvwxbm80Pic4AdaLQlgO6ra
         Odgx3aEkVyT5wJQX4YpCc2ptfMleKUMKuKoyDV3RCmwJg2WV3kGeL234kncfB6NgX7y9
         7cYBflZ3FEOENNqcWmIrruhgtRxmB79x5JcVkDuGQFC/N/4ewYd1QrUndY8b1boEHeU5
         zvug==
X-Forwarded-Encrypted: i=1; AJvYcCXi5k5a0Zr9obFZjOriKplf6ebelWaoUglyeyLQZVoG1QUiWgiNtURdA3WfUJjmlTLOHTNv0G+Zttw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkLoXovbO5GIEG+Rdwl1xsvMNIwwghs3mXgfSZ9aZVw1MDMXl+
	9XhaGsbg+U57eSUIca/OBVw7C3Ikm6iSwj6erA9KV6x8UwWg2/2ZYk0n
X-Gm-Gg: AY/fxX5ZVrHLsfKl4YScOpvwuwRHKuG8HbbceJ64p9Ct5fq463Rnfb+IOlYu7Efy60Z
	xeZZ8VztvZi/QW6kysClYbKcooqnCmrOhW009mu/ER/FbWIYV9Sg1uh+618OD+GLbtzJTEs62SH
	5YihDlrX7bbfz1lY5wtU+lvN60TS68izfZzDngOqxPRHj+N2HfPV2hdw44Po714bdGyAvhpyas4
	FXzJQe7zuMwBdmcdgRyn0LDUOmatNi3InxkZIVZ44Z1NRFtjfI3fqyZk5lqkahXFd6JgaoyMZ+G
	QzWF2tsB/yyMs8Vaa2TC3QoSU6q3OStVsvHxAiPXqbIHMM994Y1IzJK6tZfNMFTyqybaId7YHsT
	wXnY3wPNKJaW7XhXBI5DIKt9Xj6L4xI04cG09nKvqL3szkoqV7i6JOUPF3ZTsX/oVagYG5D5b1k
	HKwUz6mZ2D/d4b0DIIB5OQ1k+XQTgn7pKT
X-Google-Smtp-Source: AGHT+IHOEk0Ola8X6xsiCBhyLaJzjrT5S0J18Qc0O5jnYcRHADmYVvfpoRPXZ5oRkSUp1TvFis0x5A==
X-Received: by 2002:a05:6000:2dc1:b0:430:f3bd:720a with SMTP id ffacd0b85a97d-432448ca08emr34327091f8f.27.1766840144987;
        Sat, 27 Dec 2025 04:55:44 -0800 (PST)
Received: from localhost.localdomain ([188.51.201.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm49548534f8f.22.2025.12.27.04.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:55:44 -0800 (PST)
From: mustafaelrasheid@gmail.com
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mustafa Elrasheid <mustafaelrasheid@gmail.com>
Subject: [PATCH v3] docs: Makefile: wrap SPHINXDIRS help text
Date: Sat, 27 Dec 2025 15:52:44 +0300
Message-Id: <20251227125244.6407-1-mustafaelrasheid@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <88fe4b63-13cd-47ce-8408-1e9d6f947b3a@infradead.org>
References: <88fe4b63-13cd-47ce-8408-1e9d6f947b3a@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mustafa Elrasheid <mustafaelrasheid@gmail.com>

When using `make help`, SPHINXDIR doesn't wrap around 80 characters,
causing text to overflow or wrap in incorrect ways,
which then makes the text difficult to read

Signed-off-by: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
---
v3:
  - Moved SPHINXDIRS to a new line for better readability
  - Added `-g 75` to increase the goal of fmt instead of 93% of `-w 75`
v2:
  - Added '-s' in fmt to prevent word segmenting at the end of lines.
  - Reduced width in `fmt -w` to account for the added indentation of
    `sed`

 Documentation/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index e96ac6dcac4f..377a449656c8 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -98,7 +98,8 @@ dochelp:
 	@echo  '  cleandocs       - clean all generated files'
 	@echo
 	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
-	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)'
+	@echo  '  top level values for SPHINXDIRS are:'
+	@echo  '$(_SPHINXDIRS)' | fmt -s -w 75 -g 75 | sed 's/^/    /'
 	@echo  '  you may also use a subdirectory like SPHINXDIRS=userspace-api/media,'
 	@echo  '  provided that there is an index.rst file at the subdirectory.'
 	@echo
-- 
2.39.5

