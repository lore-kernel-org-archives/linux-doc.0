Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FAC47426B
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 16:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638268; cv=pass; b=qztHxaewc8Qh/+TyyGZQwIXSXf8KCGiq1UO3hNxeB9p5r6afSq3TjimjL5R/Z+sM1H6Gd92T6+ny16adxMZHwczwvbpr4DhTXR9Tazj1bd2acjkr6K9qp+2FrW4crcFrQ2G8j/yxHtLho5WrDeMBjljoaKEe2671/9e9CN9vDng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638268; c=relaxed/simple;
	bh=u8Er/mx8btaW6zLkdA0MNBOh/GWkoU54anU6EZGhaQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbaAmjNoSJp76QIjTKcNM5FtZ3DMfPfErpWAiIljGRGEVAz996FrjSxasioIO1xAYo2Obmfm5sQ8SyzfKfgXiAUDpREiM4BlE9XB0G1YuJzqOpeozk7ykXXyZgPVTR3LspMW/6S0at2EAyyEPTppvhNIHSIjtGhW19wXIqCyMpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDLTb0SD; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDLTb0SD"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c207cb16cf5so16935066b.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 09:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786638265; cv=none;
        d=google.com; s=arc-20260327;
        b=Ba/zFLuV+Wb5v/+F3wwrE3s4dhIZgjSbnp/28TzEbtzJ7myNnpvuAjU9P7tRO3zVdL
         dCQpBonLItc1fO7SF9N5JLN7uSVnEXyvXB3sKf8A4pEtj47lRSE4zEeCLBbAqe+doM/Y
         XOVuLKBEK+cgoaM3XKkqwKi4eGC39BvjoMfmiLFT9wsk0QtmZ765plj854nWwEnpNeYo
         RrjFH2q62W/iUu/eSRa3ijjbM9rtlxysa4XemZ4en9JngQXaYjkBPMjPQho7CjDjLsO6
         vUGCe9ucoTxT/zx1G9Dnfucig3O5gJvdaSEfVuTk21erm366Hr2OB+JTYQb8snq9ajsl
         Cp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8Er/mx8btaW6zLkdA0MNBOh/GWkoU54anU6EZGhaQA=;
        fh=Qy+1UZHIclNQtLKl26RKPeXTIirRXwyNMi3tWi2T+mg=;
        b=hIlTgvz2Xsvov8w7jSTzjo97GALp2VZ1FOs7qFIBgMjJtjDehs4EEXveFmwez1PuHr
         r2m8Kdy9N4zDwAPbteQNGdyyiBqPVUj9qLxs7BstIlYqo0Jfi+DOPf4dd8AI/cWCuvzS
         8jFnlsKOpUkOa8VAD2lodJvttMLF1rche5AP5gU03metNeuuCbafnNjEmcT+vbtyX4LR
         i3SoBWISNkMVpAATPHBIDSbOD83C/aTUWAqHDac2XU81zm0oG6aK1lAMoD0DuR9L+8g5
         koKJUgK3CkSjJB1EJ+k05PRuVAgCCEJCYKQ9BIsQVMX2hnn4nOlJeLvxn55nuCkQOD5k
         8FRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786638265; x=1787243065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u8Er/mx8btaW6zLkdA0MNBOh/GWkoU54anU6EZGhaQA=;
        b=QDLTb0SDtl/MMKySJ/vH/FsN7n4Ui/GZmisblmn+wxU1yuAuus9KMU2wzoPIccjsLC
         yb3/cklfgtfOi9WN+2J0KAeYX1rSRVEwa6rX8MBu5jHIgXx7bH/saGeOj/NVNcyYrBRF
         oJkRMYW3hu731spNrMOVhEtU93ABCfxFB96Ea9Uy1vBnrMKUXjFaoMRSmdzTUOsJ4B50
         Bs4gUSBwLJ8vCxMyM1knjezMo9nW1DKGgOC585KdKX0xMS0fXGQ5nC3I2R+v0HIJisIM
         xuLjG/qUfQwsK6GGQrzWb+TgwOzV2yCw7lMAHPreUbHAmw8JG1mHR1y8NYjIgWAz7Kd1
         5s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638265; x=1787243065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8Er/mx8btaW6zLkdA0MNBOh/GWkoU54anU6EZGhaQA=;
        b=J5ZA49jv8+20s4iDc2beKuYmSPUM0pxao9M4ejiyu0mDDzWZSC6xOFEjP/KyTvzaZy
         x/9TkRnEayOqG1WczDSLxKNnPHXmUjA4Q7xGNCfrAU/21d5/DSgRhvX+6WGsKfQbSY9i
         HSbuZWv6mkC/Gug4dk2kFtXNg3XVy8AR6hhG8ef2sA0RnrXgXS+4th3ozWW62xU6/m/d
         tPec2UrW/pMor7E+9/+ACiQ4eTsRPY8la92ghZsI2UTg4p8Tw05uMENt8TOWA6lmnYDO
         T8QETfb3VvI+Sdpe3B1ju1LbG/2XFZ0cCif3Gh4JoMQt98iG+lrgybRmI2DFgnp0RN4F
         kzSA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5w4uM1f8y1TF9d1VnMVrR4ef6QwD2B32MvzT/tRUmwct2WuJtQmeLphwFo2tGmuh/UUIoaxhfTMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnjNXMJk+D2zBr3d9r/1VT4ghgZGhQuw3LvqtB1xJiabreYIVP
	HKS3STiSzHZifNWFeCx5Z0ZEMUt2TY0U5lfG24iT97Cq+qGP/REChdsHUMNFiFbpUcpGSVx8P8v
	Qc7uaZJXJvUAmpgR0vVyXUYOmuKNid5s=
