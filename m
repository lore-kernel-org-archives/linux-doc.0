Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1142E2EEE
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780767863; cv=none; b=ZVYRjHxpNgArIIfufYQc+voH37GI7rtiG73dvji6RVFzuGuxBhEAVPytzsE3Z0W/d7/6982CzeJlnUnhspb6SHzMy/VrVuK2J80q1v46QkPE0X9wThQTX16BmPqzNqGNtktbZFe1NENGUfaN552G4Z6tx8XazLMZuGRvITYS6zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780767863; c=relaxed/simple;
	bh=Y8/jaItJY7WDpAzUWHVQcS+f43pWTZf1MJey3/FU7xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hzMSfJkDLt3Yn7FQJUXFkNDDrZkjLK4hNW1QgqwXzr8T/RJ5k39+McOxixg3zE8hKzLfQDW2UzBQjILhaShspPJtr7wZv1FMyhuRZS7fPQy8JEy/NTOyQ0035pBXmOET43CSVeTTlxaHfrchpt876AJs0Hp7icVyq0d2aO2taFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgNExdDL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgNExdDL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso2132766f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 06 Jun 2026 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780767860; x=1781372660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8/jaItJY7WDpAzUWHVQcS+f43pWTZf1MJey3/FU7xc=;
        b=QgNExdDLrB7AawfoBrcJUlgGBi3hn5nkbb+yiiL1AWEjJEUAdAph1JhmxMYelUr+LE
         nnfpLAdiQ+FuOP4pQ04q3h64qK9uAukFjH15nESXZGKrcbKmGWKRW+ot119D4+z93XL9
         Nqj4ebzWmduLxyentO9Us5NhN/xuHxSIBTDVpdKyxGAQn2qAJKxfGxJNiXoaMvrUdHDU
         ooXrkc64fqYpL/Hq8s+MW4lonNbR8Vl67tJkxExcu+n6Bm/pxRIUGpkgC9wpVsl8ewAY
         daKVDvYbh2ii5Z1VfmzBvZTxePSOvVpYtwJirCgF0k0D9FxyNaxxLkJNxwR1UBmXllzJ
         fntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780767860; x=1781372660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8/jaItJY7WDpAzUWHVQcS+f43pWTZf1MJey3/FU7xc=;
        b=aGuaf+e2A+NAW88Qn+j72QqlH4eE8jZK3Su5TjXUrQ5U/6OhQxKJunIT6zxEVKX+Zs
         C36A1j+A0E86seVu7PgpO/5hO4s7WEkG1ldtDBIjz2cXRU1XyV4X34cam2JsN66Icenh
         AHazxkWI6gTEs5faxFu/06XtvfmdCJG+ZMFxIAVyirTjfHlF8Ecj/pyluAztVMTDiEDL
         fvvnTVvBRi+V/E2I9Oevn27ANlZD8Il8Hdcn/VkZJiOG7WUg3L25am01+LocFDxfWtwF
         x1/m87+MGBfVVcuIBK95eytwF+8P3vKzG2oHdshUY/N4TBS/zEZjQ31+BFSJP/SdJdxe
         CjQw==
X-Forwarded-Encrypted: i=1; AFNElJ9MeOqjpf1fiG+LHpnn0jVS4qHPJX4a3xXpE+XiBhoU/y40RkHGxIuT/awy6OIzFvK6xVBgf1aaWz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoBBysXjpxeGaHtnK6aBDWe22Ij8hkj+rCH5ThRkEj+TtIaRTQ
	bQfKEJC6PtfapTMWmmFzUwiEQYk58i5KfdQiNUTXOnd9u8OVyIz9uUY=
X-Gm-Gg: Acq92OHWgBssbE8R/p1lTzn6HpLgNySM0/mB4GM3nRvbEbEji5WoL6EBEYxH9TRwYYJ
	y8Rwy/Bal0rB/5EVJ+FaUgQbOXmALuDQiN1rtqZxR0BjpQJ0Sle3wbFLE8erkWaBpcpvZLWDuYK
	/ZRlqg2bUULnNNhDtYSkWNNmiMiLJV3/Ynk1VhTtW+dCQR1SLgWghJ73n9AawtgwwyxcT2DdFam
	6kIugPqEKFZA7Q0/9qY1PNoNJkS57nzexuUswKysA6uDA58cSWs/KghcDLzxtOgJBSQjM6N67Uc
	vqoiPyZjqXlfRTdb8s/3rJloRQQ1PDLme+5jHUWJwBEvHuW+chjN9mgB3qDhTEeOoQsFcu7gehY
	k8e6ejDWrJTgXOJf6x5JXvqmaV4P5D1mVGtmt06tFtQvQZhvboOc2mm5RrxoXsW8OWI2gLlwJd5
	oGepO0U2uCe9EGApmhnoimS+rixVBJLbcacekBaL9dW7HTLwSaXn1FEBQBueO6pxbZR2j+g3Xqn
	sS6WKRf0/qy7XnznbmnAJswL+XoBS/iEW0qvZ7MSA==
X-Received: by 2002:a05:600c:524a:b0:490:b11f:2560 with SMTP id 5b1f17b1804b1-490c256f131mr157979935e9.9.1780767860114;
        Sat, 06 Jun 2026 10:44:20 -0700 (PDT)
Received: from hp-ubuntu.. ([41.248.186.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm127326035e9.2.2026.06.06.10.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 10:44:19 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: document slab cache isolation with SLAB_NO_MERGE
Date: Sat,  6 Jun 2026 18:44:12 +0100
Message-ID: <20260606174412.4843-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <874ijfvec2.fsf@trenco.lwn.net>
References: <20260606155856.15548-1-med08elkadiri@gmail.com> <874ijfvec2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jonathan,

Thank you for the review.

Yes, I used AI assistance in writing this document. The technical
content reflects my understanding from working on the SLAB_NO_MERGE
patches (one of which was Acked by Vlastimil Babka), but I failed to
follow the documentation markup conventions.

I will fix the markup and resubmit as v2.

Mohammed
