Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795336364;
	b=29uLLiQ92kSf7Vzyctbp0n2dA5/f36+1wYpFPuBSIG/lnn8QluDFgXmiMbAPbHT1v7gE
	 kjodaQejse0GfHgzXuZi7U0dA7jGjQDocZHfK/kV3Gg++6VbA3ECHPCFleMnZ+VS06g5z
	 p+BxsBQzDJOuMk9j3Gj+zIxGdoGXvx6j6Ohb0IZX5Z5IcosyBasH0+xShpAfu6OY5n8c8
	 JVwUONA5B7kF6fP4lHb0HfD8yPvgPBBVzfbdtpns5fZK6Kalxc4x6akgoQB0UwQEplvVC
	 yf8/ccEeHuJLQ/PMSoRwnh94pSpDhZUadt7Olhulc6B3z6BObptTfTZbANkw9J4bILQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yJ6P/F1jFJr0lVYrdtAG0eMDCHBsrJpW/xU1AvPrpGs=;
	b=FLhQNGKC6xsFSHbBiFtNzcUUVB1wYZTGThNEPdikC4xXCZtgQXiaO4rSxyFlgotj3vqT
	 tkYN5zhAD7DsFVhyQY27bcsgMgLoTMuP20wGDVfU5RJWU/+chLHK6kss0PI7ITnALvT4C
	 6Dywoqav9BEKUH8A5a4yDiiMEB+sWaTEgY+jV7iHDj9MGQljbvLFpVyWS4dDG4D2XxcRo
	 z2qWmUOnijVwMVv++wOcoHtbucMbCMm+IXf93EZkRQxNulqrJOoUiVlqIzENI9O6YrHtW
	 ypT7bYWGSy14gd5KwUzMSa+Lp6qs98hgJ5KA/L8y35aJTCOrB5iB8Ysk9yeTXqB8q4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XB7NeBRY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A214606A32A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A214606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XB7NeBRY
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so3712569a12.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 00:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795336363; cv=none;
        d=google.com; s=arc-20260327;
        b=qcfFGJtJlxGjWuEtrvyQcshQg/ZqB7S0KaZXmb4EbK0fu6D7G6qhQp9ItZ1JjixPzh
         Vl+GkXaZYKkKvP/Hw1xUOkNF7zua/4xkQckJmMUiiHylS2nE8fzSmUy9GApWfEhi8YmC
         mKQ8iKMxy/Ac4tAobZiwpp47Sgn+mYXsAotv3mssBHNARgfgkZEbKjkSHhaYuA03JC7F
         yYBTScJC09bRk+bgFI96T0vmuhmK1fYRQZ0QuiU821prU5SF3tMkGmpJBfvOoD3hCoGq
         KC1Lr4Apu9LannrUP3tSPeyi3HTGDIEcHrF9nz0tuf2Y6RXKuNifjXGbZ8PmQ7AUj72v
         Ouag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yJ6P/F1jFJr0lVYrdtAG0eMDCHBsrJpW/xU1AvPrpGs=;
        fh=03uWlFA6q7F2/Xw8Suo26IL1zoyz9a3EwPmVyweA01M=;
        b=cjgqVZeOTUmoIDoR4nSiF0Zcm3ae+6BSx0P7HMRt92IsYEHwGOX/wQjAf6HV2QCOJj
         0CSWQsMnCKY5EtnpaZSPyuvoWPoNtKGS+tQ4yHglCczZNqORjU2ePD9f6BY+6x5iYxI+
         FL0S8kz2OsOJrZ3FuHVun/qWthB8kWFW3rPZDP/66v5lKxvXNzCYqZlpIBifBh+MZ7/Y
         QdGdWsEJxq9yDBcC9vLnO2LS7xP4XgEFGCKz9PsFqg23nyjzUkFLvd/odKhoLKF3C8B7
         KS3U0Xa/omOJ+TO6JhLoelzgSXq53m9fIxaOpZnv5Ytphys5S6xBFt7fHo3v6ytfjXaM
         OyyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795336363; x=1795941163; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJ6P/F1jFJr0lVYrdtAG0eMDCHBsrJpW/xU1AvPrpGs=;
        b=XB7NeBRY04euhXfWB/XxhB+DzTJzGlP9aMcTsxRixf44G2VojKxyLfPXDeVMXOFFTP
         J4DpFjZ7vFnnGEq5ETvtfFNcf4yjWA/tKzm6BKpfkJk1DMPKFI/e8Vcu5IiKbZWhUDRq
         4rIAr/b4CvqK5q1DHdNfGOQ6gZ46ae3x5Q6KYnbRoT/rKavQZE77Q/ZbXcmELdbQv/co
         IuqV2pxrKPabINQ3ndT0E3PPCa07d9/7iYw3mhuAOYldrIKh9xtwjLUDKVAo68JRPzs1
         5iUJaqhu2IsUisQZQ6FPqOAYMuD/9mx2P27dbuI7wSleqrbtVRyT8FmF7cXNmlLTS7Nu
         k/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795336363; x=1795941163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yJ6P/F1jFJr0lVYrdtAG0eMDCHBsrJpW/xU1AvPrpGs=;
        b=YvR8Jomoux4+u0em9mTLOFH8NqclRl+i3cNO7qIjaGl8SqzphbBZ6wtP3K5SF182JK
         ME1kRTD4JsYChU3RPWCd6C54zbjWQgGWKlYtEktbAnq/9y02rhjbL8SHhhAmENMPeiaf
         1ZKzs4pLlDjvioy1/GCLFu2xIpb+tdMSjfS5yTm0c5QMBbBkJFgU7cTRBmlhgIfSr3a0
         YOmySNImkf8586WONk5U5VFILmR7Zjfih7bvJe2N4wtB0sTTIACg5TpgfUPwNGY2/Hom
         9ZwL1JfWN0xcY20mfeMJtqttwYIlDHEIvFh3gwFyF7QqTxlw1buOpONrFlMCo7ERsndw
         1ULQ==
