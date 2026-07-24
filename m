Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45BF364038
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784875120; cv=pass; b=J3EVM63AoQRn3lpFIsv5vLmVhavAOv5ZWXIkM/B4ri/ELjABenYcJ4PDT0Ep4pR4xTF6B+5/GFtrBj8wTxHLBhAMRSaVHLkino/Mw3E9T+pOobbYMv0lXxTpwOITMct0rx2IOf2Hq7O811gRNs+KOo9f+xpci+b19uzUIzE4rA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784875120; c=relaxed/simple;
	bh=xZ3G2I0fuS8OxG8pl/lTdc2AX96S9cP5xb1nDDgb3xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAHbWpSYdFAuQQBVtoV3KFcQbsUXewMPgxPwEC9a9Exvq3BDQbRh7D2R4v9YQ7pAIDcefE5Fr4JQ7rcs5EoJflgT1KtDNvovpy/w4a8a67+cQcatH3gsgg2eQBAE6LdoeZ1twpsgJONbMy5C/xwrKig1RIKxnD9XHOUaTPk//Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8veLJft; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8veLJft"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2960ea2fbso12583e87.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 23:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784875117; cv=none;
        d=google.com; s=arc-20260327;
        b=WfIMd5PFs92O5yayCR7xoke43TjdBkTvhTHQz5m1NSqxh9dbZEruN4Rqc+dcx/b6h+
         +90wDBky6lleT3QHq9Hz8Ewzx/QVArtPBX02ob735NAOG6t9h05BEx5nfwCDciwQ9KLI
         NrW2EusWJJIxNdyCwOu7/k1mxauCKfIoJn9cye6sk6gv4lFFolAVzjISWu/yC2NN3i4X
         YwBZrdHp8V55HnOtQbhSqyUdR+C5DgMzSLilzlPePrg8QCymCMY0kULAP5jbArVBRL/2
         ocJSup1/g1E5AL2mwWU/Q8SpnjSms0UKdd/bDauV4kZhd4raVDlsQSrcA0SuTxBM32VX
         te1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xZ3G2I0fuS8OxG8pl/lTdc2AX96S9cP5xb1nDDgb3xY=;
        fh=bJ0bLr8NEGfqfZqPrOSJJfFiqNwwNfyJo3W3fbSWlLc=;
        b=V9LVNK8WWdgL7NBk8WJevXjvEXassgwAoBo1lvaB7dySCJyCcP/Xq8r32vZI5wDUUl
         7gcwlPc7kDBRuLbudDIOTn+7sDVDVF1YgMw+D10UBeCk/386WYz1drZI15EO+TFDCofv
         FY6+vCcE5V9hWFze7ItPkt0cLoukNxyreW5U4V67OB4nc8ofY2fxWELR1o7/n5oGFecT
         kX/OArpSiU2wZcAUFN4gVRN3NodpMxVtvz2tNlfNWUqkDrsX5g8BsE9urJtL39cAhGV0
         Vu1/5jb25yAfyk0+/MvPncbY8iN5spnKHjNLv0C6JbBgT1Tptma0lANJerDamRzArU4A
         y5/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784875117; x=1785479917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZ3G2I0fuS8OxG8pl/lTdc2AX96S9cP5xb1nDDgb3xY=;
        b=g8veLJfta8NCh+3+7azbqQxRK7vMnIjKgYhWxvExJqfCSnHrA+abnjOMFylyrIqq8J
         tUC+wNB4m65Neq2p9xvWgdSfI3ZgP15K8cY+XoC730QyJjC4xZTTrDi5HOPWEjtnmHyE
         J4GSZmWO9GK+rts2KPoTfdSumTpuvUIDN5erWdgyy/M+7IePFgu0ELl62BLQ6unIsgDl
         KE1pvqMe8+bBsfopXfmIggaIuzs/fNdqBinQSHKc8ILFP+IBqqUgwnB6P22HNEDeSS+C
         X1JHQLUEc2rCTmRDXwMymkJWNMrlBAwKQ+V6zDfRnuNSbboWhQuQRliKhLsVPbyI5Sjh
         H4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784875117; x=1785479917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZ3G2I0fuS8OxG8pl/lTdc2AX96S9cP5xb1nDDgb3xY=;
        b=EN7ikLzjZgmbCEvjjsS+5W2sK2AgLeBx6gbKF29OBQqy7GSSxPEyb0YAe8C6Vjnmy9
         t34uNxgYKhR6ozFyedj0oPeLNliFub/DhJjnAJKE4ZSR3H7zq2ewP5qLF3yc92a+J0/y
         +JcTOKG5GTgyOeqcHr1yoiVG7EmSh1QaffI6J/TbpldjBBa7+m0LGq99P/M8Qxg5OZBB
         xzPSr3LEdGZhws/vwzD47SWByzMar2yYUOAR3FPlxTv6oWw60UlaWNCVUmBkXXbyrcco
         EG3icou+DP/hCsGNVEhBmT9f0be23ZFcv1+lpQzUu+LVrv10wUUoBku4OE1VIjwf+7Wi
         K0EQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/VNvyUWCau894oKP9CTOLIgqD5VJrsxidIDapxN1JcPdrv+PviAgx3UMnctfGWxLhCQw05s9L8iU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwemQXEQ9CXsaID/qPgKk0Xyl2SD1W+SlGM9tfYVfvSxgBX/AAp
	RxotfxZ1a0PgZ2wRQwx3bBndTeqWXUN/MFSl30DUarybJsewLQhfEEjevBR9f2aGP1o7NciRU2B
	21rOP38tRICCAZnGKDHYVAWzDLGQjXZysGcm7
