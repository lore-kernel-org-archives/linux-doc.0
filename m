Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559887;
	b=Mel745DvOoNJh3wd86ulQWYboJfQGoQOUqjmdFRADNuES6BLBuCgZPKIgaJ4TbllLUGb
	 9mX6uaucxnWyIkJZ8la/7ZTm0uYFCtXZ6pZ9B+SBWPp9F6kP/FCW73sy5Nnxh4SzzVhU7
	 bKbEnp6G2aAwrxThKnD2Vjfr1ROeAJ1+Sr+yMgvqPWQZHfM8GO/UVbHdvhDCywa79sD2H
	 qZoKr7yNbHIbSyBMMczjPhao+iRNt2g7+lafd8opliSxAyIezskCxwB/OPPfBXkZZE426
	 F7YgcTRiu3h0N9OBg5R8vu0CDspe8iOEdflWx24SSqzNw8df9b6gXsULxHAik5ag8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=77Y95W/UaJg257+QBwzQ+4jh+bph1WESxo/Gei8xe2A=;
	b=DnU6pt7rFPL90mEGa2JXoLCKJtFN/w/vuO3veAsqxd7P/cXvgYY3Uz5zeoUXu0L477Yu
	 Hxkga2duGdrZ4u7zIzxIAig0sJc6dy5UByhLCoPycq9RUWH5iDLLwura7FU7ob5Jb+1uF
	 b2tneY+QI97w5/wyr6sJneepxUDSqooalVjPNb0xBwj6TiJbEhJg+NiUSmGdfwHSxuyxa
	 Up3Qqv9R+qlnQo78q+g9/nlYH4Jr4nRjeH4cJ/ypJD3XvBHDLianfIs7TOa4qxXQaVmTZ
	 1pSoRfaFNnNP4m20b25z4wXfwKTZH4Lzj3tKIyDBD6TJdsvadBKxkaOuASP5LTXPuew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=brVck6GD;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8094606A88B
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8094606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=brVck6GD
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3b10718b387so479706a91.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559886; x=1795164686; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=77Y95W/UaJg257+QBwzQ+4jh+bph1WESxo/Gei8xe2A=;
        b=brVck6GDzg2l9Hd8ZDcj7od0ctXW1NWDQ5vZNcZ5RAm0ytXk7uT52keYCAc8GFvT6O
         GSPdgCSfKoXH3VE87n3N6oGbCcW3OxvcNkSKdFIp1YMUORZjeuqOlgzSJTKq/tH76O0s
         jGmzt6oEd1lV0VvBndnX0dNHhw2bU0tZhMa8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559886; x=1795164686;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=77Y95W/UaJg257+QBwzQ+4jh+bph1WESxo/Gei8xe2A=;
        b=n1jMtUIPDyBOamoLCJqIPa25Xzy/dkWFwX25PB85iRfvk8nKuAK+iqLTAEm1S9zEGj
         geqtbI4kDvlPCGOFTFpW6xQ9c/+oerG1HjbeMtXRaYSUXIcjZYUVMvuKi3fTkHqLuV7t
         4UybERojcQkycez+TZFX9SR6rkMX6uNua4swks8fsYkjqYuc/DjoBpR7RiA0673Lt+Dl
         F/CxVCHbZn6QgwYUny0fdUo7GdMms8ZRSKuNpZL0KYih8YnPh4FM+ND/NpactB01key/
         7LQHXWnvTiSSe4JB8+Tf1Tf+u1PTlZCV5CEWYv55qR1NA9NVLW2nVQLBk7Nec9jKjSfB
         y1jw==
X-Forwarded-Encrypted: i=1; AL+hErFRaP3Kv7zGfeNx4FqLmJaS6GPX67ujIyU0C39wCc5/MIjcIWqEtqinax9cX5zCaGmTdmZajzjXFhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gacDHBPC/e0x6l1y9M6xOPdtFeN6TEjSvJcm032Sn/O/d8HvU
	V0bCMIHOn56l43txRAS+kfzl8Fg0njJJzjvfSNZxBo4ofrubFRhaqGw3TsUtgeVMnb0=
