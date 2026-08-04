Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4700336215F
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785869330; cv=pass; b=tRvcdJQxVL36w+83Be0fsoz6eXpgnL3kV9j/oR8hbi9OnVgdAiOuPo1eiBltbkwFk+dBIcJQY55f1YaGkqbCd9hTvZy4JzbwMUQxO0ejZtAHPMjgcrK4VQA9gAy57spLHuPJm0jgrHTThOPmO+SOptdKp+MzM1LVDbTBKGvMwoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785869330; c=relaxed/simple;
	bh=/h4kXJRz24E5xkSqTYgtAWjIK1sj5QsKN0ejpvUoBok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0vfwgjuyeIgkSkhhCVWiDdOXbezVC8Xv7+ENhiZeRurc03UD7jsvWajcMjHfCA9mv+8CyD/BT7W2RCpDDjVHZ0cynTtEMtbqHGzvNO2V3/hUIrjsidW8sV8KBf1qZau8w4CTpHOSOzc1yHFKqWes5/NlCwWmgDMph+7GE4ievM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmalfBL1; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmalfBL1"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso16970e87.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 11:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785869327; cv=none;
        d=google.com; s=arc-20260327;
        b=MU9p3B8xjb32bXVZHeghjst05u+hId04RvgN5Dtc2zjUpulIYvT9FrouNV9GDYybRm
         HT0cWuSRu8l4NTlkbi6Cic1eanI+62MPnI0PiFqYg9SwXQd/etA2+sP9KXlQ6Vg46V5t
         XzwWnCAufjwMfV1DJmVjdG8joTLf9Yk0P0EMxTEkbdlkAnnVFhV3nDQu2aqfxamr7tHY
         LaB6Tqu6q5GkKTRsmnScZ+X/8rTLGW+fmwg5HZvKXDuvzpzS5aHB7LAuZknTrfGjbaPT
         i4unqSIMylFAed+57hGs/Toj9eYs/cE5AT85pvliBxD3j6kQi34XnxWkLMnJbzxQDko/
         u7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/h4kXJRz24E5xkSqTYgtAWjIK1sj5QsKN0ejpvUoBok=;
        fh=qh6R4NQX5hnkWZvIxvlrqyWCfMSvrRLDfRDgpGElK5o=;
        b=jgfFiTsN5pN5ByGm25eCWXiWrH/CvBa1iiqxzEmJ1qIKMD6jitfMYGPFyoA6eqt2fJ
         iRlKC6+NMqC4M1xgOCkKoEFfkzX6B41aZXXLD+a0kb043RT4Bywdf1heEYLAY1BaonlU
         DGo6PaYt0gpsR62u1vErlJLwSQTjLVR4+xwqqwDj4YYRNC15qjJN1uJjpwnkzl7+A7ke
         jXelRUqP6MivqlrziQXGwd3+8peVVC9//GcqN1+wrHSgkTGwNMpexeXBVVx5lEibIEPS
         aMxZl44JlSvAENz6u68yW62sGOsyhtL8OTFdT7eun70ZCXcGLvMEPswMLFL3t23UD+ao
         2rsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785869327; x=1786474127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/h4kXJRz24E5xkSqTYgtAWjIK1sj5QsKN0ejpvUoBok=;
        b=DmalfBL1q0nWjZu0Gboclyt0fVNr4+2r8/6qMrgW98s1s3pxgJgQWd1tVzQDytKUm3
         qG8ctociDrhG+3pFIndPlm9jc7g/vSiCG/w/HJTHO+tXXJaqo7B/Hi43h2424HFvLN+7
         xRTCTk0rCEuA+2HZFiyGY0C/1IOzwwuN5FC8K0YloCJVLtdfP9gIEgpudUaOPQUBox5a
         eRZB5nTROdfsZ26YpNyf3ot92Y3Oeb7w0qQQMtFBsLYasphEWA4BKeTB1JwU8tdWth0/
         eUicGAWuEJW/o7i0yh5GUSykDm3Zp3MALISCkwAUwpGPBLFDxa2iBukYdxXlE7QwXHdj
         mPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785869327; x=1786474127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/h4kXJRz24E5xkSqTYgtAWjIK1sj5QsKN0ejpvUoBok=;
        b=C2d7w/qz8kFEo27a5QmcwgBVd76cfjun2O80pZCl2KdcdzZbPbITfl+vf0r1O9tBAR
         9TfboJuYpk7FZC8nPweo1Dr9eQCqhSHen2cg5TDAbs4OvHvLzv6Vi9fTuYX3EX2y8JWR
         WFxcb4FTRaTX0rBX+lnvgYicrr1MT0bevBHknsmnTNCqHgvgD+g18QsfS6nYWPwNoHZw
         MQuSHrDSDQRpctczB2ZWbI/GiIiHj0K4u9MrIDw3FzfIJpV/bJFNGeSRj/qMxAI4CRMW
         GhtyyE2w13ODkZdvWe1NUkdqLxGlE4dK/RNknUTe7V2gyqL0n/Gn0n2TvfQo2KrXvq1v
         72MA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7ZLrRVNIh92HX8YEOvVvfkjgW6DIl7y+iYILcPIeJtrlFeH4c85gU4IHs/Hf3TZJ41tEhSHHvwO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwBEizIXWal5Px3z2Q0Jp5ZYvs12rS3llo5eovbJDww8VfKDAU
	orEeEoYumKW8fDT1t7/QMS4VY1QmEwNFW1GoRPuQJ4T8LNNNtx2ZFjf2i/sDRV6jZpSFSqajo67
	bb4pzeIZsp2yFmMopb8zXwwu6mjoZ5iM=
