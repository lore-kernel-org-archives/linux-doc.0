Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6B15DBA3
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 02:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143480; cv=none; b=Twyuy9MtUIwb2RIoPG5alv18U/p61V/mL0OBMVGUMg3mu5UhhUulNi1PPP5p4q2o7E4m92eBiTZKktj9strXxPzhq7JcW6+Yt5WXSkCRGAZL9KKZsZPdLNH0CzrMxfILseVAL/L9IR1q4VSdvsrBq+bGIZ+GGlBR45GyfFtmwHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143480; c=relaxed/simple;
	bh=hnrlAa4MKKlg5paVJ8EDznGA/qVVPNZMRmkgKxJ9Z0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYvgdCzCeEe5Ccczu8cUngu1vme2P1/XqLDINK1Z7w5Uj+1K1sG6qzVkRdczAQMewZx7b6saqNY7GV2WAr51+e68YNOPZch2PVw8u9QMp4jMKtN48LX0s/T1bupNtwGV3jfYPLXOGPEmSlwvcTLW+eXKunJj0QPK9LpIMf4KavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaBWkLZ5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaBWkLZ5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abbd96bef64so988055466b.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 18:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741143476; x=1741748276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnrlAa4MKKlg5paVJ8EDznGA/qVVPNZMRmkgKxJ9Z0M=;
        b=NaBWkLZ52oFxB3hJeE/lENiMMfJEhU7T1bR4Ot2jtLWYVi22h+4OVI1icLnePSEw4s
         POSbJWHK0n7O6PY3HHvwLJdVj7fSsrqN4v5exdcjSygMiVDov27y4I7zoXNn7+QYT9JH
         XLeQPLzmgy33u+IRNI1Jx5DcrZ92G4VY2gzMDxlAeczZ5ObtP1dFxhhKUp7LA9ULx+Xn
         KOWq/IQF11s+h5OTjc0VtgHyPHOolci0x0LdcAogzqqWu7MtBSLamU8PcN7JCmD9O3wY
         ut7cSDSzecHjqa2ylJqmcnrs9UzOtLv1scdW4MT4wsc7D6f9RDNDPnP/ROElBo8O9AJ5
         AjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143476; x=1741748276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnrlAa4MKKlg5paVJ8EDznGA/qVVPNZMRmkgKxJ9Z0M=;
        b=W8zSOeovHB/SGLxNyixLOboRkjDeBdUKyILGmbVzdBAwfVH9gP0RTufXL3ZUy65JV6
         YWMkpQB2o05geP9L1YrXq8ZgA403ZchayyD2NcXIwh9HGabJSDtGLO5ilRzNUdO2MUhf
         SIaV6MvEdIIsOg8Qb2x37FDB83utZOewvU0FZePKmYqc+tnc72GGUoISeSxh6GzGzYZ7
         b2CG+a0GzbdA70FqpZ1d9escrd+8FzqiprIIjyKpKjVG+4FZmg4bK5kmARlr/bl49gFX
         CSLV3PBVbDJGXlGPDrEDytWjZl7iesUK1bXHrrcfEvDAMn/RSFteAoKrLT1S1aTYYPIn
         6PyA==
X-Forwarded-Encrypted: i=1; AJvYcCVzpe7hULrZTvTxMgfTQb0chuZ3US9X/zrrc218yfZpYMQLQb4u+oZ84VjcjKKpYW55PI7v/Mo4goU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwulMaZu+GE/lQHjql7/2LXuN/BwucZsWwlAFQHvGmQtBbcdl+V
	a6P1pkGcjZMnSzwhdn2gMMzP+fKTC2B3x1CLsTHvwhGSDM9oa50kkeEMTTMxDAYbWqX2ZwyrolC
	IqbDYo4hLWsL0qtLs0c+DcISIizQ=
X-Gm-Gg: ASbGncuZ8B4xh0fN76AbHRl6y/jd/fHBHZ36DUenLRuzSviYcNf4HRlVYN5H8Uv40WW
	KS/23/rlIfbgd7zLaZSQBEPJEWMOY2tTnxWJxVk3xx6QW/MXJOS/0T4HRgLARbvjgI1tktiKjCR
	OkLcUrFeeaOKm1Bmav6BR4eFB93ECb
