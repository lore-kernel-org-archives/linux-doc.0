Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C372A2EAB64
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788525; cv=none; b=QF1SoU10r5OAUar28A2Q8IJiX/rta9y1dNPUhmNKRyuDZAzNXjVRZkcnrG6zN5q2pISssudaqWgl0Q28Bdjay1QjUzitceFlfkUCfxhi8q8jOgFKvKXBpPDbRFJD7z5lUrMWMKCkkpIxbC95j2p9JaTaLdmtPXAAEkGoYkuYN2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788525; c=relaxed/simple;
	bh=c+iz89dQ9u/g+Mi3Sy4KxY5gCEephLk7UN+j3FVY1pI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fupL/amc/OxHyWs/WldHLqR76AlSAYK1x8pd13VjMEVYEnEBkgrgrMQl70wxAloxElD/5jbyF35PYYTOhir339Y6wMPHQNGhgcWKK7UJjB3l6VOYtX8yTi7xejw0CrsEEx3tHm3JF5lVZM7jvvARYZHnu1Udisu9hwQMSN5l8uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu/hx+9S; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu/hx+9S"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43284ed32a0so972184f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 04:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767788522; x=1768393322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HYUkIIbKAWCx8zII6J6O7Hf6OJVquFHOvxvfWKIMyVg=;
        b=gu/hx+9Sn24bPGyN65e3nHMdAh+oIt7KUa3Qg/En1DLfGQxDvbSbWEYXGZj3/l4/r/
         3NNvqudj4rK6TSN9voLF0QgK2AsOITEG5pLOPdVP/PYp0xCCs4QrM+dKKFNYEmE/pCjS
         IZeVT2X1Yvw0RhHPUf6ib25rEBzhFHqwlzans7D/acyW3tzgNDX4HQQ0Ho756OmVvIAP
         xAFL5XvLIuoPSN3LPq9/0oIrVo7orF7A25lyhlEmxpDHgdHqu8JQQZ0Z3/9yKP1D+6el
         S8r5Np6si4Q78Jo7xHq9Sov3BUMnP2yH2yDJpAmms9Y/a07E2UUVvCIxz4LoL54DID6H
         mE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788522; x=1768393322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYUkIIbKAWCx8zII6J6O7Hf6OJVquFHOvxvfWKIMyVg=;
        b=Jw0bv7eO4S6p/Y18ljdQBCqBNHZUY4ToBC9Ld43nhvKRE4WEZY2/YUV8El6v6vIq0J
         AVIXDDKVXzphbAWEdEBEk7kHWJmPwo/U8AEnI7ojjx6c/XB624eXc/WQY4VQ00N1+0XM
         OjYX3xbebtuwtaLlY/qu3Z+ig2/ojK96I6M4K1pZT2kHdM/YuE4g0XjMyooBNq4bh4Kx
         oHtJbXvkTe9AsCbdFxurAvO7vnbTLakwcuF30CIOKyA97et/qXvj8ks9f0yIb23ecLsW
         8uXCv/s6aXknGAh8vLS7nhK3mnkG52OPrx+zJkONK/ec5Bfn5DfAVWTkz55NMFrXn7Vl
         43UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBjfKdQ60n5gS8zgzjrzuh37I7SiwvxgszXKvX43OoNW2nJpJujdUX0gZy5lhIfDGT96jeNO7GfSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwONV3coZc/fZqetGdO3yQsRM6eDPdG3W6d95takgFG5oAb6H43
	fC+NW4sLthh4BAb14CIYEL2yX5iNp384iuTOg0FZ7mm1rcpu4bpeAq46
X-Gm-Gg: AY/fxX51IfGX9oxoLWFZHs1k16jKzsDEfRZmDWXqJFMP2NrCs+Jqx9D17jPIwd+RquJ
	yf6gdfAxGXfocNCswDvSJdgxr3ef8QbDHGJhc6sii+4H9JxauH1kbLf5h769gW8DwQtUq354tvV
	edhrmkb3R+U8nRWEeTTkFCutP17HfBJYCtxKJM6SOmrt0DROsTXZpGdDrLRZYpUjVclUvJpU2AS
	ehd6JeR4bHX7G09qP3V68mVnVugL4R35lWwV/h6rgwZWgjc5w1sbAGLMuXyy4SWddLsdcCn21i6
	OtNZNXW2wdM15vL9MChAUf2FrmCR1xRGys4L+emDkDKJlWP8SvV435bn+2ZtQjcRfjJwZL9bD+A
	u2h1+4ua5jIGPNI3sorcktjHg785l2CFRvsagF0D3PQ1vm0rSJXLx61lg7xs93hcZ3/1Ps0HcfT
	sth3zCxSdgHSfbSi7/AO0z1X2IgK6YLgCPA6Faz+o=
