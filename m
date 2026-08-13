Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CB5476CF1
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 16:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637106; cv=pass; b=JtIe0bmWsGQ69Da3WbnfePlWKhZY3ngGlltGrSS6x5Ag8YOEKyIl9VuWB/MbwJvUhL2PEZkpYRl3JevAimlcMVZCtBqCMyjA3w6cdoQndSxXWzf5NR/9qqroAIAe5avZ33QAptfgB3M8Gz5zJ6U2iAjGArO7Oj0tGcCX+DDAtcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637106; c=relaxed/simple;
	bh=dLMQqCJr+dvuxEVlT/szuwo6pQphBYuFXC4QvI8SmRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRN/Xcz8II0LG8cTWFVI81Asx93+oJ7vml+pwXtiRmGfAJF98VZq3nwfcWiozaTYDY7X/DrX6XhhEvfmlGpnsYFmN5S1ih9FtJ5YAckJ7L5CjZ4JaZdkAaB9gcdIk1y59RzumBkybtvI+dHpn6XCeAREIM4COiSxtkpKR64B/Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyQosboR; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyQosboR"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52cd38ddcdfso558351cf.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 09:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786637103; cv=none;
        d=google.com; s=arc-20260327;
        b=opAf9qt7bUGQJXekb1cEYqGYnydB9ehMLBTrLZLypCJ+Kgm0PfXaslq2OH6AjehC+t
         m98pS970hKqdMXVn3aiUJoBnoULpW56sKPOE3rbn8h4A4k+PDj5HqarTwnmGHLT3qz4Q
         Q3Rx0MExQ3rATbcHgLZVtw65Jvvpl5GzxbUcfBumGUC975OYThn/ReIrZXCd+C5EI60d
         BIR6cJhZRgPk/L74EqNVhMSnXvp0QOCUW2LA/TX25Aq96nNsggRZUzDAKP5840b7R9B4
         pnimfFpd3IhGb1sHqLUnkaEqTC4TygVFLTUldIOMB2t+VyAGqGao9lMYiuSMYOJJxCEZ
         BwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dLMQqCJr+dvuxEVlT/szuwo6pQphBYuFXC4QvI8SmRQ=;
        fh=Zzc1E/LLitWOpCm1lGZDxtjD3RZkUsf1t/rR98MjfDA=;
        b=nrM9xWbda6t/r8R4lL/DnhrYUPZwGTnhlw0rdBGAWZBIU3jFW2W6/ge02ZwbzfPz50
         Z1fENDZ5bLftqJSuhIqLvvlSZOqfaF5WOEUjmp1qCo/I84826hB6NyT5Ava8LEI6j/N/
         63TQWiIrBmbZDt6Y6w6XvCqM6r/p6wtplgEgotW0mRmVBXPdCSSc6nNGaOGHc+t8gBMd
         BqOrX1ysDjVy+8O/nii+TGkFTuRx8rjw3O3UjjDRO2rUP0+tIiSWiVPj0Gj1hTJxJ/zv
         Imn9wdvZfW3BWHYnf2J2DWR+IqY7LSwNNUe+3lyq6+tIGiSutrVyT34csFSkF5dJ9bZq
         Q5og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637103; x=1787241903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dLMQqCJr+dvuxEVlT/szuwo6pQphBYuFXC4QvI8SmRQ=;
        b=OyQosboRs5pSSgzg6Lriuq/EKgMGMHWAJANDNej4hXvwQy28ylVMSomlZ6geBoDjcW
         fNrKqnqb4AhlVnBC0KIW2lzbJj5d4tyeOMIiSXAaOFehmeJU9lkvi3YCg6eLf2+PNSKp
         66DR9qDbugtEmfvTZ4v/ifAkzPHs1eeQCXpjvY7pFdtjrLcCEL/4vHWpcGfLKIjMCwX3
         IvlHNzuteEgoawvdVMrKZT0AwTsDDJZtlMdYYXXg/ZkqSx0PDTJ3w3GwosF/tErMVAsV
         IUk/+Xpy3SsXr+G0yGLT1xkcP6glaq6TizKW4XrBOnSmmSg1V5TL32bGuCH/CRJY8hpP
         TeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637103; x=1787241903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLMQqCJr+dvuxEVlT/szuwo6pQphBYuFXC4QvI8SmRQ=;
        b=ey+FZ9r6yx2t78SCq9nXeLyewd6HObAWaOKSkL31rvgObNoA1rF5yufLiGLcK0uInX
         9/sfH4Dd31RomoasBv+6SMlyREEU654zmqdmW84UnkIwXFhLmKtxRExc4PD7C5kkQN/a
         CEgj5Yj2J20/TnuE+J4WiptEmEtB9FaEFps8Eklt7yc2u2hjNCJlDq+KA94gx4DPdIO+
         DdJCxGPj3bR4Bi2EaBdZU/ungiFXp4U5OszC0n1YnbmTSa1EW3RMbs6m9qXNotxNNeGm
         5LzQdx6m8tSJnQT1xLbpQC3zOJhmRAog3uPWFwfkQsROnIox0qth8/geacdYat3Ar6rq
         wweQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9xWR6ECqeywZsA3g+mE0DbpNAh0MApECdwsoG5PIHSQprQ2AlRCzAlb3qAoP6Vrdu9Qxua+hnh8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNVyrmiGPTduMskScRZRRuvmbOg+sHFKHiVrVx96C86hZqjl+
	t/xSkvWNF29DrtWmXtNaaLUEYzndQ2nHh1wDFGTYVlXNlcvn41BFPuMERQNtIKOYzhGktPkFSkF
	V+mECdo6O/FMCbaBRNV7qkXKDpBuxYKA=
