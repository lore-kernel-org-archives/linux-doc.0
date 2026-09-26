Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C995B2D7BF
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417430; cv=pass; b=s99ZNLS3fcWLWAJUJiM7+hKxAL8rHw3tyB57iBiFnaL+JBNZtCfpNPVkz7VM1gedSDM4+11vosi1DFk5cFGEiCdQ3MmM7eQkRgegZSuye38N8tvMd99Lp/6HvC+9OTKZid0Imp2jyIdBW9ZE8gytDYVqTyNurUaYN5jjdmHjSeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417430; c=relaxed/simple;
	bh=0Os3pfspsqHbWB7/+IsBR6tOZ9/A0oT8IgsED+SKOYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4YJcnS12UlDk325x2S3Vy23DGRIxwU18LzRXSGPJpnVY5/8GiYy0/6XVJoM6zQSeKw3h9NUR331Bs4kkMGFPzWHbCllhvw4cCNut/Hnmzvnng65nm8jHIuD51+Me7zbrpoEr5yX4s4QeGecp0mDhgtgS1OOaTllPmnl4IaUwKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxlCp5oO; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxlCp5oO"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46a63c34533so1302607fac.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 03:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790417427; cv=none;
        d=google.com; s=arc-20260327;
        b=rNZytyyF4metcU7WOcZQsGcyr3Xvg4VxvRrmuxi2+nDqj3mG+KSyOwrKtFaXxzF5xJ
         I6E7S18Ep5bKjk+nwld8hl2tkcwPywblaSjJ+vRImVXEsltqS7xodObMOHnt8x+uUa2k
         SsoKEO/YakC3cTVMrIAHLxviGCxSlm3O8isAL2Z/IQso8vpdcoRWufcuSo/GiT8Nobkh
         hN7AhuvVuo+Rbka2U/B0UADrkpMJjlEyFYmZQvgo1fK0X2FWE5jwFJVLAGGQyZXLIKKb
         tnbE8LUwmogHhTD2QjxKAn7yph7fGZm2mDKaUaIv0kqMAURQVBab6HyqLLiMQsSEJWnb
         mqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Os3pfspsqHbWB7/+IsBR6tOZ9/A0oT8IgsED+SKOYQ=;
        fh=3ul3EnvmCKOLatkbr+BHWX0MlkQVJRosFFaMqZaDenI=;
        b=f1TtWR0iwlCIYaGBisHw0Sy9zFfWeJ5ufkoAg4BMi9e1rhWH5dr4dWsTiJFozv1n0z
         9yEdqWA0dPsyUdJb3hJ+MZzEFC8ilVAnYmlW2WjmCaimTZjQ1cT853Z7UBqoKy71B2IK
         J57cXErZpjwsxlzEiTQ2flKIlVf5kF4Qoc5dqhUh7DdZMQfb1F3EgnA5V9B05Ytq1dXO
         q9IlJkXkurVBu0iu+cPU5IiTR1GukrLbwMk+aBGfhnAtvXDQHE+TsV++XnxNByVl6IZD
         1qNB5w8qOtze5YJSnDk2//7u9fzlhuw/kgFFfymoQ6KSP7VQnz7d7VKmwhCuoSv09jhI
         HIng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790417427; x=1791022227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Os3pfspsqHbWB7/+IsBR6tOZ9/A0oT8IgsED+SKOYQ=;
        b=AxlCp5oO+zbYAu1IC5EWPGngurRNTEBgC0TBWkRcCBIJkT+rQGyvXxsPhmcc+L2ffV
         iDPyTolajdpuDXJrf7ZuRtgQaZUdZf52dAhaXg87sp4kLmYYUowBKTwkcP1RobQLVqG7
         h3oyKpPUPTykc3o1kDS642Dv2KlAS5BXWsJFqnGn28lwfGYJSb3PRUVRgVF5wFrCWGVg
         8PCu5x8LXkA2gb/+UPR73uFTfFcKYUEPQmcQgmZh0EB6mjdHStBG3juF+6Gk7x+y9HZJ
         s4ygDTz2oq3LzHHwjlkVNj6fELpGO3zna99/sNapPqDN6fCXeeEpYDAeaAXmLvQ5ciKp
         oLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417427; x=1791022227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Os3pfspsqHbWB7/+IsBR6tOZ9/A0oT8IgsED+SKOYQ=;
        b=O/REXkEaKZhrCWzz8+VSZgThQXt5aHo7oqi7AVMTVKilsN6BEKRUkea6xkpvAe6rOz
         7kJfYqPg9JaBJjy5aeaP6J6zM2KWrCVoyly1l1YJkqawk3x1v+InI8Ic8uWAG9hDhF/m
         S0K+BuLtr0hon1pJ4gP91dZLQnMG8N+5I2RAE6mgofNylsf3unow0fh42/wqfkD5ijGK
         kDgBz0b+x4uUywLzFyEnZ5bZDxirUC8nyieACjsP4LXYwTTMptBueVvSxGGEuJTXWFVg
         oobRdhbII3sgRHXkmQo+LKLjkLbRwj5VQadWS9aAyo4yNbv2yP2pryA4eKJAFUApvcb2
         SU0g==
