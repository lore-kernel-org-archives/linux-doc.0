Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37DB3D45E9
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053974; cv=pass; b=qaXSBYqDNkNH/smApL0EyhNwOX4N8tKJAgRwZtGC23WOzaRyIgGYoR2mtze8JbcyQaRObVJIGBuhuyuHllSdolvmXxQ7CgTs2Cb9vZXlyKtHa6F3dyVo9QbozaZz4QkbAq74ujzBJeM7dVrUvb6ezf7MSOWdebaS3DBvvB2sxpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053974; c=relaxed/simple;
	bh=jdrNwdUG66wHWu2bfrtpZ5FZy9PV2sWIwTEfNbAt0Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebBVNYTfDtDW5kBQdzerOQekprIAohGFdoo7rQ+/nrRfV2X4DuSak6apdMfd9iRrx7B76Ope+NIjhd4CEpU5tJRhPvnYeVhLORreQwXseMupuMU8VsRFunwDflKKQyP9Y3W/F3oSmZ5RbHIFFJUCiR8hFvi749jMZ02yZgpionU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHLH1Ytf; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHLH1Ytf"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a875ca312eso1437447e87.3
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 04:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780053970; cv=none;
        d=google.com; s=arc-20240605;
        b=IM8nTgTmqLIbOlciPrxwi8inZmyDtszB8TDBJVz765Ki4I35RXgmJj18KjghPX2RfP
         apq7d/OcZv9IkhR/wEFYfkhHNezuVFKONqhq8XfQZa5Grzju4d+uZaEPmFjjZKtNkW6D
         HEa8SzJUDyw30VRlDN4w6/aZi+YayU6bcP1BRsfLCRWa0Mp2y4nhjj7UiUWkLX2XGqJw
         2ZUDmiHq+OrclU8+Yy3bUbl6sBE5/5JnUyhY6mw1Hytvhr93v+U0qiz/3IS3s1/6XmxR
         /s9wStNay+fzqvtz3h9kvkYsi2yAFMcVa+5cD3LyJhBQhu2H0qYC9ZjkNNom3879AknB
         CXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jdrNwdUG66wHWu2bfrtpZ5FZy9PV2sWIwTEfNbAt0Hk=;
        fh=vsW4INizufC9uRh9xo2dBS5wF/vZQ8c9r/PdB489clU=;
        b=VThzlhPJ+ZkYYRQrl0aD/UKGJX1vgUmtEHAC/APy0QLB6++EquZ8Olw7DV4Ws4AchE
         /0cljOu6lJJcow9O+P34wlWrXRpHJo1IFTFZMNRIULYw5sUtHv8UPagqsHPutEj7shFf
         F0yRnrM8+Gl3u88UUSvDkUrpsTFMiFCxLJzqv9P6ceMkMGL+4v9rrHNdGpjF4iyZVm1V
         kM/9B19E6SmLSjivX0H1jhNOnWzOdxbJ6oeY/Y8Cd3UkvehMfNzBdbeONSZd5Gys/hcN
         EmbYf6EuejkEaouos+/aLMXhk1qWWXH/+nvyjfjgDw4i3ciFiTp6Nk93G9Acow975d8A
         Q6Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780053970; x=1780658770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdrNwdUG66wHWu2bfrtpZ5FZy9PV2sWIwTEfNbAt0Hk=;
        b=bHLH1YtfCYv4PmAj+WWUUNoGaT9J6ec6cJg6lURXPncaZVXQEH2sQx0u8RIikqLxEP
         bT9sPuOw6F6zVMTrO7MihnCFeq+f9bgPxzOESN/CzFFPl33CnljDJMFqJh5QcA/BUL+j
         bDQZWtjlGrICup9EgvPz2CRX/u9T3fTNVEwS6v0Sx6rfjdasnaY7LebL77mSyqeFrxlW
         VPGEKdsiSknkl0U9SfvgEbqSSOxhcR11L0WvUeag4kW+WK/9EG9BZgCpPl3B5N9KWi17
         qHHejbvIHDF5xiyjqyPBiJ+/yzv5odLBDTtsPt2dJmI/D0mmHPmzrLDCzxmZT3A6SenU
         46jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053970; x=1780658770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdrNwdUG66wHWu2bfrtpZ5FZy9PV2sWIwTEfNbAt0Hk=;
        b=X3X1U8UF7pDlgLkZQrGIGSBz1Gr3+qU/zGfdGjX2IlSmGjRSQVJjBttB8U/z6sJ9Ii
         psEhgECzKzArdFm7mMEyRXBJcI+bdRfecV3Bq4LxVW4BHSU1sGvZHY8OyZc9uxnB3jFW
         tbuUMul+hzlXHE714hl1SATit6ett69r4YSl9QeCALBAm5r/CM3sDBTg1xGqmpCbCEh6
         0jGm8OgK/r5vu7J/N/gdRb7BqbC/7YW5fxEq7ABOzDOChm9YkOtZ9hLc18L62PR4wfv1
         22VzlaA6P1n9ZOKOrDwW446dIfbHQ0fmCl2tZhWaSuVQszlSh9SNVoGOr4NERQZRuP+L
         Yv2A==
