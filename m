Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE32A1519A7
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 02:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143326; cv=none; b=EGZ0SDA+F08Up8Th/EAupWlT5v6YdQuZJvXBNbrS3ZA3QAkPlf9wtVkcykDVsihvRUrGE9g20ESorrkRz4YbWq3wU8XQI6J7XyWdaoiQyn/TdPlwH3/eqT6cxz4hGcTUrHVf3IL3PVUo/ftzokjOyBKCkfM2SmCwJ6zFG7Q4C9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143326; c=relaxed/simple;
	bh=wnEEV0h73ZkfRNcGt0W+7dao/Z1e9874XMf5tANiID0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZtty36Zgz7TMKqb8FA27iWDzxgAhL823R6+CyMj+jU3qpK2QFGNEEBa7qxUEu5SRK8mX5v/t126Aix3E7KdXCHQKIGIfaucoVSjAcEAxq8PK7WzyzBvsriMZYwfuKHRh70KpANaRJeFpbPiujMV8gV3kJ6fA+VKbZbIB0Aj48k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=QNr9fGAT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="QNr9fGAT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e549af4927so4908611a12.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 18:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1741143320; x=1741748120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnEEV0h73ZkfRNcGt0W+7dao/Z1e9874XMf5tANiID0=;
        b=QNr9fGAT52jqNi/1DjFEhCqPD/P1zVsr4RhN1IOg1iAb0bYOyoUNCtgWBa1WiiMNIz
         awN1W7QoxQ9mt/r9Ez1+PENO60qjpKZVq2Z/QjOuCPjfiJ4tipHYRn/xZOehtHpP845k
         9vRxE6qEfrozuOuoH2kRS/vCEfmTJ8ggOLfZeXlyNaLQ5xtKsH2zts7gwwLNUgT2y07B
         JnvBpMZ1iqGjoRPScekT5cIp8AuaWJi4lJKeM4ms+edNMUrtxl0PbLiYSj4tbecM4761
         8Lf0jzMAYTxhK18UJBPjSNQHgGvSQvKoxlNCtNoyvnwik6aNEgRYA+CTun95Oh/avYu/
         MaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143320; x=1741748120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnEEV0h73ZkfRNcGt0W+7dao/Z1e9874XMf5tANiID0=;
        b=tdp3RueUozqF6+SVRrw+1u02Wa89hpRJN/HIe7dc0dG3SrxDOQNX4xlwhydmMjitaa
         YTnSJdLtR2slsf2oIgoIB8iw34nkVcInRta2SpnSH05GiwoiBstcu4uYbxg/cr/pkHXv
         SEESfhJq145gFUw+M3jGGBLhY51kiljwJGF4m0u9JNxUStkLSpz+YnWKqvFaEyVMyq6y
         Uhdx3Vxopz+wokXMOyXyj6cKgzVRAd3+IQIxaU+CYwdwiu2nzYzlRNOB7to/ZV0B8EjG
         vl0Wr5WsXKTk6Ar2AwiA670HEYRWEMhgrAV7eysaPhPLI3ayp6hHRZQ8YqjL+TJvxQW+
         B39A==
X-Forwarded-Encrypted: i=1; AJvYcCXiTVcHJGBXs3m+18Q2A7E4OCrAUk8KbTQmcnFhmrQeLTirzNvqMle+IqExGofRzdVINOHCnpkXsLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqbXfIUvFdoHPCxj2Xk+R9FPt6TF0Q73tsaim7MN+nMNKcokID
	SgBEXlfeHwHSFRmGKgqwi2IGs8/UbgoKvbWwecKnBah1X/LC2LjBv5YOQaeTQahfcSco2m3FkQh
	h21eKRHVTcCTKtQJCtuM1EztXh5dsPFkYox3hvQ==
X-Gm-Gg: ASbGncsbqFBYqAwHTfNfIzWMh0zEhdLcaomTPpyLkBaMUH7VBE7uNXklUiQaHbfE/wK
	ZY5/jBxxf4xnuUSqJWhirtYZMmhoLoWDHMqGSSJiiVgqOdjyUxZLEBR/AWoAxiFN4utw9Lpnwvw
	xTZLsmNtkUYov3szRVeotcbyvs
