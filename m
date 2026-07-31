Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA56257844
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 05:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475214; cv=pass; b=kJ+7gIl7VHrVjDEEhZCbOG+3DV5EGJ9F7PGlvAO5l7sMKWyk/5joX3qbqHBOCls2oYADcPSE2ZLL0u5aBq4+N/eVR52O+9noel5hl9cG1mh1MAAVAS1yxMWHWdKkdTFY6A4tGfN9N+EvDiqg5HBm2xp6IzEqxhtdypORlsJTZBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475214; c=relaxed/simple;
	bh=VVCyTY4b7y+ewMFLM++ogdlG4aIcScFt/qsAs3EFVWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmAgNqLnRK6A+qIihVlUsIZfXBaDktz/Hr2jQSdia8xkum21WXawNTeLJQN+Ituvp62OKh03kfD2m6CLv4r+hiA6UHBFYAkDV2M1WcQ9ko8N7ax8o/a97dMnvBduFmXrBT+QIgccUPz0rmGDrUnOcsKoW3H1rDXNG4D8zhc3ccw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnppnTk+; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnppnTk+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb7ccb9f0so55679e87.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 22:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785475210; cv=none;
        d=google.com; s=arc-20260327;
        b=mD5zmfR4cSNEYRo3PrO13aMsQuse/sAPkebJWkA0gvCGTQE5OiJpzpRcX3CQCPiihB
         //lNBI9xOsZTg2xjlKL0WBMdXP6bqzmO70iR+PbbzUg5tjyWbPULKVUEAEKZlKH1khHI
         iL1UbqZHuwJpvhb1873GZ+JaHnmWWkGj+hhqyooF45e7QoeWbthX2/4EIKmhbuxAsgJA
         bqD8sGt9+ET1ggYCYLVKRFGjKpxuMsyxig8Wl8p8U/VHhQ25wPJmjmpFW2/RRQ0m3BJm
         cvI5nFzDegIS9VVXiXH4FILBNeaTLXQWgNhmsWEHajfCKFM294bbllDOB8CvrCfyTX43
         /9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVCyTY4b7y+ewMFLM++ogdlG4aIcScFt/qsAs3EFVWw=;
        fh=MsevnVW+/HSA5VjfcBC12P35U9WcqKvdiQkoXwcA98Y=;
        b=W1JMpauyv1TL9jAQxjTpOecC+gJf9fzkfBeTG9nZ6WAgpoksM1c9+28KQaHIaWsV/a
         IoumuIvKQiWZ8zEhIoVntN6qtY2KN9CadCDXk7G+4HDTEFqPmfsb0BKY+I1g/3Vog3zC
         6SvXzUIujYf6tg6tbknaGCTqnflsu6PFtxpB23WzxAVYXuv+DQhJgFkSriqby6OvzWjG
         FR1V2FzDUecnOAjyiEPaDP1GU+95dKN4HH+4pmlXcY9xpTGfoWFB+Rps0+x7a9z4Cmlp
         Ufa6ZbwtTJ/8MEGnFbHZi3s6qVrBDGTMqsiNMOQe416SbTwbvTAJxyrJsSVXkbzebxrm
         iL8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785475210; x=1786080010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVCyTY4b7y+ewMFLM++ogdlG4aIcScFt/qsAs3EFVWw=;
        b=cnppnTk+5H/bbBOgJEh+FJaQ6mFoXEb5n+Lk6JHr2LANcSiE4a+F94oZg9jYz2V2tY
         EzRtSQ+tEJ3W5nAY+OPeHCIvD7XmKQTDwdQR3mYbMLiiXuXK6GLCmk5MZUJs4V52PZ5l
         70ba7zKXvNb481cfQ5IkkHd5Tfr7gWPaAZOSC51Nr+PRon/3fZIUXULHVVpzoH6B7HpQ
         f4Q0uAO/9aNlkHM/GtXUaaLyAh8NLSamI0LZfQzZF0/4vvcri+DozMaofd/SxzX+X+4+
         IjyX1yK6zEi0vk72FJ6+arLkMyysRr26QCf18s017xsH7MOD6keXEcK7QOD2SN/bJb5Z
         i6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475210; x=1786080010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVCyTY4b7y+ewMFLM++ogdlG4aIcScFt/qsAs3EFVWw=;
        b=AQsDn1zvpZSr/L2bqotKiGqoMipuZQ+5CWYEdOxurel39dtQPk1RnsANHkej/vSBmF
         /bDYoisp8iL4PtouIYvtZ/Esp9lees36ouCWUxWElTYZZhVgUy59t0u3H2U/2XFQ3O1k
         E7FqJPQxZJwDZQ8BMGVhcHO2fbKW67aDfWFt1egYzI5S3A9Fqwneych2OOrdEfLbSjBk
         S+f0qTmxPHtpN92ItiXSOQ3VeKl5drXR3yqcOsXdsB7hFLNoBcfCyOLAksOC8rPaI+eC
         MoZr9amphlsjbWZzfFnk0XovpYVZS/L2Xki6/C+4nf+8w8gUpASmECktnNfa9j3T53ee
         fShQ==
