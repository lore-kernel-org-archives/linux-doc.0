Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D170035295C
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 04:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780029265; cv=pass; b=LoQhw2zUoBDHkuysd5h0s26zKlewDRxBzpHEMi/4GUgZYqPgmHQtD87QmIEjfRCHi8was+rDRL1XA36+6UGJf1+Y0e7OMb6RKOHzIWI0N1aKO1nWFGWsnpwkj8rqMsmiWxiJVVkwZx5TbzfXLTb560FEvoEvbj0zUKnwfYxR1Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780029265; c=relaxed/simple;
	bh=jcdNuO5G4mOCC6Uc4/RbbCUdZt/c20ecFSJkivKfhcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdbiKjPuMeTFfUnGmxT50Uliu0MNwaTZgvwqpD4v3h/SpKqA6n/Kl90T0U94WhfRVyxjndNuhLRUSp7yxXz1VrsX1Z0vCvvYIuLjAwP2PrIssB5Xs69mj6YIQF3yTfrla2Z0mlYfteApQAy6AnPv7Op2/GqSXNWAdayPHHfVBsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAEQA+DN; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAEQA+DN"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7dd7818ac2aso7327587b3.1
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 21:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780029263; cv=none;
        d=google.com; s=arc-20240605;
        b=a1KA9VxswKFGm1hKRrBdifXISo5YHa0NrE3TCKi9xP2kAJzwiPS4M30/7E6fltddIr
         t1lNQeha4l9wvNY9Zgt0zXqjGiGOhioRzrWjYUO2xK4hl6WWvJzo2160PE2am4mkIfeq
         vkxJyY0BymKiLQw5gt0y9+hcJkUHMerZF98UTz7A7d1VwhvV8fuI6i7+rkVnJxl1jiTj
         Z2DDQkROsTHfn7hMfNkzmH6aEKnqWYS/W/fGIu2haK/t5zujolYkWVGJ2LarSqu6JZWx
         7Sa/saNKvYgJbtqqU9C8Vs9a7W9kFpRfvrzPdz+WRgl29EYAzfgR7p09fnams4FVVtJ5
         uJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jcdNuO5G4mOCC6Uc4/RbbCUdZt/c20ecFSJkivKfhcQ=;
        fh=gHAa/XD+ZeWO5k2xbW3nnNDGwVw08wnYuCR+bsFAqLE=;
        b=hCBQVzHT3Nhb6oFOIfd/HnfNYzct2i58BSSNVADa/XajltlBqWJGzOryVTtNhr/Qzt
         5KW418VmpKe1/AaLeEoOUlyvhqwarqxp4bXTEvPP18NonY7x8gwtuV3zKmANDs1IPSIL
         zjYl3P9BKEnZutyDvKnYkpa9UNhIzTT/rVvyvY22grEe3lVeGq3xkrmL7eEzrTo+MaQc
         6bMGloVgXMo3I5trJw0gGLG/ginFG049NciWOlevo+LZnudNmCEt8L+n2DNf2OiEDzDd
         NbDqaUCpizuUJUT5NoKnxgktVT5SLZfU/dizHROx9/xLnq8iP8ym+nHScCg1a8NQEqME
         MGBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780029263; x=1780634063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcdNuO5G4mOCC6Uc4/RbbCUdZt/c20ecFSJkivKfhcQ=;
        b=kAEQA+DNJFN6I3Jq8bgiT6LitPGGxn97yeOh98/iRnxP4BgV6P2F4tgsuuDWC55f8W
         rs1DTO0xMSmmrEMoo+KKUhrwtP9MlOcx1Z2axA0vBaAzTPVC8lvhpJfI9M7WPr9+EMWk
         7+oxkJPh+frEpfGVpAmYAeHIEX9FlpChkg/BSjBZePjjrL0JTMp24BbJhmcE/3Vdc+35
         n5OvnEkoCZAzH0VbNnn/Gc22v8gJd/8ziLX0UA6cl9BSx1ngO9aLYBKwh2I/38D2hFVB
         PDIYaqkSJc3IwL2wO/5b2A3UKeE/IBma4ZE4/rk9mJenC5m576onKgJAHeQ0KfEW54j4
         qytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780029263; x=1780634063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jcdNuO5G4mOCC6Uc4/RbbCUdZt/c20ecFSJkivKfhcQ=;
        b=hKPeZJrykbFOdwFQVYvvqQva1znQyuzNGT39CPnpvMA5auVN/hRXbTn0nAQJvGvcks
         LR6XaMFZiTNVXiDZdo2hGQAvninsyteHtTY7BOoZcqn5vm+LLDjOK/TL9peIM0LlNyFJ
         7T6vyW5CgnpZw9zQ1XzWQf/nGxMIWE99/gKFxLu5kpVQqswe03mOnus3MQCHaIfGQPlf
         cUXsbH/Gd6sayaYCqFzj2kY+4ka6dFVKhRzo1x9q0gzCwCb6ZvDvud2/1kAJLCVqirQD
         oWuA1+LUrhFbooqvBCj2FiDdupSLpAqUvLQ5mxR7yJvlRO7mHItuCJYpjYco4k/PCexK
         FRig==
