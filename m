Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6023A3A1A3F
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 02:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425463; cv=pass; b=qASfktWdywB88+TSjsLUCp6WypswiQy+1Bb+SIUhrxtmm7NPTn+Zu2o7ZBGe5PW4Uwq1dDtNI7lYyI0UvBdMywuLm0uQyjs91MnIDyDtQu/YLYLnT+tSQGV2p8arklqXad/5hBcQZ8+aQhBmPk1DVdr/C8CMYjPk6uIGxgpCRfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425463; c=relaxed/simple;
	bh=tRcdTjRQ5UTW4DHDrkJ/ooF5c3DO+DoLfJDkOdlVFZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcvRjdqoRblzzZehdb9mkZ0ZTtn/ut+/QUPUDdurnOIohI2nCErwpF3LFKa99YcOMj+C2UDbtgISrNSQtQ0GePK1A/cS+49ykH5JjgRIbRQyIybf9umWmHCxmQkzPyERGlbTOeRuU8NHc8oeDcBEH9+lrMK+AOLOdXEsToI798M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5EMnMyN; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5EMnMyN"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ab0140ecb2so6243a12.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 19:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791425460; cv=none;
        d=google.com; s=arc-20260327;
        b=quF4TaadYG8hit39gFDoeHBjyN5Ft/XfVnNUmoZ9IUg6NfBPOwCLynprU9Wpu3wC5i
         Q0uXr3d8OFNwFKXVWB0OqZs4/pz5RF1aZBnAPaHzxX/7KoSYdKBhm3ngj/DYRiXkUyqZ
         KfvR5hszIQnxsOs/pwS/I/sHSk8Agui/f1E2BfHV51qoK7SwFFwlVwL2QJRBOPabzIt+
         QROuwMp8DX+PaoSEUno1URTA1FTvCP0rNsVaZVIIkLweHpeKXaAmVXbc2K7LmhEO+z39
         4dQD4qAwNQfQ30aQMiKom2VgJV8e6Bq3dKvhTWYhRD0WZl1SSae0fJ4BlQC3PBNeqlLu
         Db6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mlmGRFd0U28wTy12oRP1z3Eel/hj8TBM+KWP2O4byi8=;
        fh=m2wSAN71OibUdudMET1N3I5YulZAMmtWxcIFy1HcQGg=;
        b=VNFEgBjaQ0RC3SIoSXptDASdJqRBNCHg8cyW6a4/bCzQyKaBoMjgOkSE+HfWG0eLm0
         8Hf6J/Dyn9nb8oj4I1FVP5wZme0UaOzBAH0D/cRT69psgIDfuCpY7r1f3RjKc+Kfnw2J
         hpLB5Ke0dskFE2suCZyPS8lbcjrEpSZpDZOrneLBrTxzb8LOD5uAoA4Uge1KJDMEwG/X
         KLnvTH3WZ0ThzxDFnxwTxS7/yV3Zg6LgwK2QeAhKIvDRawGVAUX1/zcJX5L6OfYFej/l
         YdBC9HwUB/+tFrxaj9As9rOTXv/AXxINtAT50lSrCS5CwCsVdhh+lFCD9um8KgHzl+KB
         yAJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791425460; x=1792030260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlmGRFd0U28wTy12oRP1z3Eel/hj8TBM+KWP2O4byi8=;
        b=I5EMnMyNwBCKYJCIs/h/xX5KJX7bNOo+0PYb/stAlNBfJvn0JC3k7SszWWtFHhFvYd
         SM7dt9heTzBwPrZ1vDo3sHVqhR80CEMXtwz47ChBpq26B2UigRNdecmZzLDeZyv/ZtsE
         hc39fNd5I31Ovznoj7Tg9K36yVoKOFP33RXXE1Bv66dprnTHKRMgKwNltJTgSCNOW97f
         cXYiWHV9xkjWyChFDxTCeDUWBEWOx/z7E4xDKwQWbSSkNXr8OBuWhrcnjug7eNy+u3bc
         +tAoxIu71q81QrEQabZtLrMcrStAES/XYJu73LVcuAcAfLKkk1c8fO/XR8NVNgrDhGBP
         NcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791425460; x=1792030260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlmGRFd0U28wTy12oRP1z3Eel/hj8TBM+KWP2O4byi8=;
        b=wbatSN+KXKXD6KlZ6HI6VMHlNQHmGZf11yU9aUXOJP3v9V4UaZo6K2E5UAWC299FaE
         JjwH9E8FAFKTBnwRJqLE5qAuTdax7IX1ozPXzy+wS7oFAPzWuVOgeuesM8kfKTbrvdZY
         kFaffHgCNYx+YSiJK4KE8+SDR9yY50G27RMK0xqeZCqTc9upUa2mPlaSKMfdROE4Xsr0
         sEORzVXxhiKTffxcDaVV0jZm3hI8ef1U/Ao4hW0ZvRXChSsnpOMQA+zYWYv4ZIPvuLvO
         upmu/kvldeMVx38cNzJxkP/LCWL5PAELtxgJZecJUONJBB5f8KGlPZsD1IZicXcCuvF4
         HPhg==
