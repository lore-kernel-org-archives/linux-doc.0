Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA15188CC9
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784875240; cv=pass; b=qamVJctn2mBeApI7YnPrQRpht2R4BqWn7m8IcU6rGbPU2b5nV5pLMohVv4+8U+Wo4HWFE65m4W8AZE2yXW7KnnSmN6WnnVGTH9n3gG7wW07PVc4/7j6wLi7CX37hztIHDFsIltVzMAgLI5UJj04hgBYI7uLtqPfKJ59db4fYnoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784875240; c=relaxed/simple;
	bh=lUcGl/8Hce7posMbtYckZkJu6L7i/0OSI1WMT1xMOdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pK8F6bukoMHE8nOVNSW4RF7V42EOAeoxyJzCdgnVHYQvq8MH5xiVFAu8udnrHVxTNl+FrrQPycOAHz/mtXuq03IWQ1vM8vA0isY4TnooRRKz/xvfyL3LKmOlZ73tAZpE7ei17fqSN9tFiX6jLIoO5qhMMXpJFdOzVzABEV4eBm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5l234Yb; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5l234Yb"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebd7da975so11949e87.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 23:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784875236; cv=none;
        d=google.com; s=arc-20260327;
        b=n1zV9dQfNHcTWBKNyxC2QNROye2YJBbEZbozoFpHYloMWLRsgVlAnQUJUMYJ6AQLyh
         4GRtPppKWaUtZHQZ+E5Rek2y3ZtBeNigttK0sYnn9qsUpTcdrN1F3xB07MhrrgIUWTeO
         ZSPW49aYiNgj9lxFRH5AcjrrQcO2zM34mpxB+oVQ8pKcVrAzYuIGYduZcE5tjly6hY9x
         go63K4W0xezmKSF6n+Xoq3b+6MaOg9GktYMGk/U2jf/qzQpWczRk3O3vJv5WlvlJL5K1
         9mbbldpn/oKuY/j/B1RLqyYsC2vnFij90y5orjqaAtHYwOgaCb2dtK/1ykdrAmFU6kZh
         Sasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUcGl/8Hce7posMbtYckZkJu6L7i/0OSI1WMT1xMOdA=;
        fh=9OJ7AH3MzsvPzvAQmqWXWf6tzk8Zu+OxTH0bqC0X9OI=;
        b=E0NMAwgge4/7rFUS+c/3WXcHpiM8uTX3BgpEHDIuanTn0rhsr/VCZ+WXV88Uatm+Hu
         pacdFIchb1954rqu/wUE5S1Aa77Tykz700w6RpOFbi2CIlrmPIOP7J8fXifxT1t10Dz1
         L1k5xjDS9DnuUza25xnc6Dr0le9cZed/rQ00EnUrDAc+uGQ+MgjNgqkgAfrJqfncJqDq
         WUG784PqJ/yuBsAhoCHaAPTAbfRVp/P8KdnfMxEliNUtVz590FNM3hKapUXSqNrN7Qtw
         JBLE8p6Jfg8rjU1pvFvqiDvtXPoEsbsLT+7r9OqBYdflJ69EYW4rpkoOPVeawDSFTR55
         b3MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784875236; x=1785480036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUcGl/8Hce7posMbtYckZkJu6L7i/0OSI1WMT1xMOdA=;
        b=p5l234Yb+ifZTxvYo0m4PFSvVbD49WGcPAGNbWTKBMI0WeW1z08eCqmF0JcouoEk2u
         Ft7cMQtvRdEujef8J+DesTzAotYvGXfNYwyEkcQVW51XuHceoCzi7DPXxpOdhy9GahNP
         svOrsGb1wRxMBwWf4/OA2El9fCWWcLbnLm9FZPWRPFiUmqd1npWV4qmnGhwoBkoKNQSU
         XFhPIQtZjCd6hL7mfcsWl3jmPrM4leKKxLDo92U1gsFePvOavKhfD8ErbUXOuwMqVN4M
         HlUauYpWbekSnfC1xKDmPkdTFqzqqM64uM1bE39ovOUCmSst8AP349b9MG4aNGoHb6ml
         EJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784875236; x=1785480036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUcGl/8Hce7posMbtYckZkJu6L7i/0OSI1WMT1xMOdA=;
        b=GMS2rM01XcaqdaimJixJW7y8pZ5gh9GoC26i94xvtpo5olGyj9AYnY6oLEQsLHokFQ
         3tmprwogvmV9Y0j93rM0gY+1VS1XiDmdzZNgzs/3yMyxOjUrakidJJBy24pQiWyw9CN6
         ZRaMvNhlFTt0iXjexje9ILbV/pPR8N0fUD4yYQw0fOwKCpXBtWAOO7RQrtLYPEn2rrxU
         uyVGdtGZUf+JGs2TyAEnZ+K5yjjs7+w1iMreZFqiYEuzpDQwPWio9VKKyrWORBypU+iN
         HWoRSZ0qcYba5MZ4pR792ssgldW1nCTljb4pltyz44kyJOZpYt+VS5iZOqK+IndHeHur
         DslQ==
