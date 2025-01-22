Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9B8196
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 01:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737510548; cv=none; b=QmCKJSWSqESgSDFENlbQQGJW/k2TZXOYtuvKtkZEaP3NgLDbKdoXsEk+KHGqfWXH/IYGlwgRfVo1qzIhyTNkG4eN+zWlN/JeDT9GnqGMyOFIdRPThEYoCM8cyBEuVHMyP4lDHpcvNM+k2c+ACXup0QtzNKZACvkzd62IOlDoQwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737510548; c=relaxed/simple;
	bh=F4VTqitBmUUjxtcltu9KobAPWFzINd9Re7AY4H3vYeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8EZWuUHGmz03LrFW9gbqFVqnJB9XFvm+376S4oHhiwfNRn8xKqt6zMg+cH2oL1dAj/OHB0KPJA906cNLFjS+n8SeGJfT83sTX4Dn6mQ8c6tzkWqPCoChhY8Hnc1dtEh0sd9BymukZGrU5kdZQk5sojUBkIjtlc8epKQrc8t+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjGnJVhu; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjGnJVhu"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab34a170526so934256666b.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 17:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737510544; x=1738115344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4VTqitBmUUjxtcltu9KobAPWFzINd9Re7AY4H3vYeo=;
        b=AjGnJVhuunql5/iEiKnm6zwZCXbmEf27OzxsNdzFzSsmhmsy6L1mciLwNJknuvlilM
         hPfRltbRGMJTKTPHjzruLbqZ4MwXylztH3IA5zc2ReZDM4+Lw2GSXqxiPPdQU+gBOh9t
         bxmYN93rgNaS79HD7J8XkFLnSoZcvXqcfbz+K206gDqASPBjXp6oSeP/2ul3TU8SVsv5
         vjseHFll8iY/zHoZX488fRT3Xmehbcx4C29H7++2mZFWtmKi+IsYX6qYSgiDv/5CdmT6
         bjAxoKimoD19+hAeqbD+1DY6asqhYTX/BfOTIBE8KevQl1YQaQhkvwajtygO7YVP9qVG
         eStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737510544; x=1738115344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4VTqitBmUUjxtcltu9KobAPWFzINd9Re7AY4H3vYeo=;
        b=psm5+U7EzBtFBax99h0gPKPRjQwds82npqxICtbpWyFbug7UowTccjU3ZiGpMtKNey
         taZ3P/FrXhzNUNXIhWn2ynr7GgC26l/XZg762qU4DpEoWksUy7hz7AZbNXAwp8ngmUl9
         TjrtKxDcC0Y/LrnRjfHXT1siy2go+xb3xPQmBNQqdFMtYTTZtNnq5WyrGjRVjV1QvJM6
         VthiyeJX/vclImR8OqNF6g4eBZd+73GZkzlDnubUPqPo6/frGgYz5ktFuhH0pka5GWr1
         eCZ9FUvPfVzutnMcG6bjjzBPwtBwI7iab7F8/i5ZO0QeQ8fxtGWxk0ozTVBFLxUZWgRu
         1Q/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1Qv+vJOPIA4ii+GxxKIODmOzsxlE1HejNTy7mH7PaouumY94V2geEA9R7sTniaJdtSU+/6FcetJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3cfYTPImofdwkW/xFNhzbZ4F+JYUJQb6iQf6LJOQ1ln35Qu9F
	A8EuQcFb4+rRTunzSe3osDm3AgXXWnBoHoDVlvTK+OEglWVWZcOR2HbvUl7gEUoHcIb893ZJDRq
	ub66RL9EiVyLUVUFx6t0WbrnRwsg=
X-Gm-Gg: ASbGncuHR9KoBMt+Vv+Wt+SfqqEBx9IPEjfK1RCwLyVdjRnbzeJkiXK5vNmv68vIq5p
	X/NWiu1Hv4Su9tNWXU9iiGwlLysoSbEaYRsTkFwQLW6dYCTW8lrQ=
X-Google-Smtp-Source: AGHT+IHGaksqWhr6bBdHKj+sCC/j2Ff5q33eJ9BFViHQCbIL2tvknK2extCtwPT2qHAg6atIOM2kBaQWoZ8LBnNyhkg=
X-Received: by 2002:a17:906:5002:b0:ab6:4faa:bc83 with SMTP id
 a640c23a62f3a-ab64faabcf8mr156446466b.14.1737510544054; Tue, 21 Jan 2025
 17:49:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn> <0287c7309ecb1bf0ffd40d363f43f148beea0a18.1737354981.git.zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <0287c7309ecb1bf0ffd40d363f43f148beea0a18.1737354981.git.zhaoshuo@cqsoftware.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 22 Jan 2025 09:48:27 +0800
