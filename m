Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD91DF987
	for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771075774; cv=none; b=k+lzykCc3Y7usKqLSScC5gmsy9S/IpKhy2kY1J7bqgi2xnVULySoLVKVFiuEEz7G9hdttdQlllQ3z39gBYumQBuwYBQ+P2foFO/dt6TUPNSDUP4ffBB7eTPDKpFRH5S4jryAvWJIhhbvVWVo23xiqKPcZHjjjTqbGSISjaK2+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771075774; c=relaxed/simple;
	bh=yOOR5kJ/8OGkEgRJL1D/NeQP7sOD0BGGev1FnoimY1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mp5CJGdoiL8FnmJVEq5ugPYtNg9/FaSlFYvT9Xeo41VpzUeBna5oiQuIqeDl966981HnNb85yBCM7EaYVNHMPMYCkzTwKxomOwsGqhRGtde+uRN/YbsWsq5Z8ynVzojDgmCXSnZNuD6zQu1uoVdrQ9I2ipC3zE45NQC18CrOnBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPbVAmHl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPbVAmHl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaf9191da3so11956065ad.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 05:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771075773; x=1771680573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DMpRrIULTPRMkxRcIaO9MgcwXfSRvlZN5DUlgk4+9Q=;
        b=bPbVAmHlu74VjSIX4NsRZ6hM1ejY+Vre4sc2TXfTTyrdADZgnUxjEboJE9/IGdMrHF
         r21wcgFA4m57q96J2gIuiYyZmEJ81hyH+TxV2j90AxY4xQefrqK1L2PvP7rKQZbAshIa
         ucSxpLTXQsUjGQgPhwvG0xloAK4c9qlocfsVmqloAt8zm2jj6+jXJzwzuewI1Q2JiBna
         GCenWv9YVcHjrf2XyGSgZ2EmJhkF4/p2C/AieIYVxwofzBEMgLSmt9CPbRtKjcbyh04x
         LlPsZrCwoCnWI7qqhBKdWqv7AHPUrcoGiaPCKv46wCj3XU32E/AIuwtreGClAwqUtFZY
         IMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771075773; x=1771680573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DMpRrIULTPRMkxRcIaO9MgcwXfSRvlZN5DUlgk4+9Q=;
        b=jB+rpAs+9KiQHZCKlIl0Z1l+Y/b0FuXqDBjWHwXTD8ExAq5yoMQ0dU05OAAczSOU12
         r087mGETS8dFJ8wOkNkOYDl1Hl25IynhC1kudiPu22VLM9hDFWpG0vusueqtJ7GHbfhS
         W81tpoJZv8BtlOQaTCoqRCmH9MDpTdnZexrIVGLI+Jc/8g5xs0giwQqVopOCMLMT0vsP
         +9TMDUrvAxDaOIaUH8VLZp8kjmUqIcwko96BGC31Do1EOFnEK5+ICNzWpU57yLybPEus
         uIWuVbYX8K7dnayYspx1LMOhcJPTzyA21z5bxSzdlob2VY3naeIzpRsG9KlN9yil3Rer
         vN4A==
X-Gm-Message-State: AOJu0YwKnu/6kNmtwjmv0s9g66Tks1beNCKzkX4FZ/VdroD2g2bmStkB
	kkh/8RTj5asRumobRxITrSIzo62FEhb7kKvsJnIf5E1dz7bOr19bOLDPdH8dDhey
X-Gm-Gg: AZuq6aKY7/iJyjmC/sfuq3CcBP0Ld8aauN/jApQvsEg/P1MpiAG7aOxmFlEtkZO9Nw0
	u0EUaXsLXGZwuDxCsJw2PsAByVNNy6LRY6oQMMVY4t7wnKexDzqCoxzGm36/Oa8xTYNsXYXdSmm
	Wof9De3f9XuRMS2Wf2X5T/9y3Es78v7o20BdhUJncTut0XXQKUbW1mpg+MBPwsBK11R9BgUpYlL
	pGj31HPMlQkW2TRfE9V5oSItvTKqWw+Xung8yEvRGq+SnfeQ62Xvxkv3oE12MWtAdCQLyNz2Oc6
	ooZK4hTVqN9Lvxs4BcypwX6bifn3c3n0XKpCOt8mZwQ0gDFz4K3Oke05M6FgzZTjx8eZDo7OkJ7
	GMAj06FJXOFQ+M0RV9jCSMt5QPWg2eKlHk5RGd6FJ4wGCIUkEOJyvezH3dUDkAx2WUS+J63oU54
	x4vCKNa9SaSsIkZG919o5/Y+r5DpYtw35D5g961u+XFWEPlQ==
X-Received: by 2002:a17:902:f712:b0:2a0:d05c:7de3 with SMTP id d9443c01a7336-2ab50548680mr58093735ad.15.1771075772916;
        Sat, 14 Feb 2026 05:29:32 -0800 (PST)
Received: from localhost ([103.251.247.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a738220sm22312605ad.37.2026.02.14.05.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 05:29:32 -0800 (PST)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] docs: clarify wording in programming-language.rst
Date: Sat, 14 Feb 2026 19:28:41 +0600
Message-ID: <20260214132842.1161-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify that the Linux kernel is written in C and improve
punctuation in the clang sentence.

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/programming-language.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
index f39d1d3dd9ce..c18e307ccb56 100644
--- a/Documentation/process/programming-language.rst
+++ b/Documentation/process/programming-language.rst
@@ -3,10 +3,10 @@
 Programming Language
 ====================
 
-The kernel is written in the C programming language [c-language]_.
-More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
+The Linux kernel is written in the C programming language [c-language]_.
+More precisely, it is typically compiled with ``gcc`` [gcc]_
 under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11.
-``clang`` [clang]_ is also supported, see docs on
+``clang`` [clang]_ is also supported; see documentation on
 :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
 
 This dialect contains many extensions to the language [gnu-extensions]_,
-- 
2.43.0

