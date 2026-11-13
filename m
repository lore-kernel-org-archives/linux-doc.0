Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556411;
	b=OHuVquz6IAE+DKC9yQfrQQOeTHtzyJANiwPgWIoo2cdFSw/uHgWCIjfiQc22rAiopGjN
	 MGTHgFTDuRQdpOH6cXDLikATWc7s8g4Xp3kEJ+yWydMUYum/J842neRjM37CW9MbDerd6
	 1CMdluSHPOyzMdIa3mDwJpYxvBDLzB5z/k0up9AxSfo5DdRkBXEo6g3a5OSElLRqzXfAA
	 z5hLLm9ZWzP4Lycm576xzAdZ+hy855FH1NeXbqABrSOUryXarLER5kvucl7fdihRY8za9
	 wXaQsTsZctIdGOskfpKv9c0fpJSzYxFr2hGxoB1J94yauue9+MWA9/smk9to3vVDOYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
	b=F/ih3VIBdkaH3kNcTgWWUoYhVYuaB5HqnrojmEc8l9+q6xLzu5Rxe4oMPbAVzm9LYjAT
	 Tb1P4CokoiStm4KJ8l2O6Uk939BEgcMO1Cc2DYHE7g/OS4iosPhib7sOhjGNL8rpIMHwp
	 CoYqPx3v91hSUqH3Knx2bwNRjsXhIV4RqoF1aAlGaii+J6J56mcJzsuLSw6GwkXWUKg15
	 +C0XoFRdueP0ZqCnvdPahmH1VSW9vuviRtexg5G2Mb/f69HM/W2aBkBzMjZ49Cc/RAaBZ
	 wxv4eg22UVsRHz0acResmKee/uMI20k/cBfeKX2LVjvbmyG6YFx9pvsboVJ39uEf4gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zCIeO/3t";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13172606A321
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13172606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCIeO/3t
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso279643a91.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556410; x=1795161210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
        b=zCIeO/3tWBtEJ+HcJurCtTcNKd+pFHTImuxVmC4c3rsK/s4V0ezP803UdCxi+9FBtH
         yDtGJQSJ3Uc6T5ka2mtyvtL0ZxUbPBovEO/VpWbbP4yVdz04EvwUJSSqvirH6/1RXgkz
         gQojcop/mmFaZ0iVSQWu/owve6UTY7ANo0DWhv2puKZzy/aKXDs0iYNnYzmvR1dM6ryW
         rfaSRCT0AygKXfKpoMa+wqdCeAHeMlTZuUvU3hwNaK2rYldXCHxnW8nasUtJab0d2ER3
         lpuWvqcmckzcc+eZi1zwMBixsIGtVNhZ/thglUmls2yoB31+eIgY4GUFgcFTeWtU3kUq
         HL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556410; x=1795161210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZUV6tRnKnS42LZFZBhlQJ+eFn/2hJ53H3jt9WrofAQ=;
        b=KbMHR8m2Q63Dc6AzkV3e9qRo1rVKlvlaa4yJkOaef8ahkmSSaAmOR+Ozw7VNWjl8rO
         F9Nk1IMtODA/KlILtWm+lDHcUkBhkLiXGZcmqzX7yAg9DW1spLkZAkx1+xYMNjnu9NB2
         Uot7PSUzDpsCYNwoWwnp1tIwEx8Cd5eK1zMT3QznFmbNicpnG3dXK2mMbMaMIngJsDtJ
         Lz2Q8j7oasTziXh1zrZMixLpoAqqXJKBJfAxcRVbk1z+3okSpNJy7iFXhot3j/N8u1FH
         usERF8I4Fmg8KhODMy8WhvDugg5r952E5e84zD2/H5PIKaqlC4TiQsHoiJya7bm74imF
         V9zg==
X-Forwarded-Encrypted: i=1; AL+hErE7feoOOzeSmNOYd5nfbXcHO9YhqmA2aqZB+76yitB5UM7ksy0Y4tRe893cjsiwrdBhWMM+B0TjWak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JI41Y8KBERf6Ewj0sCLs6EN0R8EADu8mAca2duIEwoPM052qn
	aRVdkjsaKa82/gJuelzhNPTrQ3/zemtu7ZV4SoJvjh4FTL3qwPyRRvEu
