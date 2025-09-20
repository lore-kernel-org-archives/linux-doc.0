Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE519DF4A
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758354592; cv=none; b=jTAPSj6/mKoPiXxLT/pdA1Mw8yO9VVDABAs0xt2jj8FUlUy6vfOCn1AYg/jteg0bvUZoHmIPaTho4P2et6pRr5SxSAjCU1hrIc0h2Qdy+BiKxLy5CxjuPr8rVO8IgS7tJECf1mF39HMOX3077xlp8AGajtCxzuZDoxz745l54Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758354592; c=relaxed/simple;
	bh=Av7lrNl4YgFBqMyVpgO2SYk1KzNjNc1S5U5FzQ/6NHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKnjn4hhWMN0TJIXw1TLlq5503mGoCHNLtiAZiMY6c33/fOaNgnFim5SlgrddpvZrt7j97M9hVal8XPrOTJfZ21xS8THgHWvcq/7Zgu90F3bDutqBBuoFO4WsPT1xJqvE64v4VS3rNuuYYGosPhQwwYKHQnkXxL9afBewr9tktI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEvQZ4/Z; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEvQZ4/Z"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a16441so416709466b.2
        for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758354589; x=1758959389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av7lrNl4YgFBqMyVpgO2SYk1KzNjNc1S5U5FzQ/6NHE=;
        b=PEvQZ4/ZcE6+Ab5AQnCgZEQ6IdeB2gSJJGaDwO3/2G/33SSL9+vN+z+QtnuhRGxFYO
         WLGRtjK+RO2UkAxvBrK6vCEbrHafDMnsIDB73wMzkuIxJ3VBd05tEvkQ/qzfySB+F5/d
         DP9eKn/i+NilrYS65H90uYc1znYz9BIPSSF9ViVwG5rtHOh88hO8JN0FfK/PWqK9skbd
         UZ6CfvkQ57rqwhyhnItHiYeOpKgsz+Mf73l0ixJH/Tc7CmHoZ8ihGXZM24IlCu4svS+p
         ogN/QjAfR+IVQmlDsZKUMok2hEIwPpXlbtlqAXtX2xG35D+bZG0uggUpfrkm+7MjVIG0
         jS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758354589; x=1758959389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Av7lrNl4YgFBqMyVpgO2SYk1KzNjNc1S5U5FzQ/6NHE=;
        b=djBB9hBhCrpeOgNQGI9gU4khi29Lk0FT8KOfhPLNkmp0vU5OoWcIK68WmnTFi9RLQ0
         kfTSps5458w7MbxwEK70IdoieYAVo4EzTZgdhlbO5cK/ataSWZD0GQdbXmWa7iKG7UTS
         FKHKkLSI+wCM0/1mdNbwueXt3Cu0J+BM2X+E8rWUf0dYRgwY+dZjftfrXKw32uNGOoL/
         qRcdRn2dksqQR1DE5QfrEIyLKMknovr56tI+j0sF7mvJV4Umr3TMn7SgjpLBthXkwEgC
         cgrX1rNy+3NSyTzXlEzEh8aG93PzKMNA4EeKeCpZcp/AkP0phD2mj00DiccUpZaGVEmo
         LWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs0kSYRN+MbJ0WK5dXeL4vmJ4JBirw/C0LV4Vm3hW4wSJaRa2LovSJEn092Eom1cgidRN3LLIMniU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWSpDgFjQoNeMlXyzvCUGmGNRXv6PC1a9ZnCH9AWhIGdSMOzB
	zkvxU8uvDy/QDB6/dr4LM1DqwBt9HJcuBXzyV6l4+JMUWHZOwSeHGzuozZlVpEDTUlkcOLanqS6
	qScuA6Ub93FpRLrrBdNJyqZRrB93fIUjbNwm6jAM=
X-Gm-Gg: ASbGncvuIlUOMSxYrEdyCd/jdnFrO3120YhBT0nqY8beMpMwPlSjgq3+7axcZJe8c77
	ehxJyboWXfhx/xYozWb4oItAB4FJLu6b2n/Z2oWJ6qPrYnFrRs19L1HM3EihTlj6LeK/QlRqh6a
	Sa9lToUCIdCp1pvuQjmRDGrzog2WxacJ8KmTmYY2yKVD+kbnipVVa5SNVPkdsITyKfRhbWTgBC5
	bse70M=
X-Google-Smtp-Source: AGHT+IHpyjk16PmMGjgpmJ32eHdu+viAzqxrIIM8/PHA08Nc0k6yqdFGL83GkBb2++1I+Uzinp3kHqIP4ACJxvIffzU=
X-Received: by 2002:a17:906:9f8c:b0:b0c:1701:bf77 with SMTP id
 a640c23a62f3a-b24eedb990bmr668692766b.18.1758354588717; Sat, 20 Sep 2025
 00:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917073010.88607-1-zhaoshuo@cqsoftware.com.cn> <f27e3d04-ced6-459c-993f-b5495257fa3f@linux.dev>
In-Reply-To: <f27e3d04-ced6-459c-993f-b5495257fa3f@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Date: Sat, 20 Sep 2025 15:49:12 +0800
X-Gm-Features: AS18NWBB-4cecjuKls_frs--SGWiPru1Rvwx9dDopEec980Nt4tli3aTJo0pdqo
Message-ID: <CAJy-AmnJyGvoOJ3JX=wnon-uo7_ViX3bWiF8m-qMuPQfZJNdvg@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add security lsm-development Chinese translation
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net, 
	dzm91@hust.edu.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

