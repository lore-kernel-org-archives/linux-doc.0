Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3EA95C
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 05:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736227410; cv=none; b=iuHDrWrZrSKfxpPC8J0jSpXh6exC3SeHrion9a9ND+2Pb9612vdSefoIMg6qQRhRkLDUesEEqisXiy+Gq0tFyy/IArUg7WOyvQpnuYmp1MthEqe9MOgyGFy1K3jTX6+BYG/iIOxCNUvrK8z4UHa0yFVx9K88OaHXRZxswTGIdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736227410; c=relaxed/simple;
	bh=wdWmilVXnMndL0Gzkc7codCOqwtxBrXULFKGgz3TNQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rehP/BOZIFTsqpf+84pU8pLTbrciZwv5LaZzJpxljIZpuHtqxwmxgrkLzXAcF8spqeA2o8GntrQTHPcgji8WBuWCE0FYMY/ceB9Qbw69026qPtj/X5aJNFWlDwf+eVGtAzhVjzSCzV1U9yCPPq8X3sSUlWVCXMhHb5Ii1Qqu5zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1sw+AJ5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1sw+AJ5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so20509463a12.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 21:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736227404; x=1736832204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdWmilVXnMndL0Gzkc7codCOqwtxBrXULFKGgz3TNQQ=;
        b=N1sw+AJ5K+w2Qq0A9pFEgNnfTskVKHcCQP/gB81YBByJU7xxd5rFI9hR9fsJ49ENHz
         wt56oZ7kKhWAjYrJuBvu9ghXalTxS82oj9gM65II8YxTAim6DRFoDyGrfyluWvKR4H4b
         qCL6QrU+qrGQjkNVucIFgI7CLZu0/D6u57IdnjhiDi5154snKiiI3GLgw/fFV9uVdEs+
         qAgl6xsUv8/JTpL3Awr/H7DGesemzVsnN1hNW6A684o/AS55F+Wjf7DOXK6CgLf318By
         ehdOgCW6BoI4JPx8DKGYJX3UWGzpo4ItpWKB3clhNa70BOu9nQdwT7Fs9xoT5BhDVLGp
         kqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736227404; x=1736832204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdWmilVXnMndL0Gzkc7codCOqwtxBrXULFKGgz3TNQQ=;
        b=jAfQSlNVsqDJTwjEkEimwTxMjTHUXCt7Ou7HKyu/CJPwuckKwcjytXeCDMUiGS9OIL
         DDhpW5Ax4o04F7gx0yHgXCVRIvq9B1/qA5nf3PQv2ZZTWYQtuv0VU5W65CXXmUse91wy
         hZYyG07k3RfDNpHSTYlPA9krWMq1lzxBrzbzdfdPXsmYJHC2j4hh4+dT1dp1TGspMLWB
         SRU8M5wUJSH9Va08Usj1mv+MlzAoZ3SMRIWArTG8FeUvYWOxlwat1H6QzxdX+vmlZqoG
         PiSaAxf7JIYqDrhr/Y0EZvIq5SuUeMHIjkxclwQezvi/mL+Byb0OCzF2IUHn+iYgf8Ux
         9+hw==
X-Forwarded-Encrypted: i=1; AJvYcCURDphxC78IPa1cNE8t7kDQo9ijR4PtOQTs5MSywW7FaF5MLg+TUHr7MXSCQbZ/pv8ZQzrGRnM6hJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl1QKIXfkeXNAp1dM5Ig+bEBeDVNBkPstUZJHDB/vuk0fbo1Fz
	uFwovxfRSjYG08rOaZqbi29JK3HOYFWpvlaDpDZqhXktvnr6rBGw/kZun47y1IYy8uQmOseEHRK
	IkPUCsXtQswqyGGb0WBhJlB4MeTk=
X-Gm-Gg: ASbGncv9cjAQ5YvSQCP/aNdGw4a6LEx/43aiHozQeiUCe5YGfVykWrDB3JgzaONHLki
	t+6g9Jc7IwuojweKGXUBj6DNyXo7GsSv8M7TguA==