X-Gm-Features: AbW1kvYf2-z8muvCUcYk4UAR25tMg-pPPdVt1WX-sBKpYR8tJ8ck4BS4OJ8Ap3Y
Message-ID: <CAJy-AmknZopyMndMpruBYGdeEZNLyQ6kqwneKmoVS2wU-BVLaQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] docs/zh_CN: Add tpm tpm_event_log Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

VHJhbnNsYXRpb24gbG9va3MgZ29vZCBmb3IgbWUuDQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8
YWxleHNAa2VybmVsLm9yZz4NCg0KU2h1byBaaGFvIDx6aGFvc2h1b0BjcXNvZnR3YXJlLmNvbS5j
bj4g5LqOMjAyNeW5tDHmnIgyMOaXpeWRqOS4gCAxNToyNuWGmemBk++8mg0KPg0KPiBUcmFuc2xh
dGUgLi4uL3NlY3VyaXR5L3RwbS90cG1fZXZlbnRfbG9nLnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+
IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgMmVmNWE3ZjE0ODJjDQo+ICgi
dHBtOiBEb2N1bWVudCBVRUZJIGV2ZW50IGxvZyBxdWlya3MiKQ0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBTaHVvIFpoYW8gPHpoYW9zaHVvQGNxc29mdHdhcmUuY29tLmNuPg0KPiAtLS0NCj4gIC4uLi90
cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvdHBtL2luZGV4LnJzdCB8ICAzICstDQo+ICAuLi4v
emhfQ04vc2VjdXJpdHkvdHBtL3RwbV9ldmVudF9sb2cucnN0ICAgICAgfCA0OSArKysrKysrKysr
KysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9zZWN1cml0eS90cG0vdHBtX2V2ZW50X2xvZy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L3RwbS9pbmRleC5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS90cG0vaW5kZXgucnN0DQo+
IGluZGV4IGEzY2ZiMmQxMWM4Ni4uZjMyNGJkNGRkMDkzIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS90cG0vaW5kZXgucnN0DQo+ICsrKyBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L3RwbS9pbmRleC5yc3QN
Cj4gQEAgLTEyLDggKzEyLDkgQEANCj4NCj4gIC4uIHRvY3RyZWU6Og0KPg0KPiArICAgdHBtX2V2
ZW50X2xvZw0KPiArDQo+ICBUT0RPTElTVDoNCj4gLSogICB0cG1fZXZlbnRfbG9nDQo+ICAqICAg
dHBtLXNlY3VyaXR5DQo+ICAqICAgdHBtX3Rpcw0KPiAgKiAgIHRwbV92dHBtX3Byb3h5DQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS90cG0v
dHBtX2V2ZW50X2xvZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1
cml0eS90cG0vdHBtX2V2ZW50X2xvZy5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi45YzE3MzI5MWFjM2UNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS90cG0vdHBtX2V2ZW50X2xv
Zy5yc3QNCj4gQEAgLTAsMCArMSw0OSBAQA0KPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjANCj4gKy4uIGluY2x1ZGU6OiAuLi8uLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiAr
DQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vc2VjdXJpdHkvdHBtL3RwbV9ldmVudF9sb2cu
cnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsg6LW156GVIFNodW8gWmhhbyA8emhhb3NodW9AY3Fz
b2Z0d2FyZS5jb20uY24+DQo+ICsNCj4gKz09PT09PT09PT09DQo+ICtUUE3kuovku7bml6Xlv5cN
Cj4gKz09PT09PT09PT09DQo+ICsNCj4gK+acrOaWh+aho+eugOimgeS7i+e7jeS6huS7gOS5iOaY
r1RQTeaXpeW/l++8jOS7peWPiuWug+aYr+WmguS9leS7jumihOWQr+WKqOWbuuS7tuenu+S6pOWI
sOaTjeS9nOezu+e7n+eahOOAgg0KPiArDQo+ICvku4vnu40NCj4gKz09PT0NCj4gKw0KPiAr6aKE
5ZCv5Yqo5Zu65Lu257u05oqk5LiA5Liq5LqL5Lu25pel5b+X77yM5q+P5b2T5a6D5bCG5p+Q5Lqb
5YaF5a655ZOI5biM5Yiw5Lu75L2V5LiA5LiqUENS5a+E5a2Y5Zmo5pe277yM6K+lDQo+ICvml6Xl
v5fkvJrmt7vliqDmlrDmnaHnm67jgILov5nkupvkuovku7bmjInnsbvlnovliIbnsbvvvIzlubbl
jIXlkKvlk4jluIzlkI7nmoRQQ1Llr4TlrZjlmajlgLzjgILpgJrluLjvvIzpooQNCj4gK+WQr+WK
qOWbuuS7tuS8muWTiOW4jOmCo+S6m+WNs+Wwhuenu+S6pOaJp+ihjOadg+aIluS4juWQr+WKqOi/
h+eoi+ebuOWFs+eahOe7hOS7tuOAgg0KPiArDQo+ICvlhbbkuLvopoHlupTnlKjmmK/ov5znqIvo
rqTor4HvvIzogIzlroPkuYvmiYDku6XmnInnlKjnmoTljp/lm6DlnKhbMV3kuK3nrKzkuIDpg6jl
iIblvojlpb3lnLDpmJDov7DkuobvvJoNCj4gKw0KPiAr6K6k6K+B55So5LqO5ZCR5oyR5oiY6ICF
5o+Q5L6b5pyJ5YWz5bmz5Y+w54q25oCB55qE5L+h5oGv44CC54S26ICM77yMUENS55qE5YaF5a65
6Zq+5Lul6Kej6K+777yb5Zug5q2k77yM5b2TDQo+ICtQQ1LlhoXlrrnpmYTmnInmtYvph4/ml6Xl
v5fml7bvvIzorqTor4HpgJrluLjkvJrmm7TmnInnlKjjgILlsL3nrqHmtYvph4/ml6Xlv5fmnKzo
uqvlubbkuI3lj6/kv6HvvIzkvYblroPku6wNCj4gK+WMheWQq+avlFBDUuWGheWuueabtOS4uuS4
sOWvjOeahOS/oeaBr+mbhuOAglBDUuWGheWuueeUqOS6juWvuea1i+mHj+aXpeW/l+i/m+ihjOmq
jOivgeOAgg0KPiArDQo+ICtVRUZJ5LqL5Lu25pel5b+XDQo+ICs9PT09PT09PT09PT0NCj4gKw0K
PiArVUVGSeaPkOS+m+eahOS6i+S7tuaXpeW/l+acieS4gOS6m+avlOi+g+Wlh+aAqueahOeJueaA
p+OAgg0KPiArDQo+ICvlnKjosIPnlKhFeGl0Qm9vdFNlcnZpY2VzKCnkuYvliY3vvIxMaW51eCBF
RknlvJXlr7zliqDovb3nqIvluo/kvJrlsIbkuovku7bml6Xlv5flpI3liLbliLDnlLENCj4gK+W8
leWvvOWKoOi9veeoi+W6j+iHquWumuS5ieeahOmFjee9ruihqOS4reOAguS4jeW5uOeahOaYr++8
jOmAmui/h0V4aXRCb290U2VydmljZXMoKeeUn+aIkOeahOS6i+S7tg0KPiAr5bm25LiN5Lya5Ye6
546w5Zyo6L+Z5Liq6KGo6YeM44CCDQo+ICsNCj4gK+WbuuS7tuaPkOS+m+S6huS4gOS4quaJgOiw
k+eahOacgOe7iOS6i+S7tumFjee9ruihqOaOkuW6j+adpeino+WGs+i/meS4qumXrumimOOAguS6
i+S7tuS8muWcqOesrOS4gOasoeiwg+eUqA0KPiArRUZJX1RDRzJfUFJPVE9DT0wuR2V0RXZlbnRM
b2coKeWQjuiiq+mVnOWDj+WIsOi/meS4quihqOS4reOAgg0KPiArDQo+ICvov5nlvJXlh7rkuobl
j6bkuIDkuKrpl67popjvvJrml6Dms5Xkv53or4HlroPkuI3kvJrlnKggTGludXggRUZJIHN0dWIg
5byA5aeL6L+Q6KGM5LmL5YmN6KKr6LCD55So44CCDQo+ICvlm6DmraTvvIzlnKggc3R1YiDov5Do
oYzml7bvvIzlroPpnIDopoHorqHnrpflubblsIbmnIDnu4jkuovku7booajnmoTlpKflsI/kv53l
rZjliLDoh6rlrprkuYnphY3nva7ooajkuK3vvIwNCj4gK+S7peS+v1RQTempseWKqOeoi+W6j+WP
r+S7peWcqOeojeWQjui/nuaOpeadpeiHquiHquWumuS5iemFjee9ruihqOWSjOacgOe7iOS6i+S7
tuihqOeahOS4pOS4quS6i+S7tuaXpeW/l+aXtg0KPiAr6Lez6L+H6L+Z5Lqb5LqL5Lu244CCDQo+
ICsNCj4gK+WPguiAg+aWh+eMrg0KPiArPT09PT09PT0NCj4gKw0KPiArLSBbMV0gaHR0cHM6Ly90
cnVzdGVkY29tcHV0aW5nZ3JvdXAub3JnL3Jlc291cmNlL3BjLWNsaWVudC1zcGVjaWZpYy1wbGF0
Zm9ybS1maXJtd2FyZS1wcm9maWxlLXNwZWNpZmljYXRpb24vDQo+ICstIFsyXSBUaGUgZmluYWwg
Y29uY2F0ZW5hdGlvbiBpcyBkb25lIGluIGRyaXZlcnMvY2hhci90cG0vZXZlbnRsb2cvZWZpLmMN
Cj4gLS0NCj4gMi40Ny4xDQo+DQo=
