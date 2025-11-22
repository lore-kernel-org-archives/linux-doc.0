Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6E2309BE
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763821834; cv=none; b=uTtQ8TQIyjYVWB+T+fWj/UAM4PeNaUDeb63nSlBWPxCR837e3JEz4uq6erhwQR0mX4EkzKy18aXodWV/tmstboQ9+9E4fDFmqFWEIZls86P0aCpN4jc5M/pAS2O1J2EBWGl88i1jOw0sCfshWA4QKmSUfKN8QL9v/ZTkA0CPNoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763821834; c=relaxed/simple;
	bh=iY+4UhMlAWj6KmfUaUqS8PMVcC4MLieILWdzf1We/3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRaH2dIAWOK1UEyH2DC7shvGLcS0HMkwnw5aSRYS7t2B5EK0NJEvKwhurvNQpi2RQMuzXLRSjdG5lIgX4TZjvxOblXa2XOpCXCy8g6Qc0oaLOMiu4bfu7lTaFrdIEB2QJhNeWwFwQKvTUq3vubWxkTsHCiXFzVDal+W8l7clcTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAi9KoTS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAi9KoTS"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7636c96b9aso401466866b.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 06:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763821830; x=1764426630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY+4UhMlAWj6KmfUaUqS8PMVcC4MLieILWdzf1We/3I=;
        b=GAi9KoTS4eHDpMEi39uD7ITZuZ3RgEDv+SAVXgqvM9luEdDfiiQ6E2S4hSxRAgDtdf
         EU5ldlRAxmU2tQ0Td+gRuNAVADV4p3kKYSs85AHOagTOUuxM9YifjsvibTlNEoQER5qd
         +4OyBXSRCGaMGU16LnfzwbBAbgijwfjl996CabZsi6g980QTxwQxtyEmVUEwb32imm+8
         nNz4Kq+PF+lO6vUsjy44Xtn2AMIVHWf6bAwrdp1xVw4d7tSK/pQERAzVoa/wC7xarOIF
         0SaGCSk+w2J4+YxIzueEALCB6TGqzMViYovyhOpBJX113T4a6ukVGfQ2u9xF2TrGOKqv
         X/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763821830; x=1764426630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iY+4UhMlAWj6KmfUaUqS8PMVcC4MLieILWdzf1We/3I=;
        b=GSn+zfNAI8JW4UGGiUyxzU6vsnal5A/H3HfsJMVTB18CdK5Px5LpoG4L8uFQC5tx4R
         K6BsNgQHGxHzlDAST4G7IMz50uh6UI4bh97EyiEtu999/BB2y1/jqFgjUigu5a4zqTfr
         kZ4uP7zuf5wJ69PiRri9cCRpoX4xR1BvGoeb3vABprJG9EjAa8jMGZOAmCxnB7WmijlW
         Bi/wvI2DLmnFF1DVTMgkXOJI7VFJl6r1IiiW8EZO+HZvXQMmt5IbVo7cWlVSoUpCAo3u
         rPptInPcxsrNQgxDZbMWQSobK0Fw8ZRgfzwfXJueglh805JMnsKlnvJAsWe8WAUMvZpE
         GbGA==
X-Forwarded-Encrypted: i=1; AJvYcCVSm1GcYTHQAnUimhW+h3AhcCwFv7DLC4wy6HlcABPQdUeet+h6A6Qlsw2NcUuKPykN1LaTS8wwmJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWdqjT5Nn5lkHafpHPCSlF5N7Il8DCtQRNY45fWbJW4DT9zh+
	zywa4So20sT+vGY2i7Vpwdm/n+OQz+xzFGYbqxiCIzn0lsuLvEOCieVljRcnfSHziiIYrn4/8t8
	6gBeUOuW50prJcfhDjYJJG0ThHwhIKvc=
