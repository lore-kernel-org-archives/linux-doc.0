Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255928E3F
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 03:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095511; cv=none; b=pZRQnj4SDPC1XP1Ta7fzAoicsR0chgBNStOChv/ivLxf1ahrivagR6AdI0IwTArfUMuL6GUCsUEGoazRUptkBAdRLApArZhIgSILTnCUXCVCIqSfHljhaGOsRVywCD+sbseiXZgEzfY2X9w1MeE1xMLJaKj4x0LJ9v7gS+2MnFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095511; c=relaxed/simple;
	bh=WrBRUUMdHFERZspXVAJO/k9wAx40lD1zgonWVURubHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItuXClZpRdeMfQrRhEgHe8VRDhF5pASfbvj/ZDBmTRT1KQH0SdkbCSrwE3QZ5hpliZieqpfkQAAVYEZFAJSEVZEzyxNN3TI+k/rXRWjWsYfxC+DVf3OIUomYCrAAHJIAeiFfB0crTAADwCs+7wsFCf/YvnST5A6Yss78Cr8Kigw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5+J5cLb; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5+J5cLb"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-602c3f113bbso903315a12.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 20:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749095508; x=1749700308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrBRUUMdHFERZspXVAJO/k9wAx40lD1zgonWVURubHM=;
        b=Y5+J5cLbJARwpnzOxW7C/vcMHp8biPdBE5y3estty4B+6zvr5ftLOaxGA/lzjrTaho
         Sc7ZKu0Mft1SgjfkiHWnH8YpFXrycVAcJF7X1awx/66ahMlXMIB8h6HItEmSpBIgdyQR
         JY7NRH4K3szOzs9z/dUqn8IDxm+USajTCfGwseQ+OHvZ1egSMle5MERY07kY4nV4TwLw
         9lgfEQKAT79DxYexOQftMy22EjR+6mOxJXYXpDWrA/ITnyvHKzZFnEod+VC0en77uhV1
         gjr2P3GsYpZYUUU5HUdbXVpotSjOkOSZEGonOgDilWWnhCB8sFjQ60NaEzohIXozwuoR
         ZaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749095508; x=1749700308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrBRUUMdHFERZspXVAJO/k9wAx40lD1zgonWVURubHM=;
        b=h5T26tTYmNabbhrToF9auWtYL7ZyuLtggTuI+gfIQN6qauQaAs2xxoXVClf8nz20K5
         m8aQTqtXITrkCQG44yhNJ2ggNdOb6sUxqBYH3QC7AOE7gNcv69qHhlsQ6dvTtbenoy3i
         fE5EqUhgSshx4ir0GcojRr3t+Ux8qGK2+W3iQoVUfJGQMlhZNjZgxjNPuU0nrLCdY2bL
         zmAwhgopwpeo9j9UWRgiC93a6RlEhWaxteVJODQzQWqG7JbuBtgxtZrz7PTavUQljMRe
         C813GOUuQwUFpzm2aWDvDLaF84J1WDx6SO0vmX1BQKSTMFsEkZ7/bebXAPpA4bYpHKbC
         emCA==
X-Forwarded-Encrypted: i=1; AJvYcCVSEAr7zsLWOjVCj5SclatQ0mEdvGdfSJs8zAu/W2DfrhDxrlt1VLQlbDSrg7KF5hwCgyoMeJNkams=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4Z88JwVu/PN/J8BUUznpVo/wHtoNu5WLhZK7nrygTMwwr9RS
	/SwP3V+rZ5cnGfaOxGfkg0Mxlc6KQRzYRzI8A8msIDJTtjn+mFzN9dt8sAT6yf0ArIO87/Wo2/H
	JUC/WgWP3LSVX53gCGHJZKZK0A8bTnEo=
X-Gm-Gg: ASbGncsmsCa+wEVM4eadcFJIGsxEhHFQMmrgmlFx5QVzwTVt0O7/4iyypsv8ey3MIUv
	YoLQM6vpQoZF7TrYPvvrFjUNasttYwuqxhXKDQKUKeTTk0XCLZH+hrV0nnBCHvkNlGtlrmJHdOG
	vIYF1LqyP6XfOTixN5C4ZISqP66C5010u3NUU=
X-Google-Smtp-Source: AGHT+IGKsKz/9VpuwNQNW0drUsZYHUHR/9vKKVj+v/39CwLuiOXpEy28kxqVtltbxxc7ZIc6MKjB66S15iH/cKjGvf0=
X-Received: by 2002:a05:6402:234f:b0:602:1b8b:2925 with SMTP id
 4fb4d7f45d1cf-606ea3a7609mr4447972a12.29.1749095507524; Wed, 04 Jun 2025
 20:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604095036.3100-1-chris.wei.cui@gmail.com>
