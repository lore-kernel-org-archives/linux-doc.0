Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752E1366075
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936898; cv=pass; b=lnpSrp8eIeu9HRFAc4qnlInyZFYBQuDUqf2TJfmXD+q3smdVq7x9/afAN29vRuYIDPE0SrSlMGAPFEUdTRiGi8nOTVXtWBYHS1T0x7WZIaRtaXVs1T4UaLSrvhTmCIMTIUQ2LRdNSTLi9yvF02jrN9xBnT13C9w47W4gjfDjqZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936898; c=relaxed/simple;
	bh=I8715DNTLGOkP5P/uFnMenvwDnI+sF4zZ4LRY5Jxur4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VVDCqMJ8FuPubxLSx0JxATeKBMYzUOZx4rjUsQ2YyqKwjUCAYMI8xU9SERxE9jQoQXLJpDIRSQTiX0yj6NONGTZOcgTVacbyVpvajk0+RzCTRd0uc4T4oHSGoQ7tfrJIVgjhhZ+CMP8Jz+nQ7uKDY16YvSdOlAIzkqzAd0cqXTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rxp5xuAK; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rxp5xuAK"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b21f09ec76so3657256b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 23:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788936895; cv=none;
        d=google.com; s=arc-20260327;
        b=Bg2bpUYMpLqPkinxlY3c8P5inIpaSNHv2djPyl6R3aXdwxxY06R0bH4UdYLLKtvoyf
         +/oO82vj30XJnSJ28DW+cwl1KQHak82LgYqsh/desDzfKKTWpqwqsyd5DI/qvmSWBuGT
         uSSAgKlx6Pg4nwGmVClk3ymr1v8E4lCzBZiWPQJI2kheA0fdAveMc2KaNYIyByKisAJD
         5dPTAAlEYfk3Pn/t7wCul86I/9tv3lERbzbXXPPR6KMNjHKl8DOU/h5+vdmxj8M0sH/U
         XRNGVwbfbxsZLSlZjJw1XxT0IFlFc49f+ihFNaAWX7ArpKxaHp5/LzC/g+9Qs0U5CMPz
         H15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=I8715DNTLGOkP5P/uFnMenvwDnI+sF4zZ4LRY5Jxur4=;
        fh=pOMoc3ibWLWzMLxxikhXV84PiZx2ZF60/Cizx2vRaFw=;
        b=S6n3VMRt6Jq+ugXhrjNtemrsGMpdkWA+9rL3SNUZAUOEbkjbmCpuxHN/q1siKbBwv+
         Yiwixc6P4KG1xqFIVv7ft29SM700J8kG4Nbf+2zLx7Er6HXITQpw5912zgkTALq80ABj
         lXbT4Kh/CvA3Fqt8hKyEUh1KfHDeveRwqt3OtAGoFUeYeP8Ztm8ITdo+VqjCgdWO7xRV
         w5nZQuyWPTBCghVn3/4hI3umxDcG+I9ToHeTWk7m9D95dsAg+LzV++rmzqkDKQP+Yy84
         +dJWZHjLjirt6zy9EHSFW5M0ZDYCO4ujDbh3C3PhK6aVJZwW4i+7tYKdPNJ43XO+Efc7
         jgWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936895; x=1789541695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8715DNTLGOkP5P/uFnMenvwDnI+sF4zZ4LRY5Jxur4=;
        b=Rxp5xuAKkkZEPCGQq25vo8GSrTQaWEMHAm6Y3zB0ztYB2m0XpmkJy+NoWk0punhpgh
         A5wLUzArNDxNxOnOO+/IT/CqjuqoEbbKJfA0YXEzBET6B5CT8OAmfnNQIPsbbLSp6DlZ
         v5uEYyfArygG4RgZ3Z8b5CoOJ19HUof/AaGbbzjb7Lj7Y2DfTG9xCDsUQKOjqmx5KcZU
         HTPwGdElG5h9ZV091EYE9Mb2SM5wgFikluvFDyRc2jCyOS+dUDhdEGvGde2ROW4PxMZo
         AurzRRo8yqavDmB7Vq9HrEIx1NiiEwPaTXCleQ19JFsuktuTHQjkHcqAuQb4pfeILGwj
         LgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936895; x=1789541695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I8715DNTLGOkP5P/uFnMenvwDnI+sF4zZ4LRY5Jxur4=;
        b=qEhoNWUh5J2GulJ/blWtl+yWAwtowOlCAfx1tleqRaOhEFqUSp2arbkkcK7mED6rrX
         xR4RmW0yeHNTwzp1bRYBalCY0yqm+CeOhe2VIn0kK39rZ/JXRxGPKahSvGLNyLAnb2qE
         Rotrdp7/wjMf4jyBz66QRcQPVWOs812Bel7RtpDkidZ78gEncMw18R4m7NPoJBqPX7o5
         i3VnZhlG0+DeSjwOJE1sSFLGpPRVTblzjrtS+jdmk84pEJzN6ppZtvG3hF5k9OK3vVMi
         3WoFUK9mgaxxB/GP1r7MKgMEADV/SQhDEtzWQVU9nOT3+Nr+jGxaB15m21od8XD5GDyE
         2hOA==