X-Google-Smtp-Source: AGHT+IHK361N/YmDn10qcIYFno+G9do2RFLQLcRsYttx/rcpfNsblhJfrW4wdQQfgZGo4d2QIRFtk/RDNmbjoRLMpGM=
X-Received: by 2002:a17:907:944b:b0:ac1:f19a:c0b8 with SMTP id
 a640c23a62f3a-ac20d911f1cmr141824166b.24.1741143475836; Tue, 04 Mar 2025
 18:57:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305025101.27717-1-alexs@kernel.org>
In-Reply-To: <20250305025101.27717-1-alexs@kernel.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 5 Mar 2025 10:57:28 +0800
X-Gm-Features: AQ5f1JpoV5-TvLf7XVR9ON0uSyS4w-MMluWRKB49dQ0u2GnkgRQ2MoCjCUTBuio
Message-ID: <CAD-N9QVnMGSNZXMWNYoHwoe0ZN7cNnXysNtmBjMX4xpwCysckw@mail.gmail.com>
Subject: Re: [PATCH] docs/Chinese: change the disclaimer words
To: alexs@kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXIgNSwgMjAyNSBhdCAxMDo1MeKAr0FNIDxhbGV4c0BrZXJuZWwub3JnPiB3cm90
ZToNCj4NCj4gRnJvbTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQo+DQo+IDIgcGFyYWdy
YXBoIHdhcm5pbmcgYW5kIG5vdGUgdGFrZSBhIGJpdCBtb3JlIHNwYWNlLCBsZXQncyBtZXJnZSB0
aGVtIHRvZ2V0aGVyLA0KPiBhbmQgZ3VpZGUgdG8gb3RoZXIgbWFpbnRhaW5lciBhbmQgcmV2aWV3
ZXJzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4g
Q2M6IFlhbnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXguZGV2Pg0KPiBDYzogRG9uZ2xpYW5nIE11
IDxkem05MUBodXN0LmVkdS5jbj4NCj4gQ2M6IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5u
ZXQ+DQo+IENjOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGlzY2xhaW1lci16aF9DTi5yc3QgfCA2ICsrLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rpc2NsYWltZXIt
emhfQ04ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGlzY2xhaW1lci16
aF9DTi5yc3QNCj4gaW5kZXggM2M2ZGIwOTRhNjNjLi41YTA0MTRlZWZhMDEgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rpc2NsYWltZXItemhfQ04ucnN0
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rpc2NsYWltZXItemhf
Q04ucnN0DQo+IEBAIC0xLDkgKzEsNyBAQA0KPiAgOm9ycGhhbjoNCj4NCj4gLS4uIHdhcm5pbmc6
Og0KPiArLi4gbm90ZTo6DQo+ICAgICAgIOatpOaWh+S7tueahOebrueahOaYr+S4uuiuqeS4reaW
h+ivu+iAheabtOWuueaYk+mYheivu+WSjOeQhuino++8jOiAjOS4jeaYr+S9nOS4uuS4gOS4quWI
huaUr+OAgiDlm6DmraTvvIwNCj4gICAgICAg5aaC5p6c5oKo5a+55q2k5paH5Lu25pyJ5Lu75L2V
5oSP6KeB5oiW5pu05paw77yM6K+35YWI5bCd6K+V5pu05paw5Y6f5aeL6Iux5paH5paH5Lu244CC
DQo+IC0NCj4gLS4uIG5vdGU6Og0KPiAgICAgICDlpoLmnpzmgqjlj5HnjrDmnKzmlofmoaPkuI7l
jp/lp4vmlofku7bmnInku7vkvZXkuI3lkIzmiJbogIXmnInnv7vor5Hpl67popjvvIzor7fogZTn
s7vor6Xmlofku7bnmoTor5HogIXvvIwNCj4gLSAgICAg5oiW6ICF6K+35rGC5pe25aWO5Lqu55qE
5biu5Yqp77yaPGFsZXhzQGtlcm5lbC5vcmc+44CCDQo+ICsgICAgIOaIluiAheivt+axguS4reaW
h+aWh+aho+e7tOaKpOiAheWSjOWuoemYheiAheeahOW4ruWKqeOAgg0KDQpMR1RNIQ0KDQpSZXZp
ZXdlZC1ieTogRG9uZ2xpYW5nIE11IDxkem05MUBodXN0LmVkdS5jbj4NCg0KPiAtLQ0KPiAyLjQz
LjANCj4NCj4NCg==