X-Gm-Gg: ASbGncuCDiJUinUgeOOH9qrHSZpF/pC5AadstzpGLvohR5TFES/+fa4FdlaPUYO7y/a
	ZGkrQGUGKwhSReZdPkKdnQDgcJ+i/zpgcQYUW+KzVDdr8wv6ijDr/zFT8f8RdzjCSgmuYS3Y1CJ
	LrSd67m9T1H+NsiQ1IYdnanNXy+kBR7c0ccp+h2BMPIaht+PwEO5Zn/lUebN29sRHJHeqQh/im3
	zsdPVdb6IDjePM4of8oknim+cmqRbKICySWKVDXuRateje3+QVe3GVNJMukFXF6/JF4yr0=
X-Google-Smtp-Source: AGHT+IFQxYdjlehimSA1zazmS1aRIgJyQZSSpY5f9EnD7VWj6bDVw7Qd1WwEYoIpQ8ebk/3RdbEay8Lr8IpotSS7eLE=
X-Received: by 2002:a17:907:2dab:b0:b72:b8e4:3aea with SMTP id
 a640c23a62f3a-b7671549db4mr675732566b.10.1763821830270; Sat, 22 Nov 2025
 06:30:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763112421.git.yjzhang@leap-io-kernel.com> <f9720c918de47890c536124e7866859c866c67f4.1763112421.git.yjzhang@leap-io-kernel.com>
In-Reply-To: <f9720c918de47890c536124e7866859c866c67f4.1763112421.git.yjzhang@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Date: Sat, 22 Nov 2025 22:29:53 +0800
X-Gm-Features: AWmQ_bntzB39rx_l08qsgfBL9jwY0QdmfZqwadM46aWMGPVMohs3yiSm3PdDekU
Message-ID: <CAJy-AmkoqiOEf3mqCzYWYSVEdttEQrOJ_29MpUHm9+GW6DcYcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/zh_CN: Add wd719x.rst translation
To: yjzhang@leap-io-kernel.com
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

