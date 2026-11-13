Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559890;
	b=4f4BGmjOI4CziJyENd0/MZW4wKxbAYTZ7a2RipDt21zmEcyQzW5xYEDbwSKLOOEzgGzT
	 3m9BOjYa6sWc/kmkHRhJ2HZk043p35qrwoS5AMQXG41+PY87MrFrmAju/egHDlhJmgK8v
	 LAhw1qTOaTd4NnYHIMvLvLK5lRvKg9G5kFTTVFtOltQN73h8SVvDlSCLDtWN6tZ2ekNZP
	 CiRetqQlTsRiAyOgxexlZxn7JzlM35WQnDIMwO48cqLZnVTATTBPPDsH9dX0SyDC8LOFq
	 j1WyxphuxL5P5NfPRHnnS21DNfQuNAaPmIbaJ7UripSjZTjQyyB7JAYAuAc2WcUwRxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=Md769LsMtNFDtvpBg7Ba+68YL18ytLzyTSc3mrMJ/dI=;
	b=vdCgJAaI0lj19Pqpb69TwPO1z4og9e6tGE4mAZ81zp5UWKPYc8ZmWtgMmamW/nAMK9n2
	 x+D0Bs1GcHxLjkEzC4sI9asBT4ihLvKRXfKyx20ObNoAObjnLj6Wear1eX1kvJjro58sx
	 i4gLQPo08vfV1SYi/ikS4KGaLQ7VLeXgCQ6I2bs5tVdW/0+NhzYL2/E/yWz3wEl0LIo0T
	 6a85Ke2F9CZ8QMA0YxDp3k61vifYqq2hXwftYvB9k9jn7C/kCJAhT2BdejVdhTMBV5sTC
	 YIUNkxTDX/smnWDKJ3rR5bdyOg/bDeInqbeSVK7xQVfA5xFJmips4QWswIeJ53ZpeCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dKyQHG7e;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8126F606CB02
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8126F606CB02
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dKyQHG7e
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c20aso7478055ad.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559889; x=1795164689; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Md769LsMtNFDtvpBg7Ba+68YL18ytLzyTSc3mrMJ/dI=;
        b=dKyQHG7e36AfbdbP3xWgJ1T5mk3j1Zz7afAQdAkLhfmZUq6skcehaz3NG/QsgoHZpD
         G3hgalq5PQ9o0enPeskHgm3mVr1BKg4vjLcFE+/274UmQqoqzmgznMEAzLxTMwGIHRYh
         FvXiP6mXLB9oKFlqpSVIBLLE/Xhui0UbSyNXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559889; x=1795164689;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Md769LsMtNFDtvpBg7Ba+68YL18ytLzyTSc3mrMJ/dI=;
        b=pIvYz2Vu3ZVhMtHoq/5ISEUbYc5o1BANdDHLEjW269tFzFk4VtQ6HU4uhzaZAIO0LY
         a//m0rfxGO8eOEG3zT1F6SJIN4swtE63s0GAVYxtZluQAERpoZryYJWz1AZHqF8nlxJ5
         iz0Ud/ze4jJ6Rf7Jai5QlpIZKgC4r1yW7uWAytxitNAbDGOdFqE1NebPYNIhCMRUfByT
         IjAGCrGuKI2ZPBZ+QoqV/3w04OuZoR7YM0zicrKah/qm9FynJTxAiJ7P6r/8YZyuP8rT
         MfoRhjUka+r6PO9r4+6Bqkjftlu38onBN9gC1DsSYvvEX06pAxQGc0zs7TgpRFbFsGAC
         vwSw==
X-Forwarded-Encrypted: i=1; AL+hErEwbOEZiHkdD2Hubsh79zx4BCIP0Q99tRHv4kAbol13SkclLNLxgnFGSFj+hx2cKYuKZ/hbVc4dFwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wi/1vRPMUmPQGzDtIKxzBHBKQdFUfYRc5j/b6oxJ6Dgaoa5U+
	YImh5kXKm7JIatMSaTJcvQkbFELLDMCIM6l/tHG/ajKmu5i++ZKYDyZy8oaJPTaQE/k=
X-Gm-Gg: AYBFou1Tnbg9/Psk6nD1HZ3dPOMhl9h3Dyv24yVlgPhTQocNdvrgDJJzMq3IX/mHFd+
	rWO8XVjR2kSgex3vKGGRDomQn6EKIm54NYhcklXEyH0rx0u7i9EwiIwIo737Sz76t3K6VdbzLUo
	Zy9yBuiukEVnltsn1mkNEYlVA2pZs2aWFAwctUEDGhkAL/5OAOFpNn3UWJceybt4KBh9zF+t61s
	tHyAXwFi2ndnIfa+MvBEfUrF1sPju4UpbDNhG2i/zleT+x+KROyfEx8h0Z4MOoc8gN7ecZYul4K
	YfqKG9FBPhjxtnRs8VNco6jTc3y5dcEuNweBPofDLm3aI5WHvfv967l33att4zPSm+mtWb5Bq7C
	QTaQU6zUojCLDQgY7GboKjJ0dCraciL3utpFD/RRLDEOZmyKnxol7PY8xQfasfifL+h79Jfcx/V
	IokaIcL39zgJGQR+7fbuCmp9XNpF/oQNSSdO0hSt+KbHVC6SQMzVQ4U82waJRVW4IuL8kT1jryp
	ZQQpohCUs6yfl78PiLb2pov8Z6DZKJ3VNtLhmBNx5N4E2wVFLV9kIvEmqppDmKM7hSN75I0emtq
	WKiqqL8PPgOThrwHHDBu20vXBTHvnelGQLa4eo1SwweABnOHfUqrEBDdT0xWHkbCBKxpMBPGjN0
	jA7k9XrVQnyvcwqWNTblHUFruE5t14q8+DX8kvUUKbVR+SF24GMShv0/I0Pv1sRQQQ3KY2Rt4Et
	RO5lmJB6LrO8zg6i0BDsisLOuUruoaKwoArXWAOZoSE80R29OwWUy8r+rVFrI=
X-Received: by 2002:a17:902:c945:b0:2e8:8637:5e3 with SMTP id d9443c01a7336-2ee0daf1004mr19821485ad.34.1794559888836;
        Fri, 13 Nov 2026 00:51:28 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee1c4d802csm2287965ad.37.2026.11.13.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:27 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:25 -0800
Message-ID: <25b5bf9a7ef115709f1149044824576e6f71e71c.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 1/6] mm/slab: Enable SLAB_FREELIST_HARDENED by default
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

SLAB_FREELIST_HARDENED obfuscates the free pointers stored in free
objects, and catches naive double frees and frees to the wrong cache.
Most distros already enable it, and with sheaves its cost is small,
since the per-cpu fast paths don't touch freelists. Measurements also
show this quite clearly [1][2].

So let's just enable it by default. SLAB_BUCKETS defaults to
SLAB_FREELIST_HARDENED, so it's now enabled by default too.

Link: https://lore.kernel.org/all/auITixAJMfLtfa7i@chrisdown.name/ [1]
Link: https://lore.kernel.org/all/179312451613.474906.1475329637924619088@kernel.org/ [2]
Suggested-by: Vlastimil Babka <vbabka@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..f330c2c29fd2 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -208,6 +208,7 @@ config SLAB_FREELIST_RANDOM
 config SLAB_FREELIST_HARDENED
 	bool "Harden slab freelist metadata"
 	depends on !SLUB_TINY
+	default y
 	help
 	  Many kernel heap attacks try to target slab cache metadata and
 	  other infrastructure. This options makes minor performance
-- 
2.56.1

