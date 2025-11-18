Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734D82765C3
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763428172; cv=none; b=Uv8GL71xO/kombgcdGaRIToGm269UVoGlNT5mU+RvBoJG4CvlS5wHV8Aha9KWFsYqDK6oPoU/jZlI6SBPZRTu1J5BoGJ6L5/JCTq7rjmLbRIBEs8kCfzULzuLLHpKIKtZH/Ew92lET1sEApCYJ9pKZkxh+QD5SXMBiWOStMCFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763428172; c=relaxed/simple;
	bh=WLeM/XkH5sPFXerNyVIGVm8vqPAh0Udu56nyEXvMM60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+zCjdQbcb8whTmut/6rCcQc7a8oOSqFZO7vX2Hk5vbzs6iNkToqEDC2nxHK3CH0dzufag2x5NXguGq/pIMdyw92btPUWEFIEUqalTKyMwbq7SQ5QCNaDc2jy/g3gAElr3S2cN9yH+K+sqIp+I4dftkBuhm0SVyLPZOML0mR9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4oDZOyC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4oDZOyC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so8846930a12.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 17:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763428169; x=1764032969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLeM/XkH5sPFXerNyVIGVm8vqPAh0Udu56nyEXvMM60=;
        b=Q4oDZOyC8EfoQ8GAYOdTSyWSo41vzhRTeLob3CsQKPwdfLp4FTZ//GGWc+GgEhIn4q
         iYOT8OLBny6WGiTB8qkJM5bPygpIk8mRnFFPWL+JoTEMGlVcpoCCqXOo/0lAaphUVRCb
         F1vvlePbgWU9betfehm17ShJTV/Qynft0LECO9PVdNiygA1Yb56znxuM9XIdE3asLLlN
         akbnBXcnkgsjrfgqgesl1VNwCwVCt5KNkARFYb77t6FOpP4ehK/Kz8HAoL+FACXCVWbv
         qTcLXE+N2J1OjeTEKhA5sDoB4mmPzKBu1HBs1myf7lBckk5bPBeeTuD1vrQI+oKLp7BS
         yY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763428169; x=1764032969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLeM/XkH5sPFXerNyVIGVm8vqPAh0Udu56nyEXvMM60=;
        b=FKD4vYWqxPlZc1/N1Fgmp0knq9lTnpcC7APUuETijOXoMvzl4XJ7OHkUgldL6kjf8F
         jruPGCzIQwlqnGzz7vAx1DK0RVqnGRQmvinWC+w2F1Z8UeG4XXSSHA/Pd9aPApjftzwn
         T/VGUmmF00hJC2sv/X9LULKMPsXy+LefrpPyYLSA+zosh8JEuAjFKYX6h1dm7bhsbvSt
         xE9e8yluMcgox+Uq0eTncaWIoTdvGZRiIqMM2x0XUq4Ehy5mA25Ba4kTwuxH3FwJcq3J
         2sV/X2vCPbhFmKjgsg5uVnOduMd7HG4CJRHvgw6ypwZAULuT6WuyVOgB2QZlH6Sbgl1/
         Ip8A==
X-Forwarded-Encrypted: i=1; AJvYcCWvM1F5uZJq4/y3nhC5kKGfsGQgQyDGk7zohoVKHza7G7zxiGsFspyFZ6XYU7+Xvxtn5/v2Sk6Ye4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfpek4MMaVGCOKqCmvxz7Wmihjq7G7TWzQafsmfqBdrzeP4xYQ
	IN6TtZWJmgCcd55Dm4CZGAWIYg5NHDbCS4kyPUAaCJZkNL3oJvtQtXG8e+ZpxiRHX7gii4CW4UN
	OxzU9UNnq+FuN19fLhA08NbGSjs5gCyk=
X-Gm-Gg: ASbGnctztyGJ87JyLXKtUeY+l1vwaKHyxdrrX+NxaG9c3sJ1Pny+2xWlME2NYKKYb8P
	jZ2eWPUAwzUQ0SpalPb4FvBk7iSnSGjz7lIOf2HA5h6lUzvQ8JqUmyBUfUqra6slXNl7ivHAm39
	r7RcKClVhxDErdmrns+MqKnZLri0mumpFLcXKd7VQPb6Z9WUjHzgbUvVZvMNHkMRQvZyQlcNZ8X
	41mYZTTt3yAhyDNXYqXAHcrEbq+ferBgf0WBjuBf53SQANAKkBrbI6m6pDiT2xiGrN9Zp0G3ZN4
	wxavJg==
X-Google-Smtp-Source: AGHT+IF+e/kOG1uw+bjXci22OK7I5ob8rgyTKrU7bSXOhLgA6hOwaoEjKrUdLLcLgP4JhmJ9OPxyszvDlz0Uzq5PNd4=
X-Received: by 2002:a17:907:72d3:b0:b73:16fe:92d0 with SMTP id
 a640c23a62f3a-b736780d5fcmr1655309066b.18.1763428168433; Mon, 17 Nov 2025
 17:09:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117093041.458075-1-zhaochenguang@kylinos.cn>
