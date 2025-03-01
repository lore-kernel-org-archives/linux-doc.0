Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8088F7D
	for <linux-doc@vger.kernel.org>; Sat,  1 Mar 2025 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740850678; cv=none; b=gb9I44B3mBWrTZDKR6y3yNRQ8IsuAECnfv1Wothssx6Bbxqo/DLFba3FDlz58R1cwxFBsEpLIFN9kYQ98Vfc9dDRXCh4YwdHq8pumTwGC3f65naK/4Ebuw96AQfkphhb0KlpkOhJehTg6yw9ePyziHNMJRh6KGqLK1mTUKy10I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740850678; c=relaxed/simple;
	bh=CJRdEPjt8fRhYybPyUXkRLPOHRQSqMQg7adGZWcYm2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SEWggI62lAV0cXqsLPYXhJcxKl/pe1xH+tWgvhx1kcToTv0nPiFZm07lrDfhfVnxAWpYpwAnW1M4a35Ij/MKisdVY25TtPXVvd5IS57eaEVQwrSwht2mWweOycdDQ/4OiwcVNKYaoAczkY32+yazx8Io2V9q/8jvMi3yQlQc3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewye/oUu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewye/oUu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso33445605e9.1
        for <linux-doc@vger.kernel.org>; Sat, 01 Mar 2025 09:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740850674; x=1741455474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QP7zuEtVpuXYgMVDVf53TGzCaOKkWbuHYD/p7kqTiPM=;
        b=ewye/oUuOuo58ik8EIynsiKl9UGXRdsim0gI/8Ko6nThKRittV78g1bUah/koP5NmD
         5jVjsg9W63pXW2XhtN3XnIATHsntks2fmSCw0e/VgL8WeDgrz0aLHUUDqy+xLk/zRndD
         X2da0HQuJiqPhevyFzyidBXZTTJSyFvywSYk9NK4i6H31UCl6rM0ycj5k4zwJ2Dm9hQ7
         nslbHxD3kC8+fK6BJS/jPxC4kMosTZ8OwXtd+Chpq+q9Z+tH9uvPGFNWnsrXKI6E9tw9
         sY7z4Xm61XZSBVADtgy5qYCfX7MJ0ejU8VusOKXsq6IUq20y40GF1hMF8FX2l5xBLZxK
         RtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740850674; x=1741455474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QP7zuEtVpuXYgMVDVf53TGzCaOKkWbuHYD/p7kqTiPM=;
        b=GRUAajXeHT2LxrCLxYb5wf/1thORafFyxuprqaPpqOf8oLqRjMr0dfenopiieXrlDb
         HeSUVTkXePSA/KYeCuUGQtJnsCjAjYjTwKlhFpps/g1pS18WnSwfyz4KjK/2qfz+avXF
         fIo9NK5WkMz3S6ou6wdvIpyqwRB/Il8vXu3ZWSIOesp4M8kU7lKj4gjSjPC4YDFmzApP
         T3Ws0nqHZLAML5+Btzep0ERqWWmlERzQACVTIf6YsBTpuFPJmdLounPZFh3SOFoEOiAQ
         3b7Em6b+zEY2kjYoPVjFpeVm93DoCs1EVy72wEntxlkGvKIHVnwpxsdDgnX2CNOmuFws
         68aw==
X-Gm-Message-State: AOJu0YyayiJyADboS4ClckIGzx1Fp0U6hocOmjT0KlMIV6Nmtn6Q49aM
	Zwb/2Bg92qSzawaEE1G5G0xf15305qXUPYzh9BDolk7x+TY4Rd8y7aZ2Q1V6oLiCkA==
X-Gm-Gg: ASbGncuncaA0RfNfdPCZh68B05IY8q9bPSQv+J7+EbZ52wHhfAjckB/7nFKALaqEWlZ
	trrsz9W80tuP/sMsMduchC48FxsKMWchmAXFz30qD5HArHazOoVmdVgp4URnUc93BDskohbTtcV
	fUe6eI5RCEQgpePy82dmVl47H7hNJMxq9EOHslRrgAloV+CfhrR9rHklLUKlPPJJ64R82wWFQT4
	+zSIuPMlD3ivvz9ItIHRUlShNFaF1aiefkjtpYl2l8/pEEhaEhDBd5M4ukWs3ji6O/WKiGvoVZ1
	Ieik2tCezX2mNo5JpZkM3rHAdte8qCBKLpfJ+DBhrzIV3sQwercJBiz8k8CALA==
X-Google-Smtp-Source: AGHT+IGA3/4xwFR9/mtvTQDhXjeB3vEA1kOHdqrmy0tRn/aNtUI+x0pkMLFTpz+24v30cQ46lL8zng==
X-Received: by 2002:a05:6000:1a86:b0:38f:4fcf:d295 with SMTP id ffacd0b85a97d-390ec9bcab0mr7660635f8f.29.1740850674336;
        Sat, 01 Mar 2025 09:37:54 -0800 (PST)
Received: from localhost.localdomain ([2.183.140.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf48f91bf4sm206282166b.159.2025.03.01.09.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 09:37:54 -0800 (PST)
From: Navid Mafi <navidmafi2006@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	Navid Mafi <navidmafi2006@gmail.com>
Subject: [PATCH] PM: sleep: Clarify S2Idle is unrelated to ACPI S2
Date: Sat,  1 Mar 2025 21:07:17 +0330
Message-ID: <20250301173717.68594-1-navidmafi2006@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify that S2Idle corresponds to ACPI S0ix, not the ACPI S2 state, to
avoid confusion.

Link: https://uefi.org/sites/default/files/resources/ACPI_Spec_6_5_Aug29.pdf#chapter.16
Signed-off-by: Navid Mafi <navidmafi2006@gmail.com>
---
 Documentation/admin-guide/pm/sleep-states.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/admin-guide/pm/sleep-states.rst b/Documentation/admin-guide/pm/sleep-states.rst
index ee55a460c..8aeb33268 100644
--- a/Documentation/admin-guide/pm/sleep-states.rst
+++ b/Documentation/admin-guide/pm/sleep-states.rst
@@ -43,6 +43,8 @@ This state can be used on platforms without support for :ref:`standby <standby>`
 or :ref:`suspend-to-RAM <s2ram>`, or it can be used in addition to any of the
 deeper system suspend variants to provide reduced resume latency.  It is always
 supported if the :c:macro:`CONFIG_SUSPEND` kernel configuration option is set.
+Despite the similar name, this is not equivalent to ACPI S2; it corresponds to
+the ACPI S0ix state instead.
 
 .. _standby:
 
-- 
2.48.1