X-Forwarded-Encrypted: i=1; AFNElJ8nMicR6evQdCyIikpeu0LK7CjHBv/r27pW0XmBDUtUbMlrGv6XKRdsRdMxYj9k9DKrLYOL9IsdAO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFHJCH9qDYbzNonAJ/3Gqo92bnoYgXZoAOKLIaHSZCUMzoRY4M
	PwVyUnj3Oiafm6+rSwWi8NOOc+3KlUsXRiZexTK7Yv7XP7zkyHmUCGqg0eP19oIALVjybqJB+6n
	LQxP/JIJVOgJgvfYo4Zyf3tokdqfnExg=
X-Gm-Gg: Acq92OGhgKZWfi4H3L/kTJpD37Bq+M5dIJ/gyc1VRp3Xs0bDm4rIiumDjuVQ5KRvQqU
	E1F8WJvBjofxdg1DKH8+o/ZMz91JvS81h/QaWJhaWyolfamzwWyQgnYiNYtA18p7jUOBkS+niHX
	C4OS1BEXJaxLrkWzJzsuWeYaF51bJ1PkSoeI4Kl8xoisBFO9LcSiVR7Nvz7zYXfqssXpDmQe22H
	fVEN9HiiMBGlMXbQiUYmrTJzVOklVgKG6Brzk/3qSH5WVULvZVaRC3z/ePXQtMCSVk04MYDf/eB
	Hnmv3dO5yagA1tHVpA==
X-Received: by 2002:a2e:b88f:0:b0:393:5904:7411 with SMTP id
 38308e7fff4ca-3965361c564mr3371191fa.3.1780053969537; Fri, 29 May 2026
 04:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528041330.23247-1-chenyou910331@gmail.com> <CAD-N9QVD+L6Pgx7dVkoYMra1v02tOE7P8gCsuSMa2Nyk8H1DgQ@mail.gmail.com>
