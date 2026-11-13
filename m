Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559893;
	b=IpWRmHMhsfhupq7tmPm5q2QfR0ntLfvkGwv0kJDiTD1v9DWZR7007dpDaAid4lpxqGTL
	 CzxtOWNZDL6MV4G2jaKWTTRKQxeOu3z64yzbmAZYnv8T/5Az0PQlIqIqVVV7e3dEE9wth
	 3dm0gO59XdHv2y452Y3NvwhiDCHzzqvfAUdb/RBhTH0zxosnTKdiOd0Tcs+BF62PspqzQ
	 TTcZuyIvmUOzGji0DF0rhDSX0wMK1U20ivOAgjyNpimOtodbhRz+B6yXIXqccw2LHDPQQ
	 L9fIPFloBo7ITZo+3wLnDlpGLfYNBP/4FhTumIAoZFD4y/D5sFAVb4DKneNWhuyq7MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=CiBcy7QaND7m5s9DJlixmA3xnrmmNcQJ7o62g9gNxcQ=;
	b=AmH6lTiXgilkBQXuhbuMd3xSPY0Kr9WgJ+ZBXugXFAz5Dz5BvYqBE/witzT2fTmc+SP/
	 BzMnyRK49qOlCjMCE9WVUImEYuqu8i/kV8iEHWCbX1Nm40yRu717nCVq8D18r4+xxw1qI
	 1iDpXvF5cYTvuO/S9ipFAlTxfEFIZ/hxyZ1R2mf+M5e2nraIbE6ATeRYmcrsrUzRnvx/n
	 lFilDa4MOfw/U6odiCjPZgald420nyg5XaZOsZT5u9UdXADWSs+H8zCCYxkuJZyKNXNVv
	 1ajps8+Y3pKCrCxp7Mi90LpHl19wHW8AOWkc+b8zZwt7oDfu12Mt7WaPYxfoKNr5v4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OWzVGAhZ;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349B6606CB18
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 349B6606CB18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OWzVGAhZ
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e96502e447so11104605ad.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559892; x=1795164692; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CiBcy7QaND7m5s9DJlixmA3xnrmmNcQJ7o62g9gNxcQ=;
        b=OWzVGAhZZqhqY+Spa7MkZScWhtIfbQ+aCSE6Lg/k9BiTi/UqSdMuDH414YT7SoWnBU
         icDhs5dGXh6uSyGJFVapKIdGKkEft5ilfsXqHJqdPxXbNCR0faK7cI7N5Ds77uGb9ZrW
         cTJIi/vFsuC+LrCXv8kYgAR+zcqcuDghVWplY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559892; x=1795164692;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CiBcy7QaND7m5s9DJlixmA3xnrmmNcQJ7o62g9gNxcQ=;
        b=h3xjFjFBBMuy5DQJJhpoH3YPxNfJIM1Lc73vAb9py9ZPsJXgxvPr0u9xkii6GS2NYD
         /Ef2Jw+qk/J2Rw6JfawtxrBDfIUxwpszBrMc3K4o6BZv1/c13O0/1ILpa95969ntATAo
         sGjbGq5uqIaQ+hBrGRvCF77MhCfps8RfIyQ6oXwA9XNziGB93qLDiN4DOIBl71wro0XS
         pJi4c8Gns/BEs95vOfLy/tAXtgQ+vwI4OCV0wizZ5nlfcx8nUuvcp1WpdYhFXgUVavz1
         QnhLwmlry/3wvAOLvDIIp7WTpobmYWMLdM5JgxBtZvodvZrjsxVHFkikx7aAaayIkj0H
         EBkg==
X-Forwarded-Encrypted: i=1; AL+hErHI/uZQRr3Kn6cbTPaXU9dVLat0akGa0JEga2fDqAc3yQ6DKjvDJpN6WbxcXn0O8gAh/IrxoSyDD2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dqKAyoX90hOQRHTH7m1dINC/+xuzkIChI9q2YgBRlP5LZhkJb
	MUMLcc4UDy3gQX8X7PAJ0R20lf+P1f7v8m6teHNaEiNl1ZG8ETuxIn1qLIybz99FqLY=