WXVqaWUgWmhhbmcgPHlqemhhbmdAbGVhcC1pby1rZXJuZWwuY29tPiDkuo4yMDI15bm0MTHmnIgx
NuaXpeWRqOaXpSAxNToxNuWGmemBk++8mg0KPg0KPiBUcmFuc2xhdGUgLi4uL3Njc2kvd2Q3MTl4
LnJzdCBpbnRvIENoaW5lc2UuDQo+IEFkZCB3ZDcxOXggaW50byAuLi4vc2NzaS9pbmRleC5yc3Qu
DQo+DQo+IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgNDBlZTYzMDkxYTQw
DQo+ICgic2NzaTogZG9jczogY29udmVydCB3ZDcxOXgudHh0IHRvIFJlU1QiKQ0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBZdWppZSBaaGFuZyA8eWp6aGFuZ0BsZWFwLWlvLWtlcm5lbC5jb20+DQo+IC0t
LQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9zY3NpL2luZGV4LnJzdCAgICAgICAgIHwgIDIg
Ky0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS93ZDcxOXgucnN0ICAgICAgICB8IDM2
ICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3Njc2kvd2Q3MTl4LnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9zY3NpL2luZGV4LnJzdA0KPiBpbmRleCA1ZWVjYmVmNGM5YzAu
LjVmMTgwM2UyNzA2YyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vc2NzaS9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vc2NzaS9pbmRleC5yc3QNCj4gQEAgLTUyLDYgKzUyLDcgQEAgU0NTSeS4u+acuumAgumF
jeWZqOmpseWKqA0KPg0KPiAgICAgbGlic2FzDQo+ICAgICBzZC1wYXJhbWV0ZXJzDQo+ICsgICB3
ZDcxOXgNCj4NCj4gIFRvZG9saXN0Og0KPg0KPiBAQCAtODcsNiArODgsNSBAQCBUb2RvbGlzdDoN
Cj4gICogc3ltNTNjOHh4XzINCj4gICogdGNtX3FsYTJ4eHgNCj4gICogdWZzDQo+IC0qIHdkNzE5
eA0KPg0KPiAgKiBzY3NpX3RyYW5zcG9ydF9zcnAvZmlndXJlcw0KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS93ZDcxOXgucnN0IGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS93ZDcxOXgucnN0DQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNWY4MmM5MjIwNTQxDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS93ZDcxOXgu
cnN0DQo+IEBAIC0wLDAgKzEsMzYgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiAr
Ok9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3Njc2kvbGlic2FzLnJzdA0KPiArDQo+ICs657+76K+R
Og0KPiArDQo+ICsg5byg6ZKw5p2wIFl1amllIFpoYW5nIDx5anpoYW5nQGxlYXAtaW8ta2VybmVs
LmNvbT4NCj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArDQo+ICsNCj4gKz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiArV2Vz
dGVybiBEaWdpdGFsIFdENzE5MywgV0Q3MTk3IGFuZCBXRDcyOTYgU0NTSSDljaHpqbHliqgNCj4g
Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KDQpUaGlzIGZvcm1hdCBsb29rcyBpbmNvcnJlY3QgZm9yIFJTVCBydWxlcywgZGlk
IHlvdSBjaGVjayB5b3VyIG91dHB1dA0KYWZ0ZXIgZG8gJ21ha2UgaHRtbGRvY3MnPw0KDQo+ICsN
Cj4gK+ivpeWNoemcgOimgeWKoOi9veWbuuS7tuOAguWbuuS7tuWPr+S7jiBXaW5kb3dzIE5UIOmp
seWKqOS4reaPkOWPlu+8jOivpempseWKqOWPr+WcqOS7peS4iw0KPiAr5Zyw5Z2A5LuOIFdEIOWu
mOaWueS4i+i9ve+8mg0KPiAraHR0cDovL3N1cHBvcnQud2RjLmNvbS9wcm9kdWN0L2Rvd25sb2Fk
LmFzcD9ncm91cGlkPTgwMSZzaWQ9MjcmbGFuZz1lbg0KPiArDQo+ICvor6Xmlofku7bmiJbnvZHp
obXkuIrpg73mnKrljIXlkKvku7vkvZXorrjlj6/lo7DmmI7vvIzlm6DmraTor6Xlm7rku7blj6/o
g73ml6Dms5XooqvmlLblvZXliLANCj4gK2xpbnV4LWZpcm13YXJlIOmhueebruS4reOAgg0KPiAr
DQo+ICvmj5DkvpvnmoTohJrmnKzlj6/nlKjkuo7kuIvovb3lubbmj5Dlj5blm7rku7bvvIznlJ/m
iJAgd2Q3MTl4LXJpc2MuYmluIOWSjA0KPiArd2Q3MTl4LXdjcy5iaW4g5paH5Lu244CC6K+35bCG
5a6D5Lus5pS+572u5ZyoIC9saWIvZmlybXdhcmUvIOebruW9leS4i+OAgg0KPiAr6ISa5pys5YaF
5a655aaC5LiL77yaDQo+ICsNCj4gKyAgICAgICAjIS9iaW4vc2gNCj4gKyAgICAgICB3Z2V0IGh0
dHA6Ly9zdXBwb3J0LndkYy5jb20vZG93bmxvYWQvYXJjaGl2ZS9wY2lzY3NpLmV4ZQ0KPiArICAg
ICAgIGxoYSB4aSBwY2lzY3NpLmV4ZSBwY2ktc2NzaS5leGUNCj4gKyAgICAgICBsaGEgeGkgcGNp
LXNjc2kuZXhlIG50L3dkNzI5NmEuc3lzDQo+ICsgICAgICAgcm0gcGNpLXNjc2kuZXhlDQo+ICsg
ICAgICAgZGQgaWY9d2Q3Mjk2YS5zeXMgb2Y9d2Q3MTl4LXJpc2MuYmluIGJzPTEgc2tpcD01NzYw
IGNvdW50PTE0MzM2DQo+ICsgICAgICAgZGQgaWY9d2Q3Mjk2YS5zeXMgb2Y9d2Q3MTl4LXdjcy5i
aW4gYnM9MSBza2lwPTIwMDk2IGNvdW50PTUxNA0KPiArICAgICAgIHJtIHdkNzI5NmEuc3lzDQo+
IC0tDQo+IDIuMjUuMQ0KPg0K