X-Forwarded-Encrypted: i=1; AFNElJ8DlLXDiItSzO6/UyBN3reJqISMAx3vudTt1a8GgkVjdtdqnhLUJq8T1HYKST3WJvCJXWe+Ki/pB5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ttRQ/FbUw8OqigA2aPt1MSycahJWies4o5cvs4ZlEDBiIlqu
	A7jD+P9xTfD+OD7U5DJcSRfCjSxZ9uQ0oad72pAQJYqvId3/JTlQ13m/vY4scjXIIaSw3G/Tm75
	+JSadl+6CfPk1MdOLYKO7AvGo3Xv/JX0=
X-Gm-Gg: Acq92OFIC4pdJIfZuwwgwEWgVP8v9qGbITBT82W2Socf7HiH9jrSn0uYNux0H5aLUl7
	hxgVZXz9P04l3EmJUGreKmWw5o8vju0TZosrPb9+vJ6Rvdzeg/tQ7XPfpkrRdIbv7sGguZLcQXx
	SRG4U3h+EvQIvhNt5jbWV8jfGQ+wW18qgo8DE45l8u4csXUpr/YeCFuSDwTwBEa9RM1SEgyNhHo
	NtX3lT6LOPGVDVOqAZyayScCJdVSKuF2vs839IgcO3yyPIN4qXHyNO5RI2yqK6s6/VM0bsH08Gt
	gpN/55N7gjDFLxopVnU=
X-Received: by 2002:a05:690c:6a0e:b0:7cf:af41:50d9 with SMTP id
 00721157ae682-7de47286211mr10229077b3.36.1780029262839; Thu, 28 May 2026
 21:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528041330.23247-1-chenyou910331@gmail.com>
In-Reply-To: <20260528041330.23247-1-chenyou910331@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Fri, 29 May 2026 12:33:56 +0800
X-Gm-Features: AVHnY4IDsVTJEMK4uRqeIEb0W0PNqkfaG40URLY53M_3elaIYf9wZc8Yd287uvw
Message-ID: <CAD-N9QVD+L6Pgx7dVkoYMra1v02tOE7P8gCsuSMa2Nyk8H1DgQ@mail.gmail.com>
Subject: Re: [PATCH] docs: zh_TW: process: localize terminologies and improve
 fluency in 8.Conclusion