X-Forwarded-Encrypted: i=1; AHgh+RrU5HJeDiod7UiAVswDxVAkOieR13bwlvNLeT2vi9b/IhIBWBIkExuvTYFpd4sqhcvG0eJ4SeJTxZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhoI9VX/HTZDzK71Ok23O4YmiTjDvOwbhIkMjiXYIaS1Cn3uYQ
	jKT9yAxYpp+C5IFRE+eKzP1Dz+RPhmb1QUMo8WoRzv+xICU2w6GTnXbm2p4VR0qQ0iJGVOd7QV0
	hce63n4ak4Zxc6vE6w0992l1dKPA+fXM=
X-Gm-Gg: AR+sD12EItvZbHbn8ysRP1hvkxHaLkIfxccfkybIsVEjKWmsCXVYMSv17xaBMRenyvU
	iXBHFQHFQkfI7WL+ei7v2jXSmNJF+pMuINnEvZZQLdHyfKftXaSMlTuimpAkC2c1cBrz1ij04rr
	TOgxrDezUTWE2Bv45HeuIy8BCFeySUNxGYsVWOZYCnwGF/u987aGO3IzJt44lqjt3HLbBj2njPf
	CuF93R1v3/8gjJP1o20pqmWKr7Oa3CqdZMlZjd7GHrh/MFV3erGr9G0ZoaL6bXiKoASJSwsqvmD
	YE+JohCkACpXgeZqZmazWKTkomTIGSHhy9RFhqTfWUgfmskE9WyQ7LoKrU7h3pG8gyLOhFBwBEF
	2w3g0Dfp529lup8x0SCwvR03J/nM=
X-Received: by 2002:a05:6512:128d:b0:5b0:6aea:cdb5 with SMTP id
 2adb3069b0e04-5b2e1fca9a9mr135755e87.1.1785475210003; Thu, 30 Jul 2026
 22:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-4-chenyou910331@gmail.com> <amouJSTjAMh-pK6S@wyuan.org>