X-Gm-Gg: AR+sD12f2rBAi88Iupt9n5TLgkv7T8qupFzQ9DtLOKP2j0rW3gSjiiBEEuZBgQ0njai
	YPRzSmVA7RFj8dtcDUppW9WmNpVc58Fd8XgLVtEADMvhWcEB402xOOSdzW6JfCXwqp8B7BV57aQ
	eByBN47yXHM1uw9DgHCKf/YRMt3tBKh41ua/WWzyy7094C9ZIs8B823//MaMnH3DB3heROmm4Qa
	SR8k2WU9XSBTQ9+igdi+9ABDk9YJ5630+hUvY+HfECIsgus5g+CP2XlGs/YEZeABR+Uz6zzsRzF
	7Ks6UWtH/UQ3DVvZ7br5zSaDmckgZs/eE1lgqheZqzClXA==
X-Received: by 2002:a17:906:9fcf:b0:c20:ff26:336e with SMTP id
 a640c23a62f3a-c2108e91d4emr409349866b.14.1786638265066; Thu, 13 Aug 2026
 09:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812182327.53694-1-chenmiao.ku@gmail.com> <20260812182327.53694-7-chenmiao.ku@gmail.com>
 <an3m2mN3Wq-OSGKv@wyuan.org>
In-Reply-To: <an3m2mN3Wq-OSGKv@wyuan.org>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Fri, 14 Aug 2026 00:23:46 +0800
X-Gm-Features: AUfX_mzraF2YxIKSfNGVEcduJXsP6DZwOoh_7L360eh-sR0LLgsmLqu0cObvGoQ
Message-ID: <CAKxVwgcgS-ynf8Dsex_XA8Px85e8-cmMuMXABorQ_qWHmm+xRA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