To: CHEN-YOU-0331 <chenyou910331@gmail.com>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgMTI6MTTigK9QTSBDSEVOLVlPVS0wMzMxIDxjaGVueW91
OTEwMzMxQGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBQUkMgdGVjaCB0ZXJtcyBp
bnRvIFRhaXdhbmVzZSB0ZWNoIHRlcm1zIChlLmcuLA0KPiDlhafmoLggLT4g5qC45b+DLCDku6Pn
orwgLT4g56iL5byP56K8LCDou5/ku7YgLT4g6Luf6auUKSB0byBpbXByb3ZlDQo+IHJlYWRhYmls
aXR5IGZvciBsb2NhbCBkZXZlbG9wZXJzLiBBbHNvLCByZXBocmFzZSBzZXZlcmFsDQo+IGF3a3dh
cmQgc2VudGVuY2VzIHRvIG1ha2UgdGhlIGRvY3VtZW50IG1vcmUgZmx1ZW50Lg0KDQpJIGFtIG5v
dCB2ZXJ5IGZhbWlsaWFyIHdpdGggVGFpd2FuZXNlIHRlY2ggdGVybXMuIEFmdGVyIGNoZWNraW5n
IHdpdGgNCkxMTXMsIEkgYW0gYWxtb3N0IGZpbmUgd2l0aCB0aGVzZSB0ZXJtIGNoYW5nZXMsIGV4
Y2VwdCBvbmUgcGxhY2UuDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogQ0hFTi1ZT1UtMDMzMSA8Y2hl
bnlvdTkxMDMzMUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgLi4uL3poX1RXL3Byb2Nlc3MvOC5Db25j
bHVzaW9uLnJzdCAgICAgICAgICAgIHwgNDUgKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy84LkNvbmNsdXNp
b24ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy84LkNvbmNs
dXNpb24ucnN0DQo+IGluZGV4IGQxNjM0NDIxYjYyYy4uODIzOTY5Y2Y3OTNkIDEwMDY0NA0KPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9UVy9wcm9jZXNzLzguQ29uY2x1c2lv
bi5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy84
LkNvbmNsdXNpb24ucnN0DQo+IEBAIC0xNCw0MiArMTQsNDEgQEANCj4NCj4gIC4uIF90d19kZXZl
bG9wbWVudF9jb25jbHVzaW9uOg0KPg0KPiAt5pu05aSa5L+h5oGvDQo+ICvmm7TlpJros4foqIoN
Cj4gID09PT09PT09DQo+DQo+IC3pl5zmlrxMaW51eOWFp+aguOmWi+eZvOWSjOebuOmXnOS4u+mh
jOeahOS/oeaBr+S+hua6kOW+iOWkmuOAgummluWFiOaYr+WcqOWFp+aguOa6kOS7o+eivOWIhueZ
vOS4reaJvuWIsOeahA0KPiAt5paH5qqU55uu6YyE44CC6aCC57SaDQo+ICvpl5zmlrxMaW51eOag
uOW/g+mWi+eZvOWSjOebuOmXnOS4u+mhjOeahOizh+ioiuS+hua6kOW+iOWkmuOAgummluWFiOaY
r+WcqOaguOW/g+WOn+Wni+eivOWIhueZvOS4reaJvuWIsOeahA0KPiAr5paH5Lu255uu6YyE44CC
6aCC57SaDQo+ICA6cmVmOmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNz
L2hvd3RvLnJzdCA8dHdfcHJvY2Vzc19ob3d0bz5gDQo+ICDmlofku7bmmK/kuIDlgIvph43opoHn
moTotbfpu57vvJsNCj4gIDpyZWY6YERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3By
b2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCA8dHdfc3VibWl0dGluZ3BhdGNoZXM+YA0KPiAt
5Lmf5piv5omA5pyJ5YWn5qC46ZaL55m85Lq65ZOh6YO95oeJ6Kmy6Zax6K6A55qE5YWn5a6544CC
6Kix5aSa5YWn6YOo5YWn5qC4QVBJ6YO95piv5L2/55Soa2VybmVsZG9j5qmf5Yi2DQo+IC3oqJjp
jITnmoTvvJvigJxtYWtlIGh0bWxkb2Nz4oCd5oiW4oCcbWFrZSBwZGZkb2Nz4oCd5Y+v55So5pa8
5LulSFRNTOaIllBERuagvOW8j+eUn+aIkOmAmeS6m+aWh+aqlA0KPiAt77yI5YSY566h5p+Q5Lqb
55m86KGM54mI5o+Q5L6b55qEdGV454mI5pys5pyD6YGH5Yiw5YWn6YOo6ZmQ5Yi277yM54Sh5rOV
5q2j56K66JmV55CG5paH5qqU77yJ44CCDQo+IC0NCj4gLeS4jeWQjOeahOe2suermeWcqOWQhOWA
i+e0sOevgOWxpOasoeS4iuiojuirluWFp+aguOmWi+eZvOOAguacrOaWh+S9nOiAheaDs+ismeiZ
m+WcsOW7uuitsOeUqCBodHRwczovL2x3bi5uZXQvDQo+IC3kvZzniLLkvobmupDvvJvmnInpl5zo
qLHlpJrnibnlrprlhafmoLjkuLvpoYznmoTkv6Hmga/lj6/ku6XpgJrpgY7ku6XkuIvntrLlnYDn
moQgTFdOIOWFp+aguOe0ouW8leaJvuWIsO+8mg0KPiAr5Lmf5piv5omA5pyJ5qC45b+D6ZaL55m8
5Lq65ZOh6YO95oeJ6Kmy6Zax6K6A55qE5YWn5a6544CC6Kix5aSa5YWn6YOo5qC45b+DQVBJ6YO9
5piv5L2/55Soa2VybmVsZG9j5qmf5Yi2DQoNCiLmoLjlv4NBUEkiIG1heSBjYXVzZSBjb25mdXNp
b24gdG8gbWUsIHdoaWNoIG1lYW5zICJjb3JlIEFQSSIgb3RoZXIgdGhhbg0KImtlcm5lbCBBUEki
Lg0KDQpEb25nbGlhbmcgTXUNCg0KPiAr6KiY6YyE55qE77yb4oCcbWFrZSBodG1sZG9jc+KAneaI
luKAnG1ha2UgcGRmZG9jc+KAneWPr+eUqOaWvOS7pUhUTUzmiJZQREbmoLzlvI/nlJ/miJDpgJnk
upvmlofku7YNCj4gK++8iOWEmOeuoeafkOS6m+eZvOihjOeJiOaPkOS+m+eahHRleOeJiOacrOac
g+mBh+WIsOWFp+mDqOmZkOWItu+8jOeEoeazleato+eiuuiZleeQhuaWh+S7tu+8ieOAgg0KPg0K
PiAr5LiN5ZCM55qE57ay56uZ5Zyo5ZCE5YCL57Sw56+A5bGk5qyh5LiK6KiO6KuW5qC45b+D6ZaL
55m844CC5pys5paH5L2c6ICF5oOz6KyZ6Jmb5Zyw5bu66K2w55SoIGh0dHBzOi8vbHduLm5ldC8N
Cj4gK+S9nOeIsuS+hua6kO+8m+aciemXnOioseWkmueJueWumuaguOW/g+S4u+mhjOeahOizh+io
iuWPr+S7pemAmumBjuS7peS4i+e2suWdgOeahCBMV04g5qC45b+D57Si5byV5om+5YiwOg0KPiAg
ICBodHRwOi8vbHduLm5ldC9rZXJuZWwvaW5kZXgvDQo+DQo+IC3pmaTmraTkuYvlpJbvvIzlhafm
oLjplovnmbzkurrlk6HnmoTkuIDlgIvlr7bosrTos4fmupDmmK/vvJoNCj4gK+mZpOatpOS5i+Wk
lu+8jOaguOW/g+mWi+eZvOS6uuWToeeahOS4gOWAi+WvtuiytOizh+a6kOaYr++8mg0KPg0KPiAg
ICBodHRwczovL2tlcm5lbG5ld2JpZXMub3JnLw0KPg0KPiAt55W254S277yM5Lmf5LiN5oeJ6Kmy
5b+Y6KiYIGh0dHBzOi8va2VybmVsLm9yZy8g77yM6YCZ5piv5YWn5qC455m85L2I5L+h5oGv55qE
5pyA57WC5L2N572u44CCDQo+ICvnlbbnhLbvvIzkuZ/kuI3mh4noqbLlv5joqJggaHR0cHM6Ly9r
ZXJuZWwub3JnLyDvvIzpgJnmmK/moLjlv4PnmbzkvYjos4foqIrnmoTmnIDntYLkvY3nva7jgIIN
Cj4NCj4gLemXnOaWvOWFp+aguOmWi+eZvOacieW+iOWkmuabuO+8mg0KPiAr6Zec5pa85qC45b+D
6ZaL55m85pyJ5b6I5aSa5pu477yaDQo+DQo+ICAgIOOAikxpbnV46Kit5YKZ6amF5YuV56iL5bqP
44CL56ys5LiJ54mI77yISm9uYXRoYW4gQ29yYmV044CBQWxlc3NhbmRybyBSdWJpbmnlkoxHcmVn
IEtyb2FoIEhhcnRtYW7vvIkNCj4gICAg57ea5LiK54mI5pys5ZyoIGh0dHA6Ly9sd24ubmV0L2tl
cm5lbC9sZGQzLw0KPg0KPiAtICDjgIpMaW51eOWFp+aguOioreioiOiIh+WvpuePvuOAi++8iFJv
YmVydCBMb3Zl77yJDQo+ICsgIOOAikxpbnV45qC45b+D6Kit6KiI6IiH5a+m54++44CL77yIUm9i
ZXJ0IExvdmXvvIkNCj4NCj4gLSAg44CK5rex5YWl55CG6KejTGludXjlhafmoLjjgIsoRGFuaWVs
IEJvdmV05ZKMTWFyY28gQ2VzYXRp77yJDQo+ICsgIOOAiua3seWFpeeQhuino0xpbnV45qC45b+D
44CLKERhbmllbCBCb3ZldOWSjE1hcmNvIENlc2F0ae+8iQ0KPg0KPiAg54S26ICM77yM5omA5pyJ
6YCZ5Lqb5pu46YO95pyJ5LiA5YCL5YWx5ZCM55qE57y66bue77ya5a6D5YCR5LiK5p625pmC5bCx
5b6A5b6A5pyJ5Lqb6YGO5pmC77yM6ICM5LiU5bey57aT5LiK5p62DQo+IC3kuIDmrrXmmYLplpPk
uobjgILkuI3pgY7vvIzlnKjpgqPoo4/pgoTmmK/lj6/ku6Xmib7liLDnm7jnlbblpJrnmoTlpb3k
v6Hmga/jgIINCj4gK+S4gOauteaZgumWk+S6huOAguS4jemBju+8jOWcqOmCo+ijj+mChOaYr+WP
r+S7peaJvuWIsOebuOeVtuWkmueahOWlveizh+ioiuOAgg0KPg0KPiAt5pyJ6ZecZ2l055qE5paH
5qqU77yM6KuL6Kiq5ZWP77yaDQo+ICvmnInpl5xnaXTnmoTmlofku7bvvIzoq4voqKrllY/vvJoN
Cj4NCj4gICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvc29mdHdhcmUvc2NtL2dpdC9kb2Nz
Lw0KPg0KPiBAQCAtNTgsMTYgKzU3LDE2IEBADQo+ICDntZDoq5YNCj4gID09PT0NCj4NCj4gLeel
neizgOaJgOaciemAmumBjumAmeevh+WGl+mVt+eahOaWh+aqlOeahOS6uuOAguW4jOacm+Wug+iD
veWkoOW5q+WKqeaCqOeQhuino0xpbnV45YWn5qC45piv5aaC5L2V6ZaL55m855qE77yMDQo+ICvn
pZ3os4DmiYDmnInpgJrpgY7pgJnnr4flhpfplbfnmoTmlofku7bnmoTkurrjgILluIzmnJvlroPo
g73lpKDluavliqnmgqjnkIbop6NMaW51eOaguOW/g+aYr+WmguS9lemWi+eZvOeahO+8jA0KPiAg
5Lul5Y+K5oKo5aaC5L2V5Y+D6IiH6YCZ5YCL6YGO56iL44CCDQo+DQo+IC3mnIDlvozvvIzph43o
poHnmoTmmK/lj4PoiIfjgILku7vkvZXplovmupDou5/ku7bpoIXnm67pg73kuI3mnIPotoXpgY7l
hbbosqLnjbvogIXmipXlhaXlhbbkuK3nmoTnuL3lkozjgIJMaW51eA0KPiAt5YWn5qC455qE55m8
5bGV6YCf5bqm5ZKM5Lul5YmN5LiA5qij5b+r77yM5Zug54iy5a6D5b6X5Yiw5LqG5aSn6YeP6ZaL
55m85Lq65ZOh55qE5bmr5Yqp77yM5LuW5YCR6YO95Zyo5Yqq5Yqb5L2/5a6DDQo+IC3ororlvpfm
m7Tlpb3jgILlhafmoLjmmK/kuIDlgIvmnIDmiJDlip/nmoTkvovlrZDvvIzoqqrmmI7kuobnlbbm
iJDljYPkuIrokKznmoTkurrniLLkuobkuIDlgIvlhbHlkIznmoTnm67mqJnkuIDotbcNCj4gK+ac
gOW+jO+8jOmHjeimgeeahOaYr+WPg+iIh+OAguS7u+S9lemWi+a6kOi7n+mrlOWwiOahiOmDveS4
jeacg+i2hemBjuWFtuiyoueNu+iAheaKleWFpeWFtuS4reeahOe4veWSjOOAgkxpbnV4DQo+ICvm
oLjlv4PnmoTnmbzlsZXpgJ/luqblkozku6XliY3kuIDmqKPlv6vvvIzlm6DniLLlroPlvpfliLDk
uoblpKfph4/plovnmbzkurrlk6HnmoTluavliqnvvIzku5blgJHpg73lnKjliqrlipvkvb/lroMN
Cj4gK+iuiuW+l+abtOWlveOAguaguOW/g+aYr+S4gOWAi+acgOaIkOWKn+eahOS+i+WtkO+8jOiq
quaYjuS6hueVtuaIkOWNg+S4iuiQrOeahOS6uueIsuS6huS4gOWAi+WFseWQjOeahOebruaomeS4
gOi1tw0KPiAg5bel5L2c5pmC77yM5Y+v5Lul5YGa5Ye65LuA6bq844CCDQo+DQo+IC3kuI3pgY7v
vIzlhafmoLjnuL3mmK/lj6/ku6Xlvp7mm7TlpKfnmoTplovnmbzkurrlk6Hln7rnpI7kuK3njbLn
m4rjgILnuL3mnInmm7TlpJrnmoTlt6XkvZzopoHlgZrjgILkvYbmmK/lkIzmqKMNCj4gLemHjeim
geeahOaYr++8jExpbnV455Sf5oWL57O757Wx5Lit55qE5aSn5aSa5pW45YW25LuW5Y+D6IiH6ICF
5Y+v5Lul6YCa6YGO54iy5YWn5qC45YGa5Ye66LKi54276ICM5Y+X55uK44CC5L2/DQo+IC3ku6Pn
orzpgLLlhaXkuLvnt5rmmK/mj5Dpq5jku6Pnorzos6rph4/jgIHpmY3kvY7ntq3orbflkozliIbn
mbzmiJDmnKzjgIHmj5Dpq5jlsI3lhafmoLjplovnmbzmlrnlkJHnmoTlvbHpn7/nqIvluqYNCj4g
K+S4jemBju+8jOaguOW/g+e4veaYr+WPr+S7peW+nuabtOWkp+eahOmWi+eZvOS6uuWToeWfuuek
juS4reeNsuebiuOAgue4veacieabtOWkmueahOW3peS9nOimgeWBmuOAguS9huaYr+WQjOaoow0K
PiAr6YeN6KaB55qE5piv77yMTGludXjnlJ/mhYvns7vntbHkuK3nmoTlpKflpJrmlbjlhbbku5bl
j4PoiIfogIXlj6/ku6XpgJrpgY7niLLmoLjlv4PlgZrlh7rosqLnjbvogIzlj5fnm4rjgILkvb8N
Cj4gK+eoi+W8j+eivOmAsuWFpeS4u+e3muaYr+aPkOmrmOeoi+W8j+eivOWTgeizquOAgemZjeS9
jue2reitt+WSjOWIhueZvOaIkOacrOOAgeaPkOmrmOWwjeaguOW/g+mWi+eZvOaWueWQkeeahOW9
semfv+eoi+W6pg0KPiAg562J55qE6Zec6Y2144CC6YCZ5piv5LiA56iu5YWx6LSP55qE5bGA6Z2i
44CC5ZWT5YuV5L2g55qE57eo6Lyv5Zmo77yM5L6G5Yqg5YWl5oiR5YCR5ZCn77yb5L2g5pyD6Z2e
5bi45Y+X5q2h6L+O55qE44CCDQo+DQo+IC0tDQo+IDIuNDMuMA0KPg0KPg0K
