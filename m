Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3529BD91
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 00:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900349; cv=none; b=XDtObbhHUNwGbClV7eV4Psm7c0r9X+DaCSz4SWvILTBKTzvFof23Dqh1wDdYD67rn4bCKBjrz0SLpK5uzu9WwwP50ZCkKderbbSw75okl/GrokIOESwckuZdXZ3SVxpbGCK0Fxt5xtx0dSDSuNS2wFlHLXmRTrUZKjNFbzG0dB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900349; c=relaxed/simple;
	bh=tHOOuvQftQXv7kCz1QwflqeQnXUUIQsuBI7s7adJkwg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=uTo+JV5cI2Vqfj2aqhk0fD0dpLQyrpkZOrE4FZXg0z77dBx8UZlbtHDKaaPjW8jyBzQhks0jyqJLE8V4OL+NoEBExKTdNkknGc9/iALa/JxMduhNcvBnFmUTDoWk91zpsAxKZNB9w8mk67fhy/a9q5uRgdUhS0WJ8ZOkavr588Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zq/dt9UV; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zq/dt9UV"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ac8a2ac52bso11733067b3.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 17:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900346; x=1791505146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=535iR1AeWRu7qsNxOz73cbrVlGNHnndMzPzdHrUTQc0=;
        b=Zq/dt9UVyCXAYmJeslfvxQyRPXIlRSMGZF3Ywk6M+VzCsjrAd5r5rf00UdS3Iapwt4
         /QhotAEQQzCdKIn0HSgKkhr8aRFwGBSM5c9iFaFf8iZwjh2FhD8zy4VC0r1gvmPwMCi9
         XOwoZrm2YPhSBSXHANzvEodiiWQ9YREXH+FkKFhL49Mog/Egt1qMfSYFUiG3YQpSLA1C
         O6ucIOTinz50hU1CVpNv1aGgG7G8da81e84hbnwlkuvb7xHWiD0PZDJ5DrFrhOHmcFRt
         OVq9wZazBGOX9Oc+BbegyhSxqS/5IG/Y0mj47cQOikFRzGBCAz6vqFouGmx/z46GLN/s
         VjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900346; x=1791505146;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=535iR1AeWRu7qsNxOz73cbrVlGNHnndMzPzdHrUTQc0=;
        b=EeR2CFiic3+oLOWM7haVnetPn/peDu2Qr9LBB1+9ulJnelwS15eySC2Wlsl5bDhYe3
         3nBKqBzO0BDNBRB7mMfL8zhcPMKHGEmyIYSmjNN9RNK3Q7H6KMIj+CtX9XGBeS0XmNOo
         QgQ45OmB5GpvfDNOx1yb1OXVY4gyI04AT54+C8PkTmhtpYAHtTZiokaKQ5H50Kdlgj4I
         arBAn7xntNyN90ZNhCKrBa+FhxYAPH46UAZL1I9dQk+oo3XbEwDni27K7wfsr3vby33B
         5cnQ1DzhXFzjYReA4JpnSes4b9388oLp+rjfyQfOEWnKeCdKW+8Ew7muX85jIfO0d/50
         EuYg==
X-Forwarded-Encrypted: i=1; AKwUvBxf+efyVs366fBavOPcZcby7dLZt+ZbymG/OSEahjIm3VmLLbDQyfVc5/4vlx3eraEogl8VjRbXYnk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1IXo1x4GK0E5pYla53kTexRhjMAWW4mEF5c7qJIWuViWhMkMn
	fIHP9ziFJbzHNmWA1bHV+NtDKdXXaG0omMR0bGkPKRW+9ixCSQ3K6/tJ