X-Google-Smtp-Source: AGHT+IHmNPOKyFWztmUjFjUDTNtVct+Pblg2KPpIUyEeC8P9PKRQYb8t3iu+r8lKH43kKEwoPgxrHyrQI8mlwdf8uqE=
X-Received: by 2002:a17:907:3f12:b0:aa6:7220:f12f with SMTP id
 a640c23a62f3a-aac2ad8abccmr6522898966b.18.1736227404182; Mon, 06 Jan 2025
 21:23:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103061547.20947-1-zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <20250103061547.20947-1-zhaoshuo@cqsoftware.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 7 Jan 2025 13:22:46 +0800
Message-ID: <CAJy-AmmhXThUa3yU4Rc_o8abP06E8MypKTdrcZv6U8Z6A9co-g@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add security credentials Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

U2h1byBaaGFvIDx6aGFvc2h1b0BjcXNvZnR3YXJlLmNvbS5jbj4g5LqOMjAyNeW5tDHmnIgz5pel
5ZGo5LqUIDE0OjE15YaZ6YGT77yaDQo+DQouLi4NCg0KPiArDQo+ICsgMy4g5a6i6KeC5LiK5LiL
5paHDQo+ICsNCj4gKyAgICAgICAg5q2k5aSW5Zyo6L+Z5Lqb5a+56LGh55qE5Yet5o2u5Lit77yM
5bCG5pyJ5LiA5Liq5a2Q6ZuG6KGo56S65a+56LGh55qE4oCc5a6i6KeC5LiK5LiL5paH4oCd44CC
DQo+ICsgICAgICAgIOi/meWPr+iDveS4ju+8iDLvvInkuK3nm7jlkIzvvIzkuZ/lj6/og73kuI3l
kIwg4oCU4oCUIOS+i+Wmgu+8jOWcqOagh+WHhueahFVOSVjmlofku7bkuK3vvIwNCj4gKyAgICAg
ICAg6L+Z5piv55Sx5qCH6K6w5Zyo57Si5byV6IqC54K55LiK55qEVUlE5ZKMR0lE5a6a5LmJ55qE
44CCDQo+ICsNCj4gKyAgICAgICAg5a6i6KeC5LiK5LiL5paH5piv6L+b6KGM5a6J5YWo6K6h566X
55qE5LiA6YOo5YiG77yM5b2T5a+56LGh6KKr5pON5L2c5pe25Lya55So5Yiw44CCDQo+ICsNCg0K
Li4uDQoNCj4gKw0KPiArIDUuIOS4u+inguS4iuS4i+aWhw0KPiArDQo+ICsgICAgICAgIOS4u+S9
k+WvueWFtuWHreaNruacieS4gOS4qumineWklueahOino+mHiuOAguWFtuWHreaNrueahOS4gOS4
quWtkOmbhuW9ouaIkOS6huKAnOS4u+inguS4iuS4i+aWh+KAneOAguS4u+ingg0KPiArICAgICAg
ICDkuIrkuIvmloflnKjkuLvkvZPmiafooYzmk43kvZzml7bkvZzkuLrlronlhajorqHnrpfnmoTk
uIDpg6jliIbkvb/nlKjjgIINCj4gKw0KPiArICAgICAgICDkvovlpoLvvIxMaW51eOS7u+WKoeWc
qOaTjeS9nOaWh+S7tuaXtuS8muaciUZTVUlE44CBRlNHSUTlkozpmYTliqDnu4TliJfooagg4oCU
4oCUIOi/meS6m+WHreaNrg0KPiArICAgICAgICDkuI7pgJrluLjmnoTmiJDku7vliqHnmoTlrqLo
p4LkuIrkuIvmlofnmoTnnJ/lrp5VSUTlkoxHSUTmmK/nm7jkupLni6znq4vnmoTjgIINCj4gKw0K
DQpBbnl3YXksIEknbSBzdGlsbCBjb25mdXNlZCBvbiB0aGUg5a6i6KeCIGFuZCDkuLvop4IgY29u
dGV4dCwgdHJhbnNsYXRpb24uIElzDQppdCBiZXR0ZXIgdG8gdXNlDQrlr7nosaHkuIrkuIvmlofv
vIwg5Li75L2T5LiK5LiL5paH77yfDQpObyBpZGVhLg0K
