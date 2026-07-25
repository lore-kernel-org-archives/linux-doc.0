Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712172D3727
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 00:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784940089; cv=pass; b=Gzs9pF0ousbf5HTHrrLGNfQdTIlcCTa9hmF+tdJYBstU1/siSRfCfHEknLG0SwSOhjejRHzZIjleEvmJN+9NA/eA1DOnPAeZu9laOBAv0UcuvRm5mLtgGZ2quqJ3iFu1o6xGfpUdqBtoP5lNoZG4UCyc9A6XpuvsDjVn+6TwVas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784940089; c=relaxed/simple;
	bh=fxQlMLFiLXtodqUmZFLEsnAMeX+BEIl7BRLcg893K6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jh3pWGScxVwPJGmx5ckW2btJRy9EKtO4WL/JCZwR2WIFXKse0gx9AZYvKgjX6T37snDZqGoGH9KCN57gTy6YXWmeEvROsz+bAJc0oMTC4crj9VpGgdAbTEEOsvCMjztFw/SL4jRsx/sJQd20vblciz7zULQN1ICo2OBaxbmkaRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VL95JUDO; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VL95JUDO"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb99bc721so115908e87.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 17:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784940085; cv=none;
        d=google.com; s=arc-20260327;
        b=ErbmamJobryk0uEXdLlc6G5z7OtJUFfkPOu5i4aXQJle+jTvL1hASn5DEKkrqdYiNN
         jdFqsORjLDin6nX0EJD+RaWXBkG9s2wQltnpJsgSS5UtBAxEZn5CNXEv65MgLF+aJM+n
         gxAPlYcQV5jpABArqCGQDCw9mXSPv8OTJJAQP6OTvzk02zlnon9FtUHlmH7P75lH92gK
         bTxBHpweQe9RYDqyN9TRZBEC+BePCTEwgUqeaI4gj+qFG3+GH42qrGeKadCPB5P/fZnQ
         PWvTiicjOwQXutE/iKY6eUdYXxD6iPq2h/3Vfz975Ql8c/yF1RwIzc7N4qaq6liuOgna
         7ZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxQlMLFiLXtodqUmZFLEsnAMeX+BEIl7BRLcg893K6A=;
        fh=i3Up1NAvajGBDpOObhpXcgRkesEqHY6fIxvBwnVrDlU=;
        b=F2mWMz1jK+BFjxU2ePttb/cB7UZVNM26kmuOtkbuEkNUNFUlJhMx5jYO5ImtYzVfPh
         /pEywM8nnz3JZLQUjKNqLlFudoQqhwtV23zrjYVdEUD9UJb/6qITPmSi57CupH87gOiV
         UQUHJazp78NZC/Gn2xi+lfCSIdOus3KqtLs7mn0nnNYVnDxl35sDDp4chVa1Zo14Zwd9
         OmUebAw2EIzM3uGlU20c1iNxonh+B8sOwnFj7spmM14DP6QwtQsBGmjJ54ZQy84tOz3O
         v+DMoLxe9zpcdoQOfRDiqGKknNniTyJoszJcasBGjpWdg1t9O6h//aKLPxrqXmjCkkDj
         ti2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784940085; x=1785544885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxQlMLFiLXtodqUmZFLEsnAMeX+BEIl7BRLcg893K6A=;
        b=VL95JUDO6oy+bRP2VE7GxRHTUGIsrYFlOkKUMcDD+0DPdBTbdfRIhiClJUaVDOhhAc
         cyJ3/iDHDc4K5ZSVDGCsdj7FTqzntzizZOdGCFsHR8fltWED65pG0/ZmweAe846UqUIq
         4Xq1vdyZDrQIpV+vPBzAJ78GcrWp+MRbV42UJuQca+2JZov6z6kEioH1g0h52lDfPhHY
         UymQVA64tju8xcfQzgmrNWMPT9/7pyrSqV9Og3+Ydhnoumhbl/8tyVPCezJBeT8Ne/8m
         sEvUYeQxVfwq/pQ0kf0x/lVpSK+mNKFCwirSVMksUeNLYOMmAZaaj/Zsp/xHotaxOQdF
         vH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784940085; x=1785544885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxQlMLFiLXtodqUmZFLEsnAMeX+BEIl7BRLcg893K6A=;
        b=ESBrasTNmFXvA5JYMxKzQI0HRdr/Z8/pveOf4Y8jRdAqUsigdNPVXym2RMImq6rdBj
         x6uHvP6MawdLDNGWcH6yXHlyjwJblqCXNhEaEr5sJ51dS4fBAhre9eXhlbBX8O5MQf0e
         hFYWJQfIsXJRa9q80bO5RQCMjfzeDpMMFu/LbTeDgM56Nl09BwWurqhzMfEWbKKq6A28
         Zskg/1i8OUlcbH1lSHA31dLpl8IxaxWredB+0dANEfG62n4re5xFvkx5uAXPDUQx6sMr
         f3xOgCGFIxY+u/37+XOL8J+R/P3xmEAb5/y/iHBdc3wiCi80varSD0wklDP1Xg/ARsgJ
         LA5g==
