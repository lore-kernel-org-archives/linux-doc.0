Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793674742;
	b=AcBAdOXdH7vT3U3ZIqYGUWBKfHKgK4JJXK0vQ+nsc7BrmWIo6DMLnVpbh0ljMRel9HWz
	 L67myHKBXuIYgXzY1Q0r8VoKwBfGG6q4euEJs8BME2pXe2ZZdCdYxNHiCqL396yFs4THn
	 Tlb6wZ2tsOgMH7njKjZMUwV60S95015b+ovLiTvdvM4gVBJm1bw52fTK88j/vH5keNty2
	 goj2MtGE0W/noI76cjid5LBEr7s5SwE1TO+IEGKiEYW3HB09pkHXH+epgWij/MXlqzvo3
	 f8vICq1Cfazx3rdUCE9esfOyaairzkBg1mb42hto08WB7A87cHz+GS7fmn33uS250Bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
	b=kcwvfp6TQ2HNxpCMEmUEhbvi0UhkBcSuq2R0cpI3cHpnVWX58dPDWmFENst5SL5ItCnZ
	 MLUrmNtrtaL14SO+/Bo9U84mnyteXiyQVx2TeHeHKIwITKsW/vIi6HRLLO5MKsSTKpONu
	 suMdDCfTfhT7JqGPEvDXXlp+IscXKovqiSekIQZVoF2D1dJnewL3un0EU8pTFOIaVzLlU
	 H1qW+9ZYS77PePazD9Oxgv4fWyYh8R8FT2pbrkx+hEdy4t/EOn3blwKcb8NV7lMstZulI
	 NWbFYJZWGyyOK0INK6lmWQeAWSRDxD1H78zA4YGSBzK4nsZSKqc8vgT06XJe8sjv4aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWftFRzf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D43C606A329
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 02:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D43C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWftFRzf
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so5014a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 18:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793674740; cv=none;
        d=google.com; s=arc-20260327;
        b=eURKLvuXPU/5edble3QGggbV03FhIECp9zleyCiJU1fybS0ddLOAc+M+jUuMkMJ13x
         vZeqyFBGa4IoKjU4YWuvOyC6wqIaAIzrLPfytpppy0UV5zJ6GTBUjVTsTN3ptzRU+Y5U
         mS4x6YsD0vuaYzDhfKXsQ4fm1MZ+DTsFVVt9puFAECRnBxuLRIunZAFZLO4HDUYW4xHF
         Vh5BimNhsxhpXYNpXfaFurnu7BcFq94QIPvrZzuDZKbGH6XKFju8b2h5Bab9IMp8hGYX
         rkk2ha4XdKoMozhvSVV2xy//rwmpTCvVSqZ0TpEWB0O+Tg1/khzSvFNcboTeApToH86K
         6X2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        fh=NRg55tnO5c3L2ParYRfeJ8PrjLV7m5xBgwuojHcj5Fg=;
        b=N1GU6QMOJdbFA4mIP4dPNraKODW9imQ706Dve8ceYpfFx2PeRQga83XWEEMw5igbKk
         KkQyBl4I8cfwH8/gnsjDcTd8LK1Ho9Kn9s6HInZvQ8HsNHSpUTshKDgS0vrd56yxOCy3
         8CheI3m0l9iFEErdkFA3W8Mu5ECA7tidlMr8HcjETbbAwJ4aXHJfgUbk+0EZ2VyOYEX+
         Y4ezhgSx84zyS3CHyplCYgP8icf7zFkU7w0Ncn2pI3kMqFrxV2FxvPauHADBdi1S04Qw
         3x+vnUHudL7sQgzGwnBRbrlJ4llk7fMFyNGg98Y2miv3EgWjYuaHmTANI04P6GdDIGUx
         SMtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793674740; x=1794279540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        b=SWftFRzfsr6HRx4mZ7jlKL9NBy880MECjOX0cGycb8yBgGDCdwhmaMudA5uCPfnCsr
         12rC+qqqvmSvKFG7NqLjNYRVUZE34khfj2SjffiiS8W5B5WZr/ZYboQR6rm2ybo5agl6
         KXtEvNcgHqwKMkLMR95tW4NLAlMHOmoqEX0mXlVeJqVOqHwpQ7u/x7oYcJcbK6Whw0Yv
         SxHXuClHnSuLcYRwTHj9cfFqZT5eWfkatAmjmPJy9ZR93RGnD24qRv3ORgNWVvy0TSYi
         DHvVQHYtwo4qQKosyCBDfYGYqALpH+v6Yh7R/cORV1TV7J7hYBYNhA+WlDn9ASn3KBGH
         lUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674740; x=1794279540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeAgzZLdotti0IHP6YHs9fQ/pnjZZ1tIB55pQGz1Z2g=;
        b=zSZCr5ODD5BA0OFULKtlSFkNYWlilruc+ELt4sb0H30AZWryl1Rzm7bm0zvJuRP5SQ
         gJLVEvUoBKguzRHlU2WODOGSMa7KT1EPy9v0oKqu/N6+KkbY79GoEUKmxo44V1tacH7a
         4Gteugy/2AL7D1XJ6TLXIGaDNUhnE4eChUEzjPgpHDFnU1/z+rc4U0zQwEuZALykQtg3
         OLXmBYsQsgX8RLG4iOy39jmATIK9XKFkTgYJSWmlDvBNO2zNiNe9SGb2wPaxs3rJdL2R
         Uw+DQUGjh3LoaGBBJaollORvCXtJVJYR0QoqMBxin3K6g4jKmkHHO7tlezDEIXBRZN/P
         LYTA==