X-Gm-Message-State: AFuF++kH1UTxT0s0qFj/2LbggD5N0zRRsnLI5SkNwvfFG3oKOxoONj5R
	dnafYzv+uaXJ/TlgGupiZuV5amT4PYBV3hFgzmmPPT2HidieWCp9lMV6HzSok1KNOoxTHOoL63h
	7cI7AOgJmH9GXsCmlIjmOaDu1Zn7iDjw=
X-Gm-Gg: AYBFou0qqUafYOLjtF+dNQ46JsXqfOdIvjobi/8XA4UHhHYmrp53qC6kFa+gfxAydX6
	MSNrIKSE4DGn+bdL6tKs4NBtGtPgTUjvohwUs5hvpkbXg6PQVIY3NGaPuRn4BdlzdJBHECHMzyz
	57UVttlp1V5FJKMS+C0wLYzjBb1J6E/da3VrbwHwbFowssJf+3a2wNr1UiqLhQp1YQvIyK5v7hY
	sZySbwwKB7FzmqxAqIw5GC8flvBh73JC3QX5pw1dugRUCSNIpn+jJqzX6T361vsfDQtBI99b3Ie
	qsUCvL084cQEIplw2FQ4CCcp1Y9WTEywtI668zLIya+eTEpaYMJAIsXHV0a7vNSRxLE=
X-Received: by 2002:a05:6820:a292:10b0:6ba:1878:2a6c with SMTP id
 006d021491bc7-6ba187832cdmr7276043eaf.4.1788936895023; Tue, 08 Sep 2026
 23:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Wed, 9 Sep 2026 08:54:43 +0200
X-Gm-Features: AcwNN1XDaCilWiPr-uFCjcxorIqiI0Z0CaG_ulWwoxu1CjI-ls--3JQKiWpgzPY
Message-ID: <CAMnqnYwK6HDwV3jRLNWYTfB_w2NmQYn=LRQ41VoWYU53CWd6FA@mail.gmail.com>
Subject: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, "corbet@lwn.net" <corbet@lwn.net>, dzm91@hust.edu.cn, 
	alexs@kernel.org, si.yanteng@linux.dev, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, rdunlap@infredead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

