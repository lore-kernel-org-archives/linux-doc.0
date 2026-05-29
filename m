Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7EE3D75D3
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054416; cv=pass; b=KFf6V8ESqxPTPJE8qY+ZohmYQKcEhZsddFS1lMf/6NK2siX3gQMEziwQ+Tpw3lwPPC92u7lj3MUpNL51VhN7ZvRfIffKIng/ISrCWsVOtcpNr3y9gTHhE4k+uoVbo7G5A6mA0hUdKMLDBbRZ9ZyCoVZUe2C+dZHyCB56isfgJe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054416; c=relaxed/simple;
	bh=G+5I/ClAqaWq4Zh0sdJ2sKy96qqKwDT0Pgl3bG0qNrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vE0bQf0HRGI9dR05DltODTAeTGKqU6kS5A+KcUcv8yymOYtLdn13ZhYI8935aW0JUZ52Fk04JeyxCNqZB3BqG/6Q66Ql2EHjMzPWxagBCZxkL1X7AWt15QsCD7491w8J1YRj04nbCxvC4u4wivL0vqmiSOnsge2CsTE5NHi9oCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oybrK07l; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oybrK07l"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7c7fc722b50so113667617b3.2
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 04:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780054414; cv=none;
        d=google.com; s=arc-20240605;
        b=fdR1ClcxiRM1Z8rbdI1/6QhAmQvyRtc8Zm1+PgwLyTBu50stKRnnMyoKAl6vKBYLlt
         Ic1BN93bCv8mpMK1wSxOX+Tq7FQKj5jSp+nU8u3tPvwHklTYvY4sWLcBwj+m/qKG6unL
         cQLve7MUDxeYzEcpYhK1eV821IOBLyacEUZuS6ApBybD4EQw2jeCPz8med5yJRSupf6r
         gZgzS+CIIT0kbiuKGElP2AbXXvyOkA3TyRH4wcg1FjiRXfn2/BtfShnizBe/kcIQPEkU
         fmZ8oYRhdOwbPROtis5YWzHrM4B8Ji3WFzk5kfWFawyWq/RSX4C4ZlozLBTg+bmYDxwi
         mtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G+5I/ClAqaWq4Zh0sdJ2sKy96qqKwDT0Pgl3bG0qNrM=;
        fh=IBxYn1/qTwQCTiCnndhPT7vLtJ7Aq0anwZwTaimIri8=;
        b=FLHDAa5xjp7/sqcndFlZq0Iv7o8zEs21jHu18wOyIyTf/KNUGtcB6WdNnbuHs7a28M
         okN5KW38Au5YSXRJgoeKO1aZkYD/X9Gq+bcHi9idMQReX9Xv7+zRwcrpGmOaRxHEnfvE
         jK+CnnTWHOnhvWLcMkz0bsNYelnQY/ijardwrpdIdLZc8pQi3UIO9O+uQvDMhkQDgLpf
         UvU4d6PLvVIVxMmOT/wOZR1Ny8mtx4dF81hz9KyHDbweB1RVAQryA9ckCP5Cf71miy2d
         waCvZJOe4lphoGmy3HGwnocpqMA8yjgjEsbtHs6RzE7+H8chFrzUrhaKTd1Z+NnTh8oi
         nq5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780054414; x=1780659214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+5I/ClAqaWq4Zh0sdJ2sKy96qqKwDT0Pgl3bG0qNrM=;
        b=oybrK07lBGOwmXMGZbnPrcvniga1Z9GN6+JP2XduH9AFkK4OK/VtW7gqYpqexjTvU0
         cAHKKL15Rjc14qb+ziczgOMJauUIy+1Jl0l+3wysgAtln3ql1gzAivh/BVxj5Cr8gT9D
         z1YHpbuvJE9Z8XyeVIGpuLJs9UL+KIVQ1Zfmyv09r1xb6/sxBYRk0PSEPEhgf3FRvrpB
         N5PcSERbmfbFdGnPyrxwr+c/mL/z+XSiEDcMA/JxOaA22m6bCy6/IXHR/92M6Dtvt0Ax
         DHaTXfvUhuIKzjeYAj19/eJy98OIAxCPsvavNK9+zcub4VKXS4OEFGD1N/gkU07ZQikZ
         JQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054414; x=1780659214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+5I/ClAqaWq4Zh0sdJ2sKy96qqKwDT0Pgl3bG0qNrM=;
        b=Mnu7WcJxAdV9fEc5WrzW/dhbNXOaDVT8AEkJIWfV4zHpRR0hP9N4TYeb1NBFDD6gwv
         0R2IhrvVGUjgtv8WZxa0OHn+J64M5jFwOn1l/fEH8jhjR6e7CulI7tEfaFTX0XMtyn32
         S4wtcanR7OQ5lRmvwCC6qS/XNxEk1iMTKoU8qjsorUVzPoZUUZA25wfjKI1AfL2B8tpG
         zIebFbmPD5fsL9bSz4xn9OTPFojie+ke2ncy6EJIbM8XxUzCCEQnExXrlN65sI2s/AQX
         rw59CmhMI5flASM9pZUZTDitBVbfOBL+nWdkgpPvxG1niYy+0np5ek30aIXN7a3l36iv
         Q7fQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DU868tv54hUHfH7FbrEHT2ivfhmEDNMEVgo1BLg90lDmIXuDtGfAzpnvx6zeTyz2D6RDYNMJBTRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwctexpEenRglz3R2Gcg7o0cMCeGHiU884xPSSVlE52MQ1w6Gz/
	c8U2aKX4vo2F+T1p0LliQMuRcu3dd+tsmXDsjckXqe1G752KEdGh8/0F1ckgF/BhJ5N23oPiGeR
	n7kV7PYOs0yMk6Dj4Jjqmmu5fRvUyaGo=