X-Forwarded-Encrypted: i=1; AKwUvBx0owl98hABOnJUDMBmSQKWd9S9hmOraT0dS/vk1FszzYUC4+xw+BBRIsoWILcdASYLP4CuJLf2uDM=@vger.kernel.org
X-Gm-Message-State: AFuF++mqSFxVSl5lk3WIY7ke2o2Pp/xDtW3/pDTPQyRO8puKLvajvWw0
	qgwoFK48+IYEDyDAEZR9cOHeaOLVIqiYrkIyVK1mHsaGqqM2bPUe51kl5lI1lDjow/YGff5xqks
	BpiWy9Wp6miqgt5fnTaHTsdGQvR6l1q4=
X-Gm-Gg: AYBFou2Zk7kxfSu2YdK5BrwQFUZh3MwOTO4uTYq6E6hXpDi2fgWuFd2loTctN2TyHEQ
	r12SHEEm3mXT13sbulavTMPv5Z4Z2Fmd0HbWxQTLn9MP1TPDw93RlGDOJjhNQ9HZTDYfh0LUv98
	2b+l5r/ALXhl4GrTM3KiBi2MyTJOEY3WKLCg5d1nWD7ut0v0TCZlID59AR8RY6GBnwcFWeq/nk8
	F5s1Xra6bDXURtTn3NH+W1mUpOgUKk//Dg/MAhyHzIxqUSHpara+Ks+okPJoxqSWaW0JrZqvw65
	+A0k1mnJ6QJKosMDP1DOGiXEPKTWho+z1jd2qRpQHelvBP3ZQEGMxamw
X-Received: by 2002:a05:6808:bcc:b0:4b3:7da2:f393 with SMTP id
 5614622812f47-4d72c636b6cmr8941062b6e.15.1790417427530; Sat, 26 Sep 2026
 03:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn> <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
 <2026092601-reassure-darkness-229b@gregkh>
In-Reply-To: <2026092601-reassure-darkness-229b@gregkh>
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Sat, 26 Sep 2026 12:10:16 +0200
X-Gm-Features: AclHuK_PmhLb8Gh308L9mMNLEKeLUlEUkhhQ3UFDEaxAlMSkC-H929WaN-YXZoU
Message-ID: <CAMnqnYwDoNc5=RjEkeRB3-yB+HJvYkrcTBHpPo6cxydSfRMphw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, si.yanteng@linux.dev, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

