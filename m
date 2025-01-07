Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F77DA93
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 03:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736219122; cv=none; b=ajBqXlTxKDbv2SZOCwwH9epJlFiIG2sXb3A0Q1lx7jEscT8SL6lWVPC6gSTpO4wdHcdNxeQDcvB9LV7ebY/GxcsGIu5QAltT0wDL/UaiZ5LDsDc+dugKn44gvvRRIWIXbPsPqhWGAaqJVXkyYSsZjDGk13t1dqvnjo/Ct3AiqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736219122; c=relaxed/simple;
	bh=ue/zAhiUvsUnMljrYy/dkmkHQV9SN9cTCL0F9vZUnz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fy0gPqgThEEXkyzCjmcSbdxvYJ1zPoC7QS6aRjRK73ZDU9Ev27AUf3ou/YIM8OI2U1n+mQmxyLLB0v9xNU5AF/AKemRWDYYvaBfQiBQH4EjZvelr88SRGfxSqR4i/hXCxG13BQMzMtZwF31CKmkENze3ZEzW57oKwntGMugcVxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAyhHH3M; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAyhHH3M"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaec61d0f65so2541989966b.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 19:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736219117; x=1736823917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue/zAhiUvsUnMljrYy/dkmkHQV9SN9cTCL0F9vZUnz0=;
        b=lAyhHH3MWCaYtkfA8A9W/ZLgMHs1/2v0J9vd/cnZQjOHFyPZH+tpE/XhPq5ftXsnyF
         d6uVYLAAzJrP4+o8VJ//mE4qBsllBppJo4Lz3C9S5hdj4OUY55vIaFh+Uz8YFyeHNZ+r
         /SiyqejLmmqPwHzrsy1YHnQH5R1OhhuFEre4kO7QFAN5JHXIJy7TlytJf+B0bnpCxWiQ
         6PNw2g56l7I0FLZx6ykrmnD4mW9Cv6nebbNyjbqnVMhcWJqlgl4YKQlD6+rnomYNnb5Y
         Dvu3IDpOYsON6CdgT/xFPbAcWGRNcmeUCx8fglfEi4wIt/zgk3qk54PBlxS13siuvcFi
         cBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736219117; x=1736823917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ue/zAhiUvsUnMljrYy/dkmkHQV9SN9cTCL0F9vZUnz0=;
        b=Gq0udvy1QPf9FCUvNiuYE36tP+rq4dmF0O9MqM7wbeDAg0nKWVEzega5SRNBGf8scm
         N8haxG59OWKaIb5gYmHLXj8Td6FVpVTBrjjJkNZPMpZoWZQKrXrPSP1+TFnyY4Nr977S
         hmPK6b1sCgn/80IQEb/Aig94mJzZ9dMRmiiKPQ55oBU7Bs2LJ8SkHMuWJw8LtB9k8uIM
         S+pygzRM6hBAT9R8eBD2vXdbtdbIVZrckyz33lWLevNlFpkgUv2PAp7jVjtPNo0ueAwA
         OrqiiZ20yKp/OlccGBzRNJkvQW2zxQYYxtJHrWEKOhOA9nxoN8yjpQWhTgX49HLV5e/p
         ahvA==
X-Forwarded-Encrypted: i=1; AJvYcCUkRQFppB69uz+kXf+i+7+y8IOiH7Fw8ZJ+iXFPckeUJCnudsIt6HDPkdxsStedTqX12AkcUsgjlqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+KWxG0ytQgagXTfgvJ2c5tyR1Um1BRKgF3tKslzSgdQ5N6UA
	lvRl5b7t3tEDFL285mxOj7i8wX1t1eZtlcfxlUXfN3QuKh6mG1UyKECwPpPb3Wns9q8J0A2ERXU
	a/17ZdBgpjswDcr6G+cmzi5o/sRo=
X-Gm-Gg: ASbGncuARijyrScfFbeH0cVJJxVddnTqc9h3zhQ/Hqy+2VN0WqHkaFh5V4aYWmhKQz4
	Tz0Sl5Zx4zO0KL+dfk6C9uEsgmDQIAHXknc1yQw==
X-Google-Smtp-Source: AGHT+IGx6EMI8ER+FS5cnfUDtsUaYOsddlPKZqAnwDTi28RW5j62rUqAjLYUsO1sO673E1tXHiW6z8AyAuBl4TiMGGo=
X-Received: by 2002:a17:907:9689:b0:aae:ee49:e000 with SMTP id
 a640c23a62f3a-aaeee49e11dmr3943628566b.18.1736219117221; Mon, 06 Jan 2025
 19:05:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102072404.3196-1-zhangwei@cqsoftware.com.cn>
