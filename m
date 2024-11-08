Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33E5B1FB
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 16:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731083453; cv=none; b=gx5nC7likyu8hxz8rPp7wVrcRuPAOIy/8Zq7tyZMvoiJBvxV4udHEToE2BL64jI8aJVD7QMyqesU7lVwjP0tX19ds3wQkO9aHQt7fKquj1gsKXEbL337sSqrnfGL/LSJjo7GKyRfe/CELo2xL2qI4JGNSvhsfICWGbReImn+W9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731083453; c=relaxed/simple;
	bh=uWID+45xH0j3gSLyRb3WLQy5ZqamfWQLeD4vIDwrNXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3qazRayZv7dcm4XGrinvITbpm7yfpmalf+zJYfC+E7hUpBTWzhQwLgFYi2buFlac7t8hAuCqLhZPI5UX2rWuStU3MmgACgIHM+BG4S62eaPuVuo1+ATWnftmtiQvZab77zBMAaTyEA8CKzg50tZPXgQChJLWhSGYioAkaUxB9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IoF9xQX1; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IoF9xQX1"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-460b295b9eeso191761cf.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Nov 2024 08:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731083451; x=1731688251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apfan5NQTxJyT2HEbuhCbL5fWKPBXY9r2Roz8GqQn9Q=;
        b=IoF9xQX1wHR8otQUSEZxKK6O5MrlE9e+JgteeAk+3eg5MBTv5dfmajJNlVPSer7qF+
         fBUirI4om6TiQDmztpRZ734Yrb4TxivJAjt713kmIGZp9xDPm/8BPWej7zvfosHTc9nl
         C8oMP4rY/bwDMss6RR53yugkIbV+k4cgKY7Z9RIICVkavgyptAUeHtdMt4S21SDZfO9i
         2sqgfn0ePSos1KSoyFpyzCTuix3PbsdoT8FYutTvrPMOMdfgQQ3/qRzO1ez7PIPbo88l
         ev4iFXxL8oOW0W7wtiY0aummuuBs8vNmuo+g2YRdBd370I9JpPen0OemWsazEfp4T0oZ
         u5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731083451; x=1731688251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apfan5NQTxJyT2HEbuhCbL5fWKPBXY9r2Roz8GqQn9Q=;
        b=mkJbM+7e4af8oFzq+bKJWIMmbuiVMl4pu5tfEaKp5DxVuZz+5nyiz2/8yjka0jrAxk
         7GNkRvEIryBjX9EjQ81PYDUaWHfIKP2SJD5UFIdFscL6C+e0prtHE81/kGFgZJWSJmdp
         10nVQcUKtZYnOm20y6yNZ8CrorGqyxsF/q2CSARsQaMGsAoCmIHoebzCRJADMC5r8y/h
         ZyvrPdBUFCXqgis9fQd1RzErobfNUxfUFI1P2aJTzHwIFhcYfZv5rt4XIbz+NzYpKRP1
         6t5cDfD6IWKSPDltLOjOqX4NI3RclR2Mc0YOpNk3skU2V/RKu+Y/atKd0vY8wb4BGssy
         ON6w==
X-Forwarded-Encrypted: i=1; AJvYcCXg9nGvvmJuMsXCHdaDK4T1H7V7I4gDbJmR6GxBHewKUUVCHQzh06fGS3RNf41tvkq5w3agL6Jb6LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGt9kotYCtDU0Pz2k16HOb1oUM9BYeA+r3DhkiNixa16TjbeVe
	CrguOVJaGrbXnuYXFYq0wjQLzIbU3EyeoQ8AUQPIka55ljNEOY+3izd2PfeyglPuGyppdLIo6sM
	4Mgu/Yw9Icp4PyzHQRTGqs1fZEzEng/m8/3XD
X-Gm-Gg: ASbGnctVMPRoIpI6sYVzuLKirQ1QeeGQxoMk4aFWc2uQ/ggPdbre6z/UMxzwZmwktA8
	ZfUtdNYT9Bdf+r9j2f86Kjj9XeZXWqSU=
