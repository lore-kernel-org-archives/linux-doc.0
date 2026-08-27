Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F03FD12A
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821617; cv=none; b=Bd1ZECxhIqXu5/W8w3cp+rEcnId/hSJ6rln4sOULKUjwSmgcXkamPKXC/WW/mI7YspgPTAjkFNeGNb7kIkxRZe8fdZsG3P1P9V1jgrSvQuC+Ax6fTwzMY2q5V6zRWqQuyPeG6LoTifW96WUrWQUaLJpxTLap5q0HYIoMADZ9XeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821617; c=relaxed/simple;
	bh=Dv5HfCA1mSh6i3Acx6oZ4tgPaqHqwItmYmm43jb19IE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h6g+/AIIRBH4r2goUB4BAXHjg/JhjFMysKLnom3/ujuuATN/1YkAzObYDKMc5MC7hk5rSArD6fU4fnNDIYBrI80Orp9cDgjKQY3nfka1nlpWmY0o1j2hTrhuOpp3yj39NcmMG1XoEt6u6Qq4p6Oltt2fVoBx1tqYLFyCFfPs7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e4z6cNlw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oYjW2WBg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4z6cNlw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oYjW2WBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787821605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UnIBDxp0KwBLclKxiCvoL0emivWc8/d/qvxTInSqzl0=;
	b=e4z6cNlwkhkpmHov3QS3aIc4xb3Qp9+XWalZTysRqdkhFIhcaI80uKyxYqGY7iOtetBMql
	r/QqYF6KXwwM6OohpJs7Ccd/dsmdpVZLOxz+e3Pova+YwHEw7QvFpCdLPMocl1mR+MpyI2
	weN0wtpJAGqskC8FCNXC+haybrrXjOQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-fksG-LVhOxqh9m-HEzq0Yg-1; Thu, 27 Aug 2026 05:06:44 -0400
X-MC-Unique: fksG-LVhOxqh9m-HEzq0Yg-1
X-Mimecast-MFC-AGG-ID: fksG-LVhOxqh9m-HEzq0Yg_1787821603
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49564d4b849so6089175e9.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787821603; x=1788426403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnIBDxp0KwBLclKxiCvoL0emivWc8/d/qvxTInSqzl0=;
        b=oYjW2WBgwaPCifGU9A71LJ3LNtT3IRqfjNBW0EzIJpXU3VRDAu9QmknI+ZrTvwLIHf
         +iKPhzarcZosnU80dN2Qb0B25u2NIDnC0Lql5EnPzoRycyrCOB9oVmuwC+NL8/M/8a5T
         CFo4bWwYJ8jQkgBdfQ1Q9S5/E3OC9sZpBuT+hYXcFODxjVicy4JUmJ4ktrwd9qyduG8i
         e12VaLHpT45UawLrcQcQ7pwfi++OdzXd0yy83lHfcUmc8kr1/XiB4tJt7Vn5crXZIGjh
         40pipkaMmXPk7clzG6R4iLnmTzzT4KWmYANOUu9lc2JrFLn8k+dF4m5zvjdxQf6u4MM7
         UkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821603; x=1788426403;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnIBDxp0KwBLclKxiCvoL0emivWc8/d/qvxTInSqzl0=;
        b=q04g8c56a29p+NyW2WFosCn9TV/71ni/QkWbJkzlf6dHoyoJ2tBZPd9kLF4/U9aewA
         j+xETMgcVddqVrqj40S7lZ8MR1sJnyTBogEzxGwkeKw2YBXDgBYQJvo21L69lTEWrStM
         2z9TX+ljZPCpU0lZQZilcKGagf2IwF2+jubENhAJkra+jlDXxFdicjaNGOeP782zE0eJ
         o0Y6eKxY9364Xe0UjoOXW7XfmbYCxQhgWUnwZmZo1UbRA6Xp5gfNcKXFZcMsFW06TFUP
         X4Vey8Gl3NA8olThs5RewulXVEVImoM7zHbboe/fpIf1fBCYMjOVBWMepBegCihfzUhE
         RKvA==
X-Forwarded-Encrypted: i=1; AHgh+RoOHPx91Un1RQGUpA2vdxM/5Ra+I4S9MG0UoBNZ1xFE/y9GHlXAJtDbcAC2y0AFrRlMCTeDXqnkwE4=@vger.kernel.org
X-Gm-Message-State: AFuF++kZwlsvZUjAstEtwcPlUwfm7n7GYaLl375wRUo3U5TlUoQB+DD4
	GkWjZF/N3LwsNCZEFlPrGuxrV000cTttoFoAMW7j9yQVVeoM3DfkOhd4D60oMkmF7X87Rbs6pcx
	ihim9NeSe6WR7z9rAzUal0vPeTtzxmsTpw1TKJ8RKFKhXq3emRG6QzjoXT/CWB0PdMCk6zw==
X-Gm-Gg: AR+sD11kWv02oIibjasEdE8sVo7xZCB+jLHDUWkkDuh1NzLrwOrD8P5M5G6weKwSKB3
	bpGCIuWZuQd0BfCKuphlv85lcVVJXvSRpg2QyP/4GWz5NDmLRs37mW5IWozsI9D05h64lGx2Rym
	HIwO2KkA3RiLt5k+yorRANGXePnkzG+ZNCm795JIbrHJfJtj5nlORFelTb/cyJryb4WKiFowKB8
	mxZUqjbZDruowV7nWkIDfihmsS9zpB4b2e/3yJQ+1aaZBd0wQK/Zh2TNowj3UGmKyojyruDi4B7
	9cSIHbqIx/wo/MUGGfArEFEmJravqeSdhXyjpnzTcV1qDsSj4luMqga5C1IF2DAR++r5hinsroA
	mUWhkGiER2tAeu2FP
X-Received: by 2002:a05:600c:37c9:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b2796c07cmr65580745e9.11.1787821602737;
        Thu, 27 Aug 2026 02:06:42 -0700 (PDT)
X-Received: by 2002:a05:600c:37c9:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b2796c07cmr65579825e9.11.1787821602271;
        Thu, 27 Aug 2026 02:06:42 -0700 (PDT)
Received: from cshulyup.raanaii.csb ([2a00:a041:e223:1b00:cde9:6812:f4a4:646])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd55dd4bsm54770655e9.3.2026.08.27.02.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:06:41 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v1] doc: RCU: Fix typo
Date: Thu, 27 Aug 2026 12:05:06 +0300
Message-ID: <20260827090506.1172620-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: 8bit

strategem -> stratagem.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/RCU/Design/Requirements/Requirements.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 8101fe6229d5..b10e0484ae13 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -1442,7 +1442,7 @@ periods:
    corresponding CPU's next scheduling-clock.
 #. CPUs mentioned in the ``nohz_full`` kernel boot parameter can run
    indefinitely in the kernel without scheduling-clock interrupts, which
-   defeats the above need_resched() strategem. RCU will therefore
+   defeats the above need_resched() stratagem. RCU will therefore
    invoke resched_cpu() on any ``nohz_full`` CPUs still holding out
    after 109 milliseconds.
 #. In kernels built with ``CONFIG_RCU_BOOST=y``, if a given task that
-- 
2.55.0