X-Gm-Gg: AR+sD13GrKVUZaxLePVTXCCJMB9S9et1RtRoFITEYb6to9PbhcrcivWR+ehMGoRyBRi
	VhvbITnWUuMAn42nvXCDfC+LqRLuFkQWRJvLII2HVkabUqCxUGQ4xieGktEZ5XBO03bANSN2dZ+
	jPDVvs0uZ8MrSgFFpUCxQMBxO7Duni/mgxBZgArlhnUy7ZvHUHm8Y+/3+bjm8qGBSxPV04OwfcP
	WX9/MAi6JVJ8dKLuyhL/T01Jj7orimUHLLhl6mOdo9dU/Wc9TfmFEqvQ5Md7rViR+stNqsG3YRl
	/Si3GI+aZ7uVlENnvrauDbtXbiCHY0HypRnKfaO2m/H/0YqMbEd7bXNKeT0akrKjvVd7BxhluQN
	pW0Q2ILnpDg8bybtBjQOn3xQ8kL+0ncpF7Cunig==
X-Received: by 2002:ac2:5693:0:b0:5b0:2ba4:542d with SMTP id
 2adb3069b0e04-5b2f4ccb4edmr97407e87.3.1785869327085; Tue, 04 Aug 2026
 11:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-11-chenyou910331@gmail.com> <anDANHRAHb3wr2o8@wyuan.org>
