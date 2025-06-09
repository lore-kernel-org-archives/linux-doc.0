Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5693D33F6
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 01:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749432096; cv=none; b=TPZmTARRvn0eewsAxiU9UIHexECO8ruGgjsnntI/m2kQzeV36zgNHexzjLx4l1W6OMUDjgbuOO3WKxMotG7hOCaB61z+MfDlKa9rebwUfG10I438O1S4d0jfeS+M661xvxxW80AdkmZYFvK8UegCtqQrF/JAi1oe4MBJMcsToNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749432096; c=relaxed/simple;
	bh=3818ZdWY/nXNSYuHWH6ioGwpRiiOTPbPEzWVcc70jso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBM+pQZ4Q9uN9hA2Ca9BN3s+Tj56+4y+uJXa1KTOv2pt0PhfkKS6+vLQnavJNhrSsGya9j2gzH77/z1sKYmQuKUk+DtcoVs3ICWpR/AU1g58KElAb3nvmVAQuN4DDzj+H9d6BnpMPc67KMhtBSZF7AvSMY2DThZYkQH+QNRWSiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFVwrWd4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFVwrWd4"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso3794956a12.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Jun 2025 18:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749432092; x=1750036892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3818ZdWY/nXNSYuHWH6ioGwpRiiOTPbPEzWVcc70jso=;
        b=FFVwrWd4YFlqdHw8+fpy65uxUoQpn+WlgpgdtJvbgC9TnJnPQWAsX7LrVDRIklFCHC
         FFZFNoBd4kDS+8PPZfPP89PHjEm1TUUo6SO6xHcChqUqSXbc9ceJtn0WCH94hKhZ7GoG
         lz3sqMLTV8CpJP7nl5+U2ttKoP+QWbzvNAGIvcbe0lIFVXmRUmAbY01259rbHIxofD9S
         1DhU4GOd4yjJuSFD7+LI82B9diwkIa66FibOIPD+LnRvssP13GY7sGMz/IcHZsthTJWP
         uuvvLsBPS10f1DRM1+k2MtjD42uk0LoNeeR/XWWoWU1QgtqidwshQKVGHQZ8zL0x5H3u
         NQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749432092; x=1750036892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3818ZdWY/nXNSYuHWH6ioGwpRiiOTPbPEzWVcc70jso=;
        b=sdlaet+cxeT09Jh+c9Gp9nf+Oq5egG3/D47HqzZFI6n5JiWJQnon8z0bHTrrt81RVS
         PEzFGk1W5Nxy2+hGT4APJscSZhtUisF+TrYtYXa4rVoU0lI13NrTpWuunPW1CfhNxgqB
         l3Oq92z4zHXUHu+l09x+yxIWI6bJdt1Py0BRomKLFXWb15TbPJhI7PaECHP6gidpQ+jO
         QYdVo/L6U3DqWMkVDSNnssTyT0in6B2uVbT1djd/Sh8o0Wz7NK/vmNFf4NzeWK9Q0pt4
         9oMRf4VlS9E12eAR7CpB/8aGGfk1x7xhdzChopaF2B1PsErK2Bb5uD+GdZRteA6RNGL6
         WJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUANq6s6mQMJ03VpmaTrytlqzicwTckPNq8MuomsGOV0Xx4vMHgJc84O8e5lH/Vb+VuCdJS9xfLHn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVlIw7JmsvcxIhMy0ctSTO5F1/bu6zFJLoA/z4lWEhafaNkZVd
	6qazGB341vZRSsIXYRhW3njSA6obJnmx82VvYTepR/B8470tqZpozKmdpB698kosYXK+qOEBCxN
	PpaRRVlxOxkZbHNx54K7pkeE/n0st/wbC3g==
X-Gm-Gg: ASbGnctG6f5QfYvs10bC2/TiT5n9hNnFKLQqmYU0bg0BZViipHFODEOhMYeqF96bcH0
	KvBjOUegDlvZHMlGiKni2cnjAAx80k2aFespy6IdGWiebb7B9jdk6pJ0LgZaBF7gj5kEf6URi4V
	MdJdI7BNROr9M824JrFajTT6ariB1CCTj52ONExpuTt8qcTA==
X-Google-Smtp-Source: AGHT+IFS+UhQXP/kArkN454i6l3upHll/H0t78dZY5Vjivf4ArUCBWWmUEJ3ECb8hvAWMBR1GaV+nUU0nW3m/kr4BQM=
X-Received: by 2002:a05:6402:3495:b0:607:ec18:940f with SMTP id
 4fb4d7f45d1cf-607ec189450mr2235126a12.6.1749432092254; Sun, 08 Jun 2025
 18:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607163814.7800-1-chris.wei.cui@gmail.com>
