Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7412ECD11
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757924397; cv=none; b=GfwPLkL4uNqiUMCC6UHVC0LuJ/+wovuPugoAFf5TW8IdSUHIaaS5qNWKMJlrYNvz9Cnxm3qvl18d8CiSDcJJTadiC+gGeoLSEdqBWK/A9WBGm9DPkurBGBnaKD4ENySSvj4i0pbtpPXhH64hyw6l8bP01y1EEUErdPTEn8JNlB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757924397; c=relaxed/simple;
	bh=gvyVXDAN+PRAExWv2YFpEC6fbhrhU8H3L0vY5TSVLGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gr3uMM4uIujFOHwr6SqM2NXtLQ3C8+PE+nwa6RGF1BpPTnap63cVOcaygae8KiO8EYSayvEgOagXhFIIKeUv5RPzGsVeqNI/jy1oqwwY2W3//mpcP8okty4JH38E4GwWP0vFymkM8LpWxIMVDlKyxFyc180zhDxxZWOYvsY0nOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfJa1qXD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfJa1qXD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77619f3f41aso1892682b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757924395; x=1758529195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXJupOmkIaxYSorJ/E2Lxs1az8QJSAWePObgIta/6Wc=;
        b=jfJa1qXDjRGCGIFTDFqeAEZLL1pPPSTZo1GOGv0MD2aKDgB+Bu4sQb0xwGT4oslWF8
         5pjuQbpI4taYvvbOPxSxkOeD1AUErGpfDFoi44aDaEf01fPu+fFyBXjdqZKEwMNj0p2Y
         kmVJeGqDOK+r7Mtgvc/SV+Og6qEBxWs+loN7+9nFKIxw3He11E9vrhFDVjXZawnKx8gQ
         3T60zYMhkZX1F/L8kx2YsTyWiG4sUyqBdSN/GQviY9uJ17hT9DFYypdfF5VpeAqXA4sN
         jyxePJ19oI5tvycF8FFS1WkNIJN9TLXDk1+Q0LxRTFK0B7t9DEZZBIt3jK2z22P18Kn0
         dK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757924395; x=1758529195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXJupOmkIaxYSorJ/E2Lxs1az8QJSAWePObgIta/6Wc=;
        b=SLkMqXDeYHQ928MdQB8A3LFEimMy9ouGYj9O4nZi2QQp4tEviIS3r8mq3Ac9AfUWSn
         aSS/hOJ3ozLFLl1DcpJAnqteZaYngf3BI5jPEVo8BWGcAPBQK6HBpH7Q9UF6BjOQDHBu
         fezw3AJ4HHb83vnKYZBDCEGYCC1hIK+wqlT/LNo8iKuV0mfigCZ5KMkf4QhiQ0o8qT15
         OFfL+9OpfR1jb8JQbLKlGb18l5Dtdqt+6ZlsHDV292/YsgkAfccqPXEq4iNJmSYKXCjU
         0robHBZYCHDxDlFbtuYU/MlL2zxKF6JCEmxsZK7R3VQm4xnCBKPyQVhR0eYdvIcFoEvS
         PkLw==
X-Forwarded-Encrypted: i=1; AJvYcCUiy/Oos9tMyGk/AHyR0F14iAfo5pEKr15ADAubmBdBXA3OTqGp2EdX9k3ecOXfg8ouScBXpbzot9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkv80JXxiTF+1MLZi7aqwkcU2OS2zm0bNbFtZf20Sgkvg9911N
	GAUPJL2cVXIM+z2JSrHJdL/+BEyswVPwl+PPccRu+6xv9jud8QMw7u6O
