Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603A52EACEF
	for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2026 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852110; cv=pass; b=X3xE4WT9JP2JVxRfWSOyHBZjkaov1KY3KNMTkyvV9YHY+h364VxCm3DPTHH4V/KQtg8uPepoWwWItMfyg1hWlRnJtJEIn1rkZ0fuArQPryi/BML26qhypVmrirNDqz9YxVzjYfpBj8ieQDDuuZnYeSCI7IPTheiVtPwtg+nxLas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852110; c=relaxed/simple;
	bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EJ5vCljZK7+KF1P0ET3HUocd35N7omLQNqFagSW/YBl6OnSc1KAC3WhYTIUqo3z+F3wjlC0eMSUN4Di1FVWTc00CC+zniwigjlLmGM+n44mlIUd7FqBQhfKKu+Wqx0Ku+e15qwLZQobyZQlD/qubpncNlcb6qNSnJ661zvIn0AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4rKkSpD; arc=pass smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4rKkSpD"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49df0f3a690so304132fac.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 03:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852102; cv=none;
        d=google.com; s=arc-20260327;
        b=SXpndVYjETOgY2BS5ocnrGDHYqtr7nvtF8lw9EcXuHThOMExYFRBxNmdlQUOFjJsjQ
         d+5uCvAdqsD5dUuoAOsZ+A6beMPl5qtRyW3fwaZQ66d5uWa3+zsn3g6r051sktQIS8Og
         oddcLeUkUsviV0xVGQVhsjThqtjDpH+Vt3NhVIIR0TLaLcG/T5MUa3WkGF0rY3qUQ1uw
         0c63Cq1yp6ldl47Imug7M/uAwYieeANMTT2tx/vaivzhUsuASJMXAydFXSUXLqXWvnpa
         dPD2KZBMh5f7SA/w18pbTL4kKgfgW7P4LoPj1FnUC4Twi+CSCu8u+ZigA/HT0aSZa3RP
         CjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        fh=pPu6bLF2RxZU5oEKUY+OdPYqpPWSUk68/Stsl1T1NKY=;
        b=hNUjuEFNdX+WPD48PJwXMtKVaBABpWcs3vZphhJXRi3OihF3szZbHFGz65tfNL3Mbj
         GVkfYqfNbZwNMD0trcJ1Nm4DQTwguvzbD7+GZ2KVXdztAfELufhxGz7DSjP7q4ZM5eB4
         Hay8hnNYdQZnOBRvXmfdErqDYhW8+ul8u0zxNXYbSw4/rqlLF3F9B9NLwxnmvBqKUn0H
         +RYeDjRq42F5DyWCGyRcHsAjQ2XvFXiPl2X/UtmruooBa6ATdPHC3V5s71D/ktrv8fro
         hxKNM93/kyIIQRs24RdP1CO6I9A9DJajNHwpzDcRYTBzBFhqKxICAqeYL+rBJsJFIr5L
         nPzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790852102; x=1791456902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        b=b4rKkSpDtDsl0IH/4cGgGxf866ftxTY3ApnpOmN4pCmYNlAb7e7yL4mPUsh+Icz5ch
         m+nldH5//kFhNyaCdsIQ+OS4JKh3QpWAzFnohkQU5g21GdX3IRgbu46k4XwlzBuehToR
         KzJJfOO6R298J56wrErcpimzOYhR+sfimy/iNCmIBbcrn8Umip8Qh1Xh+dwwpO4TiSVD
         Gph38BWPehTX/+u0UNhAvhBLC4O67mJiZAV0p0pA2Z4y6cEN607aTf1K4zzoIdFAuLSg
         0QExlgY6yx1TI1hpAFiuBuMc1MSoQKjrGBX4pV7Xgg2NRAtfhsrz2SHRLZlDRfrB0/9M
         vsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852102; x=1791456902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        b=o8OVpve1bbv91EPs5XJHiaVjaqPMOjR+zHCjC2R3xUcag3n1uq8hznRtmRA8G1MWNx
         QSyCzWl0v6gL6BCwRlH/VzAPUBEYviMA/LFHvTuHiWU3lFJXNbVp2v7IiW6+gMPRg5/3
         01OTK1FgklghvYYsC0q+X+EzvGn/B8pjimKbuVp8YWRek2iUQdDOakyPTxLqbZ8SKjPo
         k1V287T/uXmYcM5f0VMO+wpISJr8iS58sZjLhBcCwB+k6v3nXwLGJHG38Ahydjm6hikB
         leMt0YfzmWlnhlijvC4DinhQe66HkDW7qBNiih0TmHeinDHrrETrk7Q7jf8aPBF21cHq
         1zsw==
