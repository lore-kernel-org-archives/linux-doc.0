Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA24D19F424
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 05:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748411011; cv=none; b=O1pQmtUBG3tVrt0Ts3z1lab5CfSKv8GIMW9fMMs3Xz9bHfBKC0odjoChtpoFgjAQxLbq91Gvs0bV7dyoPW6i3msIGKzzlL/jlmAweE7iK2Xl6kr6EtxQikG5k51MWx7T3WtistaNOeE4aByFXwWYt5p+jmji/WwMA82eAlWPzmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748411011; c=relaxed/simple;
	bh=UAW4IDmFuxT7Xs53ZJBV5vj6+YrT1J7KuiKlAlHg/1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDkp8E+/sTUI7nl1iZnsKnR4Z5mtJO8KKODRq1QLeMoTfTUhvi0dajrZSVCdI6vxw3AnV63riP50Jl/Aq4g+hYT74ZiAN0AlEWZubHkPrZ0CWSDYOR2je2XMeRtNGofqxtxiHKA3ztBhZYoHP1+7gObnQHEHskIPo0Yu+hEz3yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=fRXk1oyk; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="fRXk1oyk"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-861d7a09c88so84290639f.2
        for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 22:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1748411007; x=1749015807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
        b=fRXk1oykMEgWHm0satGojPSt9dFhImudNhhNegIWDII+5lkOy+9iLstUIIdbAtlQB2
         gGm8q6WCfNEniGfKuvEOq7PwbNN/jVUUtBvngM6x/jiTOSXk4aPZAv+Sxt0LMin7ca0O
         0Qf5O73Zo7lyj0wMf3KNGtrErjMuRsTA3ZDNDWkrHcxnVvNxXX3iPUUjytuldVGzD9R4
         YPelZ9OJr2VY2ekiXbTy4Gs5Lal7ebzfvB/jezHB+tuP5Z585JAv3gyDw3CIcs1SGcq1
         gQVS+MYgQbJ302zQYAWX8czTNsNKCI0Unq78HbeWI4pdDneL+/MnneB1vQxKGSOWvy0u
         JDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748411007; x=1749015807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
        b=Oqm5WOdC2/qKrTUqIUrmiCWOBB1D4lFVzuuRGxjyvFoAVzSAmON1PoL5WRKWncL4gM
         K6xT3uqx7BlDMKH5uN6wy3FEWBkllvQiRwsF34H2q1OQ8Jt6uNa8u1z26pZU2g7sCsnx
         AV0UszMRbDf2pq9+xPy/jiTgwcK+IMI4AxesAy5bIR2d4YfJDeNxxah10idnOE+ndWuo
         Um5llhwEjPlATmL7cwYvnG9AUUlQ037gfl641n9b/iuKqMOkyOjBfLif+A7rdAUqcjQX
         3/+3t2dv7Vw7hLQCHKNiuFkDJZ+EW6RkwqL1u9dHIsC8qEB1uxEc6Mqx6OIutByojoBB
         NB5w==
X-Forwarded-Encrypted: i=1; AJvYcCXfMuzsztROBISJruYxAfvpygo3qNlOZ6usswnZtVRftTYHDPfxqVgQzQvEYI7tMZu8GMcLTI7VHM8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0KrqhqLhRO9R25P4mCiznjatHLtVZHR/lOhWFKo8VtbiAhLtL
	W+hnsBcT6GmThJ7HmUBABIySkcv8NogUd7ijpuayUVuPlxqpXys9AJEUfePL6SOWdXk=
X-Gm-Gg: ASbGncvt25ph8NMihP0oIkqHRxU66rcaGZ3WKAmwJSxGThiOoU9uT/s5/hrwShRPlwH
	/NEFYbwdI9Bzco+TYrB3SWExnLKp/9KJ0xbFaTx+7WztiPZocd8Zzc0ez/WJ3G1zX3L9eBfN+tH
	/YTaSGJNM2K8P69vpEgNNCVusggmchYtQcUDZ+dFZsfjhyIyC22EXCt1TyhO2bQaawVqYIJZjLh
	N2JrcdMwGZlaFM0FpGDHhbVPK1k0BVp2jeMXrkLGFHF45uBJgIYCa+RFCrejemRmKdfMG8awdWq
	6EsMfXJfSB6oB4aayF0dGzyvsFSnm9NK21tq/MWMu1JKuH/xtkloOHn8YkqRpwCBGMBaDmwr2IR
	kc81aUM0=
X-Google-Smtp-Source: AGHT+IF+v7eeJiqgx2CgLK57L91nnP+NaoqNBY3MrpJ58a87hZdHLPE/Eq+lD7S1GC6+xWdZO4pGrQ==
X-Received: by 2002:a05:6e02:1686:b0:3dd:869e:d1f0 with SMTP id e9e14a558f8ab-3dd869ed599mr37235695ab.9.1748411006513;
        Tue, 27 May 2025 22:43:26 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd8bfb2ec5sm1220685ab.1.2025.05.27.22.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:43:25 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] docs: powerpc: Add htm.rst to table of contents
Date: Tue, 27 May 2025 23:41:47 -0600
Message-ID: <20250528054146.2658537-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following documentation build error, which was introduced when
Documentation/arch/powerpc/htm.rst was added to the repository without
any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

Fixes: ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
Changes in v3:
 - Edit commit message to conform better to de facto kernel development style.
 - No changes to the diff.

 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
-- 
2.49.0