U3ViamVjdDogW1BBVENIXSBkb2NzL3poX0NOOiBhZGQgQ2hpbmVzZSB0cmFuc2xhdGlvbiBmb3Ig
dXNiL29oY2kucnN0DQoNClRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdCBpbnRv
IENoaW5lc2UgU2ltcGxpZmllZC4NCg0KVGhlIHRyYW5zbGF0aW9uIGNvdmVycyBPSENJIGRyaXZl
ciBvdmVydmlldywgaGFyZHdhcmUgcHJvdG9jb2wNCmRpZmZlcmVuY2VzIChPSENJIHZzIFVIQ0kp
LCBpbXByb3ZlbWVudHMgc2luY2UgMi40IGtlcm5lbCwNCnF1ZXVlYWJsZSBpbnRlcnJ1cHQgdHJh
bnNmZXJzLCBhbmQgbm9uLVBDSSBzdXBwb3J0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKaWFtaW5nIE91
eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4NCi0tLQ0KIC4uLi90cmFuc2xhdGlvbnMv
emhfQ04vdXNiL2luZGV4LnJzdCAgICAgICAgICB8ICAyICstDQogRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0IHwgMzcgKysrKysrKysrKysrKysrKysrKw0KIDIg
ZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QN
Cg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRl
eC5yc3QNCmIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdA0K
aW5kZXggZGY5OTgxNGM2NDk3Li5jOTZlYWNmMTNlMTEgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQorKysgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQpAQCAtMzIsNiArMzIsNyBAQCBVU0Ig
5pSv5oyBDQogICAgIGNoaXBpZGVhDQogICAgIGR3YzMNCiAgICAgZWhjaQ0KKyAgICBvaGNpDQog
ICAgIHVzYm1vbg0KDQog5b6F57+76K+R5paH5qGj77yaDQpAQCAtNDksNyArNTAsNiBAQCBVU0Ig
5pSv5oyBDQogKiBtYXNzLXN0b3JhZ2UNCiAqIG1pc2NfdXNic2V2c2VnDQogKiBtdG91Y2h1c2IN
Ci0qIG9oY2kNCiAqIHJhdy1nYWRnZXQNCiAqIHVzYmlwX3Byb3RvY29sDQogKiB1c2Itc2VyaWFs
DQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2ku
cnN0DQpiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uODQ2OWY1NjU5ZjhkDQotLS0g
L2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hj
aS5yc3QNCkBAIC0wLDAgKzEsMzcgQEANCisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMA0KKw0KKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QNCisNCis657+7
6K+ROiDmrKfpmLPlrrbpk60gSmlhbWluZyBPdXlhbmcgPGppYW1pbmdvdXlhbmcxM0BnbWFpbC5j
b20+DQorDQorPT09PT09PT0NCitPSENJ6amx5YqoDQorPT09PT09PT0NCisNCisyMDI25bm0Oeac
iDfml6UNCisNCivigJxPSENJLUhDROKAnempseWKqOeoi+W6j+aYr+S4gOS4qlVTQuS4u+acuuaO
p+WItuWZqOeoi+W6j++8iEhDRO+8ie+8jOWug+a6kOiHqjIuNOWGheaguOezu+WIl+S4reeahOKA
nHVzYi1vaA0KK2Np4oCd6amx5Yqo56iL5bqP44CC4oCcdXNiLW9oY2nigJ3ku6PnoIHkuLvopoHn
lLEgUm9tZW4gV2Vpc3NnYWVyYmVyIDx3ZWlzc2dAdmllbm5hLmF0Pue8luWGmQ0KK+S9huS5n+iO
t+W+l+S6huiuuOWkmuWFtuS7luS6uueahOi0oeeMru+8iOivt+mYheivu+WFtueJiOadg++8ieOA
gg0KKw0KK+Wug+aUr+aMgeKAnOW8gOaUvuS4u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iE9IQ0nv
vInvvIzor6XmjqXlj6PmoIflh4bljJbkuobnlKjkuo7kuI5VU0IgMS4x5Li75py65o6n5Yi25Zmo
6YCa5L+h55qEDQor56Gs5Lu25a+E5a2Y5Zmo5Y2P6K6u44CC4oCc5LiO6Iux54m55bCU5pep5pyf
55qE4oCc6YCa55So5Li75py65o6n5Yi25Zmo5o6l5Y+j4oCd77yIVUhDSe+8ieebuOavlO+8jOWu
g+WwhuabtOWkmuWPquiDveWKn+iDvQ0KK+azqOWFpeWIsOehrOS7tuS4reOAgumZpOiLseeJueWw
lOWSjOWogeebm+S5i+WklueahOWFtuS7luS+m+W6lOWVhueahFVTQjEuMeaOp+WItuWZqOmAmuW4
uOS9v+eUqE9IQ0njgIINCisNCivoh6oyLjTlhoXmoLjku6XmnaXnmoTmm7TmlLnljIXmi6wNCisN
CisgICAgICAgICAtIOaPkOmrmOS6huWBpeWjruaApzsg5L+u5aSN5LqG6ZSZ6K+vOyDlh4/lsJHk
uoblvIDplIANCisgICAgICAgICAtIOaUr+aMgeabtOaWsOWSjOeugOWMlueahHVzYmNvcmUgQVBJ
DQorICAgICAgICAgLSDkuK3mlq3kvKDovpPlj6/ku6Xmm7TlpKfvvIzlubbkuJTlj6/ku6XmjpLp
mJ8NCisgICAgICAgICAtIOmAmui/h+S9v+eUqOS4iuWxguKAnGhjZOKAneahhuaetu+8jOWHj+Ww
keS7o+eggemHjw0KKyAgICAgICAgIC0g5pSv5oyB5LiA5Lqb6Z2eUENJ55qET0hDSeWunueOsA0K
KyAgICAgICAgIC0gLi4uIOS7peWPiuabtOWkmg0KKw0KK+KAnE9IQ0ktaGNk4oCd6amx5Yqo56iL
5bqP5aSE55CG5omA5pyJVVNCIDEuMeS8oOi+k+exu+Wei+OAguaJgOacieexu+Wei+eahOS8oOi+
k+mDveWPr+S7peaOkumYn+OAguWcqOKAnHVzYi1vaGMNCitp4oCd5Lit5Lmf5piv5aaC5q2k77yM
5L2G5Lit5pat5Lyg6L6T6Zmk5aSW44CC5Lul5YmN77yM5L2/55So5LiA5bin55qE5ZGo5pyf5Lya
5Zug5Li6SVJR5aSE55CG55qE5byA6ZSA6ICM5a+86Ie05pWw5o2u5LiiDQor5aSx55qE6aOO6Zmp
44CC5b2T5Lit5pat5Lyg6L6T5o6S6Zif5pe277yM5Y+v5Lul6YCa6L+H56Gu5L+d56Gs5Lu25Zyo
5pON5L2c57O757uf5aSE55CG55u45YWzSVJR5pe25aeL57uI5pyJ5Lyg6L6T6ZyA6KaBDQor5aSE
55CG77yM5p2l5pyA5aSn6ZmQ5bqm55qE6ZmN5L2O6L+Z5Lqb6aOO6Zmp44CCDQorDQorLSBEYXZp
ZCBCcm93bmVsbA0KKyAgPGRicm93bmVsbEB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQorDQotLSAN
CjIuNTMuMA0K
