Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40FE16C689
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720711702; cv=none; b=rNt0OVKdBLXxNZ7YnngS1JDGWAs3RzabSD8p8uSPszmRHWTgQ5VI4GtbYVm6Yf4tfd1lGARkI0k5tLQZ70iW8jZkuqiR0qpwjSpdbXEqo2jVhm85VBvc6jINLt5Uedi2K4GrVBsztp6xhoL1ot/8SOSya/fb81XsNuiJIYDjLHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720711702; c=relaxed/simple;
	bh=SilAbBLlHxF1fFiXA5nZv8t2dj5EmTE+T6I22rXMb5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3dAekSBBVELvJequkc8bStM9YiaKNqrMENsXK0KInojx94NA6w507hgncvgI/QW4qyZmErGxuktZhySaood+DE6OB/CkyMnz3sxV1IdoUq0RjPJ28WY9yXvzzOGqZUlDP7K6iGOwMFN1XqJ//xwkwaXE1d/WhHeRvEn3NJDRvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tvbdEsk4; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tvbdEsk4"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6b553b1a159so6281206d6.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 08:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720711699; x=1721316499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQkM2Ryk0ZQZFnLcaLIzbhoe7KSMFKbN9WHRd1zSTLE=;
        b=tvbdEsk4sodNSvw9dH8d0RTBCUCIMpLRnkDWzwu+htuFGz9CKFgr7WVU3tljAoy3nm
         hq++uQy+j+zsmqSFprVU8kf2JMITO/neuc77g+lZ3I11/gED/4qmLT5sywvJtSN1P2s/
         Rw0IPojdYEmIuRqp2FDXdstx+z4YbcILMMm4jeXPKt2fdJSHOO/4qy55yPCcQ4qfHb5n
         OgfJPbuVjsIc2HSwdt/TVN7xX0RCdKr9VHnb2j4BZdpkA4MqKHZCNrF4ryhprX2kM1YH
         nbBCiHiZyEnGJuvFSFv6/cC6OfZU0QYi/JDkO1yidn53SMazkEtK1qJwK6CdGXv22vGM
         r3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720711699; x=1721316499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQkM2Ryk0ZQZFnLcaLIzbhoe7KSMFKbN9WHRd1zSTLE=;
        b=ke3T7bYplG5GDg4UKfsP03cBs5j2MOWcJVfklGVggfzctNdLf4+5aVE16tCbwjQfqY
         Dos9zUh+frbZ7YN4yn8xVFrZr/UW0bI+tAMW2CXlpVncZ+vciUBLWHbZB9jNvN5z977p
         LckUak0En5W84BbZgdm0CMnGXLKHYqHXdLSfcRUmEb/Hy8m4a22kn/F+ZonyYsK2o/V1
         IA+c8Uf6skY101pNe4rTK4q2tr3mrFupRPpuRrUybIVHtTPn8dkHgEfatqQ6POlXKkhp
         4WSimNUenDO5jRJ/ghILFs79RkFrpDgzdg3wvNo3JC4jyURNo5O8RBOawEpCTB3hYMz0
         mpWA==
X-Forwarded-Encrypted: i=1; AJvYcCWw0m/VZ/ojDKUSQQ6qfLQd9PcKXN1piRMT+uV2FQ0POVoRVwdUpynBUJ4/4i6ysTxZ1DIPyTthOYEUwMLESexzNla057K/agew
X-Gm-Message-State: AOJu0YwHSbPslPyhA1adbtJ0SRldOmRwf+dfrrLfMSfFOwqNmDREYQsc
	eVleVa1uGLErV4zmT2xsrhpj5r3392wazsD9LydM2BA9x+LgWHAZjGRuKciZuf5WNg1+tgFov1Y
	OVpRB5owvIYF87yTMCiepyHjrkTXCMeGLRI33
X-Google-Smtp-Source: AGHT+IE8HI6rD0D7bFmLR1Mn8tZE0XSsSvK7NyBw9sFmyI90jMNxfVlBfEcxHI84DHJue4HhA0QN9oG7JH/Vd9MHPxg=
X-Received: by 2002:a05:6214:cad:b0:6b0:76f1:8639 with SMTP id
 6a1803df08f44-6b61c1b6d8fmr100368136d6.42.1720711698460; Thu, 11 Jul 2024
 08:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-13-almasrymina@google.com> <4b0479b0-1e0f-43db-8333-26b7a1fd791c@nvidia.com>
In-Reply-To: <4b0479b0-1e0f-43db-8333-26b7a1fd791c@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 11 Jul 2024 08:28:03 -0700
Message-ID: <CAHS8izOc4gZUP-aS747OVf3uyn8KAyfeBcYDx2CQc-L9RnvrXA@mail.gmail.com>
Subject: Re: [PATCH net-next v16 12/13] selftests: add ncdevmem, netcat for
 devmem TCP
To: John Hubbard <jhubbard@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 5:44=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> On 7/9/24 5:17 PM, Mina Almasry wrote:
> ...
> > diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selft=
ests/net/Makefile
> > index bc3925200637c..39420a6e86b7f 100644
> > --- a/tools/testing/selftests/net/Makefile
> > +++ b/tools/testing/selftests/net/Makefile
> > @@ -95,6 +95,11 @@ TEST_PROGS +=3D fq_band_pktlimit.sh
> >   TEST_PROGS +=3D vlan_hw_filter.sh
> >   TEST_PROGS +=3D bpf_offload.py
> >
> > +# YNL files, must be before "include ..lib.mk"
> > +EXTRA_CLEAN +=3D $(OUTPUT)/libynl.a
> > +YNL_GEN_FILES :=3D ncdevmem
> > +TEST_GEN_FILES +=3D $(YNL_GEN_FILES)
> > +
> >   TEST_FILES :=3D settings
> >   TEST_FILES +=3D in_netns.sh lib.sh net_helper.sh setup_loopback.sh se=
tup_veth.sh
> >
> > @@ -104,6 +109,10 @@ TEST_INCLUDES :=3D forwarding/lib.sh
> >
> >   include ../lib.mk
> >
> > +# YNL build
> > +YNL_GENS :=3D netdev
> > +include ynl.mk
>
> This seems to be missing a rule to generate ynl.mk, right?
>

Hi John,

tools/testing/selftests/net/ynl.mk was merged as part of this patch a
few days ago:

https://patchwork.kernel.org/project/netdevbpf/patch/20240628003253.1694510=
-14-almasrymina@google.com/

Is it not working for you by any chance?

--=20
Thanks,
Mina
