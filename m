Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E068418368
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788029306; cv=pass; b=tKQQwZpVS9FE01ny11LRboIqAzGGDXMXN6uGdxIPwq4zUSTDIkuQqstNZ/abuQy2lAAbZWH0vKpnwWXO3T+L8qKxp8il3g3XfXPGavVswVTlANcPE2tJu+HMjMDM2xEXqROvtf5w04hWJJv6adYADpM3GBEFugaadgTMPe0wuuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788029306; c=relaxed/simple;
	bh=qbxmhWZD0CW07SmrijqAqneEw1xNz+/IbBRJSA32L9Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bpk0hY56nxY0z/ymXl76iSAHcc2Sya+DhfpwCapDFmVyxGbd9s3J1dHfhAy8ah4kwNYXtzFpg3VhH/jxi6kQGP+wvoS1H64LBjHwI5NRKb+wm6WfROMsptcdntd7ZgINvYu/Ma03hy1RpztnfhT/errmjcZ8gL5VZynJUokGOMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laVf+bQl; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laVf+bQl"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b190cdc9feso1932501b6e.0
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 11:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788029303; cv=none;
        d=google.com; s=arc-20260327;
        b=ErEHrRHEiiXJTB46sFOTcaz8snuF/XGB4uqTnjh+At+KoZW6Dfzh+T7BUP5B4UbiDY
         duRf0Ws5uAs8DMXovrhJPeYHp88ROTB3O1bRhJFNKQhhhxiWiuEYJDVHaCYhdfBcTf+d
         DOCFFyiNJQ8WUrUgIQQtlHJF6fpvySGY20jC3+NISVuCXshRflptULtr/F0ov2CoBEHU
         Fd9dZZof/aJNfDUszMhFE3Ze4XnAkjGqlqZrd+G0VCzXEmpc4MMydqBraE9/dAb27VO7
         sIsFfoCHhynYt+Cc6VTTnpW4ELWVPMOcLjCFy2i0r1q5ROsprLC8r6J4vNhS0exrqxOO
         4tnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qbxmhWZD0CW07SmrijqAqneEw1xNz+/IbBRJSA32L9Q=;
        fh=FeMw5PfBiJcxTST8rNzCsoBCsKctBhzlC8tQcapC+ZA=;
        b=JKa8CIB9Gpu7xT7rpbqhkDVifDSqgryAhvzpBTLfhR2dOFajHPYK/V7STrqh9HNRN5
         QyHwuLDCRYS+tt98SBk6SUovyhUvkYk+sXFvi5FvJnYV+7FM3W5/ayk5/aRrZx6TA1F1
         n9C2bwiR6Ezwu9VLXUBUM3WYB8luunkgSAOrbg2V+px/Ho0++PgKVcn3DbmfrRl6G9Dz
         /+CYWTydbWoX/Qx5z0bsJOKNDmReDRK3cGsg/ZeeYanTlnAHGaOihfspS59t9AUjnQd7
         iuTtOpnJVaRYSGlByCAqkrr0uxq3Q5fUJ/UC/Z0MhR5Qja9pC8vA7vnQRmrABZJBSVMU
         01Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788029303; x=1788634103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbxmhWZD0CW07SmrijqAqneEw1xNz+/IbBRJSA32L9Q=;
        b=laVf+bQloM7KUm0qvEDQc5w1Bf3oD1HZ6lMSX8+NMQPD8+/jJcn36GJh+kspe1kSbh
         Q5IUOyiCQiqo0GjTCfw4BUcthngrnBfdaXidYReUb/IDAHLTffnr+CnWkQ2BmHMu/Uuo
         9fEQzKJk2QuAJDn+4Q8M2pIGbDn/jFMHSvGAUuC37c46bkM8LhsGoJn5VO76Ltwfvna1
         EKIl++JsCqd8usrbJ5JJIgeQyHAHT93EBwVZ5kFKy5Yt3vGc2Pqvk4LToTV6G4v4wbtL
         KTUhUx9RjK4FkL0Jk9Pne39gSb+J5UbnrYcMQd4sfw8FN+4OWowyr8wWWuceV5rgHY+9
         JbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788029303; x=1788634103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qbxmhWZD0CW07SmrijqAqneEw1xNz+/IbBRJSA32L9Q=;
        b=p3UmO9GpoP6hgBBDJsbRM7bPnSsRXCsHIupD23Q51+q2dEbYm9ssR3EX2zgzSdeGw5
         MkFMGOyncogNuJR7fM6Tvg+IGnaMOvAi4GJ25dgLKuXy3AmIHlmBi6pnqRPWcU6sDamG
         Y5BUvylDpfJ6tUalPmaXBfSbTeIpijqVdkNq6wWgwYS/SQ5ZOK20QUCNI2F8GWmGhsW2
         ihD9rI2OjsMjnzy7e6Og2LhBd6zWIf4J1yOSRH9zxrh0fAt8WN7S21kqSYO8RKVUGd9J
         d1/4MhKKJmiwjg6pwFI2l4Mc+HBVS2iXtRa1sudBd8Abv57W7SAlDd8fdlIVt0CHJSTh
         po8w==
