Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C789F3D9525
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168094; cv=none; b=HybyHD2PibA266nPGDJBFm2j3r7rd81s4c2HgJZzz7zhVsOZPKdTwFFU7PVMookiazOySh6j/FgkliH7WBH89o5OcgAvhPKXYKe8Yk5jxhGToyy8LFYSoj2Zlh227KqGiUtlx/iokxZSXQCOufOmP2K005cvADTmTqTktjbZ4PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168094; c=relaxed/simple;
	bh=hqiVsKbBVoEr4/XzqULp32/Ha6nJlHJ/i7osDe72orw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSRT9dRRt1RsaVW3feXe0RgW6iKSEDImY2Fx4Ae7q+ItO34nL6+7vsQ4t1Jb6Jl6x75KHkEJhRgXvc5WcMzrAFNGjvk3HerxGHCC+RBphYOFpJVf+gkpUUaZMxMNPwyu3vDfDFB9k7qWlo9JHwa046DkPxkY6pxdzhc+9gI0uMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AvzQ07wB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AvzQ07wB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so34030325e9.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788168091; x=1788772891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQuK219/piRaeOsbkqtRrht8jM/pB1guogzcpVpKslc=;
        b=AvzQ07wBXxPBD5VRSqna7CMVS+ECDKOsxnm5RvAVYrOD8cmam/PxpmYiwJtuBeBYh4
         t3zv4U6hFeVhpJ7Q1wviFI+n1rXWAnx6Ucw+RjXJKtFd098h36Ad6ESiVxgHLdsjTJVi
         7tn4Mf/CSog2PxzQdnYBz9mpBdOuQwFcqVLtggONZL3OU52R3ARl4K7SXh+kKGkxyZLC
         AHhC7m5d+I0c7VhGItc4GlNXR//SwlSXRYEtIlO3OwT3ow29DcTFhYwB+/VQlaqzAfEC
         oCwUUOe7GxjYTfdy5A9PD8TLGOtddUsRKdvTUY6dTT0QDC0h2eR9sS0SXqiHtw0k/e2m
         kypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168091; x=1788772891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQuK219/piRaeOsbkqtRrht8jM/pB1guogzcpVpKslc=;
        b=Z7+nNqFI4uhPhjI1VC1y1T61zEY7t3eZosgGI44iUPNh+uEB6TcezADPwO8XlpeJGH
         GfI5C72xhobCU3E6XjK/D/zjLkBvuEvLV4P/PRdg0T1SoHalBv8oXT5FBAcPzXd39ZK0
         iKhhsiAHiIVJj4551l2ROoPNKUBFbatXAOncw/XPgoBxQDhNaDcnzsc7g50nb4cGWVMx
         XuZg6Fhbq2GhqQuB21wr7dhlv3I5xfmdtPEtzob6HATuNa/kfFB3sQBTeTa/MVNszX9v
         AYaIGN6WRZYFwJdyQ9sP/irLKs5NpYBjSb6CGRWxC3noEAE86jczi1JFQ+w5rWN6LfK/
         ep7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoUTcla2iz2WO2cf3iVKcfd+Ty0EvRbf6dWcIO52EflajMLbtoGIPEseHwFN33j+T68gTHwbJ9XJw8=@vger.kernel.org
X-Gm-Message-State: AFuF++le7rKQpHZ28NdJWkygmIX03sUblwZCv0IHH4N4NPly3RKMONxA
	APqJepHdv3cs3cx5wVK6XoWS7OfBHX75jEBdIpZyZqypmBxU8VglePpEMLNJTVfnOjY=
X-Gm-Gg: AR+sD12frn/VmlUJ+N52tbI/wlaLLWaULr+SFp7eA62kARQ6r90l3y6Uzr4Lhi2bKm8
	6jx7E7ST9qu/9pUH8wTGIWPCjEQ1y5qHhIIsXeU0W95osmmrfbt8BX2jl2mteUVbq1RhN3Upl+1
	gBV0l/bC+aCuIjRFuCTrbNLkdeRTcyJcrixu2M135ej8fYTY1MASiaowvoUUx+TlHq4Db8KDBIq
	PpBBPzs4dMZIdUqHi4mpKkJRounfWRcyjh0SKBmm5b6v1P7VqzgPt+vq3tPKilYV0nse1KlB4xC
	zLo8z74mPFBkcPW90ytvpifB2Wrov/2veup6fCyQkXTbedLcG0gdnxh9NXrdPvtcAEgvN0n7F1z
	2/Ct82MrxqfhIdBhbIHLJzM4ZhJdHMsVKmklb+IMbhoGcIK2nBNnGhHwmvVJG5Zqg5GXwg7YJtp
	lfBOEoiKBMlnCFfhIit8CRbi4gIIqbgH9gu0ijHOVhli3c1lwmMWffRVejsCIkpgW1uzMi
X-Received: by 2002:a05:600c:6085:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49cd94845fdmr39513215e9.4.1788168090801;
        Mon, 31 Aug 2026 02:21:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm150432695e9.3.2026.08.31.02.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:21:30 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v2 1/2] doc: Replace dunticks-testing ocurrences with cpunoise
Date: Mon, 31 Aug 2026 11:21:12 +0200
Message-ID: <20260831092118.124576-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831092118.124576-1-marco.crivellari@suse.com>
References: <20260831092118.124576-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise (see Link tag below), so fix the occurrence and
the URL.

Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Link: https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/admin-guide/cpu-isolation.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
index 8c65d03fd28c..229275ebffd0 100644
--- a/Documentation/admin-guide/cpu-isolation.rst
+++ b/Documentation/admin-guide/cpu-isolation.rst
@@ -353,5 +353,5 @@ Some tools may also be useful for higher level analysis:
   latency and noise in the system. For example Documentation/tools/rtla/rtla-osnoise.rst
   runs a kernel tracer that analyzes and output a summary of the noises.
 
-- dynticks-testing does something similar to rtla-osnoise but in userspace. It is available
-  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+- cpunoise does something similar to rtla-osnoise but in userspace. It is available
+  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
-- 
2.55.0