X-Gm-Gg: AYBFou1AYSPPmO9ZQHDHjgnMkVYtIwtp5ynz0m0a0+uS2SntOIGeQ31y0EEw71SoFYn
	ryI8VnpZdw0OwuL1KUap11aWaQjddgu0tgRCtenQF/NLL9QXQlKHIkrQkQK3lVPCLrHQKlL1Z16
	rUis8y1qRl+WGjvtP6NQMlgGUyjJufUfulFJiKdsT2CiNarnvtkwPOtGienaG3iS6B5ZyV30CmQ
	99CeYz/kgoGU3mVzv46RWjvcYBdp83FNNDTT74T2dzfj9SsRiV1MSipKWO+OGXBFTeSfy8639Ib
	hSU8yTN+2m3VG+zUlB/VLoZho0E5hSkPwBuxhXg6kShGAk72Qu9SFH12ECqR3JwD8Cj+Ek24r1A
	U8sqaDdNH6usQYHa3gKtrL9f8FhJ+pngYuHzcXHxzwHYIHMgGPG7SxaZBO5c6+WaVBy59/h2v8G
	H88xZxVLyD2Lah7itl49/UMi9D6kAcU+fcRRgNEKQDXny1vOQfKFMjHnVss7HTCdxiojFrb+wEc
	J1XP7v1qb+sf9I8nTjSk7uAaBl2K9qIN8E17U8xDISZ+fM5lol8GMPb6/cv69zttwhp8Y+Gr1uZ
	JNr15hKUvU1L/JkLGxR1hpVSGmq2k+Rs1xrGsUgKOSmVjevza7+tY6423R36Tj80a0KfaVv3veT
	Nt1NSm3bGnhpHbHLD2iVtsVCeVDGZDlhrQr1LRMfa3uDxwQ0AqOc9qQc/kOSZBgOx9/qgMva6ZE
	xmF9wM9ur2QuelsWewbpe5QYcDD00LczCXH7THQI71+BMjcbsP9ZVFVnwKqRQ=
X-Received: by 2002:a17:90b:53d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b1b0a10840mr1664527a91.35.1794559886175;
        Fri, 13 Nov 2026 00:51:26 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec63b9bsm3619209a91.12.2026.11.13.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:24 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:22 -0800
Message-ID: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 0/6] mm/slab: Support selecting slab hardening features at boot
To: Vlastimil Babka <vbabka@kernel.org>,
    Harry Yoo <harry@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
    Christoph Lameter <cl@gentwo.org>,
    David Rientjes <rientjes@google.com>,
    Roman Gushchin <roman.gushchin@linux.dev>,
    Kees Cook <kees@kernel.org>,
    Marco Elver <elver@google.com>,
    GONG Ruiqi <gongruiqi@huaweicloud.com>,
    Jonathan Corbet <corbet@lwn.net>,
    linux-mm@kvack.org,
    linux-hardening@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Slab hardening settings are currently all build time choices. This means
that, unfortunately, hosts with different requirements end up needing
separate kernel images. At Meta, for example, some hosts are built with
these options and the rest of the fleet isn't, and that's one of the
things that keeps those kernels apart.

This series does two things:

- SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM are cheap enough with
  sheaves that it makes more sense to just enable them by default than
  to make them switchable. With both on, system level benchmarks didn't
  change measurably, only slowpath heavy microbenchmarks did [1].

- SLAB_BUCKETS and KMALLOC_PARTITION_CACHES cost memory (Harry measured
  about 1 MiB and 18 MiB respectively after boot on a 64 CPU VM [2]), so
  they get slab_buckets= and kmalloc_partition= boot parameters, which
  default to on when the option is built in.

Whether those two should be folded into a single slab_hardening= is
still open [3].

v3:

- Rebase onto slab/for-next.
- Always build the slab_buckets and kmalloc_partition tests and skip them
  at runtime when the option isn't built in, instead of leaving them out
  with #ifdef (Kees).
- Declare slab_buckets_enabled and kmalloc_partition_enabled in
  mm/slab.h without any #if (Kees).
- Drop the remaining #ifdefs around slab_buckets= and
  kmalloc_partition=. Both are now always registered and ignored when
  the option isn't built in (Kees).
- Keep both flags as plain __ro_after_init bools rather than static
  keys, since they're only read when caches are created and not on the
  allocation path.

v2:

- Make SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM default y instead
  of adding boot parameters for them (Vlastimil).
- Skip the memdup_user() part of the slab_buckets test on !MMU
  (Sashiko).
- Keep slab_buckets= and kmalloc_partition= separate for now. We can
  discuss whether to merge them into slab_hardening= or similar, as
  Harry suggested.

v2: https://lore.kernel.org/r/cover.1793253633.git.chris@chrisdown.name
v1: https://lore.kernel.org/r/cover.1793086056.git.chris@chrisdown.name

[1] https://lore.kernel.org/r/auITixAJMfLtfa7i@chrisdown.name
[2] https://lore.kernel.org/r/179312451613.474906.1475329637924619088@kernel.org
[3] https://lore.kernel.org/r/aud4gPOUzvHtLYnJ@thinkstation

Chris Down (6):
  mm/slab: Enable SLAB_FREELIST_HARDENED by default
  mm/slab: Enable SLAB_FREELIST_RANDOM by default
  mm/slab: Support disabling SLAB_BUCKETS at boot
  slub_kunit: Add a test for the slab_buckets boot parameter
  mm/slab: Support disabling KMALLOC_PARTITION_CACHES at boot
  slub_kunit: Add a test for the kmalloc_partition boot parameter

 .../admin-guide/kernel-parameters.txt         | 15 ++++
 lib/tests/slub_kunit.c                        | 85 +++++++++++++++++++
 mm/Kconfig                                    | 11 +++
 mm/slab.h                                     |  3 +
 mm/slab_common.c                              | 52 ++++++++++--
 5 files changed, 157 insertions(+), 9 deletions(-)


base-commit: ce6518e61e3b4bf4f97f7ac6204049b9eba7eb75
-- 
2.56.1

