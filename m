Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9431529DB65
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769496527; cv=pass; b=cq9b8LbBXmpP+sHMVv5OopVOwbUFQWF2Ummbjaz+NHksBKM/ulllUmGMPKrngQLjuti+fzElNcJev3WKSsKYo4PaRHKy6d1qLQVo0FtCU+vmG7ML4Or2sQhxQdKvcBnomdaM2yoKTxWx+L7Z7j0r3Qw2SYk5celUc7qqph2qaPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769496527; c=relaxed/simple;
	bh=CxIRMovTnfY7BOPDwAT+IKKznYhpBl0NgKictrAZAM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRza7hcJjD0Rn9jiYHahLAuDmliuerC/A/OiRuZ3XO6TXBBPIDv1Bo8bAzc6FNlrnGpPA8y+OgD0IIscUFRKp4P/tCYbApklifUOcvA6Nn5eZMmwEExLk3hD5/pF1/HAp5GOx7ES2jq6YayJzQgBcEvlSF+kVxDDp+SN4EhZaaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nluosrmj; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nluosrmj"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d1872504cbso9891a34.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 22:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769496524; cv=none;
        d=google.com; s=arc-20240605;
        b=FTQll3uwcalXa+lqMEE4b7puEpYTMvUhhYXUHiO0TafYwJOod27+ptXicCMWFMuTxM
         1Dk9moX3xzuY3MmkViS4XtnnoVbvbeUDeDnvCTF4weWrn0deYxC85CWWvn53lNztUQja
         MLWpcXPXIRK5gpc0wpF8Lv/NsQiLcW0ETp8hBx0IWEATPzV7Jygt9xw3OFEhnib3k1/2
         FpSkRGbnMYtEI1HYmtnxU+Jztuy5GE4NL/hpQX8ShYp/6QP5wi8YoMJnXHdJL70vvHC6
         /9UGXHmvs43JHdoexMfJiQ2kNdn6EuvhQcF3F8ZsxdkIpcmamUVx1DuC8Xzcu3J8uGjV
         glkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CxIRMovTnfY7BOPDwAT+IKKznYhpBl0NgKictrAZAM8=;
        fh=LKBZf5pAiJpHG3LL5gScrpMcK2fesegal5g4Z0E55xg=;
        b=a6cO2n11o028N6XXZMD5xzxugPyCLBr5o+JWLC73UkoHhXuvDWTj3qb8f/0fNsOO+4
         QFtLIdutuHAp3nwyJkKjAp+yGDFMOqDANI0CsZiqFczDvxS1YNNmF25JQZUFziCqwl+3
         3sccryFoPTo68qAcJhab0yaaDqPs4sXqay2UPUkpdY+QrX44O/3EktfbSLPnshaK0zod
         nuAieniwVruG2A1+ECzDh0Wg437wEDSPLnP2zY80ikvxqn/DMekESVCCIZur+Px5BfGM
         VoZ8SzuJTay5XKWzOHMBduz31NOxrTk9IkOot9dQg9x4RWU1B0MxP+6ZcBz4DJk19p4I
         eMOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769496524; x=1770101324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxIRMovTnfY7BOPDwAT+IKKznYhpBl0NgKictrAZAM8=;
        b=nluosrmjcTC03EXfQsaf4QF4B6ABR3n/fFgV68xkeVfb1/PZr2WI9P2f2IS3s466lW
         DcLNFtkme7y5gn6bljy+sgz3PdblyG6xGf94d2dwQCE8Kv8AY3jM0typ3V5tTrQbtE6l
         urJ13yKGi4YId+hOvitKw1848zoLduDSWanaFmhA/v1auF2ZYdt7SUXrsLSiqDRINATo
         hm/jZxpAV05TsigbJJlVxcD7wAl6+IskjIE66wt2Trs9goZIJ+zETyuq7Nisjs4VMOlh
         YJj5vsA86fBj01y/cH2FnPMTxDwyrj8ajuNAH8zJ3PJhzfsvgTQ7pA42+5GOrumQt8QO
         DOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769496524; x=1770101324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CxIRMovTnfY7BOPDwAT+IKKznYhpBl0NgKictrAZAM8=;
        b=bkK1nUcX5xax9CNW38e/gqERt90d0LcqbZP+TUN08B7zPhY7nT+1kDaaiHkZpDOOg3
         vsrDwRoBd8K8JquSYfgHy5s4aryHBVCmrBMb9EYKOtQ3lRfI6xv4S6jQ3bT553YxUjSl
         6gLEt6laFoqimr4TO8ukdeQCEpF8oPrpLnmi8GsRdImithz9W8ViHuiBByAdx3/ioanI
         18juRiKXQdfIDTuuxdeZx47XH4mBx4T8BGvDNub/gYL1iW1vLR7lGtwOSIaz2mqBzRyA
         ZRdbi58Ef3OIa38DMAZ+5UlU9HaX3xsx1aArhR05pG1RUAdTuz5LK/mH6h/Bygo/Bl+y
         F4rA==
