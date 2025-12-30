Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78557327C12
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767113952; cv=none; b=OwuBZNRkJxDnBWriOKNVoBSlnNjhdzcwgDWER/P48jYgGXTG6t5ZQRAvlKkx+QGZ8MvkWYdb7I6mcjQzsr0fG6DgYao9+2ghd9Jyd8K/3aTefD/Uin7CRpGJSmtuLaWIAfnTBHynT2yNVonS2Lq7EOiTHeYguJTgEPu7sWalbi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767113952; c=relaxed/simple;
	bh=dDbdKs/reOX/Ro2QQ4y9yDKHfgrv3HPQ+5tuYEjKOfs=;
	h=From:Message-ID:Date:MIME-Version:To:Cc:References:Subject:
	 In-Reply-To:Content-Type; b=t/6mjBxd3vjf8YXg9jwDhO5pdticuicotNyDTQfc1uemaHSk5n3pebbfqHGKgAukQpw+/g54rzUljfimFzGYOxV2HfW8bzXZNpjuUZsHS0BGvoRf3771R0GyDtldJnEtIPv5pjFKR5tqYvw6DKhRrYpa6BQbMnsIHQ+aNsH6tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mObP838C; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mObP838C"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6442e2dd8bbso6998220d50.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767113949; x=1767718749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=mObP838COeOIAJUbmTPK9sw7/T4Ndssv8TsfvBW4HYyw6+dYL9Lu0pLsRfHWXC51jQ
         BTpL+u4VgJHhT+mc6lECd/G1WtTV0WCh92LaK8TOPE+3CH2yOQUp/G8uTEL5GWRudQjA
         ffKFje0GDhn1ua3bnmrdGnIsjrbJ3bzEqX/kC9rbCDdvaEp2r/bUd0zdoz3WVlU8lng7
         fkBvfBc/oBD7k4pvWcrl4wVZy3ZTSWFnjn4WxyCl15ndYZwskbonriRNmzI+YjZR2BYh
         GRyjo+R28f+cmVqEFgi2+mERaMEWPX9WzfrBvU7hC7eExtMWKi+3Fx3fyB22MnHGU3nc
         LCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767113949; x=1767718749;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=Y15VA5A29GYWAUYBYeOAQStgf80hlnKUqz7S0ctN4rwyqs4U1wOndg2i4apIUf+FGY
         l2OFnrKZNzxtraGI/pQqf17S0HO30P6NImlnFVFgEDEHJ4nnL6gnvIlrtFwmAEzJ/5K7
         1ascGLcSTu/CJCRhSEsrAzN06zVt6MEIjE5qV4i/TCuwo29dmpJsci3DXOhKRDw5hvLi
         qBbk1Y/vbK1Ed2VT/gyRKtNygs8fOictKe8RHx10SzW3iyu98MN46if1yxgi9PBgiEwD
         CJD5oQSnrk8vn4MkiyOsNTRp2AawhfuAqvH7jrI3GLmU3ZYSIOv5Fb3W9v5MwDhDe6Zh
         Mvqg==
X-Forwarded-Encrypted: i=1; AJvYcCViGAAPinYr2hyMC4EwK099wtPpcZnzLxh+G8QFkmR7HIKvwt8o2mCuC22aLPWqZC04EES/TcSWxFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvYF6CveRgAy1LJiHlmjuHqAnDGVunhYED5ytwF0q+dlkvovcv
	UQHOiNDnt2Vy6dBh61wLbLdMRCje9mIk35nOZByn7BlmysznTqzg3av4
X-Gm-Gg: AY/fxX6ciXo9m/+9n+CoI7Rgp3CQc5ZBvsyQPBkeInNo2eQ9q44XrqkqtpgygKayNmw
	hI7KwC5vjJu62dnAjU6jJun5iLFV8gQ2OUmwiU1UL4oFZAQLH56l9BF2Hx3Ajr+05y2e2quWDI6
	2hgU+qKwTwXZ7amKiWSAV/69viWXImh20thwjJxRQYEbRk4lyyKJemwRmfF5poFoqeu57iOwMXf
	IKe0WYGQ0FlyVcKQn+Z/QfoXNA3chT9ZjwmJWNWWeDc6ZROJrm24uzY+l/OC+L7ddgkJ7Sk2x5D
	d3+Q0uWuznC+Ci9ApnmXSga7ZAaouOrwHa2ZSzwYYm9giEF4gufQyzKI15HpITDUqlmh6DR6ZqB
	ByOuUO0mXd1wx3HhNSyC5IZx7A799vz8f7gOqYw6XjjYPupqhuyO72nKiCkIY0Q5/uYH2R2p0mk
	d4N2dE3p+awh4aTaFin6dLfj34HjKu9kILbiOmnSoC
X-Google-Smtp-Source: AGHT+IH2V57ZyrIGYmhMfY0baEpBO+dBiOAau3e5WvXJCMGvc5QlBIWU/5RRYx65BeBxQ6CEQap2dA==
X-Received: by 2002:a05:690e:12c9:b0:636:149a:f54e with SMTP id 956f58d0204a3-6466a8a5c84mr29092072d50.37.1767113948961;
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
Received: from [192.168.1.209] (74.211.98.217.16clouds.com. [74.211.98.217])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a92d913sm16230434d50.20.2025.12.30.08.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <f462b3e9-0650-4d5f-ad60-96e8f1e39419@gmail.com>
Date: Wed, 31 Dec 2025 00:58:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xinrui.riscv@isrc.iscas.ac.cn
Cc: a.hindborg@kernel.org, alex@ghiti.fr, aliceryhl@google.com,
 aou@eecs.berkeley.edu, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 conor@kernel.org, corbet@lwn.net, dakr@kernel.org, gary@garyguo.net,
 jeffbai@aosc.io, jmontleo@redhat.com, justinstitt@google.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, lossin@kernel.org, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nsc@kernel.org,
 ojeda@kernel.org, palmer@dabbelt.com, pjw@kernel.org, rabenda.cn@gmail.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu, wangruikang@iscas.ac.cn
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Content-Language: en-US
In-Reply-To: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am replying using my previous personal email address to cross-verify 
that <xinrui.riscv@isrc.iscas.ac.cn> is indeed my own.
