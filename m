Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682B93C1414
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401036; cv=none; b=VUaotO37dC1yKxR7YdM+UoBwl/gW5lR6XbEFgBOSO/W+Vcs8OE8lYDq8dQpztJwetqDpPlaIzd4dK/ETvo87hVMnCWWwUDBFzuZ6YwONH1B2qSVSNtspm6sBajGLmNXc+eBCaQOu+xRkMannVNTRyvUi+VZjFq0A2V/ZmgCOOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401036; c=relaxed/simple;
	bh=c7hqCgp8op4KJJghy/4AR6tAgvPRIOuvrSJcSpDAnEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L1iMFe3R/TWuRZqxZ9f2bxfQClTSm3XvPRr0/s6ZDy59t1t3jjAhcssknEiEh/crSPgcaH63asCi3/VkOdRdJwyaK+cFmzwtRtMUnO3t0kwzYpjtfYwl0IiqE6boitvB5Fprlm4hio5Q9aqZ0vt3zFYrG9pRl/O5WIovU+P6uoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4BzwU+S; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4BzwU+S"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso3497308a12.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401031; x=1788005831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sytsAqA8XLvV9RIcnKuLKORFXpX82LoVo7/RGgggj5c=;
        b=X4BzwU+SKowSHyl+uAqCR7+kOoyTukMApUekiLok0vamHJSWQpUcxHjCjW+DJCmOm/
         cRcZKNDbRFO9ruDDPG67zlKm0TTS2nAhO4QWtXgGfKuxRUiP+3hALtGVzbVfQWGeka+m
         AMNwo3GlgHQAjfFgJy7fRzRVdIcPEGJT31a8y55EDYVujXk3Day93fdILxqbxnbwkugZ
         EMiAJ/cWiMFdxyIrwDIhu+TOdRfbaGMOiYV8vs0hyxNNF1xcyU3OAjlny0dgZ5qXZVcj
         iPK8Y3Njs4RPmn8nX3kku/syUyQyO6C46CCG7IgE6FTWLgej7XeqZMiEeqMovXAM8O60
         Dr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401031; x=1788005831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sytsAqA8XLvV9RIcnKuLKORFXpX82LoVo7/RGgggj5c=;
        b=dIPohRoddGgXcW8eO6flMSgU+MK0Hn51D5p2yC+zVKxe1zPOzjE6GHClCm6Cjyb4dr
         /gQpbkuCMPRR/poPPuxK4f2XfSU9+EXFjj772JFioitwgTG4WRABdopFKOBrGN0rO2K9
         jFRTx1n6x3MNlcD90/KVS1c8lClO8GMRpW6PrIZ3VqW2/dEILlDZ75qATMGvNST3cT6w
         rSWGFo/T0sytP0wpBxAT1Lpfl0BUNSnE+5X+k2VLI6tPnh71FpxrlM6scwPwRLKCOnMM
         OOxgFC5GLVduZwTeyC7j0XtqQDcyy7PtDcJgRNiMys+JGw1GhLD3zL84g0Dmj5LNOMeL
         mQ5g==
X-Forwarded-Encrypted: i=1; AHgh+RokqspD27y2QW/10igRDVg2KzXVn0DTORur0JanmKROnVjNJCOYN8qQbM/P+Zv6fXKCs11arl62V1s=@vger.kernel.org
X-Gm-Message-State: AFuF++mUmk5kNmtAYrLt3cNJ4NNar+AB6ZqN3SINZo7xC5GGfYcEiTNX
	n/4K64UXQKvfOZwDXHcKRYoexQfxPmngTBhGYsspzWyNztCEBexRaGCU
X-Gm-Gg: AR+sD13c3l1lvqvi96oc69uf8F2GGhk7YjeMGC1T+VHxSfxbIWHxNQSxmsWYzaCdubM
	56fysLdrJyweOkWCY7vndLSiT8g6Ka/AfjiqGfmLX8Q48IaCVpEYsdLo7e+nYq99QQLpNP7aljF
	TrUzKoDXuEgL9B7Lm0E15ARX6iDyzUAprV5x7fxB5fhXBdbKzXUD4a9Np3ycog5NzDQknb4EohS
	EV7fLW3tXRaPVvEn9AcQLq3UJrMyQnYVN8pV6IfNPUGpavLbIzkIdS9SPxtno4GmfxRBP/B5C9S
	5nNHUbfBpIYZgxkyb3gWXMwIRIafAFHUch0UWEb84v7cKrhbWMHuoMe6wQt/VJjCx5VX4OtL8Cx
	bytQyZtGn2xmm0LDsMjPJGCGqbGiCASr3tiX8AgRwLJmPDXD6lznI1zN0nx1wzRNsxrMKza38zA
	DtMnw2XBBgX+YR1cylZIEXQHpBKnRa501Zge2GX9wS4kKlqGk4Nt/RSe76pLRv7fILiAlipvcPV
	HPAxAjVKpdn2eNZERcw51acr3cjHFSt6k0Aa8pIHHDVKVFkvdqdf8DF+w5iNMAbddYNu43lskqb
	Em/cmBdOCKoQMyTVqm2nmU9jjZpaYFPYeDYQz8nvI62df9mX8fNkZ3O7Ezkjj+AgdjPhKJDNMw=
	=
X-Received: by 2002:a05:6402:5049:b0:6a3:f63a:4997 with SMTP id 4fb4d7f45d1cf-6a582af9535mr6141711a12.3.1787401030613;
        Sat, 22 Aug 2026 05:17:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm10998322a12.7.2026.08.22.05.17.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 05:17:09 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] docs: debugobjects: Fix debug_object_init() name
Date: Sat, 22 Aug 2026 14:16:51 +0200
Message-Id: <20260822121651.1559-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822121651.1559-1-kmehltretter@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initialization helper is debug_object_init(), not
debug_objects_init().

Fixes: 691cc54c7d28 ("debugobjects: add documentation")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/debug-objects.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/debug-objects.rst b/Documentation/core-api/debug-objects.rst
index ac926fd55a64a..708775fc581b7 100644
--- a/Documentation/core-api/debug-objects.rst
+++ b/Documentation/core-api/debug-objects.rst
@@ -129,7 +129,7 @@ When the real object is not yet tracked by debugobjects then the
 fixup_activate function is called if available. This is necessary to
 allow the legitimate activation of statically allocated and initialized
 objects. The fixup function checks whether the object is valid and calls
-the debug_objects_init() function to initialize the tracking of this
+the debug_object_init() function to initialize the tracking of this
 object.
 
 When the activation is legitimate, then the state of the associated
-- 
2.53.0

