Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51536897C
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 06:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785048211; cv=none; b=cWVNiqIFPe9Icw0EF7sfVi4W4+SRJ6mvL/ICYsEwF3u8hNeJescy/aDCxu3qIVvNWNXBArfikC6HCMbHt+VcGLsEItkLa14hIYLdzSvW7KWd+qSb5amIhQO6r2lVIokAkZPoR7p+58XgDQPS/60Jg0GHgAuF67uVKJzoze1j2+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785048211; c=relaxed/simple;
	bh=lQ0deDMG2ApjUGYfjrTxheuqqCEzUkKh96mLGK98wEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZIPU2K/kL1eBSACE3GS4Cdfl9Xh/woUT84kXYAChS2OWJV1VliCQs32pgYFneGjXf/blAxla6aZHvsAyx1xwzaz8W28+H5IaoVANIf9guzylvp6vT3UNAGWPYjN29hO6OmjLMKVgEaY9T/fdkX4ILZlES84KCT7hFKOdCnZLL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8z8iwBK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8z8iwBK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so2081619a91.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 23:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785048210; x=1785653010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsKwdWS067cUnKKxouS4gGBgT4NLjJldK5XvcD/R/Fo=;
        b=X8z8iwBK/f7gTuilqdksWPi4Y3dtFP7jjZtaQ+f3VOixGHk7OG6VUGnENx0eOgZIDx
         ghHIoEaWw2z6voxkN5/9jGVUYD8k8uyh16vkiVzMnixoAYaCCnzjz494maprp1LDXo8V
         FEyWQdO1Pkk+HBQFyFoO6MTX8Zx3seBNUEcqMxwduabipvaxFDiYPYBNQJWxsXi49x3y
         p2gD830Ku8RjCGybigVIIhMASRXBuDz3DoERS90WJMEO5MVmPfnWd7zm5h68mAraHpmY
         4QdPwWREPXDBg3r6nolqtJALffb1g+8gacKQREqFVy+phZxzNl8YaJgxHDr6zPVNsT5W
         E+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785048210; x=1785653010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsKwdWS067cUnKKxouS4gGBgT4NLjJldK5XvcD/R/Fo=;
        b=aVSTJQ8N4EhXazIvjhiH8UISycew8R4cHV5Eec/9VTmIvfNmARXyueJzd5HYiRrkCX
         Ruev0C95WWo8qD2wEyIO4e0Hjijfasfof9quNlgl8mj49cLpEM5mBJ8a4I7H3W6z3Poj
         8GkeOGRP2WzuUDP7NnF3qMbAOefwSogoE7ajSnxu+bJJv4fEYya0MFD/wY+AG38EA7+c
         iSoBFd5UBoUb+z4KMAPPj88oLOuOuo1Tpgn4LF9+WH6isLm4BG3C53XLmM0M1YeC9s24
         t4znWm7yTDVbT5TWvYtBNNUzGjcVwp9jmE20CB6ir9Bm9o0BpfsZAYSo6YsrQZVC6C2S
         xEsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+zPBjVEJazmvnJYAC2LvooDwctJA+cGtIIhXHYfCBqL2g7LnKqqRbcbRSQz1KVHByW99Dc1UDIZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDK1laplq0gb7CSPYCkQZpoCCzd6k3y/eevs2fUZWLBUyPAZhe
	WmV0ldCKRBTurAajqhpAIBjHV3yUFcLxkVLtbxYQu/aZMJgbLlrw1GGy
X-Gm-Gg: AR+sD12GA3y6W8yKslri344Ukf3nnXdbkiMw+UmZzXykkBtVE6a4SZJL7+/SqeAlxjt
	spfJlw+736iNCdisOAhQxmdYE/Y02cwQ213lPAiLY2ptp9Eaepr8y712ni/Bglt6kaEDq73eqD2
	OdV6VV78y6hBcaPTB12Hdw7hgI7HPlUhLBw+QFjrIJ374oxGd04BuBGxbc+jE667pEbCvIQfdLw
	Rnh5vXQVR1uBFne112drPOchz/JiGp7cmkFQds2B4ncZlbEpl0njX1eEtK1PS8Ac0gShED5l7Ca
	3VLt/Np1oz2jUknon8Upng9B5pGyrCAs+LTmmbl4P7/gPTUYa3kouC1a5BWqLL3lFNkgVuAp55Z
	0NQQbWm1BXtUJtsjk8x0wk9XVO7MpcccobPNFQ2nc9nEJk3EniwmTQ+kBGBW4HhdMnqvtlPMa+2
	xHqjBhg/YtZzQ7buDDiooh1EtL1l07uUc=
X-Received: by 2002:a17:90b:3f0c:b0:38d:a8be:a597 with SMTP id 98e67ed59e1d1-38f298b4c1bmr4839444a91.37.1785048209741;
        Sat, 25 Jul 2026 23:43:29 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f294e1ab1sm1467217a91.10.2026.07.25.23.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:43:29 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: device-mapper: dm-inlinecrypt: fix 'bellow' spelling
Date: Sun, 26 Jul 2026 12:13:09 +0530
Message-ID: <20260726064309.20263-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: bellow -> below.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst b/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
index 76b3aae21eb4..8258a72f00a8 100644
--- a/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
+++ b/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
@@ -33,7 +33,7 @@ Parameters::
     or it can be passed as <key_string> prefixed with single colon
     character (':') for keys residing in kernel keyring service.
     You can only use key sizes that are valid for the selected cipher.
-    Note that the size in bytes of a valid key must be in bellow range.
+    Note that the size in bytes of a valid key must be in below range.
 
         [BLK_CRYPTO_KEY_TYPE_RAW, BLK_CRYPTO_KEY_TYPE_HW_WRAPPED]
 
-- 
2.43.0