X-Google-Smtp-Source: AGHT+IFC0JsLuJQNHrGn5BRue8WoEbf9ix4tTRcJlOIeBnYFjo+1r6qYyIDGSfVUJi6PIfcmn/bEPLND+u5mkqILofk=
X-Received: by 2002:a17:906:6a0a:b0:abf:7a80:1a7b with SMTP id
 a640c23a62f3a-ac20d842a46mr133583566b.11.1741143320352; Tue, 04 Mar 2025
 18:55:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305025101.27717-1-alexs@kernel.org>
In-Reply-To: <20250305025101.27717-1-alexs@kernel.org>
From: Tang Yizhou <yizhou.tang@shopee.com>
Date: Wed, 5 Mar 2025 10:55:08 +0800
X-Gm-Features: AQ5f1JouMw792h5IjteS3ae-CQfuStZRPtOJM4MFwobQhrgoA0wny3uTG1YAgws
Message-ID: <CACuPKx=mKk8hd1o60Wv+x+AJHb8Bxu+OsNsW1zfF0J7Maw=1jA@mail.gmail.com>
Subject: Re: [PATCH] docs/Chinese: change the disclaimer words
To: alexs@kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXIgNSwgMjAyNSBhdCAxMDo1MeKAr0FNIDxhbGV4c0BrZXJuZWwub3JnPiB3cm90
ZToNCj4NCj4gRnJvbTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQo+DQo+IDIgcGFyYWdy
YXBoIHdhcm5pbmcgYW5kIG5vdGUgdGFrZSBhIGJpdCBtb3JlIHNwYWNlLCBsZXQncyBtZXJnZSB0
aGVtIHRvZ2V0aGVyLA0KPiBhbmQgZ3VpZGUgdG8gb3RoZXIgbWFpbnRhaW5lciBhbmQgcmV2aWV3
ZXJzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4g
Q2M6IFlhbnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXguZGV2Pg0KPiBDYzogRG9uZ2xpYW5nIE11
IDxkem05MUBodXN0LmVkdS5jbj4NCj4gQ2M6IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5u
ZXQ+DQo+IENjOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGlzY2xhaW1lci16aF9DTi5yc3QgfCA2ICsrLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rpc2NsYWltZXIt
emhfQ04ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGlzY2xhaW1lci16
aF9DTi5yc3QNCj4gaW5kZXggM2M2ZGIwOTRhNjNjLi41YTA0MTRlZWZhMDEgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rpc2NsYWltZXItemhfQ04ucnN0
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rpc2NsYWltZXItemhf
Q04ucnN0DQo+IEBAIC0xLDkgKzEsNyBAQA0KPiAgOm9ycGhhbjoNCj4NCj4gLS4uIHdhcm5pbmc6
Og0KPiArLi4gbm90ZTo6DQo+ICAgICAgIOatpOaWh+S7tueahOebrueahOaYr+S4uuiuqeS4reaW
h+ivu+iAheabtOWuueaYk+mYheivu+WSjOeQhuino++8jOiAjOS4jeaYr+S9nOS4uuS4gOS4quWI
huaUr+OAgiDlm6DmraTvvIwNCj4gICAgICAg5aaC5p6c5oKo5a+55q2k5paH5Lu25pyJ5Lu75L2V
5oSP6KeB5oiW5pu05paw77yM6K+35YWI5bCd6K+V5pu05paw5Y6f5aeL6Iux5paH5paH5Lu244CC
DQo+IC0NCj4gLS4uIG5vdGU6Og0KPiAgICAgICDlpoLmnpzmgqjlj5HnjrDmnKzmlofmoaPkuI7l
jp/lp4vmlofku7bmnInku7vkvZXkuI3lkIzmiJbogIXmnInnv7vor5Hpl67popjvvIzor7fogZTn
s7vor6Xmlofku7bnmoTor5HogIXvvIwNCj4gLSAgICAg5oiW6ICF6K+35rGC5pe25aWO5Lqu55qE
5biu5Yqp77yaPGFsZXhzQGtlcm5lbC5vcmc+44CCDQo+ICsgICAgIOaIluiAheivt+axguS4reaW
h+aWh+aho+e7tOaKpOiAheWSjOWuoemYheiAheeahOW4ruWKqeOAgg0KDQpSZXZpZXdlZC1ieTog
VGFuZyBZaXpob3UgPHlpemhvdS50YW5nQHNob3BlZS5jb20+DQoNClRoYW5rcywNCllpDQoNCg0K
PiAtLQ0KPiAyLjQzLjANCj4NCj4NCg==
