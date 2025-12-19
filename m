Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A733A9D9
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766161553; cv=none; b=DU5Ayy5BfqhqXOuo+fpey5gkvlkhW5Cf8tnbEaiBpVyZ99cLHxFvSvnP52VgziwoVgBwxXIgUC3D8h6dEwinUPhcWE850JXQogNSG3VaAc9eiwGgf7AxF8vzm9+502NCna6ePKVWPCzcj0zz6I/eEHdnqHHpQC4ZDLSNlZ18T54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766161553; c=relaxed/simple;
	bh=CMK829RbR/cqodEMz1CQfod5xixxJSOxdHQqYlxeOn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aX6ctoN3/o2UGV2Rf3IlJ5A7UMxhY5NdHdNE18ONDMUp5vnr57oeEmTvkyOlYaD+JWL167G9WF5V6deYavQD99M1qBPYx6pi5jEHWv7dtwDr27N0hZ+FbuBQGNW7refgkyCh5ysOfmNBHleuuiojV+700WSrHDSguMNrn9khQ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPjxNK4K; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPjxNK4K"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59431f57bf6so2102800e87.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 08:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766161546; x=1766766346; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2sXGiLjEP33Ipi83odeXebzbV/gG4IuU75KeeEkNK0=;
        b=EPjxNK4K0qvKqCH33tvxPdAPSfen6G/Z/Ir7vm/Z1g+gBHfVwhMr3OThhKr+PSDtAv
         ZiYwDEzxihBcUMrE0h3xhSxL9dJygA81Ai9jCFzI3dmHPjKjafCRcga9dIMnI4X6skK1
         Tyn1bZ12NBmOUrKlGw1qb7fOZyRX7cG48E2fsoe++nqwNZ/HAJVuw1+sr1WMk/ZEItke
         vyl1uVZFrwKH10fwQZvIm+dxPontt689ebATJ6NKBkUT2Nj7PwY+fu6p8SmqxwFnR39Z
         D34NucGmzfqunb2DrBE3+Wik7XwvyL3ccPl0srICw5U6jdYhi3cjcupv8YCiKTPMmMWC
         b0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766161546; x=1766766346;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2sXGiLjEP33Ipi83odeXebzbV/gG4IuU75KeeEkNK0=;
        b=AF/ElyHkQYJcibYPKHSAXCCgdGXackqVo1vTfESMMx94RU5NWbAFNJRZNEQ5yP1Lzz
         VG2J9oOEwzBX4IYuZXXwnt/qf8HTcE8Ngq7CUoNBRX3QAHvrbV5z6BGbdqgOkzqLUFyO
         DxLT4OGzdLyM/P3U8nEfuoMSUkDrHEvSFhmzsgUQq/nUNi14KZnB3h3Lz5NiL1MJX25u
         0/D9l5/QgbPfvYdmBPgMOMo4OKQIf5AT8r3rKeTc++Tuz+iFCWr01TrSt5Hnr0Tb0iM4
         TO4fYYWhmRgWfbFfKVaHniQompYFo4lw+odMm0hiX5K40YecerXC1DQnBkftqcxP8rsx
         MmNA==
X-Forwarded-Encrypted: i=1; AJvYcCXwAF0qPFppIWyLWGwcOLC5h0tGhKKwVMQjAnAMd97HgYR67CMQiiuKVf8zQtYtKWDGsRFN2k4cVYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcRQblBvlnwigbZWdR52fOV4vnhPJ4cNmgpbc3AEKGbBRPnq1j
	xAfXMCPP8ig7f7q0Mg7D5c1P7rSKsWdtIdDpN6yntbXdRG5MvXOYNvQS
X-Gm-Gg: AY/fxX6dMz6hEyeTCLQ35ONQCZGNkQnQrpRymTZmdOKvumAkjNXgKeLslTMU3nHNorL
	5M2BfIBzBMXbVQqYwOEEMpeNdMKuaWczsvsbQq25ewm9SJs3hWwXZO0wxXi9EukHn+brJmmeroV
	NfZUoCwDQhw0hpogTdKG1EXYMzUgFaEFJCtWjEHRaasoLiNtzyQ/FHhPREvJs7WAUKIBXMFcyVQ
	T4cdqQ+EvwoNUQe4TJuwIGdA+VuahpiIibz1nA9nVjL2dZ2ZMl3e1iKdZYomYIuaL7FQ2nnMuPD
	oJPmVr4Pw84p2lE6lnMbsB19B+TDi1DjOlJPuAk2aXesb6lG8gbFqQnzwG+rDiEuEy1myuTxIuR
	n+A8S1f4Gtrwy35AkGLMhrrqDZMDafpoLiIVOg3B0kpiau0PTkzPDE8rFXz2SdZqEDxcKqDjyA6
	2tLH5Lzu6dcMWeCqTw/BFjH8bWt2K/ssxCANYsh34SmINsiPGd6J+JGlXH0PIjoVO+C8svIyXQf
	lr1RA==
X-Google-Smtp-Source: AGHT+IG/2jtPNoy3x3yAlpma5tKlPeGWFiiAw6R+w4li8UrT5buqiV3Zb6xaLXlIG3Rd42ZLm/IvFg==
X-Received: by 2002:a05:6512:b8b:b0:598:ef90:3ea3 with SMTP id 2adb3069b0e04-59a17d448bemr1162405e87.29.1766161545717;
        Fri, 19 Dec 2025 08:25:45 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (84-253-208-48.bb.dnainternet.fi. [84.253.208.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618cc2sm811161e87.64.2025.12.19.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:25:43 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 19 Dec 2025 18:25:11 +0200
Subject: [PATCH] editorconfig: Add rst extension
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-editorconfig-rst-v1-1-58d4fa397664@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGZ8RWkC/x3MQQqAIBBA0avIrBN0KKmuEi2iJpuNxigRiHdPW
 r7F/wUSCVOCWRUQejhxDA22U7BfW/Ck+WgGNDhYtJOmg3OUPYaTvZaUtRuQemMn7EcHLbuFTn7
 /5bLW+gHNHd2SYgAAAA==
X-Change-ID: 20251219-editorconfig-rst-652e40192486
To: Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?q?=C3=8D=C3=B1igo_Huguet?= <ihuguet@redhat.com>, 
 Danny Lin <danny@kdrag0n.dev>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766161543; l=1112;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=CMK829RbR/cqodEMz1CQfod5xixxJSOxdHQqYlxeOn0=;
 b=e4/YdG+m75XrlwJmZlLv+vWEPbBIP4Ci9Bb72au0dEzbTeHtnAcmlgljWcRXUQ44tdbewnijC
 g27SRHlRsNvDqvk5O28AfbYq3YMOd0FK2sYhb6QybgcIVDgi913yFI5
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

We have a lot of .rst documentation; use editorconfig rules for those.
This sets the default tab width to 8, which makes indentation consistent
and avoids requiring developers to adjust editor settings manually.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
If anyone knows why this should not be added to editorconfig I could
also send patch and document that to .editorconfig file so no one send
another patch because of this.
---
 .editorconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.editorconfig b/.editorconfig
index b5ea32b6954b..69718ac91747 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-[{*.{awk,c,dts,dtsi,dtso,h,mk,s,S},Kconfig,Makefile,Makefile.*}]
+[{*.{awk,c,dts,dtsi,dtso,h,mk,rst,s,S},Kconfig,Makefile,Makefile.*}]
 charset = utf-8
 end_of_line = lf
 insert_final_newline = true

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-editorconfig-rst-652e40192486

Best regards,
-- 
Kari Argillander <kari.argillander@gmail.com>

