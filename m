Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321B757C9F
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778544607; cv=none; b=ndm6J6MoaBa1NnMK4KnuW8XSTU0X7l5bhlcO4UHa8wsKsEiqywbYuaVuBbY6w1ycen5D3zKve8RK+EP49zVLCkv5kRAFk4/wIeKuUL5hr0J98mzfY5gy6T5zBLhhqAFgdKwBGdPsdgJiYiSIfOKpo5FYm1W5j9KJsRA6VODcuSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778544607; c=relaxed/simple;
	bh=NpT5DDIgMZYXKfg64ziqp07ag88QIotugBwTmt5NXgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FVGEhZrmrgD1JeGFa1Uz20C2BgvoiVWMGN8d0FFBC4hjH4QnO/KqqtHw/SuSuqLoNg8GzJT3A5Cal+trRetF/hKQcAxFpGcxtGKj6Z93Hxt2HUSwf7+25EFDEhiCwaOwe5HY1sGzcTkrxyWLu6P71EJ++CsR1xoGBga0A3k7m3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcnvgJXn; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcnvgJXn"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83d5bbef760so1557363b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 17:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778544605; x=1779149405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KU/o4Rhfmxb0ycy3ieJw3/cjn7WafCI1izBYGYrMZw=;
        b=NcnvgJXnuVy3Vpx1aDaRXzb0Qnda96tEzikU+W0Yws61NIMh+Vk6QOgQSAAmsRSogz
         Bf+YyEeKnnGPm1F9TcQcjzwEc/DuT7GGnkXgYMD3KSPaWU3iKL8qlejZNtJZYu88m1kF
         aufgOdftTytGBNfwjPehwhS2VRfKDqnGgBdqt2zbH+SeMB53xCS+phBgioVAHmBG1OpN
         vF11dlIsl9qJVhgKXEmM3COoVqw7qiHaBjBd0+NXrwo80NaTAItmwcdqFY8ssH1bEs8f
         qLj24zMzF6cbd86nwr22SEtEWhKeXdtJ4pdQHLPCCWoWthJssp3GYaAIzR1q7TKTDt3n
         tNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778544605; x=1779149405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KU/o4Rhfmxb0ycy3ieJw3/cjn7WafCI1izBYGYrMZw=;
        b=dyOy4BMkQKJ65LV4zI9AnRRwYZ/U5U1brRYqb534cf0nbAOwnKs8fhtUNCgSBYe9I3
         O/E18QMrhHrMuwhwSqdA1O6IBKtrMP2Cjs814h9g3HWvOqPEhQLC5ACQeOY0CaWUZh6I
         0k20bA39sSASr2JdXtvIRlxSGGrDnvVjSmA/UibGmaxefyGktBsCDir5OtnMrfsqtIvF
         J6IT4NwojmSTmwDBgGdthjsw6MstTfIVmWmHC3/5ZJROuRg2kNI8djJs/jUFVtBLlWuk
         JDBP7AsMbPl8/RVpIaY9OnIt3wW5d14/A/Hcka6KETH94BX0bHq2ogCXWGPYqdaGWy30
         e+Pw==
X-Forwarded-Encrypted: i=1; AFNElJ9veUqPI+wfGZAd60KemUYgAcZabtfkE0jOwKfPaoR99U+JB5fQafFQH0cshC2q8tahN4OLTHYlFvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mz+QIOqIvZ6aL5HEVlWNgWa0Sn9qZ0m3RhSxrVDH9W2q3N1S
	8z2Vgtv/ZKbMs+RGsIhQbl2ejWdfcYk4ZAPC7VFqtwX0I2HM7X8NKte4
X-Gm-Gg: Acq92OEBWQpLh1TjOA2/E8LPYBrZZX6P3Poz7/H0WT792J5ThRZaiSAa2kowLVbXRLG
	gRgSSzhthP4btIa7W7lcYRE55qIDpkGPBjXc7x8DO5fVRTUpSJF59Sa7bLd0EWP6t0ceq+94czR
	96UGxR6/790LqXHkXrXDvORCOwbKvMkJWIMQDauO8rvHUIq0IXy9jVg2MsBkvct1gFfXsepuXc9
	vC+2uH/GPNKLV3QmzRttwx7MuHcJW8kt3/zY/F0hm99zSI6kHphtZrrzHL0LeLD/ezYffPx64ej
	hKXoQlugMUjutIIFdvG+V6KNbQRXnNH9NW29B77KoTBoRYbRJoQyZBrl0Nfmpa0cWkl9TS03ENu
	SwzcbTYiWCpFBWzhzaNCWlmhTRSY6lkz9sGQxSFqcPcXxBzneesjibr0BfDquWWB7Z1i3kzmSWE
	MJ6t/ssDL2LMc8lJS4kRZDxMV/qP5alMlXqwRQbVmSAsetd0y0QrDqigrqpKy1ggxnl2Xi3cus4
	8V9rsY1D35t21buQytPvT2g5/Dpew96WJQeoX65IQigKkL8GINqbUMA+EDGlJ6ELA==
X-Received: by 2002:a05:6a00:a0a:b0:82c:8c6a:682b with SMTP id d2e1a72fcca58-83a5b9d81ccmr25161179b3a.19.1778544605381;
        Mon, 11 May 2026 17:10:05 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-163-225.dynamic-ip.hinet.net. [1.170.163.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c1bsm26123777b3a.34.2026.05.11.17.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 17:10:04 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] docs: fix spelling of Shepherd in howto
Date: Tue, 12 May 2026 08:09:44 +0800
Message-ID: <20260512000946.3234-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "Shepherd" in the acknowledgements section of
Documentation/process/howto.rst.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6f50..edf4412de112 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -616,7 +616,7 @@ Huizenga for some of the list of things you should and should not say.
 Also thanks to Pat Mochel, Hanna Linder, Randy Dunlap, Kay Sievers,
 Vojtech Pavlik, Jan Kara, Josh Boyer, Kees Cook, Andrew Morton, Andi
 Kleen, Vadim Lobanov, Jesper Juhl, Adrian Bunk, Keri Harris, Frans Pop,
-David A. Wheeler, Junio Hamano, Michael Kerrisk, and Alex Shepard for
+David A. Wheeler, Junio Hamano, Michael Kerrisk, and Alex Shepherd for
 their review, comments, and contributions.  Without their help, this
 document would not have been possible.
 

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.53.0

