Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7264D2931E9
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585538; cv=pass; b=Fked94hnXBxZSfG+SNSMWAO0cDNfVHwjq7Fah2uSWPey15bTfyOhzoytjvcXysBqukNXYZpN0/w1ZmS1DzVb5Z/dRXBCdOVrgdqIXschX7Uib6ZFzJyduetDpxeeJDm2SZQYceSgHs9jFsEdltjhl64F1zdn8vujYWi/LUsjtsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585538; c=relaxed/simple;
	bh=xh3oqK2qOSjKBr6FpOJqg3fyRy0kINT4MUCPhAJwtJI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LbPAQB4Ci4iIUYg1/J81OTgKnFR6ru+OlYrq+YQ8Bod6qd7tbnUBVeaDKT9WRDzXIWjTlCQAaQ9x0MHAKQzil6u7hluwHBhssAQe46mVjS5Ooe06ghPCFG6Tku2F6SXfPoiLCBo3JX+sGNFwrssRaBpHUfsVl2psnTgDitGH1WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DX4AdMVm; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DX4AdMVm"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c537df4daaso958374b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 01:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790585535; cv=none;
        d=google.com; s=arc-20260327;
        b=cscES6TViRNPHaUR6DwvnJ9/lU6P5i5fX6uhODJOtoDN+gs82385IKyMijXZKycUTd
         xhFeOwRK2rGJ5lDKKCNKtPziZddXCXq9JeFAMXccShRWuwUxgdSzXdQpf/ZRVEXO0UyU
         vp6gAv9BsuFv6PC9DqYYgK25gGAPio4mxcvZ4YN3ECLyUItqw14YWR9WGWSYCqzwNxin
         dVK531OzB7Jz+S5bXuaJNRGSwpRSF3VQgMMzbbGCwbV9CFC62S+Ik5uBgPpGai7UfnVq
         n4wx3bz8hhyaSPxwLeMqXLAEqzZaoWKr5ZDTIsUoalRRSLn4OUJTbwKPenAvm3CfHe9U
         qnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=xh3oqK2qOSjKBr6FpOJqg3fyRy0kINT4MUCPhAJwtJI=;
        fh=9dUaSIdB+5SuQBRi7TMtTPVTIvnzGBf9OxBji8PAUKM=;
        b=YIcyM1IEBt1A6lTeeepGYkTLWDJ7tT+D4HDolyPEivii9I8sM95HklkAjYqaGa4cGr
         l5GFOmHh64l96q7cC0dxEEkjP6t8u8b6ZeoaX68Lbp9YUPXERx3nnIi+AepoGTamyfHc
         IkendQ+17XZUE+oVvJNJh+VCZiAmKoKtnMn+f9/xEasaFGGAIwsgNZMvXorvQ0586sOt
         Y3/bayOz5RH7tKQJ3k6J6J6ax6hr4PJr9yJAQpTy/eEJuEYhzWQIZohBUd32Y/ihQr13
         6nVrfe9zqH+hSlcGgqFlkxiuqOsdU+fMDf+IBFkTpCeLVG4voqvDN4iEgC4SXHAF+dmz
         UXbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790585535; x=1791190335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xh3oqK2qOSjKBr6FpOJqg3fyRy0kINT4MUCPhAJwtJI=;
        b=DX4AdMVmCkzcyJvrz11sXgklVS5nvy2qdkT1slo3O+pV96xjLr8WNsyOqaorrY/c5k
         ouNm7Vzj5e/hITkL/FcbYypaxkrS2D7/xCt7Xdr5DCJPwNNwd0ZELMcJq7+QJNJpiSIp
         v3eeXsMib3uivtsvRISLEu63YYp6pQNz6iXxh3pzYlCtLP2TX5kKLGRQ9QF3DNn6FmBO
         VVFPBFx0xUYx2z0VxsnK1KFmdE3mY74on5YbL9iQhzZE/KyHSBccXaqLLZ3KMRH+A6rn
         DfZ648bsXIsvio8sdG7HQTRcSK4Cjh5CYiiRaEYqThVngHpozP3GvlVSFT8E/cccwPuz
         vbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585535; x=1791190335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xh3oqK2qOSjKBr6FpOJqg3fyRy0kINT4MUCPhAJwtJI=;
        b=QtkmDn1qG1tlFVUxbVcHltYwHGo37ATylxJtkb0zWOCkhFfmXs9ymnRDSbrpO51yW3
         O/WrrwV3R8eRf3rn89Lm/4C3Et1M6k95yz4sdJouCqYsNIKVkciN1tdKdMvitEA96v9G
         eor3s5t8GIptYkYc+BAlG8s6NGtZunpXFXQuOdfyPUDei/CztzrifBYowbgQzGleHzEH
         3rUd/vzQdziF+CFVeQyD5SfYqiyaDqphODZSsvbzOx2IPux6a91Dv/wZI0tC+1n/ux6H
         2RAJajEypMSKSAKaLa0sNlb6qiotjxOn75Yy1TRK/zWvaIgyVonFW/dGS+f2+K9UMS07
         HI/w==