X-Gm-Message-State: AFuF++nzhp9l9hWI12eaYvjcNp5oWK1maGIXdSMTF5SGvs20LTbC9bfp
	/ExKn1k/9Oeb6K2rysegYiH7q1qI+cYOvWTOwa0UsHBiGFb0dgtY5IeDXGiCXN4fbW7rBvxae3I
	RDv1nHz1MxxjGlkWaSjubVqodJR4zgaLz2teY
X-Gm-Gg: AR+sD11wnv1ASinMDa+Of1pM+SLS5VaJHcF6E4+Lyidd8l9KZi5grTMoKhqmrc++UFk
	8oDuggSNBgnYTCdcn0JQb1mh1V4A9DdKlnAeEUSmp2K25MnRRQJlgxv3veY8sksW+iHudomLAM0
	9CVdX4AuBzOioojZL6KMvC1xcHH/wn4sbUw4tSIvf5F3IEn345kWWETS1p+fD3qMM5QQLVHFvls
	ExK/qEZVBkdU88hAKXVW9REgI3j5ZIeXqmpqb7vSiSv4Yoh+Nz+pNK7kpTahMGRPSJZqSt/5eyL
	vmow9bOl3obf927tun62P+XD6yf3VoQHIKmuYOKPkJKX4Q==
X-Received: by 2002:a05:6808:f8b:b0:4b3:63a7:b75d with SMTP id
 5614622812f47-4b397c8e6a4mr16340667b6e.0.1788029302802; Sat, 29 Aug 2026
 11:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Sat, 29 Aug 2026 20:48:07 +0200