X-Forwarded-Encrypted: i=1; AHgh+RqigUks5NkfZFw5/2/vjSLmF/vqhrA/TC+Ms998UyM4oQAxfI2Bk24ql22L/n68Hm4kbNyCiLW0Yk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6gdHYf+FltJG1+6cwAjnsUGtWzyIbWp7hSM7HW66dZdFSfVQ
	tkloPUB7ege69spa5pAyfAIkL11PirMOCw7IVp7xD+ru2yIbTcoR5W/b4FfhqWfPdEGvAHYyI1H
	24w280YqyHP5jTjGI9qke7nTXDhZSR/WoeCzL
X-Gm-Gg: AR+sD10gsQkVtGarzniL7XC1j33bN6i4B4Jd3/qLgdT5pkM2IXU49zqXQKrtAJiHKlm
	63YXAvtWScLGGXZ3V8NHaqbj7W4UD2PrlX4ixlY9w11/BpQ+Lqcx+5Af3Cx+sDEGXc7rDOmhATt
	PiAQLZnP263YimS+3UwCJUXsw427Aw17Rmxgvpi40cNybnCCgu+GSsYuf71TIavpNV6K4jLTAGr
	YocjdwP0/up+Y9/50FCEsqlihtE6uI5ophSC4IJlQY5rU2OM/cnxbh+8b6Tg2G+4uEiBn8HzEra
	9fKyKtdKnthtyIWpdQJWS1nsjByq8BxOYd8s9OPD7qfoZfsdPv4B07U=
X-Received: by 2002:a05:6512:692:b0:5b1:5c72:2f0d with SMTP id
 2adb3069b0e04-5b2c1b2dd26mr40837e87.4.1784940085216; Fri, 24 Jul 2026
 17:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-17-chenyou910331@gmail.com> <amNhDDzQk5toZsiF@wyuan.org>
