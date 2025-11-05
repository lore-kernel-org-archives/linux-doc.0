Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA02C08B0
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 06:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762324075; cv=none; b=a16a+NsdDtQHtwk1taF96+S8zsFZpzxrKwVHtw0z7HEnzD7aohggYLLgta08zMVWAeEEeIzu+nf6cdbTcsdKD1ga8QlvhKFtmLqDZQAd/GL/uZ4qsDoQd7Dk6X+FacpyRtVcQAu9cyWs+swjel5Q8VFGaGXM9XmFMhblFJtqAG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762324075; c=relaxed/simple;
	bh=jeCq7yHtC5OS5YD2iwjMdqIfwkyzElnJ5GcSaasUr+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F1GYu8AlXIdgyRiuXLdZmu6/V9Wftyhs3r2A1CFww2ZFNOoD2RBCL6/7+GLAqTFSeD88KImU3dcKFRVAmAewTy4rohCCe/nxnO5py2A9yRA3zwaKPavoM9hAoAJWv1PytnGhoQA9RNLdBa+kw8Ser3dvw2J68g8mQ/OkD+5s1qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAmB8hzh; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAmB8hzh"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-633c1b740c5so6007997d50.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 22:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762324070; x=1762928870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeCq7yHtC5OS5YD2iwjMdqIfwkyzElnJ5GcSaasUr+I=;
        b=bAmB8hzheh1D6x4sT7J/wcYSXLztSuWMiWxtsNC1XaO9aI23QWAl/D0usL5rNRJIDn
         pWVyRatTIWjACN9YcDYcuedkFtFwsOoPSH6u1BLBR5D2MZFyW8m5e6wXUJeaoGsKiyvb
         Dw5DpMvrhg2BaOC6+6iVa6IKty+HqdcpJq0FESz6hDADickMFfIlEJCOHW3FuE/1Y34z
         z038RV6NDEtTHOOhNAJi0vi6OAlTxIr7ui52USEuY5iWJoxDTeIAViQfMOl446pR5P1A
         wERLjaA+rq2HLzRBDo0LTzyo7qx4F85eQ8baa+lzH1DaziR60F3tT/ZUMBssjXVZ7zy5
         nsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762324070; x=1762928870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeCq7yHtC5OS5YD2iwjMdqIfwkyzElnJ5GcSaasUr+I=;
        b=SaOBVWd9Y327kqz+GcIdti/+Bc+f2j5mhkjSLROqx8HKQmegL3OjioxjM74dkKawPC
         aHL/y21qwzlMioFk+q6iXSHqy91Zbv1Z1neyTxiDY1bDcNi2Gn2y5980PeFo+b8P6saP
         BXjZkrW6KKmXt883O8QYoaTsmP0GnNdyaXrpudekKEgZ7uaNyNBH205L7wXX703yLXti
         FNJ8y/Icts2RqelJ87QmWi1B+9C87AAx0pLQ0lDm3/d7eXnNVDBy2HGmdy8Q2uA9PCqk
         RRETLJUQzGJvgBxg8k+64UJupt6deK7yOHNlIaUkGl5hXHacqQi/sT27QX/+/DZuLVWy
         xGLA==
X-Forwarded-Encrypted: i=1; AJvYcCU1HyJLyF1iHokjNLyIhR2flhi2bT28WGrzoWw6QeXLVLUvZy3ZUAqdAoYD+M1A/OpK6TeejwSDp9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3XqV7eqopEME43VcOV21uHZalduTpLzf7C6+837jNiCwfaJu
	OxcZHs6CKVsm+6WRgeeOdsr50sDNKUv1hP39Nr88eke3syadaokrBy3/OiAIvUqxwBkNAJV3rZa
	CIy7uuB76nawCxzLAsaP5F+blqpGJA4Q=
X-Gm-Gg: ASbGncuF9gTOUTfl1wKyjES1/x0IQdDHfR8AkT9tWG2MVe/uF0EMC9KI0vYgJJS9GKY
	z08LOCjX7HpnX/7H9BdsjEkMAWuc+hVp9mFcyOHlIS3KabwOJbDySp5NmHkWZAasJ7fjWRrQzeB
	/qCcTiMDtLXqNB+mZmA/dpy+QRnxQXoKn3r6USB/hJCqloGOkUjCuScj2HVnYEvldo7udscR/zS
	OdIosYp7ktZoqEC5YuXPwZ8vGEqadpZtUsCP2NEgLCdAFqh2Pp/HjoETLQ=
X-Google-Smtp-Source: AGHT+IFdiDnyeB/b2R/ETcLVPyA6OCjT4xirxHagJ+oS+nhEajJyKbfrExaD7O6D4NVTjiCeW84j4bp2Z6m2e/DTXUc=
X-Received: by 2002:a05:690e:159c:20b0:63f:b0ca:dc9e with SMTP id
 956f58d0204a3-63fd34bb82amr1456004d50.10.1762324070502; Tue, 04 Nov 2025
 22:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105024016.104413-1-zhaochenguang@kylinos.cn>