In-Reply-To: <20250607163814.7800-1-chris.wei.cui@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 9 Jun 2025 09:21:05 +0800
X-Gm-Features: AX0GCFsxTsXn78UxrYxcHHmEHr7KU3gDmfSVLBQSRx6qBP7MuEA9SPjZJEpQY4w
Message-ID: <CAD-N9QU_OKc24ANr02=3SetjNwvaxeHM=2NfH__7bE3ZwQkiFw@mail.gmail.com>
Subject: Re: [PATCH v3] Docs/zh_CN: Translate speculation.rst to Simplified Chinese
To: chris.wei.cui@gmail.com
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBKdW4gOCwgMjAyNSBhdCAxMjozOOKAr0FNIDxjaHJpcy53ZWkuY3VpQGdtYWlsLmNv
bT4gd3JvdGU6DQo+DQo+IEZyb206IEN1aSBXZWkgPGNocmlzLndlaS5jdWlAZ21haWwuY29tPg0K
Pg0KPiB0cmFuc2xhdGUgdGhlICJzcGVjdWxhdGlvbi5yc3QiIGludG8gU2ltcGxpZmllZCBDaGlu
ZXNlIGFuZCBhZGp1c3QNCj4gemhfQ04vc3RhZ2luZy9pbmRleC5yc3QuDQo+DQo+IFVwZGF0ZSB0
aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgNjM4MmY0ZTRlN2JkDQo+ICgiRG9jdW1lbnRh
dGlvbjogZml4IHNwZWN1bGF0aW9uLnJzdCBjaGFwdGVyIikNCj4NCj4gU2lnbmVkLW9mZi1ieTog
Q3VpIFdlaSA8Y2hyaXMud2VpLmN1aUBnbWFpbC5jb20+DQoNClJldmlld2VkLWJ5OiBEb25nbGlh
bmcgTXUgPGR6bTkxQGh1c3QuZWR1LmNuPg0KDQo+IC0tLQ0KDQpOZXh0IHRpbWUsIHBsZWFzZSBy
ZW1lbWJlciB0byBhZGQgdGhlIGNoYW5nZWxvZy4gRm9yIGV4YW1wbGUsDQoNCnYyLT52MzogYWRk
IHRoZSB0cmFja2luZyBjb21taXQgb2YgRW5nbGlzaCBkb2N1bWVudA0KdjEtPnYyOiBhZGRyZXNz
IHRoZSBjb21tZW50cyBmcm9tIERvbmdsaWFuZyBNdQ0KDQpEb25nbGlhbmcgTXUNCg0KPiAgLi4u
L3RyYW5zbGF0aW9ucy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdCAgICAgIHwgIDIgKy0NCj4gIC4u
Li96aF9DTi9zdGFnaW5nL3NwZWN1bGF0aW9uLnJzdCAgICAgICAgICAgICB8IDg1ICsrKysrKysr
KysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3N0YWdpbmcvc3BlY3VsYXRpb24ucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdCBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3N0YWdpbmcvaW5kZXgucnN0DQo+IGluZGV4IGJiNTVjODFj
ODRhMy4uNmQ2OGZhYmNlMTc1IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdA0KPiBAQCAtMTMsNiArMTMsNyBAQA0KPiAg
Li4gdG9jdHJlZTo6DQo+ICAgICA6bWF4ZGVwdGg6IDINCj4NCj4gKyAgIHNwZWN1bGF0aW9uDQo+
ICAgICB4eg0KPg0KPiAgVE9ET0xpc3Q6DQo+IEBAIC0yMSw2ICsyMiw1IEBAIFRPRE9MaXN0Og0K
PiAgKiBsem8NCj4gICogcmVtb3RlcHJvYw0KPiAgKiBycG1zZw0KPiAtKiBzcGVjdWxhdGlvbg0K
PiAgKiBzdGF0aWMta2V5cw0KPiAgKiB0ZWUNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3N0YWdpbmcvc3BlY3VsYXRpb24ucnN0IGIvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vc3RhZ2luZy9zcGVjdWxhdGlvbi5yc3QNCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jMzZkMzNmNjc4OTcNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zdGFnaW5n
L3NwZWN1bGF0aW9uLnJzdA0KPiBAQCAtMCwwICsxLDg1IEBADQo+ICsuLiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04u
cnN0DQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9zdGFnaW5nL3NwZWN1bGF0aW9u
LnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5bSU5beNIEN1aSBXZWkgPGNocmlzLndl
aS5jdWlAZ21haWwuY29tPg0KPiArDQo+ICs9PT09PT09PQ0KPiAr5o6o5rWL5omn6KGMDQo+ICs9
PT09PT09PQ0KPiArDQo+ICvmnKzmlofmoaPop6Pph4rkuobmjqjmtYvmiafooYznmoTmvZzlnKjl
vbHlk43vvIzku6Xlj4rlpoLkvZXkvb/nlKjpgJrnlKhBUEnmnaXlh4/ovbvkuI3oia/lvbHlk43j
gIINCj4gKw0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK+S4uuaPkOmrmOaAp+iD
veW5tuWHj+WwkeW5s+Wdh+W7tui/n++8jOiuuOWkmueOsOS7o+WkhOeQhuWZqOmDvemHh+eUqOWI
huaUr+mihOa1i+etieaOqOa1i+aJp+ihjOaKgOacr++8jOaJp+ihjOe7k+aenA0KPiAr5Y+v6IO9
5Zyo5ZCO57ut6Zi25q616KKr5Lii5byD44CCDQo+ICsNCj4gK+mAmuW4uOaDheWGteS4i++8jOaI
keS7rOaXoOazleS7juaetuaehOeKtuaAge+8iOWmguWvhOWtmOWZqOWGheWuue+8ieinguWvn+WI
sOaOqOa1i+aJp+ihjOOAgueEtuiAjO+8jOWcqOafkOS6m+aDheWGtQ0KPiAr5LiL5LuO5b6u5p62
5p6E54q25oCB6KeC5a+f5YW25b2x5ZON5piv5Y+v6IO955qE77yM5L6L5aaC5pWw5o2u5piv5ZCm
5a2Y5Zyo5LqO57yT5a2Y5Lit44CC6L+Z56eN54q25oCB5Y+v6IO95Lya5b2i5oiQDQo+ICvkvqfk
v6HpgZPvvIzpgJrov4fop4Llr5/kvqfkv6HpgZPlj6/ku6Xmj5Dlj5bnp5jlr4bkv6Hmga/jgIIN
Cj4gKw0KPiAr5L6L5aaC77yM5Zyo5YiG5pSv6aKE5rWL5a2Y5Zyo55qE5oOF5Ya15LiL77yM6L65
55WM5qOA5p+l5Y+v6IO96KKr5o6o5rWL5omn6KGM55qE5Luj56CB5b+955Wl44CC6ICD6JmR5Lul
5LiL5Luj56CBOjoNCj4gKw0KPiArICAgICAgIGludCBsb2FkX2FycmF5KGludCAqYXJyYXksIHVu
c2lnbmVkIGludCBpbmRleCkNCj4gKyAgICAgICB7DQo+ICsgICAgICAgICAgICAgICBpZiAoaW5k
ZXggPj0gTUFYX0FSUkFZX0VMRU1TKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
MDsNCj4gKyAgICAgICAgICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIGFycmF5W2luZGV4XTsNCj4gKyAgICAgICB9DQo+ICsNCj4gK+WcqGFybTY05LiK77yM5Y+v
5Lul57yW6K+R5oiQ5aaC5LiL5rGH57yW5bqP5YiXOjoNCj4gKw0KPiArICAgICAgIENNUCAgICAg
PGluZGV4PiwgI01BWF9BUlJBWV9FTEVNUw0KPiArICAgICAgIEIuTFQgICAgbGVzcw0KPiArICAg
ICAgIE1PViAgICAgPHJldHVybnZhbD4sICMwDQo+ICsgICAgICAgUkVUDQo+ICsgIGxlc3M6DQo+
ICsgICAgICAgTERSICAgICA8cmV0dXJudmFsPiwgWzxhcnJheT4sIDxpbmRleD5dDQo+ICsgICAg
ICAgUkVUDQo+ICsNCj4gK+WkhOeQhuWZqOacieWPr+iDveivr+mihOa1i+adoeS7tuWIhuaUr++8
jOW5tuaOqOa1i+aAp+ijhei9vWFycmF5W2luZGV4Xe+8jOWNs+S9v2luZGV4ID49IE1BWF9BUlJB
WV9FTEVNU+OAgg0KPiAr6L+Z5Liq5YC86ZqP5ZCO5Lya6KKr5Lii5byD77yM5L2G5o6o5rWL55qE
6KOF6L295Y+v6IO95Lya5b2x5ZON5b6u5p625p6E54q25oCB77yM6ZqP5ZCO5Y+v6KKr5rWL6YeP
5Yiw44CCDQo+ICsNCj4gK+a2ieWPiuWkmuS4quS+nei1luWGheWtmOiuv+mXrueahOabtOWkjead
guW6j+WIl+WPr+iDveS8muWvvOiHtOaVj+aEn+S/oeaBr+azhOmcsuOAguS7peWJjemdoueahOek
uuS+i+S4uuWfuuehgO+8jOiAg+iZkQ0KPiAr5Lul5LiL5Luj56CBOjoNCj4gKw0KPiArICAgICAg
IGludCBsb2FkX2RlcGVuZGVudF9hcnJheXMoaW50ICphcnIxLCBpbnQgKmFycjIsIGludCBpbmRl
eCkNCj4gKyAgICAgICB7DQo+ICsgICAgICAgICAgICAgICBpbnQgdmFsMSwgdmFsMiwNCj4gKw0K
PiArICAgICAgICAgICAgICAgdmFsMSA9IGxvYWRfYXJyYXkoYXJyMSwgaW5kZXgpOw0KPiArICAg
ICAgICAgICAgICAgdmFsMiA9IGxvYWRfYXJyYXkoYXJyMiwgdmFsMSk7DQo+ICsNCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiB2YWwyOw0KPiArICAgICAgIH0NCj4gKw0KPiAr5qC55o2u5o6o5rWL
77yM5a+5bG9hZF9hcnJheSgp55qE56ys5LiA5qyh6LCD55So5Y+v6IO95Lya6L+U5Zue5LiA5Liq
6LaK55WM5Zyw5Z2A55qE5YC877yM6ICM56ys5LqM5qyh6LCD55So5bCG5b2x5ZONDQo+ICvkvp3o
tZbkuo7or6XlgLznmoTlvq7mnrbmnoTnirbmgIHjgILov5nlj6/og73kvJrmj5DkvpvkuIDkuKrk
u7vmhI/or7vlj5bljp/or63jgIINCj4gKw0KPiAr57yT6Kej5o6o5rWL5omn6KGM5L6n5L+h6YGT
DQo+ICs9PT09PT09PT09PT09PT09PT0NCj4gKw0KPiAr5YaF5qC45o+Q5L6b5LqG5LiA5Liq6YCa
55SoQVBJ5Lul56Gu5L+d5Y2z5L2/5Zyo5o6o5rWL5oOF5Ya15LiL5Lmf6IO96YG15a6I6L6555WM
5qOA5p+l44CC5Y+X5o6o5rWL5omn6KGM5L6n5L+h6YGT5b2x5ZONDQo+ICvnmoTmnrbmnoTlupTl
vZPlrp7njrDov5nkupvljp/or63jgIINCj4gKw0KPiArPGxpbnV4L25vc3BlYy5oPuS4reeahGFy
cmF5X2luZGV4X25vc3BlYygp6L6F5Yqp5Ye95pWw5Y+v55So5LqO6Ziy5q2i5L+h5oGv6YCa6L+H
5L6n5L+h6YGT5rOE5ryP44CCDQo+ICsNCj4gK+iwg+eUqGFycmF5X2luZGV4X25vc3BlYyhpbmRl
eCwgc2l6ZSnlsIbov5Tlm57kuIDkuKrnu4/ov4flh4DljJbnmoTntKLlvJXlgLzvvIzljbPkvb/l
nKhDUFXmjqjmtYvmiafooYwNCj4gK+adoeS7tuS4i++8jOivpeWAvOS5n+S8muiiq+S4peagvOmZ
kOWItuWcqFswLCBzaXplKeiMg+WbtOWGheOAgg0KPiArDQo+ICvov5nlj6/ku6XnlKjmnaXkv53m
iqTliY3pnaLnmoRsb2FkX2FycmF5KCnnpLrkvos6Og0KPiArDQo+ICsgICAgICAgaW50IGxvYWRf
YXJyYXkoaW50ICphcnJheSwgdW5zaWduZWQgaW50IGluZGV4KQ0KPiArICAgICAgIHsNCj4gKyAg
ICAgICAgICAgICAgIGlmIChpbmRleCA+PSBNQVhfQVJSQVlfRUxFTVMpDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAwOw0KPiArICAgICAgICAgICAgICAgZWxzZSB7DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGluZGV4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGluZGV4LCBNQVhf
QVJSQVlfRUxFTVMpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gYXJyYXlbaW5k
ZXhdOw0KPiArICAgICAgICAgICAgICAgfQ0KPiArICAgICAgIH0NCj4gLS0NCj4gMi40My4wDQo+
DQo+DQo=
