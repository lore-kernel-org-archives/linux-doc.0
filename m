Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63596341058
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854787; cv=none; b=TVBw53bLl+hqZKiYUOE/Dhmw9ptI0obrAfVARuK4B6cdKMI+8MRQj3hSLSXRs3e4XMvvKP+AOYt7B4/Ux+b1Uvp04HImn+tSS6zbyJCjAKrsPefiynneGtiHQ7xFhQZHcLJbJDJ0S3Oq65LmzRxWecF7P527p4qiN0z8GRps1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854787; c=relaxed/simple;
	bh=HuwreLOCesYUzRdxcqCAX9xH3VxSHq9ChXGK9JlVYoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S/J75I03uUs/A06gwRYZqz5Epl1ePAor9zRQQUwcsTqqb7m/xroq+PFk5A3kxePUYDtozIw1WEQBirvvLABMxzgnyUWNSrXLCFo/GXRQ+mJG0qcKsGP/pplVe4zCqSrUCqKzQ7ZpD6FyvdOJlkLbsPIJbezuYJNIll3No1QaKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmgjuSPN; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmgjuSPN"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c363eb612so2020245a91.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 22:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767854783; x=1768459583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxpXQemPdTvWLFfDng6fHxJfs5LXihweQUHuOs+enpo=;
        b=GmgjuSPNR5sx/eemprYDGCUI25yKl9uUnfI0vNfmYmovSPuqHDWzvXkAjxtrZ5TwyX
         SaqN4kgUez9kzY8x+kRGeHG21KovRrgUMHqqJkN5feMQRa0kw0kie+xJX0bE70+U0BGe
         eGQFqVzcWgGFPYA7wlP7zIWfll3rzkbvwoJgjVjuoYg71I96UGdp1sfw79rCSX8FB0Qf
         gKm/QcwUr1zxgAlzB0cqHa71CTkjqSvW+/c2zED7hGpa7mhXHAvH2cqwumDAl4AdYzb8
         AOuw653euaoFi0twwGgd5gdb1Vf5v1HoeYWtui+ugvrqHEu+5s321PF+XmdETWnQ/cRn
         FflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854783; x=1768459583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxpXQemPdTvWLFfDng6fHxJfs5LXihweQUHuOs+enpo=;
        b=PnBWl1zn5ax0PmC8nNNfqoZWyMSi9e0Rm0PiYMijKv9SJwDElFynwAS8XDEktuAg2I
         qc0zwPDNArb1kEEZDhUuyW15vbmQrwwK7oMsTUvH3u40JyaFzaHA3MMODnQ+NbgIUS4t
         u+YSz8n93mGMIHHpMv3Fx0nATqYwV0oGxCiF2o48mMIT074mMNwPqdZKCEaoigGuLqEw
         5MyYnqlOppVBbKZV7zxQISzRoFdMbmsRe3GtXMpx8BjMOweKcpPnIS2RgPVaMCnk7XPF
         JfvaPokWGvm29bk1VyrnfwImDsydrSyw1CMmKxrnVxYnuP0wgXem+bpww5jplZ2NQjLf
         JgSA==
X-Forwarded-Encrypted: i=1; AJvYcCVzP5bJ3iASjhDUGnc57jkLQW4TJu+hzhe0gOoPh7d0rx2McEjpqxgcqCGw9y72p4QydalG0IOWS0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeyRPhwue7yFgk6w6X+DHSu6rPaFs+ku/g0n75ey/MTCxq4wHd
	WyC1UNi4exyyFh2PPLnOEYAnkSLcWW1XVClp+6DPoxU6JGLiDqi12ONq
X-Gm-Gg: AY/fxX5doO82ykvKt90wNRRSCYMvV7jFqANHclgHRukeye+1yveBnNysWCU7ZiTMwmV
	kbpl3yr89cKSVCiPGkbs1Ur40r1z90eYQ3xXcmZdqpg27H35oqyC5nQkDm8x9aOZMJrfRZ1zrQR
	Bzx13tdP3ybQXKD9BFmpPNBvb+p5X1cwEvDPEaB742trCZhvDyzriiHjs0vcjfaFwpOoy3E81eT
	FnNywJS3gExwfxOiDjpQ7GUP+yz0Uf2elbd5XKVBCmLgKzArR0oveujMWWAaOlgepBOs3/dVNK6
	sElhuD9zLRGJlMFeq44iviY7KrFIerWYSM8gAGQPhqCkCXoIXIX6aTN5CwF0rnKti2/IzUrvOV7
	ImcVGfF4GraowjnZRXBLsqQ+/lRam92RIBHLcbTw7VWk0fEo1ylYB0iEHPOBTN6wz9TrawYP8zH
	OKDCzpjftKl7wEFUdPegu5Rnmm4rW4OwONPfVVC6YGJAbUQMC95MSUd/b8X8yg2sQFv5BlKO1dQ
	1/YQmdi/mGh11H2novhZg==
X-Google-Smtp-Source: AGHT+IH0Gj7DTrllqxszReqvQe6A3j2ozg8NfGraN8JTwfnk8euNwr8hUVDMVbkdxdlFOEyUdpnuoQ==
X-Received: by 2002:a17:90b:1d82:b0:34f:63b7:a1f5 with SMTP id 98e67ed59e1d1-34f68c001a4mr5009951a91.21.1767854783456;
        Wed, 07 Jan 2026 22:46:23 -0800 (PST)
Received: from Win10-6700K.localdomain (softbank060114050097.bbtec.net. [60.114.50.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa78f4asm6802019a91.3.2026.01.07.22.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 22:46:23 -0800 (PST)
From: Daisuke Iwasa <iwadjp@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Daisuke Iwasa <iwadjp@gmail.com>
Subject: [PATCH] docs: x86: fix malformed table in boot protocol doc
Date: Thu,  8 Jan 2026 15:46:14 +0900
Message-Id: <20260108064615.144113-1-iwadjp@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sphinx reports a malformed table warning in
Documentation/arch/x86/boot.rst.

Rewrite the "Assigned boot loader IDs" table using a simple table format
so the multi-line entries are properly represented.

Signed-off-by: Daisuke Iwasa <iwadjp@gmail.com>
---
 Documentation/arch/x86/boot.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
index 6d36ce86fd8e..18574f010d46 100644
--- a/Documentation/arch/x86/boot.rst
+++ b/Documentation/arch/x86/boot.rst
@@ -433,7 +433,7 @@ Protocol:	2.00+
 
   Assigned boot loader IDs:
 
-	== =======================================
+	==== =======================================
 	0x0  LILO
 	     (0x00 reserved for pre-2.00 bootloader)
 	0x1  Loadlin
@@ -456,7 +456,7 @@ Protocol:	2.00+
 	     <http://sebastian-plotz.blogspot.de>
 	0x12 OVMF UEFI virtualization stack
 	0x13 barebox
-	== =======================================
+	==== =======================================
 
   Please contact <hpa@zytor.com> if you need a bootloader ID value assigned.
 
-- 
2.34.1

