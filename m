Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87EF239E67
	for <linux-doc@vger.kernel.org>; Wed,  1 Oct 2025 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309693; cv=none; b=NBoStClziOXno87O47k1o/jjkDoPCqanexMvawoMq6GRnyzQQpgGrfr5zmnuSHNwcxs8ShWZg6YyqHF8wlsJmVABJbKyDutlD8xYwOh1os2vRIE/lQ2H7VjjKbbpQcAZz5wvBujrb4HyYbYgUAHE1oi9o9MOo2lPMrUWIQMH/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309693; c=relaxed/simple;
	bh=cHh/cHIF2ix4T1MbAz3cbtmZwsbFRKUVOa1sotAMdYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CQHu1eRsJ1bFbMJXfZ7LTqMqTI+ODoJGwgrm5Sa8XUipnNj4uV+aso90O2Pv7lROxKypkcjhem9tLNFJ2kt7G1jt32/DpMAPetvPknz4P/OH+CJX3IQWC1R9pkadIC38Esy93v14HlCF9WbJZvgsI68xh0vm5FCscDnmwKh20Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9otv79I; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9otv79I"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3352018dfbcso5678880a91.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Oct 2025 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309690; x=1759914490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xdn/qXRMwLNp6Zd/Eb/BpsxnL14+u3sr4IN56KWCSQc=;
        b=Q9otv79IzcCTZSc1wotjhDEpXDuYJxhhH320YokwjB9XET1iZ5ht1fvCsOoMFvJK3K
         /bMJocRulncmUBN0a1BQsUoVoaDTRU8CyvGujuxvLxfKNdRmDR2vPx6UV0qMCwYEViEe
         czhzyFkWs0Xy1js7fyYSRXhob05ShFvT25SJwPM885/rFUv4oh1TGRO3AcUwC/MZMH/H
         MJILUt72PQcx07jZhvaAeqCN27MVGU7Oo0a1zkCp0QBpKZXlMP0nMFxebDSy7QxaRFsk
         dFBPOuUwkULF1RmNKzMnIsDorbjM7PmaLp6NxE6N0l7ZOqtZeQcefvE5woeE4xvWlmIo
         vmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309690; x=1759914490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xdn/qXRMwLNp6Zd/Eb/BpsxnL14+u3sr4IN56KWCSQc=;
        b=RPxIrC2D8aEFe2CHPQPm88bhDy6CPOALelV/P5gW+1LFOTVJuCFXc+5rY1HqL5dC/i
         FtaEyW8Oa8+C6GFXKek+9drCcAxZzCSuHzu7NwsHoqlOl70g4JQeUtpcimI/zkWw4nia
         SDwwQiBPpOK9kTav3YsPLsRPYxo6pQWiZpq4pnKqoeF6CSrJpfXD7nRZ2vlqa44D2t4t
         CYR+YTcfAwIYEjjZ/Qfv55Tbj8s85bkszHv3QQvrpyhN4SHj5XTwQ5AI2Zv/E1nqz2ZY
         a9MW7MK86/aQPFYObsfkPbiMDUNtOwQ9cR0womj+O1kpnLPR8HIyRxXfZlCfod85J1eE
         yqRw==
X-Forwarded-Encrypted: i=1; AJvYcCXqAIToc3GZXR37F65erNxaWWkl3XFSsDF1qVmHkOvBEr0f++RfT0+t6EuSorZcCfTVd5hmhrS95bI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylq2HA+0I8YCygpE9BDJhX3vVU8ti5UHRUqRgvCv68WaLrBkHS
	rnzJz/Plt2oAlE0T7GhEcluOZCjlB1EF7C0wttxSowjv94CX89vG69iv
X-Gm-Gg: ASbGncvE++lc+df6Zl09Gu3PEggNbdDA6RMy99cO9i0pOdkKgt1OkIa7DdgU2jo2kIv
	V54nyHvie9xPBKaOY60m7dU9cTY8rTbWFzQqDF//Lggx6fVs9ENCbSNgQOeV/aechaFhWLre1iu
	5ag8MD3rgigs4wUWdq6D0r351u8LxiyRaDbfkDz/S37uqLjXx92s0HYj8ocf+BijOSu5009PooT
	aRe9X4p7NfB9tIR3vNiLFAljfJ2y9xoxwSowV+y0JQF5hPkLZPGcH2iwAKsvdmwb+1pKIg7j6hh
	qs7iEuWQrdug/+ZkwMxwRkWKkhzuTEnZbAf6RtHjQFOrVG8LGVs17CAKAXd3aorKmA1b2KIF2jn
	U7qmcYvsZyinilWNI5UmqrZt8sYH5/s6mysNbFztD11x8yuwJdqOgJgFHGrU3YW31/2sqdt5giw
	==
X-Google-Smtp-Source: AGHT+IHCAXG1BqEfze3gHRwn6lpXtkf7tuj30SDlHiLv3IUP0y93ub/ofCCeyp+nvvaX5lId2eVgIA==
X-Received: by 2002:a17:90b:4f85:b0:336:b60f:3935 with SMTP id 98e67ed59e1d1-339a6f08820mr2965105a91.23.1759309689779;
        Wed, 01 Oct 2025 02:08:09 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55741e6sm15477230a12.29.2025.10.01.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 02:08:09 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] ALSA: emu10k1: Fix typo in docs
Date: Wed,  1 Oct 2025 14:37:57 +0530
Message-Id: <20251001090757.45991-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

interally => internally

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: No change in functionality intended.
 Documentation/sound/cards/emu-mixer.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/cards/emu-mixer.rst b/Documentation/sound/cards/emu-mixer.rst
index d87a6338d3d8..edcedada4c96 100644
--- a/Documentation/sound/cards/emu-mixer.rst
+++ b/Documentation/sound/cards/emu-mixer.rst
@@ -66,7 +66,7 @@ FX-bus
 
 name='Clock Source',index=0
 ---------------------------
-This control allows switching the word clock between interally generated
+This control allows switching the word clock between internally generated
 44.1 or 48 kHz, or a number of external sources.
 
 Note: the sources for the 1616 CardBus card are unclear. Please report your
-- 
2.34.1