X-Gm-Gg: ASbGncu8ly1wjG5jeUOv4WzKo04n6NhNTcVFuUoFTAcyqkRhI6UQ/vGOc34OtI5O3C0
	eUexEIlOuIRPbrmTpq/eVvuwrPjLEGTkRwrYoqPgYEW7/Hb0bq2a11Wt4EiwCBjX4IOP80xZms9
	t9eCR9EbJd14F2RbV4yQhuGQJpiVl1Z1jcO179Sp1LSJb9UhkIXxWpPvpwcLpsO95GmoyRGr8Xz
	SpHb94ttYDcN2xz+SbUEpDpjyA7+Q1opIb5oMRAF0/OZFczpBJroCfFmc7foj0S8KFrD5iPlGDB
	Skhau3v8JcL9ilpbQU+QN2ShygcsgPSAhQd0K9522UeLEHOhAKj3KGnN2wbfhNKimU4waFFdsw0
	fkUd6pxhQPK9ceAzfZ4zO/v7n5QiTZE0fk+Mj
X-Google-Smtp-Source: AGHT+IFaPTKZ5L7QGynopLRlymyt3sutrsE9UT7Flmj2NzAt7FTbK7sGSLueOqI3SFAEwnGEtIVHhg==
X-Received: by 2002:a05:6a00:139a:b0:774:2274:a555 with SMTP id d2e1a72fcca58-77612167d2fmr14310264b3a.15.1757924395491;
        Mon, 15 Sep 2025 01:19:55 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607c471dcsm12581782b3a.96.2025.09.15.01.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:19:54 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BFF114209E9D; Mon, 15 Sep 2025 15:19:48 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux cgroups <cgroups@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	"Bagas Sanjaya" <bagasdotme@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrea Righi <arighi@nvidia.com>,
	Johannes Bechberger <me@mostlynerdless.de>,
	Changwoo Min <changwoo@igalia.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jake Rice <jake@jakerice.dev>,
	Cengiz Can <cengiz@kernel.wtf>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>
Subject: [PATCH v2 0/4] cgroup v2 toctree cleanup
Date: Mon, 15 Sep 2025 15:19:23 +0700
Message-ID: <20250915081942.25077-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=bagasdotme@gmail.com; h=from:subject; bh=gvyVXDAN+PRAExWv2YFpEC6fbhrhU8H3L0vY5TSVLGQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnHT+ftFawoT5Zt8rHS15fm4uvyO2PHpBQjnFv++hiP3 pSwLxwdpSwMYlwMsmKKLJMS+ZpO7zISudC+1hFmDisTyBAGLk4BmEjDd4b/KZ+jZZ235Ztdyb/8 5eBx69kaq3c+MefaYTIno+HLSbGXkYwMO45O5qncVfb4hM2CnGftDy+zfph+89v8m3enrz6QHy2 0nwUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Unlike cgroup v1, cgroup v2 documentation is a rather lengthy single document
(Documentation/admin-guide/cgroup-v2.rst), although is not as long as KVM
API docs (Documentation/virt/kvm/api.rst). As such, it needs a roadmap for
allowing readers to easily navigate it: the toctree.

While plaintext (reST source) readers are delighted with already-existing,
manually-written toctree, readers in html format (including docs.kernel.org
visitors) don't get such luxury. Let's add reST toctree for them.

The first two patches ([1/4] and [2/4]) are section numbers preparation (just
as one would see the book toctree). Actual toctree generation is in [3/4],
and in the service of plaintext readers, also sync the manual toctree in
[4/4].

Enjoy!

Changes since v1 [1]:

  * Drop unrelated cross-reference patch
  * Keep the manual toctree, but fix it up to sync with actual sections
    listing/automatic toctree (Jon)

[1]: https://lore.kernel.org/linux-doc/20250910072334.30688-1-bagasdotme@gmail.com/

Bagas Sanjaya (4):
  Documentation: cgroup-v2: Use dot delimiter in manual toctree section
    numbers
  Documentation: cgroup-v2: Add section numbers
  Documentation: cgroup-v2: Automatically-generate toctree
  Documentation: cgroup-v2: Sync manual toctree

 Documentation/admin-guide/cgroup-v2.rst | 447 ++++++++++++------------
 1 file changed, 227 insertions(+), 220 deletions(-)


base-commit: cf9c2bbba2735831f1200227c7f13404b7d7908e
-- 
An old man doll... just what I always wanted! - Clara