X-Forwarded-Encrypted: i=1; AKwUvByYtT8nQn24ma59djxmDibkvAb/F1hRIb38d5AmSU7YIZU0t5DgmX14ZvnRrtS1lbmiUM/qkwBqkBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g5V5neecNCDWpmNKzKaelfP6HfuVwvHHyRgb/jM9l57CD4Byt
	UWYXaCAUF9tRAUPO2NbOuu/Nmxf9XgQCffoJZ3Tqnox+VekA8gkbZEVxo0h1PGvV8EA5NDajyqm
	5wE0vrGFCrNa92LOkurhpooTFojoNdlnJEjuKImx3
X-Gm-Gg: AYBFou3bBqChioA37ZrqSPZHTSNJpevuTx+l/W+uoImqNaoV8rdcyDvQuSIvWSU6rTe
	EIZ+8vA6hui5YOlYwVDijyGbPLwOBV3PMzM6La1ewuTtXANIG98w6/GA86SstzTTWw78v3GeqiM
	/Dg0pagTGuhgtgs6DlL2Hs4kVMJ1Hv1OCNwzE94ZB5WDuXcXPmLB5SaTwxBCxrdj7qhTxNS4xB5
	j7/CAeeh2DmDo1Cac+oADXRSrtewlchgop+ETMAEVb3Km8ZRGqqJX3lEzn1lrP+A3/bvweDbvd5
	xD9gceNgsbEFmHzbBtgYbR7Kjob8KQKLkmWCGJrxOqoWoV35Y7yqKHqSGiJ/tingxXSPmHsnqWz
	wntf1R6Y2MOszpwelk4nk59U17DtY6LFfns6cHCU=
X-Received: by 2002:a05:6402:438d:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b53e778d41mr32077a12.14.1793674739712; Mon, 02 Nov 2026
 18:58:59 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-8-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-8-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 18:58:48 -0800
X-Gm-Features: AclHuK9Z5oWBbhWwMCS_z-DuUMSaT3p8QPAgg8n9KeMCHplfWy0Bv6rYsGa7af8
Message-ID: <CAHS8izMyGmLC0yg+WT7eAZ0tkSoJ5K80t-J8-WfYegvjDXonMA@mail.gmail.com>
Subject: Re: [PATCH net-next 7/7] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> TX net_iovs are now sized from the dmabuf layout, but the TX tests
> use a regular memfd, which usually keeps them small. Add -H to ncdevmem
> to back the udmabuf with 2MB hugepages and a TX test which sends a 3MB
> buffer from it, so that frags end at and continue past the 2MB net_iov
> boundary. The payload has a 7 byte period to catch offset errors.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
