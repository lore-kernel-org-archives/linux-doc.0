Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0341E522A
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 05:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736226607; cv=none; b=JMI/rfDQpSEJp6/42mITDjYkoMXA/ABKE2ALXf1+xYqtEXX3ivsvC2iH6PQAo9/p24IpOIZtNVYY4vRLy8nGZAdHzoFZPq7Nw1KQFRBW8KVCC+jOxHYVWTHD2rgwbP+A4t4UtvlTtHgimgGRObe225Qjt6lvzVrqxfXnGXXWeiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736226607; c=relaxed/simple;
	bh=Boe9EbF8DhWCUd/5Yqun9OZMpqjrezfYhtmjmKpIXyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ai7Y46AolvAqp2CIDI6JQsKycittVn8mDw18A2enPspA5RIz8M3Ukoo6tpxE+9dLccdOhRwwzkCGqfgzY7YV3+5PTSmT3cLppQ/pcbZMSSXQHss+Uior5TojVhmBbmUV4WaOo2tBbjkOpkoLVXYULN1UeuonszmTOD8vux7+eD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCgziLCP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCgziLCP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaeef97ff02so1879309966b.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 21:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736226602; x=1736831402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Boe9EbF8DhWCUd/5Yqun9OZMpqjrezfYhtmjmKpIXyk=;
        b=GCgziLCPCVghtAVvFqKINfqEXp0ZrWFofgfGKRs8YExITXPj4CmqShVPOit5fkCL9G
         Wo86RHVy4UMr+fYzTd+3ECIVvwAHFe99G7SlLkeCmAhOvrsoa7ncPjul0c9FzkRvl8Xf
         kLokDztVZdVYrMQgDN/26I5k441g1ZCDBcsXMocWcEgnrxOC8ePXe/6OjMZl0I/ju9gz
         wxH64Giq/JDiUgjNFZT/4FaAE1VHp1EzSQaNFm3+3L6U8YP8E9ML33S7j0gUT4HYIfnB
         MjpV8TMqkQvzraXJbDPBljlQvewid5V5SD9NNltCufaxoblaq3qYYmcAAzDMjKUIFuvA
         ryvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736226602; x=1736831402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Boe9EbF8DhWCUd/5Yqun9OZMpqjrezfYhtmjmKpIXyk=;
        b=icWZsAJqVEYTU/LQd0/wks6vmoqgbtzljbq0iZHmJnCUEEIQFex+FrW04ZxI0PEiI+
         SYxCHeLuqnespKvJnCoZf4Az9g2TH3e6orxZ2AVcYh3hdxYjQrNH1PE/6nynNT7ARSIK
         RrWe5po24lKtZkFrZDjrTFkKea9lMKElFGd5IabDXxuILh1RMaKew7rYvLE5srQeBvzm
         eX0/a6enWyH1t9kZd08dVrObvkHrB78pziEMeGu7chHC/Zsz8NJ/yEf4Zr6eQxVD67s6
         +Nx5L8vjzAH1r6lnJPPHjbdZneVEhGxHjvYBozQBBls+chi2ErOdfDZDWvX9KEhwbWLK
         u59Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3OOCh+JgLKhhIMowfTxVIJi2Is9D4g0SatVw5owXNWa3mp3cVg5eucDILTScIQOwzubG9JzfetUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywCvRN5NMVu99/Giz1MwRsBsMI7K//hLAMiYz9EvoqcnGGuTuS
	/U4OqFgUpKZ+jdFhYdkwuFGLCIn3rX5Vwdmoo849U2PgdvU/9WI076mP4XHNOcnrlVgVXG4uPMf
	38MCUm2ZQLVf4Htg/FBGbP/cSP857Tp36mX0=
X-Gm-Gg: ASbGncv0QlEjUUDZD3cYlX5p8tZgJJXwmg77zghmO2fkElc+t6E6Bk8d4z6KPTHY4Hr
	fSl/uJNcYkZjhdpfG3kQFjd+ldl1HZj56XYQt6w==
X-Google-Smtp-Source: AGHT+IHII5yC7TrQZfB2liSrQFj6qy3bOUfztrQtWLVGPbKUsgUE4hBLKHmQWdL7/H7WBK97sMvsHQ1T5co+9BpAhpA=
X-Received: by 2002:a17:907:d9e:b0:aa6:79fa:b486 with SMTP id
 a640c23a62f3a-aac345f5b2emr4785407966b.49.1736226602014; Mon, 06 Jan 2025
 21:10:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106055744.20840-1-zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <20250106055744.20840-1-zhaoshuo@cqsoftware.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 7 Jan 2025 13:09:25 +0800
Message-ID: <CAJy-Am=D_vJ4C4jQmU3g8j4xD2=vHXPOEwLLtzn+FgfWwipzag@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add security credentials Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

