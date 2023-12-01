Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OiJx9M48"
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A1C10F3
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 23:42:15 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6cd97c135e8so1675248b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 23:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701416535; x=1702021335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9uPI+QZWfeMU4uRtLgGEbAyWXQbBApgT0zlFAgo1nk=;
        b=OiJx9M48pa19bI55zg7jCBITtHMrUkIOjT0QgWa4cBfc3GiKf5Vc1yuEm4np4Dc3qJ
         qGBPjsc0QbF6c5LF7T/PZxHNNITe95M3GI2zKRXl1EEQLAP2WYolHN/vfFEzHVFuZczh
         f1axIA5p7GSMtRHS395Q9OZPAPyTLVVyfS0vLwyWr47TSAAl/pJEacaKCK5UEslEQ4a6
         RZyvzUxaPWN+t/V7jxmUdqIIwINlKlGu+uu3oTQVP9sS6hT4ZR3xpoqb9zi0kj/UgaqQ
         snduEAoIOM6P43HGilaIdRgyB4JuVTZwDGoAr4tQxikNucUjiPM65Rc6sm32nUECofZK
         oqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416535; x=1702021335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9uPI+QZWfeMU4uRtLgGEbAyWXQbBApgT0zlFAgo1nk=;
        b=roN7QL5JCAZEph3BExviZBVU+YY+RsfoRREVBd9I99ETGkcGHbKIaiPdNyS8WXyvnB
         VaYlZZxikfobUw/DEEt958qr10+8bLgtz3u6/X8xzHsItNL+0EBbtJ77Hz2wTee/Njtj
         KKGv8cnJSQr0J2u0opd4bYxSgoEkX1r47xmr23VjlOE1QAC6a/RD+tsS1S68Fgh99BIK
         QuOHSk7l6iG95DaM2hFichyuO5vd9GMp/U1RpuR727wR4F6JYqAV+JE2f8iucoVQR9yr
         j9jj5ov/kgGSF5MupBdOiM4Kh5XeCxnl8x9bzu3vszk9X658Evbv/T+3qQpaIZfS2QVR
         bWug==
X-Gm-Message-State: AOJu0YzOZiNDYttSocAk6KDb9gB3wSdKet2JNKWnE/tqoD1cujKawQBI
	5GSQ8EqLIHaIYUWlFohQf3fS95d37rw9HMmrda5e7g==
X-Google-Smtp-Source: AGHT+IFty7g1odeJMIkF39bifHgiq/sf98dueqHWrKXtGrzvcl/NwYMn5nqba1A6IUxONXleSYsSH2rGjG2qsgKSCaY=
X-Received: by 2002:a05:6a21:32a1:b0:18b:4fa:a877 with SMTP id
 yt33-20020a056a2132a100b0018b04faa877mr20414901pzb.14.1701416535303; Thu, 30
 Nov 2023 23:42:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127143238.1216582-1-vincent.guittot@linaro.org>
 <20231127143238.1216582-2-vincent.guittot@linaro.org> <8009d5c4-4012-44a2-883c-0d7f74c4a2c1@arm.com>
 <CACuPKxm8GJ6L5wYqejHttz1E26wg751ZDWi7ry+KVBe+fEDVeg@mail.gmail.com>
