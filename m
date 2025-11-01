Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B773BA45
	for <linux-doc@vger.kernel.org>; Sat,  1 Nov 2025 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990482; cv=none; b=Nk2NsO57MhkFrP6Eon5Fej9bOfKbA3zw6n4ihmCD/Da7MPP2Tf23d9seGH6drd3htakC8FIJQOi9bku0SlteVnK3odyMZc31DXmJGuL5uHmKiou0HYIbb5ZqIsmbhL1/fD+wqAr8UJ56zOqpCI883RT7gNt93HSazyPkMUWyC3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990482; c=relaxed/simple;
	bh=WsMaVYjhEX5xzYsbLkIYbNUU/KAzYM8jBkJPwJqvx+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgEOSc4+8l7i231exW2Okx16igbYO+Xbz6dqGFxhMVB9AkiV8Kfn8r8GaGOqmSR8XydFf9Aa4vhiVTZAnJ/ORQYT2TFpogKhAB2BbGe+y13mnTZ7Uz2xENLmSjRduJudTuwtzvQ5OJ+pCA1eKdGdfD/aQI8g+kKi4uKOuO1eans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2KBum1A; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2KBum1A"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso2248918a12.3
        for <linux-doc@vger.kernel.org>; Sat, 01 Nov 2025 02:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761990480; x=1762595280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys+iXshBYZnizwFhgQPeQbnnGsPPwsLlRfA8FiXKhyI=;
        b=i2KBum1A1oetCqXn/NH0NnP0kM1of8OivYXErx5FS7wf5Ny6rLV6nSuuL2EeZ39B8W
         f4Y9NFPAAcVYr6FMaeebliczS9IxyZHoU+XPuceX/CG8SeVQNII4jeHZ3ydiLw1dl2UO
         yfxMIEkpjrzfmZ5ddQHbkR+VPGJGnsF46AesdYLNDBRustXeFjRqPJGyhDHuOw/DcVcJ
         hzwYzmzqD8LIdbbiLAV1PQtYA5PaW7WvfQgBlyjUpLOQb4smhQEcS1nMx5tGS/ql5LtM
         EcLwk0qLrAamMbgUOxo7lvOPf/VZfMbaWo8+VaarpW0ayar61mFa6EiLXH/OzQgdIe9M
         qtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761990480; x=1762595280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys+iXshBYZnizwFhgQPeQbnnGsPPwsLlRfA8FiXKhyI=;
        b=h7J38mBPp9P2X06C2q6Z708/z1Fy9azjCCBdU911D4Oeh6IN3B+flOkebdEuQcRj0O
         PQLZgAjMm1gXs3N69zCZaoOUH+U3co4bQVDkuGmtYPGw0hdjOaGWkOAw45eO5D1UQigX
         Z6j9W5GAZfApgAEkhyxklbeWTG4HdFNG4Lq3KRuNVB1ReWvds9umKjk2s1b7b5Kkdu/8
         cauIQgdZApNjAFP/sJ9kQrLZGag/NMmNi8hsI5J5AGi4/uPygXVoOfPsGvCZZcmqnxLi
         60xdb7U/KhMUbPj5rVuKIAdMB0BgphX/x/dgMdzJelmFNfcUdpyKivES0a3lSQ8FRftL
         ankQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyS8qWpDQnRaWeaZxYS3sK/TiEXKkNJIK9+SibT6ctIsM79SVo+3JblBZnPyOnlyuiwo4U1MZOE1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPw+nApM+vSTpp4N8IRfSCL5cbAD+vX8VYIZcpCHdeJ4pcpqK8
	J7aDerWkyIaqoohN7ocskc9ZKO5ICkCN0CJgxLYNCLDom039UGR94BEGUMRlfngsvCY=
X-Gm-Gg: ASbGnctJo0yv31GtjpRrSEULi5v+BBgAL/OBwrXtx6A8Bhx39dj4JnrYylLg69zYRLB
	otsr6BH8RNA/95FyatvsTlR9b1s0kwzkBF3n9zAL2hb+nMvGyU3bbjfX9bih9p8WOvaTu2TDdHO
	XvarEr95HdH93F8nBndM8quZUZFTsrUg7WwKdkez5YlVh6U3yfEpwGTe1LJQ83t35G8rtAb2qrr
	YoEHhjMD1ivnA3h+Mr9GcaWdRGBnIdanV55vXKo7HeJwv+Paz1Qod4J+sUCw9sZhYna11tCTyXq
	tvbSkJjO4eigBPzxyXCKXjr7TEYvP3ikoYt2Pd1T/JcdUYpq60v/eXvYB7ivYRhRQsid1Le/ps7
	q1Sppb4F+OeZ3ybQKl69LiOFpmKBzA721DkKaOhSQ7tK0ho6Qcsu9UaMOrI59/6hyvrQ8/tvODV
	da
X-Google-Smtp-Source: AGHT+IEuf2OXCpVvj5mt9JoXkTV63btzK3GM762PmBpPq77R+yTBCtQ7CzPQQFc+4UmjQ7/sOnLiHQ==
X-Received: by 2002:a17:902:e5d2:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-2951a38af0amr90955605ad.18.1761990480237;
        Sat, 01 Nov 2025 02:48:00 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268d10e9sm50868325ad.50.2025.11.01.02.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 02:47:59 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 64F3D4209E90; Sat, 01 Nov 2025 16:47:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next v2 1/8] Documentation: xfrm_device: Wrap iproute2 snippets in literal code block
Date: Sat,  1 Nov 2025 16:47:37 +0700
Message-ID: <20251101094744.46932-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251101094744.46932-1-bagasdotme@gmail.com>
References: <20251101094744.46932-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=bagasdotme@gmail.com; h=from:subject; bh=WsMaVYjhEX5xzYsbLkIYbNUU/KAzYM8jBkJPwJqvx+Y=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJms13Kblm6rb3ryI+T9Q+WPFs0pi1svRc3x2Oq64MTPF 0zlH6+d6ShlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEpPMY/kr62J815jXz/FLd 2HP0xr50vrL37DMXPGjLnBejwvieo5KR4e/D+bXTT/7i4HW9dY7Tc9VR2b5lk1fuPj6N0SA9zPy 2OScA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

iproute2 snippets (ip x) are shown in long-running definition lists
instead. Format them as literal code blocks that do the semantic job
better.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/xfrm_device.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/xfrm_device.rst b/Documentation/networking/xfrm_device.rst
index 122204da0fff69..7a13075b5bf06a 100644
--- a/Documentation/networking/xfrm_device.rst
+++ b/Documentation/networking/xfrm_device.rst
@@ -34,7 +34,7 @@ Right now, there are two types of hardware offload that kernel supports.
 Userland access to the offload is typically through a system such as
 libreswan or KAME/raccoon, but the iproute2 'ip xfrm' command set can
 be handy when experimenting.  An example command might look something
-like this for crypto offload:
+like this for crypto offload::
 
   ip x s add proto esp dst 14.0.0.70 src 14.0.0.52 spi 0x07 mode transport \
      reqid 0x07 replay-window 32 \
@@ -42,7 +42,7 @@ like this for crypto offload:
      sel src 14.0.0.52/24 dst 14.0.0.70/24 proto tcp \
      offload dev eth4 dir in
 
-and for packet offload
+and for packet offload::
 
   ip x s add proto esp dst 14.0.0.70 src 14.0.0.52 spi 0x07 mode transport \
      reqid 0x07 replay-window 32 \
-- 
An old man doll... just what I always wanted! - Clara