X-Gm-Features: AcwNN1XChojeVTwGAGrg0Wq_4NOfaFshuyXC2v51uuJhhiroqPm4vT63tnE8hQc
Message-ID: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
Subject: [PATCH] docs/zh_CN: add usb/ohci translation
To: linux-doc@vger.kernel.org
Cc: "corbet@lwn.net" <corbet@lwn.net>, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAzOTU5NDgyMTIxNDQ1NDllMjBjZmNkYmQwNTM4MTdjNGUwNjhkYTM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogSmlhbWluZyBPdXlhbmcgPGppYW1pbmdvdXlhbmcxM0BnbWFp
bC5jb20+DQpEYXRlOiBTYXQsIDI5IEF1ZyAyMDI2IDIwOjM1OjM3ICswMjAwDQpTdWJqZWN0OiBb
UEFUQ0hdIGRvY3MvemhfQ046IGFkZCB1c2Ivb2hjaSB0cmFuc2xhdGlvbg0KDQpTaWduZWQtb2Zm
LWJ5OiBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4NCi0tLQ0KIC4u
Li90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdCAgICAgICAgICB8ICAyICstDQogRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0IHwgMzcgKysrKysrKysr
KysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti91c2Ivb2hjaS5yc3QNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3VzYi9pbmRleC5yc3QNCmIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dXNiL2luZGV4LnJzdA0KaW5kZXggZGY5OTgxNGM2NDk3Li5jOTZlYWNmMTNlMTEgMTAwNjQ0DQot
LS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQorKysg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQpAQCAtMzIs
NiArMzIsNyBAQCBVU0Ig5pSv5oyBDQogICAgIGNoaXBpZGVhDQogICAgIGR3YzMNCiAgICAgZWhj
aQ0KKyAgICBvaGNpDQogICAgIHVzYm1vbg0KDQog5b6F57+76K+R5paH5qGj77yaDQpAQCAtNDks
NyArNTAsNiBAQCBVU0Ig5pSv5oyBDQogKiBtYXNzLXN0b3JhZ2UNCiAqIG1pc2NfdXNic2V2c2Vn
DQogKiBtdG91Y2h1c2INCi0qIG9oY2kNCiAqIHJhdy1nYWRnZXQNCiAqIHVzYmlwX3Byb3RvY29s
DQogKiB1c2Itc2VyaWFsDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdXNiL29oY2kucnN0DQpiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Vz
Yi9vaGNpLnJzdA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uNDM4
N2JiMjc0MDcxDQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi91c2Ivb2hjaS5yc3QNCkBAIC0wLDAgKzEsMzcgQEANCisuLiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KKw0KKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi91c2Ivb2hj
aS5yc3QNCisNCis657+76K+ROiDmrKfpmLPlrrbpk60gSmlhbWluZyBPdXlhbmcgPGppYW1pbmdv
dXlhbmcxM0BnbWFpbC5jb20+DQorDQorPT09PT09PT0NCitPSENJ6amx5YqoDQorPT09PT09PT0N
CisNCisyMDI25bm0OOaciDI55pelDQorDQor4oCcT0hDSS1oY2TigJ3pqbHliqjnqIvluo/mmK/k
uIDkuKpVU0LkuLvmnLrmjqfliLblmajpqbHliqjnqIvluo/vvIhIQ0TvvInvvIzlroPmupDoh6oy
LjTlhoXmoLjns7vliJfkuK3nmoTigJx1c2Itb2hjaeKAnQ0KK+mpseWKqOeoi+W6j+OAguKAnHVz
Yi1vaGNp4oCd5Luj56CB5Li76KaB55SxIFJvbWFuIFdlaXNzZ2FlcmJlciA8d2Vpc3NnQHZpZW5u
YS5hdD4g57yW5YaZ77yM5L2G5Lmf6I635b6X5LqGDQor6K645aSa5YW25LuW5Lq655qE6LSh54yu
77yI6K+36ZiF6K+75YW254mI5p2D77yJDQor44CCDQorDQor5a6D5pSv5oyB4oCc5byA5pS+5Li7
5py65o6n5Yi25Zmo5o6l5Y+j4oCd77yIT0hDSe+8ie+8jOivpeaOpeWPo+agh+WHhuWMluS6hueU
qOS6juS4jlVTQiAxLjHkuLvmnLrmjqfliLblmajpgJrkv6HnmoTnoazku7blr4QNCivlrZjlmajl
jY/orq7jgILkuI7oi7HnibnlsJTml6nmnJ/nmoTigJzpgJrnlKjkuLvmnLrmjqfliLblmajmjqXl
j6PigJ3vvIhVSENJ77yJ55u45q+U77yM5a6D5bCG5pu05aSa5Y+q6IO95Yqf6IO95rOo5YWl5Yiw
56Gs5Lu2DQor5Lit44CC6Zmk6Iux54m55bCU5ZKM5aiB55ub5LmL5aSW55qE5YW25LuW5L6b5bqU
5ZWG55qEVVNCMS4x5o6n5Yi25Zmo6YCa5bi45L2/55SoT0hDSeOAgg0KKw0KK+iHqjIuNOWGheag
uOS7peadpeeahOabtOaUueWMheaLrA0KKw0KKyAtIOaPkOmrmOS6huWBpeWjruaApzsg5L+u5aSN
5LqG6ZSZ6K+vOyDlh4/lsJHkuoblvIDplIANCisgLSDmlK/mjIHmm7TmlrDlkoznroDljJbnmoR1
c2Jjb3JlIEFQSQ0KKyAtIOS4reaWreS8oOi+k+WPr+S7peabtOWkp++8jOW5tuS4lOWPr+S7peaO
kumYnw0KKyAtIOmAmui/h+S9v+eUqOS4iuWxguKAnGhjZOKAneahhuaetu+8jOWHj+WwkeS7o+eg
gemHjw0KKyAtIOaUr+aMgeS4gOS6m+mdnlBDSeeahE9IQ0nlrp7njrANCisgLSAuLi4g5Lul5Y+K
5pu05aSaDQorDQor4oCcT0hDSS1oY2TigJ3pqbHliqjnqIvluo/lpITnkIbmiYDmnIlVU0IgMS4x
5Lyg6L6T57G75Z6L44CC5omA5pyJ57G75Z6L55qE5Lyg6L6T6YO95Y+v5Lul5o6S6Zif44CC5Zyo
4oCcdXNiLW9oY2nigJ3kuK3kuZ8NCivmmK/lpoLmraTvvIzkvYbkuK3mlq3kvKDovpPpmaTlpJbj
gILku6XliY3vvIzkvb/nlKjkuIDluKfnmoTlkajmnJ/kvJrlm6DkuLpJUlHlpITnkIbnmoTlvIDp
lIDogIzlr7zoh7TmlbDmja7kuKLlpLHnmoTpo47pmanjgIINCivlvZPkuK3mlq3kvKDovpPmjpLp
mJ/ml7bvvIzlj6/ku6XpgJrov4fnoa7kv53noazku7blnKjmk43kvZzns7vnu5/lpITnkIbnm7jl
hbNJUlHml7blp4vnu4jmnInkvKDovpPpnIDopoHlpITnkIbvvIzmnaXmnIDlpKfpmZANCivluqbn
moTpmY3kvY7ov5nkupvpo47pmakNCisNCistIOasp+mYs+WutumTrSBKaWFtaW5nIE91eWFuZw0K
KyAgPGppYW1pbmdvdXlhbmcxM0BnbWFpbC5jb20+DQotLSANCjIuNTMuMA0K
