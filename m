Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62244252D6
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 10:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333852; cv=pass; b=BbOXYwAnRjB/MfHqVcJt10f91IZ79WMJq8CPrbYmv2neFg5/6mYj6thwq30ZVvaSGOG8jvMQ18ZGd6ySqpnb9pIlD2BFI8EeVIdrEcUTfGKcZj7l78O86qHxJQyNBnZmC74vMsEbxtBxTe+nsopwccIsll9nve+TwaHDXajbTvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333852; c=relaxed/simple;
	bh=I8715DNTLGOkP5P/uFnMenvwDnI+sF4zZ4LRY5Jxur4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mi+U4D1OXjL52HLyJRCjArLmjHWP03jtU9M0JeVH7BP3qVq1yDyqsJLYm5TNyXVEw4HcmSddh/u5xtu+jNsW8DaD7x3An0lEf5pIcPLp48E0IOu+r/coPSEmqNYeNLD+k6z5sjP4sBQM1q5xynywraQ9E3g+L3Wd3TFja0cE2Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBosvCol; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBosvCol"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4c0cd10d56fso1050065b6e.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 03:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790333848; cv=none;
        d=google.com; s=arc-20260327;
        b=aT04hg1k6udFBRzKHoz2I88qDXa+lsap6MDMwythPzAUbxuCE/k447CsLcE3MlNe62
         qYz7vrCIsmZ3bkgru1ikEF4JoSBiP8EyLWc8X/9amxTx+SuBaucYa9Qwn4ATKkd7sAZX
         XVA4W/1XRWxA7PXtWuIiUvLuLGLbs7Mqwfl8RKdvrY+seE2Q8B7xVdzUN5QVPKdt1tn/
         MH+y7p3uqUhL6zkT2Q3vrUFTX5EyweOwUIM+FBLpkDBINhgOsHYuPUkNXH0AbkijjklR
         taeXxPLeMYYq93C7Vh+O/qiAE1rJE6GCRJZigsp7LePQm0E+J/r+a5Yx3Lu6zjDZrXau
         raEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=I8715DNTLGOkP5P/uFnMenvwDnI+sF4zZ4LRY5Jxur4=;
        fh=m71xg3gPJZsQQLajVMPxrihhs4S/or4OOwgFnzwz2Bk=;
        b=OHVXP7JwYD4JRtEy0Ck3eRaDxsZv7+vzeooJHKtZ3ljBTLYlw0joa5cAndLyJUuPQy
         Qu5SCO9hvywYeV5PHOLamH4eoclPGjrpi09NqevVlA2JZPf8uT/XheDHfC1GSUMwDDJF
         3zJPdIBT/LddHLOqyTGGL0ITzewAw3ike9JKEh3+UMiVBoAk6GDWBQY8/473ggkfXoQR
         omcAl83IX6+FTnI1gbhZu+j1Ww7lET5ddYu9hSKMds3kUf6catpTmjoy8a92T5v16JL5
         bmQuNeJLnnuoE5A2Q2VDS306Y2cnjCalwv1yPKItaYRf3tjXUDfirf3YwBFDluMA27kp
         LcDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790333848; x=1790938648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8715DNTLGOkP5P/uFnMenvwDnI+sF4zZ4LRY5Jxur4=;
        b=PBosvColjdUcACz2IGg9dW2Jkzpz3yKO6wGtSb0mUyiT3O7PnOMDbpBYP6hjruSovz
         xsMX+i3PmOW1R0SVDF9vxZRH8571BXLnplna9OghFSqBomt+NC78jK/uLgiEr2Jb22Nd
         cT0KOzm0NemjIBD9GtQAzRQVZRhlywhdOXY34GKAiC3HyJUVoZj/sotb+lUEf6oHmFSq
         1/cUO87L/nUp18ALWP+2gx8f19JqWf9ccmYsUhbCe1u7TRWdEJgtcqd9RZYqkSinHDas
         59zgMeF/5Iu9XuP7eSDvsb7mw+eRmy4/mwoj5YeBqLAyAIBNMe3xc+PFanxqQ4Qq5Vvu
         nOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790333848; x=1790938648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I8715DNTLGOkP5P/uFnMenvwDnI+sF4zZ4LRY5Jxur4=;
        b=y3vR/XesfONyq97ZeQX2yN6mBE7rZW4C0FI+7lOw+j6EPTcCj+KNCd5OMQ91UexVle
         GvCEUsWSyDYpWfa/W6jYnqboPw+tX/e3tZX821utmosqhNHCIhYxkgulprDqYmYsrwum
         /C15APbY6p3dFZeMjIhp4piliUlU3Goe/wUhn3e2NuxG6xRRILEY8sCY621GjIrUrQSH
         xmdbg/RA/ISnHVf6ZDUy6ttWEEGK5qhO/DUqvlEtZOyJKexMhVbwN7agRohgEQbnvsVP
         73+mnxhCnc9CyYnM+yjnzBONNP/GkTNu+rAwA9tS4ua+xBDiN3vhROTSMOP8sNZHLD7b
         42rw==
X-Gm-Message-State: AFuF++kNk9taZO3BPDvF0bb6enB+B7ZMuXJVppo0KQqWxfRXnfAMtSWW
	yud16mPabwZJKgKUDeCfP5BwTsvpK34Cm7Y6L4r63X3uSVJZY1s9KryfI4dHZ5v6OlaXsC4XyjQ
	ZmyaOrhprbO8QRDrLz/AFhjAzIDMpsFo=
X-Gm-Gg: AYBFou16J0IoM/thMGynkKhVLnG1HPSfXpgbDQeOrPG336ZW/VR5sJN9RF90YGfUEZU
	A/aEZ7hhazI1pSGWkMjfuwYs9Oyr2HyzVfW1I6wCF1OAgY4UpDwR3HrTivrDGOEgmvXkX2jVdDY
	woQWDEZNelV8EZxKnjJ8lRVdEtDztVPTelYWlyNKm8ZKwGLizrzvNzgHd63ug1pqrpbK2aYtWsv
	Qg3fQbg8fiH/RVjg78OlfiwHUm7k6uvdHUS1hoCSaoFay+BlckO4vRd/GCwGs7QSL6qVWwcgOvG
	dFwqjQC/vDA3Z90slO5O2SgXE3C94u6Weo53Zy5b5hVKTzWYr+nplnc=
X-Received: by 2002:a05:6808:448f:b0:4d6:9133:cfe2 with SMTP id
 5614622812f47-4d72cd37de1mr4641293b6e.39.1790333848098; Fri, 25 Sep 2026
 03:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Fri, 25 Sep 2026 12:57:15 +0200
X-Gm-Features: AclHuK-V7mQoeijBd3ybZrm7ihWwwBJxMAsZ6QZMfDao17MHeFox7hIIfUNyQAA
Message-ID: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
Subject: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dzm91@hust.edu.cn, alexs@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, si.yanteng@linux.dev, 
	rdunlap@infradead.org, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
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