In-Reply-To: <amNhDDzQk5toZsiF@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 25 Jul 2026 08:41:14 +0800
X-Gm-Features: AUfX_mxlWVcz5EzmKX_u1t7RNkW_wqLecPDgMb0H-a7145qe-1oJuN1Tc0sySSs
Message-ID: <CAKspUh+MNSbPub+nVT9ThCnLHgDT+csxQ6=M1nvft1PW6Xk4Vw@mail.gmail.com>
Subject: Re: [PATCH 16/16] docs/zh_TW: Add a glossary for Traditional Chinese translations
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgMDg6NTY6NDVQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+IEkgc3RhcnRlZCBhIGRpc2N1c3Npb24geWVzdGVyZGF5IGluIHRoZSB0ZWxlZ3JhbSBj
aGFubmVsIG9mIGwxMG4tdHcgWzFdLg0KPiBTb21lIGZyaWVuZHMgc3VwcG9ydCAi5qC45b+DIiwg
c29tZSBzdXBwb3J0ICLlhafmoLgiLiBUaGUgcmF0aW8gaXMNCj4gYXBwcm94aW1hdGVseSA1MDo1
MCBvciA2MDo0MC4NCg0KVGhhbmtzIGZvciB0YWtpbmcgdGhpcyB0byBsMTBuLXR3IC0tIGFuZCBm
b3IgcmVjb3JkaW5nIGJvdGggc2lkZXMgaGVyZSwNCnRoYXQgaXMgdXNlZnVsIHRvIGhhdmUgaW4g
dGhlIGFyY2hpdmUuDQoNCkZvciB0aGUgZ2xvc3NhcnkgSSB3b3VsZCBsaWtlIHRvIGtlZXAg5qC4
5b+DLCBmb3IgdGhyZWUgcmVhc29uczoNCg0KICAtIEl0IGlzIHdoYXQgVGFpd2FuZXNlIHRlY2hu
aWNhbCB3cml0aW5nIGFuZCB0ZWFjaGluZyBtYXRlcmlhbA0KICAgIGFjdHVhbGx5IHVzZS4gVGhl
IE9TIGNvdXJzZSBtYXRlcmlhbCB5b3UgbGlua2VkIGlzIG9uZSBleGFtcGxlLA0KICAgIGFuZCB0
cmFuc2xhdGVkIE9TIHRleHRib29rcyBwdWJsaXNoZWQgaGVyZSBvdmVyd2hlbG1pbmdseSB1c2UN
CiAgICDmoLjlv4MgZm9yIGtlcm5lbC4NCiAgLSDlhafmoLggaXMgdGhlIHpoX0NOIHJlbmRlcmlu
Zy4gU2luY2UgdGhlIHdob2xlIHBvaW50IG9mIHRoaXMgc2VyaWVzDQogICAgaXMgdGhhdCB6aF9U
VyBjdXJyZW50bHkgcmVhZHMgbGlrZSBjb252ZXJ0ZWQgemhfQ04sIGtlZXBpbmcg5YWn5qC4DQog
ICAgd291bGQgbGVhdmUgaW4gcGxhY2Ugb25lIG9mIHRoZSBtb3N0IHZpc2libGUgaW5zdGFuY2Vz
IG9mIGV4YWN0bHkNCiAgICB0aGF0Lg0KICAtIFRoZSBrZXJuZWwvY29yZSBhbWJpZ3VpdHkgaXMg
bWFuYWdlYWJsZSBpbiBwcmFjdGljZS4gIuaguOW/gyIgZm9yDQogICAga2VybmVsIGFuZCDmoLgg
LyDmoLjlv4MgZm9yIENQVSBjb3JlcyBjb2V4aXN0IGZpbmUgaGVyZSAtLSDpm5nmoLjlv4MNCiAg
ICAoZHVhbC1jb3JlKSBpcyB1bmFtYmlndW91cyBmcm9tIGNvbnRleHQsIGFuZCB0aGUga2VybmVs
IGRvY3MNCiAgICByYXJlbHkgbmVlZCBib3RoIHNlbnNlcyBpbiBvbmUgc2VudGVuY2UuDQoNClRo
YXQgc2FpZCwgSSBhZ3JlZSB3aXRoIHlvdXIgY29uY2x1c2lvbiB0aGF0IGVpdGhlciBpcyB1bmRl
cnN0YW5kYWJsZSwNCnNvIHRoaXMgaXMgbm90IHNvbWV0aGluZyB0byBzcGVuZCBtdWNoIG1vcmUg
dGltZSBvbi4gV2hhdCBtYXR0ZXJzIG1vcmUNCmlzIHRoYXQgd2hpY2hldmVyIHdlIHBpY2sgaXMg
YXBwbGllZCBjb25zaXN0ZW50bHksIHdoaWNoIGlzIHdoYXQgdGhlDQpnbG9zc2FyeSBpcyBmb3Iu
IElmIGEgc3Ryb25nIGNvbnNlbnN1cyBldmVyIGZvcm1zIHRoZSBvdGhlciB3YXkgaW4gdGhlDQpU
YWl3YW5lc2UgY29tbXVuaXR5LCBjaGFuZ2luZyBpdCBsYXRlciBpcyBhIG1lY2hhbmljYWwgcGF0
Y2guDQoNClRoYW5rcyBmb3IgdGhlIEFja2VkLWJ5Lg0KDQpDaGVuLVl1DQoNCldlaWppZSBZdWFu
IDx3eUB3eXVhbi5vcmc+IOaWvCAyMDI25bm0N+aciDI05pel6YCx5LqUIOS4i+WNiDg6NTflr6vp
gZPvvJoNCj4NCj4gT24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMDU6NTU6NDJBTSArMDgwMCwgQ2hl
bi1ZdSBZZWggd3JvdGU6DQo+ID4gQWRkIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RX
L2dsb3NzYXJ5LnJzdCBkb2N1bWVudGluZyB0aGUNCj4gPiBUYWl3YW5lc2UgTWFuZGFyaW4gdGVy
bWlub2xvZ3kgdXNlZCBieSB0aGUgemhfVFcgdHJhbnNsYXRpb25zLCB3aXRoDQo+ID4gdGhlIGNv
cnJlc3BvbmRpbmcgemhfQ04gdGVybXMgZm9yIGNyb3NzIHJlZmVyZW5jZSwgcGx1cyB0aGUgY2hh
cmFjdGVyDQo+ID4gY29udmVudGlvbnMgKOeCui/oo6Ev6JGXL+aJjS/llZ8v5Y+qL+eZvOW4gyku
IEhvb2sgaXQgaW50byB0aGUgemhfVFcgaW5kZXgsDQo+ID4gcmVwbGFjaW5nIHRoZSBleGlzdGlu
ZyBUT0RPIGVudHJ5Lg0KPiA+DQo+ID4gVGhpcyBpcyB0aGUgcmVmZXJlbmNlIHVzZWQgYnkgdGhl
IHRlcm1pbm9sb2d5IGxvY2FsaXphdGlvbiBvZiB0aGUNCj4gPiB6aF9UVyBwcm9jZXNzLyBkb2N1
bWVudHMgaW4gdGhpcyBzZXJpZXMuDQo+DQo+IEFja2VkLWJ5OiBXZWlqaWUgWXVhbiA8d3lAd3l1
YW4ub3JnPg0KPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoZW4tWXUgWWVoIDxjaGVueW91OTEwMzMx
QGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
VFcvZ2xvc3NhcnkucnN0IHwgMTQ1ICsrKysrKysrKysrKysrKysrKw0KPiA+ICBEb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9UVy9pbmRleC5yc3QgICAgfCAgIDUgKy0NCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxNDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL2dsb3NzYXJ5LnJz
dA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RX
L2dsb3NzYXJ5LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL2dsb3NzYXJ5
LnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4z
MmNmYmZhYWVmM2MNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfVFcvZ2xvc3NhcnkucnN0DQo+ID4gQEAgLTAsMCArMSwxNDUgQEANCj4g
PiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArDQo+ID4gKy4uIF90
d19nbG9zc2FyeToNCj4gPiArDQo+ID4gK+ihk+iqnuihqA0KPiA+ICs9PT09PT0NCj4gPiArDQo+
ID4gKzrkvZzogIU6IOiRieWuuOS9kSBDaGVuLVl1IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFpbC5j
b20+DQo+ID4gKw0KPiA+ICvmnKzooZPoqp7ooajliJflh7pMaW51eOaguOW/g+e5gemrlOS4reaW
h++8iHpoX1RX77yJ57+76K2v5omA5L2/55So55qE6KGT6Kqe44CCemhfVFfnv7vora/ku6Xoh7rn
gaMNCj4gPiAr5oWj55So55qE6LOH6KiK6KGT6Kqe54K65rqW44CC5paw5aKe5oiW5pu05paw57+7
6K2v5pmC77yM6KuL5L6d54Wn5pys6KGo6YG45pOH55So6Kme77yM5Lul57at5oyB5pW05YCLDQo+
ID4gK3poX1RX5paH5Lu25qi555qE5LiA6Ie05oCn77yb6Iul6YGH5Yiw5pys6KGo5pyq5pS26YyE
55qE6KGT6Kqe77yM5q2h6L+O5o+Q5Lqk6KOc5LiB6KOc5YWF44CCDQo+ID4gKw0KPiA+ICvkuIvo
oajlkIzmmYLliJflh7rluLjopovnmoTnsKHpq5TkuK3mlofvvIh6aF9DTu+8ieitr+azle+8jOaW
ueS+v+W+nnpoX0NO57+76K2v6L2J5o+b5oiW5bCN54Wn5pmCDQo+ID4gK+S9v+eUqOOAgg0KPiA+
ICsNCj4gPiAr5LiA6Iis6KGT6KqeDQo+ID4gKy0tLS0tLS0tDQo+ID4gKw0KPiA+ICs9PT09PT09
PT09PT09PT09PT09PT09PT0gID09PT09PT09PT09PT09PT09PT09PT09PT09ICA9PT09PT09PT09
PT09PT09PT09PQ0KPiA+ICvoi7HmlocgICAgICAgICAgICAgICAgICAgICAgemhfVFcgICAgICAg
ICAgICAgICAgICAgICAgIHpoX0NO77yI5bCN54Wn77yJDQo+ID4gKz09PT09PT09PT09PT09PT09
PT09PT09PSAgPT09PT09PT09PT09PT09PT09PT09PT09PT0gID09PT09PT09PT09PT09PT09PT09
DQo+ID4gK2tlcm5lbCAgICAgICAgICAgICAgICAgICAg5qC45b+DICAgICAgICAgICAgICAgICAg
ICAgICAg5YaF5qC4DQo+DQo+IE5vbi1ibG9ja2luZyBub3RlOg0KPg0KPiBJIHN0YXJ0ZWQgYSBk
aXNjdXNzaW9uIHllc3RlcmRheSBpbiB0aGUgdGVsZWdyYW0gY2hhbm5lbCBvZiBsMTBuLXR3IFsx
XS4NCj4gU29tZSBmcmllbmRzIHN1cHBvcnQgIuaguOW/gyIsIHNvbWUgc3VwcG9ydCAi5YWn5qC4
Ii4gVGhlIHJhdGlvIGlzDQo+IGFwcHJveGltYXRlbHkgNTA6NTAgb3IgNjA6NDAuIEkganVzdCBs
ZWF2ZSBzb21lIG9waW5pb25zIGhlcmUgZm9yIGZ1dHVyZQ0KPiByZWZlcmVuY2UuDQo+DQo+ICog
5qC45b+DOg0KPg0KPiAgIFJlYXNvbnMgKHVubW9kaWZpZWQpOg0KPg0KPiAgIDEuIGpzZXJ2IOmW
i+eahOS9nOalreezu+e1seiqsuaYr+eUqOOAjOaguOW/g+OAjeWVpi4uLg0KPg0KPiAgICAgIGh0
dHBzOi8vaGFja21kLmlvL0BzeXNwcm9nL2xpbnV4LWNvbmNlcHRzDQo+DQo+ICAgMi4g5Z+65pys
5LiKIGNvcmUg5Zyo5qC45b+D5oOF5aKD5LiL5LiN5pyD5Zau542o55W25ZCN6Kme55So77yM6ICM
5LiU5q2n576p55yL5YmN5b6M5paH5bCx55+l6YGT5LqGDQo+ICAgICAg5omA5Lul5pyD5b6I5aSa
5Lq65q+U6LyD57+S5oWjIGtlcm5lbCA9IOaguOW/gyAo54S25b6MIGNvcmUg5Lmf562J5pa85qC4
5b+DIChidXQgYXMgYW4NCj4gICAgICBhZGplY3RpdmUpKQ0KPg0KPiAgIDMuIGNvcmUg5Lqm5Y+v
5L2c54K65ZCN6Kme77yM5aaC44CM6ZuZ5qC45b+D44CN77yM5q2k5pmC5Lim5LiN5pyD6IiHIGtl
cm5lbCDmt7fmt4YNCj4NCj4gICA0LiDkvZzmpa3ns7vntbHnmoQga2VybmVsIOWcqOWPsOeBo+ea
hOabuOexjee/u+eahOmChOaYr+aguOW/g+avlOi8g+WkmuWVpg0KPg0KPiAgICAgIGh0dHBzOi8v
d3d3LnRlbmxvbmcuY29tLnR3L3Byb2R1Y3RzLzk3ODk1NzQ5MzUwNTUNCj4NCj4NCj4gKiDlhafm
oLg6DQo+DQo+ICAgUmVhc29ucyAodW5tb2RpZmllZCk6DQo+DQo+ICAgMS4gU2hlbGw6IOWkluau
vA0KPiAgICAgIEtlcm5lbDog5YWn5qC4DQo+ICAgICAgQ29yZTog5qC45b+DDQo+DQo+ICAgMi4g
SnNlcnblpKflu7rorbDnmoTmmK8NCj4gICAgICBrZXJuZWwg5qC45b+DDQo+ICAgICAgY29yZSDm
oLgNCj4gICAgICDku6XljYDliIblhanogIUNCj4NCj4gICAgICDkuI3pgY7miJHlgIvkurrnm67l
iY3lhbblr6bmr5TovIPllpzmraHjgIzlhafmoLjjgI3vvIzlm6Dngroga2VybmVsIOWSjCBzaGVs
bA0KPiAgICAgIOeahOeoseWRvOWkp+e0hOWwseS+huiHquaWvOWFp+WklumXnOS/guOAgmtlcm5l
bA0KPiAgICAgIOaYr+S9nOalreezu+e1seeahOaguOW/g++8jOWFtuS7luS4gOWIh+mDveaYr+eU
seaguOW/g+W7tuS8uCg/KeWHuuWOu+eahO+8jHNoZWxsDQo+ICAgICAg5YmH5piv44CM5p6c5LuB
44CN5aSW5bGk55qE44CM5q6844CN77yM5piv5L2/55So6ICF6IiH5YmN6ICF5LqS5YuV55qE5LuL
6Z2i44CC5Y+m5LiA5pa56Z2i77yMc2hlbGwNCj4gICAgICDora/kvZzjgIzmrrzlsaTjgI3lnKjm
iJHnnIvkvobmmK/pjK/oqqTlnLDmsr/nlKjkuobniannkIblrbjlkI3oqZ7vvIzkuI3mh4nlvLfo
qr/jgIzlsaTjgI3vvIzlpoLmnpwgc2hlbGwNCj4gICAgICDnlKjkuobjgIzlpJbmrrzjgI3pgqMg
a2VybmVsIOiHqueEtuimgeiIh+S5i+Wwjem9iuOAgg0KPg0KPiAgIDMuIOavlOi8g+aykueIreit
sOeahOWwsSDmoLjlv4PvvI/mrrzlsaTvvI/moLgg5ZCnICgqIHdoYXQgZG9lcyB0aGlzIG1lYW4u
Lj8gQ2FuIGl0DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJlIGNvbnNpZGVyZWQgbmV1dHJhbD8pDQo+ICAgICAg5pyJ5YW25LuW5oSP6KaL55qE5Lq6
5Z+65pys5LiK5bCx5piv6Ieq5bex56CU56m26YGO55qE77yM5LuW5YCR6IO955yL5oeC55qEKCgN
Cj4NCj4gLS0tDQo+DQo+IEJlY2F1c2Ugb2YgdGhlIGNvbnRleHQsIG5vIG1hdHRlciB3aGljaCB0
cmFuc2xhdGlvbiBpcyB1c2VkLCB0aGVyZSBpcw0KPiBhY3R1YWxseSBubyBwcm9ibGVtIGluIHVu
ZGVyc3RhbmRpbmcgdGhpcy4gU28gdGhlcmUncyBubyBuZWVkIHRvIHdvcnJ5DQo+IHRvbyBtdWNo
IGFib3V0IHRoaXMuDQo+DQo+IFRoYW5rcy4NCg==