In-Reply-To: <20251105024016.104413-1-zhaochenguang@kylinos.cn>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 5 Nov 2025 14:27:23 +0800
X-Gm-Features: AWmQ_bneg4qAV5dCrFxkdyh-1rRJWVF-MjuTsznf6NxfRswv34cIIYqMoTC59Gk
Message-ID: <CAD-N9QVgK24ZRz__BEUG3+yPwYqz+-rLoci0frwvjHafR3HVVA@mail.gmail.com>
Subject: Re: [PATCH linux-next] docs/zh_CN: Sync the translation of changes in kbuild.rst
To: Chenguang Zhao <zhaochenguang@kylinos.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBOb3YgNSwgMjAyNSBhdCAxMDo0MOKAr0FNIENoZW5ndWFuZyBaaGFvIDx6aGFvY2hl
bmd1YW5nQGt5bGlub3MuY24+IHdyb3RlOg0KPg0KPiBTeW5jIHRoZSB0cmFuc2xhdGlvbiBvZiBj
aGFuZ2VzIGluIGtidWlsZC9rYnVpbGQucnN0IGFib3V0DQo+IEtCVUlMRF9CVUlMRF9USU1FU1RB
TVAuDQoNClBsZWFzZSBmb2xsb3cgaG93LXRvLnJzdFsxXSB0byByZXZpc2UgeW91ciBjb21taXQg
bWVzc2FnZSBhcyBmb2xsb3dzOg0KDQror7flj4LogIPku6XkuIvkv6Hmga/ov5vooYzovpPlhaU6
Og0KDQpkb2NzL3poX0NOOiBBZGQgc2VsZi1wcm90ZWN0aW9uIGluZGV4IENoaW5lc2UgdHJhbnNs
YXRpb24NCg0KVHJhbnNsYXRlIC4uLi9zZWN1cml0eS9zZWxmLXByb3RlY3Rpb24ucnN0IGludG8g
Q2hpbmVzZS4NCg0KVXBkYXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCBiMDgwZTUy
MTEwZWENCigiZG9jczogdXBkYXRlIHNlbGYtcHJvdGVjdGlvbiBfX3JvX2FmdGVyX2luaXQgc3Rh
dHVzIikNCiMg6K+35omn6KGMIGdpdCBsb2cgLS1vbmVsaW5lIDzmgqjnv7vor5HnmoToi7Hmlofm
lofmoaPot6/lvoQ+77yM5bm25pu/5o2i5LiK6L+w5YaF5a65DQoNClNpZ25lZC1vZmYtYnk6IFlh
bnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXguZGV2Pg0KIyDlpoLmnpzmgqjliY3pnaLnmoTmraXp
qqTmraPnoa7miafooYzvvIzor6XooYzkvJroh6rliqjmmL7npLrvvIzlkKbliJnor7fmo4Dmn6Ug
Z2l0Y29uZmlnIOaWh+S7tg0KDQrkv53lrZjlubbpgIDlh7rjgIINCg0KWzFdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90
cmVlL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2hvdy10by5yc3QNCj4NCj4gU2ln
bmVkLW9mZi1ieTogQ2hlbmd1YW5nIFpoYW8gPHpoYW9jaGVuZ3VhbmdAa3lsaW5vcy5jbj4NCj4g
LS0tDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9rYnVpbGQva2J1aWxkLnJz
dCB8IDkgKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04va2J1aWxkL2tidWlsZC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9rYnVpbGQva2J1aWxkLnJzdA0KPiBpbmRleCBlNWUyYWViZTFlYmMuLmJhY2YwNTgyNzJjYSAx
MDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04va2J1aWxkL2ti
dWlsZC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04va2J1aWxk
L2tidWlsZC5yc3QNCj4gQEAgLTI5MCw4ICsyOTAsMTMgQEAgSUdOT1JFX0RJUlMNCj4gIEtCVUlM
RF9CVUlMRF9USU1FU1RBTVANCj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIOWwhuivpeeO
r+Wig+WPmOmHj+iuvue9ruS4uuaXpeacn+Wtl+espuS4su+8jOWPr+S7peimhuebluWcqCBVVFNf
VkVSU0lPTiDlrprkuYnkuK3kvb/nlKjnmoTml7bpl7TmiLMNCj4gLe+8iOi/kOihjOWGheaguOaX
tueahCB1bmFtZSAtdu+8ieOAguivpeWAvOW/hemhu+aYr+S4gOS4quWPr+S7peS8oOmAkue7mSBk
YXRlIC1kIOeahOWtl+espuS4suOAgum7mOiupOWAvOaYrw0KPiAt5YaF5qC45p6E5bu65p+Q5Liq
5pe25Yi755qEIGRhdGUg5ZG95Luk6L6T5Ye644CCDQo+ICvvvIjov5DooYzlhoXmoLjml7bnmoQg
dW5hbWUgLXbvvInjgILor6XlgLzlv4XpobvmmK/kuIDkuKrlj6/ku6XkvKDpgJLnu5kgZGF0ZSAt
ZCDnmoTlrZfnrKbkuLLjgILkvovlpoI6Og0KPiArDQo+ICsgICAgICAgJCBLQlVJTERfQlVJTERf
VElNRVNUQU1QPSJNb24gT2N0IDEzIDAwOjAwOjAwIFVUQyAyMDI1IiBtYWtlDQo+ICsNCj4gK+m7
mOiupOWAvOaYr+WGheaguOaehOW7uuafkOS4quaXtuWIu+eahCBkYXRlIOWRveS7pOi+k+WHuuOA
guWmguaenOaPkOS+m+ivpeaXtuaIs++8jOWug+i/mOeUqOS6juS7u+S9lWluaXRyYW1mc+W9kuah
o+aWh+S7tg0KPiAr5Lit55qEbXRpbWXlrZfmrrXjgIJJbml0cmFtZnMgbXRpbWVz5pivMzLkvY3n
moTvvIzlm6DmraTml6nkuo5Vbml457qq5YWDMTk3MOW5tO+8jOaIluaZmuS6juWNj+iwg+S4lueV
jOaXtg0KPiArKFVUQykyMTA25bm0MuaciDfml6U25pe2MjjliIYxNeenkueahOaXpeacn+aYr+aX
oOaViOeahOOAgg0KPg0KPiAgS0JVSUxEX0JVSUxEX1VTRVIsIEtCVUlMRF9CVUlMRF9IT1NUDQo+
ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gLS0NCj4gMi4yNS4xDQo+
DQo+DQo=
