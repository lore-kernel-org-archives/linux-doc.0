Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527583;
	b=TW8995o3JEWBR2rAW+vsaf8MdysKnpDa1j51rOLWMpqvbYthxpgKVLNmrY2TrtZt7n+f
	 Nsi5dD+8oM3lf/JeGH6sBPW1KeKP/hNA55ivcw50IURNj1LxncXzBRUiefPxzbayhJSKO
	 xWmsWH/Byb4Xktp1UtbtiRdB6DCtJE5mjD5H+NIQyEMNb4Epw/8GKZKbToZGmg32a51fj
	 V7ZmtPHQNsLXgDAPIQrdzYEqXqfIegU3Z6HzGuB6OT6HWhTtE0FlJ7uGELf8LCtyHeQf6
	 9Hn4eyq8RQiw0ZyZTJJCEiW3QOiFnIZe6hGqVqmqCdz7RqA15sXZS0l8vRtbhP/K7nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mSISClxN0AquiYKdkApngEQlUAzth9oYRTtKq3bxFPE=;
	b=P5IOaz8xesTLvB3dssDZkHgNhtFZlp0t177AESjAdFkjWIGvilRZuiAg0xOJsuk9+8li
	 UfLkogXZ5RqLCyh6Alqb2deixFN+2PqcDyqVf6kKBSvnwGhzYmtiDacqRFJd7in7yvR3O
	 J3lKlFQbcRGYGtB6vMruLNpJ7sz4Kk1lAfAkTBbE21Zl1maOpzLv3dwF/N3hfMeE9RqlP
	 iSsuVacugsBdh4w6ti9jpSgqCfnAwMb/P4pSE6MevOL3aPtQL6GCFuwPCoHJr5FSuYUoe
	 AQszucbElvc8iqE50zbZpmlIq4wUfMcyChf7KbOaFlKpm3JWATCV0gPv6C7RpPyj6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FfAkulI9;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB7606A31D
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 20:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DCB7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FfAkulI9
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so2066642e0c.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792527582; x=1793132382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mSISClxN0AquiYKdkApngEQlUAzth9oYRTtKq3bxFPE=;
        b=FfAkulI9Bq9jgjuKbpc2WTxKrxx5qvuqmeib+YNWdNmtOnNCEb53aPjdhTqp8g/ypU
         bEATnZMrnnX9VXxhghW6c1iQjancMVRR+cbDqpZzhgisRRXw96qCnXr0cQ93InHBqn1h
         mWqkn9vB2+FbuU1J0vWLw7Zi73HtehU9Zby1eUbidAb4TXc0m7Z3uHgn+10K89TW9UEp
         Wq30omMyfxPtRXYMrM49K1jZOAKe3fzLxSzOBzsiNUYVU2+9D8BKlfDqnDSugiaInGSs
         7zVgoLliVBJOTQpvFoJ4HqYoLiPthGxdngPMJjLEkpApX1g0WITKKvPie6TgX2XxhPJA
         ckfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527582; x=1793132382;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSISClxN0AquiYKdkApngEQlUAzth9oYRTtKq3bxFPE=;
        b=trKpBSgB7PKKmorif1LwWJXg2uDNtmp9t00SrzymwlvyS6lgRQEpRi6SdJPcVtaVQ1
         AL6y2xdxzhVkLfrV8GNTop06m/PO+mL+B2VGqlZurXLB2U9gWaj8UzPmO0aFGLlrMafL
         q/UxZ17nN/vQ2Vfb3Ix0kn4bzTOMjBZHo2R6vBj9xEoS+11+sj/65+x7gojyHJz2OZk4
         Qxd2oc8Q9s2lTIlneUR7kFjpjEdJyHGoycTllKAYhlYAM+rVjIj4dU78Ku5tVhlkaERk
         f4PwVICj8X2f7M5YwcP4d+k/bCiTVw9LPcfrsiFIN7QTpjlc0QWZuKygQ1KBur5i9Goc
         BRVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw78D4IxQrIcjDoQYz6nAG/IUvFM0qn/aB4UVjjSDBNmv09R9OcrZJVvemiFJKjshXTs7gs9Xcx63k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWbh62xy/zgEi3wvn9Wc0puK2Ip96TCcjOMHTMnhl3QZ08aFyi
	IW/7ro/iaiLmboVNfoXL1kGbtQ40foDT2QyOv415cDq8DFPHdilqqidL