ZG9jcy96aF9DTjogYWRkIENoaW5lc2UgdHJhbnNsYXRpb24gZm9yIHVzYi9vaGNpLnJzdA0KDQpU
cmFuc2xhdGUgRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QgaW50byBDaGluZXNlIFNpbXBsaWZp
ZWQuDQoNClRoZSB0cmFuc2xhdGlvbiBjb3ZlcnMgT0hDSSBkcml2ZXIgb3ZlcnZpZXcsIGhhcmR3
YXJlIHByb3RvY29sDQpkaWZmZXJlbmNlcyAoT0hDSSB2cyBVSENJKSwgaW1wcm92ZW1lbnRzIHNp
bmNlIDIuNCBrZXJuZWwsDQpxdWV1ZWFibGUgaW50ZXJydXB0IHRyYW5zZmVycywgYW5kIG5vbi1Q
Q0kgc3VwcG9ydC4NCg0KLS0tDQpDaGFuZ2VzIGluIHYyOg0KLSBDb3JyZWN0IHRoZSBkYXRlDQot
IENvcnJlY3QgdGhlIGxheW91dA0KLSBBZGQgc3BlY2lmaWMgZGV0YWlscyBmb3IgaXQncyBjb250
cmlidXRvcnMNCg0KLS0tDQpTaWduZWQtb2ZmLWJ5OiBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291
eWFuZzEzQGdtYWlsLmNvbT4NCi0tLQ0KIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3VzYi9vaGNpLnJzdCB8IDM4ICsrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwg
MzggaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAw
MDAwMDAwMDAuLjVlMzY4MzFiZjM3MA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpAQCAtMCwwICsxLDM4IEBADQorLi4g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCisNCis6T3JpZ2luYWw6IERvY3VtZW50
YXRpb24vdXNiL29oY2kucnN0DQorDQorOue/u+ivkTog5qyn6Ziz5a626ZOtIEppYW1pbmcgT3V5
YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KKw0KKz09PT09PT09DQorT0hDSempseWK
qA0KKz09PT09PT09DQorDQorMjAwMuW5tDjmnIgyM+aXpQ0KKw0KK+KAnE9IQ0ktSENE4oCd6amx
5Yqo56iL5bqP5piv5LiA5LiqVVNC5Li75py65o6n5Yi25Zmo56iL5bqP77yISENE77yJ77yM5a6D
5rqQ6IeqMi405YaF5qC457O75YiX5Lit55qE4oCcdXNiLW9oY2nigJ0NCivpqbHliqjnqIvluo/j
gILigJx1c2Itb2hjaeKAneS7o+eggeS4u+imgeeUsSBSb21hbiBXZWlzc2dhZXJiZXIgPHdlaXNz
Z0B2aWVubmEuYXQ+57yW5YaZ5L2G5Lmf6I63DQor5b6X5LqG5p2l6IeqRGF2aWQgQnJvd25lbGwg
PGRicm93bmVsbEB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+77yMTGludXMgVG9ydmFsZHMNCivlkoxH
cmVnb3J5IFAuIFNtaXRo55qE5pSv5oyB44CCDQorDQor5a6D5pSv5oyB4oCc5byA5pS+5Li75py6
5o6n5Yi25Zmo5o6l5Y+j4oCd77yIT0hDSe+8ie+8jOivpeaOpeWPo+agh+WHhuWMluS6hueUqOS6
juS4jlVTQiAxLjHkuLvmnLrmjqfliLblmajpgJrkv6HnmoQNCivnoazku7blr4TlrZjlmajljY/o
rq7jgILigJzkuI7oi7HnibnlsJTml6nmnJ/nmoTigJzpgJrnlKjkuLvmnLrmjqfliLblmajmjqXl
j6PigJ3vvIhVSENJ77yJ55u45q+U77yM5a6D5bCG5pu05aSa5Y+q6IO95Yqf6IO9DQor5rOo5YWl
5Yiw56Gs5Lu25Lit44CC6Zmk6Iux54m55bCU5ZKM5aiB55ub5LmL5aSW55qE5YW25LuW5L6b5bqU
5ZWG55qEVVNCMS4x5o6n5Yi25Zmo6YCa5bi45L2/55SoT0hDSeOAgg0KKw0KK+iHqjIuNOWGheag
uOS7peadpeeahOabtOaUueWMheaLrA0KKw0KKyAgICAgICAgIC0g5o+Q6auY5LqG5YGl5aOu5oCn
OyDkv67lpI3kuobplJnor687IOWHj+WwkeS6huW8gOmUgA0KKyAgICAgICAgIC0g5pSv5oyB5pu0
5paw5ZKM566A5YyW55qEdXNiY29yZSBBUEkNCisgICAgICAgICAtIOS4reaWreS8oOi+k+WPr+S7
peabtOWkp++8jOW5tuS4lOWPr+S7peaOkumYnw0KKyAgICAgICAgIC0g6YCa6L+H5L2/55So5LiK
5bGC4oCcaGNk4oCd5qGG5p6277yM5YeP5bCR5Luj56CB6YePDQorICAgICAgICAgLSDmlK/mjIHk
uIDkupvpnZ5QQ0nnmoRPSENJ5a6e546wDQorICAgICAgICAgLSAuLi4g5Lul5Y+K5pu05aSaDQor
DQor4oCcT0hDSS1oY2TigJ3pqbHliqjnqIvluo/lpITnkIbmiYDmnIlVU0IgMS4x5Lyg6L6T57G7
5Z6L44CC5omA5pyJ57G75Z6L55qE5Lyg6L6T6YO95Y+v5Lul5o6S6Zif44CC5Zyo4oCcdXNiLW9o
Y2nigJ0NCivkuK3kuZ/mmK/lpoLmraTvvIzkvYbkuK3mlq3kvKDovpPpmaTlpJbjgILku6XliY3v
vIzkvb/nlKjkuIDluKfnmoTlkajmnJ/kvJrlm6DkuLpJUlHlpITnkIbnmoTlvIDplIDogIzlr7zo
h7TmlbDmja7kuKINCivlpLHnmoTpo47pmanjgILlvZPkuK3mlq3kvKDovpPmjpLpmJ/ml7bvvIzl
j6/ku6XpgJrov4fnoa7kv53noazku7blnKjmk43kvZzns7vnu5/lpITnkIbnm7jlhbNJUlHml7bl
p4vnu4jmnInkvKDovpPpnIDopoENCivlpITnkIbvvIzmnaXmnIDlpKfpmZDluqbnmoTpmY3kvY7o
v5nkupvpo47pmanjgIINCisNCistIERhdmlkIEJyb3duZWxsDQorICA8ZGJyb3duZWxsQHVzZXJz
LnNvdXJjZWZvcmdlLm5ldD4NCisNCi0tIA0KMi41My4wDQoNCk9uIFNhdCwgU2VwIDI2LCAyMDI2
IGF0IDk6MTPigK9BTSBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZw0KPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToNCj4NCj4gT24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgMDU6Mjg6
NDdQTSArMDIwMCwgSmlhbWluZyBPdXlhbmcgd3JvdGU6DQo+ID4gU3ViamVjdDogW1BBVENIXSBk
b2NzL3poX0NOOiBhZGQgQ2hpbmVzZSB0cmFuc2xhdGlvbiBmb3IgdXNiL29oY2kucnN0DQo+DQo+
IFRoaXMgc2hvdWxkbid0IGJlIGluIHRoZSBlbWFpbCBib2R5IDooDQo+DQo+ID4NCj4gPiBUcmFu
c2xhdGUgRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QgaW50byBDaGluZXNlIFNpbXBsaWZpZWQu
DQo+ID4NCj4gPiBUaGUgdHJhbnNsYXRpb24gY292ZXJzIE9IQ0kgZHJpdmVyIG92ZXJ2aWV3LCBo
YXJkd2FyZSBwcm90b2NvbA0KPiA+IGRpZmZlcmVuY2VzIChPSENJIHZzIFVIQ0kpLCBpbXByb3Zl
bWVudHMgc2luY2UgMi40IGtlcm5lbCwNCj4gPiBxdWV1ZWFibGUgaW50ZXJydXB0IHRyYW5zZmVy
cywgYW5kIG5vbi1QQ0kgc3VwcG9ydC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEppYW1pbmcg
T3V5YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KPiA+IC0tLQ0KPiA+IEkgaGF2ZSBt
b2RpZmllZCBhY2NvcmRpbmcgdG8geW91ciBmZWVkYmFjaw0KPg0KPiBQbGVhc2UgcHJvdmlkZSBw
cm9wZXIgdjIgaW5mb3JtYXRpb24gYXMgdGhlIGRvY3VtZW50YXRpb24gYXNrcy4NCj4NCj4gdGhh
bmtzLA0KPg0KPiBncmVnIGstaA0K
