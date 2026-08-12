Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A951E435531
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534681; cv=none; b=XPj2l4bakPEbox6UvKY6JJj8TzN/ku/cU8DPcFqyqIt8sA5u2DSRiXLzf1LdLSxFeqPvpq13+pljakAQxvH7oMm8syaHBXm5m5fG9RZ6SeYtqMPoZ7I9z4o2CjupGzKsHA7aMjKlJqk1LkHWmvH0G/TAPdrAG61knyodFhPDYMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534681; c=relaxed/simple;
	bh=jDfIbzSqGcbqJ/gqdcs2ubDNX1rWm1iyF+1niHiRsgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTIyXUw+/pNfXOc8cVaGgfeiZqzAikoyPuQBr1yU8zyqSPJMR2kJ+MB0EHynOqgzU7K/ibXdG6hmugW4STXFxLzhK++3yLpLGRNKtC8LIPGON6rQo1KND2iwuhEX8ep0M3SR8AIkLtEf3g130vWMuLXEA/zznADIa5TRaxc6Cvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiMZkX/4; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiMZkX/4"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a0faa764beso5558751fa.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534678; x=1787139478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeOecHaUfHefnAFIhbafWVLtAYJ8GXSjd2T8fSVMv8s=;
        b=iiMZkX/49/yAKGkXaOX9c7DNJH126TFm82hS0hXGOUAn0+tQfKyehBPKnmpO4CofuC
         Fo7j5xXHOmzUhVct9Q9lDyv8r7b/wIxJekPiALD1ZnmVwcSD1v0PP4WL3htrymgn4Smb
         VEsrav1FVu0r8Bp+miufZi5a5EaKBSVJWiHW6PK5mpf3clnYL3WtE0m/r34DW8WTlGDj
         41D1iay1jmMlDcs3rGmN9zxDj/bIOOGwLBqpL20aP9cp+ir/fykRg+OVgt1xmDKfBjnh
         RkX2bozP7J+359WHiLMta9DveBly3KuRe+jXtgGjWCSG5ktmF33mwohCbvzs5JCyh+yu
         Pw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534678; x=1787139478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LeOecHaUfHefnAFIhbafWVLtAYJ8GXSjd2T8fSVMv8s=;
        b=EUzEO7WSEDWuNdId2vB2IuYGEiXVohLPvbDotGDraYEm3o4EFeDyx8Q8QhKctrfar4
         7TS3idLhPxxMZh0vvaLv2SX9dKRQy7HGZGo5tN7MQb0tIl6sL92gbelafrlXzWUgfJP8
         d5dZyAl788TJNG6ax3Tct/k6hoFiocg31dzNpTO3kcaX/8XDe7Mk1+9jTBQIlcU739NS
         M+e/QmSlMqh9HNqTvKq97kk151lLccyHXUY6Z6iqZifIe0nqIO0uy5eUdXu1B3egIVbH
         mFCyj1l+fmdKywepbSoi3Ni6r1p7kWASndZyin5R9EWLuWwulKyZDgyc0rzJ+9Mzx+8d
         5FUw==
X-Forwarded-Encrypted: i=1; AHgh+Rrr6bO74eGzjKPcSwtOMFKJcRdy/TkjRbNRLHimppWDf8iqSMjxk6BT46iiBNMtgNZprvqfesn3FP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeoF99gh7yiGv8WpjxuHXCI+Pl2LkDZtS6aTpwxlfBWbX2KwzI
	NJet8xT2zJyVutommkR/r2fv3hsZNl9FBNYuu3yxH1KneWeXcZiZjaom
X-Gm-Gg: AR+sD10u1evQNnQ3g3PDRtWoNFvxGlwXxV1Si4kUFyGKWi+0sUrcE4ukr7HtXXSQQLe
	qmH5HujN1ect3F6MD3rarhZavQ5bIvK7pdIADYJ48MS7+B6mryGUohdZWuhTpPVBZm7bZALetan
	JjM/ZMyZFAmpZ90AIb3VOfO/LI6jpHyVg/6v16c39ztJXAJmZPfw36RLUVVNvegL5dCUHc+qf3C
	Q4gi+bld3M1SDtta3u6u5YeUcNQL9aHKitwEjmOz+yOtUt+nMvYDAIOIVnSeaGijrYQe8c2Sv0G
	RLaOBZccsDDv3aCp7z8iSbha1vLsnR2yveFCqLhVckJFNavdkaPcE2eLyjmQkmZjTtHb9dPW2wn
	Q/9PU2YTsN9wGVqHGLzKltcC1s3sMFw5gIojHlH6zhaM3sG91mBnKjTDN9alAmZWx6oJ0O02xLi
	oTyolm+E0SJRLGf/iXOhvbXfNbfRzpZLuE+sOtMwJcMJ+HRA8N/Yd/kI52w5jctQmEoPiT/SxmT
	fnjzUI=
X-Received: by 2002:a2e:a9a5:0:b0:39c:7200:b9b9 with SMTP id 38308e7fff4ca-3a10d53515emr4862991fa.13.1786534677463;
        Wed, 12 Aug 2026 04:37:57 -0700 (PDT)
Received: from localhost ([176.210.177.198])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1082d11b9sm3881101fa.33.2026.08.12.04.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:37:57 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: aliceryhl@google.com,
	ttabi@nvidia.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH 2/2] Documentation: nova: remove completed GSP log buffer task
Date: Wed, 12 Aug 2026 18:37:52 +0700
Message-ID: <20260812113752.532537-3-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812113752.532537-1-vladazaharova2018@gmail.com>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
CONFIG_NOVA_CORE_KEEP_GSP_LOGS they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b08fb..cae0578d32f1 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.55.0

