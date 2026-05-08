Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD5140DFDC
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 16:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258286; cv=none; b=t6TC+Iq6pz3A2QcBMrS5P7Cu7DydPCRKs9aBixvhbRzuFZFvN3MBdnIZuoYRPFwJFtlM7Fh7i5565yDmRXnJsQgYrXo5InaFR0LFAl3rYBGWpaDzsY0kwAN8Tqb7VPHTHrPVtTgCF67wEvXrLo6aATfTKZTpDz+45UOpNv3DZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258286; c=relaxed/simple;
	bh=2rscKA+HFoNKvJIdGxfB7KU9JPY3WcmoLP0luIuuOyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPCVAwAGl7AiwgY4NP2Yc6uheJfBrrtoB9qXmZ1Ydjpupk7RT73ws2eTNgOcStThzMam09uKkKOoZanhxWSNsDCAHWNRQdmUoMPups32p723uV8w5SmCmIL8LVWlaMM31x1wRP1cIZIKzhBB/bIg0qM1LXjrHpcBPezrzN61FhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTV0zijl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTV0zijl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so24827445e9.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778258283; x=1778863083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd370gXG/ew4bst/9jBG2RgUI2ruyVHTbbu5TsDabnA=;
        b=GTV0zijlS2lYh7jf7K+sWEh5vdP5yvIxEa85tsIuO6CEzEQ6IzxDX06UwAed3SQR2m
         vvJUijtZZYh9fRnvLZn7/SbJ+rcuThMGRZ5krVYYXIg0gf9aoz2keH8mpAyRJrcfbHXA
         7QnL35tkXO119hxvPZRvk49CQzJYS+sV8iEyAftXwcBQeYleS1mHed8TSehhOLLhR6rC
         fcuPJUECcgyVEymp8WRHwX10rUiWRCQV3TOgWBXFhOwIQkhfV/aUkeLl8pCxCVrwvU8p
         SEggPIz3yHeU06blIFSBQvM/sufbqj59FOEKaVokny3nAchvXnfowRZ/MIEyAbK9nlsi
         E/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778258283; x=1778863083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd370gXG/ew4bst/9jBG2RgUI2ruyVHTbbu5TsDabnA=;
        b=I52Sl8hmSFs4f4jG+3PjSg0rpkwhbe/1KKsgEXJq3n+FZ9br/1ZiM51aXLAOzM389s
         MBWcUaxdyteAoldUCRa9MX69QsM4PgaiVgJhfdOudb71yjLRcNRKKExNwS4z619HSCSq
         j/WEjpFO3ZbJlWsynbMDYCmBO4kbNyWAvHuxIWt7dIecbbuK1QSYbPlXcT8WXadhaE4R
         4umPksm8vYUJToBP87DCHycszANhE8dguMwlB3FmClf3dMdZe3X2LyOvX4zFebWIOf5x
         Q60ivkVEKB0gAXKekCaN7iy4dsxeSqUIiLhB6KPLQsDVG18Y+yqB2B9VFyuzeg2srxMq
         xdFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bwP6ZrWeRPMHcMc5jc00HhgY1dRnj5XSkzm4vcZWDYXL+ncMwiWZyooVmnJBBami2F+VpjDlhoco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7MjvRom2gyXncXcWnY9DNSW87PxD7MQflZiQXOvFkjFla7Iq1
	+VCiJdUHa7wSyXkHdRQbYJDXjJgWVwpsqCZOEc+uLeSk3LZA6m4AmHOmG7G/Grt0
X-Gm-Gg: AeBDieuvvZedQXSsD4BrlgwXHxuaeiIHSIhPLhR4EMr81sDwA4l9MkvSz5cQ9Dhu1C8
	pdqLbTvgTJXDlrc0sQP+ruLCmuF1Mah7VxjX4F6xhx53IvQ9sbUvwgeJQNWXmi5Hnl4DUk1iLbj
	98QVQxFWiDeGf0ncJ06sxXo5dKvo5MQ9ggJrtGqVqqiAy/sQ8FxopcthUFV2LcS7H1A7DJYhX8J
	YQZZI2IwG026nVx7EZNZDbGNIInAHbXyva1WyCAAK+ACsYc04yOfytdKHx/s9ICkUnts2BSIOJs
	5bR7CQLEGMEaWMXANBCs65WGujddK5hr6iCy38CiYkWbaCCgfhiMNAVDaPL/ADY30JpeOMo4EDq
	MKrnIiVhz9V3ffnaHfEGeLzWKyeZ4pHZpv5ILLILK2KRY3FDpKXI+mkz43jPeRDsmNjMlR1N5IW
	B4xMKrxV6bpaPl32vGx6TElM4fMIYmKi53QSYHkOZb0q+ufLZQIMGBXoZFinrSyepJZ/G+pxBd2
	aB6bQ==
X-Received: by 2002:a05:600c:4449:b0:48a:89d9:a419 with SMTP id 5b1f17b1804b1-48e51f2e67fmr207369325e9.11.1778258283315;
        Fri, 08 May 2026 09:38:03 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd2c1afsm6333445e9.2.2026.05.08.09.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:38:03 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH 3/5] docs: fix repeated word 'as' in dax-hv-api
Date: Fri,  8 May 2026 18:38:01 +0200
Message-ID: <20260508163802.16249-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/arch/sparc/oradax/dax-hv-api.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/sparc/oradax/dax-hv-api.txt b/Documentation/arch/sparc/oradax/dax-hv-api.txt
index ef1a4c2bf08b..297515ceb697 100644
--- a/Documentation/arch/sparc/oradax/dax-hv-api.txt
+++ b/Documentation/arch/sparc/oradax/dax-hv-api.txt
@@ -485,7 +485,7 @@ Offset   Size   Field Description
                              the virtual machine to use when accessing this data stream
                              (checking is only guaranteed to be performed when using API
                              version 1.1 and later). If using a virtual address, this field will
-                             be used as as primary input address bits [59:56].
+                             be used as primary input address bits [59:56].
                 [55:0]       Primary input address bits [55:0]. Address type is determined
                              by CCB header.
 24       8      Data Access Control
@@ -576,7 +576,7 @@ Offset   Size   Field Description
                                                      the virtual machine to use when accessing this data stream
                                                      (checking is only guaranteed to be performed when using API
                                                      version 1.1 and later). If using a virtual address, this field will
-                                                     be used as as symbol table address bits [59:56].
+                                                     be used as symbol table address bits [59:56].
                                         [55:4]       Symbol table address bits [55:4]. Address type is determined
                                                      by CCB header.
                                         [3:0]        Symbol table version
@@ -815,7 +815,7 @@ Offset   Size   Field Description
                              the virtual machine to use when accessing this data stream
                              (checking is only guaranteed to be performed when using API
                              version 1.1 and later). If using a virtual address, this field will
-                             be used as as bit table address bits [59:56]
+                             be used as bit table address bits [59:56]
                 [55:4]       Bit table address bits [55:4]. Address type is determined by
                              CCB header. Address must be 64-byte aligned (CCB version
                              0) or 16-byte aligned (CCB version 1).
-- 
2.54.0

