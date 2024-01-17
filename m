Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B4814A84
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481706; cv=none; b=XDGaAmj5hzr/HtQOFZaXwEU0U4kkzqOvHcd0evUJD4lmKAWk3+CufopCE928/BrZpmDDqHrqqIXNEvQpNfS+MY/AloJId+D3ogHeHGpd8pC6Ro474HXLPYG3/D8rG/Nli4M59ldL9PBFiy7N966InFl7XJEdF9bW7zad3h5dqKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481706; c=relaxed/simple;
	bh=F9iUnKPd69x1kzlzYWUnxpH2j4Wl66FWniA5h0VpbFs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=Dyd/x5ZhV0KFF/638mpqIHiT6Qcbjz06Vq4UcjPfWS2oLCNrqh15mTiEoUVYfOBoufGxh8lbikqX9vUlstSek1FKAQ3zeOJHkqMOw5detuiHTI+kxAfDzy2qySrgcTFn8vR8xL7HmREutkuGnHdtyCbqH1BLM2rW/J86pI6JBjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OaLNz5ey; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OaLNz5ey"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5988e55ede0so3902572eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481704; x=1706086504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcxAQkZF+MckJAt7/ROaWN2pRgeSxSChcm+tDuX3FGU=;
        b=OaLNz5eyKFFqjX45K0dQw/Ozw4fdIHi0/ut+oZQ8wLuuCG+WBZFIRoHbEvv+QJhpV/
         KV+hp4UviTXIyMXWdS8294TCoonSgqX0eRESffHzERT6jvRppVbdw7DHjjALyNp3qJV5
         Eir5QeXhE4XgHNet/qH5c9zSLENgivKaVbxhJ21zTFeX5U9SqJTuwromlPDq0E2DTP/D
         Klmx1/7V5MoFE43v/FEMYuUIkgnWracGM5awMQLUPoI1AayTGRz0fXK4xrSd5HZCB+hf
         tHwGsQz2Tj1Kw55+CKrkjb29gMwFsIBbYfk5Rjq6Du6BgNE3tZoK9Fy+vIIcSFTQtu5Q
         WNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481704; x=1706086504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcxAQkZF+MckJAt7/ROaWN2pRgeSxSChcm+tDuX3FGU=;
        b=O9Ciiop3M+hEmw/gFzxg6D/MoMrjGhcckZ/HBzrqeXfb0lHtnOwQeASLSFKR7loavB
         WZBMH00y4ErhmfDRDSYB1d7tpcfWvi2QHybx2AcFVmySHBDJVFA1+SZs6Ju2DOYreeRx
         hkYKJHIWLLZefadrmHX7LFjAU56u+UvshGTF8WS7XtXIqks388S2Cy3RiASqi0Hg3GSA
         nXQgu+L8KnjFL4WHVQmqFW8nbQY8pGppL4Wdypvhu+nPJC7mdTDawBzFWmq3TXfcEn9P
         ePO5SYyM5u65GNAR1yuGfbvQJI3TiuCaQO9TzQ+fk1YOkcVWQRCCpsSpRRIhTO57Ww3d
         8y7w==
X-Gm-Message-State: AOJu0YywAkG1vSG2TVLrCRX9LQxOApf6Ay+hBVX47rC/03LgOZqykQ/v
	PgcCtvVfSpI5JeIGgrRAeD03EmzaBaeLIA==
X-Google-Smtp-Source: AGHT+IGYsEhTvMZrgUMoLKUK8wqo6PIH5iuaheLN3j23THicnggdTyyMvPb/H5vLM1OimQRXleupqw==
X-Received: by 2002:a05:6359:582:b0:175:5e4a:f93 with SMTP id ee2-20020a056359058200b001755e4a0f93mr7320355rwb.20.1705481703914;
        Wed, 17 Jan 2024 00:55:03 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:01 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 02/19] arm64: make clean_dcache_range_nopatch() visible
Date: Wed, 17 Jan 2024 16:53:40 +0800
Message-Id: <20240117085357.31693-3-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

When we hook into the kernel text patching code, we will need to call
clean_dcache_range_nopatch() to ensure that the patching of the
replicated kernel text is properly visible to other CPUs. Make this
function available to the replication code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/cacheflush.h | 2 ++
 arch/arm64/kernel/alternative.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index fefac75fa009..f94255db1c75 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -104,6 +104,8 @@ static inline void flush_icache_range(unsigned long start, unsigned long end)
 }
 #define flush_icache_range flush_icache_range
 
+void clean_dcache_range_nopatch(u64 start, u64 end);
+
 /*
  * Copy user data from/to a page which is mapped into a different
  * processes address space.  Really, we want to allow our "user
diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
index 8ff6610af496..ea3f4104771d 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -121,7 +121,7 @@ static noinstr void patch_alternative(struct alt_instr *alt,
  * accidentally call into the cache.S code, which is patched by us at
  * runtime.
  */
-static noinstr void clean_dcache_range_nopatch(u64 start, u64 end)
+noinstr void clean_dcache_range_nopatch(u64 start, u64 end)
 {
 	u64 cur, d_size, ctr_el0;
 
-- 
2.20.1