X-Gm-Gg: AYBFou0J9+3FTqHVfXUxbciie3uzOwM2JzhvYCUTm41FQcI0M+50Khk48HBBK/mLKlY
	gxifRjzyptma2eALdaBgBWIqauT3juqFPHAD1qJzf1/dOtSqB2W/i7QXImdApLyiBe15JDkc8Yf
	OxbdXDFjJVrqzUWlv7HHROVhZXmDB9/XAPHeTlOXWK6u80ufxXPv23cSkYkRt8njFQ4mpBvc5Hs
	8GY7ojP149arsLz1cOtq8jeocum1mmy+327Iy3qjrKNvxXa8lCNb4iiCoYjqGelyiHT4dBmDO1+
	R7Gwc/VEqWvzdJGre3PaSVVbIhg17HwjbqsdtaYzVej7VJdBorG23k3I44KzH3RaloltFFobOWA
	VFuwt3Ee75GX+Dq925PkC/BuxI8ZTAE3xvkMoJfOq+Giy8gldiZKj4tH3wjc9bEHTF57EUZjZKy
	eSgEnhpT2fYLfUofnPTpOVrgCF7pjFzm/ILXwbAiw1XyWKW9tz8RZ8Yf5K1tP5yDVWsvSbXZCij
	JjA66Q8OoXjmWfa6d/QYXxYVZULJ9ZPErIZHidT9YrJAE3ZImpTSwpZVWfhVNLsUgIoWk+Z+Ms9
	1IiTCZebk27l95vMJ4S4l1Glgjt8tzNUOhgFBA==
X-Received: by 2002:ac5:c00e:0:20b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5eaaa3a4e95mr3071748e0c.8.1792527581939;
        Tue, 20 Oct 2026 13:19:41 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983efe8sm587906e0c.17.2026.10.20.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:19:41 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:19:41 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
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
Message-ID: <willemdebruijn.kernel.2c9decc16892@gmail.com>
In-Reply-To: <20261020155917-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020155917-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH net v3 6/8] net: add a sysctl to opt out of virtio net hdr
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
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > Michael S. Tsirkin wrote:
> > > The ingress validation as implemented by the previous
> > > patch is stricter than what it replaced: GSO
> > > packets whose checksum metadata matches no transport header are
> > > dropped, and non-GSO ones get their checksum completed in place.
> > > Such packets used to pass with the metadata unvalidated,
> > > and with no overhead.
> > > 
> > > I judge that this should not affect any deployments, but there is still
> > > some risk that it does.  In case a deployment depends on them anyway,
> > > provide a per-netns switch to get the old behavior back:
> > > 
> > > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > > 
> > > The default is validating.
> > > 
> > > Assisted-by: LLM
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  Documentation/admin-guide/sysctl/net.rst | 19 ++++++++
> > >  include/linux/virtio_net.h               | 23 +++++++++
> > >  include/net/netns/core.h                 |  1 +
> > >  net/core/dev.c                           |  6 +++
> > >  net/core/net_namespace.c                 |  1 +
> > >  net/core/sysctl_net_core.c               | 60 ++++++++++++++++++++++++
> > >  6 files changed, 110 insertions(+)
> > > 
> > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > index e586e17fc7a5..b1a1c4714b22 100644
> > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > @@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > >  Default: 1 (on)
> > >  
> > >  
> > > +virtio_net_hdr_csum_check
> > > +-------------------------
> > 
> > virtio_net_hdr_validate? In case we do have to add more validation
> > later.
> 
> If you insist. My worry would be what if that validation is again
> user-visible somehow and we need to distinguish users who want
> to disable that future thing and users who want to disable
> just this current thing.
> 
> Hard to predict the future. But I will go with your intuition.

Thanks, but definitely feel free to ignore my suggestions.

My intuition would be to define as

0: off
1: everything one
2+: sadly needed fudge values because we keep having to tighten,
    but some crazy workloads need to opt-out to avoid breakage.