X-Gm-Gg: Acq92OHfadeVub5d8glxW239bIxbE7NL4Dz9PApm5vwZRSMKh85JcAGbCTWaiogbya6
	12wyc7G7L2GVW3G8fNsinFWi9Kj6H+e4L/gGQw/M/JCaN13A/z/5THYLqTNjLo8Z95taLN3/6t+
	6JKZS/zYdGh2mzIWY9s+n7SmulW4DAjwMOIkbbeCLgo2adRbgf5su1EGf9IIX0e/VMH8ZbL0o16
	tCCkOpPHU+Kqoxa9wUBy/JlTSyKBe3+366cV6B+HjTmKaid46Pj0Zdg8cikc/Q/fsfkqo3nxN45
	uKxb+Fr0ju2HqrS62D0=
X-Received: by 2002:a05:690c:12:b0:7dc:e580:803 with SMTP id
 00721157ae682-7de47e28fcemr20037567b3.24.1780054413700; Fri, 29 May 2026
 04:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528041330.23247-1-chenyou910331@gmail.com>
 <CAD-N9QVD+L6Pgx7dVkoYMra1v02tOE7P8gCsuSMa2Nyk8H1DgQ@mail.gmail.com> <CAKspUh+5h+MeMVEEGy4Oc+HJteaTE1Ft1XXhDPJEmL-218T4Jg@mail.gmail.com>
In-Reply-To: <CAKspUh+5h+MeMVEEGy4Oc+HJteaTE1Ft1XXhDPJEmL-218T4Jg@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Fri, 29 May 2026 19:33:05 +0800
X-Gm-Features: AVHnY4KYlyBs4XncMdYek3et17vp7gUFtxuAyvp06kS6gftCYdRGFjiNqMxNllU
Message-ID: <CAD-N9QV_PtHgPGJzOfkfX-uCT3kP1Bw2d4YvAjgZa-D=GJZizw@mail.gmail.com>
Subject: Re: [PATCH] docs: zh_TW: process: localize terminologies and improve
 fluency in 8.Conclusion