In-Reply-To: <20251117093041.458075-1-zhaochenguang@kylinos.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 18 Nov 2025 09:08:50 +0800
X-Gm-Features: AWmQ_bmHi3LbWwFjj_kV_05r1kY2SuwBE87exujE2ij_hTyvkRTa9N2QZMVkn7c
Message-ID: <CAJy-Am=UPT+5i-bmQ-UxPo-JOeFS+zQeGkps+dh45X7eSLrWSA@mail.gmail.com>
Subject: Re: [PATCH linux-next v5] docs/zh_CN: Update the Chinese translation
 of kbuild.rst
To: Chenguang Zhao <zhaochenguang@kylinos.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, WangYuli <wangyuli@aosc.io>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

QXBwbGllZCwgdGhhbmtzIGFsbCENCg0KQ2hlbmd1YW5nIFpoYW8gPHpoYW9jaGVuZ3VhbmdAa3ls
aW5vcy5jbj4g5LqOMjAyNeW5tDEx5pyIMTfml6XlkajkuIAgMTc6MzDlhpnpgZPvvJoNCj4NCj4g
RmluaXNoIHRoZSB0cmFuc2xhdGlvbiBvZiBrYnVpbGQva2J1aWxkLnJzdC4NCj4NCj4gVXBkYXRl
IHRvIGNvbW1pdCA1Y2JmYjRkYTdlMDYgKCJrYnVpbGQ6IGRvYzogaW1wcm92ZQ0KPiBLQlVJTERf
QlVJTERfVElNRVNUQU1QIGRvY3VtZW50YXRpb24iKQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGVu
Z3VhbmcgWmhhbyA8emhhb2NoZW5ndWFuZ0BreWxpbm9zLmNuPg0KPiAtLS0NCj4gdjU6DQo+ICAt
IEFkZCBzcGFjZXMgYmVmb3JlIGFuZCBhZnRlciBFbmdsaXNoIHdvcmQgYW5kIEFyYWJpYyBudW1l
cmFscw0KPiAgICBhcyBzdWdnZXN0ZWQgYnkgV2FuZ1l1Lg0KPiAtLS0NCj4gIC4uLi90cmFuc2xh
dGlvbnMvemhfQ04va2J1aWxkL2tidWlsZC5yc3QgICAgICB8IDI3ICsrKysrKysrKysrKysrKyst
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04va2J1aWxk
L2tidWlsZC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9rYnVpbGQva2J1
aWxkLnJzdA0KPiBpbmRleCBlNWUyYWViZTFlYmMuLjU3ZjVjZjViMmNkZCAxMDA2NDQNCj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04va2J1aWxkL2tidWlsZC5yc3QNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04va2J1aWxkL2tidWlsZC5yc3QN
Cj4gQEAgLTkzLDYgKzkzLDE2IEBAIEhPU1RSVVNURkxBR1MNCj4gIC0tLS0tLS0tLS0tLS0NCj4g
IOWcqOaehOW7uuS4u+acuueoi+W6j+aXtuS8oOmAkue7mSAkKEhPU1RSVVNUQykg55qE6aKd5aSW
5qCH5b+X44CCDQo+DQo+ICtQUk9DTUFDUk9MREZMQUdTDQo+ICstLS0tLS0tLS0tLS0tLS0tDQo+
ICvnlKjkuo7pk77mjqUgUnVzdCDov4fnqIvlro/nmoTmoIflv5fjgILnlLHkuo7ov4fnqIvlro/m
mK/nlLEgcnVzdGMg5Zyo5p6E5bu65pe25Yqg6L2955qE77yMDQo+ICvlm6DmraTlv4Xpobvku6Xk
uI7lvZPliY3kvb/nlKjnmoQgcnVzdGMg5bel5YW36ZO+5YW85a6555qE5pa55byP6L+b6KGM6ZO+
5o6l44CCDQo+ICsNCj4gK+S+i+Wmgu+8jOW9kyBydXN0YyDkvb/nlKjnmoQgQyDlupPkuI7nlKjm
iLfluIzmnJvnlKjkuo7kuLvmnLrnqIvluo/nmoQgQyDlupPkuI3lkIzml7bvvIwNCj4gK+atpOiu
vue9ruS8mumdnuW4uOacieeUqOOAgg0KPiArDQo+ICvlpoLmnpzmnKrorr7nva7vvIzliJnpu5jo
rqTkvb/nlKjpk77mjqXkuLvmnLrnqIvluo/ml7bkvKDpgJLnmoTmoIflv5fjgIINCj4gKw0KPiAg
SE9TVExERkxBR1MNCj4gIC0tLS0tLS0tLS0tDQo+ICDpk77mjqXkuLvmnLrnqIvluo/ml7bkvKDp
gJLnmoTpop3lpJbpgInpobnjgIINCj4gQEAgLTEzNSwxMiArMTQ1LDE4IEBAIEtCVUlMRF9PVVRQ
VVQNCj4gIOaMh+WumuWGheaguOaehOW7uueahOi+k+WHuuebruW9leOAgg0KPg0KPiAg5Zyo5Y2V
54us55qE5p6E5bu655uu5b2V5Lit5Li66aKE5p6E5bu65YaF5qC45p6E5bu65aSW6YOo5qih5Z2X
5pe277yM6L+Z5Liq5Y+Y6YeP5Lmf5Y+v5Lul5oyH5ZCR5YaF5qC46L6T5Ye655uu5b2V44CC6K+3
5rOo5oSP77yMDQo+IC3ov5nlubbkuI3mjIflrprlpJbpg6jmqKHlnZfmnKzouqvnmoTovpPlh7rn
m67lvZXjgIINCj4gK+i/meW5tuS4jeaMh+WumuWklumDqOaooeWdl+acrOi6q+eahOi+k+WHuueb
ruW9lSjkvb/nlKggS0JVSUxEX0VYVE1PRF9PVVRQVVQg5p2l6L6+5Yiw6L+Z5Liq55uu55qEKeOA
gg0KPg0KPiAg6L6T5Ye655uu5b2V5Lmf5Y+v5Lul5L2/55SoICJPPS4uLiIg5oyH5a6a44CCDQo+
DQo+ICDorr7nva4gIk89Li4uIiDkvJjlhYjkuo4gS0JVSUxEX09VVFBVVOOAgg0KPg0KPiArS0JV
SUxEX0VYVE1PRF9PVVRQVVQNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICvmjIflrprlpJbp
g6jmqKHlnZfnmoTovpPlh7rnm67lvZUNCj4gKw0KPiAr6K6+572uICJNTz0uLi4iIOS8mOWFiOS6
jiBLQlVJTERfRVhUTU9EX09VVFBVVC4NCj4gKw0KPiAgS0JVSUxEX0VYVFJBX1dBUk4NCj4gIC0t
LS0tLS0tLS0tLS0tLS0tDQo+ICDmjIflrprpop3lpJbnmoTmnoTlu7rmo4Dmn6XjgILkuZ/lj6/k
u6XpgJrov4flnKjlkb3ku6TooYzkvKDpgJIgIlc9Li4uIiDmnaXorr7nva7nm7jlkIznmoTlgLzj
gIINCj4gQEAgLTI5MCw4ICszMDYsMTMgQEAgSUdOT1JFX0RJUlMNCj4gIEtCVUlMRF9CVUlMRF9U
SU1FU1RBTVANCj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIOWwhuivpeeOr+Wig+WPmOmH
j+iuvue9ruS4uuaXpeacn+Wtl+espuS4su+8jOWPr+S7peimhuebluWcqCBVVFNfVkVSU0lPTiDl
rprkuYnkuK3kvb/nlKjnmoTml7bpl7TmiLMNCj4gLe+8iOi/kOihjOWGheaguOaXtueahCB1bmFt
ZSAtdu+8ieOAguivpeWAvOW/hemhu+aYr+S4gOS4quWPr+S7peS8oOmAkue7mSBkYXRlIC1kIOea
hOWtl+espuS4suOAgum7mOiupOWAvOaYrw0KPiAt5YaF5qC45p6E5bu65p+Q5Liq5pe25Yi755qE
IGRhdGUg5ZG95Luk6L6T5Ye644CCDQo+ICso6L+Q6KGM5YaF5qC45pe255qEIHVuYW1lIC12KSDj
gILor6XlgLzlv4XpobvmmK/kuIDkuKrlj6/ku6XkvKDpgJLnu5kgZGF0ZSAtZCDnmoTlrZfnrKbk
uLLjgILkvovlpoI6Og0KPiArDQo+ICsgICAgICAgJCBLQlVJTERfQlVJTERfVElNRVNUQU1QPSJN
b24gT2N0IDEzIDAwOjAwOjAwIFVUQyAyMDI1IiBtYWtlDQo+ICsNCj4gK+m7mOiupOWAvOaYr+WG
heaguOaehOW7uuafkOS4quaXtuWIu+eahCBkYXRlIOWRveS7pOi+k+WHuuOAguWmguaenOaPkOS+
m+ivpeaXtuaIs++8jOWug+i/mOeUqOS6juS7u+S9lSBpbml0cmFtZnMg5b2SDQo+ICvmoaPmlofk
u7bkuK3nmoQgbXRpbWUg5a2X5q6144CCIEluaXRyYW1mcyBtdGltZXMg5pivIDMyIOS9jeeahO+8
jOWboOatpOaXqeS6jiBVbml4IOe6quWFgyAxOTcwIOW5tO+8jOaIlg0KPiAr5pma5LqO5Y2P6LCD
5LiW55WM5pe2IChVVEMpIDIxMDYg5bm0IDIg5pyIIDcg5pelIDYg5pe2IDI4IOWIhiAxNSDnp5Ln
moTml6XmnJ/mmK/ml6DmlYjnmoTjgIINCj4NCj4gIEtCVUlMRF9CVUlMRF9VU0VSLCBLQlVJTERf
QlVJTERfSE9TVA0KPiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0t
DQo+IDIuMjUuMQ0KPg0K