In-Reply-To: <20250102072404.3196-1-zhangwei@cqsoftware.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 7 Jan 2025 11:04:40 +0800
Message-ID: <CAJy-AmmoZopDfMuY_NOZLYFUHh6APav4C3eCCyBAO+_yGZ4tnQ@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add sak index Chinese translation
To: zhangwei <zhangwei@cqsoftware.com.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

TEdGTS4NClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCg0Kemhhbmd3
ZWkgPHpoYW5nd2VpQGNxc29mdHdhcmUuY29tLmNuPiDkuo4yMDI15bm0MeaciDLml6Xlkajlm5sg
MjI6MTTlhpnpgZPvvJoNCj4NCj4gVHJhbnNsYXRlIGx3bi9Eb2N1bWVudGF0aW9uL3NlY3VyaXR5
L3Nhay5yc3QgaW50byBDaGluZXNlDQo+DQo+IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3Vn
aCBjb21taXQgYTM4MjgwNzRiMDQNCj4NCj4gU2lnbmVkLW9mZi1ieTogemhhbmd3ZWkgPHpoYW5n
d2VpQGNxc29mdHdhcmUuY29tLmNuPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04v
c2VjdXJpdHkvaW5kZXgucnN0ICAgICB8ICAyICstDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NO
L3NlY3VyaXR5L3Nhay5yc3QgICAgICAgfCA4NiArKysrKysrKysrKysrKysrKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9zYWsu
cnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9z
ZWN1cml0eS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1
cml0eS9pbmRleC5yc3QNCj4gaW5kZXggYmY0MjkzMGM2ZmFjLi4yZTgxZjMzODg5ZTUgMTAwNjQ0
DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L2luZGV4
LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9p
bmRleC5yc3QNCj4gQEAgLTE3LDYgKzE3LDcgQEANCj4NCj4gICAgIElNQS10ZW1wbGF0ZXMNCj4g
ICAgIGxzbQ0KPiArICAgc2FrDQo+ICAgICBzaXBoYXNoDQo+ICAgICBkaWdzaWcNCj4gICAgIGxh
bmRsb2NrDQo+IEBAIC0yNiw3ICsyNyw2IEBAIFRPRE9MSVNUOg0KPiAgKiBzbnAtdGR4LXRocmVh
dC1tb2RlbA0KPiAgKiBrZXlzL2luZGV4DQo+ICAqIGxzbS1kZXZlbG9wbWVudA0KPiAtKiBzYWsN
Cj4gICogU0NUUA0KPiAgKiBzZWxmLXByb3RlY3Rpb24NCj4gICogdHBtL2luZGV4DQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9zYWsucnN0
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvc2FrLnJzdA0KPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU3NGZlMDc2MjAxYg0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3NlY3VyaXR5L3Nhay5yc3QNCj4gQEAgLTAsMCArMSw4NiBAQA0KPiArLi4gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NO
LnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vc2VjdXJpdHkvc2FrLnJzdA0K
PiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5byg5beNIHpoYW5nd2VpIDx6aGFuZ3dlaUBjcXNv
ZnR3YXJlLmNvbS5jbj4NCj4gKw0KPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICtM
aW51eCDlronlhajms6jmhI/plK7vvIhTQUvvvInlpITnkIYNCj4gKz09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KPiArDQo+ICs65pel5pyfOiAyMDAx5bm0M+aciDE45pelDQo+ICs65L2c6ICF
OiBBbmRyZXcgTW9ydG9uDQo+ICsNCj4gK+aTjeS9nOezu+e7n+eahOWuieWFqOazqOaEj+mUruaY
r+S4gOenjeWuieWFqOW3peWFt++8jOeUqOS6jumYsuatouezu+e7n+S4iuWtmOWcqOeJuea0m+S8
ig0KPiAr5pyo6ams5a+G56CB5o2V6I6356iL5bqP44CC5a6D5o+Q5L6b5LqG5LiA56eN5peg5rOV
6KeE6YG/55qE5pa55byP77yM55So5LqO57uI5q2i5omA5pyJ5Y+vDQo+ICvog73kvKroo4XmiJDn
mbvlvZXlupTnlKjnqIvluo/nmoTnqIvluo/jgILnlKjmiLfpnIDopoHlnKjnmbvlvZXns7vnu5/k
uYvliY3ovpPlhaXov5nkuKrlrokNCj4gK+WFqOmUruOAgg0KPiArDQo+ICvku47plK7nm5jovpPl
haXnmoTmlrnlvI/nlJ/miJDlronlhajms6jmhI/plK7vvIxMaW51eOaPkOS+m+S6huS4pOenjeeb
uOS8vOS9huS4jeWQjOeahA0KPiAr5pa55byP44CC5LiA56eN5piv5oyJ5LiLQUxULVNZU1JRLUvn
u4TlkIjplK7vvIzkvYbkvaDkuI3lupTor6Xkvb/nlKjov5nnp43mlrnlvI/vvIwNCj4gK+WboOS4
uuWug+WPquacieWcqOWGheaguOWQr+eUqOS6hlNZU1JR5pSv5oyB55qE5oOF5Ya15LiL5omN6IO9
5L2/55So44CCDQo+ICsNCj4gK+ato+ehrueUn+aIkFNBS+eahOaWueW8j+aYr+S9v+eUqGBgbG9h
ZGtleXNgYOadpeWumuS5iemUruW6j+WIl+OAguaXoOiuuuWGheaguOaYr+WQpg0KPiAr57yW6K+R
5LqGc3lzcnHmlK/mjIHvvIzov5nnp43mlrnlvI/pg73og73lpJ/mraPluLjlt6XkvZzjgIINCj4g
Kw0KPiAr5b2T6ZSu55uY5aSE5LqO5Y6f5aeL5qih5byP5pe277yMU0FLIOiDveWkn+ato+W4uOW3
peS9nOOAgui/meaEj+WRs+edgO+8jOS4gOaXpuWumuS5ie+8jA0KPiArU0FLIOWwhue7iOatouat
o+WcqOi/kOihjOeahCBYIOacjeWKoeWZqOOAguWmguaenOezu+e7n+WkhOS6jui/kOihjOe6p+WI
qyA177yMWCDmnI0NCj4gK+WKoeWZqOWwhumHjeaWsOWQr+WKqO+8jOi/meato+aYr+S9oOW4jOac
m+WPkeeUn+eahOaDheWGteOAgg0KPiArDQo+ICvkvaDlupTor6Xkvb/nlKjku4DkuYjplK7luo/l
iJfvvJ8gQ1RSTC1BTFQtREVM55So5LqO6YeN5ZCv5py65Zmo77yMQ1RSTC1BTFQtDQo+ICtCQUNL
U1BBQ0Xlr7lY5pyN5Yqh5Zmo5pyJ54m55q6K5L2c55So44CC5oiR5Lus5bCG6YCJ5oupQ1RSTC1B
TFQtUEFVU0XjgIINCj4gKw0KPiAr5Zyo5L2g55qEcmMuc3lzaW5pdO+8iOaIlnJjLmxvY2Fs77yJ
5paH5Lu25Lit77yM5re75Yqg5Lul5LiL5ZG95LukOjoNCj4gKw0KPiArICAgIGVjaG8gIkNvbnRy
b2wgQWx0IGtleWNvZGUgMTAxID0gU0FLIiB8IC9iaW4vbG9hZGtleXMNCj4gKw0KPiAr5bCx6L+Z
5qC377yB5Y+q5pyJ6LaF57qn55So5oi35omN6IO96YeN5paw57yW56iLU0FL6ZSu44CCDQo+ICsN
Cj4gKy4uIG5vdGU6Og0KPiArDQo+ICsgIDEuIExpbnV4IFNBS+aNruivtOW5tuS4jeaYr0My57qn
5a6J5YWo5oCn55qE57O757uf5omA6KaB5rGC55qEIuecn+ato+eahFNBSyLjgIINCj4gKyAgICAg
6K+l5Y6f5Zug5L2c6ICF5Lmf5LiN55+l6YGTDQo+ICsNCj4gKyAgMi4g5Zyo6ZSu55uY6L6T5YWl
55qE5qih5byP5LiL77yMU0FL5Lya57uI5q2i5omA5pyJ5omT5byA5LqGL2Rldi9jb25zb2xl55qE
5bqU55SoDQo+ICsgICAgIOeoi+W6j+OAgg0KPiArDQo+ICsgICAgIOS9huaYr+S4jeW5uOeahOaY
r++8jOi/meS5n+WMheaLrOS4gOS6m+S9oOWunumZheS4iuS4jeW4jOacm+iiq+e7iOatoueahOeo
i+W6j+OAguWOn+WboOaYrw0KPiArICAgICDov5nkupvnqIvluo/plJnor6/nmoTkv53mjIHkuoYv
ZGV2L2NvbnNvbGXnmoTmiZPlvIDnirbmgIHjgILliqHlv4Xnoa7kv53lkJHkvaDnmoQNCj4gKyAg
ICAgTGludXjlj5HooYzniYjmj5DkvpvllYbmipXor4nov5nkuKrpl67popjjgIINCj4gKw0KPiAr
ICAgICDkvaDlj6/ku6XnlKjku6XkuIvnmoTlkb3ku6TmnaXor4bliKvlsIbooqtTQUvnu4jmraLn
moTnqIvluo86Og0KPiArDQo+ICsgICAgICAgICMgbHMgLWwgL3Byb2MvWzAtOV0qL2ZkLyogfCBn
cmVwIGNvbnNvbGUNCj4gKyAgICAgICAgbC13eC0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAg
ICAgICAgIDY0IE1hciAxOCAwMDo0NiAvcHJvYy81NzkvZmQvMCAtPiAvZGV2L2NvbnNvbGUNCj4g
Kw0KPiArICAgICDnhLblkI46Og0KPiArDQo+ICsgICAgICAgICMgcHMgYXV4fGdyZXAgNTc5DQo+
ICsgICAgICAgIHJvb3QgICAgICAgNTc5ICAwLjAgIDAuMSAgMTA4OCAgNDM2ID8gICAgICAgIFMg
ICAgMDA6NDMgICAwOjAwIGdwbSAtdCBwcy8yDQo+ICsNCj4gKyAgICAg5omA5LulYGBncG1gYOS8
muiiq1NBS+adgOatu+OAgui/meW6lOivpWdwbeS4reeahGJ1Z+OAguWug+W6lOivpeato+WcqOWF
s+mXreagh+WHhui+k+WFpe+8jA0KPiArICAgICDkvaDlj6/ku6XpgJrov4fmn6Xmib5pbml0c2Ny
aXB05p2l5ZCv5YqoZ3Bt5bm25pu05pS55a6D77yaDQo+ICsNCj4gKyAgICAg6ICB55qEOjoNCj4g
Kw0KPiArICAgICAgICBkYWVtb24gZ3BtDQo+ICsNCj4gKyAgICAg5paw55qEOjoNCj4gKw0KPiAr
ICAgICAgICBkYWVtb24gZ3BtIDwgL2Rldi9udWxsDQo+ICsNCj4gKyAgICAgVml4aWUgY3JvbuS8
vOS5juS5n+aciei/meS4qumXrumimO+8jOW5tuS4lOmcgOimgemHh+WPluebuOWQjOeahOWkhOeQ
huaWueW8j+OAgg0KPiArDQo+ICsgICAgIOatpOWklu+8jOafkOS4quiRl+WQjeeahExpbnV45Y+R
6KGM54mI5Zyo5a6D55qEcmMuc3lzaW5pdOWSjHJjIHNjcmlwdHPnmoTohJrmnKzkuK0NCj4gKyAg
ICAg5YyF5ZCr5LqG5Lul5LiL5LiJ6KGM5Luj56CBOjoNCj4gKw0KPiArICAgICAgICBleGVjIDM8
JjANCj4gKyAgICAgICAgZXhlYyA0PiYxDQo+ICsgICAgICAgIGV4ZWMgNT4mMg0KPiArDQo+ICsg
ICAgIOi/meS6m+S7o+eggeS8muWvvOiHtOaJgOacieeahOWuiOaKpOi/m+eoi+WwhuaWh+S7tuaP
j+i/sOespjPjgIE05ZKMNeWFs+iBlOWIsC9kZXYvY29uc29sZeOAgg0KPiArICAgICDmiYDku6VT
QUvkvJrlsIbku5bku6zmiYDmnInpg73nu4jmraLjgILkuIDkuKrnroDljZXnmoTop6PlhrPlip7m
s5XlsLHmmK/liKDmjonov5nkupvku6PnoIHvvIzkvYbmmK8NCj4gKyAgICAg6L+Z5qC35YGa5Lya
5a+86Ie057O757uf566h55CG5bqU55So56iL5bqP5Ye6546w5byC5bi4IC0g6KaB5a+55omA5pyJ
55qE5oOF5Ya16L+b6KGM5YWF5YiG5rWL6K+V44CCDQo+IC0tDQo+IDIuNDcuMQ0KPg0K
