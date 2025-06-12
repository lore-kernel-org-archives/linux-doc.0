Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2536224A079
	for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739082; cv=none; b=mz9Yau1qjcHURrtj3tJelYX60fGAdYogVhXfy66fGtbnspIFSCgzV0yk3RNsw0/fo5E9FSbMdA9pYYhpiirymq+BI2NwGW6Fsm9ATYgFsCJMnpthOsBMi0F22cdXYQ3mdPdC+DuONjee+mhfO85dk+rFZnwxDnoeSqGX3JLL7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739082; c=relaxed/simple;
	bh=tW+MG+Iklg8zdVZJORrL9Gc9lWKL7L62gXkoMRmez4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxcfGc0esaZlp3pdTt0WSilNoZfaWCSrDTJgezNtMKnb1YECnoVkM/MGHWx32uT1M0zqi0m5Zfz+f/RbyJvJgjN03WGZK7M37f3va0/emlM1kod63SL7VHaIvdmhXp0hODOsWvTDbE3vIUfJ9zCXbyY9IS6voQr6ufpvX1m01zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDCpT7lb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDCpT7lb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6086502e750so2164525a12.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749739078; x=1750343878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW+MG+Iklg8zdVZJORrL9Gc9lWKL7L62gXkoMRmez4w=;
        b=kDCpT7lbYYUfvkRz9lgs8i2pQHzFBASCZ+rF0BtLWcEXPsDT7Ffs2Muj4wu8Uz0Fw6
         d2r2to9ahqPWBuRrCws/P90c2TrvDleqzW35sC+OQ2MsOCvluVS6Hn9wuppCtZDBDL2z
         vxd/xs4tM5f2NYgXkdp5WViReWI9CnyokZitVXhNb0mDRN9XMDdudobC8jxA7Q7iQHAe
         PtFc6p/EVaXO80M1Q2smM71dfK7g5mw7KO6D4gpJxNstjI+HH7m9/KVKGdqHbNgIK3Cl
         T4xKupkSfmLFY5NiDGrtemxQL6pCAfyWjk+CPy6fi6VnhSWGm3yt3cRJspZOexVFzD7Y
         HZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739078; x=1750343878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW+MG+Iklg8zdVZJORrL9Gc9lWKL7L62gXkoMRmez4w=;
        b=coW9R7eVN6V3FmNAWUD+DG4lLbBmTyJNDIJHffrsSN82jnpnLUnYHgWbAxOB/nfy6N
         KWKW9bElo1+NRjlPpnla4W2l1QyMEeMtQEQetAy6y49NYjplpiEP9WVaGY3tJI3Inja1
         +xhwVcZdNLApop5I/XZTUBzc9iZcDyB0khEYGA02gq0/aG1haC8tQ1qCDLon44DwZszJ
         3snZzubxkJqleAHyC/YF2C6qqS9JWlqyy06LiTEsmFMZFJcwiWNzmMy00NdOaA/vZVfB
         0tsy0osVGpiNYh4iwl97RNmog5p4Ep1iysEcaermZVyXanSoCxmcqbIdCAA+q3tBDR9D
         BWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfYrNUaftvVkNtPHAMhnw82JJWZazTBhEojD4AMbcXPqLzy7eoRxMmxklmGSK2HtHEVT4LNLTnKRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHTBvPPRDcwMLRyaMXCAVfgmgB9ZSh2KGP0qARnmBR97qgHL/
	Xf1eTQfGmYlU/udvXtiqr+8us3Z2DnYMmUX7YDb7fhwpByirTLdbYUI2qVUd12dQSgseZxQrsdv
	mxO1yoUjPrc/5zsm7hXQYVvyGlcb4aUs=
X-Gm-Gg: ASbGnctB6BtX2Eli5zY3VmO8jR8MxE1vh74ylqWE5rBD+ahmF1r8P8J4ZrvConBDhL+
	4w/Pn9daOo0jkRFAa+BFgy98JKWbUMNYxmumKekC69YH5Bn4o8juIU2t2zwhTLiqVimSZXDZlca
	aZxrIaQaQphS9AL0Cjzlx7s1KCAHehZtQFYEZvSsV4z1s=
X-Google-Smtp-Source: AGHT+IFh8+8tz7U6zippyVbjdBW1bJ/jzs5eV85oH4asbbjyyf9t54mZwmtSc9IsaqWoNy3+vVLWfGLT+xsmdiXLg84=
X-Received: by 2002:a05:6402:4309:b0:607:f61f:cc2a with SMTP id
 4fb4d7f45d1cf-60863ae5802mr3897398a12.18.1749739078109; Thu, 12 Jun 2025
 07:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607163814.7800-1-chris.wei.cui@gmail.com> <CAD-N9QU_OKc24ANr02=3SetjNwvaxeHM=2NfH__7bE3ZwQkiFw@mail.gmail.com>
