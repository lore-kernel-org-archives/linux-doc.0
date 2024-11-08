Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0419259B
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731091523; cv=none; b=VtGijth0AyYsJuG0AtaT/YE1ri5Qum3pEj9meQyOUo3e+4NkM0W67abeUXrKXmXdCuUBys9ppsOBnEXqtGslDiv6epuLEUKxINgB+6r2sYLunwAmyfsvDSI7mQ68XeKn1pKDgE1AzZ7BxcNhEZUzXSvHpUjA8rUSLRNBgBsVwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731091523; c=relaxed/simple;
	bh=lcqVxarSnIw0Wfqck48GyQe2gVWyEkUqvNLjJFQRkik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcn2aChaMhGTqFMFD+3kGWxLkcQDJwu8LjPVOlqWfGbJYqQmlL6tSP8+CBs4mpm6Uo+7R7Wiv6DRDwSekgZMwHIF2mBDxnD0CokJQRJfKcHhNojzpI1zxjSyQarzaWKltjRAwejN4oWwgIDsFMIA7912gB2WgibranZ9TNR9Coo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zmGUJLZ+; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zmGUJLZ+"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-460b295b9eeso16671cf.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Nov 2024 10:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731091520; x=1731696320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQWXX3Y2NemA0Bkmo9oa5lzAWU2FAVxuxVlJNZmkK0g=;
        b=zmGUJLZ+pcVZAPYmE5NQNZ1QyU+AVEmoHit7jYqG/Te+gUl8cPqXR+OqeVAJjyXem2
         QS3vOswWcTAxLs2Ql/uZUJtNip1uB3dJLYOgT75dQJqgRAQutB2/8NQCctZQK8+ejFvM
         WVXE/LD0fN2dbzV4LbY4ra8VsD8WXBjG0BEhlxTHfiCD5o/ZXeOlm0fGMDSCSlqxh5rH
         h6/0Wu2e0n5q5M+it4GZUfqrh6nbsrGQG+Eje4VBy1Mj+pGK8ZkTi39aUBy236+DJTna
         47T1FQ7OBTSKZ3yLslb8K1CPY4YrchjGXwWZszR6633+G0UNDoKRBhZVqOcV2c31sJC5
         q80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731091520; x=1731696320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQWXX3Y2NemA0Bkmo9oa5lzAWU2FAVxuxVlJNZmkK0g=;
        b=OJjEulAM0AXv2WibWdODaAPlcHZdG+RJl9hfv2JL5uhaxKDQXU7oapmxmmaLDHJDW7
         hhe4AQWRuoHmwUr5SWR9mSROhtUvNKD0olhTi1FDavVrUs+LvVu1pUJv6os1c8Q/Z5M+
         2G6I52lTeWzIa8YZdOkLVBNuPP0ZvMKkcZtCJJvHLCF2Ci1aMctr4ctWSszq+Fvn2txB
         7PvpKt39N8v0mvz2d1AEgrfABwoFj+EUcfGu+lGJYASDQOYRCtU2l6+8SxVxUAIsFYC9
         pia6EhtjkM1mtB4nTCrM6d7HDGU+dMwkeaOBjR6HeA9NgyEQitoNYkZjJyxeKegoU5DN
         xOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHqWkM+YJlKoA5dj1eH8+OSuqe76yAcMgvUsCmjAxk/JjXylYysjnLiKq0Yf+net1SMnSBgFbE7rA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/g6ylkVtM5KcbBh/4+XIWq1reRFO/ozvJelNAyAQf6QbeW1Tj
	G7FwZyXCouzwvKXR6u93jQWUiQJ11Ly0pr4wTzVVs6nHWtQCp0Hzq+xxo4ft8sMBRX1q9XjJ4Xk
	lYS+gI40wqzbAVfdrzFbGM5rlYzj88qvQ3jBy
X-Gm-Gg: ASbGncsNiWin5N5EIUTHMgG6KpGxSsLyNU7a+ovxGmvmTWlWTdu851r+Fzy+vYUBRgd
	nHZHrnQcuN/jylJIptvRRHf8i+YnlYzs=
X-Google-Smtp-Source: AGHT+IGvwPp9TjQSnwda6uC40OLtKbAEUpz4aO9CgT19b5ZFDtcU/z04H3hO5fbFjqfA/TFF1ZaKphANpOjVSAC2lfA=
X-Received: by 2002:a05:622a:548a:b0:462:c4fe:ec19 with SMTP id
 d75a77b69052e-462fa619d7dmr8710451cf.21.1731091520108; Fri, 08 Nov 2024
 10:45:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107210331.3044434-1-almasrymina@google.com>
 <20241107210331.3044434-2-almasrymina@google.com> <Zy1priZk_LjbJwVV@mini-arch>
 <CAHS8izOJSd2-hkOBkL0Cy40xt-=1k8YdvkKS98rp2yeys_eGzg@mail.gmail.com>
 <Zy1_IG9v1KK8u2X4@mini-arch> <CAHS8izP8UoGZXoFCEshYrL=o2+T6o4g-PDdgDG=Cfc0X=EXyVQ@mail.gmail.com>
 <Zy5Ta-M868VvBme2@mini-arch>