In-Reply-To: <amouJSTjAMh-pK6S@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 31 Jul 2026 13:19:58 +0800
X-Gm-Features: AUfX_mx2Slf2hEGUMsljEnU3u1toYW0FbWyO5mQPDbExvWwOiSyBZ9vI_ZHEVeg
Message-ID: <CAKspUhKS64JTa8V=3K_v0fnGBn4CKRnmrReQD21WmA8srKw3cg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] docs/zh_TW: process: localize terminology in code-of-conduct-interpretation.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgMTI6NDU6MjVBTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+IElmIHRoZSBmb2xsb3dpbmcgY29tbWVudHMgYXJlIGR1ZSB0byBteSBvdmVydGhpbmtp
bmcsIHRoZW4NCj4NCj4gQWNrZWQtYnk6IFdlaWppZSBZdWFuIDx3eUB3eXVhbi5vcmc+DQoNCk5v
dCBvdmVydGhpbmtpbmcgYXQgYWxsIC0tIHR3byBvZiB0aGUgdGhyZWUgYXJlIHJlYWwgaW1wcm92
ZW1lbnRzLg0KVGhhbmtzIGZvciB0aGUgQWNrZWQtYnksIEkgd2lsbCBjYXJyeSBpdCBvdmVyLg0K
DQo+ID4gK+eVtuWAi+S6uuWcqOmBleimj+eZvOeUn+eahOWgtOWQiOaJv+iqjeiHquW3seeahOih
jOeCuuS4puS9nOWHuuW9jOijnOaZgg0KPg0KPiBJbiB6aF9DTiwgSSB0aGluayB3ZSBwcmVmZXIg
J+e6oOatoycgKOe6oOato+ihjOS4uikuIEp1c3QgYSByZWZlcmVuY2UuDQoNCllvdSBhcmUgcmln
aHQsIGFuZCB0aGlzIGlzIG5vdCBhIGNyb3NzLXN0cmFpdCBkaWZmZXJlbmNlLiDlvYzoo5wgaW4N
ClRhaXdhbmVzZSB1c2FnZSB0YWtlcyBhIGxvc3Mgb3IgYSBzaG9ydGZhbGwgYXMgaXRzIG9iamVj
dCAo5b2M6KOc5pCN5aSxLA0K5b2M6KOc5LiN6LazKSwgc28g5b2M6KOc6KGM54K6IHJlYWRzIG9k
ZGx5LiBUaGUgRW5nbGlzaCBpcyAibWFrZXMgYW1lbmRzIiwNCmkuZS4gY29ycmVjdHMgdGhlIGJl
aGF2aW91ciwgc28g57O+5q2jIGlzIHRoZSByaWdodCB3b3JkIGhlcmUgYW5kIGlzDQplcXVhbGx5
IG5hdHVyYWwgaW4gVGFpd2FuLiBXaWxsIGNoYW5nZSB0bzoNCg0KICDnlbblgIvkurrlnKjpgZXo
po/nmbznlJ/nmoTloLTlkIjmib/oqo3oh6rlt7HnmoTooYzngrrkuKbliqDku6Xns77mraPmmYIN
Cg0KPiA+ICvooYzngrrmupbliYflp5Tlk6HmnIPmnInosqzku7voiIfmiYDmnInnm7jpl5zmlrnl
kIjkvZzvvIzoqr/mn6XkuKbop6PmsbrpgJnkupvloLHlkYrjgIINCj4NCj4g5aSE55CG5oql5ZGK
IG9yIOino+WGs+aKpeWRiu+8n0kgZG9uJ3Qga25vdyBUYWl3YW4ncyBwcmVmZXJlbmNlLg0KPiBJ
IHdvdWxkIGRvIHRoaXMgaW4gemhfQ046DQo+IOihjOS4uuWHhuWImeWnlOWRmOS8muaciei0o+S7
u+S4juaJgOacieebuOWFs+aWueWQiOS9nO+8jOWvuei/meexu+aKpeWRiui/m+ihjOiwg+afpeW5
tuS6iOS7peWkhOeQhuOAgg0KDQpBbHNvIHJpZ2h0LCBhbmQgYWdhaW4gbm90IGEgcmVnaW9uYWwg
ZGlmZmVyZW5jZSAtLSDop6PmsbogdGFrZXMgYQ0KcHJvYmxlbSBhcyBpdHMgb2JqZWN0LCBub3Qg
YSByZXBvcnQsIHNvIOino+axuuWgseWRiiBpcyBzaW1wbHkgd3JvbmcgaW4NCmJvdGggdmFyaWFu
dHMuIFRhaXdhbiBzYXlzIOiZleeQhuWgseWRiiAvIOiZleeQhueUs+iotC4gSSB3aWxsIGZvbGxv
dyB5b3VyDQpzZW50ZW5jZSBzdHJ1Y3R1cmU6DQoNCiAg6KGM54K65rqW5YmH5aeU5ZOh5pyD5pyJ
6LKs5Lu76IiH5omA5pyJ55u46Zec5pa55ZCI5L2c77yM5bCN6YCZ6aGe5aCx5ZGK6YCy6KGM6Kq/
5p+l5Lim5LqI5Lul6JmV55CG44CCDQoNCj4gPiAr6KGM54K65rqW5YmH5aeU5ZOh5pyD6KG35b+D
5biM5pyb77yM6ZyA6KaB6KaB5rGC5YWs6ZaL6YGT5q2J55qE5LiN5Y+v5o6l5Y+X6KGM54K677yM
5Zyo5pyq5L6G5LuN54S25qW154K6572V6KaL44CCDQo+DQo+IOihjOS4uuWHhuWImeWnlOWRmOS8
muiht+W/g+W4jOacm++8jOmCo+S6m+mcgOimgeWFrOW8gOmBk+atieeahOS4jeWPr+aOpeWPl+ih
jOS4uuWcqOacquadpeiDvee7p+e7reaIkOS4uuaegeS4ug0KPiDnvZXop4HnmoTnjrDosaHjgIIN
Cj4NCj4gLi4gc2VlbXMgbW9yZSBjbGVhciBhbmQgY29oZXJlbnQ/DQoNClRoaXMgb25lIEkgd291
bGQgcmF0aGVyIGtlZXAgYXMgaXMsIGlmIHlvdSBkbyBub3QgbWluZC4gQm90aCBhcmUNCnVuZGVy
c3RhbmRhYmxlLCBzbyB0aGlzIGlzIGEgc3R5bGUgY2FsbCByYXRoZXIgdGhhbiBhDQpjb3JyZWN0
bmVzcyBvbmUuDQoNCkJvdGggZml4ZXMgd2lsbCBiZSBpbiB2My4NCg0KQ2hlbi1ZdQ0KDQpXZWlq
aWUgWXVhbiA8d3lAd3l1YW4ub3JnPiDmlrwgMjAyNuW5tDfmnIgzMOaXpemAseWbmyDkuIrljYgx
Mjo0NeWvq+mBk++8mg0KPg0KPiBPbiBUdWUsIEp1bCAyOCwgMjAyNiBhdCAwNToxMDoyNVBNICsw
ODAwLCBDaGVuLVl1IFllaCB3cm90ZToNCj4gPiBMb2NhbGl6ZSBtYWlubGFuZCB0ZXJtcyB0byBU
YWl3YW5lc2UgTWFuZGFyaW4gKOWFp+aguOKGkuaguOW/gywg56S+5Y2A4oaS56S+576kLA0KPiA+
IOi7n+S7tuKGkui7n+mrlCwgLi4uKSBhbmQgc3luYyB3aXRoIHRoZSBFbmdsaXNoIG9yaWdpbmFs
OiByZXdyaXRlIHRoZQ0KPiA+IGVuZm9yY2VtZW50IHNlY3Rpb24gdG8gbWF0Y2ggdGhlIGN1cnJl
bnQgY29tbWl0dGVlL1RBQiB3b3JkaW5nIGFuZCBhZGQNCj4gPiB0aGUgIkVuZm9yY2VtZW50IGZv
ciBVbmFjY2VwdGFibGUgQmVoYXZpb3IiIHNlY3Rpb24gaW50cm9kdWNlZCBieQ0KPiA+IGNvbW1p
dCBjODE4ZDVjNjRjOWEgKCJEb2N1bWVudGF0aW9uL0NvQzogc3BlbGwgb3V0IGVuZm9yY2VtZW50
IGZvcg0KPiA+IHVuYWNjZXB0YWJsZSBiZWhhdmlvcnMiKS4NCj4gPg0KPiA+IHVwZGF0ZSB0byBj
b21taXQgMDRjNGJiOTBhZTZlICgiRG9jdW1lbnRhdGlvbi9Db0M6IFNwZWxsIG91dCB0aGUgVEFC
DQo+ID4gcm9sZSBpbiBlbmZvcmNlbWVudCBkZWNpc2lvbnMiKQ0KPg0KPiBJZiB0aGUgZm9sbG93
aW5nIGNvbW1lbnRzIGFyZSBkdWUgdG8gbXkgb3ZlcnRoaW5raW5nLCB0aGVuDQo+DQo+IEFja2Vk
LWJ5OiBXZWlqaWUgWXVhbiA8d3lAd3l1YW4ub3JnPg0KPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENo
ZW4tWXUgWWVoIDxjaGVueW91OTEwMzMxQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Nv
ZGUtb2YtY29uZHVjdC1pbnRlcnByZXRhdGlvbi5yc3QgICAgICAgIHwgMTYyICsrKysrKysrKysr
Ky0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0
aW9ucygtKQ0KPg0KPiBJIGRpZG4ndCB0YWtlIGEgY2xvc2VyIGxvb2sgYWJvdXQgdGhlIG5ldyBw
YXJ0IGJlbG93LCBzbyBsZXQgbWUgZG8gaXQNCj4gdGhpcyB0aW1lLg0KPg0KPiA+ICvkuI3lj6/m
jqXlj5fooYzngrrkuYvooYzngrrmupbliYfpgZXopo/nmoTln7fms5UNCj4gPiArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiArDQo+ID4gK+ihjOeCuua6luWJh+WnlOWToeac
g+iHtOWKm+aWvOeiuuS/neaIkeWAkeeahOekvue+pOaMgee6jOWFt+acieWMheWuueaAp++8jOS/
g+mAsuWkmuWFg+eahOiojuirluWSjOingOm7nu+8jOS4pg0KPiA+ICvoh7TlipvmlrzpmqjokZfm
mYLplpPmlLnpgLLpgJnkupvnibnos6rjgILooYzngrrmupbliYflp5Tlk6HmnIPmlLbliLDnmoTl
pKflpJrmlbjloLHlkYrvvIzmupDmlrzlsI3plovnmbzpgY7nqIsNCj4gPiAr5Lul5Y+K57at6K23
6ICF55qE6KeS6Imy44CB6LKs5Lu75Y+K5YW25bCN56iL5byP56K85o6l5Y+X6IiH5ZCm55qE5rG6
5a6a5qyK55qE6Yyv6Kqk55CG6Kej44CC6YCZ5Lqb5aCx5ZGK6YCP6YGODQo+ID4gK+a+hOa4hemW
i+eZvOmBjueoi+WSjOihjOeCuua6luWJh+eahOevhOWcjeS+huino+axuuOAgg0KPiA+ICsNCj4g
PiAr5LiN5Y+v5o6l5Y+X55qE6KGM54K65Y+v6IO95Zyo55+t5pmC6ZaT5YWn5Lit5pa355u45LqS
5bCK6YeN55qE5Y2U5L2c77yM5Lim5bCN56S+576k55qE5YGl5bq36YCg5oiQ6ZW35pyf55qEDQo+
ID4gK+iyoOmdouW9semfv+OAgueVtuWAi+S6uuWcqOmBleimj+eZvOeUn+eahOWgtOWQiOaJv+iq
jeiHquW3seeahOihjOeCuuS4puS9nOWHuuW9jOijnOaZgu+8jOS4jeWPr+aOpeWPl+eahOihjOeC
ug0KPiA+ICvpgJrluLjlsLHog73lvpfliLDop6PmsbrjgIINCj4NCj4gSW4gemhfQ04sIEkgdGhp
bmsgd2UgcHJlZmVyICfnuqDmraMnICjnuqDmraPooYzkuLopLiBKdXN0IGEgcmVmZXJlbmNlLiBJ
J20NCj4gZmluZSB3aXRoIGl0IGlmIHRoZXJlIGFyZSBpbmRlZWQgZGlmZmVyZW50IHByYWN0aWNl
cyBvbiBib3RoIHNpZGVzIG9mDQo+IHRoZSBzdHJhaXQgcmVnYXJkaW5nIHRoaXMgbWF0dGVyLg0K
Pg0KPiA+ICvnlbbkuI3lj6/mjqXlj5fnmoTooYzngrrmnKrog73pgI/pgY7npL7nvqToqI7oq5bo
p6PmsbrmmYLvvIzooYzngrrmupbliYflp5Tlk6HmnIPmnIPmlLbliLDnm7jpl5zloLHlkYrjgILn
lbYNCj4gPiAr5LiN5Y+v5o6l5Y+X55qE6KGM54K65bCN55u45LqS5bCK6YeN55qE5Y2U5L2c6Zec
5L+C6YCg5oiQ6LKg6Z2i5b2x6Z+/5pmC77yM6KGM54K65rqW5YmH5aeU5ZOh5pyD5pyD5o6h5Y+W
5o6q5pa9DQo+ID4gK+aBouW+qeacieaIkOaViOS4lOebuOS6kuWwiumHjeeahOWNlOS9nOOAgg0K
PiA+ICsNCj4gPiAr6KGM54K65rqW5YmH5aeU5ZOh5pyD5pyJ576p5YuZ5bCN5aCx5ZGK5ZKM5aCx
5ZGK6ICF55qE6LOH6KiK5L+d5a+G44CC5aCx5ZGK5Y+v6IO95L6G6Ieq5Y+X5a6z5pa577yM5Lmf
5Y+v6IO9DQo+ID4gK+S+huiHquebruedueS4jeWPr+aOpeWPl+ihjOeCuueahOekvue+pOaIkOWT
oeOAguihjOeCuua6luWJh+WnlOWToeacg+acieiyrOS7u+iIh+aJgOacieebuOmXnOaWueWQiOS9
nO+8jOiqv+afpQ0KPiA+ICvkuKbop6PmsbrpgJnkupvloLHlkYrjgIINCj4NCj4g5aSE55CG5oql
5ZGKIG9yIOino+WGs+aKpeWRiu+8n0kgZG9uJ3Qga25vdyBUYWl3YW4ncyBwcmVmZXJlbmNlLg0K
Pg0KPiBJIHdvdWxkIGRvIHRoaXMgaW4gemhfQ046DQo+DQo+IOihjOS4uuWHhuWImeWnlOWRmOS8
muaciei0o+S7u+S4juaJgOacieebuOWFs+aWueWQiOS9nO+8jOWvuei/meexu+aKpeWRiui/m+ih
jOiwg+afpeW5tuS6iOS7peWkhOeQhuOAgg0KPg0KPiBqdXN0IGEgcmVmZXJlbmNlLg0KPg0KPiA+
ICvooYzngrrmupbliYflp5Tlk6HmnIPoiIfnlbbkuovkurrlkIjkvZzvvIzkv4Pkvb/lhbbnkIbo
p6Pku6XkuIvkuovpoIXnmoTph43opoHmgKfvvJrkv67lvqnlhbbooYzngrrlsI3lj5flrrPmlrkN
Cj4gPiAr6YCg5oiQ55qE5YK35a6z77yM5Lul5Y+K5bCN56S+576k55qE6ZW35pyf6LKg6Z2i5b2x
6Z+/44CCDQo+ID4gKw0KPiA+ICvnm67mqJnmmK/pgZTmiJDmiYDmnInlkITmlrnpg73og73mjqXl
j5fnmoTop6PmsbrmlrnmoYjjgILlpoLmnpzoiIfnlbbkuovkurrnmoTlkIjkvZzmnKrog73pgZTl
iLDpoJDmnJ/nmoTntZDmnpzvvIwNCj4gPiAr6KGM54K65rqW5YmH5aeU5ZOh5pyD5bCH6KmV5Lyw
5YW25LuW5o6q5pa977yM5L6L5aaC6KaB5rGC5YWs6ZaL6YGT5q2J5Lul5L+u5b6p5YK35a6z44CC
DQo+ID4gKw0KPiA+ICvopoHmsYLngrrpgZXopo/ooYzngrrlhazplovpgZPmrYkNCj4gPiArfn5+
fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+ICsNCj4gPiAr6KGM54K65rqW5YmH5aeU5ZOh5pyD5Zyo
6YGV6KaP55m855Sf55qE5aC05ZCI5YWs6ZaL5oyH5Ye66Kmy6KGM54K677yM6KaB5rGC54K66YGV
6KaP6KGM54K65YWs6ZaL6YGT5q2J44CCDQo+ID4gKw0KPiA+ICvngrrpgZXopo/ooYzngrrlhazp
lovpgZPmrYnmmK/ph43lu7rkv6Hku7vnmoTnrKzkuIDmraXjgILkv6Hku7vlsI3mlrzkuIDlgIvk
u6Xkv6Hku7vlkozlsIrph43pgYvkvZznmoTnpL7nvqTnmoQNCj4gPiAr5oyB57qM5oiQ5Yqf5ZKM
5YGl5bq36Iez6Zec6YeN6KaB44CCDQo+ID4gKw0KPiA+ICvoi6XmnKrngrrpgZXopo/ooYzngrrl
hazplovpgZPmrYnnmoToo5zmlZHmjqrmlr0NCj4gPiArfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4NCj4gPiArDQo+ID4gK+ihjOeCuua6luWJh+WnlOWToeacg+mAj+mBjuWQkVRBQuW7
uuitsOijnOaVkeaOquaWveS7peS+m+aJueWHhu+8jOaxuuWumuaBouW+qeWBpeW6t+WNlOS9nOea
hOS4i+S4gOatpeihjOWLleOAgg0KPiA+ICsNCj4gPiArLSDnpoHmraLpgZXopo/ogIXlj4PoiIfm
oLjlv4PplovnmbzpgY7nqIvvvIzmnJ/pmZDmnIDplbflj6/pgZTkuIDlgIvlrozmlbTnmoTmoLjl
v4PplovnmbzpgLHmnJ/jgILooYzngrrmupbliYcNCj4gPiArICDlp5Tlk6HmnIPlj6/ku6XopoHm
sYLlhazplovpgZPmrYnkvZzngrrop6PpmaTnpoHku6TnmoTmop3ku7bjgIINCj4gPiArDQo+ID4g
K+S4gOauteaZgumWk+WFp+emgeS7pOeahOevhOWcjeWPr+iDveWMheaLrO+8mg0KPiA+ICsNCj4g
PiArICAgIGEuIOaLkue1leWFtuijnOS4geiyoueNu+WSjOaLieWPluiri+axgg0KPiA+ICsgICAg
Yi4g6YCP6YGO5b+955Wl5YW26LKi54275ZKML+aIluWwgemOluWFtumbu+WtkOmDteS7tuW4s+aI
tu+8jOaaq+WBnOiIh+mBleimj+iAheeahOWNlOS9nA0KPiA+ICsgICAgYy4g6ZmQ5Yi25YW26YCP
6YGOa2VybmVsLm9yZ+W5s+iHuu+8iOWmgumDteS7tuWIl+ihqOWSjOekvuS6pOWqkumrlOe2suer
me+8iemAsuihjOS6pOa1geeahOiDveWKmw0KPiA+ICsNCj4gPiAr5LiA5pemVEFC5Lul5Y+D6IiH
6KGo5rG65oiQ5ZOh55qE5LiJ5YiG5LmL5LqM5aSa5pW45om55YeG5LqG56aB5Luk56+E5ZyN5Lit
5YiX5Ye655qE5LiA6aCF5oiW5aSa6aCF5o6q5pa977yMDQo+ID4gK+ihjOeCuua6luWJh+WnlOWT
oeacg+Wwh+iIh+ekvue+pOOAgee2reitt+S6uuWToeOAgeWtkOe2reitt+S6uuWToeWSjGtlcm5l
bC5vcmfnrqHnkIblk6HlkIjkvZzvvIzln7fooYwNCj4gPiArVEFC5om55YeG55qE5o6q5pa944CC
5Lu75L2V5ZCM5pmC5ZyoVEFC5Lu76IG355qE6KGM54K65rqW5YmH5aeU5ZOh5pyD5oiQ5ZOh5LiN
5Y+D6IiH5bCN6YCZ5Lqb5o6q5pa955qE6KGo5rG644CCDQo+ID4gKw0KPiA+ICvooYzngrrmupbl
iYflp5Tlk6HmnIPmt7Hnn6XopoHmsYLlhazplovpgZPmrYnlkozlr6bmlr3npoHku6Tlj6/og73l
sI3lgIvkurrpgKDmiJDnmoTosqDpnaLlvbHpn7/jgILlroPkuZ/mt7Hnn6UNCj4gPiAr5Zyo55m8
55Sf5q2k6aGe5Zq06YeN55qE5YWs6ZaL6YGV6KaP6KGM54K65pmC5LiN5o6h5Y+W6KGM5YuV5Y+v
6IO95bCN56S+576k6YCg5oiQ55qE6ZW35pyf5YK35a6z44CCDQo+ID4gKw0KPiA+ICtUQULmibnl
h4bnmoToo5zmlZHmjqrmlr3nmoTmnInmlYjmgKfvvIzlj5bmsbrmlrznpL7nvqTjgIHntq3orbfk
urrlk6HjgIHlrZDntq3orbfkurrlk6HlkoxrZXJuZWwub3JnDQo+ID4gK+euoeeQhuWToeWcqOWf
t+ihjOmAmeS6m+aOquaWveaZgueahOS/oeS7u+iIh+WQiOS9nOOAgg0KPiA+ICsNCj4gPiAr6KGM
54K65rqW5YmH5aeU5ZOh5pyD6KG35b+D5biM5pyb77yM6ZyA6KaB6KaB5rGC5YWs6ZaL6YGT5q2J
55qE5LiN5Y+v5o6l5Y+X6KGM54K677yM5Zyo5pyq5L6G5LuN54S25qW154K6572V6KaL44CCDQo+
DQo+IOihjOS4uuWHhuWImeWnlOWRmOS8muiht+W/g+W4jOacm++8jOmCo+S6m+mcgOimgeWFrOW8
gOmBk+atieeahOS4jeWPr+aOpeWPl+ihjOS4uuWcqOacquadpeiDvee7p+e7reaIkOS4uuaegeS4
uue9leingeeahOeOsOixoeOAgg0KPg0KPiAuLiBzZWVtcyBtb3JlIGNsZWFyIGFuZCBjb2hlcmVu
dD8NCg==