X-Gm-Message-State: AFuF++kDIyrk9FIxrnmmTBPHtya1NckSkeofTD6gC3vnsc+4KDyxkCzA
	O4nR25QOYJywtjO5I/1EvAJW7lluNlAeCip+BdHg6BSBTDx2PhXXDTgBVKryoBkFuTXOOk52mSB
	sWWOsiVE1vq9ckf1DOvE2ga7TWedM8rvqUAF1
X-Gm-Gg: AYBFou3hxdhl1P3MEEqzNN8C6aKR6F6MSqDi7O9cS3zKOQL4IBCffTQw+HBHFx3i81z
	igT4u3OwvSD9vOH6Kq2HF4k4e6lrRkoDr+4rKU8qKyRtt1aVs8ygZcBOAIU7qnshlkQbiML643T
	v0RBkoOcLM4EwU7MBld6CrACgACnxzxbDY2ZHb+KV6PQypsythHofc9st5v1sVfBod/oyj2/4mE
	LjNCVk3Qq1DNC0SW23svmxrm03LAwicqSJtuKS7u81Rwt59rlF4R0lAyOqY9k+NFGZPMyxn92aM
	e32DV9+UvaC3cDcvj5jp9VUDFG/um+SRpZEpT84XAdl7c9IXMr6Pkojk
X-Received: by 2002:a05:6808:5382:b0:4c3:2e7:55bb with SMTP id
 5614622812f47-4dc640ac63amr9147416b6e.38.1790585535007; Mon, 28 Sep 2026
 01:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Mon, 28 Sep 2026 10:52:04 +0200
X-Gm-Features: AclHuK8RlujtE9PMv7u3MzNCviS8IiWUxVyLGH91_mrFpXtz3IabBnPewQsRDUI
Message-ID: <CAMnqnYwKwb5oTFOXNJyTJk2JEL6bnq+7yENm8v8RnovBYsFVGA@mail.gmail.com>
Subject: [PATCH v2] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net, 
	Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev, skhan@linuxfoundation.org, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, rdunlap@infradead.org, 
	baikefan@leap-io-kernel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