QXBwbGllZCwgVGhhbmtzDQoNCllhbnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXguZGV2PiDkuo4y
MDI15bm0OeaciDE35pel5ZGo5LiJIDE2OjM05YaZ6YGT77yaDQo+DQo+DQo+IOWcqCA5LzE3LzI1
IDM6MzAgUE0sIFNodW8gWmhhbyDlhpnpgZM6DQo+ID4gVHJhbnNsYXRlIC4uLi9zZWN1cml0eS9s
c20tZGV2ZWxvcG1lbnQucnN0IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFVwZGF0ZSB0aGUgdHJh
bnNsYXRpb24gdGhyb3VnaCBjb21taXQgNmQyZWQ2NTMxODViDQo+ID4gKCJsc206IG1vdmUgaG9v
ayBjb21tZW50cyBkb2NzIHRvIHNlY3VyaXR5L3NlY3VyaXR5LmMiKS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNodW8gWmhhbyA8emhhb3NodW9AY3Fzb2Z0d2FyZS5jb20uY24+DQo+DQo+IFJl
dmlld2VkLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAY3Fzb2Z0d2FyZS5jb20uY24+DQo+DQo+
DQo+IFRoYW5rcywNCj4NCj4gWWFudGVuZw0KPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL3RyYW5zbGF0
aW9ucy96aF9DTi9zZWN1cml0eS9pbmRleC5yc3QgICAgIHwgIDIgKy0NCj4gPiAgIC4uLi96aF9D
Ti9zZWN1cml0eS9sc20tZGV2ZWxvcG1lbnQucnN0ICAgICAgICB8IDE5ICsrKysrKysrKysrKysr
KysrKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3NlY3VyaXR5L2xzbS1kZXZlbG9wbWVudC5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9pbmRleC5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9pbmRleC5yc3QNCj4gPiBp
bmRleCA3OGQ5ZDRiMzZkY2EuLjA1ZDI0ZTNhY2MxMSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9pbmRleC5yc3QNCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9pbmRleC5yc3QNCj4gPiBA
QCAtMTgsNiArMTgsNyBAQA0KPiA+ICAgICAgY3JlZGVudGlhbHMNCj4gPiAgICAgIHNucC10ZHgt
dGhyZWF0LW1vZGVsDQo+ID4gICAgICBsc20NCj4gPiArICAgbHNtLWRldmVsb3BtZW50DQo+ID4g
ICAgICBzYWsNCj4gPiAgICAgIHNlbGYtcHJvdGVjdGlvbg0KPiA+ICAgICAgc2lwaGFzaA0KPiA+
IEBAIC0yOCw3ICsyOSw2IEBADQo+ID4gICBUT0RPTElTVDoNCj4gPiAgICogSU1BLXRlbXBsYXRl
cw0KPiA+ICAgKiBrZXlzL2luZGV4DQo+ID4gLSogbHNtLWRldmVsb3BtZW50DQo+ID4gICAqIFND
VFANCj4gPiAgICogc2VjcmV0cy9pbmRleA0KPiA+ICAgKiBpcGUNCj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvbHNtLWRldmVsb3BtZW50
LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L2xzbS1kZXZl
bG9wbWVudC5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MDAwMC4uN2VkMzcxOWE5ZDA3DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L2xzbS1kZXZlbG9wbWVudC5yc3QNCj4g
PiBAQCAtMCwwICsxLDE5IEBADQo+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wDQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4g
PiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3NlY3VyaXR5L2xzbS1kZXZlbG9wbWVudC5yc3QN
Cj4gPiArDQo+ID4gKzrnv7vor5E6DQo+ID4gKyDotbXnoZUgU2h1byBaaGFvIDx6aGFvc2h1b0Bj
cXNvZnR3YXJlLmNvbS5jbj4NCj4gPiArDQo+ID4gKz09PT09PT09PT09PT09PT09DQo+ID4gK0xp
bnV45a6J5YWo5qih5Z2X5byA5Y+RDQo+ID4gKz09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+
ICvln7rkuo5odHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMDcxMDI2MDczNzIxLjYxOGI0Nzc4
QGxhcHRvcGQ1MDUuZmVucnVzLm9yZ++8jA0KPiA+ICvlvZPkuIDnp43mlrDnmoRMU03nmoTmhI/l
m77vvIjlroPor5Xlm77pmLLojIPku4DkuYjvvIzku6Xlj4rlnKjlk6rkupvmg4XlhrXkuIvkurrk
u6zkvJrmnJ/mnJvkvb/nlKjlroPvvInlnKgNCj4gPiArYGBEb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL0xTTS9gYCDkuK3pgILlvZPorrDlvZXkuIvmnaXlkI7vvIzlsLHkvJrooqvmjqXlj5fov5vl
haXlhoXmoLjjgIINCj4gPiAr6L+Z5L2/5b6XTFNN55qE5Luj56CB5Y+v5Lul5b6I6L275p2+55qE
5LiO5YW255uu5qCH6L+b6KGM5a+55q+U77yM5LuO6ICM6K6p5pyA57uI55So5oi35ZKM5Y+R6KGM
54mI5Y+v5Lul5pu0DQo+ID4gK+aYjuaZuuWcsOWGs+WumumCo+S6m0xTTemAguWQiOS7luS7rOea
hOmcgOaxguOAgg0KPiA+ICsNCj4gPiAr5pyJ5YWz5Y+v55So55qEIExTTSDpkqnlrZDmjqXlj6Pn
moTor6bnu4bmlofmoaPvvIzor7flj4LpmIUgYGBzZWN1cml0eS9zZWN1cml0eS5jYGAg5Y+K55u4
5YWz57uT5p6E44CCDQo=