X-Gm-Gg: AR+sD10z/RKAMDGugXvKONaW9f/rIoizuhcsT0u0xN8zy+mgj7TKVfQAtmdnCBbJc+s
	ixImlO/NYldmDbDPCWW0C1D6m6LMjUf75KqhcCwHBLyEsu9WRXaa+T20BDsYN9LSUHlCQcWCKhW
	uW3h4JrPEv9tZVWIL4Ixwaw2s/u/tNLSxYnY2A3tXxGJORpc8JP3q3MjrzSEpINLfNDC5Q22ZDR
	EcZvDIPGEdVgPuUALXKpJ9R5P2stt0CFrZ5PHEG0XqxK+p/MgN1rFbFBkZU75lzr8heHMDmE82t
	dJVvYRV4IVMdUhYeN5q7KlzFRpZreLfI66BeYbbgSpSgVBMNJILO0hbH
X-Received: by 2002:a05:622a:5c09:b0:51c:84f0:d903 with SMTP id
 d75a77b69052e-52d73c8c2efmr76025371cf.17.1786637103070; Thu, 13 Aug 2026
 09:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812182327.53694-1-chenmiao.ku@gmail.com> <20260812182327.53694-6-chenmiao.ku@gmail.com>
 <an3khZbPdI0in3Sq@wyuan.org>
In-Reply-To: <an3khZbPdI0in3Sq@wyuan.org>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Fri, 14 Aug 2026 00:04:26 +0800
X-Gm-Features: AUfX_mzQo8mj8h-vdbbU3l8TpqhfjCwGzcDtAFZM4fh3iGfOGT_qlVJuMJThZeQ
Message-ID: <CAKxVwgcV32j5b_C5QiXgYJdx5YeEoxi8fcBLFJggkjmBnUREqA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

