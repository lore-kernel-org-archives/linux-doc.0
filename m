Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC3330D406
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598339; cv=none; b=L67Yf5Q4lYpu1I3iOz4OCEze+HxZU3Mpb/0mQTEkoLIUhpaCJOxE72yXezgseHdoG0JwW4Jx6Jtyqz8IRtsoqyB97iPumOhFgKzC5qI+4qZGZMaEHnZ60ZBe5pBIrvbiUc3f1wANDhtF84RcEUJQCxvmWxDwSJ26e+QFHbOitH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598339; c=relaxed/simple;
	bh=miKG78CIHx4clQwji0PO9K/QeOzt6iK5U2albASuWT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ncYVSD+0ITTPe9TA7PmK1akatBfAgkTN7WpMiXJHa+Krq15BNX7GT1pS6pAIAEIRNhaaPbRhxx9bGdkrk88M3mdm7Hr5ExFFDowBRDggsXmeE//Isk64hHE1q9B/DrEdEL2L0uewyceZivm4maEK7FBPzJ6TCh39kdbLRCKl1AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3WrUtuV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3WrUtuV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4858595f997so1124596f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598335; x=1789203135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDGhb3vDecChWtUPbvLVyZ/RLgOgMEw1nfoKZoDLnlQ=;
        b=m3WrUtuVk+tl95C3eQcf7eXs7w0NEI1XUQnT+cl2IhTmxysEg5TZmAFAweinHtXti4
         q6YsZwUi+ZuuVgT14wOXSyi1l/i6cJRmn9JyHAoiXy5iKMhzxCbgXSxmvUP7j+9uqXrA
         EhBvh2FhgJKVMuAOa2g75ZZmdbUcODaXwfgYFBHCExx3RYljqhZwRE9bwj72/KqBpBMj
         nmJJxIKPAXW3kB5LASE46g16lZWDASAe0v4kQU339eTIUb/6bvLXBs7GYJ53sTNJiuEM
         axFDdvlKEj1Ly18I6T/loMy6i2ZoRP4DaJrHlZhMFWQl/gO278ELLMAwno3h5MSNtcmK
         KseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598335; x=1789203135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDGhb3vDecChWtUPbvLVyZ/RLgOgMEw1nfoKZoDLnlQ=;
        b=KEJyM6AAJF2nrfOhQuC6VsuAnmIoA+a01ws0us7+izHrzL4akZ18iM5vQ9s8hGyUa7
         MWiR886EfBJmpHF7HR6Y5C4FcfsGwS401gP+nOUKnZLt4cmJTYxx6x1RF2NfJIoNhpb5
         TGyfTmFPtGPXDZ8JP2TQuzrWaK+DtT8qYnGA/Ag8RMOVZ49GhPFErYKUMMnAACmlBr0I
         9iwGU5wRa0RJUsvN19BFCi7Q0Vx7oKhHLH127lvf7xgccQK5Q2tm4Bd/EGsocu2/35fb
         T96M293JzOmQJwu0jUkyEmDpINtSnq7OuPM6OLOBU+nmVHXktp0AZI1DCbtxGh3a0Kae
         o7lA==
X-Forwarded-Encrypted: i=1; AKwUvByDA0ciPFqDSgODJvg3sn5XCwYs10srdqyh7fbtGY5a7Y+Xw5o4KVPn1EFD4ATE1qNNG17ylIP7qKw=@vger.kernel.org
X-Gm-Message-State: AFuF++nfBEV7O3eoicAKLNUbbV1bMd1/5Ft/MaPAXRjXE2CbIZapDFXk
	fRiIDxOs9D8c4cLnu3cdE94EsB5SHo00+fNeVheYu05nMPMNpRyqW/Rn
X-Gm-Gg: AYBFou3BUhOWyq9xV2tLYPk/RWip8uudBJap0pip7HYnt5Ckca5UJR7Xb/3nmazw6M3
	zRsETHTFaIx7CqOGyLUDbWkcqoWHLyPYTBEK5vEfRZ/bzCn1bkERImitBgRpXrGRRLhrd/eAOX4
	iIuKw95fuu2LgLKsPzspxzDMi/bzFgZZpMpEYEp4FOrOWJnkVX1+Vs3KJDDECOELbZqq9eQAHzh
	fi9nz7dO83ZU/WIbPKsQBb/Y/4NzV7cA9QWuZTR5TUz9XqcSe4b4B+oWspH+ZHWZSD1ynX+W593
	ASiv9FiUcqktMgwJoRA7UH/YfWVB/eXptCBBXRYbdLNnylFiCPex7ez0uLHr6VUdRh6jydHYKaV
	0l4uwp3izwtf0rZqSiTRLC8aSurrVCPGXkMbAKxpvOcirFWvUZd2QxTFxJbAqqV7D+6ytqrWhHs
	VTlNOnJub/L+UTHOjNSSoO6KZvD6JK4Igb95JIdsbnl6w7ANdq+u/F9ZWWmoRtwPehLiiysunn1
	QmTTEqM0qQAp9doNRP3QveOie37i+0CGSKzrsv6fc8Q79zbAENPXu9eWB13ct/xO9xIaWKKaFmB
	BK+t8c+MPOVVzCzyN44aJZqPpV1FtmQxVhip3EVghlYIwqBJDnMWqPtgKRMRQRS93V0=
X-Received: by 2002:a05:6000:29d9:b0:484:3310:710f with SMTP id ffacd0b85a97d-485872934dcmr17557621f8f.27.1788598334606;
        Sat, 05 Sep 2026 01:52:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm12995609f8f.10.2026.09.05.01.52.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:52:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] Documentation: reset: Use fwnode_reset_simple_xlate() in the kernel-doc directive
Date: Sat,  5 Sep 2026 10:52:11 +0200
Message-Id: <20260905085211.40286-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reset.rst asks drivers/reset/core.c for of_reset_simple_xlate(). Commit
9035073d0ef1 ("reset: convert reset core to using firmware nodes")
replaced it with fwnode_reset_simple_xlate(). Since then the directive
finds nothing for it and the default translation helper is missing from
the rendered controller API section.

Use the current name.

Fixes: 9035073d0ef1 ("reset: convert reset core to using firmware nodes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/driver-api/reset.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
index 7a6571849664..932699c57d1e 100644
--- a/Documentation/driver-api/reset.rst
+++ b/Documentation/driver-api/reset.rst
@@ -213,7 +213,7 @@ devm_reset_controller_register().
    :internal:
 
 .. kernel-doc:: drivers/reset/core.c
-   :functions: of_reset_simple_xlate
+   :functions: fwnode_reset_simple_xlate
                reset_controller_register
                reset_controller_unregister
                devm_reset_controller_register
-- 
2.53.0

