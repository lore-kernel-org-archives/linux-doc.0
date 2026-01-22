Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF42C08B0
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052340; cv=pass; b=QrE3zaXuUDeMKV104DZgiEsDNsIlvzwPKdnTTf/evxyV7WaB1iZK6F1UVRF6L3KCDJ+FDdE9I96+znE3mj9+Y1iZ0Xeywv6p0mZzu9ES6fXqkQIcj6OtcespHPTPrOwyFxG8hxnOzKMVgM5OL+pdGqD1zgD8UIKhcn9aV/NpGpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052340; c=relaxed/simple;
	bh=RxcFmI2IAGkmYdnYkNa89B1ljCXr8uo8gHzSY3WvK9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kK9655BHLXZzx9fbTKAzqNPmdmyTDsnTG3F5zyjbozuHUIcMQKn1QdoOtJzeOjyKEA7a5CdEEnhfB4BSMD3TXPLlvwa1EnFtOP6e6L23o2LtqHUTU9YE+BLcsksb0FHgFnEQeI8Qietq+zhHpdlOInIhFWpIGRPevnhv78/TuDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kB0wlMIw; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB0wlMIw"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7cfcbe7d176so185564a34.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 19:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769052337; cv=none;
        d=google.com; s=arc-20240605;
        b=VuASWmoC1jrzIicKB7mW9EZk3wnYjTN+/K9Qk44hkqoo2qgUIymWXbwk0gXz4wlOFY
         fmwTOYnw7Sl5yBVvTqdADBncg+3NUw6JeTJTvpOX0TSGOx91fJjrw8gg9GXMv6btgdoo
         LIYCagrbERmHlRsYRRM1cOVlpq9pHRhALNDO/RUYwuCeoR4iRNf5LCo3+ct51K550Pxu
         jaVhm+zVAUYNk9oYbZicX7+k4MSwZmXSzF6xMbYvgXsDousXzYmzkX/GJX8TxN9pAfEw
         vBF8Z0kj9ffrP3mxNCstZ2fUWhh08dSv+wf54ERYus1Y/AVrFba/3XOtYCM+GJAu3tuO
         hZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RxcFmI2IAGkmYdnYkNa89B1ljCXr8uo8gHzSY3WvK9U=;
        fh=zj1+s8JnkizEj7GNwxex6t/2/37Ik7H71F52KwpAFw8=;
        b=PU1Tq8bQIZKNnDzmTV254/dwwPRLRkuO05+7vm2+F+h25JdSAk7xlyDD2i2KT3gAAz
         fwxxuJbRlDvQg0zzECJ6TCtHdlyvyGduxqk1FnDBizsOooD7K1vLKN/Yeys844Ansj5x
         3Vrpw6+RdCzkV56TuowDqUOjsOiq3XRt+YYTCrvZkBBxsn/WJJLqnyNdzHrs81pV7mjT
         FriaVDHn8kJ/XZchvvSgAM8tXvrXinBrSWECY30ryWtNVkXUGGgHFZKiOlckjuKlQfb6
         ot3t45buifZ55MWxdmQ3dprw0tIe4ulXoxtoLv+jf6PKD5MXmsrW443KdkK1QOGeregl
         5SZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769052337; x=1769657137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxcFmI2IAGkmYdnYkNa89B1ljCXr8uo8gHzSY3WvK9U=;
        b=kB0wlMIwZft5yoNg9jtjL1qV9T3g5+odcXh8BHV6L57EOunzWzT0R7s6jr6GTMJali
         0JTXluj+Iae80GCFb+QThteShLYywGJpUOH2zlOLMhZtEWD3cP2KjKzU6Jl4+C87aMFK
         C+Ce3Nlua1Xpi83kjLQUwa32pwDB61/RdyKAswceMlhLqf6j9t2exJiHZITLUApzcgmM
         nLW6Li6KFEnONjAIMNF4MGGiwOyuiJpZFj8hrhfOfmz4iPtWmjzMDrmSeU3neiUIFi5V
         mlW220zxyihQifueyN8p752m/egF3QLsDG58+PuAIbvNBjAKZAqK0CQSI5OMNJjH4yt9
         Fcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769052337; x=1769657137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RxcFmI2IAGkmYdnYkNa89B1ljCXr8uo8gHzSY3WvK9U=;
        b=inCf7PPaFYYH4K14YDDA6+pJCnbVFutfNj9gUrO3Vb56xetx5PJfMq3FZfeGCQ6S5u
         3TtIyJR3YBbLw2sKhCRlauZVT/6OwGE0gJQdo7FooGtLavvlf2vthTXSs3OMtx2fT1Ck
         JPCOhCamFlFyDkRWSb5k//VeS7fnBCei5HCI/xsZehOlxi+BD6KOTS5Cze7Cbb6avnu8
         eGTuQ0ZAnWnS1+VklNMf0yyWJRmu67tj0CnohfQLIwaAbaG48Fi2JLgLgC5HE/GhUbWb
         rh5j7RvXucEDQFNij7F9veuK2DwzFWkBZbUPCtirlhW2MgTw4/O4jP/kwGTJ2cBfA2qD
         VPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX67JVTJoCF3HpCDnrStUiKc/vA8tGikKqygKhRRcBHpC0JkrDZymnHY+EFunKEfoCi5DBtGY6FsPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YywejzfsfnX4PTtWMsvA/7FjkO5I62OWJ6wd1EYXvEo5CQXE4BQ
	JY6sDLvglOOFHy8NvsBKGS8PtYw5Vhvj0K/tSEJMUvVRELq5h0yO8R2eiW1Mov8Nn+taPVx7LVk
	vK3ZWPvTa4U/+0h6XgfvxQFCOv2+n84c=