X-Google-Smtp-Source: AGHT+IHQe3obsowMXi5ubFteLQTT0V2g4gNYn47erjDWIwR0iVkHYGeKW044SVgLD/kZ3JMsWc1ePeD3hoKtZbE4YBU=
X-Received: by 2002:ac8:7e87:0:b0:460:491e:d2a2 with SMTP id
 d75a77b69052e-462fa5a9599mr8635201cf.17.1731083450710; Fri, 08 Nov 2024
 08:30:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107210331.3044434-1-almasrymina@google.com>
 <20241107210331.3044434-2-almasrymina@google.com> <Zy1priZk_LjbJwVV@mini-arch>
 <CAHS8izOJSd2-hkOBkL0Cy40xt-=1k8YdvkKS98rp2yeys_eGzg@mail.gmail.com> <Zy1_IG9v1KK8u2X4@mini-arch>
In-Reply-To: <Zy1_IG9v1KK8u2X4@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Nov 2024 08:30:38 -0800
Message-ID: <CAHS8izP8UoGZXoFCEshYrL=o2+T6o4g-PDdgDG=Cfc0X=EXyVQ@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: clarify SO_DEVMEM_DONTNEED behavior in documentation
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Willem de Bruijn <willemb@google.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Yi Lai <yi1.lai@linux.intel.com>, 
	Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 7:01=E2=80=AFPM Stanislav Fomichev <stfomichev@gmail=
.com> wrote:
>
> On 11/07, Mina Almasry wrote:
> > On Thu, Nov 7, 2024 at 5:30=E2=80=AFPM Stanislav Fomichev <stfomichev@g=
mail.com> wrote:
> > >
> > > On 11/07, Mina Almasry wrote:
> > > > Document new behavior when the number of frags passed is too big.
> > > >
> > > > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > > > ---
> > > >  Documentation/networking/devmem.rst | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/Documentation/networking/devmem.rst b/Documentation/ne=
tworking/devmem.rst
> > > > index a55bf21f671c..d95363645331 100644
> > > > --- a/Documentation/networking/devmem.rst
> > > > +++ b/Documentation/networking/devmem.rst
> > > > @@ -225,6 +225,15 @@ The user must ensure the tokens are returned t=
o the kernel in a timely manner.
> > > >  Failure to do so will exhaust the limited dmabuf that is bound to =
the RX queue
> > > >  and will lead to packet drops.
> > > >
> > > > +The user must pass no more than 128 tokens, with no more than 1024=
 total frags
> > > > +among the token->token_count across all the tokens. If the user pr=
ovides more
> > > > +than 1024 frags, the kernel will free up to 1024 frags and return =
early.
> > > > +
> > > > +The kernel returns the number of actual frags freed. The number of=
 frags freed
> > > > +can be less than the tokens provided by the user in case of:
> > > > +
> > >
> > > [..]
> > >
> > > > +(a) an internal kernel leak bug.
> > >
> > > If you're gonna respin, might be worth mentioning that the dmesg
> > > will contain a warning in case of a leak?
> >
> > We will not actually warn in the likely cases of leak.
> >
> > We warn when we find an entry in the xarray that is not a net_iov, or
> > if napi_pp_put_page fails on that net_iov. Both are very unlikely to
> > happen honestly.
> >
> > The likely 'leaks' are when we don't find the frag_id in the xarray.
> > We do not warn on that because the user can intentionally trigger the
> > warning with invalid input. If the user is actually giving valid input
> > and the warn still happens, likely a kernel bug like I mentioned in
> > another thread, but we still don't warn.
>
> In this case, maybe don't mention the leaks at all? If it's not
> actionable, not sure how it helps?

It's good to explain what the return code of the setsockopt means, and
when it would be less than the number of passed in tokens.

Also it's not really 'not actionable'. I expect serious users of
devmem tcp to log such leaks in metrics and try to root cause the
userspace or kernel bug causing them if they happen.

--=20
Thanks,
Mina
