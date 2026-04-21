Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E548388E6A
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779713; cv=none; b=Vxj7AzGyBGbxmcfnH67v5+ujcMWKxOeYQMaHLJCJ+KV0DeX2+tYQnrf9KmCAj/7bEl2zi33vHy8zjHfpEK/6V4ufcGquHhJ01zrfBs7HTEq5Nwd+Yz6K61Z2m4UyGmslj3tVwOOu+ZQ65UV/hump+JeNkbO/Jhm4Zwu33o88QLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779713; c=relaxed/simple;
	bh=+lhCHGdZe5sRkv14NbUtNb1CaGQkWDl1MwUJBssQYzg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZV8ayITFujBzlOA/pmJKDVh4dpcQg+kVVU6gvw6WHYpbiVKKYY70BvmRfBOa0STmtOManJQpVwe9Tjnkuv9e7muoMP1Vj7x6jFX2wF7xERhU/wTT359v+fORBxNwvXwgwEzqgckVGMBHbcsIZfVluaE7lopTkghKKK1stWyIkfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=EwBxXn8i; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="EwBxXn8i"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2de831d2b20so8209632eec.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1776779712; x=1777384512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kvvKapHsTo/somY7xq84QOUPdxSqeCZ5hcFx8xE2MI=;
        b=EwBxXn8iG4VALcxHUCe0hi23ctgNq9/G1VT4ilVQ5hcXapjMzhUfUIloVkTwOP8uOI
         OjJHxixt7SvgB3kBpMrXO8M7jyj2qv0hBfkJ3eycWdv0eGMb2baUTp3gVPqTBOzd9Mhh
         3ygZkyGdJSbFuoUHizPgT8Zs2ZADInWf8Sxfjqd59ZxjC6jEkB4A9XVbuFCr2UAq7hWw
         sUgJOjk5yT2mXS9zwjZNCuAUe2jfpxKyBkfoB6jJnDz3AbA2SzsS54FjqK7zLlG92p+r
         TkzCJltBdz/hpDj0WS4KEFwPtuEnv+9L4TtL0Ff1Ah935sm2AyUrisg2yqJfTz0jkEul
         l+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779712; x=1777384512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1kvvKapHsTo/somY7xq84QOUPdxSqeCZ5hcFx8xE2MI=;
        b=XeEKBcZ5Wf7HeQwAJhdvb6KXSWRpmztepqoDCFvw4WEO21aSEXsMGjiJK/2nIt1Dlz
         YzLR14nhtG6j6KSHMpV3B1vdd58X9N6ZhenY3XaLOgdVFUO6q/hZ9W8N9QomEw0PXD5M
         7nSCSqpgWvlms7awiWvGH9JUlVH7E31Sp5udHfWNy9V8xh1v6Jq4vXMU6XHeIVP9vzxM
         oQrfwdfN+WD674fZTQyjJJVzzL2N00Gc1HazlKpRayjJ7LfPuI2ZjJQ6EQIy5ydmxj6V
         5U3zYY7kG7R8yDyzHeh0DbqFoNvuPxm37XtxQXFo4tAOn6xe9u6AUrNq+ohoG6pDkwKd
         M0dw==
X-Forwarded-Encrypted: i=1; AFNElJ89YB9C4iXOla336jv2ydExfbmSmCj62CRJ9BEXvgi0RdVD0Pak2Ao7H1IrqwYz9HRMqqNlECbqp2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxueWIA4+oeXOGOY1vsf1PuNl+tWnQjI2i/gGerK8GlWW5TR718
	saeRQNozNDRVSjdDuwplCtnQs+5XHbCU0EaGtWGHNu15kRh51X2bnMEFhxBqM9xeAuA=
X-Gm-Gg: AeBDieuvTE9AUR8x9UFf433gICEH4ALmcsui+QQka2Zv3OUUXSAA2oVMHMItaYIVlkw
	eb02z3XTLQrkg6D2VQ2qWN40L92Jkspuwu/kX9nUZxwzauN0k5jKx/AKOuXLO00QGktliQpBHEe
	p+UT0+xjdtY8t55ubUYnrdmu7ko1pfuRz88+FgkmRexUAffM7SLul6E8ZXOEhIkqNJR8tgtvXtM
	Nvw70UHND9y9qzsIjBdNJvGVERisxrZItMiUdk+R07QG7r6UlvJ3NF5V4pjhyfEmuVoyuehN8aQ
	d8qZFpYXcFu+PEr+Z9+MCIPHIbLdwlRdv7i28UJ8KvtTMbR10dXQduTwdB3IlH/c+lDpzRTwkCk
	wbXrJYPzl/sCNmI3yZYGswrump84OIBDjh8o+95cX4YoQrLI7RAOwbt7biV/aOIpTN9cb2i+4X0
	OUJM6AStN2bsfhGSf9/g3hOPILllE+jeQAD8+p7ThpgeEIUA==
X-Received: by 2002:a05:7300:a49a:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-2e478e0c684mr10198611eec.23.1776779711654;
        Tue, 21 Apr 2026 06:55:11 -0700 (PDT)
Received: from phoenix.local ([104.202.41.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c86sm22753545eec.1.2026.04.21.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:55:11 -0700 (PDT)
Date: Tue, 21 Apr 2026 06:55:07 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn,
 tsbogend@alpha.franken.de, dsahern@kernel.org, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au,
 ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org,
 pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org,
 mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me,
 pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de,
 toke@toke.dk, kees@kernel.org, crossd@gmail.com, jlayton@kernel.org,
 wangliang74@huawei.com, aha310510@gmail.com, takamitz@amazon.co.jp,
 kuniyu@google.com, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
Message-ID: <20260421065507.2c5e3ba7@phoenix.local>
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
References: <20260421021824.1293976-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Apr 2026 19:18:23 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> and all associated hamradio device drivers from the kernel tree.
> This set of protocols has long been a huge bug/syzbot magnet,
> and since nobody stepped up to help us deal with the influx
> of the AI-generated bug reports we need to move it out of tree
> to protect our sanity.
> 
> The code is moved to an out-of-tree repo:
> https://github.com/linux-netdev/mod-orphan
> if it's cleaned up and reworked there we can accept it back.


It would be good if these protocols could be done in userspace
or with BPF?
