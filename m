Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4C238E10C
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 19:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772997272; cv=none; b=hdr51kyVDmUGRO6BJw/bojVkHAsVWOuGlQjGFI2tp3zZchxqXkhR2DcgmvqzZNAX+sEntHcSkgvojbIFM6eVmsyNrHHDDBOeCjqkAw44qYQXfl2nH52wm/PFyL3pGXABQEcR3SdaZO1FHq+OyqqjWpl1YaPpgGSxGZOb6wmtUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772997272; c=relaxed/simple;
	bh=AzxKAZm/nl7pcn7SMGa+wkaWx2pzjLH+P7jHPWrIvAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lo2voS45aJxWLJiobFxa9jdIC/uMTqa9lgH+hyHhHkVe3oTH6msCCfzpmYcKiI2o4QqmnsAGE3g6YkthVFtyzp/sUOqUCsSNCw9KH4DBPWoKSGFnj64eZ6nWrqphhCC1tBHCWqxaLdBiMnU9Tb4s3YwI0u0WC27VDe84SFsrJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIAnezaD; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIAnezaD"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67badf2d5b6so406116eaf.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 12:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772997270; x=1773602070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+q0dNvBbupC+6tyHU0OlnBS7KtJOe+yMxAJG2X59mY=;
        b=QIAnezaDpNaKZ7Vcfi8917jkkI9tFX7hIQ2raI7r/ErUmVkLhttIOd6TBhFtK6TBGE
         ah08o/b1bhuZplZJQfOhJkoV9q0TSOr0mPz4MNL2Pyfw21R8r85g0QDXa3td0mGgBZH7
         OWhg6q5A4/Zep9sD68cIIRGTDO89B0yAOeKA8q+UktrC92De7UjGjlGqTiJ9E4Ac8jhn
         d62DXmL9lxla2ILNvHkK1EdH20bAS/uC2cWmz0ChgQvMHcLiNyIU7shez4i5OVdQ02W8
         3UHwzh2bnDZ+5Q2k5f0swj0QD7mL2NiDzbbkp0llavQbOqM0woFIWI8WEgQ1yuc1LcOu
         igiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772997270; x=1773602070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+q0dNvBbupC+6tyHU0OlnBS7KtJOe+yMxAJG2X59mY=;
        b=wBWAhGJndCw5bVNAfvw9svEjfWqvfm13X8TN99x0oChQOFTj/YNNDGwXol3FCkD7tv
         yacgCgP/MUEmc/RdN+1ejmVqxPgEjTwMOTihDiso0ksm/2R8z4GVMjY7b0NlGNSMshRd
         UNCIuOe4xQYbsS/WEB1j1adGop0lS00XZs/jDZh7eclheMCwrMDBy1oaqByOoBKWK8sK
         DIil1weuWQ93w1WJR14wsCVZ0uol28lRwbJyjAh4f/B90xPCmsGb7nUdlO8ijxf/SbkR
         cZ67XVDS0btPlgGp3dY2J+XfRF/SspE3ycaExnqbif2p/+B2OFUsJ95PJsMc3BNd7yvs
         b1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCFdzkgxJe/uSS1vG1aQkV8zkn5UXhusAcCnEVsNf13X/6SIFeNItZ++3O5cVxgRT1wdluUO+zOAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMX3GY7S1N45u2RHxwNUpQe8gZUUkzUV2rkthaMY3PGkM5QVI
	y9n1i4QRX2zfmITHXfdtZnS1qYEF++CF/Q3uqwnWj+Qr0RASgVduJqa2
X-Gm-Gg: ATEYQzz5NJ6kjPkoCgXhfw1NJmMDxrUTrYew02a0u9NBvzasb2nPGgeouyQjYqrrKU4
	RHqBxlx+vRt5mCBuaoOCbHuNzNYmF4OHO0qr5gzDKo0oX3jTxIbFRKwzJs3YN4zyZbSW59RzVr6
	B/13gps+sAyHXdiCig2nHHoxuq7euV0OHSklAdzeLraoCH6mDs1RTVX+wTa1r92OwoirG7Cl35H
	lRp/yREvz8v/nJ6W4HFqljaq446q5IqlKkYP/0uhzXUBkhWCDVnQeE+sZTTrtdpg5xhXxGkeWCw
	RgLAzSHr6B1oNQxfpU7rhjkx9mrSz2uzLqOR3vfdNLQ1IchbqAslTt/tX9ds5rAsgv24een6jEG
	DcJU2RVkUQ1TQD+9oTXoF7kQeYFnDdGBu0KQ0Hb/40IRoycJjnDyK4sQK8oaqDuZxzf+E10VJmt
	LF7d7XDLA/S9qD4jmOevEz86nOMzo3HdRvlPyJDIspTqSNNxEeAW8fuYR9AHbLJN21pAR/1V3/D
	yT8KGvs9+AF
X-Received: by 2002:a05:6820:2901:b0:66e:61cc:80e9 with SMTP id 006d021491bc7-67b9bd22714mr5309000eaf.47.1772997269962;
        Sun, 08 Mar 2026 12:14:29 -0700 (PDT)
Received: from ShravyaPC.. (r74-192-25-180.bcstcmta01.clsttx.tl.dh.suddenlink.net. [74.192.25.180])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bb230e0f1sm943936eaf.13.2026.03.08.12.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:14:29 -0700 (PDT)
From: ShravyaPanchagiri <shravy112@gmail.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sgoutham@marvell.com,
	lcherian@marvell.com,
	gakula@marvell.com,
	hkelam@marvell.com,
	sbhatta@marvell.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ShravyaPanchagiri <shravy112@gmail.com>
Subject: [PATCH] docs:octeontx2: fix typo in documentation Fix spelling mistake "Crate" to "Create"
Date: Sun,  8 Mar 2026 14:11:42 -0500
Message-ID: <20260308191142.172363-1-shravy112@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: ShravyaPanchagiri <shravy112@gmail.com>
---
 .../networking/device_drivers/ethernet/marvell/octeontx2.rst    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
index a52850602cd8..c31c6c197cdb 100644
--- a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
+++ b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
@@ -323,7 +323,7 @@ Setup HTB offload
 
         # ethtool -K <interface> hw-tc-offload on
 
-2. Crate htb root::
+2. Create htb root::
 
         # tc qdisc add dev <interface> clsact
         # tc qdisc replace dev <interface> root handle 1: htb offload
-- 
2.43.0

