Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008749;
	b=R3W4F082s97J6FN7sVOHWjRK2dzOMy/elcz6a2su9yKt5wzBBtOv/zmWejLEvItYX3ih
	 NDuIalMbOzXIZ0UvYRQfM784CjZ8Y2mu38+oUfND7oRFzzJO7jCC0agD8P+PAahqWpAGH
	 M+lmhxwIZCzsdcAHuqndZwS1XTc4GyCxYa7mx+wOAB5SygiKAqFUCZy98PepJOprPgnuh
	 3VVPrmjV7MPitiOLiFi/qZHkNYBJ4uEzVPgrTQFYHqY6fHJC7pQ/nigSWhi3HiBYXsg9n
	 L2IuVkIOz3YWjz6CCF3w54oDVLfs0OHlG/Ud0DQvwS7NsjlWh0ysNyX/88ijKmv9OXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=;
	b=DG9IeI5dQzpQ05L5coxdrItJpm9hC8bM0enXl9uVNiuj0+DSYnYDuIroLkxwDEjML+t8
	 /1o/FJjPVu73n471qZQn74f6hACjWs3Fs+TqdEvR51YG/rvDcqBPNQvs6awzPiqrCsj/C
	 Yx2fTBtNpE8i/U78GVSZWcw+9DAjNtR2N4RMosuPtV2kWiQ/sUDGWSTRjZfRnq7uMt43H
	 wfAjMoD3u64TlPlxyB48t3cDrrtfBzR5jZgyymSlsuTcKaR50RV6bzW5HnVFyVqGzhVPD
	 MkDSekXwT/VpF8paqM+5OVp9jks0J2og7mK6+PnKUlX62PRwz9E66AXVn8O/JB1/kTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGxGU9n5;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA797606A32E
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 23:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA797606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGxGU9n5
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so669980a91.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 15:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008748; x=1794613548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=;
        b=QGxGU9n5bMXNyGpxZMcIhFKYSHPSE6wXad1Ww9h4H3IBfST0d5SFet/ie8sZfkLKGI
         0ZjYJF7TUtSV9WvK3JTZn7uVtEGPHJLulPG0J97ngpjF4IWMpt9FtCRFhRhKWhoMJPuP
         q93UwrKVjCoTGcIcXQ/HykeRofzwRA+Ohz2OR5iGVXhd8xFt3suy7ybkjUIdgg5pvylP
         qLtwvb2eTTC68UoVcdg4eKkVeHVOK/BZCxCJkUfa3SifhNsAC+I7XXOEJV6/FKfsHjNM
         rcuyKhSfse5DNeJ5+QjYGmk5+C/g7DpOqeWbdA9HiApxbynnuG+R4XZIwvwgBiLhKsjW
         Khww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008748; x=1794613548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=;
        b=dT8U+BacXGPKNe3Zt8DilyQGoxHsxulBB+vagpx274tcLQnkguHD/n+8bbYb+FRQQt
         SXbDYM/QmsaLtSfgHbxuCmbI2/fNXN4SvBJyAIhx84xIm+J2oWU2+PNeeq9VCRwcy2HQ
         Xj7V7cFPMZUGCceizzHXc4MeaDH9SC5CmmE//Txex4yLscjBYGX9VyJqs98lziihhPE+
         SGzUQ5q3YWV/Ks60XoOMYbElK3R3uaBtyBQlZFP3R7gVDSJuYwoD+CFG02A5NLSkdw43
         v/CPEogTlHHB8/7zJihNVYC3+8OUCouC/1K3Kozeh/MHTY3Gd1QNVKQ1YtmolG+UuWtV
         f+yg==
X-Forwarded-Encrypted: i=1; AL+hErEnLiMIl2E4H9Inoyhg5UgCFY2q8uD8fXLjIArgjz6J1Jpx3bZZ/BKsBw25KodP/mO5v/OBf0ToBS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aMe81ig01O/xdl7H5m6JAvy+SXLcyH8nVgw811RrfhZt31f/w
	vcWgBW8vbGqHf3qJ8znBRxBkdJNy6mMS4Fg/LGdnb42Zd+bzbBRUAGvT
X-Gm-Gg: AYBFou1fkdl0rEaq0Njr53fM/jFbY3ksIgwa/KIeXXLYjYgft5yOvtolj1xfEBgKctI
	+s725MBKgsk6sUxavLPYJirm6gR1isBtRQ3wSFh0FuH0hT1I2h43tcI9Px+YsT4eARj1SZWBKkq
	DQISZdpFP0DHbMSZ/j7RLh/HbXHzV384E0XIMJ6dQx/FHJ7/TqhqmVphZiPS+WAbWAzL2nEi/Ni
	l9hF2j62/0w8xEHawc+29svlk5lis9XkK74k1O0f8jmENz/LWCiF9znkZ2x/WaTpzwPzE4cv0iW
	AFrHcCMyZVhP6jUIRJTYG/DFw945qZ/UXjvXxx8CMo8U8oTcVfuJZKhC7mB2+cTgo+jlhNGpYf6
	zc0c3lPW0Q8nZ1pcVacG2GmmSBu3YHgXnZjqJu96d2hWAMdhu0SrT3HKPJRV3vSde2evJIh1JoC
	QgLbMErPRRxy2jn4/GQEasexR9wzCxWWU8/Rpmh3UQv/+v5RmyzxnGGCQzUR61eb5oPsdNTwSgW
	pVvC8dNoFsV5mbCn06vNdGamU1myLj8QfKiyhlxF59yW+sWs8F3ghQPzFCnjpYzA74gFao39kZa
	XS6BwHyx2DMgXvWIJUFR
X-Received: by 2002:a17:90a:f945:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b0db6d7d8fmr3319728a91.18.1794008748133;
        Fri, 06 Nov 2026 15:45:48 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:47 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Fri,  6 Nov 2026 23:45:40 +0000
Message-ID: <20261106234541.1474324-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106234541.1474324-1-takano32@gmail.com>
References: <20261106234541.1474324-1-takano32@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GIC-700 #2941627 entry in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
that symbol and no code refers to it.

The workaround has no Kconfig option: drivers/irqchip/irq-gic-v3.c
passes the GICD_IIDR value to gic_enable_quirks(), which compares it
against gic_quirks[]; the matching quirk,
gic_enable_quirk_arm64_2941627(), enables a static branch.  The table
already records GIC-driver workarounds that have no Kconfig symbol as
"N/A", for example the NVIDIA T241-FABRIC-4 row, whose workaround is
likewise in the GIC driver.

Set the Kconfig column to "N/A" for this row.  Leave the row in place: it
is the tree's only record of this erratum.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..afea5e57ab95 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -279,7 +279,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