X-Gm-Message-State: AFuF++m6OwpJWRk1Aw5Cpq44cniC8g9Tm9Po8G+4OqyqxU/H1z4Sz/as
	xE58HR86isKnYnbD1ABPxWCqdJ1ilVpriy+QVGEZZ9gDUNQzp4AwdMywoyVQgiTWTW1q0Wq9Obi
	Dkr9nLKVdxPppN1cSTtj8luR80haW2mi+RuXT
X-Gm-Gg: AYBFou2nPNivrXaaEhYTm+yGjoWBSsHAbUUd9iS07jryt7T9eZMI2MHNKb7bauKO1+A
	1nDOxFHzmyGXwHcRCnkBVEkmdLF/Zs3WTW9O3ny2v/LC+TiNJUmdgkRxHPDOsxiljuyMyv5TaNw
	3fVtW0RIPnDlRbAWuYIdTHIGcAMihnB9PfqpguFYFu1r0Q7bqnwNKcMiiJMtNs9uf3efN/R8Ve7
	XRpRWrTPChNlXKPw+hKshZ78BjDiArxzbUqIjZbanKCffaDbkq9o22Hlk9IjbqXGrPWE+Yp6eW0
	WYjTazt+dlLMKqiD/dFbYekZHilu80tQsauZb3jD2zto6jqsm/lx+ao=
X-Received: by 2002:a05:6808:c1ef:b0:4b9:a88b:888c with SMTP id
 5614622812f47-4f1b64a6ef5mr4765837b6e.34.1790852101873; Thu, 01 Oct 2026
 03:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Thu, 1 Oct 2026 12:54:50 +0200