U2h1byBaaGFvIDx6aGFvc2h1b0BjcXNvZnR3YXJlLmNvbS5jbj4g5LqOMjAyNeW5tDHmnIg25pel
5ZGo5LiAIDE0OjMz5YaZ6YGT77yaDQo+DQo+IFRyYW5zbGF0ZSAuLi4vc2VjdXJpdHkvY3JlZGVu
dGlhbHMucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gVXBkYXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJv
dWdoIGNvbW1pdCBjZjkyZWM2MDJhYzUNCj4gKCJEb2N1bWVudGF0aW9uOiByZW1vdmUgY3VycmVu
dF9zZWN1cml0eSgpIHJlZmVyZW5jZSIpDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFNodW8gWmhhbyA8
emhhb3NodW9AY3Fzb2Z0d2FyZS5jb20uY24+DQo+IC0tLQ0KPg0KPiB2MjoNCj4NCj4gTW9kaWZ5
IHNvbWUgZm9ybWF0dGluZyBhbmQgdHJhbnNsYXRpb24uDQo+DQo+ICAuLi4vemhfQ04vc2VjdXJp
dHkvY3JlZGVudGlhbHMucnN0ICAgICAgICAgICAgfCA0NzkgKysrKysrKysrKysrKysrKysrDQo+
ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L2luZGV4LnJzdCAgICAgfCAgIDIgKy0N
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNDgwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1
cml0eS9jcmVkZW50aWFscy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L2NyZWRlbnRpYWxzLnJzdCBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L2NyZWRlbnRpYWxzLnJzdA0KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmI0MmI4NmY5NjA3OA0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5
L2NyZWRlbnRpYWxzLnJzdA0KPiBAQCAtMCwwICsxLDQ3OSBAQA0KPiArLi4gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NO
LnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vc2VjdXJpdHkvY3JlZGVudGlh
bHMucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsg6LW156GVIFNodW8gWmhhbyA8emhhb3NodW9A
Y3Fzb2Z0d2FyZS5jb20uY24+DQo+ICsNCj4gKz09PT09PT09PT09PT0NCj4gK0xpbnV45Lit55qE
5Yet5o2uDQo+ICs9PT09PT09PT09PT09DQo+ICsNCj4gK+S9nOiAhTogRGF2aWQgSG93ZWxscyA8
ZGhvd2VsbHNAcmVkaGF0LmNvbT4NCj4gKw0KPiArLi4gY29udGVudHM6OiA6bG9jYWw6DQo+ICsN
Cj4gK+amgui/sA0KPiArPT09PQ0KPiArDQo+ICvlvZPkuIDkuKrlr7nosaHlr7nlj6bkuIDkuKrl
r7nosaHov5vooYzmk43kvZzml7bvvIxMaW51eOaJp+ihjOeahOWuieWFqOajgOafpeWMheWQq+WH
oOS4qumDqOWIhu+8mg0KPiArDQo+ICsgMS4g5a+56LGhDQo+ICsNCj4gKyAgICAg5a+56LGh5piv
5Y+v5Lul55u05o6l55Sx55So5oi356m66Ze056iL5bqP5pON5L2c55qE57O757uf5Lit55qE5a6e
5L2T44CCTGludXjlhbfmnInlpJrnp43lj6/mk43kvZwNCj4gKyAgICAg55qE5a+56LGh77yM5YyF
5ous77yaDQo+ICsNCj4gKyAgICAgICAtIOS7u+WKoQ0KPiArICAgICAgIC0g5paH5Lu2L+e0ouW8
leiKgueCuQ0KPiArICAgICAgIC0g5aWX5o6l5a2XDQo+ICsgICAgICAgLSDmtojmga/pmJ/liJcN
Cj4gKyAgICAgICAtIOWFseS6q+WGheWtmOautQ0KPiArICAgICAgIC0g5L+h5Y+36YePDQo+ICsg
ICAgICAgLSDlr4bpkqUNCj4gKw0KPiArICAgICDmiYDmnInov5nkupvlr7nosaHnmoTmj4/ov7Dn
moTkuIDpg6jliIbmmK/kuIDnu4Tlh63mja7jgILpm4blkIjkuK3nmoTlhoXlrrnlj5blhrPkuo7l
r7nosaHnmoTnsbvlnovjgIINCj4gKw0KPiArIDIuIOWvueixoeaJgOacieadgw0KPiArDQo+ICsg
ICAgIOWkp+WkmuaVsOWvueixoeeahOWHreaNruS4reS8muacieS4gOS4quWtkOmbhueUqOadpeih
qOekuuivpeWvueixoeeahOaJgOacieadg+OAgg0KPiArICAgICDov5nnlKjkuo7otYTmupDkvJro
rqHlkozpmZDliLbvvIjlpoLno4Hnm5jphY3pop3lkozku7vliqHotYTmupDpmZDliLbvvInjgIIN
Cg0KYWNjb3VudGluZyBtYXkgdXNlIOaguOeulyBmb3IgYmV0dGVyPw0Kb3RoZXJzIGxvb2tzIGdv
b2QgZm9yIG1lLg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0K