In-Reply-To: <CAD-N9QU_OKc24ANr02=3SetjNwvaxeHM=2NfH__7bE3ZwQkiFw@mail.gmail.com>
From: Alex Shi <seakeel@gmail.com>
Date: Thu, 12 Jun 2025 22:37:20 +0800
X-Gm-Features: AX0GCFtN7vgiMmXN5JIO8F8Fc8bVz85nApp2RSJ3Pwg7quzQ7U9fV-sIsMhjw2Y
Message-ID: <CAJy-AmmX3Ftr+wK+NbwVs30D2o9QyPqzDmnKZCbK_16e+c2Xyg@mail.gmail.com>
Subject: Re: [PATCH v3] Docs/zh_CN: Translate speculation.rst to Simplified Chinese
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: chris.wei.cui@gmail.com, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

QXBwbGllZCBvbiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9hbGV4cy9saW51eC5naXQvLA0KVGhhbmtzIQ0KDQpEb25nbGlhbmcgTXUgPG11ZG9uZ2xpYW5n
YWJjZEBnbWFpbC5jb20+IOS6jjIwMjXlubQ25pyIOeaXpeWRqOS4gCAwOToyMeWGmemBk++8mg0K
Pg0KPiBPbiBTdW4sIEp1biA4LCAyMDI1IGF0IDEyOjM44oCvQU0gPGNocmlzLndlaS5jdWlAZ21h
aWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IEN1aSBXZWkgPGNocmlzLndlaS5jdWlAZ21h
aWwuY29tPg0KPiA+DQo+ID4gdHJhbnNsYXRlIHRoZSAic3BlY3VsYXRpb24ucnN0IiBpbnRvIFNp
bXBsaWZpZWQgQ2hpbmVzZSBhbmQgYWRqdXN0DQo+ID4gemhfQ04vc3RhZ2luZy9pbmRleC5yc3Qu
DQo+ID4NCj4gPiBVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IDYzODJmNGU0
ZTdiZA0KPiA+ICgiRG9jdW1lbnRhdGlvbjogZml4IHNwZWN1bGF0aW9uLnJzdCBjaGFwdGVyIikN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEN1aSBXZWkgPGNocmlzLndlaS5jdWlAZ21haWwuY29t
Pg0KPg0KPiBSZXZpZXdlZC1ieTogRG9uZ2xpYW5nIE11IDxkem05MUBodXN0LmVkdS5jbj4NCj4N
Cj4gPiAtLS0NCj4NCj4gTmV4dCB0aW1lLCBwbGVhc2UgcmVtZW1iZXIgdG8gYWRkIHRoZSBjaGFu
Z2Vsb2cuIEZvciBleGFtcGxlLA0KPg0KPiB2Mi0+djM6IGFkZCB0aGUgdHJhY2tpbmcgY29tbWl0
IG9mIEVuZ2xpc2ggZG9jdW1lbnQNCj4gdjEtPnYyOiBhZGRyZXNzIHRoZSBjb21tZW50cyBmcm9t
IERvbmdsaWFuZyBNdQ0KPg0KPiBEb25nbGlhbmcgTXUNCj4NCj4gPiAgLi4uL3RyYW5zbGF0aW9u
cy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdCAgICAgIHwgIDIgKy0NCj4gPiAgLi4uL3poX0NOL3N0
YWdpbmcvc3BlY3VsYXRpb24ucnN0ICAgICAgICAgICAgIHwgODUgKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3N0YWdpbmcvc3BlY3VsYXRpb24ucnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc3RhZ2luZy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdA0KPiA+IGluZGV4IGJiNTVjODFj
ODRhMy4uNmQ2OGZhYmNlMTc1IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3N0YWdpbmcvaW5kZXgucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vc3RhZ2luZy9pbmRleC5yc3QNCj4gPiBAQCAtMTMsNiArMTMsNyBA
QA0KPiA+ICAuLiB0b2N0cmVlOjoNCj4gPiAgICAgOm1heGRlcHRoOiAyDQo+ID4NCj4gPiArICAg
c3BlY3VsYXRpb24NCj4gPiAgICAgeHoNCj4gPg0KPiA+ICBUT0RPTGlzdDoNCj4gPiBAQCAtMjEs
NiArMjIsNSBAQCBUT0RPTGlzdDoNCj4gPiAgKiBsem8NCj4gPiAgKiByZW1vdGVwcm9jDQo+ID4g
ICogcnBtc2cNCj4gPiAtKiBzcGVjdWxhdGlvbg0KPiA+ICAqIHN0YXRpYy1rZXlzDQo+ID4gICog
dGVlDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3N0
YWdpbmcvc3BlY3VsYXRpb24ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
c3RhZ2luZy9zcGVjdWxhdGlvbi5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uYzM2ZDMzZjY3ODk3DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3N0YWdpbmcvc3BlY3VsYXRpb24u
cnN0DQo+ID4gQEAgLTAsMCArMSw4NSBAQA0KPiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiA+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4g
PiArDQo+ID4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9zdGFnaW5nL3NwZWN1bGF0aW9uLnJz
dA0KPiA+ICsNCj4gPiArOue/u+ivkToNCj4gPiArDQo+ID4gKyDltJTlt40gQ3VpIFdlaSA8Y2hy
aXMud2VpLmN1aUBnbWFpbC5jb20+DQo+ID4gKw0KPiA+ICs9PT09PT09PQ0KPiA+ICvmjqjmtYvm
iafooYwNCj4gPiArPT09PT09PT0NCj4gPiArDQo+ID4gK+acrOaWh+aho+ino+mHiuS6huaOqOa1
i+aJp+ihjOeahOa9nOWcqOW9seWTje+8jOS7peWPiuWmguS9leS9v+eUqOmAmueUqEFQSeadpeWH
j+i9u+S4jeiJr+W9seWTjeOAgg0KPiA+ICsNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4gKw0KPiA+ICvkuLrmj5Dpq5jmgKfog73lubblh4/lsJHlubPlnYflu7bov5/vvIzorrjlpJrn
jrDku6PlpITnkIblmajpg73ph4fnlKjliIbmlK/pooTmtYvnrYnmjqjmtYvmiafooYzmioDmnK/v
vIzmiafooYznu5PmnpwNCj4gPiAr5Y+v6IO95Zyo5ZCO57ut6Zi25q616KKr5Lii5byD44CCDQo+
ID4gKw0KPiA+ICvpgJrluLjmg4XlhrXkuIvvvIzmiJHku6zml6Dms5Xku47mnrbmnoTnirbmgIHv
vIjlpoLlr4TlrZjlmajlhoXlrrnvvInop4Llr5/liLDmjqjmtYvmiafooYzjgILnhLbogIzvvIzl
nKjmn5Dkupvmg4XlhrUNCj4gPiAr5LiL5LuO5b6u5p625p6E54q25oCB6KeC5a+f5YW25b2x5ZON
5piv5Y+v6IO955qE77yM5L6L5aaC5pWw5o2u5piv5ZCm5a2Y5Zyo5LqO57yT5a2Y5Lit44CC6L+Z
56eN54q25oCB5Y+v6IO95Lya5b2i5oiQDQo+ID4gK+S+p+S/oemBk++8jOmAmui/h+inguWvn+S+
p+S/oemBk+WPr+S7peaPkOWPluenmOWvhuS/oeaBr+OAgg0KPiA+ICsNCj4gPiAr5L6L5aaC77yM
5Zyo5YiG5pSv6aKE5rWL5a2Y5Zyo55qE5oOF5Ya15LiL77yM6L6555WM5qOA5p+l5Y+v6IO96KKr
5o6o5rWL5omn6KGM55qE5Luj56CB5b+955Wl44CC6ICD6JmR5Lul5LiL5Luj56CBOjoNCj4gPiAr
DQo+ID4gKyAgICAgICBpbnQgbG9hZF9hcnJheShpbnQgKmFycmF5LCB1bnNpZ25lZCBpbnQgaW5k
ZXgpDQo+ID4gKyAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChpbmRleCA+PSBNQVhf
QVJSQVlfRUxFTVMpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4g
KyAgICAgICAgICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
YXJyYXlbaW5kZXhdOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiAr5ZyoYXJtNjTkuIrvvIzl
j6/ku6XnvJbor5HmiJDlpoLkuIvmsYfnvJbluo/liJc6Og0KPiA+ICsNCj4gPiArICAgICAgIENN
UCAgICAgPGluZGV4PiwgI01BWF9BUlJBWV9FTEVNUw0KPiA+ICsgICAgICAgQi5MVCAgICBsZXNz
DQo+ID4gKyAgICAgICBNT1YgICAgIDxyZXR1cm52YWw+LCAjMA0KPiA+ICsgICAgICAgUkVUDQo+
ID4gKyAgbGVzczoNCj4gPiArICAgICAgIExEUiAgICAgPHJldHVybnZhbD4sIFs8YXJyYXk+LCA8
aW5kZXg+XQ0KPiA+ICsgICAgICAgUkVUDQo+ID4gKw0KPiA+ICvlpITnkIblmajmnInlj6/og73o
r6/pooTmtYvmnaHku7bliIbmlK/vvIzlubbmjqjmtYvmgKfoo4Xovb1hcnJheVtpbmRleF3vvIzl
jbPkvb9pbmRleCA+PSBNQVhfQVJSQVlfRUxFTVPjgIINCj4gPiAr6L+Z5Liq5YC86ZqP5ZCO5Lya
6KKr5Lii5byD77yM5L2G5o6o5rWL55qE6KOF6L295Y+v6IO95Lya5b2x5ZON5b6u5p625p6E54q2
5oCB77yM6ZqP5ZCO5Y+v6KKr5rWL6YeP5Yiw44CCDQo+ID4gKw0KPiA+ICvmtonlj4rlpJrkuKrk
vp3otZblhoXlrZjorr/pl67nmoTmm7TlpI3mnYLluo/liJflj6/og73kvJrlr7zoh7TmlY/mhJ/k
v6Hmga/ms4TpnLLjgILku6XliY3pnaLnmoTnpLrkvovkuLrln7rnoYDvvIzogIPomZENCj4gPiAr
5Lul5LiL5Luj56CBOjoNCj4gPiArDQo+ID4gKyAgICAgICBpbnQgbG9hZF9kZXBlbmRlbnRfYXJy
YXlzKGludCAqYXJyMSwgaW50ICphcnIyLCBpbnQgaW5kZXgpDQo+ID4gKyAgICAgICB7DQo+ID4g
KyAgICAgICAgICAgICAgIGludCB2YWwxLCB2YWwyLA0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
ICAgdmFsMSA9IGxvYWRfYXJyYXkoYXJyMSwgaW5kZXgpOw0KPiA+ICsgICAgICAgICAgICAgICB2
YWwyID0gbG9hZF9hcnJheShhcnIyLCB2YWwxKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAg
IHJldHVybiB2YWwyOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiAr5qC55o2u5o6o5rWL77yM
5a+5bG9hZF9hcnJheSgp55qE56ys5LiA5qyh6LCD55So5Y+v6IO95Lya6L+U5Zue5LiA5Liq6LaK
55WM5Zyw5Z2A55qE5YC877yM6ICM56ys5LqM5qyh6LCD55So5bCG5b2x5ZONDQo+ID4gK+S+nei1
luS6juivpeWAvOeahOW+ruaetuaehOeKtuaAgeOAgui/meWPr+iDveS8muaPkOS+m+S4gOS4quS7
u+aEj+ivu+WPluWOn+ivreOAgg0KPiA+ICsNCj4gPiAr57yT6Kej5o6o5rWL5omn6KGM5L6n5L+h
6YGTDQo+ID4gKz09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr5YaF5qC45o+Q5L6b5LqG
5LiA5Liq6YCa55SoQVBJ5Lul56Gu5L+d5Y2z5L2/5Zyo5o6o5rWL5oOF5Ya15LiL5Lmf6IO96YG1
5a6I6L6555WM5qOA5p+l44CC5Y+X5o6o5rWL5omn6KGM5L6n5L+h6YGT5b2x5ZONDQo+ID4gK+ea
hOaetuaehOW6lOW9k+WunueOsOi/meS6m+WOn+ivreOAgg0KPiA+ICsNCj4gPiArPGxpbnV4L25v
c3BlYy5oPuS4reeahGFycmF5X2luZGV4X25vc3BlYygp6L6F5Yqp5Ye95pWw5Y+v55So5LqO6Ziy
5q2i5L+h5oGv6YCa6L+H5L6n5L+h6YGT5rOE5ryP44CCDQo+ID4gKw0KPiA+ICvosIPnlKhhcnJh
eV9pbmRleF9ub3NwZWMoaW5kZXgsIHNpemUp5bCG6L+U5Zue5LiA5Liq57uP6L+H5YeA5YyW55qE
57Si5byV5YC877yM5Y2z5L2/5ZyoQ1BV5o6o5rWL5omn6KGMDQo+ID4gK+adoeS7tuS4i++8jOiv
peWAvOS5n+S8muiiq+S4peagvOmZkOWItuWcqFswLCBzaXplKeiMg+WbtOWGheOAgg0KPiA+ICsN
Cj4gPiAr6L+Z5Y+v5Lul55So5p2l5L+d5oqk5YmN6Z2i55qEbG9hZF9hcnJheSgp56S65L6LOjoN
Cj4gPiArDQo+ID4gKyAgICAgICBpbnQgbG9hZF9hcnJheShpbnQgKmFycmF5LCB1bnNpZ25lZCBp
bnQgaW5kZXgpDQo+ID4gKyAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChpbmRleCA+
PSBNQVhfQVJSQVlfRUxFTVMpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7
DQo+ID4gKyAgICAgICAgICAgICAgIGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGluZGV4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGluZGV4LCBNQVhfQVJSQVlfRUxFTVMpOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBhcnJheVtpbmRleF07DQo+ID4gKyAgICAg
ICAgICAgICAgIH0NCj4gPiArICAgICAgIH0NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo+ID4N
Cg==
