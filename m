Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB2237BE8B
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184588; cv=none; b=nEeqNQe8mCTZFlWgegPUyifGk1/xWcTIQVeFfOIIwaPxyu9rmutl6pMJcCq0A5kO/kNegj48dwzUbdX5vmmCe47fGyMAFv7DpN4WlTU7o4NAjYXdjiSSFLzkotdl3XgIrqAPsxOgsaKm4R1Lu5zlRtkAdET2HmG6d05FkHYiTR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184588; c=relaxed/simple;
	bh=0eV9AqpK35RKZnB/76UyjSxZaYNEAY0gXIsPPMoXI2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KwwJnX/DSOXMJOlQ91hONuSmhNhqw9fyv+bzEyinGbj05cqZtbdfkv6p5F9cCLMs2pd4TGe8JO3hHOH9E9R3pvIs3HN357T1Tn9iucaHCZgfO/TWpPNmF+LMTcZGntcvq3aRztZtGisWrUtGw0MK/SpIKOZ8AftsZuSVDsvJJ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqOwX8mu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqOwX8mu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48d146705b4so36298035e9.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184586; x=1779789386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH+BkO8luw30IjYS9T/EBrhJdlBVle0zl5zQekqFVDI=;
        b=DqOwX8mu9NA46hqz5o5s4w4bR7djhm1PoSynj2qOuz+4wd2lXc+4fQ24X8RGuiiv3N
         KLdYcyRAuwyX21OzfZ7T02DwNsgrg+ijUSmdo/MCkkQaE7QrlwnaK4aCFR/XIQnOv3mh
         csJQmJRDSu5lv7QR9WgcqgRv2orS0YdiEejUzSCTGQKj7OfnYCJcQ6OgOXoMO+kogRc2
         yQHmlY7gP967Setx6elMIZ7IVi1vYgJ7r2FDuZ/Hd9KYXYeYUbpLTS9GD2JScppgGL2s
         LtK05TOgNVXajV1JB2XqJE/BOmDXm8Jlnr9lWoLek/Pq0CYEHeaK1fF+ikw9UsX45nWk
         C7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184586; x=1779789386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZH+BkO8luw30IjYS9T/EBrhJdlBVle0zl5zQekqFVDI=;
        b=XcuJg8SpZ9KJ/rZmoBwbf5sN0m9ITtPIQRbHxGkbN9JRQI2Hj4vhkjXkmMSy7EF4sm
         PqjtmRxa+GT+W745dFRdL8Xpauimsyp8WQ518ZqiNckaCDb7mcaqv6vQJc/XYac2p/j6
         BhCbFzdujOjkgGFE+4kynunpqN7a5Y2bW1Z7tE3/CyWSX64yaeaMW3oLX39Qi83128cF
         09OxS+gpAQXD43efdHD6k7Exu3W2IRebCL7tbld5i7NSxfGtmM1msDTJwZXt+W8A1cKw
         Eu+NWL0mkYfajYiVT0llD/X5dtCztyFKuoPVZsCFUSH+dkch3hh62Hfgdyoy/+k1NdSt
         mWWg==
X-Gm-Message-State: AOJu0Yyj8bzamTRPJKOgduvRJAq/AVpUNSe5WOmFtVKeeRMPJrWuFUzS
	v+17/W5WPZjte2GWbla2oGUSlX2NsVlZ+GLQPN8eQPacExgRkya2khBFt0Y+4p2e
X-Gm-Gg: Acq92OE+Vp+uzPGLt48xeH70b11U9BYGzlq0anhN3KwO+sXvPvM6XFaz416HFmicW85
	fAXJ8lcSELokQcA3k7RK91o4aeO+zanHN3WyNgcv4bQgdFkea9s1WIaSvuHP5kNlZ4JgzRWhrrQ
	oaUPBMEBpUXW6LIrsLb99WYxKUqyrWL4e0GPaWEzqcDBwVpmtaORpqLWtQSllK4X2u8xg6SEIiZ
	iJ1T6KUewEzU8Pw7QpA6E3LXddpOyqAr1VWuK24hDMQdnT2xSgBE0MQVEwlI05Wu+l4bueHOdkN
	GonbDa0LljCyIqqtkOQjiTzqYBzOyX+MUj563YItYfZJ/tonNyvSfEq2GXf1WrAkoyNFXFFuE/2
	E7pCJrecdi49DxXCUNw0jg2V7MFAcyMF3LdoLJ06UL41jLXbF2sVAg6jQZKjCcInxANfKcxyCVJ
	bv80ESQHjhbBTLdBbPYycSf4gAVMMU8B8a6J8bDf2f12a+pk0dXgr5rb2tFDdsrNN4FDue+d+j4
	8CaVDa66UkYMZ4w1pdgm/qqQDgg
X-Received: by 2002:a05:600c:848c:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48fe60ecc19mr292313375e9.10.1779184585858;
        Tue, 19 May 2026 02:56:25 -0700 (PDT)
Received: from localhost.localdomain (wifixm-si-gw.uab.cat. [158.109.94.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf8305dsm149283005e9.9.2026.05.19.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:56:25 -0700 (PDT)
From: MigMarGil <miguel.martin.gil.uni@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	MigMarGil <miguel.martin.gil.uni@gmail.com>
Subject: [PATCH] docs: md: fix grammar in speed_limit description
Date: Tue, 19 May 2026 11:56:22 +0200
Message-ID: <20260519095622.9541-1-miguel.martin.gil.uni@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'This are' with 'These are' in the md sysfs speed limit
section to correct grammar and improve readability.

Signed-off-by: MigMarGil <miguel.martin.gil.uni@gmail.com>
---
 Documentation/admin-guide/md.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/md.rst b/Documentation/admin-guide/md.rst
index dc7eab191..003fd34f7 100644
--- a/Documentation/admin-guide/md.rst
+++ b/Documentation/admin-guide/md.rst
@@ -734,7 +734,7 @@ also have
       They should be scaled by the bitmap_chunksize.
 
    sync_speed_min, sync_speed_max
-     This are similar to ``/proc/sys/dev/raid/speed_limit_{min,max}``
+     These are similar to ``/proc/sys/dev/raid/speed_limit_{min,max}``
      however they only apply to the particular array.
 
      If no value has been written to these, or if the word ``system``
-- 
2.43.0

