Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5922771E
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 00:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784940201; cv=pass; b=q/4gRZW7SYG1v6jrO2K7R5o093s7z6HGr6EQk75DPmhoOe2JgRgt1+vAAeGShdytvZImQQPTGrok6wC9+ASuwGhXwBSq3y7qcREijPV7dzPRUc0wsAnKF3PEEO3I1JvJSJ1mu+X9TZHhg863/YHVhTvWBMm05eINmhbPOOccIcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784940201; c=relaxed/simple;
	bh=L/qAZYB/Z4uP8/IGt3bK6JmyDzEYEhrsKpRCosWMgoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AANn4jz0+eiLyGtgUC51aPjjCxuy73AC1x+03c1Cf+JDE3Fttnp4ONrtjSehkzVpxvDInQZx5FpqTM0EtvnQi6dA5BjBf9t7GPft6MCcQCMGAvWsczihNvrr6XsOluDz6JTk3jdrU7ow7XpGaW9Ke5aAwZaD1GXD0kuDn7tqq5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB0N/83D; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB0N/83D"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebe49b227so230298e87.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 17:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784940198; cv=none;
        d=google.com; s=arc-20260327;
        b=BBN52UZKtRrB9psHRIefVnOVGZq+nPn9zmdjB6oZ36PZ4ygWP+badzJIWM0pQs5CHu
         Oyruo32ivyYMguczlH+IcewP6nMTyw1EBfR8Bw0PoQEtgzTeebsI5xefkg7xvy3dIvqE
         kmn8iEoTkKLAQ8yVIWqWJYUtM+Q2Zh9sh9Ot7r6PdhCC8+OBvWyjk4ENWDMnFtH4hW4D
         T8IsrDDvcPNQ+8Ck9S6L5hzuY9X0XemS4oy9RgXJEsOU+TMN5xnEgAH8mF18Wc5nyer2
         c5UxkMX3gUCT2kox5qgmMmkdnX8J/67j2LXTO104GLLgwlB95f8bbeedMNlXaimJNCFg
         uFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/qAZYB/Z4uP8/IGt3bK6JmyDzEYEhrsKpRCosWMgoI=;
        fh=vWxzFTpzvk9+eN/oyCDXj7K1aF+L+7Scyq6hkBxpsJ0=;
        b=YbZZ8106M1D2MAkBGfMqNBnwmODbxo1nBEqzfUAIw4cVAxDU5Zj0wPMpItgRtMVYND
         IX13vcguA9sH7FV+sN1T9whDWqqZfr5SSGnEzEfmy9Fruqgu2j43JJVqulw9nUWPyFyn
         mCmOD1qZGW4n9BZiy5cMKlBnSNzuokYsWoWVx9RT1oU9XaiCmsDm1XuCkLUfaH1Fz9et
         LyI+xgQjgpBcjKQjqW0y3XAIeBWk33I91F8A3jv2/VnhRHs7wi2/R3cLemlxBCimrnJF
         R3YJJYU3k1dlVAVgz9Pu1nkn+67Lo5VMPCBCjJuRsH79bxmnSNUuhPSOaqnzK8JbWNJp
         lK5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784940198; x=1785544998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/qAZYB/Z4uP8/IGt3bK6JmyDzEYEhrsKpRCosWMgoI=;
        b=YB0N/83D1F2c7g8EEypK+YeiGTfsOnWs17mHetDIOsfn2xCIVUxIyp9Xs3uJ1CkOv7
         9XRv4wWWDdTYdZXLIHw5krTnGmO/GblvXR1VQ8OgKVkphzV1jgghRygvvT6mXWd5XBrG
         +jDq7i3MFByejjQzyDKmPOTVF4NifDwwC4i8/wRbop6eUAHNqFTkZ5LYbG4gUlw3XF93
         LExjMRqwo8reSXi8z7h4WALx+Q2cyWk2/WjTNtOm+1G1XDiDf2aGyurZI4Cg0tEqM2S5
         9YIvWNrnC3pEwUT94go7wH5JUy+E/ttdmt0af0oT8UdPi7aBgk0ymYEpwXMzFWh+IU4i
         T0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784940198; x=1785544998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/qAZYB/Z4uP8/IGt3bK6JmyDzEYEhrsKpRCosWMgoI=;
        b=qAqm2Bk4ogB7+j9FA5sfllNne/hlpafj9R8/tkRcFZoO8F/vA4SLXA1d9rmmfEeZDL
         jeO3E5Hg3FGUikr7Pg7gl4BsIi/6uDrPK7yQZPkHoiCYYuA3/Or6stHlowom3WaeY1Nc
         lOt4L4C13qaaaR50Oc3TPXSumYPtjize7Ei7NhZfgOUkx/snDtfGglNbgjYc/1KWSJ+I
         TwmYa/YFe1JaHGXk3jI9Ir776dWj11d0vuWfz2c3hGLSxai0CqnB1Jq/7rfzYctP9Bof
         /3wkSLzwIy+KGRthbDj7RM01nQSske0u6zzSrL0RsnE4eST/y8j6iIR+YNgQFq0WBRja
         6J9g==
