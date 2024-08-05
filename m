Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0D15ADA0
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722875651; cv=none; b=N+4eCNw4doLamnvKYJJ6awIvl0umpuCQxqNT3//NsJBytLedPV42tNaxA8eA2jLC6W5nGRzUKYgJxub128KspoRPd++53LrG0g6e4guXHVxMbvfJfrWJCeMgMDlcpVZwrcfpPJKKu8ef+WQW7QP6vtYoiSyg9IhEVd56vgr1Sh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722875651; c=relaxed/simple;
	bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiBLZz3edfXfrV1B9Wt12daM8g+IyuaGFDZ2joGTCbwSGp5UNBSnlhfeKkwWxiX3FUJ1WWIK28KDNCzW2x8a4QvvyYMQdXTyd4DplNISXWZZvIla/y/PKbIy3rLdoxbgs3HMXuMJf/i2HNRQr+J4FTy/Ifnm3MsMXiKnlA3COBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ooMfse3W; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ooMfse3W"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6b795574f9dso58452846d6.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2024 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722875649; x=1723480449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
        b=ooMfse3WVKfuxOLSSKdlcT9aqFqVw/RtyRXpOBsgOCTn9wKceQcM71mSUyFUCGbjdh
         26+ROdikowegVtjSUS4uWVUhtc95hLL23dlnWFj8cp65MVc4drKNIX9u43DWF2Bats8h
         t0heAI4eFDoxqmiGWoYtMgQD56gP+7qgIFOqzvLbDpke6iJR6YapJ+kA8HjUL+DyHiKy
         +7NkKP96kiTMdLcfY8EpRMfItKrh6siytmWkC/b0tGgiJkDeyeXjOqlFRgZJ9luyNyNG
         6FpewpnZhlzpQ9biBgMEY7x44yXFsfP3XIyl2lb1fAFA0jwMYwVdtCGFuyqF5RwPlBAL
         hg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722875649; x=1723480449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WShIfcyB1WIBp1LMFRNAOGPYq4so52JcsO4pudunr3k=;
        b=VnzTpbIkwGE5n79R4FpJOsj8WfMTa5nZu74AbjCBNU0adf/MJEAJX79jlOQJWVEqXS
         Xo3TrVIPl+WkdtikjUOXbu/mu/PQrNH2nusUxaLKG6Dw4VTvalplH8L6YhpZ3F9+ZP7o
         uzPYZXPScpSD7DFmfuR+ly7++m4hkkW/Th6naCWscfNurxSMD7tfZbNpzOdULnJtXsfM
         cILpVkm7++70cWZ6I9hIoMaRnsad2cbFrsuzUxMHfXfhU03T/YTVRY22nI3mcp8/8PYK
         +wz9KJ3NgMoDvMi40PBHxXmUCs22K6/ldDGEJXdACiZFQXcpT37uD72cb+Q6eUU2C0xw
         ttsw==
X-Forwarded-Encrypted: i=1; AJvYcCVP7cOPmIx/Qj5gSQ98ZGbW4DhcHs7816LH4MtFdDrtzPhn882pZ6AMXjV5eC32SYfLEXNr3sIaUGWhJum82DGoShgBWPJA6Rhy
X-Gm-Message-State: AOJu0YwcEpdCtdeJV9kBGavkb0zUdwzUOBVThb2JKJwo+RBESmve+pb0
	8y7BVSVKeW7ysTp+1TovZ9CmHBJpsSSY1usrBZ7ChLCLcgoAIZbpw+SrX7IBZWuoI6vSS2tFbxB
	ZKp26j6vAco1caTWYtU9wrLzWdLYnE/puSac+
X-Google-Smtp-Source: AGHT+IE3X2dzKDTfvW579W1ONWZvzHmSuPdaFYmL6fjjzD5I45yXHVQPoF1XfHnvXWK/VzgEqMK+gXEJqks0i1Xyhdk=
X-Received: by 2002:a05:6214:4412:b0:6b5:7e97:7151 with SMTP id
 6a1803df08f44-6bb98345fa9mr131458736d6.17.1722875648824; Mon, 05 Aug 2024
 09:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730022623.98909-4-almasrymina@google.com> <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
In-Reply-To: <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 5 Aug 2024 12:33:55 -0400
Message-ID: <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to netdevice
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
	Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Helge Deller <deller@gmx.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Jakub Kicinski <kuba@kernel.org>, 
	"James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jeroen de Borst <jeroendb@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Matt Turner <mattst88@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Paolo Abeni <pabeni@redhat.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Shailend Chand <shailend@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Taehee Yoo <ap420073@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Yunsheng Lin <linyunsheng@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 4:38=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/include/net/devmem.h
> > @@ -0,0 +1,115 @@
> =E2=80=A6
> > +#ifndef _NET_DEVMEM_H
> > +#define _NET_DEVMEM_H
> =E2=80=A6
>
> I suggest to omit leading underscores from such identifiers.
> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+=
define+a+reserved+identifier
>

I was gonna apply this change, but I ack'd existing files and I find
that all of them include leading underscores, including some very
recently added files like net/core/page_pool_priv.h.

I would prefer to stick to existing conventions if that's OK, unless
there is widespread agreement to the contrary.

--=20
Thanks,
Mina