X-Gm-Gg: AYBFou3gX+iGf68j7XNidqGycecmIX9W+z/4YLkN7mMlXDr2sDzIYBJs2dMU9SZPuUE
	aJDXFD4FR0fdiVyqOpHObJHKOlcR1iIpek9X9iDeNabTI4ESHiUm7nN1N/Ut1hu3mgMk1v2JhSV
	V2G8OfjqOmiL0MnXX4b4Rd0Gr2hdKm9vO1YhIpv+b8ubR0NlwUSqU8sDP+uOp6xtWy49JFzc6wo
	TrFp7ti4UrB4+RNH9pxm0LYAYIeGlb+E9PmymcMYZlPvCuuQb7Bcl8dOxE5BpUAqsEi09Eb9r8j
	CKl1LFcvIULbR7TWYYmxgD9TKm2Zwu2EKSf8wSPP7bAvkNye4jfKonwjXDx3VTyN2cAS+yhdRBB
	4H6rXnPdO35FNFazXv+p91Z8Wr/eeuG3Ppg5E6IbL9MmdUXe6Ca5eTGwyBPUi0QkRYWfFximIQ/
	8rjXlCAUEZL5W0UFO/kh+D2sE8m2MbGctICHljqsboNd02H3mBQYrZQrZ4rmxGw6MpBfWJUsrLB
	HwX8GdQAh5s8k+Gnds5PpwoQ3HqFmg/DUM1gwkn/bnzqol3+RbpPeQp7DlCLddmD5FvE6zGqrBf
	F8haXX1MsQHBQTwyFlnjD0eJIiCYjVITaHZeXULFiAAu2WOelSnaf37h8mrEeK+fQUFbwro31py
	7Up3TKYfjRsZl9FLFxS5OcGPiflnFS+x3QlrC1NaSjEuJTaMMy8iwLoGJPfGAyMGP8RVfx/z0Dc
	yPangn4QaFTJcFnWJ+9PNcFj1UY2JwExr2GzUG+acI5MiMXiNjOYf5URCIj3U=
X-Received: by 2002:a17:902:b414:b0:2ed:e0a:1138 with SMTP id d9443c01a7336-2ee0d66682emr16000605ad.4.1794559892624;
        Fri, 13 Nov 2026 00:51:32 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e48e2sm6970455ad.36.2026.11.13.00.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:31 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:28 -0800
Message-ID: <5e66c6e1fb0514242c89504ce624773ad54f50bc.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 2/6] mm/slab: Enable SLAB_FREELIST_RANDOM by default
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

SLAB_FREELIST_RANDOM randomises the order in which the objects in a new
slab are handed out. Like SLAB_FREELIST_HARDENED, most distros already
enable it, and its cost is only paid when a new slab is set up.

With it on, the same system level benchmarks didn't change measurably.
Allocating from new slabs does get slower, by up to about 30% per object
in a microbenchmark which does little else.

So let's enable it by default too. SHUFFLE_PAGE_ALLOCATOR defaults to
SLAB_FREELIST_RANDOM && ACPI_NUMA, so it's now built in by default on
those systems, but page shuffling itself stays off unless it's enabled
with page_alloc.shuffle.

Suggested-by: Vlastimil Babka <vbabka@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index f330c2c29fd2..d174537d941e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -200,6 +200,7 @@ config SLAB_MERGE_DEFAULT
 config SLAB_FREELIST_RANDOM
 	bool "Randomize slab freelist"
 	depends on !SLUB_TINY
+	default y
 	help
 	  Randomizes the freelist order used on creating new pages. This
 	  security feature reduces the predictability of the kernel slab
-- 
2.56.1

