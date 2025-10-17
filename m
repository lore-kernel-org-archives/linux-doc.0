Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1172236F2
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760683552; cv=none; b=W1xdoO8jZPnl9vgfprUseGJbMAdZCJEVb6MIxWw/qHeCtLzfBMix6JXt7EX294VDePd+VUSshFbp29QJ6QVRXCYApcrzrIO3K3XdlWQp/z1ggvPkl/TjB6s4eBdbTh+u6DJBTqgMzoG9wLdbz1Ihy6n/d4zRWEbfSqfVQIhzRRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760683552; c=relaxed/simple;
	bh=76MXJi1GEaLekMNsuMxE/KJvLVrO4E/BO/gvBM1ACzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dYrC8y7gILMgs1hNeXkTh4yF1ruaoX0TOUL3oFQQf0GzRGG+2rN/ZFqZI5Qqr/eos3Pudd8he7KBQd7ZpiM/IG11RoAXN1nf0fGZJRnBdZgQrn8rG02I2qv0wAiwbyaQ4DbFk1Qdj58UbKU2FqF4sDy4dJd/BWcRCpjydevc434=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUpAwkPo; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUpAwkPo"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7811fa91774so1470704b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760683550; x=1761288350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DTkieSjdzW2L1FZWBBhfo8N9JLViedhpHr/nKm6IjJA=;
        b=EUpAwkPoBsvUpTUsVUB1z3KQAZsjPCl7tGnqTFufa9M1lupibcqsHy+3IiqxyZr8VZ
         qjd+24YVLIJ5ScjqwfOPkD4T0E8ngBAEWdQPUDvvchJ9I21WpLy7UyydvcIBRspB3Jlo
         pCcooLJLageM8onTa87D6MGlWqIG4lr5HNOiBWFscq3EWBN4JvM6pTjuMBOVGM2BPqvx
         4x3L/W0n2C0MHkTAHC4sirqiz3BzhAS2uvamnG3mUJUvSxcJlN+DMOjhaJIg/vNUIMYk
         fjN6wM5H8mpDvvuSUFKWkJLifpQTgurzRmAqn+gTX7eOVLhWj2BlgYFsVwBNyRS2NIBb
         dO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760683550; x=1761288350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTkieSjdzW2L1FZWBBhfo8N9JLViedhpHr/nKm6IjJA=;
        b=asK6u6HNxQzkaaL9Xpor4Euq7C1Q9v8jtQZwQ1uw6ETA+7cuK7G0dwfHDbtkgnNI2p
         8hJl7rA1fX6weQq1vAPXHRs7cUKRqlihAlCpT/dsqx9EMQOPrsZS4Gb3MN1B9WDB7GNP
         K7Bq8v9UclU/R64TmXwDV+9FoRrBObr8BpYOnPujCHOA1yuPbCziZ1SRO8qAaiEfqHw8
         lflD5jeggoxIGOszMpUxytZlk76FOIH4TcCyGTgLBp1pxGmm9wxYUD327UxIZLteVZ/m
         l2PC5VBPxefv1jHNBQBWBcztgQhFEnmBNSnh2F4q9KplmAZFnlxSlu4xbMWE/sSQNP72
         tGmw==
X-Forwarded-Encrypted: i=1; AJvYcCUBRrb2QWiftRWqq63ac1l5MqE5oaLVrkgJQwxu5cal86VpmBnr5EkBFKZPp2hiYNUoYCWEuvT8cP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmaAvrHq6zmmLO2YNn/Np0REhm/++dx55dXg2HchF3jiISTrIo
	Un37xbyQQCmldfH2NVIRlBfmI9SPfRA7NKfzIJFIPWJXnCspg6j4UNFn
X-Gm-Gg: ASbGncvVn0j4A7s6jNVwocqlsgcvM4RkFNRCWjNunRV8k7ZIpNGaNESj5ZIQyvKLLzD
	rj2axRplzEO9sOyKNnygALzjY7EOjPM1Gm4tKuqvkKCej35U4LnYVaFVvnHgOkiOrIJlnBwkOHu
	72kfxFsxNVBEQ/gAW7jJ5nacziNcm589oWioYL+AI+j58qkYUgc+wfGMH73ztljO2djXGHVH4tW
	m+jriuRCgskEywHFpA8L3vLok6ikmtozSFvXTOErnlv1jtqPORzo9SWZwgUNsssdPL3O3PASwxw
	lJAy4JxXe+TO1EXC/bGYYTxa4gLIuJWTDkfepyBryA6dKtKAOV5CPEQaCenJJipoRxhRZFOB0Su
	s+ra7oFL1a+9DdHmIUu0aaQQXwY8JZMGPR187RTSQTvfBAHOmvxF/+ZZuGTOIiijuL367xtuqV/
	texBrkeDSSjiLl6A==
X-Google-Smtp-Source: AGHT+IEem/fSrEehwV3DtzcYZfeezgViQv1+qknKNWni/oU4JGS8WMmMY//d2kREKtWf2xINR4Ntsw==
X-Received: by 2002:a05:6a00:130e:b0:781:15d0:8848 with SMTP id d2e1a72fcca58-7a2208eec13mr3101403b3a.13.1760683550201;
        Thu, 16 Oct 2025 23:45:50 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-799283c1a15sm5249113b3a.0.2025.10.16.23.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 23:45:49 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 265884528ADD; Fri, 17 Oct 2025 13:45:44 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	linux-hams@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andreas Koensgen <ajk@comnets.uni-bremen.de>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next 0/2] networking docs section headings cleanup
Date: Fri, 17 Oct 2025 13:45:24 +0700
Message-ID: <20251017064525.28836-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=537; i=bagasdotme@gmail.com; h=from:subject; bh=76MXJi1GEaLekMNsuMxE/KJvLVrO4E/BO/gvBM1ACzs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkfn2wP2+n+ZsO6mh0sAWeV2pb3qzslGMZvVY9IUbfPW VrJHTWvo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABOJC2BkOH+xgGGG+Iaqxwxb S60FV9eYLNjl+vHB7kNzpCcs+sH/r5Dhny3bKkmxBR3iVqGuuVqNj7n+Sni7n5u0f02syrnv9w7 8ZQUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Just two net docs patches cleaning up section headings. The shortlog below
should be self-explanatory.

Enjoy!

Bagas Sanjaya (2):
  net: nfc: Format userspace interface subsection headings
  net: 6pack: Demote "How to turn on 6pack support" section heading

 Documentation/networking/6pack.rst | 2 +-
 Documentation/networking/nfc.rst   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)


base-commit: 7e0d4c111369ed385ec4aaa6c9c78c46efda54d0
-- 
An old man doll... just what I always wanted! - Clara