In-Reply-To: <CACuPKxm8GJ6L5wYqejHttz1E26wg751ZDWi7ry+KVBe+fEDVeg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 1 Dec 2023 08:42:04 +0100
Message-ID: <CAKfTPtAQW0v0o7ojiZ4EyAZQQN5QiB6syRk0+Z8zvrzAPyRXgQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
To: Tang Yizhou <yizhou.tang@shopee.com>
Cc: Hongyan Xia <hongyan.xia2@arm.com>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	corbet@lwn.net, alexs@kernel.org, siyanteng@loongson.cn, qyousef@layalina.io, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, lukasz.luba@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAxIERlYyAyMDIzIGF0IDAzOjE2LCBUYW5nIFlpemhvdSA8eWl6aG91LnRhbmdAc2hv
cGVlLmNvbT4gd3JvdGU6DQo+DQo+IE9uIEZyaSwgRGVjIDEsIDIwMjMgYXQgNDozMOKAr0FNIEhv
bmd5YW4gWGlhIDxob25neWFuLnhpYTJAYXJtLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIZXJlIGl0
IGlzIGluIGNhc2UgeW91IGhhdmUgdG8gcHJvdmlkZSB0aGUgdHJhbnNsYXRpb246DQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVy
L3NjaGVkdXRpbC5yc3QNCj4gPiBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Nj
aGVkdWxlci9zY2hlZHV0aWwucnN0DQo+ID4gaW5kZXggZDFlYTY4MDA3NTIwLi43YzhkODdmMjFj
NDIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2No
ZWR1bGVyL3NjaGVkdXRpbC5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9zY2hlZHVsZXIvc2NoZWR1dGlsLnJzdA0KPiA+IEBAIC04OSwxNiArODksMTUgQEAN
Cj4gPiByX2Nwdeiiq+WumuS5ieS4uuW9k+WJjUNQVeeahOacgOmrmOaAp+iDveawtOW5s+S4juez
u+e7n+S4reS7u+S9leWFtuWug0NQVeeahOacgA0KPiA+ICAgIC0gRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdDoiMS4NCj4gPiBDUFUg
Q2FwYWNpdHkgKyAyLiBUYXNrIHV0aWxpemF0aW9uIg0KPiA+DQo+ID4NCj4gPiAtVVRJTF9FU1Qg
LyBVVElMX0VTVF9GQVNUVVANCj4gPiAtPT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiAr
VVRJTF9FU1QNCj4gPiArPT09PT09PT0NCj4gPg0KPiA+DQo+ID4g55Sx5LqO5ZGo5pyf5oCn5Lu7
5Yqh55qE5bmz5Z2H5pWw5Zyo552h55yg5pe25Lya6KGw5YeP77yM6ICM5Zyo6L+Q6KGM5pe25YW2
6aKE5pyf5Yip55So546H5Lya5ZKM552h55yg5YmN55u45ZCM77yMDQo+ID4gICDlm6DmraTlroPk
u6zlnKjlho3mrKHov5DooYzlkI7kvJrpnaLkuLTvvIhEVkZT77yJ55qE5LiK5rao44CCDQo+ID4N
Cj4gPiAgIOS4uuS6hue8k+ino+i/meS4qumXrumimO+8jO+8iOS4gOS4qum7mOiupOS9v+iDveea
hOe8luivkemAiemhue+8iVVUSUxfRVNU6amx5Yqo5LiA5Liq5peg6ZmQ6ISJ5Yay5ZON5bqUDQo+
ID4gICDvvIhJbmZpbml0ZSBJbXB1bHNlIFJlc3BvbnNl77yMSUlS77yJ55qERVdNQe+8jOKAnOi/
kOihjOKAneWAvOWcqOWHuumYn+aXtuaYr+acgOmrmOeahOOAgg0KPiA+IC3lj6bkuIDkuKrpu5jo
rqTkvb/og73nmoTnvJbor5HpgInpoblVVElMX0VTVF9GQVNUVVDkv67mlLnkuoZJSVLmu6Tms6Ll
majvvIzkvb/lhbblhYHorrjnq4vljbPlop7liqDvvIwNCj4gPiAt5LuF5Zyo5Yip55So546H5LiL
6ZmN5pe26KGw5YeP44CCDQo+ID4gK1VUSUxfRVNU5ruk5rOi5L2/5YW25Zyo6YGH5Yiw5pu06auY
5YC85pe256uL5Yi75aKe5Yqg77yM6ICM6YGH5Yiw5L2O5YC85pe25Lya57yT5oWi6KGw5YeP44CC
DQo+ID4NCj4NCj4gSGkgSG9uZ3lhbiwNCj4NCj4gVGhhbmtzIGZvciB5b3VyIENoaW5lc2UgZG9j
dW1lbnRhdGlvbiB0cmFuc2xhdGlvbiENCj4NCj4gRm9yIHRoZSB0cmFuc2xhdGlvbjoNCj4gUmV2
aWV3ZWQtYnk6IFRhbmcgWWl6aG91IDx5aXpob3UudGFuZ0BzaG9wZWUuY29tPg0KDQpUaGFua3MN
Cg0KPg0KPiBUaGFua3MsDQo+IFlpemhvdQ0K