X-Forwarded-Encrypted: i=1; AHgh+RoP3e6hmQm3LZcRHQNFwWSzvmCk+DA9g8Z692ZqZOEvoljL8VXXSD5tNCbYPDY26SNXHPVqG4pXPUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqFhmfHmcDr01m86mwkqF0yEs66w+8v5G5ZM/1ESSOeLhhoSTi
	o33CyuuskaagAkbGoUOniJ4sRVql8oJtjcKb2g3HuaLETaWXLYtax8LHfew1kq/oL4KWo3xBo9c
	+0CQcJRhBGg6Mxz1F/psPXY82mezY9zo=
X-Gm-Gg: AR+sD10/f8i2pdQkCZHZxqnqKY2DQ6L+dgeR7g+imb51QpNiFA0sx0gTKVGmHB8x+QE
	cz6Bo686i/5jQwhgCScw9UjIY1TYi+hof9hVbKhIdr6iDzAHPAycdoc1rmM9G/lI9c9rRxYVhEl
	BachfcsumRdL8wT0xPqjbDMlB2oYwDlkrINJIV+mtFulDl251XYQrUyjCg1wPYAy7Ytb7XbDV/0
	QXrLywAWWyzTGpsFNGPc0S63FmexlKDSTiI8pDOCQNpxO1pkCphcKe+Koe0EdjNu7TrqkDPe0KN
	sqYHZ7fW3RbncOb8a7fvgQCu7VUTap3qhCSwSB5QlAU4yq42wODEXKA=
X-Received: by 2002:a05:6512:3b09:b0:5b1:5c72:2f0d with SMTP id
 2adb3069b0e04-5b2b7b1bc4emr315142e87.4.1784875236348; Thu, 23 Jul 2026
 23:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-10-chenyou910331@gmail.com> <amG8fvBhiB4qb7bV@wyuan.org>