X-Gm-Gg: AYBFou1+6c8W6vrWGguEhuUa8DMzyaWaK9eG2LJLbYyqtXsgBsqYDfETYhg+l/AI0Ci
	hIwj9z10HRf0Bihq/+NNn/bOUT0N/L6SZzSqXrU7wv3Ea9T+ALe/8WIdBzsMha4raLo0O0Hm8kA
	U1GLOs1YQZH+ICNp/vbYSSlzPE6/St3oICrHpKSdx2x9ZwDx+5b+jRxFvREflkVuLx7T0But/ac
	sifvmbKzPpnsU8wW1QuL/Qe8P9rzTqZ3DUthLqllHgukCMNQkWhNYBS+t4L0sTkCQXJqiGB68ml
	BTWVuh5ynHCcz3YBnEF+ZC1UQeHrLa6fIh4vf2dDhEaPRRr93wfE7K9dflr0XmU7rgQiCviapRT
	oVy15csGVr7k2daye9PpbhHmiYCDwCHvXvzCnWGAOig+vumvhbYguCl/9UrD7xhOONr2lsxEntF
	vdkDKWwDpgz/ljByz7V/VxXRkBklmdiGEESfsnypX2QUsZUZXzWv+U2uPprtba43Y/5SRAtNe6Z
	NFeqfrCkiF22reLkp4jn/RNKm+6/qtI5rQwGahw2xZMrtXqR5StsnP/neHz0Ts=
X-Received: by 2002:a05:690c:c3c4:b0:8a4:e89e:5185 with SMTP id 00721157ae682-8acdae4a24fmr17253507b3.9.1790900344396;
        Thu, 01 Oct 2026 17:19:04 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae330e89ebsm3300567b3.30.2026.10.01.17.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:19:03 -0700 (PDT)
Date: Thu, 01 Oct 2026 20:19:03 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.7eaf3a38aa5c@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-2-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-2-f266e7447129@gmail.com>
Subject: Re: [PATCH net-next v2 2/4] net: psp: require an established
 connection for association setup
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Check sk_state under the socket lock in both the rx-assoc and tx-assoc
> handlers, and only allow association setup on sockets in
> TCP_ESTABLISHED. Also, fail connect() when PSP assoc state is already
> present, and remove the dead PSP MSS adjustment from
> tcp_v[46]_connect().
> 
> The net effect of this commit is:
> 1. PSP assoc state can never exist on a listen socket.
> 2. The upgrade to PSP must be done while the socket is in
>    TCP_ESTABLISHED.
> 
> This change defeatures behavior that was previously allowed under the
> PSP uapi. My justification is:
> 
> Nothing useful can be done after association setup on closed or listen
> sockets today. Listen sockets could accept a PSP-encrypted TCP SYN, but
> the child socket will not inherit any PSP state. On the other side,
> establishing PSP state prior to connect() will result in a PSP-encrypted
> TCP SYN sent to a listening peer, which in turn has the aforementioned
> limitations. That implies that there cannot be any users of this
> feature, so it should be safe to remove it from the PSP uapi.
> 
> In theory, the check in the tx-assoc path is more restrictive than
> necessary. FIN_WAIT1/2, CLOSING, LAST_ACK and CLOSE_WAIT could be
> allowed, and the peer would accept PSP-encrypted ACKs in the
> post-FIN-sent states, or data in the half-close case, but it is simpler
> to disallow those states because they don't fit the upgrade model.

And preferable to do so. While it could be allowed, there is no real
use case for it. Simpler state model allows simpler code.

> The check in the tx-assoc path fixes a bug in commit 6b46ca260e22 ("net:
> psp: add socket security association code") where an unsynchronized
> write can be performed on an assoc shared with a timewait socket when
> the socket is in TCP_CLOSE after shutdown. This commit is not targeted
> at net because its premise of preventing listen sockets from holding
> assoc state depends on net-next commit 8cc3aef0cb19 ("tcp: Do not allow
> buggy transitions between ehash and lhash2.")
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Even if targeting to net-next, you could consider keeping the Fixes tag.
Importantly the prerequisite patch is mentioned. But is only one of two
mentioned here?