V2VpamllIFl1YW4gPHd5QHd5dWFuLm9yZz4g5LqOMjAyNuW5tDjmnIgxM+aXpeWRqOWbmyAyMzo0
NuWGmemBk++8mg0KPg0KPiBPbiBUaHUsIEF1ZyAxMywgMjAyNiBhdCAwMjoyMzoyM0FNICswODAw
LCBDaGVuIE1pYW8gd3JvdGU6DQo+ID4gVGhlIEFQRlMgdm9sdW1lIHVzZWQgYnkgbWFjT1MgaXMg
Y2FzZS1pbnNlbnNpdGl2ZSBieSBkZWZhdWx0LCB3aGlsZSB0aGUNCj4gPiBrZXJuZWwgdHJlZSBj
b250YWlucyBmaWxlIG5hbWVzIHRoYXQgZGlmZmVyIG9ubHkgaW4gY2FzZS4gRG9jdW1lbnQgdGhl
DQo+ID4gZGlza3V0aWwgY29tbWFuZHMgbmVlZGVkIHRvIGlkZW50aWZ5IHRoZSBBUEZTIGNvbnRh
aW5lciBhbmQgYWRkIGENCj4gPiBjYXNlLXNlbnNpdGl2ZSB2b2x1bWUgYmVmb3JlIGNsb25pbmcg
dGhlIHRyZWUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIE1pYW8gPGNoZW5taWFvLmt1
QGdtYWlsLmNvbT4NCj4NCj4gQWNrZWQtYnk6IFdlaWppZSBZdWFuIDx3eUB3eXVhbi5vcmc+DQo+
DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2hvdy10by5y
c3QgfCA4ICsrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ct
dG8ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaG93LXRvLnJzdA0KPiA+
IGluZGV4IDllYzIzODRlMS4uZTFkM2QyYjhiIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2hvdy10by5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8ucnN0DQo+ID4gQEAgLTEwMiw2ICsxMDIsMTQgQEAg
TGludXgg5Y+R6KGM54mI5ZKM566A5Y2V5Zyw5L2/55SoIExpbnV4IOWRveS7pOihjO+8jOmCo+S5
iOWPr+S7pei/hemAn+W8gOWni+S6hg0KPiA+ICDlvIDlpLTnmoTlkb3ku6TjgIIqKuivt+azqOaE
jyoq77yM5pyA5paw54mI5pysIFNwaGlueCDnmoTmlofmoaPnvJbor5HpgJ/luqbmnInmnoHlpKfm
j5DljYfvvIzlvLrng4jlu7rorq4NCj4gPiAg5oKo6YCa6L+HIHBpcC9weXBpIOWuieijheacgOaW
sOeJiOacrCBTcGhpbnjjgIINCj4gPg0KPiA+ICttYWNPUyDpu5jorqTkvb/nlKjkuI3ljLrliIbm
lofku7blkI3lpKflsI/lhpnnmoQgQVBGUyDljbfvvIzogIzlhoXmoLjmupDnoIHmoJHkuK3lrZjl
nKjku4XlpKflsI/lhpkNCj4gPiAr5LiN5ZCM55qE5paH5Lu244CC5Zyo5omn6KGMIGBgZ2l0IGNs
b25lYGAg5YmN77yM5Y+v5Zyo546w5pyJIEFQRlMg5a655Zmo5Lit5Yib5bu65LiA5Liq6aKd5aSW
55qE5aSn5bCP5YaZDQo+ID4gK+aVj+aEn+WNt++8iOWFiOeUqCBgYGRpc2t1dGlsIGFwZnMgbGlz
dGBgIOaJvuWIsOWuueWZqOagh+ivhuespu+8jOW5tuWwhuS4i+mdoueahCBgYGRpc2tYYGAg5pu/
5o2i5Li66K+l5qCH6K+G56ym77yJOjoNCj4gPiArDQo+ID4gKyAgICAgZGlza3V0aWwgYXBmcyBh
ZGRWb2x1bWUgZGlza1ggQVBGU1ggTGludXgNCj4gPiArDQo+ID4gK+eEtuWQjuWwhuWGheaguOa6
kOeggeWFi+mahuWIsOaWsOWNt+S4reOAgg0KPiA+ICsNCj4gPiAg5aaC5p6c5oKo5aSE5LqO5LiA
5Liq5aSa55So5oi3546v5aKD5Lit77yM5Li65LqG6YG/5YWN5a+55YW25LuW5Lq66YCg5oiQ5b2x
5ZON77yM5bu66K6u5oKo6YWN572u5Y2V55So5oi3DQo+ID4gIHNwaGlueCDomZrmi5/njq/looPv
vIzljbPlj6rpnIDopoHmiafooYw6Og0KPg0KPiBOaXQ6IEluIHRoZSBzdWJzZXF1ZW50IGNvbnRl
bnQgb2YgdGhpcyBhcnRpY2xlLCBhbGwgY29tbWFuZHMgdXNlICJtYWtlIiwNCj4gbm90ICJnbWFr
ZSIuIFNvLCBpcyBpdCBuZWNlc3NhcnkgdG8gbWVudGlvbiB0aGUgY29udGVudCBvZiB0aGUgcGF0
Y2gNCj4gWzUvNl0gaGVyZT8gKFVzZSBnbWFrZSBmcm9tIEhvbWVicmV3IGluc3RlYWQgb2YgbWFr
ZSBmcm9tIEFwcGxlKSwgbGlrZSBhDQo+IGNyb3NzLXJlZmVyZW5jZSwgdG8gbGVhZCB0aGUgbWFj
T1MgdXNlcnMgdG8gZ2V0IG1vcmUgZGV0YWlsZWQgaW5mby4NCj4NCj4gQnV0IEknbSBmaW5lIHdp
dGggY3VycnVudCB3b3JkaW5ncy4gQmVjYXVzZSBpZiB5b3UgdHJ5IHRvIHVzZSAnbWFrZScsDQo+
IHlvdSdsbCBnZXQNCj4NCj4gICBNYWtlZmlsZToxNTogKioqIEdOVSBNYWtlID49IDQuMCBpcyBy
ZXF1aXJlZC4gWW91ciBNYWtlIHZlcnNpb24gaXMgMy44MS4gIFN0b3AuDQo+DQo+IHRoZW4sIHlv
dSBzaG91bGQgcmVhbGl6ZSB0aGF0IEhvbWVicmV3IGhhZCB0b2xkIHlvdSB0aGF0IHlvdSBzaG91
bGQgcnVuDQo+ICdnbWFrZScgaW5zdGVhZCBvZiAnbWFrZScuDQo+DQo+IFRoYW5rcy4NCj4NCkkg
ZG9uJ3QgdGhpbmsgYW4gYWRkaXRpb25hbCBjcm9zcy1yZWZlcmVuY2UgaXMgbmVjZXNzYXJ5IGhl
cmUuIElmIHVzZXJzDQpydW4gaW50byBBcHBsZSdzIG9sZGVyIGBtYWtlYCwgdGhlIGVycm9yIG1l
c3NhZ2UgY2xlYXJseSBzdGF0ZXMgdGhhdCBHTlUNCk1ha2UgPj0gNC4wIGlzIHJlcXVpcmVkLiBJ
biBhZGRpdGlvbiwgSG9tZWJyZXcncyBgbWFrZWAgZm9ybXVsYSBhbHJlYWR5DQpleHBsYWlucyB0
aGF0IEdOVSBNYWtlIGlzIGluc3RhbGxlZCBhcyBgZ21ha2VgOg0KDQogICAgJCBicmV3IGluc3Rh
bGwgbWFrZQ0KICAgID09PiBXb3VsZCByZWluc3RhbGwgMSBmb3JtdWxhOg0KICAgIG1ha2UNCiAg
ICAuLi4NCiAgICBHTlUgIm1ha2UiIGhhcyBiZWVuIGluc3RhbGxlZCBhcyAiZ21ha2UiLg0KDQpV
c2VycyBjYW4gdGhlbiByZXRyeSB0aGUgY29tbWFuZCB3aXRoIGBnbWFrZWAsIHNvIEkgdGhpbmsg
dGhlIGN1cnJlbnQNCndvcmRpbmcgaXMgc3VmZmljaWVudC4NCg0KVGhhbmtzLA0KQ2hlbiBNaWFv
DQo=
