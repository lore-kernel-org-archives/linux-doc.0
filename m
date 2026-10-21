Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599249;
	b=raEZhIj/KT5S432stAWNmyCT8MVEhQMNVg5qCbyWH1HsNfJl+Hm0UV5i0xR3WM+5uPLh
	 LzvD1gW1YyPnM9Pyx2hvRZJhsDuP0F7YJ4eEb8d7IbD0BaXlIohbSDJP3OIZ4SgFDZQ2+
	 eU43FcBXZ+5rIxzU440v3lPbXduOto2BfUGumJJAL4uQziibteZK8j6b79aGVWCVPcCSx
	 Uccbshw2Lw8KV66ujfkq2hIeA0PmMsYmvsxcFm3wJc33ouuzzzNVh29Xq19bxoFYXJKBC
	 LwZ4dVo6ooHCRtFxAyeIQfey+5G1bao2jQ3HywXvtNDJY5zbWYY6VTE/hC74bQ05zDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=q0CCx5zBhN0UXD1LzII8NwADZSGCTEpTQppyCBNHFl0=;
	b=Sqk9NfYd49HypZ817mmaceQ5pUfDJWgzDEmBcAZvUf3kIbQj6KalvyUZ6MKZe8doeRVB
	 9COKUSWMUuxKT2Q40baRiaMfhJbGViojQi8sHXEMOhwN0O+vV3jMX2KklBRVUaAtStsrz
	 qqfWPbP519NCAWNxLAfG4PtNC32BjwPDHcfaV4wg8e/EuAKRSPaJkB28LC6aC0t0w01uH
	 f0qwshDN4Ex4ppcbfhOpjIaYv3vV4KIGmpZthOHCHo64gJxVDsB9lP3OvMYxDS723eFBd
	 wI70M+vN594t5bP2rDKauWOqlqKT2jRnqcCBopeczS3Hi+K2lOzSXLSrhMmYMcbjhIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eF9pnWtd;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A3606A577
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06A3606A577
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eF9pnWtd
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9903fde8db8so241048241.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792599248; x=1793204048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q0CCx5zBhN0UXD1LzII8NwADZSGCTEpTQppyCBNHFl0=;
        b=eF9pnWtdEq3WSD4Ywhg2iwjsDFp5Vh0YqyOff8MBi0QVXDi4dFI46ucw4bYE0op/+c
         1F/qQIca2RcWZT4iN16zIt1jWr6ZFYOiPx9NN5cIkrrEyw+E/XH0M9oCJYdMW6cmJZcB
         HapzSaCJ6Opkp8aU4ZEUL2hO9e8FoaEavrrEuUBWKJdraCE/iHTQLPc64bikh1s7kOOi
         qkO1DWMjcGiIWvUep0Dd4+Ne6jedd6II++fSimRre7snR1dbjRqDlVKEcXELVQAlVMzZ
         bQZuTLez0kGOo5H4kRJL7y2JPFlYSN1ImhpT7FJeSe53zlqDA7XbhzQw8/s4+WdLqc/T
         ST9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599248; x=1793204048;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0CCx5zBhN0UXD1LzII8NwADZSGCTEpTQppyCBNHFl0=;
        b=BkfHE+0YVMBq6jqAjpmENNzzyBpJrvZ4cDhmgvWuYnwkqY76tu9UgiNHf9JmnMUQDD
         2tSEBHrqhVBUywjXmCIf+74JRHzmIVPV4AvBO+31pmVbTeVih2WTCYsLyiaFiVuqLjWN
         sMAfOFlFDP1Y9+nY24VIg1kHqNQA6vNENwTEFabpR/Wm+UR5wBcljIkYRv3/04e3h9/Z
         kkVuQaf17RTGrfGvYuSewt/ipYMYz2Qo0uuQZ2Ih4V5Jho9TE7FwAkfETWJyySEvan2q
         5pE5GIZTY0s8SB992hUkHCA64iTGCBJoIbUHyXLGyXZNnuXsQldTdR1BCuy/qJcmGMrI
         0BZA==
X-Forwarded-Encrypted: i=1; AKwUvByhYH0ZkWIbYTQamy4xoYvjNetX6EQaVAQwxhvD0EeC9faXWeyR5LKSyV03hgh0kQl0PCkw3tpZJHE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA5pbRjcDbuHmueD9Ngx0fgxYrXCjx7hqaXb/luSKmau3SGb/M
	yrTKwahoeS8FaYOVzlgbf98Z8ufGtiBARCKjvdYZ7MSAb2aELXKdOVNf
X-Gm-Gg: AYBFou2oDKwg6fMDjFDn7oTl/cOnLp+z9o/PD2u9jaDtFzP6M1p9A5c2rYDj7wQD2mQ
	vqMyy7HNWQZvRre8ohSBsnI2RfBwH9TUtkCmCBaqi9vdkvE2v+htG+rPoYgBkw9nHRxLXcH6/S/
	UkQUtewwh8O/ZBKmeqR7o88nUbKP/v5J0PRxr29yqPT1HjPr/k23Kku+ypka62DsPv8ee3R+oCn
	hoWB+yazF/GJi1p4D5NdkpRGUJCr00ZvJt1pVYrwTL0jvE4OdMS9h4pMs54R6U6Opl7QboWCmCB
	NUpudl8WRhg6/xtuEMd2fLlrf6gwKaN75OhJsaWMrDg/ASWs51AYpxCtw72FL4JUza5E105o+lr
	Y+QlN+BDj10TvhntL33vsb2J3P8WC0fwyzpHYbIz/xQfoGp4jNXXwHTNiZFAbkEX1hblgjS/pmb
	6A3crIWAXgLy/jCJkO4Gcev6HvNAQ5lrNd3NjUyL9yl/heTSm8hv3Xy625vGUQeHhUSFQzVCtf6
	fMvloLZnLFCnmxpYvV+zMMjf0U8eyMibL+4qsC33roXj18UMR+x03EEaXvbtguiWdLfFIynrUiw
	LW0h6rCPawaEUIh+2M5jaEUJ6d8xa1FL8T6jkbYGxeqvebc9TNqhUJxTYFmDxMbxt/pYu3dmYrx
	lcOcTpxC8+QwDd/2g7dV4
X-Received: by 2002:a05:6102:3fa8:b0:7c3:9a14:cfdb with SMTP id ada2fe7eead31-7cc926820ccmr912621137.17.1792599247553;
        Wed, 21 Oct 2026 09:14:07 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc92327896sm3196621137.4.2026.10.21.09.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:14:07 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:14:06 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Simon Horman <horms@kernel.org>, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.311d7bcc5fba0@gmail.com>
In-Reply-To: <595385b672b5411849d1defc78b68b25a908a77a.1792565282.git.mst@redhat.com>
References: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
 <595385b672b5411849d1defc78b68b25a908a77a.1792565282.git.mst@redhat.com>
Subject: Re: [PATCH net v4 5/7] net: add a sysctl to opt out of virtio net hdr
 checksum validation
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Michael S. Tsirkin wrote:
> The ingress validation as implemented by the previous
> patch is stricter than what it replaced: GSO
> packets whose checksum metadata matches no transport header are
> dropped, and non-GSO ones get their checksum completed in place.
> Such packets used to pass with the metadata unvalidated,
> and with no overhead.
> =

> I judge that this should not affect any deployments, but there is still=

> some risk that it does.  In case a deployment depends on them anyway,
> provide a per-netns switch to get the old behavior back:
> =

> echo 0 > /proc/sys/net/core/virtio_net_hdr_validate
> =

> The default is validating.
> =

> Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
