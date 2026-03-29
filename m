Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D140DFC2
	for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 16:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803062; cv=none; b=PNN4vdnGtOCCTChSZg3kXEWR2FSEm1cGyKiiYycN7/QFDjKEC0cnYuhtL4RPYGdBot5eeO1335waHRW2k8arg602QRIUK14rwZGIS0+b1A942DH2lagzISs34VOcgmMYOGVgMNRC5GqEXHnPWaSurdqyf0QadeMpScn61F9B4MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803062; c=relaxed/simple;
	bh=Y4775iUE777RnDFkEtIrWMC+RHWSYDwrq4n2Xmvddlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLewl2Dufo26r1H1ALfancua9iTYJWCz2V5+JKY7SeQ2kzIH+U+PMJ+ZyBL7JdHOLBCUC+C8WJKzO0CFnk/DJUl/girOkiNBrSNxLZGEud/+9ZPr1nOiKZE0dqLoVjSOVXOkb5jHGEtfO2ivd08lz+7xtyW7Bas228rIpD1A4E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY2uUFsK; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY2uUFsK"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a9076813bso1941566e0c.3
        for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 09:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774803060; x=1775407860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WoQRb1H/uSt+9c9P9/8nshSYnEGgHPwE70oqeEqUClI=;
        b=hY2uUFsKvL7OH9uGpeadmosT4TLxk5TG2tQCE7h+g5lkej+YQSrp0sYy3CdtYCURQr
         qNhQDIIifXUyGbsuFb2Sgg5z2R8pSax4s/r/ujM8oHhtJizixl4+9J3oMng6VzqyxPkh
         KfIRHyejGU1OcP2QHqLrWc6bvj+inxP7ysjLxKDPpBzqYkj3VlStM5UlFgoZb3+uK1mo
         kz4hFviDtD9GWcejQVnQn7QavZ5Kgv8192tBvpWG9zsi08G8jwH+t9zKFbj1bWPHVvLB
         HQ+z9uvjA3z6iNOLtJXPMWLMObBU7QyAWnT7qQ5MByTHgMshpuI+wtrF7ucavACbXl0I
         J97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774803060; x=1775407860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoQRb1H/uSt+9c9P9/8nshSYnEGgHPwE70oqeEqUClI=;
        b=JnN+PKHPWxtKjXZFkDT1bFxPMWT9PIRfJDCi/rao4CtTeCBIysyge+Mx1nKtJDsr+8
         MxKb4vLU9sYJMyq+fO8s4kANcMG4PxVxUgxWh7yOY0se9lZSf3P2avkX81UmAUHZ/B+k
         pY4485uHCZAfLnaOr6ScLJTmZErei4LZAvWtyR5FKeKAgYov4M1BzRfynheJ3WvLyzFY
         cVjuoNJvtt4e6hR0GFjHonsRg6K4hWIfagktT+SUJkG0Ulr8nNZIKYOFgaQYODGtqqSN
         l2lQR7QHhSnxfAOMN+3/cWwiB98+oxsi/o3LWeqRuzRMQi89LP92QwT6xrf2bYk3IWiI
         a1UA==
X-Gm-Message-State: AOJu0YzAnLVnEmb19JWO3xxDTN3Ky0gUNohloQ53LN+FJp3jWFEAKk07
	UnDo1T/B8SxA84VmEoewru9aFt94GHgmPEioEExsk0nHs7nso0MYNvmi
X-Gm-Gg: ATEYQzyKlUpbr0ztMkowjOpU/iAHM9Pxh/a5yvHuO4+UqgycnMwzphoIk1chomOK7lK
	9eW2p2sA+Wi6XswsCb5Noyo84AMD5QQa9eLZYdEHMJC1SjlsgMahyJy5S38aAq+rNDNJckaHukt
	yrdNHLhODupAJr+BIMnWVQMzyHlF9hlyrL2tbP9FBdyIbYLBzS+OVQlHzsL5x73acn4b8fre9/j
	ZFIPnPAhZhxDLp9W1HYrVB1oOrZAWN6C2UMBEH4roulffORjArCDOYVu9fMQH7z0O82SEtBDhdP
	D7Avw4d4yOnAgviCKUgz0WUy/rRP3uREvhqV0QxNZACl6F2hd3NT+c601emgXhZH2J9Y42JaPeE
	xlN/w70+mZJbqRBEwTEvm3yfFwDtug/45LH36r0Dk8dnE2jp6brSHARefNiP+ruwWWMQJoe3yjp
	rfFsBCInqN/3GyLTZ7XpTJldN8u4O0GCrmVKzJqCnyscSsAfYtDHTaGsh+4gVpAgvgIyiSkVJSH
	m0Y
X-Received: by 2002:a05:6122:3704:b0:56b:982f:1265 with SMTP id 71dfb90a1353d-56d4a52033cmr3605150e0c.7.1774803059958;
        Sun, 29 Mar 2026 09:50:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:1690:81f:ccbb:2e4d:21dc:8ad9:527c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a7ba96sm5549740e0c.17.2026.03.29.09.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:50:59 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 0/5] docs: pt_BR: Complete PGP maintainer guide translation
Date: Sun, 29 Mar 2026 13:50:34 -0300
Message-ID: <20260329165041.831369-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series provides the complete Brazilian Portuguese translation for
the Kernel Maintainer PGP guide. The translation was divided into 
subsequent patches to facilitate review, covering PGP basics, hardware
tokens (smartcards), Git integration, and identity verification.

All internal cross-references were updated to ensure a clean Sphinx 
build, and terminology aligns with the existing pt_BR documentation.

Changes in v2:
- Fixed translation of "Periodic release snapshots" to "Arquivos 
  tarballs por release" as suggested by Mauro Carvalho Chehab.
- Corrected a double-hyphen formatting error in the first translation 
  patch.
- Added missing Signed-off-by and fixed line wrapping in the 
  KVM index patch (1/5).
- Rebased onto the latest docs-next branch.

Daniel Pereira (5):
  docs: add maintainer-kvm-x86 to maintainer-handbooks index
  docs: pt_BR: start translation of the PGP maintainer guide
  docs: pt_BR: continue PGP guide translation
  docs: pt_BR: continue PGP guide: Git and maintenance
  docs: pt_BR: complete PGP guide translation