X-Google-Smtp-Source: AGHT+IGQNbTjHR0E7DNfPP8RF5ekeryRTwB6i2JVxTh+kt/lodaZ5gwD4qoONHfCKGH1Jj2gq/pP0A==
X-Received: by 2002:a05:6000:18a5:b0:431:8f8:7f17 with SMTP id ffacd0b85a97d-432c362830dmr3049879f8f.10.1767788521787;
        Wed, 07 Jan 2026 04:22:01 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:bc70:fb0c:12b6:3a41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm10417107f8f.11.2026.01.07.04.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:22:01 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	Gal Pressman <gal@nvidia.com>,
	Jan Stancek <jstancek@redhat.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ruben Wauters <rubenru09@aol.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v1 00/13] tools: ynl: clean up pylint issues
Date: Wed,  7 Jan 2026 12:21:30 +0000
Message-ID: <20260107122143.93810-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pylint tools/net/ynl/pyynl reports >850 issues, with a rating of
8.59/10. It's hard to spot new issues or genuine code smells in all that
noise.

Fix the easily fixable issues and suppress the noisy warnings.

  pylint tools/net/ynl/pyynl
  ************* Module pyynl.ethtool
  tools/net/ynl/pyynl/ethtool.py:159:5: W0511: TODO: --show-tunnels        tunnel-info-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:160:5: W0511: TODO: --show-module         module-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:161:5: W0511: TODO: --get-plca-cfg        plca-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:162:5: W0511: TODO: --get-plca-status     plca-get-status (fixme)
  tools/net/ynl/pyynl/ethtool.py:163:5: W0511: TODO: --show-mm             mm-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:164:5: W0511: TODO: --show-fec            fec-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:165:5: W0511: TODO: --dump-module-eerpom  module-eeprom-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:166:5: W0511: TODO:                       pse-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:167:5: W0511: TODO:                       rss-get (fixme)
  tools/net/ynl/pyynl/ethtool.py:179:9: W0511: TODO: parse the bitmask (fixme)
  tools/net/ynl/pyynl/ethtool.py:196:9: W0511: TODO: parse the bitmask (fixme)
  tools/net/ynl/pyynl/ethtool.py:321:9: W0511: TODO: pass id? (fixme)
  tools/net/ynl/pyynl/ethtool.py:330:17: W0511: TODO: support passing the bitmask (fixme)
  tools/net/ynl/pyynl/ethtool.py:459:5: W0511: TODO: wol-get (fixme)

  ------------------------------------------------------------------
  Your code has been rated at 9.97/10 (previous run: 8.59/10, +1.38)

Donald Hunter (13):
  tools: ynl: pylint suppressions and docstrings
  tools: ynl: fix pylint redefinition, encoding errors
  tools: ynl: fix pylint exception warnings
  tools: ynl: fix pylint dict, indentation, long lines, uninitialised
  tools: ynl: fix pylint misc warnings
  tools: ynl: fix pylint global variable related warnings
  tools: ynl: fix logic errors reported by pylint
  tools: ynl: ethtool: fix pylint issues
  tools: ynl: fix pylint issues in ynl_gen_rst
  tools: ynl-gen-c: suppress unhelpful pylint messages
  tools: ynl-gen-c: fix pylint warnings for returns, unused, redefined
  tools: ynl-gen-c: fix pylint None, type, dict, generators, init
  tools: ynl-gen-c: Fix remaining pylint warnings

 tools/net/ynl/pyynl/cli.py               |  67 +++++---
 tools/net/ynl/pyynl/ethtool.py           |  47 +++--
 tools/net/ynl/pyynl/lib/__init__.py      |  10 +-
 tools/net/ynl/pyynl/lib/doc_generator.py |   3 +-
 tools/net/ynl/pyynl/lib/nlspec.py        |  77 +++++----
 tools/net/ynl/pyynl/lib/ynl.py           | 208 +++++++++++++----------
 tools/net/ynl/pyynl/ynl_gen_c.py         | 175 ++++++++++---------
 tools/net/ynl/pyynl/ynl_gen_rst.py       |   2 +
 8 files changed, 341 insertions(+), 248 deletions(-)

-- 
2.52.0