X-Forwarded-Encrypted: i=1; AJvYcCU43vVomuSosA/FbeRffZT/Xf38+pTW2nDOfUdLyQUIJFnq/v574MGPaCxzC8MvrNrATDQXPbXRinE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9oRxIR4CVAJeuZM+TiXuEI9thjhv+8whXMxSqZLWOskx2LwzG
	Y6JzmhIiOQ7OnsFvj0L/jDMk5QEoa8pBpDU/xfxYZYPI2lUCD/PsK+yqqwz0sOelitsZm1Wk3km
	BQjBYgvsE/co5kGd6NBb67dc4xouRA9Y=
X-Gm-Gg: AZuq6aIwRV+NQtatl+JylVNCKTU6cIJ7APgzmo9RNBwmnIbZdLnt/ssrhjQYvAm1b+1
	gYYdQI0smbLo8j+/SuuKVEWO+A2rHXp9MHJ667UvslGuJF3xj12ghCYZXtCGwm4MNRqRTpx6yj0
	rEGJ0S9nPpwytO7M9QPPoSIEiJJ/VI6ROJkqHydjRS97b766ZIQSId9WHeBAtb1xXgPLGt0ipZO
	W9I1hw768eR/heOEEIN/z/c9nbD7Fa5Du+GaJ2snHUrilJ9wKK5AbmYKXFsoAXSqTea9hg=
X-Received: by 2002:a05:6830:2a06:b0:7cf:cbff:85e6 with SMTP id
 46e09a7af769-7d184d86abdmr569911a34.12.1769496524446; Mon, 26 Jan 2026
 22:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260120170749.101e8bcc@kernel.org> <CAHS8izMZxM6rcF+7Lfw=KFv4dmbHGSUrQBPmxO+sYj=V3TRuwQ@mail.gmail.com>
 <aXe2QhzL4DoVbesQ@devvm11784.nha0.facebook.com> <20260126173124.1f0bb98e@kernel.org>
 <aXhUfC7ZyYge1jti@mini-arch>
In-Reply-To: <aXhUfC7ZyYge1jti@mini-arch>
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 26 Jan 2026 22:48:33 -0800
X-Gm-Features: AZwV_QhrHs-Dl6cs5hMxx8ciXfNLSD4IBMm9I6-KLkEEChYQVa1XWumT4YtOBco
Message-ID: <CAKB00G3p9_VUTEW_KQvS1JAd+Ju_pjrU5r-v_p+K8Y=vH__mTQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX
 token management
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 10:00=E2=80=AFPM Stanislav Fomichev
<stfomichev@gmail.com> wrote:
>
> On 01/26, Jakub Kicinski wrote:
> > On Mon, 26 Jan 2026 10:45:22 -0800 Bobby Eshleman wrote:
> > > I'm onboard with improving what we have since it helps all of us
> > > currently using this API, though I'm not opposed to discussing a
> > > redesign in another thread/RFC. I do see the attraction to locating t=
he
> > > core logic in one place and possibly reducing some complexity around
> > > socket/binding relationships.
> > >
> > > FWIW regarding nl, I do see it supports rtnl lock-free operations via
> > > '62256f98f244 rtnetlink: add RTNL_FLAG_DOIT_UNLOCKED' and routing was
> > > recently made lockless with that. I don't see / know of any fast path
> > > precedent. I'm aware there are some things I'm not sure about being
> > > relevant performance-wise, like hitting skb alloc an additional time
> > > every release batch. I'd want to do some minimal latency comparisons
> > > between that path and sockopt before diving head-first.
> >
> > FTR I'm not really pushing Netlink specifically, it may work it
> > may not. Perhaps some other ioctl-y thing exists. Just in general
> > setsockopt() on a specific socket feels increasingly awkward for
> > buffer flow. Maybe y'all disagree.
> >
> > I thought I'd clarify since I may be seen as "Mr Netlink Everywhere" :)
>
> From my side, if we do a completely new uapi, my preference would be on
> an af_xdp like mapped rings (presumably on a netlink socket?) to complete=
ly
> avoid the user-kernel copies.

I second liking that approach. No put_cmsg() and or token alloc overhead (b=
oth
jump up in my profiling).