In-Reply-To: <CAD-N9QVD+L6Pgx7dVkoYMra1v02tOE7P8gCsuSMa2Nyk8H1DgQ@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 29 May 2026 19:25:57 +0800
X-Gm-Features: AVHnY4LqETyppAVmg67SkmJ4eR1_9m0_AOG8cvSynVwoT2qN3SclXIFo1oonXJY
Message-ID: <CAKspUh+5h+MeMVEEGy4Oc+HJteaTE1Ft1XXhDPJEmL-218T4Jg@mail.gmail.com>
Subject: Re: [PATCH] docs: zh_TW: process: localize terminologies and improve
 fluency in 8.Conclusion
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgRG9uZ2xpYW5nLA0KDQpUaGFuayB5b3UgZm9yIHJldmlld2luZyB0aGlzIHBhdGNoIGFuZCBm
b3IgeW91ciBjYXJlZnVsIG9ic2VydmF0aW9uIQ0KDQpZb3UgcmFpc2VkIGEgdmVyeSB2YWxpZCBw
b2ludC4gSW4gUFJDIHRlcm1pbm9sb2d5LCAi5YWn5qC4IiAoS2VybmVsKSBhbmQNCiLmoLjlv4Mi
IChDb3JlKSBhcmUgZGlzdGluY3RseSBzZXBhcmF0ZWQuIEhvd2V2ZXIsIGluIFRhaXdhbidzIG9m
ZmljaWFsDQp0ZWNoIHRlcm1pbm9sb2d5IChlLmcuLCBieSB0aGUgTmF0aW9uYWwgQWNhZGVteSBm
b3IgRWR1Y2F0aW9uYWwNClJlc2VhcmNoKSBhbmQgbG9jYWwgYWNhZGVtaWMvaW5kdXN0cnkgdXNh
Z2UsICJLZXJuZWwiIGlzIHVuaXZlcnNhbGx5DQp0cmFuc2xhdGVkIGFzICLmoLjlv4MiIChlLmcu
LCBMaW51eCBLZXJuZWwgLT4gTGludXgg5qC45b+DLCBLZXJuZWwgc3BhY2UgLT4NCuaguOW/g+ep
uumWkykuDQoNCkl0IGlzIHRydWUgdGhhdCAiQ29yZSIgaXMgYWxzbyB0cmFuc2xhdGVkIGFzICLm
oLjlv4MiIGluIFRhaXdhbiwgd2hpY2gNCmNyZWF0ZXMgYSBsZXhpY2FsIG92ZXJsYXAuIEhvd2V2
ZXIsIFRhaXdhbmVzZSBkZXZlbG9wZXJzIGFyZSBlbnRpcmVseQ0KdXNlZCB0byByZWx5aW5nIG9u
IHRoZSBjb250ZXh0IHRvIGRpZmZlcmVudGlhdGUgdGhlbS4gSW4gdGhlIGNvbnRleHQNCm9mIG9w
ZXJhdGluZyBzeXN0ZW1zIGFuZCBMaW51eCBkb2N1bWVudGF0aW9uLCBsb2NhbCBkZXZlbG9wZXJz
IHdpbGwNCm5hdGl2ZWx5IG1hcCAi5qC45b+DIEFQSSIgdG8gIktlcm5lbCBBUEkiIHdpdGhvdXQg
YW55IGNvbmZ1c2lvbi4NCg0KSWYgeW91IGZlZWwgaXQgbWlnaHQgc3RpbGwgYmUgdG9vIGFtYmln
dW91cywgYW5vdGhlciBjb21tb24gcHJhY3RpY2UNCmluIFRhaXdhbiBpcyB0byBzaW1wbHkga2Vl
cCB0aGUgRW5nbGlzaCB3b3JkIGZvciB0ZWNobmljYWwgcHJlY2lzaW9uLg0KV2UgY291bGQgY2hh
bmdlIGl0IHRvICJMaW51eCDmoLjlv4MgQVBJIiBvciBqdXN0IGxlYXZlIGl0IGFzICJrZXJuZWwg
QVBJIi4NCg0KRm9yIGxvY2FsIGRldmVsb3BlcnMsIHRoZSBjdXJyZW50IHRyYW5zbGF0aW9uICLm
oLjlv4MgQVBJIiBpcyBwZXJmZWN0bHkNCm5hdHVyYWwsIGJ1dCBJIGFtIGhhcHB5IHRvIHNlbmQg
YSB2MiBwYXRjaCB0byBhZGp1c3QgdGhpcyBzcGVjaWZpYw0KcGhyYXNlIGlmIHlvdSBwcmVmZXIu
IFBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHRob3VnaHRzIQ0KDQpCZXN0IHJlZ2FyZHMsDQpDaGVu
IFlvdQ0KDQoNCkRvbmdsaWFuZyBNdSA8bXVkb25nbGlhbmdhYmNkQGdtYWlsLmNvbT4g5pa8IDIw
MjblubQ15pyIMjnml6XpgLHkupQg5LiL5Y2IMTI6MzTlr6vpgZPvvJoNCj4NCj4gT24gVGh1LCBN
YXkgMjgsIDIwMjYgYXQgMTI6MTTigK9QTSBDSEVOLVlPVS0wMzMxIDxjaGVueW91OTEwMzMxQGdt
YWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUcmFuc2xhdGUgUFJDIHRlY2ggdGVybXMgaW50byBU
YWl3YW5lc2UgdGVjaCB0ZXJtcyAoZS5nLiwNCj4gPiDlhafmoLggLT4g5qC45b+DLCDku6Pnorwg
LT4g56iL5byP56K8LCDou5/ku7YgLT4g6Luf6auUKSB0byBpbXByb3ZlDQo+ID4gcmVhZGFiaWxp
dHkgZm9yIGxvY2FsIGRldmVsb3BlcnMuIEFsc28sIHJlcGhyYXNlIHNldmVyYWwNCj4gPiBhd2t3
YXJkIHNlbnRlbmNlcyB0byBtYWtlIHRoZSBkb2N1bWVudCBtb3JlIGZsdWVudC4NCj4NCj4gSSBh
bSBub3QgdmVyeSBmYW1pbGlhciB3aXRoIFRhaXdhbmVzZSB0ZWNoIHRlcm1zLiBBZnRlciBjaGVj
a2luZyB3aXRoDQo+IExMTXMsIEkgYW0gYWxtb3N0IGZpbmUgd2l0aCB0aGVzZSB0ZXJtIGNoYW5n
ZXMsIGV4Y2VwdCBvbmUgcGxhY2UuDQo+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDSEVOLVlP
VS0wMzMxIDxjaGVueW91OTEwMzMxQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3poX1RX
L3Byb2Nlc3MvOC5Db25jbHVzaW9uLnJzdCAgICAgICAgICAgIHwgNDUgKysrKysrKysrLS0tLS0t
LS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
VFcvcHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfVFcvcHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0DQo+ID4gaW5kZXggZDE2MzQ0MjFiNjJjLi44
MjM5NjljZjc5M2QgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfVFcvcHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0DQo+ID4gQEAgLTE0LDQy
ICsxNCw0MSBAQA0KPiA+DQo+ID4gIC4uIF90d19kZXZlbG9wbWVudF9jb25jbHVzaW9uOg0KPiA+
DQo+ID4gLeabtOWkmuS/oeaBrw0KPiA+ICvmm7TlpJros4foqIoNCj4gPiAgPT09PT09PT0NCj4g
Pg0KPiA+IC3pl5zmlrxMaW51eOWFp+aguOmWi+eZvOWSjOebuOmXnOS4u+mhjOeahOS/oeaBr+S+
hua6kOW+iOWkmuOAgummluWFiOaYr+WcqOWFp+aguOa6kOS7o+eivOWIhueZvOS4reaJvuWIsOea
hA0KPiA+IC3mlofmqpTnm67pjITjgILpoILntJoNCj4gPiAr6Zec5pa8TGludXjmoLjlv4Pplovn
mbzlkoznm7jpl5zkuLvpoYznmoTos4foqIrkvobmupDlvojlpJrjgILpppblhYjmmK/lnKjmoLjl
v4Pljp/lp4vnorzliIbnmbzkuK3mib7liLDnmoQNCj4gPiAr5paH5Lu255uu6YyE44CC6aCC57Sa
DQo+ID4gIDpyZWY6YERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvaG93
dG8ucnN0IDx0d19wcm9jZXNzX2hvd3RvPmANCj4gPiAg5paH5Lu25piv5LiA5YCL6YeN6KaB55qE
6LW36bue77ybDQo+ID4gIDpyZWY6YERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3By
b2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCA8dHdfc3VibWl0dGluZ3BhdGNoZXM+YA0KPiA+
IC3kuZ/mmK/miYDmnInlhafmoLjplovnmbzkurrlk6Hpg73mh4noqbLplrHoroDnmoTlhaflrrnj
gILoqLHlpJrlhafpg6jlhafmoLhBUEnpg73mmK/kvb/nlKhrZXJuZWxkb2PmqZ/liLYNCj4gPiAt
6KiY6YyE55qE77yb4oCcbWFrZSBodG1sZG9jc+KAneaIluKAnG1ha2UgcGRmZG9jc+KAneWPr+eU
qOaWvOS7pUhUTUzmiJZQREbmoLzlvI/nlJ/miJDpgJnkupvmlofmqpQNCj4gPiAt77yI5YSY566h
5p+Q5Lqb55m86KGM54mI5o+Q5L6b55qEdGV454mI5pys5pyD6YGH5Yiw5YWn6YOo6ZmQ5Yi277yM
54Sh5rOV5q2j56K66JmV55CG5paH5qqU77yJ44CCDQo+ID4gLQ0KPiA+IC3kuI3lkIznmoTntrLn
q5nlnKjlkITlgIvntLDnr4DlsaTmrKHkuIroqI7oq5blhafmoLjplovnmbzjgILmnKzmlofkvZzo
gIXmg7PorJnomZvlnLDlu7rorbDnlKggaHR0cHM6Ly9sd24ubmV0Lw0KPiA+IC3kvZzniLLkvobm
upDvvJvmnInpl5zoqLHlpJrnibnlrprlhafmoLjkuLvpoYznmoTkv6Hmga/lj6/ku6XpgJrpgY7k
u6XkuIvntrLlnYDnmoQgTFdOIOWFp+aguOe0ouW8leaJvuWIsO+8mg0KPiA+ICvkuZ/mmK/miYDm
nInmoLjlv4Pplovnmbzkurrlk6Hpg73mh4noqbLplrHoroDnmoTlhaflrrnjgILoqLHlpJrlhafp
g6jmoLjlv4NBUEnpg73mmK/kvb/nlKhrZXJuZWxkb2PmqZ/liLYNCj4NCj4gIuaguOW/g0FQSSIg
bWF5IGNhdXNlIGNvbmZ1c2lvbiB0byBtZSwgd2hpY2ggbWVhbnMgImNvcmUgQVBJIiBvdGhlciB0
aGFuDQo+ICJrZXJuZWwgQVBJIi4NCj4NCj4gRG9uZ2xpYW5nIE11DQo+DQo+ID4gK+iomOmMhOea
hO+8m+KAnG1ha2UgaHRtbGRvY3PigJ3miJbigJxtYWtlIHBkZmRvY3PigJ3lj6/nlKjmlrzku6VI
VE1M5oiWUERG5qC85byP55Sf5oiQ6YCZ5Lqb5paH5Lu2DQo+ID4gK++8iOWEmOeuoeafkOS6m+eZ
vOihjOeJiOaPkOS+m+eahHRleOeJiOacrOacg+mBh+WIsOWFp+mDqOmZkOWItu+8jOeEoeazleat
o+eiuuiZleeQhuaWh+S7tu+8ieOAgg0KPiA+DQo+ID4gK+S4jeWQjOeahOe2suermeWcqOWQhOWA
i+e0sOevgOWxpOasoeS4iuiojuirluaguOW/g+mWi+eZvOOAguacrOaWh+S9nOiAheaDs+ismeiZ
m+WcsOW7uuitsOeUqCBodHRwczovL2x3bi5uZXQvDQo+ID4gK+S9nOeIsuS+hua6kO+8m+aciemX
nOioseWkmueJueWumuaguOW/g+S4u+mhjOeahOizh+ioiuWPr+S7pemAmumBjuS7peS4i+e2suWd
gOeahCBMV04g5qC45b+D57Si5byV5om+5YiwOg0KPiA+ICAgIGh0dHA6Ly9sd24ubmV0L2tlcm5l
bC9pbmRleC8NCj4gPg0KPiA+IC3pmaTmraTkuYvlpJbvvIzlhafmoLjplovnmbzkurrlk6HnmoTk
uIDlgIvlr7bosrTos4fmupDmmK/vvJoNCj4gPiAr6Zmk5q2k5LmL5aSW77yM5qC45b+D6ZaL55m8
5Lq65ZOh55qE5LiA5YCL5a+26LK06LOH5rqQ5piv77yaDQo+ID4NCj4gPiAgICBodHRwczovL2tl
cm5lbG5ld2JpZXMub3JnLw0KPiA+DQo+ID4gLeeVtueEtu+8jOS5n+S4jeaHieipsuW/mOiomCBo
dHRwczovL2tlcm5lbC5vcmcvIO+8jOmAmeaYr+WFp+aguOeZvOS9iOS/oeaBr+eahOacgOe1guS9
jee9ruOAgg0KPiA+ICvnlbbnhLbvvIzkuZ/kuI3mh4noqbLlv5joqJggaHR0cHM6Ly9rZXJuZWwu
b3JnLyDvvIzpgJnmmK/moLjlv4PnmbzkvYjos4foqIrnmoTmnIDntYLkvY3nva7jgIINCj4gPg0K
PiA+IC3pl5zmlrzlhafmoLjplovnmbzmnInlvojlpJrmm7jvvJoNCj4gPiAr6Zec5pa85qC45b+D
6ZaL55m85pyJ5b6I5aSa5pu477yaDQo+ID4NCj4gPiAgICDjgIpMaW51eOioreWCmempheWLleeo
i+W6j+OAi+esrOS4ieeJiO+8iEpvbmF0aGFuIENvcmJldOOAgUFsZXNzYW5kcm8gUnViaW5p5ZKM
R3JlZyBLcm9haCBIYXJ0bWFu77yJDQo+ID4gICAg57ea5LiK54mI5pys5ZyoIGh0dHA6Ly9sd24u
bmV0L2tlcm5lbC9sZGQzLw0KPiA+DQo+ID4gLSAg44CKTGludXjlhafmoLjoqK3oqIjoiIflr6bn
j77jgIvvvIhSb2JlcnQgTG92Ze+8iQ0KPiA+ICsgIOOAikxpbnV45qC45b+D6Kit6KiI6IiH5a+m
54++44CL77yIUm9iZXJ0IExvdmXvvIkNCj4gPg0KPiA+IC0gIOOAiua3seWFpeeQhuino0xpbnV4
5YWn5qC444CLKERhbmllbCBCb3ZldOWSjE1hcmNvIENlc2F0ae+8iQ0KPiA+ICsgIOOAiua3seWF
peeQhuino0xpbnV45qC45b+D44CLKERhbmllbCBCb3ZldOWSjE1hcmNvIENlc2F0ae+8iQ0KPiA+
DQo+ID4gIOeEtuiAjO+8jOaJgOaciemAmeS6m+abuOmDveacieS4gOWAi+WFseWQjOeahOe8uum7
nu+8muWug+WAkeS4iuaetuaZguWwseW+gOW+gOacieS6m+mBjuaZgu+8jOiAjOS4lOW3sue2k+S4
iuaetg0KPiA+IC3kuIDmrrXmmYLplpPkuobjgILkuI3pgY7vvIzlnKjpgqPoo4/pgoTmmK/lj6/k
u6Xmib7liLDnm7jnlbblpJrnmoTlpb3kv6Hmga/jgIINCj4gPiAr5LiA5q615pmC6ZaT5LqG44CC
5LiN6YGO77yM5Zyo6YKj6KOP6YKE5piv5Y+v5Lul5om+5Yiw55u455W25aSa55qE5aW96LOH6KiK
44CCDQo+ID4NCj4gPiAt5pyJ6ZecZ2l055qE5paH5qqU77yM6KuL6Kiq5ZWP77yaDQo+ID4gK+ac
iemXnGdpdOeahOaWh+S7tu+8jOiri+ioquWVj++8mg0KPiA+DQo+ID4gICAgaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9wdWIvc29mdHdhcmUvc2NtL2dpdC9kb2NzLw0KPiA+DQo+ID4gQEAgLTU4LDE2
ICs1NywxNiBAQA0KPiA+ICDntZDoq5YNCj4gPiAgPT09PQ0KPiA+DQo+ID4gLeelneizgOaJgOac
iemAmumBjumAmeevh+WGl+mVt+eahOaWh+aqlOeahOS6uuOAguW4jOacm+Wug+iDveWkoOW5q+WK
qeaCqOeQhuino0xpbnV45YWn5qC45piv5aaC5L2V6ZaL55m855qE77yMDQo+ID4gK+elneizgOaJ
gOaciemAmumBjumAmeevh+WGl+mVt+eahOaWh+S7tueahOS6uuOAguW4jOacm+Wug+iDveWkoOW5
q+WKqeaCqOeQhuino0xpbnV45qC45b+D5piv5aaC5L2V6ZaL55m855qE77yMDQo+ID4gIOS7peWP
iuaCqOWmguS9leWPg+iIh+mAmeWAi+mBjueoi+OAgg0KPiA+DQo+ID4gLeacgOW+jO+8jOmHjeim
geeahOaYr+WPg+iIh+OAguS7u+S9lemWi+a6kOi7n+S7tumgheebrumDveS4jeacg+i2hemBjuWF
tuiyoueNu+iAheaKleWFpeWFtuS4reeahOe4veWSjOOAgkxpbnV4DQo+ID4gLeWFp+aguOeahOeZ
vOWxlemAn+W6puWSjOS7peWJjeS4gOaoo+W/q++8jOWboOeIsuWug+W+l+WIsOS6huWkp+mHj+mW
i+eZvOS6uuWToeeahOW5q+WKqe+8jOS7luWAkemDveWcqOWKquWKm+S9v+Wugw0KPiA+IC3ororl
vpfmm7Tlpb3jgILlhafmoLjmmK/kuIDlgIvmnIDmiJDlip/nmoTkvovlrZDvvIzoqqrmmI7kuobn
lbbmiJDljYPkuIrokKznmoTkurrniLLkuobkuIDlgIvlhbHlkIznmoTnm67mqJnkuIDotbcNCj4g
PiAr5pyA5b6M77yM6YeN6KaB55qE5piv5Y+D6IiH44CC5Lu75L2V6ZaL5rqQ6Luf6auU5bCI5qGI
6YO95LiN5pyD6LaF6YGO5YW26LKi54276ICF5oqV5YWl5YW25Lit55qE57i95ZKM44CCTGludXgN
Cj4gPiAr5qC45b+D55qE55m85bGV6YCf5bqm5ZKM5Lul5YmN5LiA5qij5b+r77yM5Zug54iy5a6D
5b6X5Yiw5LqG5aSn6YeP6ZaL55m85Lq65ZOh55qE5bmr5Yqp77yM5LuW5YCR6YO95Zyo5Yqq5Yqb
5L2/5a6DDQo+ID4gK+iuiuW+l+abtOWlveOAguaguOW/g+aYr+S4gOWAi+acgOaIkOWKn+eahOS+
i+WtkO+8jOiqquaYjuS6hueVtuaIkOWNg+S4iuiQrOeahOS6uueIsuS6huS4gOWAi+WFseWQjOea
hOebruaomeS4gOi1tw0KPiA+ICDlt6XkvZzmmYLvvIzlj6/ku6XlgZrlh7rku4DpurzjgIINCj4g
Pg0KPiA+IC3kuI3pgY7vvIzlhafmoLjnuL3mmK/lj6/ku6Xlvp7mm7TlpKfnmoTplovnmbzkurrl
k6Hln7rnpI7kuK3njbLnm4rjgILnuL3mnInmm7TlpJrnmoTlt6XkvZzopoHlgZrjgILkvYbmmK/l
kIzmqKMNCj4gPiAt6YeN6KaB55qE5piv77yMTGludXjnlJ/mhYvns7vntbHkuK3nmoTlpKflpJrm
lbjlhbbku5blj4PoiIfogIXlj6/ku6XpgJrpgY7niLLlhafmoLjlgZrlh7rosqLnjbvogIzlj5fn
m4rjgILkvb8NCj4gPiAt5Luj56K86YCy5YWl5Li757ea5piv5o+Q6auY5Luj56K86LOq6YeP44CB
6ZmN5L2O57at6K235ZKM5YiG55m85oiQ5pys44CB5o+Q6auY5bCN5YWn5qC46ZaL55m85pa55ZCR
55qE5b2x6Z+/56iL5bqmDQo+ID4gK+S4jemBju+8jOaguOW/g+e4veaYr+WPr+S7peW+nuabtOWk
p+eahOmWi+eZvOS6uuWToeWfuuekjuS4reeNsuebiuOAgue4veacieabtOWkmueahOW3peS9nOim
geWBmuOAguS9huaYr+WQjOaoow0KPiA+ICvph43opoHnmoTmmK/vvIxMaW51eOeUn+aFi+ezu+e1
seS4reeahOWkp+WkmuaVuOWFtuS7luWPg+iIh+iAheWPr+S7pemAmumBjueIsuaguOW/g+WBmuWH
uuiyoueNu+iAjOWPl+ebiuOAguS9vw0KPiA+ICvnqIvlvI/norzpgLLlhaXkuLvnt5rmmK/mj5Dp
q5jnqIvlvI/norzlk4Hos6rjgIHpmY3kvY7ntq3orbflkozliIbnmbzmiJDmnKzjgIHmj5Dpq5jl
sI3moLjlv4PplovnmbzmlrnlkJHnmoTlvbHpn7/nqIvluqYNCj4gPiAg562J55qE6Zec6Y2144CC
6YCZ5piv5LiA56iu5YWx6LSP55qE5bGA6Z2i44CC5ZWT5YuV5L2g55qE57eo6Lyv5Zmo77yM5L6G
5Yqg5YWl5oiR5YCR5ZCn77yb5L2g5pyD6Z2e5bi45Y+X5q2h6L+O55qE44CCDQo+ID4NCj4gPiAt
LQ0KPiA+IDIuNDMuMA0KPiA+DQo+ID4NCg==
