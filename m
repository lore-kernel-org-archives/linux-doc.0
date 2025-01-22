Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB732AD11
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 02:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737511724; cv=none; b=Tk3sYfhfdHZgbh81HH9WTYaKqMEiuPc23zOgnxWCHoi9eFML1JXwAez6CWYD+ehK+jGv9MKT81Fw9YmeqHlWlui3BLfmBnsw6Q3Ha6LRfxtI1nHleuFD4Zq3nyMJtOk99rFz96AcxLU5WYF1v4D+v2qlGcAJJNqJHYSXVZjm5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737511724; c=relaxed/simple;
	bh=c3fJLcViPJmH6asznYPHSEtMLpprBJMPuSPH6KvLXfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcN/AxpyBzxmiAAWlqsJEwhoqKMuAekme6jJ6PFMOO+f/1o7K8j/BDcBMClkw4yhRFvRkUB6xr0Ia93vruPNrUmy1MnBEiFRMRlFW8KJx/VzxMv5u8FiYJYflLFoLk+JzFGnZjGSte34LczmXfWgu7zQu2OtUOl0/vR4LNCCbh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMMUKQyy; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMMUKQyy"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab2aea81cd8so1073582066b.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 18:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737511720; x=1738116520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3fJLcViPJmH6asznYPHSEtMLpprBJMPuSPH6KvLXfc=;
        b=OMMUKQyyxjcve/LG3wWKUKzte00PngEKbpGAWRHoCZHVzE+/GI6dk4k72n4ViPIYBG
         Xz3UKs0AOHcsG6WD2CUD/EKt9U8XEZG9VT2h1/1hBu+W4/UK2GHy7LezNYKC/2MFtq1X
         +bEKZGD8U/8PVp3K0fsCTeLPKs+eCZrcqooctnNoLyaBNCGm2SotMV5Pxg/YJxXGXffx
         VSLVzbWiCRt0TBWWL1l2MTHlfKBSA1pDuj+TPbZdCwIrbpZHoqJ5G6A7WwDI8kRrNOJC
         AxYcrXULYHgqU4yxt9hk2w20O4yvmI3d5Sl5AUn/LB33CACfCMFboOqwfq0dDdXmBvMI
         bEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737511720; x=1738116520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3fJLcViPJmH6asznYPHSEtMLpprBJMPuSPH6KvLXfc=;
        b=lq6lx0G03niRCBpCa7AUZFsZTDn+lUwfetYf7wwKYVcPGAy1v0HSlM4qDvqxwlLdC3
         3NMAVbasEm7bweH0zrhY6NpRvLrNFTFoQPCCDjJgpLMAgMUn1gAn1BRWqJm11nRhSB82
         jUCWMx1q1jUbavVW3L0Lp4NPrx6/d3ssA6qXIWdZODaQbbnl98QEEazG/F0bJwLVQvO1
         X4+masx11XO4vh+2h65rFW3WlroVsjheu+E5/V9raUpEcmW6kzpgVCJ4Bay3sh82EnLo
         3fvG/9DegunngPIwJ2mhulgHr/2h8PjQF8xgms5XzEcnSFfxgeWZYMUIT07mRFYLdvZO
         HobQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbbwml6QBHuXcU/vzlAvC48MvykZde73QOU4MlaJdzsPe6CeTpvvg3oYp+FSVpEpDQlS5MJSyxsXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxRhnj1YmhqN2l0TKnYISz0fmxoLB3eLriXrUybYJ8Y3tgK0Xb
	3rTCUCHNqXyzwEFYeUanECDVUwpwfOelAcIJAycGB5FBTkXVIShaLXF8iqBbspYZuB+PUTggPqW
	owYjl7SWMW/7d9SRA7myUwq89ROU=
X-Gm-Gg: ASbGncsw+3eO18Cr+st94BJ161Uj/8ZziPqzKd2PqqONiJDGlqJXuL/04LoSoyyqFX+
	6YC4tdZp7YIGqlCkwmHuWAdxdnr4Ectnm7aOE88kUoHeY/g0KXXI=
X-Google-Smtp-Source: AGHT+IG/rjGkYBN0qEoEUaevmapzcCEbHpv5Tg4gbjxMRYaoXc7CBRHtglOIMn5JoZA1GDONfkWhss1ILSMlAKmxj10=
X-Received: by 2002:a17:907:969f:b0:aa6:8dcb:365c with SMTP id
 a640c23a62f3a-ab38b3ce55fmr2149329166b.49.1737511719790; Tue, 21 Jan 2025
 18:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn> <b5ab071a6869a52c5ef16fb96d710b80cfef96a4.1737354981.git.zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <b5ab071a6869a52c5ef16fb96d710b80cfef96a4.1737354981.git.zhaoshuo@cqsoftware.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 22 Jan 2025 10:07:59 +0800
X-Gm-Features: AbW1kvZ3tmjTK_zC6ISQXtGNEPvnViFiA9B4RVishnEiu7g5oy6AS1kbeKcBu6c
Message-ID: <CAJy-Am=FTNX37C1e-wmEf83T0YfdtaT-ZQKCfV6oU5fU3Knbjg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] docs/zh_CN: Add tpm tpm_ftpm_tee Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