In-Reply-To: <20250604095036.3100-1-chris.wei.cui@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 5 Jun 2025 11:51:20 +0800
X-Gm-Features: AX0GCFuioEGi88pnBnhw6GnKNnbaPB6fezZXP4qxKl5-O4DTblJD9UZ9LwsnrAE
Message-ID: <CAD-N9QWh_KORr21nx=Q5CVWvZ5_D1JN=p5up6JHcr0RX7LPaow@mail.gmail.com>
Subject: Re: [PATCH] Docs/zh_CN: Translate speculation.rst to Simplified Chinese
To: chris.wei.cui@gmail.com
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBKdW4gNCwgMjAyNSBhdCA1OjUx4oCvUE0gPGNocmlzLndlaS5jdWlAZ21haWwuY29t
PiB3cm90ZToNCj4NCj4gRnJvbTogQ3VpIFdlaSA8Y2hyaXMud2VpLmN1aUBnbWFpbC5jb20+DQo+
DQo+IHRyYW5zbGF0ZSB0aGUgInNwZWN1bGF0aW9uLnJzdCIgaW50byBTaW1wbGlmaWVkIENoaW5l
c2UgYW5kIGFkanVzdA0KPiB6aF9DTi9zdGFnaW5nL2luZGV4LnJzdC4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogQ3VpIFdlaSA8Y2hyaXMud2VpLmN1aUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgLi4uL3Ry
YW5zbGF0aW9ucy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdCAgICAgIHwgIDIgKy0NCj4gIC4uLi96
aF9DTi9zdGFnaW5nL3NwZWN1bGF0aW9uLnJzdCAgICAgICAgICAgICB8IDg1ICsrKysrKysrKysr
KysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3N0YWdpbmcvc3BlY3VsYXRpb24ucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3N0YWdpbmcvaW5kZXgucnN0DQo+IGluZGV4IGJiNTVjODFjODRh
My4uNmQ2OGZhYmNlMTc1IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9zdGFnaW5nL2luZGV4LnJzdA0KPiBAQCAtMTMsNiArMTMsNyBAQA0KPiAgLi4g
dG9jdHJlZTo6DQo+ICAgICA6bWF4ZGVwdGg6IDINCj4NCj4gKyAgIHNwZWN1bGF0aW9uDQo+ICAg
ICB4eg0KPg0KPiAgVE9ET0xpc3Q6DQo+IEBAIC0yMSw2ICsyMiw1IEBAIFRPRE9MaXN0Og0KPiAg
KiBsem8NCj4gICogcmVtb3RlcHJvYw0KPiAgKiBycG1zZw0KPiAtKiBzcGVjdWxhdGlvbg0KPiAg
KiBzdGF0aWMta2V5cw0KPiAgKiB0ZWUNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3N0YWdpbmcvc3BlY3VsYXRpb24ucnN0IGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vc3RhZ2luZy9zcGVjdWxhdGlvbi5yc3QNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi42MWU0NDk1YTFiNGUNCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zdGFnaW5nL3Nw
ZWN1bGF0aW9uLnJzdA0KPiBAQCAtMCwwICsxLDg1IEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMA0KPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0
DQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9zdGFnaW5nL3NwZWN1bGF0aW9uLnJz
dA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5bSU5beNIEN1aSBXZWkgPGNocmlzLndlaS5j
dWlAZ21haWwuY29tPg0KPiArDQo+ICs9PT09PT09PQ0KPiAr5o6o5rWL5omn6KGMDQo+ICs9PT09
PT09PQ0KPiArDQo+ICvmnKzmlofmoaPop6Pph4rkuobmjqjmtYvmiafooYznmoTmvZzlnKjlvbHl
k43vvIzku6Xlj4rlpoLkvZXkvb/nlKjpgJrnlKhBUEnmnaXlh4/ovbvkuI3oia/lvbHlk43jgIIN
Cj4gKw0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK+S4uuaPkOmrmOaAp+iDveW5
tuWHj+WwkeW5s+Wdh+W7tui/n++8jOiuuOWkmueOsOS7o0NQVemDvemHh+eUqOWIhuaUr+mihOa1
i+etieaOqOa1i+aJp+ihjOaKgOacr++8jOaJp+ihjOe7k+aenOWPr+iDvQ0KPiAr5Zyo56iN5ZCO
6Zi25q616KKr5Lii5byD44CCDQoNCueojeWQjiAtPiDlkI7nu60NCg0KPiArDQo+ICvpgJrluLjm
g4XlhrXkuIvvvIzlnKjmnrbmnoTnirbmgIHml6Dms5Xop4Llr5/liLDmjqjmtYvmiafooYzvvIzk
vovlpoLlr4TlrZjlmajlhoXlrrnjgILnhLbogIzvvIzlnKjmn5Dkupvmg4XlhrXkuIvku44NCg0K
IuWcqOaetuaehOeKtuaAgSIg6L+Z5LiA5Y+l5LiN6YCa6aG677yM5Y+C6ICDIOKAnOaIkeS7rOaX
oOazleS7juaetuaehOeKtuaAge+8iOWmguWvhOWtmOWZqOWGheWuue+8ieS4reingua1i+WIsOaO
qOa1i+aJp+ihjOKAneOAgg0KDQo+ICvlvq7mnrbmnoTnirbmgIHop4Llr5/lhbblvbHlk43mmK/l
j6/og73nmoTvvIzkvovlpoLmlbDmja7mmK/lkKblrZjlnKjkuo5DYWNoZeS4reOAgui/meenjeeK
tuaAgeWPr+iDveS8muW9ouaIkA0KPiAr5L6n5L+h6YGT77yM6YCa6L+H6KeC5a+f5L6n5L+h6YGT
5Y+v5Lul5o+Q5Y+W56eY5a+G5L+h5oGv44CCDQoNCkNhY2hlIOWPr+S7pee/u+ivkeS4uue8k+Wt
mO+8jOS4jemcgOimgeS/neeVmQ0KDQo+ICsNCj4gK+S+i+Wmgu+8jOWcqOWtmOWcqOWIhuaUr+mi
hOa1i+eahOaDheWGteS4i++8jOi+ueeVjOajgOafpeacieWPr+iDveiiq+aOqOa1i+aJp+ihjOea
hOS7o+eggeW/veeVpeOAguivt+iAg+iZkeS7peS4i+S7o+eggTo6DQoNCiLlnKjlrZjlnKjliIbm
lK/pooTmtYvnmoTmg4XlhrXkuIsiIC0+ICLlnKjliIbmlK/pooTmtYvlrZjlnKjnmoTmg4XlhrXk
uIsi77yM6L+Z5qC35pu056ym5ZCI6ZiF6K+75Lmg5oOvDQoNCj4gKw0KPiArICAgICAgIGludCBs
b2FkX2FycmF5KGludCAqYXJyYXksIHVuc2lnbmVkIGludCBpbmRleCkNCj4gKyAgICAgICB7DQo+
ICsgICAgICAgICAgICAgICBpZiAoaW5kZXggPj0gTUFYX0FSUkFZX0VMRU1TKQ0KPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gKyAgICAgICAgICAgICAgIGVsc2UNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGFycmF5W2luZGV4XTsNCj4gKyAgICAgICB9DQo+
ICsNCj4gK+WcqGFybTY05LiK77yM5Y+v5Lul57yW6K+R5oiQ5aaC5LiL5rGH57yW5bqP5YiXOjoN
Cj4gKw0KPiArICAgICAgIENNUCAgICAgPGluZGV4PiwgI01BWF9BUlJBWV9FTEVNUw0KPiArICAg
ICAgIEIuTFQgICAgbGVzcw0KPiArICAgICAgIE1PViAgICAgPHJldHVybnZhbD4sICMwDQo+ICsg
ICAgICAgUkVUDQo+ICsgIGxlc3M6DQo+ICsgICAgICAgTERSICAgICA8cmV0dXJudmFsPiwgWzxh
cnJheT4sIDxpbmRleD5dDQo+ICsgICAgICAgUkVUDQo+ICsNCj4gK0NQVeacieWPr+iDveivr+mi
hOa1i+adoeS7tuWIhuaUr++8jOW5tuaOqOa1i+aAp+ijhei9vWFycmF5W2luZGV4Xe+8jOWNs+S9
v2luZGV4ID49IE1BWF9BUlJBWV9FTEVNU+OAgg0KPiAr6L+Z5Liq5YC86ZqP5ZCO5Lya6KKr5Lii
5byD77yM5L2G5o6o5rWL55qE6KOF6L295Y+v6IO95Lya5b2x5ZON5b6u5L2T57O757uT5p6E54q2
5oCB77yM6ZqP5ZCO5Y+v6KKr5rWL6YeP5Yiw44CCDQoNCkNQVeWPr+S7pee/u+ivkeS4uuWkhOeQ
huWZqOaIluS4reWkruWkhOeQhuWZqOOAgg0KDQoNCj4gKw0KPiAr5raJ5Y+K5aSa5Liq5L6d6LWW
5YaF5a2Y6K6/6Zeu55qE5pu05aSN5p2C5bqP5YiX5Y+v6IO95Lya5a+86Ie05pWP5oSf5L+h5oGv
5rOE6Zyy44CC5Lul5YmN6Z2i55qE56S65L6L5Li65Z+656GA77yM6ICD6JmRDQo+ICvku6XkuIvk
u6PnoIE6Og0KPiArDQo+ICsgICAgICAgaW50IGxvYWRfZGVwZW5kZW50X2FycmF5cyhpbnQgKmFy
cjEsIGludCAqYXJyMiwgaW50IGluZGV4KQ0KPiArICAgICAgIHsNCj4gKyAgICAgICAgICAgICAg
IGludCB2YWwxLCB2YWwyLA0KPiArDQo+ICsgICAgICAgICAgICAgICB2YWwxID0gbG9hZF9hcnJh
eShhcnIxLCBpbmRleCk7DQo+ICsgICAgICAgICAgICAgICB2YWwyID0gbG9hZF9hcnJheShhcnIy
LCB2YWwxKTsNCj4gKw0KPiArICAgICAgICAgICAgICAgcmV0dXJuIHZhbDI7DQo+ICsgICAgICAg
fQ0KPiArDQo+ICvmoLnmja7mjqjmtYvvvIzlr7lsb2FkX2FycmF5KCnnmoTnrKzkuIDmrKHosIPn
lKjlj6/og73kvJrov5Tlm57kuIDkuKrotornlYzlnLDlnYDnmoTlgLzvvIzogIznrKzkuozmrKHo
sIPnlKjlsIblvbHlk40NCj4gK+S+nei1luS6juivpeWAvOeahOW+ruS9k+ezu+e7k+aehOeKtuaA
geOAgui/meWPr+iDveS8muaPkOS+m+S4gOS4quS7u+aEj+ivu+WPluWOn+ivreOAgg0KPiArDQo+
ICvnvJPop6PmjqjmtYvmiafooYzkvqfkv6HpgZMNCj4gKz09PT09PT09PT09PT09PT09PQ0KPiAr
DQo+ICvlhoXmoLjmj5DkvpvkuobkuIDkuKrpgJrnlKhBUEnku6Xnoa7kv53ljbPkvb/lnKjmjqjm
tYvmg4XlhrXkuIvkuZ/og73pgbXlrojovrnnlYzmo4Dmn6XjgILlj5fmjqjmtYvmiafooYzkvqfk
v6HpgZPlvbHlk40NCj4gK+eahOaetuaehOW6lOW9k+WunueOsOi/meS6m+WOn+ivreOAgg0KPiAr
DQo+ICs8bGludXgvbm9zcGVjLmg+5Lit55qEYXJyYXlfaW5kZXhfbm9zcGVjKCnovoXliqnlh73m
lbDlj6/nlKjkuo7pmLLmraLkv6Hmga/pgJrov4fkvqfkv6HpgZPms4TmvI/jgIINCj4gKw0KPiAr
6LCD55SoYXJyYXlfaW5kZXhfbm9zcGVjKGluZGV4LCBzaXplKeWwhui/lOWbnuS4gOS4que7j+i/
h+WHgOWMlueahOe0ouW8leWAvO+8jOWNs+S9v+WcqENQVeaOqOa1i+aJp+ihjA0KPiAr5p2h5Lu2
5LiL77yM6K+l5YC85Lmf5Lya6KKr5Lil5qC86ZmQ5Yi25ZyoIFswLCBzaXplKSDojIPlm7TlhoXj
gIINCj4gKw0KPiAr6L+Z5Y+v5Lul55So5p2l5L+d5oqk5YmN6Z2i55qEIGxvYWRfYXJyYXkoKSDn
pLrkvos6Og0KPiArDQo+ICsgICAgICAgaW50IGxvYWRfYXJyYXkoaW50ICphcnJheSwgdW5zaWdu
ZWQgaW50IGluZGV4KQ0KPiArICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgIGlmIChpbmRleCA+
PSBNQVhfQVJSQVlfRUxFTVMpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0K
PiArICAgICAgICAgICAgICAgZWxzZSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGluZGV4
ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGluZGV4LCBNQVhfQVJSQVlfRUxFTVMpOw0KPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gYXJyYXlbaW5kZXhdOw0KPiArICAgICAgICAgICAgICAg
fQ0KPiArICAgICAgIH0NCj4gLS0NCj4gMi40My4wDQo+DQo+DQo=