X-Forwarded-Encrypted: i=1; AHgh+Rql3CrpRVA9+uhR/ujUPzFtEYdxYrzNcB/06o/LfDX0ziXxxc8Kjcn78LM0bLNHg31R0jalUrmkjgk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1jZQ2IY5l25MsHvGLp90K0q4gW9ENAnmcLDfQGnpb6J+9NvTH
	MNEp1htD0tAKqhEy1U9A9UqVqcF3CxqBxbSKC1U2fvxzlZHmzEPAgRnY+LIVl7yzXXGbz/Col6r
	eslMtGtiU38U5Ro983ui9KYsCrjB+T3w=
X-Gm-Gg: AR+sD12j/73V4z7YAHsUWp/7NsIGsUc8tjuDlU8fBiT9ZNgcJwlaGx2kEjQo4wseFlA
	AbG72j4FK/WWLLhrk6dcaIcb9eVJ5d81Bp5j9ndUzd34XYnaTYiRRuVPQqRghpDyhqpsnbnuFwo
	UBNGRVrPpoc0FjJ7euME5nl47jU158l7J/eCyI1K71v26FoIUQFU/QXKIX+z4GHZPu3xtPHkh+L
	TWtzfgl//7C/TBThkjlbIlFF3n7+UBBUJwWti1Pi+oMeLEciPgu1r/D3ziFGuKlH+Ty5E3ix+tM
	VZhcTf7avueVxA2qdgMj92IO62fSnKAvPemzi8F0ZGYe
X-Received: by 2002:a05:6512:1592:b0:5ae:b86b:71ea with SMTP id
 2adb3069b0e04-5b2c1b2d40cmr25848e87.5.1784940197693; Fri, 24 Jul 2026
 17:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-15-chenyou910331@gmail.com> <amNVpU-47HOO58Ir@wyuan.org>