VHJhbnNsYXRpb24gbG9va3MgZ29vZCBmb3IgbWUuDQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8
YWxleHNAa2VybmVsLm9yZz4NCg0KU2h1byBaaGFvIDx6aGFvc2h1b0BjcXNvZnR3YXJlLmNvbS5j
bj4g5LqOMjAyNeW5tDHmnIgyMOaXpeWRqOS4gCAxNDo1NuWGmemBk++8mg0KPg0KPiBUcmFuc2xh
dGUgLi4uL3NlY3VyaXR5L3RwbS90cG1fZnRwbV90ZWUucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4g
VXBkYXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCBlOGJkNDE3YWFiMGMNCj4gKCJ0
cG0vdHBtX2Z0cG1fdGVlOiBEb2N1bWVudCBmVFBNIFRFRSBkcml2ZXIiKQ0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBTaHVvIFpoYW8gPHpoYW9zaHVvQGNxc29mdHdhcmUuY29tLmNuPg0KPiAtLS0NCj4g
IC4uLi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvdHBtL2luZGV4LnJzdCB8ICA0ICstLQ0K
PiAgLi4uL3poX0NOL3NlY3VyaXR5L3RwbS90cG1fZnRwbV90ZWUucnN0ICAgICAgIHwgMzEgKysr
KysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3NlY3VyaXR5L3RwbS90cG1fZnRwbV90ZWUucnN0DQo+DQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS90cG0vaW5kZXgu
cnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvdHBtL2luZGV4
LnJzdA0KPiBpbmRleCBiZjk1MjAwY2E1ODYuLjcwNzY0NjU5MDY0NyAxMDA2NDQNCj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvdHBtL2luZGV4LnJzdA0K
PiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS90cG0vaW5k
ZXgucnN0DQo+IEBAIC0xNyw2ICsxNyw0IEBADQo+ICAgICB0cG1fdGlzDQo+ICAgICB0cG1fdnRw
bV9wcm94eQ0KPiAgICAgeGVuLXRwbWZyb250DQo+IC0NCj4gLVRPRE9MSVNUOg0KPiAtKiAgIHRw
bV9mdHBtX3RlZQ0KPiArICAgdHBtX2Z0cG1fdGVlDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS90cG0vdHBtX2Z0cG1fdGVlLnJzdCBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L3RwbS90cG1fZnRwbV90ZWUu
cnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTkwMWVl
ZTMyNTYzDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vc2VjdXJpdHkvdHBtL3RwbV9mdHBtX3RlZS5yc3QNCj4gQEAgLTAsMCArMSwzMSBA
QA0KPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy4uIGluY2x1ZGU6
OiAuLi8uLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50
YXRpb24vc2VjdXJpdHkvdHBtL3RwbV9mdHBtX3RlZS5yc3QNCj4gKw0KPiArOue/u+ivkToNCj4g
KyDotbXnoZUgU2h1byBaaGFvIDx6aGFvc2h1b0BjcXNvZnR3YXJlLmNvbS5jbj4NCj4gKw0KPiAr
PT09PT09PT09PT0NCj4gK+WbuuS7tlRQTempseWKqA0KPiArPT09PT09PT09PT0NCj4gKw0KPiAr
5pys5paH5qGj5o+P6L+w5LqG5Zu65Lu25Y+v5L+h5bmz5Y+w5qih5Z2X77yIZlRQTe+8ieiuvuWk
h+mpseWKqOOAgg0KPiArDQo+ICvku4vnu40NCj4gKz09PT0NCj4gKw0KPiAr6K+l6amx5Yqo56iL
5bqP5piv55So5LqOQVJN55qEVHJ1c3Rab25l546v5aKD5Lit5a6e546w55qE5Zu65Lu255qE6YCC
6YWN5Zmo44CC6K+l6amx5YqoDQo+ICvnqIvluo/lhYHorrjnqIvluo/ku6XkuI7noazku7ZUUE3n
m7jlkIznmoTmlrnlvI/kuI5UUE3ov5vooYzkuqTkupLjgIINCj4gKw0KPiAr6K6+6K6hDQo+ICs9
PT09DQo+ICsNCj4gK+ivpempseWKqOeoi+W6j+WFheW9k+S4gOS4quiWhOWxgu+8jOS8oOmAkuWR
veS7pOWIsOWbuuS7tuWunueOsOeahFRQTeW5tuaOpeaUtuWFtuWTjeW6lOOAgumpseWKqA0KPiAr
56iL5bqP5pys6Lqr5bm25LiN5YyF5ZCr5aSq5aSa6YC76L6R77yM5pu05YOP5piv5Zu65Lu25LiO
5YaF5qC4L+eUqOaIt+epuumXtOS5i+mXtOeahOS4gOS4queuoemBk+OAgg0KPiArDQo+ICvlm7rk
u7bmnKzouqvln7rkuo7ku6XkuIvorrrmlofvvJoNCj4gK2h0dHBzOi8vd3d3Lm1pY3Jvc29mdC5j
b20vZW4tdXMvcmVzZWFyY2gvd3AtY29udGVudC91cGxvYWRzLzIwMTcvMDYvZnRwbTEucGRmDQo+
ICsNCj4gK+W9k+mpseWKqOeoi+W6j+iiq+WKoOi9veaXtu+8jOWug+S8muWQkeeUqOaIt+epuumX
tOaatOmcsiBgYC9kZXYvdHBtWGBgIOWtl+espuiuvuWkh++8jOWFgeiuuA0KPiAr55So5oi356m6
6Ze06YCa6L+H6K+l6K6+5aSH5LiO5Zu65Lu2VFBN6L+b6KGM6YCa5L+h44CCDQo+IC0tDQo+IDIu
NDcuMQ0KPg0K