X-Forwarded-Encrypted: i=1; AL+hErEtsF3tAIXWyyxHNzdngWaR0jMM5LMn9eXRAA0iUQoIr7xdyL/+rw/vCT32MZGz3r3DyUIAaf3NNG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CvDlW3jVtcWDU8SphtUrXTRkDOchhj1+BMbVSKGr6pN7omPeF
	knJ0VW445iXGpZK82c7EzF4D/+FnTYCk9ZnS5VN1xMHQWu1c2YnwrtMRflCrmwx2Ol0D9Pe79ya
	PEGaNh2chzObqDNS0EzGe4gAKbQAjbu0=
X-Gm-Gg: AZFdTZdU54w9kS8Wmt2VkQNaDl0Uj+EqsbnmBUDzUDWFEJJbniC7vSrvfLEmbXQS/ul
	XDZF6hh1caHpUdfQjkoB0JFrKS74pseQ72082cuwumrweB9O9HjBoAxd7VdRl1fJB4Sb3dhV9uI
	aAMjFNANWBK2WU6D9pa8v1kFmL1O3SQ2wqqX3lTShRaDQClR4IbdsvRsmkVY5Tj2dgdIvYYnXux
	PF+md/HMgz+iS9hUFUpf0ruIh/82EE0jwPBUSm3beZ6BAg85/ohnOaIT3G2nCc8FtvfVsTt2n+m
	IRm01YIhLqYiVz4zlAzJdx286LtehhpTvvvbkXTr8BS5ba6CtbsEmnV/py0iHnzoIGQ5Y/F2QJH
	gxQyn5rp/nrXKhQ28rFr7yuNTlrE2GztM8K3fnSs9W/cmwtvkk3RXtLH+Lk/ngpRIBcll3d96
X-Received: by 2002:aa7:d58b:0:b0:6aa:e44a:ae9e with SMTP id
 4fb4d7f45d1cf-6ba1f76f20bmr5784629a12.1.1795336362700; Sun, 22 Nov 2026
 00:32:42 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118041238.14396-1-evostrov@amazon.com>
In-Reply-To: <20261118041238.14396-1-evostrov@amazon.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Sun, 22 Nov 2026 10:32:31 +0200
X-Gm-Features: Aa3M54pZfE2KW1luQ6sOAJOOiUgk0uydYZlf6J4BSyxM_Kpl9YLALdVdQ9VZbPk
Message-ID: <CAHfVqdVw9OQ4OPmpLp4pJQhFw_9E7SLwNDjYXYuuGkU95=gGdg@mail.gmail.com>
Subject: Re: [RFC] net: ena: use tx-push-buf-len while tx-push is off
To: evostrov@amazon.com
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	David Arinzon <darinzon@amazon.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, Gal Pressman <gal@nvidia.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Shai Brandes <shaibran@amazon.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> - We still need to tell the device how many header bytes to pull.
Just to be clear, the device eventually will read (pull) the entire packet
I think  tx-push-buf-len should have been called tx-inline-header-len,
as this is about how many bytes of the packet's header get written by
the driver into the Tx ring descriptor.
IMHO, we better introduce a new parameter, that is agnostic to
push/pull mode, we can choose to deprecate the current one in the long
term.

> - We want to use tx-push-buf-len for this, with tx-push off.
>
> ENA is the only in-tree driver that uses tx-push-buf-len, so this does
> not change any other driver.
>
> Example on a device that supports pull mode:
>
> ethtool -G <dev> tx-push off tx-push-buf-len 224
> ethtool -g <dev> -> TX Push: off, TX push buff len: 224
>
> The core already allows this. net/ethtool/rings.c checks only the
> capability bit and that the length is not above the max. It does not tie
> tx-push-buf-len to tx-push.
>
> In a 2023 review Gal Pressman suggested using tx-push-buf-len only when
> tx-push is on. That was never added as code or written as a rule.
> Link: https://lore.kernel.org/netdev/30cb3990-80ce-ca07-6d73-cdc00d0ad7b8@nvidia.com/
>
> Request: Please confirm this is fine or if not can you please suggest another
> way of achieving the pull mode len setup functionality.
>
> Thank you
>