X-Gm-Features: AclHuK8AuvSeIEDvFdVXJ1BcDoYuYJK_4LwuepSYvn8RQjOTdj5yZPKZ_GGJBTc
Message-ID: <CAMnqnYxWj7jFKcgekEXoq0EP-7g6mST6yqoU5DRhsHCkhfaGJg@mail.gmail.com>
Subject: [PATCH v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alexs@kernel.org, corbet@lwn.net, Dongliang Mu <dzm91@hust.edu.cn>, 
	si.yanteng@linux.dev, skhan@linuxfoundation.org, gregkh@linuxfoundation.org, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

VHJhbnNsYXRlIERvY3VtZW50YXRpb24vdXNiL29oY2kucnN0IGludG8gQ2hpbmVzZSBTaW1wbGlm
aWVkLg0KDQpUaGUgdHJhbnNsYXRpb24gY292ZXJzIE9IQ0kgZHJpdmVyIG92ZXJ2aWV3LCBoYXJk
d2FyZSBwcm90b2NvbA0KZGlmZmVyZW5jZXMgKE9IQ0kgdnMgVUhDSSksIGltcHJvdmVtZW50cyBz
aW5jZSAyLjQga2VybmVsLA0KcXVldWVhYmxlIGludGVycnVwdCB0cmFuc2ZlcnMsIGFuZCBub24t
UENJIHN1cHBvcnQuDQoNClNpZ25lZC1vZmYtYnk6IEppYW1pbmcgT3V5YW5nIDxqaWFtaW5nb3V5
YW5nMTNAZ21haWwuY29tPg0KLS0tDQoNCkNoYW5nZXMgaW4gdjM6DQotIENvcnJlY3QgdGhlIGRv
Y3MgbGlzdCBpbiBpbmRleC5yc3QNCi0tLQ0KIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2lu
ZGV4LnJzdCAgICAgICAgICB8ICAyICstDQogRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vdXNiL29oY2kucnN0IHwgMzggKysrKysrKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdl
ZCwgMzkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCg0KZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QNCmIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdA0KaW5kZXggZGY5OTgx
NGM2NDk3Li5jOTZlYWNmMTNlMTEgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi91c2IvaW5kZXgucnN0DQpAQCAtMzIsNiArMzIsNyBAQCBVU0Ig5pSv5oyBDQogICAg
IGNoaXBpZGVhDQogICAgIGR3YzMNCiAgICAgZWhjaQ0KKyAgICBvaGNpDQogICAgIHVzYm1vbg0K
DQog5b6F57+76K+R5paH5qGj77yaDQpAQCAtNDksNyArNTAsNiBAQCBVU0Ig5pSv5oyBDQogKiBt
YXNzLXN0b3JhZ2UNCiAqIG1pc2NfdXNic2V2c2VnDQogKiBtdG91Y2h1c2INCi0qIG9oY2kNCiAq
IHJhdy1nYWRnZXQNCiAqIHVzYmlwX3Byb3RvY29sDQogKiB1c2Itc2VyaWFsDQpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uNWUzNjgzMWJmMzcwDQotLS0gL2Rldi9udWxsDQor
KysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCkBAIC0w
LDAgKzEsMzggQEANCisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKw0KKzpP
cmlnaW5hbDogRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QNCisNCis657+76K+ROiDmrKfpmLPl
rrbpk60gSmlhbWluZyBPdXlhbmcgPGppYW1pbmdvdXlhbmcxM0BnbWFpbC5jb20+DQorDQorPT09
PT09PT0NCitPSENJ6amx5YqoDQorPT09PT09PT0NCisNCisyMDAy5bm0OOaciDIz5pelDQorDQor
4oCcT0hDSS1IQ0TigJ3pqbHliqjnqIvluo/mmK/kuIDkuKpVU0LkuLvmnLrmjqfliLblmajnqIvl
uo/vvIhIQ0TvvInvvIzlroPmupDoh6oyLjTlhoXmoLjns7vliJfkuK3nmoTigJx1c2Itb2hjaeKA
nQ0KK+mpseWKqOeoi+W6j+OAguKAnHVzYi1vaGNp4oCd5Luj56CB5Li76KaB55SxIFJvbWFuIFdl
aXNzZ2FlcmJlciA8d2Vpc3NnQHZpZW5uYS5hdD7nvJblhpnkvYbkuZ/ojrcNCivlvpfkuobmnaXo
h6pEYXZpZCBCcm93bmVsbCA8ZGJyb3duZWxsQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD7vvIxMaW51
cyBUb3J2YWxkcw0KK+WSjEdyZWdvcnkgUC4gU21pdGjnmoTmlK/mjIHjgIINCisNCivlroPmlK/m
jIHigJzlvIDmlL7kuLvmnLrmjqfliLblmajmjqXlj6PigJ3vvIhPSENJ77yJ77yM6K+l5o6l5Y+j
5qCH5YeG5YyW5LqG55So5LqO5LiOVVNCIDEuMeS4u+acuuaOp+WItuWZqOmAmuS/oeeahA0KK+eh
rOS7tuWvhOWtmOWZqOWNj+iuruOAguKAnOS4juiLseeJueWwlOaXqeacn+eahOKAnOmAmueUqOS4
u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iFVIQ0nvvInnm7jmr5TvvIzlroPlsIbmm7TlpJrlj6ro
g73lip/og70NCivms6jlhaXliLDnoazku7bkuK3jgILpmaToi7HnibnlsJTlkozlqIHnm5vkuYvl
pJbnmoTlhbbku5bkvpvlupTllYbnmoRVU0IxLjHmjqfliLblmajpgJrluLjkvb/nlKhPSENJ44CC
DQorDQor6IeqMi405YaF5qC45Lul5p2l55qE5pu05pS55YyF5ousDQorDQorICAgICAgICAgLSDm
j5Dpq5jkuoblgaXlo67mgKc7IOS/ruWkjeS6humUmeivrzsg5YeP5bCR5LqG5byA6ZSADQorICAg
ICAgICAgLSDmlK/mjIHmm7TmlrDlkoznroDljJbnmoR1c2Jjb3JlIEFQSQ0KKyAgICAgICAgIC0g
5Lit5pat5Lyg6L6T5Y+v5Lul5pu05aSn77yM5bm25LiU5Y+v5Lul5o6S6ZifDQorICAgICAgICAg
LSDpgJrov4fkvb/nlKjkuIrlsYLigJxoY2TigJ3moYbmnrbvvIzlh4/lsJHku6PnoIHph48NCisg
ICAgICAgICAtIOaUr+aMgeS4gOS6m+mdnlBDSeeahE9IQ0nlrp7njrANCisgICAgICAgICAtIC4u
LiDku6Xlj4rmm7TlpJoNCisNCivigJxPSENJLWhjZOKAnempseWKqOeoi+W6j+WkhOeQhuaJgOac
iVVTQiAxLjHkvKDovpPnsbvlnovjgILmiYDmnInnsbvlnovnmoTkvKDovpPpg73lj6/ku6XmjpLp
mJ/jgILlnKjigJx1c2Itb2hjaeKAnQ0KK+S4reS5n+aYr+WmguatpO+8jOS9huS4reaWreS8oOi+
k+mZpOWkluOAguS7peWJje+8jOS9v+eUqOS4gOW4p+eahOWRqOacn+S8muWboOS4uklSUeWkhOeQ
hueahOW8gOmUgOiAjOWvvOiHtOaVsOaNruS4og0KK+WkseeahOmjjumZqeOAguW9k+S4reaWreS8
oOi+k+aOkumYn+aXtu+8jOWPr+S7pemAmui/h+ehruS/neehrOS7tuWcqOaTjeS9nOezu+e7n+Wk
hOeQhuebuOWFs0lSUeaXtuWni+e7iOacieS8oOi+k+mcgOimgQ0KK+WkhOeQhu+8jOadpeacgOWk
p+mZkOW6pueahOmZjeS9jui/meS6m+mjjumZqeOAgg0KKw0KKy0gRGF2aWQgQnJvd25lbGwNCisg
IDxkYnJvd25lbGxAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KKw0KLS0gDQoyLjUzLjANCg==