In-Reply-To: <amG8fvBhiB4qb7bV@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 24 Jul 2026 14:40:24 +0800
X-Gm-Features: AUfX_mwSoB3bYrvmFvFLJ95bNk_MDJaMY_yuK-iggbaO5jTZ3y-Rafp9SJU16Os
Message-ID: <CAKspUhLpAn=WEHW7rZZGeWKzNZ0waaO7c4hEUDHcF=2vrqCakA@mail.gmail.com>
Subject: Re: [PATCH 09/16] docs/zh_TW: process: localize terminology in 5.Posting.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBKdWwgMjMsIDIwMjYgYXQgMDM6MDI6MjJQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+IEluIHByb2Nlc3Mvc3RhYmxlLWtlcm5lbC5ydWxlcy5yc3QsIHlvdSBrZWVwICItc3Rh
YmxlIiBhcy1pcywgc28gaGVyZSwNCj4gc2hhbGwgd2UgY2hhbmdlIHRvICItc3RhYmxlIi8ic3Rh
YmxlIiBpbnN0ZWFkIG9mICLnqLPlrprniYgiPw0KPiBJIGRvbid0IGtub3cgd2hhdCdzIHRoZSBw
cmVmZXJyZWQgb25lIGluIFRhaXdhbiwgdGhvdWdoLg0KDQpHb29kIHBvaW50LCB0aGUgdHdvIGZp
bGVzIGFyZSBpbmNvbnNpc3RlbnQuIEFzIGEgbmF0aXZlIHNwZWFrZXI6IGluDQpUYWl3YW4gd2Ug
bm9ybWFsbHkgc2F5ICJzdGFibGUiIGluIEVuZ2xpc2ggd2hlbiByZWZlcnJpbmcgdG8gdGhlDQpr
ZXJuZWwncyBzdGFibGUgdHJlZSBvciB0aGUgLXN0YWJsZSByZWxlYXNlcywgc28ga2VlcGluZyAt
c3RhYmxlDQp1bnRyYW5zbGF0ZWQgcmVhZHMgbW9yZSBuYXR1cmFsIHRoZXJlLiBXaGVyZSB0aGUg
dGV4dCBtZWFucyAiYQ0KcmVsZWFzZWQgc3RhYmxlIHZlcnNpb24iIGFzIGEgY29tbW9uIG5vdW4s
IHRoZSBDaGluZXNlIHdvcmRpbmcgaXMNCmZpbmUuDQoNClNvIHRoZSBydWxlIEkgd291bGQgbGlr
ZSB0byBmb2xsb3cgaXM6DQoNCiAgLSAtc3RhYmxlIC8gc3RhYmxlIHRyZWUgLyBzdGFibGUgYnJh
bmNoICAtPiBrZWVwIGFzLWlzDQogIC0gImEgc3RhYmxlIHJlbGVhc2UiIGluIHRoZSBnZW5lcmFs
IHNlbnNlIC0+IOepqeWumueJiOacrA0KDQpJIHdpbGwgYXBwbHkgdGhpcyBjb25zaXN0ZW50bHkg
aW4gdjIgKGl0IG9ubHkgdG91Y2hlcyBhIGZldyBsaW5lcyBpbg0KMDgvMTYgYW5kIHRoaXMgcGF0
Y2gpIGFuZCByZWNvcmQgaXQgaW4gdGhlIGdsb3NzYXJ5Lg0KDQo+IExlYXZlIGEgbGluZSBicmVh
ayBtYXJrIGhlcmUgOy0pDQoNCldpbGwgZml4IGluIHYyIHRvZ2V0aGVyIHdpdGggdGhlIGNvbW1p
dCBtZXNzYWdlIHdyYXBwaW5nLg0KDQpUaGFua3MsIGFuZCB0aGFua3MgZm9yIHRoZSBSZXZpZXdl
ZC1ieS4NCg0KQ2hlbi1ZdQ0KDQpXZWlqaWUgWXVhbiA8d3lAd3l1YW4ub3JnPiDmlrwgMjAyNuW5
tDfmnIgyM+aXpemAseWbmyDkuIvljYgzOjAy5a+r6YGT77yaDQo+DQo+IE9uIFdlZCwgSnVsIDIy
LCAyMDI2IGF0IDA1OjU1OjM1QU0gKzA4MDAsIENoZW4tWXUgWWVoIHdyb3RlOg0KPiA+IExvY2Fs
aXplIG1haW5sYW5kIHRlcm1zIHRvIFRhaXdhbmVzZSBNYW5kYXJpbiAo5YWn5qC44oaS5qC45b+D
LCDku6PnorzihpLnqIvlvI/norwsDQo+ID4g6YCa6YGO4oaS6YCP6YGOLCAuLi4pIGFuZCBzeW5j
IHdpdGggdGhlIEVuZ2xpc2ggb3JpZ2luYWw6IGFkZCB0aGUgdGVzdGluZy8NCj4gPiBLVW5pdCBh
ZHZpY2UsIHRoZSBGaXhlczovTGluazovQ2xvc2VzOiB0YWcgcGFyYWdyYXBocywgdGhlIFN1Z2dl
c3RlZC1ieToNCj4gPiB0YWcsIGFuZCB0aGUgdXBkYXRlZCBydWxlcyBhYm91dCB0YWdnaW5nIG90
aGVyIHBlb3BsZS4NCj4gPiBBbHNvIHBvaW50IGNyb3NzLXJlZmVyZW5jZXMgYXQgdGhlIHpoX1RX
IHRyYW5zbGF0aW9ucyBpbnN0ZWFkIG9mDQo+ID4gemhfQ04uDQo+ID4NCj4gPiB1cGRhdGUgdG8g
Y29tbWl0IDBhODMyOTMzMjJmZCAoImRvYzogZGV2ZWxvcG1lbnQtcHJvY2VzczogYWRkIG5vdGlj
ZSBvbiB0ZXN0aW5nIikNCj4NCj4gTGVhdmUgYSBsaW5lIGJyZWFrIG1hcmsgaGVyZSA7LSkNCj4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoZW4tWXUgWWVoIDxjaGVueW91OTEwMzMxQGdtYWls
LmNvbT4NCj4NCj4gUmV2aWV3ZWQtYnk6IFdlaWppZSBZdWFuIDx3eUB3eXVhbi5vcmc+DQo+DQo+
ID4gLS0tDQo+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy81LlBvc3RpbmcucnN0
ICB8IDIyNiArKysrKysrKysrLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzMSBpbnNl
cnRpb25zKCspLCA5NSBkZWxldGlvbnMoLSkNCj4gPg0KPg0KPg0KPiA+DQo+ID4gLeW/hemgiOmH
neWwjeWFp+aguOeahOeJueWumueJiOacrOa6luWCmeijnOS4geOAguS4gOiIrOS+huiqqu+8jOij
nOS4geaHieipsuWfuuaWvExpbnVz55qER2l05qi55Lit55qE55W25YmNDQo+ID4gLeS4u+e3muOA
gueVtuS7peS4u+e3mueIsuWfuuekjuaZgu+8jOiri+W+nuS4gOWAi+ihhuaJgOWRqOefpeeahOeZ
vOS9iOm7numWi+Wni+KAlOKAlOWmguepqeWumueJiOacrOaIliAtcmMNCj4gPiAt54mI5pys55m8
5L2I6bue4oCU4oCU6ICM5LiN5piv5Zyo5LiA5YCL5Lu75oSP55qE5Li757ea5YiG5pSv6bue44CC
DQo+ID4gK+W/hemgiOmHneWwjeaguOW/g+eahOeJueWumueJiOacrOa6luWCmeijnOS4geOAguS4
gOiIrOS+huiqqu+8jOijnOS4geaHieipsuWfuuaWvExpbnVz55qER2l05qi55Lit55qE55W25YmN
DQo+ID4gK+S4u+e3muOAgueVtuS7peS4u+e3mueCuuWfuuekjuaZgu+8jOiri+W+nuS4gOWAi+ih
huaJgOWRqOefpeeahOeZvOW4g+m7numWi+Wni+KAlOKAlOWmguepqeWumueJiOacrOaIliAtcmMN
Cj4gPiAr54mI5pys55m85biD6bue4oCU4oCU6ICM5LiN5piv5Zyo5LiA5YCL5Lu75oSP55qE5Li7
57ea5YiG5pSv6bue44CCDQo+DQo+IE5vbi1ibG9ja2luZzoNCj4NCj4gSW4gcHJvY2Vzcy9zdGFi
bGUta2VybmVsLnJ1bGVzLnJzdCwgeW91IGtlZXAgIi1zdGFibGUiIGFzLWlzLCBzbyBoZXJlLA0K
PiBzaGFsbCB3ZSBjaGFuZ2UgdG8gIi1zdGFibGUiLyJzdGFibGUiIGluc3RlYWQgb2YgIueos+Wu
mueJiCI/DQo+DQo+IEkgZG9uJ3Qga25vdyB3aGF0J3MgdGhlIHByZWZlcnJlZCBvbmUgaW4gVGFp
d2FuLCB0aG91Z2guDQo+DQo+IEJ1dCBpZiBwcmVmZXJyaW5nICJzdGFibGUiLCBhbiBpbmNyZW1l
bnRhbCBwYXRjaCBpcyBiZXR0ZXIuDQo+DQo=