X-Gm-Gg: AR+sD10n+suckJjiauUcmi2XNED4aq908kbqcrJ8eMuxwNqWaZdeN96HHnl17nTB8ZO
	ZWFPYF0324MWhMQvc5w8eRfXrh2KcKdalBTx9J4Mrp3Ai7aTi0CvrVvmhNgGFuBQGSb/WBLW0rx
	PUZetYUedoD12BbBgzteM/HNqAyrm9+Nu+XdnPyJ6SMNBs/ctQvLkWcWBMDntAloUlb93ZLqrYU
	szvyQlcuw0PC+JhuLb4nPurFQGm1q48ie1T80LvEJrN5EEQBP8oKtJY0gtfIAK+GQz3LIaY11cq
	abOd5I8u/29N+Vhy503CW/mLI1FSu34ZBlKEVvqkmbHJ
X-Received: by 2002:a05:6512:39c5:b0:5ae:b7c0:f231 with SMTP id
 2adb3069b0e04-5b2b7b35063mr353988e87.7.1784875116703; Thu, 23 Jul 2026
 23:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-8-chenyou910331@gmail.com> <amDYOmUlDWCOCa4M@wyuan.org>
In-Reply-To: <amDYOmUlDWCOCa4M@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 24 Jul 2026 14:38:23 +0800
X-Gm-Features: AUfX_mxssI35klOkvHg7SkFWeZz4TCe9EbDkmZwcdN21WUCHvVrEwKbhypXwQ_g
Message-ID: <CAKspUhKRwPVxqeCC+4C++4Ey=4Hv==Z0y4L1Xdqjg6_dndL+jQ@mail.gmail.com>
Subject: Re: [PATCH 07/16] docs/zh_TW: process: localize terminology in coding-style.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMTA6NDg6MjZQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+IEkgd291bGQgc2F5IHNwbGl0dGluZyB0aGlzIHBhcnQgaW50byBhIHNtYWxsIHBhdGNo
IGlzIGJldHRlci4gQnV0IGZvcg0KPiB0aGlzIHRpbWUsIGl0J3MgZmluZS4NCg0KTm90ZWQsIGFu
ZCBJIGFncmVlLiBUaGUga21hbGxvY19vYmpzKCkva3phbGxvY19vYmpzKCkgZXhhbXBsZXMgYXJl
IGFuDQpBUEkgY2hhbmdlIHJhdGhlciB0aGFuIGEgdGVybWlub2xvZ3kgaXNzdWUsIHNvIGl0IHdv
dWxkIGhhdmUgYmVlbg0KY2xlYW5lciBhcyBpdHMgb3duIHBhdGNoLiBJIHdpbGwga2VlcCBjb250
ZW50IGNoYW5nZXMgb2YgdGhhdCBraW5kDQpzZXBhcmF0ZSBpbiBmdXR1cmUgd29yay4NCg0KPiBD
aGFuZ2UgdG86DQo+IGBgR05VIGVtYWNzYGAg6IO96Ieq5YuV5bmr5L2g5qC85byP5YyWIEMg5Y6f
5aeL56iL5byP56K877yM6ICM5LiU5L2g5Lmf5rOo5oSP5Yiw5LqG77yM56K65a+m5piv6YCZ5qij
77yMDQo+IOS4jemBjuWug+aJgOS9v+eUqOeahOmgkOioreWAvOWSjOaIkeWAkeaDs+imgeeahOeb
uOWOu+eUmumBoCAuLi4NCg0KV2lsbCByZWZsb3cgdGhpcyBwYXJhZ3JhcGggaW4gdjIsIGFsb25n
IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGxpbmVzDQp0aGF0IGdyZXcgYWZ0ZXIgbG9jYWxpemF0aW9u
Lg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCkNoZW4tWXUNCg0KV2VpamllIFl1YW4gPHd5
QHd5dWFuLm9yZz4g5pa8IDIwMjblubQ35pyIMjLml6XpgLHkuIkg5LiL5Y2IMTA6NDjlr6vpgZPv
vJoNCj4NCj4gT24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMDU6NTU6MzNBTSArMDgwMCwgQ2hlbi1Z
dSBZZWggd3JvdGU6DQo+ID4gTG9jYWxpemUgbWFpbmxhbmQgdGVybXMgdG8gVGFpd2FuZXNlIE1h
bmRhcmluICjlhafmoLjihpLmoLjlv4MsIOWHveaVuOKGkuWHveW8jywNCj4gPiDlro/ihpLlt6jp
m4YsIOaemuiIieKGkuWIl+iIiSwg6IGy5piO4oaS5a6j5ZGKLCDlr4TlrZjlmajihpLmmqvlrZjl
magsIC4uLikgYW5kIHN5bmMgd2l0aCB0aGUNCj4gPiBFbmdsaXNoIG9yaWdpbmFsOiB1cGRhdGUg
dGhlIG1lbW9yeSBhbGxvY2F0b3IgbGlzdCBhbmQgYXJyYXkNCj4gPiBhbGxvY2F0aW9uIGV4YW1w
bGVzIHRvIHRoZSB0eXBlLWF3YXJlIGttYWxsb2Nfb2JqcygpL2t6YWxsb2Nfb2JqcygpDQo+ID4g
Zm9ybXMuDQo+ID4NCj4gPiB1cGRhdGUgdG8gY29tbWl0IDMyM2ZhNGI5NjA4YiAoIkRvY3VtZW50
YXRpb246IEZpeCBzeW50YXggb2Yga21hbGxvY19vYmpzIGV4YW1wbGUgaW4gY29kaW5nIHN0eWxl
IGRvYyIpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuLVl1IFllaCA8Y2hlbnlvdTkxMDMz
MUBnbWFpbC5jb20+DQo+DQo+IEV4Y2VwdCB0aGUgd3JhcHBpbmcgaXNzdWUgb2YgdGhlIGNvbW1p
dCBtZXNzYWdlIChsZWF2ZSBpdCB0byB0aGUNCj4gbWFpbnRhaW5lcnMgdG8gaGFuZGxlIGl0KToN
Cj4NCj4gUmV2aWV3ZWQtYnk6IFdlaWppZSBZdWFuIDx3eUB3eXVhbi5vcmc+DQo+DQo+ID4gLS0t
DQo+ID4gIC4uLi96aF9UVy9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3QgICAgICAgICAgICB8IDU4
MCArKysrKysrKystLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5MiBpbnNlcnRpb25z
KCspLCAyODggZGVsZXRpb25zKC0pDQo+ID4NCj4NCj4gWy4uLl0NCj4NCj4gPiAgOSkg5L2g5bey
57aT5oqK5LqL5oOF5byE57Of5LqGDQo+ID4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+DQo+
ID4gIOmAmeaykuS7gOm6vO+8jOaIkeWAkemDveaYr+mAmeaoo+OAguWPr+iDveS9oOmVt+acn+S9
v+eUqCBVbml4IOeahOaci+WPi+W3sue2k+WRiuiotOS9oA0KPiA+IC1gYEdOVSBlbWFjc2BgIOiD
veiHquWLleW5q+S9oOagvOW8j+WMliBDIOa6kOS7o+eivO+8jOiAjOS4lOS9oOS5n+azqOaEj+WI
sOS6hu+8jOeiuuWvpuaYr+mAmeaoo++8jOS4jemBjuWugw0KPiA+IC3miYDkvb/nlKjnmoTpu5jo
qo3lgLzlkozmiJHlgJHmg7PopoHnmoTnm7jljrvnlJrpgaAgKOWvpumam+S4iu+8jOeUmuiHs+av
lOmaqOapn+aJk+eahOmChOimgeW3ruKAlOKAlOeEoeaVuOWAi+eMtOWtkA0KPiA+IC3lnKggR05V
IGVtYWNzIOijj+aJk+Wtl+awuOmBoOS4jeacg+WJtemAoOWHuuS4gOWAi+Wlveeoi+W6jykNCj4g
PiArYGBHTlUgZW1hY3NgYCDog73oh6rli5XluavkvaDmoLzlvI/ljJYgQyDljp/lp4vnqIvlvI/n
orzvvIzogIzkuJTkvaDkuZ/ms6jmhI/liLDkuobvvIznorrlr6bmmK/pgJnmqKPvvIzkuI3pgY7l
roMNCj4gPiAr5omA5L2/55So55qE6aCQ6Kit5YC85ZKM5oiR5YCR5oOz6KaB55qE55u45Y6755Sa
6YGgICjlr6bpmpvkuIrvvIznlJroh7Pmr5TpmqjmqZ/miZPnmoTpgoTopoHlt67igJTigJTnhKHm
lbjlgIvnjLTlrZANCj4gPiAr5ZyoIEdOVSBlbWFjcyDoo6HmiZPlrZfmsLjpgaDkuI3mnIPlibXp
gKDlh7rkuIDlgIvlpb3nqIvlvI8pDQo+DQo+IENoYW5nZSB0bzoNCj4NCj4gYGBHTlUgZW1hY3Ng
YCDog73oh6rli5XluavkvaDmoLzlvI/ljJYgQyDljp/lp4vnqIvlvI/norzvvIzogIzkuJTkvaDk
uZ/ms6jmhI/liLDkuobvvIznorrlr6bmmK/pgJnmqKPvvIwNCj4g5LiN6YGO5a6D5omA5L2/55So
55qE6aCQ6Kit5YC85ZKM5oiR5YCR5oOz6KaB55qE55u45Y6755Sa6YGgICjlr6bpmpvkuIrvvIzn
lJroh7Pmr5TpmqjmqZ/miZPnmoTpgoTopoHlt67igJTigJQNCj4g54Sh5pW45YCL54y05a2Q5Zyo
IEdOVSBlbWFjcyDoo6HmiZPlrZfmsLjpgaDkuI3mnIPlibXpgKDlh7rkuIDlgIvlpb3nqIvlvI8p
DQo+DQo+ID8NCj4NCj4gPiAgKijora/oqLvvvJpJbmZpbml0ZSBNb25rZXkgVGhlb3JlbSkqDQo+
ID4NCj4gPiAg5omA5Lul5L2g6KaB6bq85pS+5qOEIEdOVSBlbWFjc++8jOimgem6vOaUueiuiuWu
g+iuk+Wug+S9v+eUqOabtOWQiOeQhueahOioreWumuOAguimgeaOoeeUqOW+jOS4gOWAi+aWueah
iO+8jA0KPiA+IC3kvaDlj6/ku6XmiorkuIvpnaLpgJnmrrXnspjosrzliLDkvaDnmoQgLmVtYWNz
IOaWh+S7tuijj+OAgg0KPiA+ICvkvaDlj6/ku6XmiorkuIvpnaLpgJnmrrXosrzkuIrliLDkvaDn
moQgLmVtYWNzIOaqlOahiOijoeOAgg0KPiA+DQo+ID4gIC4uIGNvZGUtYmxvY2s6OiBlbGlzcA0K
PiA+DQo+ID4gQEAgLTY0MCwzMSArNjQxLDMxIEBAIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2RvYy1ndWlkZS9pbmRleC5yc3Qg5ZKMIHRvb2xzL2RvY3Mva2VybmVsLWRvYw0KPiA+
ICAgICAoZXhwYW5kLWZpbGUtbmFtZSAifi9zcmMvbGludXgtdHJlZXMiKQ0KPiA+ICAgICAnbGlu
dXgta2VybmVsKQ0KPiA+DQo+ID4gLemAmeacg+iukyBlbWFjcyDlnKggYGB+L3NyYy9saW51eC10
cmVlc2BgIOS4i+eahCBDIOa6kOaWh+S7tueNsuW+l+abtOWlveeahOWFp+aguOS7o+eivOmiqOag
vOOAgg0KPiA+ICvpgJnmnIPorpMgZW1hY3Mg5ZyoIGBgfi9zcmMvbGludXgtdHJlZXNgYCDkuIvn
moQgQyDljp/lp4vmqpTnjbLlvpfmm7Tlpb3nmoTmoLjlv4PnqIvlvI/norzpoqjmoLzjgIINCj4g
Pg0KPiA+IC3kuI3pgY7lsLHnrpfkvaDlmJfoqaborpMgZW1hY3Mg5q2j56K655qE5qC85byP5YyW
5Luj56K85aSx5pWX5LqG77yM5Lmf5Lim5LiN5oSP5ZGz552A5L2g5aSx5Y675LqG5LiA5YiH77ya
6YKE5Y+vDQo+ID4gK+S4jemBjuWwseeul+S9oOWYl+ippuiukyBlbWFjcyDmraPnorrnmoTmoLzl
vI/ljJbnqIvlvI/norzlpLHmlZfkuobvvIzkuZ/kuKbkuI3mhI/lkbPokZfkvaDlpLHljrvkuobk
uIDliIfvvJrpgoTlj68NCj4gPiAg5Lul55SoIGBgaW5kZW50YGAg44CCDQo+ID4NCj4gPiAg5LiN
6YGO77yMR05VIGluZGVudCDkuZ/mnInlkowgR05VIGVtYWNzIOS4gOaoo+acieWVj+mhjOeahOio
reWumu+8jOaJgOS7peS9oOmcgOimgee1puWug+S4gOS6m+WRveS7pOmBuA0KPiA+IC3poIXjgILk
uI3pgY7vvIzpgJnpgoTkuI3nrpflpKrns5/ns5XvvIzlm6DniLLlsLHnrpfmmK8gR05VIGluZGVu
dCDnmoTkvZzogIXkuZ/oqo3lkIwgSyZSIOeahOasiuWogeaApw0KPiA+ICvpoIXjgILkuI3pgY7v
vIzpgJnpgoTkuI3nrpflpKrns5/ns5XvvIzlm6DngrrlsLHnrpfmmK8gR05VIGluZGVudCDnmoTk
vZzogIXkuZ/oqo3lkIwgSyZSIOeahOasiuWogeaApw0KPiA+ICAoR05VIOeahOS6uuS4puS4jeaY
r+WjnuS6uu+8jOS7luWAkeWPquaYr+WcqOmAmeWAi+WVj+mhjOS4iuiiq+WatOmHjeeahOiqpOWw
juS6hinvvIzmiYDku6XkvaDlj6ropoHntaYgaW5kZW50DQo+ID4gLeaMh+WumumBuOmghSBgYC1r
ciAtaThgYCAo5Luj6KGoIGBgSyZS77yMOCDlrZfnrKbnuK7pgLJgYCnvvIzmiJbkvb/nlKggYGBz
Y3JpcHRzL0xpbmRlbnRgYA0KPiA+IC3pgJnmqKPlsLHlj6/ku6Xku6XmnIDmmYLpq6bnmoTmlrnl
vI/nuK7pgLLmupDku6PnorzjgIINCj4gPiAr5oyH5a6a6YG46aCFIGBgLWtyIC1pOGBgICjku6Po
oaggYGBLJlLvvIw4IOWtl+WFg+e4ruaOkmBgKe+8jOaIluS9v+eUqCBgYHNjcmlwdHMvTGluZGVu
dGBgDQo+ID4gK+mAmeaoo+WwseWPr+S7peS7peacgOaZgumrpueahOaWueW8j+e4ruaOkuWOn+Wn
i+eoi+W8j+eivOOAgg0KPiA+DQo+ID4gLWBgaW5kZW50YGAg5pyJ5b6I5aSa6YG46aCF77yM54m5
5Yil5piv6YeN5paw5qC85byP5YyW6Ki76YeL55qE5pmC5YCZ77yM5L2g5Y+v6IO96ZyA6KaB55yL
5LiA5LiL5a6D55qE5omL5YaK44CCDQo+ID4gLeS4jemBjuiomOS9j++8miBgYGluZGVudGBgIOS4
jeiDveS/ruato+WjnueahOe3qOeoi+e/kuaFo+OAgg0KPiA+ICtgYGluZGVudGBgIOacieW+iOWk
mumBuOmghe+8jOeJueWIpeaYr+mHjeaWsOagvOW8j+WMluiou+ino+eahOaZguWAme+8jOS9oOWP
r+iDvemcgOimgeeci+S4gOS4i+Wug+eahOaJi+WGiuOAgg0KPiA+ICvkuI3pgY7oqJjkvY/vvJog
YGBpbmRlbnRgYCDkuI3og73kv67mraPlo57nmoTnqIvlvI/oqK3oqIjnv5LmhaPjgIINCj4gPg0K
PiA+ICDoq4vms6jmhI/vvIzmgqjpgoTlj6/ku6Xkvb/nlKggYGBjbGFuZy1mb3JtYXRgYCDlt6Xl
hbfluavliqnmgqjomZXnkIbpgJnkupvopo/liYfvvIzlv6vpgJ/oh6rli5Xph43mlrDmoLwNCj4g
PiAt5byP5YyW6YOo5YiG5Luj56K877yM5Lim5a+p6Zax5pW05YCL5paH5Lu25Lul55m854++5Luj
56K86aKo5qC86Yyv6Kqk44CB5omT5a2X6Yyv6Kqk5ZKM5Y+v6IO955qE5pS56YCy44CC5a6D6YKE
5Y+vDQo+ID4gLeS7peaWueS+v+WcsOaOkuW6jyBgYCNpbmNsdWRlYGAg77yM5bCN6b2K6K6K6YeP
L+Wuj++8jOmHjeaOkuaWh+acrOWSjOWFtuS7lumhnuS8vOS7u+WLmeOAgg0KPiA+ICvlvI/ljJbp
g6jliIbnqIvlvI/norzvvIzkuKblr6nplrHmlbTlgIvmqpTmoYjku6Xnmbznj77nqIvlvI/norzp
oqjmoLzpjK/oqqTjgIHmiZPlrZfpjK/oqqTlkozlj6/og73nmoTmlLnpgLLjgILlroPpgoTlj68N
Cj4gPiAr5Lul5pa55L6/5Zyw5o6S5bqPIGBgI2luY2x1ZGVgYCDvvIzlsI3pvYrorormlbgv5beo
6ZuG77yM6YeN5o6S5paH5a2X5ZKM5YW25LuW6aGe5Ly85Lu75YuZ44CCDQo+ID4gIOips+imiyBE
b2N1bWVudGF0aW9uL2Rldi10b29scy9jbGFuZy1mb3JtYXQucnN0IOOAgg0KPg0KPiBbLi4uXQ0K
Pg0KPiA+IC3liIbphY3kuIDlgIvmlbjntYTnmoTpppbpgbjlvaLlvI/mmK/pgJnmqKPnmoTvvJoN
Cj4gPiAr5YiG6YWN5LiA5YCL6Zmj5YiX55qE6aaW6YG45b2i5byP5piv6YCZ5qij55qE77yaDQo+
ID4NCj4gPiAgLi4gY29kZS1ibG9jazo6IGMNCj4gPg0KPiA+IC0gICAgIHAgPSBrbWFsbG9jX2Fy
cmF5KG4sIHNpemVvZiguLi4pLCAuLi4pOw0KPiA+ICsgICAgIHAgPSBrbWFsbG9jX29ianMoKnAs
IG4sIC4uLik7DQo+ID4NCj4gPiAt5YiG6YWN5LiA5YCL6Zu26ZW35pW457WE55qE6aaW6YG45b2i
5byP5piv6YCZ5qij55qE77yaDQo+ID4gK+WIhumFjeS4gOWAi+mbtumVt+mZo+WIl+eahOmmlumB
uOW9ouW8j+aYr+mAmeaoo+eahO+8mg0KPiA+DQo+ID4gIC4uIGNvZGUtYmxvY2s6OiBjDQo+ID4N
Cj4gPiAtICAgICBwID0ga2NhbGxvYyhuLCBzaXplb2YoLi4uKSwgLi4uKTsNCj4gPiArICAgICBw
ID0ga3phbGxvY19vYmpzKCpwLCBuLCAuLi4pOw0KPiA+ICsNCj4gPiAr6YCZ5YWp56iu5b2i5byP
6YO95pyD5qqi5p+l5YiG6YWN5aSn5bCPIG4gKiBzaXplb2YoLi4uKSDmmK/lkKbmuqLkvY3vvIzl
poLmnpznmbznlJ/muqLkvY3liYflm57lgrMNCj4gPiArTlVMTOOAgg0KPg0KPiBJIHdvdWxkIHNh
eSBzcGxpdHRpbmcgdGhpcyBwYXJ0IGludG8gYSBzbWFsbCBwYXRjaCBpcyBiZXR0ZXIuIEJ1dCBm
b3IgdGhpcw0KPiB0aW1lLCBpdCdzIGZpbmUuDQo=