In-Reply-To: <anDANHRAHb3wr2o8@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Wed, 5 Aug 2026 02:48:35 +0800
X-Gm-Features: AUfX_mzEECOqQrF6KlDOIUXb24ppHhX0gry5Xp-gUMW3FDkMKYiYSi7y_Zwa1CM
Message-ID: <CAKspUhL-1fh8o19aEvLzxVGMqvnFtmP0XksS7ni5QCYNBWqSKw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] docs/zh_TW: process: localize terminology in 2.Process.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBBdWcgMDQsIDIwMjYgYXQgMTI6MjI6MTJBTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+IEVpdGhlcjogYWRkIGEgPHNwYWNlPiBiZWZvcmUgc3RhZ2luZw0KPiBPcjogcmVtb3Zl
IHRoZSA8c3BhY2U+IGFmdGVyIHN0YWdpbmcNCj4NCj4gW0FdIEdyZWcgS3JvYWgtSGFydG1hbiDn
m67liY3osqDosqzntq3orbdzdGFnaW5n5qi544CCDQo+IFtCXSBHcmVnIEtyb2FoLUhhcnRtYW4g
55uu5YmN6LKg6LKs57at6K23IHN0YWdpbmcg5qi544CCDQo+DQo+IFdoaWNoIG9uZSBkbyB5b3Ug
cHJlZmVyPyBJIHRoaW5rIHRoZSBmaXJzdCBvcHRpb24gaXMgbW9yZSBjb25zaXN0ZW50DQo+IHdp
dGggdGhlIHVzYWdlIHRocm91Z2hvdXQgdGhlIHRleHQuDQoNClNvcnJ5LCBJIG1pc3JlYWQgdGhh
dCBhcyB0d28gc2VwYXJhdGUgY2hhbmdlcy4gWW91IGFyZSByaWdodCB0aGF0IGl0DQpzaG91bGQg
YmUgb25lIG9yIHRoZSBvdGhlci4NCg0KSSB3ZW50IGFuZCBjb3VudGVkIGFjcm9zcyB0aGUgd2hv
bGUgemhfVFcgdHJlZSwgbWF0Y2hpbmcgYSBDSksNCmNoYXJhY3RlciBkaXJlY3RseSBhZGphY2Vu
dCB0byBhbiBBU0NJSSBhbHBoYW51bWVyaWMgd2l0aCBhbmQgd2l0aG91dA0KYSBzcGFjZToNCg0K
ICB3aXRob3V0IHNwYWNlOiAyNTgxDQogIHdpdGggc3BhY2U6ICAgICA3MjENCg0KMi5Qcm9jZXNz
LnJzdCBpdHNlbGYgaXMgNjkgd2l0aG91dCAvIDIyIHdpdGguIFNvIFtBXSBpdCBpcywgYm90aCBm
b3INCnRoZSBmaWxlIGFuZCBmb3IgdGhlIHRyZWUgYXMgYSB3aG9sZS4gRml4ZWQgaW4gdjMuDQoN
CkZvciB3aGF0IGl0IGlzIHdvcnRoLCBteSBvd24gcHJlZmVyZW5jZSBhcyBhIFRhaXdhbmVzZSBy
ZWFkZXIgd291bGQNCmhhdmUgYmVlbiBbQl0gLS0gYSBzcGFjZSBiZXR3ZWVuIENKSyBhbmQgTGF0
aW4gdGV4dCBpcyBlYXNpZXIgdG8gcmVhZA0KYW5kIGlzIHdoYXQgbW9zdCBUYWl3YW5lc2UgdGVj
aG5pY2FsIHdyaXRpbmcgZG9lcyBub3dhZGF5cy4gQnV0IHRoZQ0KZXhpc3RpbmcgdHJhbnNsYXRp
b25zIG92ZXJ3aGVsbWluZ2x5IGRvIG5vdCwgYW5kIHRoaXMgc2VyaWVzIGlzIGFib3V0DQp0ZXJt
aW5vbG9neSwgbm90IHR5cG9ncmFwaHkuIE1peGluZyB0aGUgdHdvIHdvdWxkIG1ha2UgaXQgbXVj
aCBoYXJkZXINCnRvIHJldmlldy4NCg0KVGhhdCBzYWlkLCBpdCBpcyBwcm9iYWJseSB3b3J0aCB3
cml0aW5nIHRoZSBydWxlIGRvd24gcmF0aGVyIHRoYW4NCmxlYXZpbmcgZWFjaCBjb250cmlidXRv
ciB0byBndWVzcy4gSSB3b3VsZCBzdWdnZXN0Og0KDQogIC0gbm8gc3BhY2UgYmV0d2VlbiBDSksg
YW5kIEFTQ0lJIChmb2xsb3dpbmcgZXhpc3RpbmcgcHJhY3RpY2UpDQogIC0gYXBwbHkgaXQgdG8g
bmV3IHRyYW5zbGF0aW9ucyBhbmQgdG8gcGFyYWdyYXBocyB0aGF0IGFyZSBiZWluZw0KICAgIHJl
d3JpdHRlbiBhbnl3YXkNCiAgLSBkbyBub3QgZ28gYmFjayBhbmQgbm9ybWFsaXplIGV4aXN0aW5n
IGZpbGVzDQoNClRoZSBsYXN0IHBvaW50IG1hdHRlcnM6IGEgdHJlZS13aWRlIHdoaXRlc3BhY2Ug
cGFzcyB3b3VsZCB0b3VjaCBhbGwgNTENCnpoX1RXIGZpbGVzIGZvciBubyBzZW1hbnRpYyBnYWlu
LCB3aGljaCBpcyBleGFjdGx5IHRoZSBraW5kIG9mIGNodXJuDQpKb24gb2JqZWN0ZWQgdG8gaW4g
dGhlIE1BSU5UQUlORVJTIHRocmVhZC4gSSB3aWxsIGFkZCB0aGlzIHRvIHRoZQ0KZ2xvc3Nhcnkg
aW4gdjMgdW5sZXNzIHlvdSB0aGluayBpdCBiZWxvbmdzIGluIHRoZSBob3ctdG8gaW5zdGVhZC4N
Cg0KQ2hlbi1ZdQ0KDQpXZWlqaWUgWXVhbiA8d3lAd3l1YW4ub3JnPiDmlrwgMjAyNuW5tDjmnIg0
5pel6YCx5LqMIOS4i+WNiDEyOjEz5a+r6YGT77yaDQo+DQo+IE9uIFR1ZSwgSnVsIDI4LCAyMDI2
IGF0IDA1OjEwOjMyUE0gKzA4MDAsIENoZW4tWXUgWWVoIHdyb3RlOg0KPiA+IExvY2FsaXplIG1h
aW5sYW5kIHRlcm1zIHRvIFRhaXdhbmVzZSBNYW5kYXJpbiAo5YWn5qC44oaS5qC45b+DLCDnpL7l
jYDihpLnpL7nvqQsDQo+ID4g6YO1566x4oaS5L+h566xLCAuLi4pIGFuZCBzeW5jIHdpdGggdGhl
IEVuZ2xpc2ggb3JpZ2luYWw6IHJvbGxpbmctcmVsZWFzZQ0KPiA+IHdvcmRpbmcgd2l0aCB0aGUg
OS54IGV4YW1wbGUgYW5kIFdpa2lwZWRpYSBsaW5rLCA5LngtcmMxIGV4YW1wbGVzLA0KPiA+IHN0
YWJsZSB0ZWFtIG5vdyBHcmVnIEtyb2FoLUhhcnRtYW4gYW5kIFNhc2hhIExldmluLCBMVFMgbGlz
dCBtb3ZlZCB0bw0KPiA+IGtlcm5lbC5vcmcsIGxpbnV4LW5leHQgbWFpbnRhaW5lZCBieSBNYXJr
IEJyb3duLCBhbmQgbWFpbGluZyBsaXN0cw0KPiA+IGhvc3RlZCBhdCBzdWJzcGFjZS5rZXJuZWwu
b3JnLg0KPiA+DQo+ID4gdXBkYXRlIHRvIGNvbW1pdCA0NjI5ODM3NTQ3N2IgKCJsaW51eC1uZXh0
OiB1cGRhdGUgbWFpbnRhaW5lciBpbmZvLiIpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVu
LVl1IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi90cmFu
c2xhdGlvbnMvemhfVFcvcHJvY2Vzcy8yLlByb2Nlc3MucnN0ICB8IDMyNSArKysrKysrKystLS0t
LS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAxNjcgZGVsZXRp
b25zKC0pDQo+DQo+IFsuLi5dDQo+DQo+ID4gIFN0YWdpbmcg5qi5DQo+ID4gIC0tLS0tLS0tLS0N
Cj4gPg0KPiA+IC3lhafmoLjmupDku6PnorzmqLnljIXlkKtkcml2ZXJzL3N0YWdpbmcv55uu6YyE
77yM5YW25Lit5pyJ6Kix5aSa6amF5YuV56iL5bqP5oiW5paH5Lu257O757Wx55qE5a2Q55uu6YyE
DQo+ID4gLeato+WcqOiiq+a3u+WKoOWIsOWFp+aguOaoueS4reOAguWug+WAkeWcqOS7jeeEtumc
gOimgeabtOWkmueahOS/ruato+eahOaZguWAmeWPr+S7peS/neeVmeWcqGRyaXZlci9zdGFnaW5n
Lw0KPiA+IC3nm67pjITkuK3vvJvkuIDml6blrozmiJDvvIzlsLHlj6/ku6XlsIflroPlgJHnp7vl
iLDlhafmoLjkuK3jgILpgJnmmK/kuIDnqK7ot5/ouaTkuI3nrKblkIhMaW51eOWFp+aguOe3qOei
vOaIlg0KPiA+IC3os6rph4/mqJnmupbnmoTpqYXli5XnqIvluo/nmoTmlrnms5XvvIzkurrlgJHl
j6/og73luIzmnJvkvb/nlKjlroPlgJHkuKbot5/ouaTplovnmbzjgIINCj4gPiAr5qC45b+D5Y6f
5aeL56iL5byP56K85qi55YyF5ZCrZHJpdmVycy9zdGFnaW5nL+ebrumMhO+8jOWFtuS4reacieio
seWkmumpheWLleeoi+W8j+aIluaqlOahiOezu+e1seeahOWtkOebrumMhA0KPiA+ICvmraPlnKjo
oqvmt7vliqDliLDmoLjlv4PmqLnkuK3jgILlroPlgJHlnKjku43nhLbpnIDopoHmm7TlpJrnmoTk
v67mraPnmoTmmYLlgJnlj6/ku6Xkv53nlZnlnKhkcml2ZXIvc3RhZ2luZy8NCj4gPiAr55uu6YyE
5Lit77yb5LiA5pem5a6M5oiQ77yM5bCx5Y+v5Lul5bCH5a6D5YCR56e75Yiw5qC45b+D5Lit44CC
6YCZ5piv5LiA56iu6L+96Lmk5LiN56ym5ZCITGludXjmoLjlv4Pnt6jnorzmiJYNCj4gPiAr5ZOB
6LOq5qiZ5rqW55qE6amF5YuV56iL5byP55qE5pa55rOV77yM5Lq65YCR5Y+v6IO95biM5pyb5L2/
55So5a6D5YCR5Lim6L+96Lmk6ZaL55m844CCDQo+ID4NCj4gPiAtR3JlZyBLcm9haCBIYXJ0bWFu
IOebruWJjeiyoOiyrOe2reitt3N0YWdpbmcg5qi544CC5LuN6ZyA6KaB5L+u5q2j55qE6amF5YuV
56iL5bqP5bCH55m86YCB57Wm5LuW77yMDQo+ID4gLeavj+WAi+mpheWLleeoi+W6j+WcqGRyaXZl
cnMvc3RhZ2luZy/kuK3pg73mnInoh6rlt7HnmoTlrZDnm67pjITjgILpmaTkuobpqYXli5XnqIvl
uo/mupDmlofku7bkuYvlpJbvvIwNCj4gPiAt55uu6YyE5Lit6YKE5oeJ6Kmy5pyJ5LiA5YCLVE9E
T+aWh+S7tuOAglRPRE/mlofku7bliJflh7rkuobpqYXli5XnqIvluo/pnIDopoHmjqXlj5fnmoTm
mqvlgZznmoTlt6XkvZzvvIwNCj4gPiAt5Lul5Y+K6amF5YuV56iL5bqP55qE5Lu75L2V6KOc5LiB
6YO95oeJ6Kmy5oqE6YCB55qE5Lq65ZOh5YiX6KGo44CC55W25YmN55qE6KaP5YmH6KaB5rGC77yM
c3RhZ2luZ+eahOmpheWLlQ0KPiA+IC3nqIvluo/lv4XpoIjoh7PlsJHmraPnorrnt6jora/jgIIN
Cj4gPiArR3JlZyBLcm9haC1IYXJ0bWFuIOebruWJjeiyoOiyrOe2reittyBzdGFnaW5n5qi544CC
5LuN6ZyA6KaB5L+u5q2j55qE6amF5YuV56iL5byP5bCH55m86YCB57Wm5LuW77yMDQo+DQo+IE9v
cHMsIEkgZ3Vlc3MgSSBtaWdodCBub3Qgc2F5IGl0IGNsZWFybHkgbGFzdCB0aW1lLCBJIHNhaWQ6
DQo+DQo+ICB8IDEpIGFkZCBhIDxzcGFjZT4gYmVmb3JlIHN0YWdpbmcNCj4gIHwgMikgcmVtb3Zl
IHRoZSA8c3BhY2U+IGFmdGVyIHN0YWdpbmcNCj4NCj4gQWN0dWFsbHkgSSBtZWFuOg0KPg0KPiAg
RWl0aGVyOiBhZGQgYSA8c3BhY2U+IGJlZm9yZSBzdGFnaW5nDQo+ICBPcjogcmVtb3ZlIHRoZSA8
c3BhY2U+IGFmdGVyIHN0YWdpbmcNCj4NCj4gV2hpY2ggaXMuLg0KPg0KPiBbQV0gR3JlZyBLcm9h
aC1IYXJ0bWFuIOebruWJjeiyoOiyrOe2reitt3N0YWdpbmfmqLnjgILku43pnIDopoHkv67mraPn
moTpqYXli5XnqIvlvI/lsIfnmbzpgIHntabku5bvvIwNCj4NCj4gW0JdIEdyZWcgS3JvYWgtSGFy
dG1hbiDnm67liY3osqDosqzntq3orbcgc3RhZ2luZyDmqLnjgILku43pnIDopoHkv67mraPnmoTp
qYXli5XnqIvlvI/lsIfnmbzpgIHntabku5bvvIwNCj4NCj4gV2hpY2ggb25lIGRvIHlvdSBwcmVm
ZXI/IEkgdGhpbmsgdGhlIGZpcnN0IG9wdGlvbiBpcyBtb3JlIGNvbnNpc3RlbnQNCj4gd2l0aCB0
aGUgdXNhZ2UgdGhyb3VnaG91dCB0aGUgdGV4dC4NCj4NCj4gU28gbGV0J3MgYWRvcHQgb3B0aW9u
IEEgaW4gbmV4dCByZS1yb2xsLg0KPg0KPiA+ICvmr4/lgIvpqYXli5XnqIvlvI/lnKhkcml2ZXJz
L3N0YWdpbmcv5Lit6YO95pyJ6Ieq5bex55qE5a2Q55uu6YyE44CC6Zmk5LqG6amF5YuV56iL5byP
5Y6f5aeL5qqU5LmL5aSW77yMDQo+ID4gK+ebrumMhOS4remChOaHieipsuacieS4gOWAi1RPRE/m
qpTmoYjjgIJUT0RP5qqU5qGI5YiX5Ye65LqG6amF5YuV56iL5byP6ZyA6KaB5o6l5Y+X55qE5pqr
5YGc55qE5bel5L2c77yMDQo+ID4gK+S7peWPiumpheWLleeoi+W8j+eahOS7u+S9leijnOS4gemD
veaHieipsuaKhOmAgeeahOS6uuWToeWIl+ihqOOAgueVtuWJjeeahOimj+WJh+imgeaxgu+8jHN0
YWdpbmfnmoTpqYXli5UNCj4gPiAr56iL5byP5b+F6aCI6Iez5bCR5q2j56K657eo6K2v44CCDQo=
