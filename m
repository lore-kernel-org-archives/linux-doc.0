Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA1F332628
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 18:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777399356; cv=none; b=h04BiVFi/tBHskMceMvvN5AydzQ+trCBYi7HSUta7/buTAVubCi5CQD7h07mvR+D6NB6suppK81D++aVs6/jgupHrEiR9IzMqC19mYwH0kVUecVZH9Q1CkxKUqC6UFx6fMOmZsI6n5Q7xmbvblgsKa+kd13Px/FDe2fcGvu/0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777399356; c=relaxed/simple;
	bh=6y0rfKOQzLLLSta//SFxdpevB8blPHw3L2h0kmEYxoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=De61eh/umo5iPZxV4u3b/N7pB/Ao9IW/0Coo+niLtaL22Nx4qNEUB9MrxbSdXFpKRLoD2M34q9R6lDgDU0xxYoW0sCYBn6jDymFb3VuP7Ednt8gSY7lgkm4/Z882weJRqWYrJpRXj6v/cR3dBD86EjGi/gnUOb3FoaQjla5A5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SykJJzeY; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SykJJzeY"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79ea87af213so1982877b3.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777399355; x=1778004155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8LokUuSrvQDqSZ+jA0Y3e1bbBcOLmwTdXcyw7SRU2Y=;
        b=SykJJzeYo6nkMc570qnB6lRwaxK8CMpDhXb5QGhrDDCHspZ9GdNSmbouaErHgdkuzI
         O0Kq4hBpmDsg1Ouxsr7uIznCQXvdQxKv87P4NOoPCfs5daqs6DzaxhKxaSJFUiLZY5Mv
         bPdY02Q5g20V3iZ8tX8X8mIVcLE84TTEm5okO925ZML0sv/kQ7OB7qGVU6uVrCZbUzN2
         MFXzmD77d0eS0NfIClRRKFemHXpGibw2eCFRm/fcXs2yxJxMU4Ry3ScB7nt9ScpNy3ea
         w31wVWJfDwMuyR1V4PlrrmdoFQ3SPq82gWeXJLEiqweMMTxVKz/emF9SchMGckde7ZUg
         Rb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777399355; x=1778004155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8LokUuSrvQDqSZ+jA0Y3e1bbBcOLmwTdXcyw7SRU2Y=;
        b=A+iQr7QzjV5yCT9AEXkfYeazLurlpgCsIQg5pDmFQAwQV/kPM/UzTeBofLQm7Qh5k4
         OVi2tp3kWf108589Vw6D/Tw9Xou1BS5KYXee4sRoCiL6A0IlwiTKL/qWVA7ExtCc73KZ
         b1PUCxjosLFllezl0HvzQ3QUt9xk/D+KqGwwK0cZhKiHihB93Gvteccog2A4A7a4L2CB
         LG29XePWcTP5PcUTfmJ77/uBQkOG7zxX8FOS9Pg4l8MSG0zWflY020wGFW5bcxBg97wp
         MeU8i5JKi+f45+TPTJhKU8/i5jPvHMHWVBoO4zvMgvPTdaLCZME/8MEUU6GOEwe3cPm1
         ReUw==
X-Gm-Message-State: AOJu0YwUbLZlCGO4hsyt6zk30MRUh1oeFnMtfnjtCo6aouwoAMk1nJ7a
	sCd4XGZBorJgzfCdVK6TW9Y8nYCFQ7qZmvjC6DgcDWwOmRnfKktRILYD
X-Gm-Gg: AeBDieuiElCs6ZHlYQzYt/35hwLwXc0bTHrddI63Z3zmlDOcZVaDJtJWsoSM3tlICB6
	hsxlphXOPa2eNzXd5xtCraedawKZkZdYswtYK1KD8zV3kTI+jp4JEmcAl09ouw2EmVDCaXWVJRE
	7sHc9y4VpRtaQOHwLPBoQRM0AZn+1fFgdEI58dAe93jBIncXblCYwe1t/RwaQPprBLuyCGGtB8x
	CP0n/EmE9loB3lg++xrWm4P0dVFv4HAhqoFJ6dVLPmdFaBdz3Zjjz2zi2H85IqQ/0Q9rN5nS6vf
	3oDixA+4rJ4+KJURn0MGA5olSxUUYuUJyyS4bHB88LG7CO2w9r0KU0taGsZMhn4GQlkMb0J9r1y
	6TWw7EC6NOYtsi23Uj4+EBHu9iElBiH0nWL/iGgRaQapJ/8B+KopVKRrzkwzaERBIR5I1iu5mRb
	MoSd8ux8t+1q1U3jY7Q2fp+XlY3k8hL66aC/51lTS6NjA7mRQyimHmZSW4U0zGtyYPQfTuD3wnP
	7fnutLkCg==
X-Received: by 2002:a05:690c:6612:b0:7b8:338d:7d7e with SMTP id 00721157ae682-7bd22c5623bmr320007b3.11.1777399353701;
        Tue, 28 Apr 2026 11:02:33 -0700 (PDT)
Received: from localhost.localdomain ([177.36.4.188])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd22e72f9fsm69907b3.8.2026.04.28.11.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 11:02:33 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH] docs/pt_BR: process: link maintainer-kvm-x86 in maintainer-handbooks
Date: Tue, 28 Apr 2026 15:02:05 -0300
Message-ID: <20260428180208.175472-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

The Portuguese translation of maintainer-kvm-x86.rst exists in the
directory, but it was not listed in the toctree of
maintainer-handbooks.rst.

Add the missing entry to ensure the document is properly indexed and
reachable through the main maintainer handbook page.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../translations/pt_BR/process/maintainer-handbooks.rst          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
index ba36df8ee..bf7a38147 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -16,3 +16,4 @@ Conteúdos:
    maintainer-netdev
    maintainer-soc
    maintainer-soc-clean-dts
+   maintainer-kvm-x86
-- 
2.47.3