V2VpamllIFl1YW4gPHd5QHd5dWFuLm9yZz4g5LqOMjAyNuW5tDjmnIgxM+aXpeWRqOWbmyAyMzoz
NuWGmemBk++8mg0KPg0KPiBPbiBUaHUsIEF1ZyAxMywgMjAyNiBhdCAwMjoyMzoyMkFNICswODAw
LCBDaGVuIE1pYW8gd3JvdGU6DQo+ID4gVHJhbnNsYXRlIHRoZSBtYWNPUyBTcGhpbnggZGVwZW5k
ZW5jeSBzZXR1cCBhZGRlZCB0byB0aGUgRW5nbGlzaA0KPiA+IGRvY3VtZW50YXRpb24uIEtlZXAg
dGhlIHRyYW5zbGF0aW9uIGluIGEgc2VwYXJhdGUgcGF0Y2ggc28gdHJhbnNsYXRpb24NCj4gPiBz
dGF0dXMgdG9vbGluZyBjYW4gdHJhY2sgdGhlIHNvdXJjZSBjaGFuZ2UgY29ycmVjdGx5Lg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBNaWFvIDxjaGVubWlhby5rdUBnbWFpbC5jb20+DQo+
DQo+IEFja2VkLWJ5OiBXZWlqaWUgWXVhbiA8d3lAd3l1YW4ub3JnPg0KPg0KPiA+IC0tLQ0KPiA+
ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2RvYy1ndWlkZS9zcGhpbngucnN0ICAgICB8IDE3ICsr
KysrKysrKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vZG9jLWd1aWRlL3NwaGlueC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9kb2MtZ3VpZGUvc3BoaW54LnJzdA0KPiA+IGluZGV4IDMzNzVjNmYzYS4uZTZk
NDJkOTcwIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2RvYy1ndWlkZS9zcGhpbngucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vZG9jLWd1aWRlL3NwaGlueC5yc3QNCj4gPiBAQCAtMTEwLDYgKzExMCwyMiBAQCBQ
REblkoxMYVRlWOaehOW7ug0KPiA+DQo+ID4gICAgICAg5L2/55SoU3BoaW5455qE57O757uf5omT
5YyF77yM6ICM5LiN5pivUHl0aG9u6Jma5ouf546v5aKD44CCDQo+ID4NCj4gPiArbWFjT1Mg6buY
6K6k5L2/55So5LiN5Yy65YiG5paH5Lu25ZCN5aSn5bCP5YaZ55qEIEFQRlMg5Y2377yM6ICM5YaF
5qC45rqQ56CB5qCR5Lit5a2Y5Zyo5LuF5aSn5bCP5YaZDQo+ID4gK+S4jeWQjOeahOaWh+S7tuOA
guWFi+mahua6kOeggeWJje+8jOivt+eUqCBgYGRpc2t1dGlsIGFwZnMgbGlzdGBgIOaJvuWIsCBB
UEZTIOWuueWZqOagh+ivhuespu+8jA0KPiA+ICvlsIbkuIvpnaLnmoQgYGBkaXNrWGBgIOabv+aN
ouS4uuivpeagh+ivhuespu+8jOW5tuWIm+W7uuS4gOS4qumineWklueahOWkp+Wwj+WGmeaVj+aE
n+WNtzo6DQo+ID4gKw0KPiA+ICsgICAgIGRpc2t1dGlsIGFwZnMgYWRkVm9sdW1lIGRpc2tYIEFQ
RlNYIExpbnV4DQo+DQo+IFRoaXMgQ0xJIHdheSBkZWZpbml0ZWx5IHdvcmtzLCB3aGlsZSB0aGUg
RGlzayBVdGlsaXR5IGFwcCBhbHNvIHByb3ZpZGVzDQo+IGFuIGVhc3kgd2F5IHRvIGRvIHRoaXMu
IDstKSBTaGFsbCB3ZSBhZGQgbW9yZSBkZXNjcmlwdGlvbiBvciB0aXBzIGFib3V0DQo+IGl0PyBC
dXQgSSdtIGFsc28gc2F0aXNmaWVkIHdpdGggdGhlIGN1cnJlbnQgc2l0dWF0aW9uLCBhcyBzb21l
IGhhY2tlcnMNCj4gd2hvIHdvdWxkIHJlYWQgdGhpcyBtYXkgcHJlZmVyIENMSSB3YXkuDQo+DQpJ
IGRvbid0IHRoaW5rIEdVSSBpbnN0cnVjdGlvbnMgYXJlIG5lY2Vzc2FyeSBoZXJlLiBSZWFkZXJz
IHdobyBmaW5kIGRpc2t1dGlsDQp1bmZhbWlsaWFyIGNhbiBlYXNpbHkgc2VhcmNoIGZvciB0aGUg
ZXF1aXZhbGVudCBzdGVwcyBpbiBEaXNrIFV0aWxpdHkuIFRoZSBzYW1lDQpvcGVyYXRpb24gY2Fu
IGFsc28gYmUgcGVyZm9ybWVkIHVzaW5nIERpc2sgVXRpbGl0eS4NCg0KVGhhbmtzLA0KQ2hlbiBN
aWFvDQo+DQo+ID4gK+WcqCBtYWNPUyDkuIrvvIzor6XohJrmnKzkvb/nlKggSG9tZWJyZXcg5a6J
6KOF57O757uf5L6d6LWW77yM6L6T5Ye655qEIEhvbWVicmV3IOWRveS7pOS4jemcgOimgQ0KPiA+
ICtgYHN1ZG9gYOOAglBERiDlt6Xlhbfpk77nlLEgYGBtYWN0ZXgtbm8tZ3VpYGAgY2FzayDmj5Dk
vpvvvIzmiYDpnIDnmoQgRGVqYVZ1IOWSjCBOb3RvIENKSw0KPiA+ICvlrZfkvZPliJnpgJrov4cg
SG9tZWJyZXcgZm9udCBjYXNrIOWuieijhe+8m+WmguaenOWPquaehOW7uiBIVE1MIOaWh+aho++8
jOivt+S9v+eUqCBgYC0tbm8tcGRmYGDjgIINCj4gPiAr5a6J6KOFIE1hY1RlWCDlkI7vvIzor7fp
h43mlrDlkK/liqjnu4jnq6/vvIzmiJbov5DooYwNCj4gPiArYGBldmFsICIkKC91c3IvbGliZXhl
Yy9wYXRoX2hlbHBlcikiYGAg5L2/5ZG95Luk6KGM5bel5YW35Y+v6KeB44CCbWFjT1Mg55So5oi3
5bu66K6u5L2/55SoDQo+ID4gK+m7mOiupOeahCBQeXRob24g6Jma5ouf546v5aKD77yM5Zug5Li6
IFB5WUFNTCDkvJrku44NCj4gPiArYGBEb2N1bWVudGF0aW9uL3NwaGlueC9yZXF1aXJlbWVudHMu
dHh0YGAg5a6J6KOF77yM6ICM5LiN5piv6YCa6L+HIEhvbWVicmV3IOWuieijheOAgg0KPiA+ICvo
r6XohJrmnKzov5jkvJrmo4Dmn6UgR05VIE1ha2UgNC4wIOaIluabtOmrmOeJiOacrO+8m+Wmguae
nCBIb21lYnJldyDlsIblhbblronoo4XkuLoNCj4gPiArYGBnbWFrZWBg77yM6K+35L2/55SoIGBg
Z21ha2UgaHRtbGRvY3NgYO+8jOiAjOS4jeaYryBgYG1ha2UgaHRtbGRvY3NgYOOAgg0KPg0KPiBU
aGFua3MgZm9yIHRoaXMsIEkgbGlrZSBpdC4NCg==
