Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817668;
	b=s60p6SPuTKeBNm5jWT6d5DFieu6XjnY68mL97UDiU4qkTmB4uIsiV9zR9f4AsYerwTm+
	 4JqQcLBOWg16QyqG8SYhtl+Rt6XwCyQLtWEk+X/JMK/OtsGSc4KMXgfuoeVZMseHRGXXz
	 JdF5IsxiqziUv6TzbTl3tIbjAbUmRmj0wa9IL4Plb83fCHOX3U2uD9rYztbga/pqFZylh
	 dPD/h9p88uKgR3kaHCUxxq4Kd6wP1jzxm+GqxECZYq427Oq5vjsH3oSL1l2WZRZ6tkHgN
	 g5+CqZV7JF1FrC4fYsPDiIOaif3xe4bkW6yfYfSIrWbzBhH5ZTdDZKvTApGRL6NB0sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
	b=nSWFQ8D5MXvzLSWu73xIa+7/ljjX95g+nVGuhODf6gnR6TgNItAMlUaSCUYEIlWZhYuW
	 qIf9Dac02rc4OwPbaPOlKBZ+f+Zk8Q6agVtm9dW1IB4r2eHCeGnZ2f1ZGOFVK5DZqAfCu
	 6bitq0GQ52+O3Yoy3xaZguFGeIijmgwzv8slC5b31h1/0v+gNch9rk5Atux58f9w0dLkz
	 +0YVLc9kCVPjhwjc/iSzw1B656x90gWHoZjIhn3pUIBC88cLCNPwFxZXmoHG5dOJ6WGwg
	 fRvBt2Bwqs01MgV5mGe7/FkgpL/vtMpQuEU0wDzUouyIEIMpAVcvIkZ0UW1vm+646hA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JwXKkOiA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EAF606A321
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 22:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4EAF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JwXKkOiA
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4fb5d96b3so130566667b3.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 14:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817666; cv=none;
        d=google.com; s=arc-20260327;
        b=FlJmLzYNtt2WORgl38x8EMzTClqenF0TtrNtEpKE4+FqsB4g2n+5/hfQfs+72+ca8O
         zg4DvGauUjYnSfcCCSKVOsTlP12oGXoCnFTVY4szFfRhgg9Gm9kVMdIEppFePQdsuaTV
         wIkeYDwcI3zc9zM2zDUilWBx2biTAALhMQPJW4PWYkqcFv2+sPwaB3bWD8aMgpFynqmw
         GnT6rW3wIzRtatkOhRbbNzA3dcz4NQxz9Y7TPd7JGn1y8Up+xy3ncgCTP1a6I4Nde/WF
         myll7kHrwQKyXhjqmnSaaR6WW5S8uUhc3Trqqu6fd+imYvodr5VYSOezXKfEBmxo8Lir
         vPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        fh=5RQdnqf2Y6bH7hHcdjlSokmkfHy/JsO0O8sxD3r9/vg=;
        b=JYqfFQTMiHDpPWfLGOMb3ZX8CLzDz6Mub3cX7012ghUSDeUEeYHfLRrdh7wbp3R8fZ
         hZW5xRt1RLC44LhD7860E2xLJiXczJhE8Rcc9n4xeJCVFSRLFqmWHH4hj6zC7S6YOCMq
         KNKbb7zJ1DUmU++nXKRrFejHWc9u7/qYdpYn3Q1NgkmKdlgzzU1LIaKmqpLT7fFkss4l
         HNSXJtsMus58CDCFuxLGhSH8s87D8MxNQ5eDsXe3Td/1ziCX+u7X2iOoMLB00istKJdx
         2++QPmFUnt4nHS4Mexj0nB7dvzz5tzv4nr+FB6yX7D4g8GJ6rJwQX9UNcut0kj8p/qZ1
         rXkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795817666; x=1796422466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        b=JwXKkOiA1hHPevvY6KlGz0H49ngjn7RSbuIh1YPq3ZNFaYUe1nazCmKX2br5ZXNy4J
         lrV768348Q3U79vKmJySW2rQ/MkbDivy3dmUMfBNwTYOAPAbhoTrWGG85bRhMU+mxDin
         Q4jcdvzBp30jHmZqt0LjihCvbPF3x7iSxL4xEcataneXHFNDE2OARzMZQw8C/x/OLs4E
         LSe4CdBiFOxtxXIA6bELFzV2YiTbFfJtbz1i4xQtMCPC5/g7joS4/uxbvwPx90zjmTTM
         CE36Ip4C4zEdmHSCsHw+iyU9lpY7XuHS3y/YQZpYEZUXtfn6/OBY8NePBmmoQXkwJn72
         L+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817666; x=1796422466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        b=dpL+rrDy4qCGzK6sCh+/8n/XK3WUYq8bZLvtoEyabFe13zhzZdOmfhQAKTb06AOlwW
         T3LWFt5QgNLT1WG4qfOhcicbs2omrQQvTcoGiVwKHE/foAF+H8Aj7j5iKt29NQCaW1PV
         T9zSKQhpCbk+CvFn3xASbBpnX7gBHZL9H4nD2odzbbDlVDJqkZu1zaAwAM3TxmpZZdAJ
         n9J/qnoa5Q3AY5F8g0xByL6ePlAVYLtcXzIdSJyt3h5j5TotNj8Fq7l2dtur3GlHyrOo
         B2fYA9C3A7NuxBAzWwyEJrpdmRgbpHvKWdENsc8mO1U5/jqn6wsJnPZaasgv1WIIVRxJ
         6r6A==