In-Reply-To: <amNVpU-47HOO58Ir@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 25 Jul 2026 08:43:06 +0800
X-Gm-Features: AUfX_mw6wuuFTGsPgp-JBaayDWA-JPipLmBRrkdYQPqSd6VnLuHLlMiyZ0O6oGo
Message-ID: <CAKspUh+UrB4JVq5qa2SNZatqB0GaWwWBr+BBxxsOi6hGaWVNNw@mail.gmail.com>
Subject: Re: [PATCH 14/16] docs/zh_TW: process: localize terminology in 8.Conclusion.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgMDg6MDg6MDVQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+IE5vdGU6IGhhdmUgY2hhbmdlZCB0byBodHRwczovL2x3bi5uZXQvS2VybmVsL0luZGV4
LyAodXBwZXJjYXNlZCBmaXJzdA0KPiBsZXR0ZXIpDQo+IGh0dHA6Ly9sd24ubmV0L2tlcm5lbC9s
ZGQzLyBvciBodHRwczovL2x3bi5uZXQva2VybmVsL2xkZDMvIHJldHVybnMgNDA0DQoNCkNvbmZp
cm1lZCwgYm90aCBvZiB0aGUgb2xkIFVSTHMgYXJlIGRlYWQgYW5kIHRoZSBFbmdsaXNoIG9yaWdp
bmFsDQphbHJlYWR5IHBvaW50cyBhdCB0aGUgbmV3IG9uZXMuIFNpbmNlIHRoaXMgcGF0Y2ggZG9l
cyBzeW5jIHBhcnQgb2YgdGhlDQpmaWxlIHdpdGggdGhlIEVuZ2xpc2ggdGV4dCwgSSB3aWxsIHVw
ZGF0ZSBib3RoIFVSTHMgaW4gdjI6DQoNCiAgaHR0cDovL2x3bi5uZXQva2VybmVsL2luZGV4LyAt
PiBodHRwczovL2x3bi5uZXQvS2VybmVsL0luZGV4Lw0KICBodHRwOi8vbHduLm5ldC9rZXJuZWwv
bGRkMy8gIC0+IGh0dHBzOi8vbHduLm5ldC9LZXJuZWwvTEREMy8NCg0KSSB3aWxsIGFsc28gY2hl
Y2sgdGhlIHJlbWFpbmluZyBVUkxzIGluIHRoZSBzZXJpZXMgZm9yIHRoZSBzYW1lDQpwcm9ibGVt
IHdoaWxlIEkgYW0gYXQgaXQuDQoNClRoYW5rcyBmb3IgdGhlIFJldmlld2VkLWJ5LCBhbmQgZm9y
IGFjdHVhbGx5IGNsaWNraW5nIHRoZSBsaW5rcy4NCg0KQ2hlbi1ZdQ0KDQpXZWlqaWUgWXVhbiA8
d3lAd3l1YW4ub3JnPiDmlrwgMjAyNuW5tDfmnIgyNOaXpemAseS6lCDkuIvljYg4OjA45a+r6YGT
77yaDQo+DQo+IE9uIFdlZCwgSnVsIDIyLCAyMDI2IGF0IDA1OjU1OjQwQU0gKzA4MDAsIENoZW4t
WXUgWWVoIHdyb3RlOg0KPiA+IExvY2FsaXplIG1haW5sYW5kIHRlcm1zIHRvIFRhaXdhbmVzZSBN
YW5kYXJpbiAo5YWn5qC44oaS5qC45b+DLCDku6PnorzihpLnqIvlvI/norwsDQo+ID4g6Luf5Lu2
4oaS6Luf6auULCAuLi4pLCBub3JtYWxpemUgY2hhcmFjdGVyIGNvbnZlbnRpb25zICjniLLihpLn
grosIOijj+KGkuijoSwg5ZWT4oaS5ZWfLA0KPiA+IOeZvOS9iOKGkueZvOW4gykgdG8gbWF0Y2gg
dGhlIHpoX1RXIGdsb3NzYXJ5LCBmaXggdGhlIHpoX0NOIGNyb3NzLXJlZmVyZW5jZXMNCj4gPiB0
byB6aF9UVywgYW5kIHJlcGhyYXNlIGEgZmV3IHNlbnRlbmNlcyBmb3IgZmx1ZW5jeS4NCj4gPg0K
PiA+IFJldmlld2VkLWJ5OiBEb25nbGlhbmcgTXUgPGR6bTkxQGh1c3QuZWR1LmNuPg0KPg0KPiBS
ZXZpZXdlZC1ieTogV2VpamllIFl1YW4gPHd5QHd5dWFuLm9yZz4NCj4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaGVuLVl1IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4N
Cj4gPiBOb3RlIGZvciByZXZpZXdlcnM6IHRoaXMgZGlmZmVycyBmcm9tIHRoZSB2ZXJzaW9uIERv
bmdsaWFuZyBNdSByZXZpZXdlZA0KPiA+IGluIEp1bmUuIEJleW9uZCB0aGUgdGVybWlub2xvZ3kg
bG9jYWxpemF0aW9uIGhlIHJldmlld2VkLCBJIGFkZGl0aW9uYWxseQ0KPiA+IG5vcm1hbGl6ZWQg
dGhlIGNoYXJhY3RlciBjb252ZW50aW9ucyAo54iy4oaS54K6LCDoo4/ihpLoo6EsIOWVk+KGkuWV
nywg55m85L2I4oaS55m85biDKSB0bw0KPiA+IG1hdGNoIHRoZSBuZXcgemhfVFcgZ2xvc3Nhcnks
IGNoYW5nZWQgdGhlIHpoX0NOIGNyb3NzLXJlZmVyZW5jZXMgdG8NCj4gPiB6aF9UVywgcmVzdG9y
ZWQgdGhlIGJsYW5rIGxpbmUgYmVmb3JlIHRoZSBMV04gaW5kZXggVVJMICh0aGUgcmV2aWV3ZWQN
Cj4gPiB2ZXJzaW9uIGRyb3BwZWQgaXQgYW5kIGJyb2tlIHRoZSBSU1QgcmVuZGVyaW5nKSwgYW5k
IGFkZGVkIG15c2VsZiB0byB0aGUNCj4gPiBwcm9vZnJlYWRlciBsaXN0LiBUaGUgUmV2aWV3ZWQt
YnkgaXMga2VwdCBhcyB0aGUgdGVybWlub2xvZ3kgY2hhbmdlcyBpdA0KPiA+IGNvdmVyZWQgYXJl
IHVuY2hhbmdlZDsgaGFwcHkgdG8gZHJvcCBpdCBpZiBwcmVmZXJyZWQuDQo+DQo+IE5pY2UgcmVt
aW5kZXIhDQo+DQo+ID4gIC4uLi96aF9UVy9wcm9jZXNzLzguQ29uY2x1c2lvbi5yc3QgICAgICAg
ICAgICB8IDUxICsrKysrKysrKystLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL3Byb2Nlc3MvOC5Db25jbHVzaW9uLnJzdCBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL3Byb2Nlc3MvOC5Db25jbHVzaW9uLnJzdA0K
PiA+IGluZGV4IGQxNjM0NDIxYjYyYy4uYzk1ZTJkMWM3ZTgxIDEwMDY0NA0KPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL3Byb2Nlc3MvOC5Db25jbHVzaW9uLnJzdA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL3Byb2Nlc3MvOC5Db25j
bHVzaW9uLnJzdA0KPiA+IEBAIC0xMSw0NSArMTEsNDYgQEANCj4gPg0KPiA+ICAg5ZCz5oOz5oiQ
IFd1IFhpYW5nQ2hlbmcgPGJvYnd4Y0BlbWFpbC5jbj4NCj4gPiAgIOiDoeeak+aWhyBIdSBIYW93
ZW4gPDIwMjMwMDIwODlAbGluay50eXV0LmVkdS5jbj4NCj4gPiArIOiRieWuuOS9kSBDaGVuLVl1
IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFpbC5jb20+DQo+ID4NCj4gPiAgLi4gX3R3X2RldmVsb3Bt
ZW50X2NvbmNsdXNpb246DQo+ID4NCj4gPiAt5pu05aSa5L+h5oGvDQo+ID4gK+abtOWkmuizh+io
ig0KPiA+ICA9PT09PT09PQ0KPiA+DQo+ID4gLemXnOaWvExpbnV45YWn5qC46ZaL55m85ZKM55u4
6Zec5Li76aGM55qE5L+h5oGv5L6G5rqQ5b6I5aSa44CC6aaW5YWI5piv5Zyo5YWn5qC45rqQ5Luj
56K85YiG55m85Lit5om+5Yiw55qEDQo+ID4gLeaWh+aqlOebrumMhOOAgumggue0mg0KPiA+IC06
cmVmOmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL2hvd3RvLnJzdCA8
dHdfcHJvY2Vzc19ob3d0bz5gDQo+ID4gK+mXnOaWvExpbnV45qC45b+D6ZaL55m85ZKM55u46Zec
5Li76aGM55qE6LOH6KiK5L6G5rqQ5b6I5aSa44CC6aaW5YWI5piv5Zyo5qC45b+D5Y6f5aeL56K8
5YiG55m85Lit5om+5Yiw55qEDQo+ID4gK+aWh+S7tuebrumMhOOAgumggue0mg0KPiA+ICs6cmVm
OmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9UVy9wcm9jZXNzL2hvd3RvLnJzdCA8dHdf
cHJvY2Vzc19ob3d0bz5gDQo+ID4gIOaWh+S7tuaYr+S4gOWAi+mHjeimgeeahOi1t+m7nu+8mw0K
PiA+IC06cmVmOmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL3N1Ym1p
dHRpbmctcGF0Y2hlcy5yc3QgPHR3X3N1Ym1pdHRpbmdwYXRjaGVzPmANCj4gPiAt5Lmf5piv5omA
5pyJ5YWn5qC46ZaL55m85Lq65ZOh6YO95oeJ6Kmy6Zax6K6A55qE5YWn5a6544CC6Kix5aSa5YWn
6YOo5YWn5qC4QVBJ6YO95piv5L2/55Soa2VybmVsZG9j5qmf5Yi2DQo+ID4gLeiomOmMhOeahO+8
m+KAnG1ha2UgaHRtbGRvY3PigJ3miJbigJxtYWtlIHBkZmRvY3PigJ3lj6/nlKjmlrzku6VIVE1M
5oiWUERG5qC85byP55Sf5oiQ6YCZ5Lqb5paH5qqUDQo+ID4gLe+8iOWEmOeuoeafkOS6m+eZvOih
jOeJiOaPkOS+m+eahHRleOeJiOacrOacg+mBh+WIsOWFp+mDqOmZkOWItu+8jOeEoeazleato+ei
uuiZleeQhuaWh+aqlO+8ieOAgg0KPiA+ICs6cmVmOmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9UVy9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QgPHR3X3N1Ym1pdHRpbmdwYXRj
aGVzPmANCj4gPiAr5Lmf5piv5omA5pyJ5qC45b+D6ZaL55m85Lq65ZOh6YO95oeJ6Kmy6Zax6K6A
55qE5YWn5a6544CC6Kix5aSa5YWn6YOo5qC45b+DQVBJ6YO95piv5L2/55Soa2VybmVsZG9j5qmf
5Yi2DQo+ID4gK+iomOmMhOeahO+8m+KAnG1ha2UgaHRtbGRvY3PigJ3miJbigJxtYWtlIHBkZmRv
Y3PigJ3lj6/nlKjmlrzku6VIVE1M5oiWUERG5qC85byP55Si55Sf6YCZ5Lqb5paH5Lu2DQo+ID4g
K++8iOWEmOeuoeafkOS6m+eZvOihjOeJiOaPkOS+m+eahHRleOeJiOacrOacg+mBh+WIsOWFp+mD
qOmZkOWItu+8jOeEoeazleato+eiuuiZleeQhuaWh+S7tu+8ieOAgg0KPiA+DQo+ID4gLeS4jeWQ
jOeahOe2suermeWcqOWQhOWAi+e0sOevgOWxpOasoeS4iuiojuirluWFp+aguOmWi+eZvOOAguac
rOaWh+S9nOiAheaDs+ismeiZm+WcsOW7uuitsOeUqCBodHRwczovL2x3bi5uZXQvDQo+ID4gLeS9
nOeIsuS+hua6kO+8m+aciemXnOioseWkmueJueWumuWFp+aguOS4u+mhjOeahOS/oeaBr+WPr+S7
pemAmumBjuS7peS4i+e2suWdgOeahCBMV04g5YWn5qC457Si5byV5om+5Yiw77yaDQo+ID4gK+S4
jeWQjOeahOe2suermeWcqOWQhOWAi+e0sOevgOWxpOasoeS4iuiojuirluaguOW/g+mWi+eZvOOA
guacrOaWh+S9nOiAheaDs+ismeiZm+WcsOW7uuitsOeUqCBodHRwczovL2x3bi5uZXQvDQo+ID4g
K+S9nOeCuuS+hua6kO+8m+aciemXnOioseWkmueJueWumuaguOW/g+S4u+mhjOeahOizh+ioiuWP
r+S7pemAj+mBjuS7peS4i+e2suWdgOeahCBMV04g5qC45b+D57Si5byV5om+5Yiw77yaDQo+ID4N
Cj4gPiAgICBodHRwOi8vbHduLm5ldC9rZXJuZWwvaW5kZXgvDQo+DQo+IE5vdGU6IGhhdmUgY2hh
bmdlZCB0byBodHRwczovL2x3bi5uZXQvS2VybmVsL0luZGV4LyAodXBwZXJjYXNlZCBmaXJzdA0K
PiBsZXR0ZXIpDQo+DQo+IChJJ20gbm90IGZhbWlsaWFyIHdpdGggaG93IExXTiB3b3Jrcywgc28g
bGF0ZXIgSSB3aWxsIGNoZWNrIHRoZQ0KPiBhdmFpbGFiaWxpdHkgb2YgdGhlc2UgdXJscyBtYW51
YWxseSA7LSkNCj4NCj4gPiAt6Zmk5q2k5LmL5aSW77yM5YWn5qC46ZaL55m85Lq65ZOh55qE5LiA
5YCL5a+26LK06LOH5rqQ5piv77yaDQo+ID4gK+mZpOatpOS5i+Wklu+8jOaguOW/g+mWi+eZvOS6
uuWToeeahOS4gOWAi+WvtuiytOizh+a6kOaYr++8mg0KPiA+DQo+ID4gICAgaHR0cHM6Ly9rZXJu
ZWxuZXdiaWVzLm9yZy8NCj4gPg0KPiA+IC3nlbbnhLbvvIzkuZ/kuI3mh4noqbLlv5joqJggaHR0
cHM6Ly9rZXJuZWwub3JnLyDvvIzpgJnmmK/lhafmoLjnmbzkvYjkv6Hmga/nmoTmnIDntYLkvY3n
va7jgIINCj4gPiAr55W254S277yM5Lmf5LiN5oeJ6Kmy5b+Y6KiYIGh0dHBzOi8va2VybmVsLm9y
Zy8g77yM6YCZ5piv5qC45b+D55m85biD6LOH6KiK55qE5pyA57WC5L2N572u44CCDQo+ID4NCj4g
PiAt6Zec5pa85YWn5qC46ZaL55m85pyJ5b6I5aSa5pu477yaDQo+ID4gK+mXnOaWvOaguOW/g+mW
i+eZvOacieW+iOWkmuabuO+8mg0KPiA+DQo+ID4gICAg44CKTGludXjoqK3lgpnpqYXli5XnqIvl
uo/jgIvnrKzkuInniYjvvIhKb25hdGhhbiBDb3JiZXTjgIFBbGVzc2FuZHJvIFJ1YmluaeWSjEdy
ZWcgS3JvYWggSGFydG1hbu+8iQ0KPiA+ICAgIOe3muS4iueJiOacrOWcqCBodHRwOi8vbHduLm5l
dC9rZXJuZWwvbGRkMy8NCj4NCj4gaHR0cDovL2x3bi5uZXQva2VybmVsL2xkZDMvIG9yIGh0dHBz
Oi8vbHduLm5ldC9rZXJuZWwvbGRkMy8gcmV0dXJucyA0MDQNCj4gKGZvciBtZT8pDQo+DQo+IElu
IEVuZ2xpc2ggdmVyc2lvbiwgdGhleSBoYXZlIGNoYW5nZWQgdG8gaHR0cHMgKGFuZCB1cHBlcmNh
c2VkKSwgd2hpY2gNCj4gaXM6DQo+DQo+ICAgaHR0cHM6Ly9sd24ubmV0L0tlcm5lbC9MREQzLw0K
Pg0KPiBKdXN0IGxlYXZlIGEgbm90ZSBoZXJlLCBiZWNhdXNlIHRoaXMgcGF0Y2ggZG9lc24ndCBt
ZWFuIHRvIHN5bmMgd2l0aA0KPiBFbmdsaXNoIG9yaWdpbmFsIGF0IGFsbC4NCj4NCj4gVGhhbmtz
Lg0K
