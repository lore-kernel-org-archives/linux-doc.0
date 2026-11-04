Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811570;
	b=OVO//whoaTSkTaOsWP8y9LS2FXNH3luNQooSZOySVdgWpVzvUlQQjvRUe6S202m9B4FV
	 nRe6Vp/HKZluH6I4/ubCB7aNJ9+wPKFdkqizdSDqC3Lenq//W//wMGtFXbh2WIKZ/hxAJ
	 DRYOA97bRtL1b32ivNi+4XF8trQhuCKMndJQGpIKFD1QsZsj55Gpfqsdg8suJsvL3gnp3
	 g8kYOLgNXrhpJKVOhBaIIB1mLmj4CcCkgSdeHJEZGo7GPpQMZswFxrwOeGXGLP0v0YehU
	 LHADyw/dzppGLEazto4ueOBxRBcT826dpsjfmF9wT5yiFC60yjUxp9HnJkAk1KCqxCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
	b=GJxYlFRLwagCoci4foq7I2ZLK1ZEw4tVNZbDiiK0RXMBDFtRwH045nP4miEP70boqNEK
	 HZY9CGil/ECUcOeo3rBob5lS+/85T3opoV4tyyjxpPKZ8PwXXOzBiUtdM7EJvrijq0vIw
	 1GGGmVg3Uw2yXbMD0XEbnUE+YZGd3a1zfbA/Gm7MTESdpii2NvgQsvBrm2I928m8NktIa
	 4UbBt+2abvhyzOUu6litaeClFHTfgEZZibPmg5KdbqlZPcQvf9KjZVgrPwshcc6Gx49l5
	 aRHkMje9g2d+HvsaX0SGbxoh7CCCQd09AWFlKQR5tvfn1Jp9Cm/lyM9SFKtaEMfSKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdVTN83c;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96C606D82B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC96C606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdVTN83c
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36661f953e4so1262249eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811569; x=1794416369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
        b=ZdVTN83cZuFdJy3X+OheFWasrMSC6JUzg+o9axzkpEXkzy3ZcJgs+O7DUe4iW541rM
         8Qa2TjnoF/4+YdE0R4punsPO6vNtDfrsofSpoxTEi7f5bCWNJPqqWSvkmuXPdrUHiJBF
         zHJpQH0jKZN96FKPNP9q6mQpAjU5e0ltO8u+rTtLxq2Z2hd5g1rQMrg3MJFl9Jy9mcK3
         NE8JAvD7FJP/h9XT4k2XM+PHLse6YhNUNfTfxUbkt2g1ne0TSB51Z19KCLpaedla1UdG
         9rCjI5d6khFh/7SQHcVjcXGACkqIWV49AFM6/oYgeoFc2FAZ8l2/2021b2Ogs6DcC6V5
         GaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811569; x=1794416369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
        b=x48ILTZTgvoo0Pn81cio5t9LjKRMeThMtu/Otef7zpjnFmztuZyEdP31/XtR8FSInV
         oo4cwAb58Xd7kEkhRnnWJRFGUF4t/HGQQYMl9gSSNfzhg5eylFR2dJ7LsNdhpUw0RAbU
         zk+fJzGavVoyqBk+CqFvbAZKtpx9+WR6noHug+yvCPGchGRWd+o0NMyCBZuzzSaw+ydL
         LWT73+ZSS1OgXbVaKAHRgUh/piIAMW+J9yrcabNwb9x1a1jA9rh/jut8G/tlmMOMxHGH
         gglJasYTQm9MDp2ypp3Bd9+Q/Jf3lCu3NeM3fijKsJVS/g8WkkWaO/cFt9D1r+WHd7p9
         CvUg==
X-Forwarded-Encrypted: i=1; AKwUvBxBgXHE6HhYihG88RJ+Jyb/WIVCWfzfQHtGYcIOFD7Yk5GXqAnc35k1oUmXmKjt+qf3oTy1UEzq5w4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VWa/IO+UKcI1oumT/mWWuZlafRO2x8V9aRg91YzRdNcuEMWA0
	WZTwSFETv/J347op9rOHLFwWWXqRvz92ISZq/4OcPmDzLMtr77GhDpRn
X-Gm-Gg: AYBFou3LmGMt6JH0AEWJAym8V3G2AsXylleMA3z4iMbBEPj86l+dEUNiy2EZ8AAR7n3
	y+qqMYgeNuI/3lQnBsHS/dc1yML+R3y0MWg4TWuxXI6AaAYDqdtycDSph0Q5ke1OEqkGs2FGBiS
	UKqBeArtn022ltgSxNloGmIcdlU7J8tK8Wwsw6ROzFUSnS4+35LbuG+Z5VBRvAj+oqD+GQzNuuT
	jb3v8l1Yb7njbk8GArcufmGAwx4M9a9STCnDCqUHwfHR2sbufegLakd0K6XN1iX7ExHTkrP8ybS
	bs2Uz3XlUHKgIZHMgCR3m/20vERUx6infLNet1kE6sIFHKlUUiZyjfVk+J6xvqgb5IyXVK0g3Yf
	i4UD7zGKZ51ZHFQIs0gc2Yj7itUqHgxVeKgfDsvtbiS7Am8F9fKAjFqIefcOZLMh4I5pTzE6EWx
	y8jTyiXMG+2BSJZFBgvmRIEqPrSoXuAw0XdN+Jg/nFahs9oKdgNftZCwvLzvVRk5ys7Ougab8u2
	F5nKotKCdmsyjHLnx04cQEwoy0/hfl3R5fR0iVKHSEtlROiUc37G3M1x5+Vt1+ITy2bdPnpzsKq
	kAWtE9fexfksKg0NEkCQNnCVHcTpqCf2sK/ebqU=
X-Received: by 2002:a05:7301:1a15:b0:369:a113:756f with SMTP id 5a478bee46e88-36a423f980emr22997970eec.34.1793811568303;
        Wed, 04 Nov 2026 08:59:28 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:27 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 27/28] hazptr: Add Bloom false-positive exact-match fallback
Date: Thu,  5 Nov 2026 00:54:45 +0800
Message-ID: <20261104165504.2430480-28-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After 200+ scan cycles without progress, do an exact-match
per-address walk to determine whether the address is truly
present in any per-CPU or overflow-list slot.  If absent,
complete the waiter immediately.  A wildcard counts as present.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 66954251c332..13ae9eb26a8b 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -407,6 +407,7 @@ struct hazptr_waiter {
 #endif
 #ifdef CONFIG_HAZPTR_DRAIN_ASSIST
 	unsigned int drain_cycles;
+	unsigned int bloom_cycles;	/* cycles since last exact match */
 #endif
 };
 
@@ -852,6 +853,18 @@ static void hazptr_scan_do_cycle(void)
 
 	mutex_unlock(&hazptr_phase_lock);
 
+	/* Bloom-false-positive fallback */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		w->bloom_cycles++;
+		if (w->bloom_cycles > 200) {
+			if (!hazptr_scan_walk(w->addr, NULL, NULL)) {
+				list_move(&w->node, &done);
+			} else {
+				w->bloom_cycles = 0;
+			}
+		}
+	}
+
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
 		complete(&w->done);
-- 
2.43.0