X-Forwarded-Encrypted: i=1; AKwUvBwDVMVch9NaCqRil5lWBgyTNTAvO4d0KQPm+DcVjLwiRfk60V4S6OaKrLq173qeoKSn2FBI4TJerA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2ykOh/Tl+LgFLSe8uUegU65N84m+DtATd4g+mbxxtGhDf6/dz
	kJTrfIV4jH26VF0NMGerJZBMC+p0Srvezcol51J/JFqH4pgRb52nILGqGb7Cw5eziGeaQXBsjmJ
	PMewH4YHR9DJHGwiTYgN3Coy25FhuT4VA98841VZA
X-Gm-Gg: AYBFou1/QUeQugu0VqTh6Q94hzbGCpgzyrCrfx3qfBlCk4V8Jy7ljSJ9CFGU6lcKULo
	HcYLoHSC7O66L+F7RlkIcLXM4kekEzaPbFfIikseoAgPQgQXnCkZhlCbaJj3/EvOFa9TVTJwsCa
	5/q1iRyPpJEjurrHe81p+n6YoHL51Oe3e79H7dsX9CBnZlnyGNCUVo0ytaiiMtCkYzfnH4Uj4io
	4SJ171O3iT1FE18BQvV8PlC3TkybJeR7i/BIIlaABQzG+F0hn/0+bTk8TLxBU/RBpI5Vgxm2qcw
	tGMQKqXf6UouoCFKsJwCPCRUrcyTLuK6srsC22q0egeN0L8/I/DbHw==
X-Received: by 2002:a05:6402:46c3:b0:6af:97a9:224a with SMTP id
 4fb4d7f45d1cf-6b01174ca66mr37674a12.2.1791425460145; Wed, 07 Oct 2026
 19:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005004958.3603059-1-almasrymina@google.com>
 <20261005004958.3603059-2-almasrymina@google.com> <4818da7c-be7e-4f97-b5a3-bee05ada500a@kernel.org>
In-Reply-To: <4818da7c-be7e-4f97-b5a3-bee05ada500a@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 7 Oct 2026 19:10:48 -0700
X-Gm-Features: AclHuK98bUqu0UNfrer7PsXheWlbUfZxQHPGdS03OVcyzs99X4ytv2QdoZrorac
Message-ID: <CAHS8izOmh+cjHsF9X39=Gxsw-wMHNrkxBD9OTPApVw=P43Cfbg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/2] net: netmem: document netmem and memory
 provider design in comments
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Luigi Rizzo <lrizzo@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 12:43=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel=
.org> wrote:
>
>
>
> On 10/5/26 02:49, Mina Almasry wrote:
> > Clarify the netmem, memory provider, page_pool, and skb fragment design
> > principles in header and code comments:
> >
> > - Memory providers allocate struct net_iov or struct page, cast them to
> >    netmem_ref, and pass them to page_pool; page_pool, drivers, and the
> >    core stack operate on netmem_ref and must not downcast to page or
> >    net_iov outside dedicated netmem helpers.
> > - Memory providers are not restricted to net_iov and may supply
> >    page-backed netmems.
> > - net_iov is not inherently unreadable; future readable net_iov types
> >    are allowed.
> > - Per-provider logic belongs in memory_provider_ops, and per-netmem-typ=
e
> >    logic belongs in netmem helpers.
> > - All frags in an skb must share the same backing netmem memory type,
> >    and skbs with different frag memory types must not be coalesced.
> >
> > Cc: Luigi Rizzo <lrizzo@google.com>
> > Cc: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> > Cc: Stanislav Fomichev <sdf@fomichev.me>
> > Cc: Pavel Begunkov <asml.silence@gmail.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >   include/linux/skbuff.h                  |  4 ++++
> >   include/net/netmem.h                    | 29 ++++++++++++++++--------=
-
>
> ./scripts/get_maintainer.pl --file include/net/netmem.h
>
> Returns "maintainer:NETWORKING [GENERAL]"
>
> >   include/net/page_pool/helpers.h         | 18 ++++++++++-----
> >   include/net/page_pool/memory_provider.h |  8 +++++++
> >   include/net/page_pool/types.h           |  6 ++---
> >   net/core/skbuff.c                       |  3 +++
> >   6 files changed, 50 insertions(+), 18 deletions(-)
>
> Changes LGTM.
>
> I suggest that you Mina is added the MAINTAINERS for PAGE POOL.

I'm thrilled to be considered and more than happy to help.

> And do we want a new section for NETMEM ?
>

I'm fine either way.

--=20
Thanks,
Mina
