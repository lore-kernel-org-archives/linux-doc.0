Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAD91632E7
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788599871; cv=none; b=AJh48evRtaHEsaqGIG/ko5HiigKV/sdQHmF0OCXTFhJyDShD+i6c/c2li0pARNEQy299XQ+s0cRvFBF3rlDT8yYqCDV+tUFPVUvY9zWWkUu0dHK2llmQrO9Us5N4iBsQW8vNtkaSxk90BT997j9fN0hC4/yeY9mxfjeJYzRTtoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788599871; c=relaxed/simple;
	bh=Zvtgyg/V9eDbJuce8rlRcgUG0qD5fdGXjBQ8qLDCEnM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kXyaVI3CIJzmu0+3GA13K0vql2bVq383Ilsfj1T54rlDFjA+ftIXMd/evsa0uQjWTaFhq9AuAVtNpP2ySOkJUZ+bDVN56NHzfnR6ZmyRSief27fvC+p3EJqu6lN5HuOxBP0Ma3c2i7CVDUFDb+u6ZCk6ud/EHfQ/ejtfCx4J3sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8l8TXjL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8l8TXjL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1857703f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788599868; x=1789204668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZUI3+FJupAKCmqenCToPHxMW6zpjYhH7gOUWlHHmug=;
        b=X8l8TXjLvG4V+cVkIFyc+I8QT0Ugvyku+Jgq+8YTqQIWGGNqQnYdNY8YjaF++8YyVA
         EuhAQWeZoZgEuk4itxu2SjodM61+9SkiH827N0ySiia2ktsneywQzyH1D05KdeUXq0QV
         KKHNjqNB0hV0b6KxGU/IDrt+6asqgwjlyAOzv6fnLzJ+al2XHTlAfBzrQuI2lPdkCGYo
         bJqEDUEex9HXoSZ7yta4lPg01dCuCDKBhdK0qcHfHnWR6+IzzBrU9pzZ3cKZAt2wEKBF
         74dVlmI5Zp6pUlAOvgCrS1ICcMvP9Ybcuyf/z3G7s8vTcB4q+bFE5nTrsVguo5+r/zbw
         Xuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788599868; x=1789204668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZUI3+FJupAKCmqenCToPHxMW6zpjYhH7gOUWlHHmug=;
        b=MXCQnQ7StjHcXld5mC9TnMZUzE7nwzniww5mbDPilzlknv4/2nweB5FKW3PIPAqMkR
         P4juAVQiRvOiLGLGBJOBCgVLDIWeOjKJCs8mRGWXknCYaHccmza1eQvyC2Z2XH4S4Fx0
         BR5XVj1qM7rda29dt4QV4cGHF4b8Vni7jEfO3RXNetffM1HoO+a9qYMkhtBCtI4jtXVP
         3eFh2Ws3sYHABpIiR7i0eT6fM8m77lyF+8sjlcV3poQZSwKky9v7rgwvxzF+YR+XaM91
         uzV30ch/FH/ZS2f/jVWsMXL3ZcIRyjmVaT9F9uS6KEtJ5JTQtIDwAU6CcVGfkc0OTBYi
         WufQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZu9WpxinPXT8OxdlR6eCjJsWHGMWYrhjBAh6qWdjWqxwVL8+4kA39ijcrswTfhjc7j5ZWzUHlLhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lwPYvf5UWOvb89Ad0e5kUazYStxq35vCzEun3LSupBrB5LmEy4
	srTT+TYp5B9RWnGcYJ9CZfLeWd87Ck2ET6IMZnT+l3pTlWO+QfUWSWXa
X-Gm-Gg: AYBFou0/uEYkL48crkL3Nrnfqc6B1lUWSKjvKD+dtJBE5LkEyc0xp0uPDYNxSGdLUSl
	+5qVmxZAympAddT9RwxaQfBkCKbO6ztwlkkcw1fDNGIxQQzBq6AJB1lTe3l5cgUP0Fj4n8E7I8z
	ZJuJGrq0H17zGfIAzyk7zmf0yprGB8gD1Q2oe4uyiGscry3h1Ota0TyYq76Yfb1aw7qFxiLIFml
	mOYOuldkLMsG9JlFsOLSEgZEBZmE+1hRZ1/Ed94BwZgGYsz5aFQf6NyNT4Br2nI5spNr2b0TKXI
	V2anGhIHGRhdyg+YBG0BsAufSC3BEx2dvZV+p5JhYLLUMNqWSgrvQ7Bzm/FdlDghN2if9y3NcTK
	rKzLG0fm7YkuLBKjNJumoBK2Ha0yAQ8BUbcEV2oED9pG6CCPeOWflBAPF6V7Gy+7BCAWGdIbKWz
	jKg8PPLjKCE2tEHWudTpMWTrQ/wtW2ib9j7c3J0+m2LM5uEB7Iyuc7ZxEDQA/QLhEfLhdyLYfrz
	H+WWcBh1R2/7dWTKTzq1CpXTlUMA1+uqYP8YDK91MVHbFloF+FqHTrTONEhEpmag+mt+bHWPQOb
	c6FbcKoEvvFZGwsbCD1lBN2pWIjGAcoZYXKD12QZwei/49IqnFkVj2pZys5abF2Hbm8=
X-Received: by 2002:a5d:6f17:0:b0:485:8c16:5ef6 with SMTP id ffacd0b85a97d-4858c1660c7mr7738336f8f.48.1788599867585;
        Sat, 05 Sep 2026 02:17:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm12500824f8f.21.2026.09.05.02.17.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:17:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] Documentation/features: Mark cmpxchg-local as supported on loongarch
Date: Sat,  5 Sep 2026 11:17:43 +0200
Message-Id: <20260905091743.41006-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/loongarch/Kconfig has selected CONFIG_HAVE_CMPXCHG_LOCAL since
commit 07d5798aadfa ("LoongArch: Select HAVE_CMPXCHG_LOCAL in Kconfig"),
but the feature matrix still lists loongarch as TODO. This is the only
cell in Documentation/features that tools/docs/features-refresh.sh
changes on today's tree.

Mark it ok.

Fixes: 07d5798aadfa ("LoongArch: Select HAVE_CMPXCHG_LOCAL in Kconfig")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/features/locking/cmpxchg-local/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.txt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
index 2c3a4b91f16d..127e8159adaa 100644
--- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
+++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
@@ -12,7 +12,7 @@
     |       arm64: |  ok  |
     |        csky: | TODO |
     |     hexagon: | TODO |
-    |   loongarch: | TODO |
+    |   loongarch: |  ok  |
     |        m68k: | TODO |
     |  microblaze: | TODO |
     |        mips: | TODO |
-- 
2.53.0