W1BBVENIIHYyXSBkb2NzL3poX0NOOiBhZGQgQ2hpbmVzZSB0cmFuc2xhdGlvbiBmb3IgdXNiL29o
Y2kucnN0DQoNClRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdCBpbnRvIENoaW5l
c2UgU2ltcGxpZmllZC4NCg0KVGhlIHRyYW5zbGF0aW9uIGNvdmVycyBPSENJIGRyaXZlciBvdmVy
dmlldywgaGFyZHdhcmUgcHJvdG9jb2wNCmRpZmZlcmVuY2VzIChPSENJIHZzIFVIQ0kpLCBpbXBy
b3ZlbWVudHMgc2luY2UgMi40IGtlcm5lbCwNCnF1ZXVlYWJsZSBpbnRlcnJ1cHQgdHJhbnNmZXJz
LCBhbmQgbm9uLVBDSSBzdXBwb3J0Lg0KDQotLS0NClNpZ25lZC1vZmYtYnk6IEppYW1pbmcgT3V5
YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KDQotLS0NCkNoYW5nZXMgaW4gdjI6DQot
IENvcnJlY3QgdGhlIGRhdGUNCi0gQ29ycmVjdCB0aGUgbGF5b3V0DQotIEFkZCBzcGVjaWZpYyBk
ZXRhaWxzIGZvciBpdCdzIGNvbnRyaWJ1dG9ycw0KLS0tDQogRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdXNiL29oY2kucnN0IHwgMzggKysrKysrKysrKysrKysrKysrKw0KIDEgZmls
ZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KDQpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAwMDAwMC4uNWUzNjgzMWJmMzcwDQotLS0gL2Rldi9udWxsDQorKysgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCkBAIC0wLDAgKzEs
MzggQEANCisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKw0KKzpPcmlnaW5h
bDogRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QNCisNCis657+76K+ROiDmrKfpmLPlrrbpk60g
SmlhbWluZyBPdXlhbmcgPGppYW1pbmdvdXlhbmcxM0BnbWFpbC5jb20+DQorDQorPT09PT09PT0N
CitPSENJ6amx5YqoDQorPT09PT09PT0NCisNCisyMDAy5bm0OOaciDIz5pelDQorDQor4oCcT0hD
SS1IQ0TigJ3pqbHliqjnqIvluo/mmK/kuIDkuKpVU0LkuLvmnLrmjqfliLblmajnqIvluo/vvIhI
Q0TvvInvvIzlroPmupDoh6oyLjTlhoXmoLjns7vliJfkuK3nmoTigJx1c2Itb2hjaeKAnQ0KK+mp
seWKqOeoi+W6j+OAguKAnHVzYi1vaGNp4oCd5Luj56CB5Li76KaB55SxIFJvbWFuIFdlaXNzZ2Fl
cmJlciA8d2Vpc3NnQHZpZW5uYS5hdD7nvJblhpnkvYbkuZ/ojrcNCivlvpfkuobmnaXoh6pEYXZp
ZCBCcm93bmVsbCA8ZGJyb3duZWxsQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD7vvIxMaW51cyBUb3J2
YWxkcw0KK+WSjEdyZWdvcnkgUC4gU21pdGjnmoTmlK/mjIHjgIINCisNCivlroPmlK/mjIHigJzl
vIDmlL7kuLvmnLrmjqfliLblmajmjqXlj6PigJ3vvIhPSENJ77yJ77yM6K+l5o6l5Y+j5qCH5YeG
5YyW5LqG55So5LqO5LiOVVNCIDEuMeS4u+acuuaOp+WItuWZqOmAmuS/oeeahA0KK+ehrOS7tuWv
hOWtmOWZqOWNj+iuruOAguKAnOS4juiLseeJueWwlOaXqeacn+eahOKAnOmAmueUqOS4u+acuuaO
p+WItuWZqOaOpeWPo+KAne+8iFVIQ0nvvInnm7jmr5TvvIzlroPlsIbmm7TlpJrlj6rog73lip/o
g70NCivms6jlhaXliLDnoazku7bkuK3jgILpmaToi7HnibnlsJTlkozlqIHnm5vkuYvlpJbnmoTl
hbbku5bkvpvlupTllYbnmoRVU0IxLjHmjqfliLblmajpgJrluLjkvb/nlKhPSENJ44CCDQorDQor
6IeqMi405YaF5qC45Lul5p2l55qE5pu05pS55YyF5ousDQorDQorICAgICAgICAgLSDmj5Dpq5jk
uoblgaXlo67mgKc7IOS/ruWkjeS6humUmeivrzsg5YeP5bCR5LqG5byA6ZSADQorICAgICAgICAg
LSDmlK/mjIHmm7TmlrDlkoznroDljJbnmoR1c2Jjb3JlIEFQSQ0KKyAgICAgICAgIC0g5Lit5pat
5Lyg6L6T5Y+v5Lul5pu05aSn77yM5bm25LiU5Y+v5Lul5o6S6ZifDQorICAgICAgICAgLSDpgJro
v4fkvb/nlKjkuIrlsYLigJxoY2TigJ3moYbmnrbvvIzlh4/lsJHku6PnoIHph48NCisgICAgICAg
ICAtIOaUr+aMgeS4gOS6m+mdnlBDSeeahE9IQ0nlrp7njrANCisgICAgICAgICAtIC4uLiDku6Xl
j4rmm7TlpJoNCisNCivigJxPSENJLWhjZOKAnempseWKqOeoi+W6j+WkhOeQhuaJgOaciVVTQiAx
LjHkvKDovpPnsbvlnovjgILmiYDmnInnsbvlnovnmoTkvKDovpPpg73lj6/ku6XmjpLpmJ/jgILl
nKjigJx1c2Itb2hjaeKAnQ0KK+S4reS5n+aYr+WmguatpO+8jOS9huS4reaWreS8oOi+k+mZpOWk
luOAguS7peWJje+8jOS9v+eUqOS4gOW4p+eahOWRqOacn+S8muWboOS4uklSUeWkhOeQhueahOW8
gOmUgOiAjOWvvOiHtOaVsOaNruS4og0KK+WkseeahOmjjumZqeOAguW9k+S4reaWreS8oOi+k+aO
kumYn+aXtu+8jOWPr+S7pemAmui/h+ehruS/neehrOS7tuWcqOaTjeS9nOezu+e7n+WkhOeQhueb
uOWFs0lSUeaXtuWni+e7iOacieS8oOi+k+mcgOimgQ0KK+WkhOeQhu+8jOadpeacgOWkp+mZkOW6
pueahOmZjeS9jui/meS6m+mjjumZqeOAgg0KKw0KKy0gRGF2aWQgQnJvd25lbGwNCisgIDxkYnJv
d25lbGxAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KKw0KLS0gDQoyLjUzLjANCg==