X-Forwarded-Encrypted: i=1; AL+hErEu/10HHVn7kCIOmuNh5mAg9y1yrasgiGatDR8u3kJe+b57a9D79B2ZeEFuYTn5jGBTHNJhXQNK6dU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pWC5e1rTaQfxO6RMYEMRIdsqnzxWBDnP7aC5AgbyhX84SErhD
	Pmro2hvzizSipzf8w2it+9ch2DdtObi/+33zyRNArisGA0RUx6SjBKsxymYQqRjZM7wP6jctZ7O
	02o+Q7ybqKIpoPHrLpgHAvQDHaYb9lEqT9TwCL1LlYgoOW2wuvme1q0IrWw==
X-Gm-Gg: AZFdTZfweid8B2vBmWiBkUlnATFl/f42rlpNywlwT5Uyo0+qNgqd2DTIFs65q8+qnvj
	arjvPWKmsTcUNIrAfD0P+v+3YC20Od8UvbsxccRgx3BbG2bDjpco2FoDzafcMeKG7NtczZK9T+S
	k31BVh+B7GYFvEjnSTvCy3iQi7+TW3RB46M7U/6DcVtiLgaw6PlWmsFIv/a3wDQb+0pAmNG9QzA
	yAsJ4pTIdIG8GPAa6o4o8dyp5fEhxtAM5hArsS2hmmjrJv5xiNxTAcEk/MWb8nv5VUPgjFmfzih
	t+PxgEU75afg1DSPwEyvRSe+5F3ltnNrr5YZF2bC6YtZZZFPzXAvZ6RpK+225kNug1G7UJuFEg9
	cqL289OuKrcruHf0Ue6R4+mwg7jDS0fS0QcouY++ckEQlzzVJk6UNbhlbwN2luZKdxbKU
X-Received: by 2002:a05:690c:290:b0:895:8474:3c6f with SMTP id
 00721157ae682-8b5201eff64mr106815777b3.0.1795817666463; Fri, 27 Nov 2026
 14:14:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-tcp-l3mdev-exempt-ports-v2-1-b920f3ff8f5e@nexthop.ai> <179572802536.3135.6305865608768923950@kernel.org>
In-Reply-To: <179572802536.3135.6305865608768923950@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Fri, 27 Nov 2026 15:14:14 -0700
X-Gm-Features: Aa3M54oqRaxMY7_UWPQgj5lUHHUmW8MGZPBMkR5eyixxsYNc4OEEliipG1r_sDM
Message-ID: <CAAv61uQA=z5i7OB3O55jvcZP+wVt5907oPUnhuO-zyjn2-P-SA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org, 
	joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> Could the commit message explain why a new UAPI knob was chosen instead
> of fixing the selection order in inet_lhash2_lookup() and
> inet6_lhash2_lookup()?

Yes, v3 adds that to the commit message. With both listeners present,
existing setups get a stable result that depends on creation order and
address family, and making the bound listener always win would change
that for every tcp_l3mdev_accept user. So the new behavior is opt-in
per port.

The SO_BINDTODEVICE case without a VRF is a fair point. The same
early return applies there, and this sysctl does not cover it, since
it is scoped to l3mdev traffic. A change to the lookup itself would
cover both cases.

Maintainers: if you would rather fix the selection order in
inet_lhash2_lookup() and inet6_lhash2_lookup() so that a matching
device-bound listener always wins, I am happy to rework the series that
way and drop the sysctl.

> [Severity: Low]
> Should the document leave the fast path columns empty for this field?

Yes, fixed in v3.