To: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?5oWV5Yas5Lqu?= <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBNYXkgMjksIDIwMjYgYXQgNzoyNuKAr1BNIOiRieWuuOS9kSA8Y2hlbnlvdTkxMDMz
MUBnbWFpbC5jb20+IHdyb3RlOg0KPg0KPiBIaSBEb25nbGlhbmcsDQo+DQo+IFRoYW5rIHlvdSBm
b3IgcmV2aWV3aW5nIHRoaXMgcGF0Y2ggYW5kIGZvciB5b3VyIGNhcmVmdWwgb2JzZXJ2YXRpb24h
DQo+DQo+IFlvdSByYWlzZWQgYSB2ZXJ5IHZhbGlkIHBvaW50LiBJbiBQUkMgdGVybWlub2xvZ3ks
ICLlhafmoLgiIChLZXJuZWwpIGFuZA0KPiAi5qC45b+DIiAoQ29yZSkgYXJlIGRpc3RpbmN0bHkg
c2VwYXJhdGVkLiBIb3dldmVyLCBpbiBUYWl3YW4ncyBvZmZpY2lhbA0KPiB0ZWNoIHRlcm1pbm9s
b2d5IChlLmcuLCBieSB0aGUgTmF0aW9uYWwgQWNhZGVteSBmb3IgRWR1Y2F0aW9uYWwNCj4gUmVz
ZWFyY2gpIGFuZCBsb2NhbCBhY2FkZW1pYy9pbmR1c3RyeSB1c2FnZSwgIktlcm5lbCIgaXMgdW5p
dmVyc2FsbHkNCj4gdHJhbnNsYXRlZCBhcyAi5qC45b+DIiAoZS5nLiwgTGludXggS2VybmVsIC0+
IExpbnV4IOaguOW/gywgS2VybmVsIHNwYWNlIC0+DQo+IOaguOW/g+epuumWkykuDQo+DQo+IEl0
IGlzIHRydWUgdGhhdCAiQ29yZSIgaXMgYWxzbyB0cmFuc2xhdGVkIGFzICLmoLjlv4MiIGluIFRh
aXdhbiwgd2hpY2gNCj4gY3JlYXRlcyBhIGxleGljYWwgb3ZlcmxhcC4gSG93ZXZlciwgVGFpd2Fu
ZXNlIGRldmVsb3BlcnMgYXJlIGVudGlyZWx5DQo+IHVzZWQgdG8gcmVseWluZyBvbiB0aGUgY29u
dGV4dCB0byBkaWZmZXJlbnRpYXRlIHRoZW0uIEluIHRoZSBjb250ZXh0DQo+IG9mIG9wZXJhdGlu
ZyBzeXN0ZW1zIGFuZCBMaW51eCBkb2N1bWVudGF0aW9uLCBsb2NhbCBkZXZlbG9wZXJzIHdpbGwN
Cj4gbmF0aXZlbHkgbWFwICLmoLjlv4MgQVBJIiB0byAiS2VybmVsIEFQSSIgd2l0aG91dCBhbnkg
Y29uZnVzaW9uLg0KPg0KPiBJZiB5b3UgZmVlbCBpdCBtaWdodCBzdGlsbCBiZSB0b28gYW1iaWd1
b3VzLCBhbm90aGVyIGNvbW1vbiBwcmFjdGljZQ0KPiBpbiBUYWl3YW4gaXMgdG8gc2ltcGx5IGtl
ZXAgdGhlIEVuZ2xpc2ggd29yZCBmb3IgdGVjaG5pY2FsIHByZWNpc2lvbi4NCj4gV2UgY291bGQg
Y2hhbmdlIGl0IHRvICJMaW51eCDmoLjlv4MgQVBJIiBvciBqdXN0IGxlYXZlIGl0IGFzICJrZXJu
ZWwgQVBJIi4NCj4NCj4gRm9yIGxvY2FsIGRldmVsb3BlcnMsIHRoZSBjdXJyZW50IHRyYW5zbGF0
aW9uICLmoLjlv4MgQVBJIiBpcyBwZXJmZWN0bHkNCj4gbmF0dXJhbCwgYnV0IEkgYW0gaGFwcHkg
dG8gc2VuZCBhIHYyIHBhdGNoIHRvIGFkanVzdCB0aGlzIHNwZWNpZmljDQo+IHBocmFzZSBpZiB5
b3UgcHJlZmVyLiBQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cyENCg0KSWYgbG9jYWwg
ZGV2ZWxvcGVycyBoYXZlIG5vIHByb2JsZW0gd2l0aCB0aGlzIHBhcnQsIEkgYW0gZmluZSB0b28u
DQoNClJldmlld2VkLWJ5OiBEb25nbGlhbmcgTXUgPGR6bTkxQGh1c3QuZWR1LmNuPg0KDQo+DQo+
IEJlc3QgcmVnYXJkcywNCj4gQ2hlbiBZb3UNCj4NCj4NCj4gRG9uZ2xpYW5nIE11IDxtdWRvbmds
aWFuZ2FiY2RAZ21haWwuY29tPiDmlrwgMjAyNuW5tDXmnIgyOeaXpemAseS6lCDkuIvljYgxMjoz
NOWvq+mBk++8mg0KPiA+DQo+ID4gT24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgMTI6MTTigK9QTSBD
SEVOLVlPVS0wMzMxIDxjaGVueW91OTEwMzMxQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+
ID4gVHJhbnNsYXRlIFBSQyB0ZWNoIHRlcm1zIGludG8gVGFpd2FuZXNlIHRlY2ggdGVybXMgKGUu
Zy4sDQo+ID4gPiDlhafmoLggLT4g5qC45b+DLCDku6PnorwgLT4g56iL5byP56K8LCDou5/ku7Yg
LT4g6Luf6auUKSB0byBpbXByb3ZlDQo+ID4gPiByZWFkYWJpbGl0eSBmb3IgbG9jYWwgZGV2ZWxv
cGVycy4gQWxzbywgcmVwaHJhc2Ugc2V2ZXJhbA0KPiA+ID4gYXdrd2FyZCBzZW50ZW5jZXMgdG8g
bWFrZSB0aGUgZG9jdW1lbnQgbW9yZSBmbHVlbnQuDQo+ID4NCj4gPiBJIGFtIG5vdCB2ZXJ5IGZh
bWlsaWFyIHdpdGggVGFpd2FuZXNlIHRlY2ggdGVybXMuIEFmdGVyIGNoZWNraW5nIHdpdGgNCj4g
PiBMTE1zLCBJIGFtIGFsbW9zdCBmaW5lIHdpdGggdGhlc2UgdGVybSBjaGFuZ2VzLCBleGNlcHQg
b25lIHBsYWNlLg0KPiA+DQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ0hFTi1ZT1UtMDMz
MSA8Y2hlbnlvdTkxMDMzMUBnbWFpbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAuLi4vemhfVFcv
cHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0ICAgICAgICAgICAgfCA0NSArKysrKysrKystLS0tLS0t
LS0tDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9u
cygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9UVy9wcm9jZXNzLzguQ29uY2x1c2lvbi5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9UVy9wcm9jZXNzLzguQ29uY2x1c2lvbi5yc3QNCj4gPiA+IGluZGV4IGQxNjM0NDIx
YjYyYy4uODIzOTY5Y2Y3OTNkIDEwMDY0NA0KPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfVFcvcHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0DQo+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9UVy9wcm9jZXNzLzguQ29uY2x1c2lvbi5yc3QNCj4g
PiA+IEBAIC0xNCw0MiArMTQsNDEgQEANCj4gPiA+DQo+ID4gPiAgLi4gX3R3X2RldmVsb3BtZW50
X2NvbmNsdXNpb246DQo+ID4gPg0KPiA+ID4gLeabtOWkmuS/oeaBrw0KPiA+ID4gK+abtOWkmuiz
h+ioig0KPiA+ID4gID09PT09PT09DQo+ID4gPg0KPiA+ID4gLemXnOaWvExpbnV45YWn5qC46ZaL
55m85ZKM55u46Zec5Li76aGM55qE5L+h5oGv5L6G5rqQ5b6I5aSa44CC6aaW5YWI5piv5Zyo5YWn
5qC45rqQ5Luj56K85YiG55m85Lit5om+5Yiw55qEDQo+ID4gPiAt5paH5qqU55uu6YyE44CC6aCC
57SaDQo+ID4gPiAr6Zec5pa8TGludXjmoLjlv4Pplovnmbzlkoznm7jpl5zkuLvpoYznmoTos4fo
qIrkvobmupDlvojlpJrjgILpppblhYjmmK/lnKjmoLjlv4Pljp/lp4vnorzliIbnmbzkuK3mib7l
iLDnmoQNCj4gPiA+ICvmlofku7bnm67pjITjgILpoILntJoNCj4gPiA+ICA6cmVmOmBEb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL2hvd3RvLnJzdCA8dHdfcHJvY2Vzc19o
b3d0bz5gDQo+ID4gPiAg5paH5Lu25piv5LiA5YCL6YeN6KaB55qE6LW36bue77ybDQo+ID4gPiAg
OnJlZjpgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9zdWJtaXR0aW5n
LXBhdGNoZXMucnN0IDx0d19zdWJtaXR0aW5ncGF0Y2hlcz5gDQo+ID4gPiAt5Lmf5piv5omA5pyJ
5YWn5qC46ZaL55m85Lq65ZOh6YO95oeJ6Kmy6Zax6K6A55qE5YWn5a6544CC6Kix5aSa5YWn6YOo
5YWn5qC4QVBJ6YO95piv5L2/55Soa2VybmVsZG9j5qmf5Yi2DQo+ID4gPiAt6KiY6YyE55qE77yb
4oCcbWFrZSBodG1sZG9jc+KAneaIluKAnG1ha2UgcGRmZG9jc+KAneWPr+eUqOaWvOS7pUhUTUzm
iJZQREbmoLzlvI/nlJ/miJDpgJnkupvmlofmqpQNCj4gPiA+IC3vvIjlhJjnrqHmn5Dkupvnmbzo
oYzniYjmj5DkvpvnmoR0ZXjniYjmnKzmnIPpgYfliLDlhafpg6jpmZDliLbvvIznhKHms5XmraPn
orromZXnkIbmlofmqpTvvInjgIINCj4gPiA+IC0NCj4gPiA+IC3kuI3lkIznmoTntrLnq5nlnKjl
kITlgIvntLDnr4DlsaTmrKHkuIroqI7oq5blhafmoLjplovnmbzjgILmnKzmlofkvZzogIXmg7Po
rJnomZvlnLDlu7rorbDnlKggaHR0cHM6Ly9sd24ubmV0Lw0KPiA+ID4gLeS9nOeIsuS+hua6kO+8
m+aciemXnOioseWkmueJueWumuWFp+aguOS4u+mhjOeahOS/oeaBr+WPr+S7pemAmumBjuS7peS4
i+e2suWdgOeahCBMV04g5YWn5qC457Si5byV5om+5Yiw77yaDQo+ID4gPiAr5Lmf5piv5omA5pyJ
5qC45b+D6ZaL55m85Lq65ZOh6YO95oeJ6Kmy6Zax6K6A55qE5YWn5a6544CC6Kix5aSa5YWn6YOo
5qC45b+DQVBJ6YO95piv5L2/55Soa2VybmVsZG9j5qmf5Yi2DQo+ID4NCj4gPiAi5qC45b+DQVBJ
IiBtYXkgY2F1c2UgY29uZnVzaW9uIHRvIG1lLCB3aGljaCBtZWFucyAiY29yZSBBUEkiIG90aGVy
IHRoYW4NCj4gPiAia2VybmVsIEFQSSIuDQo+ID4NCj4gPiBEb25nbGlhbmcgTXUNCj4gPg0KPiA+
ID4gK+iomOmMhOeahO+8m+KAnG1ha2UgaHRtbGRvY3PigJ3miJbigJxtYWtlIHBkZmRvY3PigJ3l
j6/nlKjmlrzku6VIVE1M5oiWUERG5qC85byP55Sf5oiQ6YCZ5Lqb5paH5Lu2DQo+ID4gPiAr77yI
5YSY566h5p+Q5Lqb55m86KGM54mI5o+Q5L6b55qEdGV454mI5pys5pyD6YGH5Yiw5YWn6YOo6ZmQ
5Yi277yM54Sh5rOV5q2j56K66JmV55CG5paH5Lu277yJ44CCDQo+ID4gPg0KPiA+ID4gK+S4jeWQ
jOeahOe2suermeWcqOWQhOWAi+e0sOevgOWxpOasoeS4iuiojuirluaguOW/g+mWi+eZvOOAguac
rOaWh+S9nOiAheaDs+ismeiZm+WcsOW7uuitsOeUqCBodHRwczovL2x3bi5uZXQvDQo+ID4gPiAr
5L2c54iy5L6G5rqQ77yb5pyJ6Zec6Kix5aSa54m55a6a5qC45b+D5Li76aGM55qE6LOH6KiK5Y+v
5Lul6YCa6YGO5Lul5LiL57ay5Z2A55qEIExXTiDmoLjlv4PntKLlvJXmib7liLA6DQo+ID4gPiAg
ICBodHRwOi8vbHduLm5ldC9rZXJuZWwvaW5kZXgvDQo+ID4gPg0KPiA+ID4gLemZpOatpOS5i+Wk
lu+8jOWFp+aguOmWi+eZvOS6uuWToeeahOS4gOWAi+WvtuiytOizh+a6kOaYr++8mg0KPiA+ID4g
K+mZpOatpOS5i+Wklu+8jOaguOW/g+mWi+eZvOS6uuWToeeahOS4gOWAi+WvtuiytOizh+a6kOaY
r++8mg0KPiA+ID4NCj4gPiA+ICAgIGh0dHBzOi8va2VybmVsbmV3Ymllcy5vcmcvDQo+ID4gPg0K
PiA+ID4gLeeVtueEtu+8jOS5n+S4jeaHieipsuW/mOiomCBodHRwczovL2tlcm5lbC5vcmcvIO+8
jOmAmeaYr+WFp+aguOeZvOS9iOS/oeaBr+eahOacgOe1guS9jee9ruOAgg0KPiA+ID4gK+eVtueE
tu+8jOS5n+S4jeaHieipsuW/mOiomCBodHRwczovL2tlcm5lbC5vcmcvIO+8jOmAmeaYr+aguOW/
g+eZvOS9iOizh+ioiueahOacgOe1guS9jee9ruOAgg0KPiA+ID4NCj4gPiA+IC3pl5zmlrzlhafm
oLjplovnmbzmnInlvojlpJrmm7jvvJoNCj4gPiA+ICvpl5zmlrzmoLjlv4PplovnmbzmnInlvojl
pJrmm7jvvJoNCj4gPiA+DQo+ID4gPiAgICDjgIpMaW51eOioreWCmempheWLleeoi+W6j+OAi+es
rOS4ieeJiO+8iEpvbmF0aGFuIENvcmJldOOAgUFsZXNzYW5kcm8gUnViaW5p5ZKMR3JlZyBLcm9h
aCBIYXJ0bWFu77yJDQo+ID4gPiAgICDnt5rkuIrniYjmnKzlnKggaHR0cDovL2x3bi5uZXQva2Vy
bmVsL2xkZDMvDQo+ID4gPg0KPiA+ID4gLSAg44CKTGludXjlhafmoLjoqK3oqIjoiIflr6bnj77j
gIvvvIhSb2JlcnQgTG92Ze+8iQ0KPiA+ID4gKyAg44CKTGludXjmoLjlv4PoqK3oqIjoiIflr6bn
j77jgIvvvIhSb2JlcnQgTG92Ze+8iQ0KPiA+ID4NCj4gPiA+IC0gIOOAiua3seWFpeeQhuino0xp
bnV45YWn5qC444CLKERhbmllbCBCb3ZldOWSjE1hcmNvIENlc2F0ae+8iQ0KPiA+ID4gKyAg44CK
5rex5YWl55CG6KejTGludXjmoLjlv4PjgIsoRGFuaWVsIEJvdmV05ZKMTWFyY28gQ2VzYXRp77yJ
DQo+ID4gPg0KPiA+ID4gIOeEtuiAjO+8jOaJgOaciemAmeS6m+abuOmDveacieS4gOWAi+WFseWQ
jOeahOe8uum7nu+8muWug+WAkeS4iuaetuaZguWwseW+gOW+gOacieS6m+mBjuaZgu+8jOiAjOS4
lOW3sue2k+S4iuaetg0KPiA+ID4gLeS4gOauteaZgumWk+S6huOAguS4jemBju+8jOWcqOmCo+ij
j+mChOaYr+WPr+S7peaJvuWIsOebuOeVtuWkmueahOWlveS/oeaBr+OAgg0KPiA+ID4gK+S4gOau
teaZgumWk+S6huOAguS4jemBju+8jOWcqOmCo+ijj+mChOaYr+WPr+S7peaJvuWIsOebuOeVtuWk
mueahOWlveizh+ioiuOAgg0KPiA+ID4NCj4gPiA+IC3mnInpl5xnaXTnmoTmlofmqpTvvIzoq4vo
qKrllY/vvJoNCj4gPiA+ICvmnInpl5xnaXTnmoTmlofku7bvvIzoq4voqKrllY/vvJoNCj4gPiA+
DQo+ID4gPiAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9zb2Z0d2FyZS9zY20vZ2l0L2Rv
Y3MvDQo+ID4gPg0KPiA+ID4gQEAgLTU4LDE2ICs1NywxNiBAQA0KPiA+ID4gIOe1kOirlg0KPiA+
ID4gID09PT0NCj4gPiA+DQo+ID4gPiAt56Wd6LOA5omA5pyJ6YCa6YGO6YCZ56+H5YaX6ZW355qE
5paH5qqU55qE5Lq644CC5biM5pyb5a6D6IO95aSg5bmr5Yqp5oKo55CG6KejTGludXjlhafmoLjm
mK/lpoLkvZXplovnmbznmoTvvIwNCj4gPiA+ICvnpZ3os4DmiYDmnInpgJrpgY7pgJnnr4flhpfp
lbfnmoTmlofku7bnmoTkurrjgILluIzmnJvlroPog73lpKDluavliqnmgqjnkIbop6NMaW51eOag
uOW/g+aYr+WmguS9lemWi+eZvOeahO+8jA0KPiA+ID4gIOS7peWPiuaCqOWmguS9leWPg+iIh+mA
meWAi+mBjueoi+OAgg0KPiA+ID4NCj4gPiA+IC3mnIDlvozvvIzph43opoHnmoTmmK/lj4PoiIfj
gILku7vkvZXplovmupDou5/ku7bpoIXnm67pg73kuI3mnIPotoXpgY7lhbbosqLnjbvogIXmipXl
haXlhbbkuK3nmoTnuL3lkozjgIJMaW51eA0KPiA+ID4gLeWFp+aguOeahOeZvOWxlemAn+W6puWS
jOS7peWJjeS4gOaoo+W/q++8jOWboOeIsuWug+W+l+WIsOS6huWkp+mHj+mWi+eZvOS6uuWToeea
hOW5q+WKqe+8jOS7luWAkemDveWcqOWKquWKm+S9v+Wugw0KPiA+ID4gLeiuiuW+l+abtOWlveOA
guWFp+aguOaYr+S4gOWAi+acgOaIkOWKn+eahOS+i+WtkO+8jOiqquaYjuS6hueVtuaIkOWNg+S4
iuiQrOeahOS6uueIsuS6huS4gOWAi+WFseWQjOeahOebruaomeS4gOi1tw0KPiA+ID4gK+acgOW+
jO+8jOmHjeimgeeahOaYr+WPg+iIh+OAguS7u+S9lemWi+a6kOi7n+mrlOWwiOahiOmDveS4jeac
g+i2hemBjuWFtuiyoueNu+iAheaKleWFpeWFtuS4reeahOe4veWSjOOAgkxpbnV4DQo+ID4gPiAr
5qC45b+D55qE55m85bGV6YCf5bqm5ZKM5Lul5YmN5LiA5qij5b+r77yM5Zug54iy5a6D5b6X5Yiw
5LqG5aSn6YeP6ZaL55m85Lq65ZOh55qE5bmr5Yqp77yM5LuW5YCR6YO95Zyo5Yqq5Yqb5L2/5a6D
DQo+ID4gPiAr6K6K5b6X5pu05aW944CC5qC45b+D5piv5LiA5YCL5pyA5oiQ5Yqf55qE5L6L5a2Q
77yM6Kqq5piO5LqG55W25oiQ5Y2D5LiK6JCs55qE5Lq654iy5LqG5LiA5YCL5YWx5ZCM55qE55uu
5qiZ5LiA6LW3DQo+ID4gPiAg5bel5L2c5pmC77yM5Y+v5Lul5YGa5Ye65LuA6bq844CCDQo+ID4g
Pg0KPiA+ID4gLeS4jemBju+8jOWFp+aguOe4veaYr+WPr+S7peW+nuabtOWkp+eahOmWi+eZvOS6
uuWToeWfuuekjuS4reeNsuebiuOAgue4veacieabtOWkmueahOW3peS9nOimgeWBmuOAguS9huaY
r+WQjOaoow0KPiA+ID4gLemHjeimgeeahOaYr++8jExpbnV455Sf5oWL57O757Wx5Lit55qE5aSn
5aSa5pW45YW25LuW5Y+D6IiH6ICF5Y+v5Lul6YCa6YGO54iy5YWn5qC45YGa5Ye66LKi54276ICM
5Y+X55uK44CC5L2/DQo+ID4gPiAt5Luj56K86YCy5YWl5Li757ea5piv5o+Q6auY5Luj56K86LOq
6YeP44CB6ZmN5L2O57at6K235ZKM5YiG55m85oiQ5pys44CB5o+Q6auY5bCN5YWn5qC46ZaL55m8
5pa55ZCR55qE5b2x6Z+/56iL5bqmDQo+ID4gPiAr5LiN6YGO77yM5qC45b+D57i95piv5Y+v5Lul
5b6e5pu05aSn55qE6ZaL55m85Lq65ZOh5Z+656SO5Lit542y55uK44CC57i95pyJ5pu05aSa55qE
5bel5L2c6KaB5YGa44CC5L2G5piv5ZCM5qijDQo+ID4gPiAr6YeN6KaB55qE5piv77yMTGludXjn
lJ/mhYvns7vntbHkuK3nmoTlpKflpJrmlbjlhbbku5blj4PoiIfogIXlj6/ku6XpgJrpgY7niLLm
oLjlv4PlgZrlh7rosqLnjbvogIzlj5fnm4rjgILkvb8NCj4gPiA+ICvnqIvlvI/norzpgLLlhaXk
uLvnt5rmmK/mj5Dpq5jnqIvlvI/norzlk4Hos6rjgIHpmY3kvY7ntq3orbflkozliIbnmbzmiJDm
nKzjgIHmj5Dpq5jlsI3moLjlv4PplovnmbzmlrnlkJHnmoTlvbHpn7/nqIvluqYNCj4gPiA+ICDn
rYnnmoTpl5zpjbXjgILpgJnmmK/kuIDnqK7lhbHotI/nmoTlsYDpnaLjgILllZPli5XkvaDnmoTn
t6jovK/lmajvvIzkvobliqDlhaXmiJHlgJHlkKfvvJvkvaDmnIPpnZ7luLjlj5fmraHov47nmoTj
gIINCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gMi40My4wDQo+ID4gPg0KPiA+ID4NCg==