X-Gm-Gg: AZuq6aK3gaYxQ9NAxPZk7tAHyIyh0RCbCj/HY+NCXDucaXhC8SxilP0ZOGcOEDG+St5
	amOf1bCMVzIHM+5MOMivefbKkiunefUQue/TnY7roK7HcpY8cOUI2NZzhjSFjL2SwT6DyD0ZGbS
	xan1Y7mb4BGlu4bRReQkvoUEQRNnNO0Q7JVdIMtvxpwLrm4UGzD/+4Ig6Nzf4Hst8Y0plYfAwaz
	HZUT7oCAFgbI9PJoNZe5pJ+7LcGh2ZZ6eGZ4YFM6LmCZMm5nZaGoUueYZLnDnMsLaM0n3SAVJR1
	Q1mAwg==
X-Received: by 2002:a05:6830:3982:b0:7cf:db69:5475 with SMTP id
 46e09a7af769-7d140ab6895mr4490648a34.24.1769052337402; Wed, 21 Jan 2026
 19:25:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-4-686d0af71978@meta.com>
 <20260120163650.5a962648@kernel.org> <aXBnqYQdomzH9bT/@devvm11784.nha0.facebook.com>
 <20260121173512.748e2155@kernel.org> <aXGNhEKOhkTHbJvw@devvm11784.nha0.facebook.com>
 <20260121185021.446b00e8@kernel.org>
In-Reply-To: <20260121185021.446b00e8@kernel.org>
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 21 Jan 2026 19:25:27 -0800
X-Gm-Features: AZwV_QjAIr5HWq1OvyaswWVCAIdwEzJFXqJ7idBVevJ43OdVoqWduskcsKDBYHI
Message-ID: <CAKB00G2xNvfiV6J3RzKDs=GHMGZ7L16+VKUYLGjpZdOrLnSYKA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 6:50=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 21 Jan 2026 18:37:56 -0800 Bobby Eshleman wrote:
> > > > Show an example of the three steps: returning the tokens, unbinding=
, and closing the
> > > > sockets (TCP/NL)?
> > >
> > > TBH I read the doc before reading the code, which I guess may actuall=
y
> > > be better since we don't expect users to read the code first either..
> > >
> > > Now after reading the code I'm not sure the doc explains things
> > > properly. AFAIU there's no association of token <> socket within the
> > > same binding. User can close socket A and return the tokens via socke=
t
> > > B. As written the doc made me think that there will be a leak if sock=
et
> > > is closed without releasing tokens, or that there may be a race with
> > > data queued but not read. Neither is true, really?
> >
> > That is correct, neither is true. If the two sockets share a binding th=
e
> > kernel doesn't care which socket received the token or which one
> > returned it. No token <> socket association. There is no
> > queued-but-not-read race either. If any tokens are not returned, as lon=
g
> > as all of the binding references are eventually released and all socket=
s
> > that used the binding are closed, then all references will be accounted
> > for and everything cleaned up.
>
> Naming is hard, but I wonder whether the whole feature wouldn't be
> better referred to as something to do with global token accounting
> / management? AUTORELEASE makes sense but seems like focusing on one
> particular side effect.

Good point. The only real use case for autorelease=3Don is for backwards
compatibility... so I thought maybe DEVMEM_A_DMABUF_COMPAT_TOKEN
or DEVMEM_A_DMABUF_COMPAT_DONTNEED would be clearer?