In-Reply-To: <Zy5Ta-M868VvBme2@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Nov 2024 10:45:07 -0800
Message-ID: <CAHS8izNK6xJHDB+W80iCr2CEwbo=OecG-1UW5dB9X_0aowo8Bw@mail.gmail.com>
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

On Fri, Nov 8, 2024 at 10:07=E2=80=AFAM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 11/08, Mina Almasry wrote:
> > On Thu, Nov 7, 2024 at 7:01=E2=80=AFPM Stanislav Fomichev <stfomichev@g=
mail.com> wrote:
> > >
> > > On 11/07, Mina Almasry wrote:
> > > > On Thu, Nov 7, 2024 at 5:30=E2=80=AFPM Stanislav Fomichev <stfomich=
ev@gmail.com> wrote:
> > > > >
> > > > > On 11/07, Mina Almasry wrote:
> > > > > > Document new behavior when the number of frags passed is too bi=
g.
> > > > > >
> > > > > > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > > > > > ---
> > > > > >  Documentation/networking/devmem.rst | 9 +++++++++
> > > > > >  1 file changed, 9 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/networking/devmem.rst b/Documentatio=
n/networking/devmem.rst
> > > > > > index a55bf21f671c..d95363645331 100644
> > > > > > --- a/Documentation/networking/devmem.rst
> > > > > > +++ b/Documentation/networking/devmem.rst
> > > > > > @@ -225,6 +225,15 @@ The user must ensure the tokens are return=
ed to the kernel in a timely manner.
> > > > > >  Failure to do so will exhaust the limited dmabuf that is bound=
 to the RX queue
> > > > > >  and will lead to packet drops.
> > > > > >
> > > > > > +The user must pass no more than 128 tokens, with no more than =
1024 total frags
> > > > > > +among the token->token_count across all the tokens. If the use=
r provides more
> > > > > > +than 1024 frags, the kernel will free up to 1024 frags and ret=
urn early.
> > > > > > +
> > > > > > +The kernel returns the number of actual frags freed. The numbe=
r of frags freed
> > > > > > +can be less than the tokens provided by the user in case of:
> > > > > > +
> > > > >
> > > > > [..]
> > > > >
> > > > > > +(a) an internal kernel leak bug.
> > > > >
> > > > > If you're gonna respin, might be worth mentioning that the dmesg
> > > > > will contain a warning in case of a leak?
> > > >
> > > > We will not actually warn in the likely cases of leak.
> > > >
> > > > We warn when we find an entry in the xarray that is not a net_iov, =
or
> > > > if napi_pp_put_page fails on that net_iov. Both are very unlikely t=
o
> > > > happen honestly.
> > > >
> > > > The likely 'leaks' are when we don't find the frag_id in the xarray=
.
> > > > We do not warn on that because the user can intentionally trigger t=
he
> > > > warning with invalid input. If the user is actually giving valid in=
put
> > > > and the warn still happens, likely a kernel bug like I mentioned in
> > > > another thread, but we still don't warn.
> > >
> > > In this case, maybe don't mention the leaks at all? If it's not
> > > actionable, not sure how it helps?
> >
> > It's good to explain what the return code of the setsockopt means, and
> > when it would be less than the number of passed in tokens.
> >
> > Also it's not really 'not actionable'. I expect serious users of
> > devmem tcp to log such leaks in metrics and try to root cause the
> > userspace or kernel bug causing them if they happen.
>
> Right now it reads like both (a) and (b) have a similar probability. Mayb=
e
> even (a) is more probable because you mention it first? In theory, any sy=
scall
> can have a bug in it where it returns something bogus, so maybe at least
> downplay the 'leak' part a bit? "In the extremely rare cases, kernel
> might free less frags than requested .... "
>
> Imagine a situation where the user inadvertently tries to free the same t=
oken
> twice or something and gets the unexpected return value. Why? Might be
> the kernel leak, right?
>
> From the POW of the kernel, the most probable cases where we return
> less tokens are:
> 1. user gave us more than 1024
> 2. user gave us incorrect tokens
> ...
> 99. kernel is full of bugs and we lost the frag

The current wording doesn't make any comment about probability. More
information is better than less. I don't see a strong reason to omit
information. I think the docs are better now and will be improved
further in the future. Lets not bike shed too much on docs wording.
It's painfully obvious invalid input is more likely not subtle kernel
bugs IMO without calling out.

--=20
Thanks,
Mina