X-Gm-Gg: AYBFou3PoP6skoVjuBrG+sIeXCfLUY+7iBU4ZaW7rJiYm212/fy9ELQbJfZIWj7IRM5
	YCq0IYehZffq9E46F6dC/9Bs/jOgYim6/IXBmXSLIjckNRwAmcX8klvB2xRTkBW7uYTI6y3etVa
	62tRcBO5kahe3Ixh6BAthbQDu3UEe0ptY6SuFGIRB4FpGZfRFDwhhMbLL6th2CiL1xoDEZt2Cui
	HhFJmbEomHbRCL4kRLZUY4IP89IjE3hpo568SuBQ7pv/zMbjFTQwKQS0/HKvkEIKmS983L6owi9
	kge6PXmu3npMibgQeu77RkWHG8pgW6ej2mFHNl5CZB5GcFwlzLofHNvnwNgUxaTvUPz697zB8IT
	NqT6OS1SH+62gSMD7A10RseW6DkZdHZqsSV9tYjDiQwY97na+jgiYm3OuFzKajVfj327+InKWI6
	dYKwvHSdZzALSFcigRSYm3o926mHjyWOF72LVhf4trAW1lA0q84Whalbq0eJVcsYjn1rwDwgJ6k
	ou03XVJEm9EbryxGs2kDgfqbcauOEd88FkSPuNxXFxnI8iazfk3iWlsQ+reIFNpjZU+qciQTZO7
	l0UkUfe2SY18DYplmyo5lwoA+DOOPQEkRAo=
X-Received: by 2002:a17:90b:2e83:b0:3b0:a4d1:6d7a with SMTP id 98e67ed59e1d1-3b1b0a1f08cmr1423738a91.31.1794556410033;
        Thu, 12 Nov 2026 23:53:30 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:29 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v7 0/4] gpu: nova-core: retain the GSP-RM log buffers
Date: Fri, 13 Nov 2026 14:53:13 +0700
Message-ID: <20261113075317.934264-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The GSP-RM log buffers are exposed through debugfs, but they go away
when the GPU is unbound, including when probe() fails, which is when
they are most useful.

Patch 1 moves the debugfs root into the module data, which also fixes
the root being leaked when the driver registration fails. Patch 2 moves
the log buffer code into its own file. Patch 3 adds a gsp_keep_logs
module parameter that keeps a copy of the buffers after unbind. Patch 4
drops the completed item from todo.rst.

Changes since v6:
 - drop the "retained/" directory: the copies are exposed in the same
   files as the live buffers, and are dropped when the GPU is bound
   again (Danilo, John)
 - split the code move out of the retain patch (Alexandre)
 - move DebugfsData into debugfs.rs, make the accessor
   NovaCoreModule::debugfs_data(), reword the comments around
   DEBUGFS_DATA as invariants, add a Fixes: tag (Alexandre, Danilo)
 - shorten the commit messages and comments (Alexandre)
 - rebase onto current drm-rust-next

The code and the commit messages were drafted with an LLM coding
assistant and reviewed by me. Each patch builds on its own, and the
series was tested on a GB203:

  - without gsp_keep_logs nothing changes;
  - with gsp_keep_logs=1, <BDF>/{loginit,logintr,logrm} keep the full
    64 KiB of each buffer after unbind, show the live buffers again
    after the next bind, and a second unbind replaces the copies;
  - with a failure injected after the GSP has booted, probe() fails
    with -EINVAL and the logs of that attempt are still readable;
  - with a failure injected into the driver registration, the module
    fails to load and leaves no debugfs directory behind;
  - 40 load/bind/unbind/unload cycles use no more memory with
    gsp_keep_logs=1 than without it.

v6: https://lore.kernel.org/nova-gpu/20261014154554.231015-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (4):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: move the log buffers into their own file
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/debugfs.rs       |  44 ++++++
 drivers/gpu/nova-core/gsp.rs           | 100 +++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 204 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  68 ++++++---
 5 files changed, 311 insertions(+), 117 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

