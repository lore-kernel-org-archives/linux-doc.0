Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792786717;
	b=Pa06bT4+e+1snjbVoYqN5y1y98VCZpicd0EcsOOoXwmkDk5T+pSvDQa/mI2oH8kR8F2C
	 XuVe/uzwhe9lcFKkSCN5s4EFJiVGK818rDEwHMsdVIN/fQ65iTfZLxx0KZ8iy+chP6szm
	 n2ZG1JiwROiUvmRise0+Ge68kHKO1KWBfIBRGdJM82hby3kMVyq1hEgVIt6sCg6oG5ISr
	 S0RUfxdVtvquF4iaf+N/VlHG9Yf3/jdV91u2hewloTz18hclXLV3zeoQu9zOE5nct20PA
	 D4rAAwnpa3Hw3J62b6sc+QDTZ86fa3e3oe/9eNcRpS3/2ztzHEyeXP4suCoQ8aQn6JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XhM9OcXLuX0xqWWgIEsWYnSsV/Ip1IVt2dJP6Z55uh8=;
	b=tIFo6C0jxwwmy+HqCAdBUsn1STgWTbg64AueIyTTPKwmwuWhcCUATrWFmtLlm82C+ny4
	 GEAnfe758n/B37QmjITr2hLShU15SL8td8lgrrw0oBQ24OfICdAEQKH1+V9xxQkZiVZP4
	 j0+IwDVGJKAgaRCqwiBWFSDicnaWxFGidaHrD6i32KJc3c57ISjkk6RlTbxOWTiCdY5mg
	 6i3osNxIyxVE/kAebsX5wqM0/Ih8cknqIWwk1w7ehYi+mnX1jkF2FrO6UYiKbRvnGaZi1
	 sEdm8iOlLikbHr/6cym4T5xroGMNl1Z0jscG1GSnqK/9TfmMiRkT/3/D54FcbGlfTKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="d/zzjHPJ";
	arc=fail smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA454606A31B
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 20:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA454606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d/zzjHPJ
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab2a139ec5so1004161fa.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 13:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792786715; cv=none;
        d=google.com; s=arc-20260327;
        b=Bko2yU8LKqpeBEAF007xi1IoUWKkhLWULhvpRPPr1j9psqP8szzoExUOdKbYSbvenJ
         QJUUJSRkUrmGZS5YN73q5b6EWxiVjR5fkozsnr1rdMXv9JSTURLJOqTmCnO63G90VNzK
         bcmOQax/ZWXHbJEFE8WiWn/9JCp7FMj+yncsZR8FK1ZquLCBo6c70Q6AYJt/MBHJxl3v
         xvBOE4nHVf50x0yRf2pDdBPJmthqc4vGGQ5YRJ/mrN43BfukTkP/FGMS+JLJSExDUTBq
         Z+gGVMBzdW6toANw3CdqUaSIh+hiJ/OwZ6bdheIlMJ404fQdTYIKWiYZgjyG4q2r5/bp
         U/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XhM9OcXLuX0xqWWgIEsWYnSsV/Ip1IVt2dJP6Z55uh8=;
        fh=q+e7/VUedW3o0LaNMEz7qR0f94dw9i9mwoQMvlVRw00=;
        b=XHu0ZLV9kzyROOuYKc/wkXupOqQ2RlC10QlyH9SH6PVebStACVJK+BctYhwxxqMHf8
         qoEgQ3lcegXaZUAj+H0woB8RLvDm2b5enUa2Y+tscvpmZcc5EB1K9UNz/yMpz1kvr0no
         5auvbEriguoPv4fa3DIS9+P4Wj7ao6xnV4ZWAaaC7Rm4iF9rr1alDfbepKXON0g7kJkP
         hA5OyPrAbXvxjsUAOc5gwv7eUFzeQWBlJZJNxtJwm89Hh3XSQLfNSxJ8ermP8EsaUlen
         2vZPAb0FU4pq0skHTXVFIXPDjUYgw0juX/lqlUlsnPj9poTeWGjmUHONUfhglb937oij
         u2eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792786715; x=1793391515; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhM9OcXLuX0xqWWgIEsWYnSsV/Ip1IVt2dJP6Z55uh8=;
        b=d/zzjHPJZCnZvk7av+z0zRW59lLKwO4DiTPTKuI47UN1SbTg54KgiiYZEsvN8n+xug
         jI77yt2Ulm7AtYiY9lLtBRyJh9+NL7HFrEv4hMxAbQJUivuVhLure9tCxqsoROZzEp+A
         h+/r7Yj6+//z5ed5EOO9Z4SzyB4jZ4Cno5qoyZepEbeONdbW36JyxAWH1hytWZc5goNR
         7qZWsyi+X3MuwvopViDGRxfrQOYjZU9DJUoI1uK2zhctKdlUgoA4vlpMwJseXryxyxda
         FDjgeJtlKcDP4TsfNzWTGhykkl4M8U+4VkbTL+YkBodBShoyFb2e8A6v2UMt5vqcvYAS
         aeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792786715; x=1793391515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XhM9OcXLuX0xqWWgIEsWYnSsV/Ip1IVt2dJP6Z55uh8=;
        b=FNXK068PoypdcXlh+vdrFa8SI1BvdHHwJ9tNZ2FqVG/7Z7sQXwTmC27xfiYobjL+nK
         dI0R5un+ndDTNeGkqvu9yPXbcAX1lRdga2/hlASGz0tVhGijRnMlK11r4YD33zn1Zyuj
         2wruyq14Uav9imdbssOSmKfJ7iXvfae3c2tvoT8VeEuuQFdEdnFrwM6ND0Dn44bjiMoI
         MhNWEalztZMNfGv7eKkRHt4O07a6y+YbCmfCPQbEnkNjDAOfXxOkqnuDeZ5ewWcGUKEH
         NqpilVcL46L4YDmkVCiVQ86uVs5Zbqspovpg8z5/6mIMjTr2Tyxsaz8OKHv3B5dQ98D3
         /X2g==
X-Forwarded-Encrypted: i=1; AKwUvBzdQi76jgxSZ1WVlKbY5dEAxjFy53VaaN7ADVQfclr+AacHJutksV/JJMNZwFH5YGBqQMn4Ft1Q0HE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZD7SLpmSWnTPSBoVY8aV6i/0xmRoreGK821HTGiruSmGRuZE2
	ea+zKn1yIeUDlfsHBcnwmTnz5Hk3MxLJcF9LtNPTXFwPwq99g2cpFaJ0vGs2+qLvsNfP6PYeDj3
	VA3Ueya8PiOruNBXLdlDT8l4dHKuy90c=
X-Gm-Gg: AYBFou3unTIBoqxZb2mnf1Vxio46qcYpXA3p5q5ntNeZkojmg6Hh2sRUqew9SBnYN3M
	FsivsMWYAW/edre1iJAWDszVIHM0D6YsVJVL3bkSt0KAfV8jJDpbNp1u5PINx7se4TajDV2VqFy
	xYo/Tnf7+PjSeZ2bfT0b7nYvrmICxQAElKREbh9VXKMGsF/DewSckzHITADoY+/Ou5B1orP1EJj
	Z0E7sLliiC7gHqb0NOGzCDgnii6mf0N00nGdYRzGIpZhI22wVGuFHH5P+b+3Slv8lyPNKlSE2Vl
	DOPd/tDB4VwXBntuiEtoHUK/D03vmUScAxO86lvfHUuIxwmkcPFQ2gU7FsKmpgCX9LD7aXnxjGy
	AGxwPBzbtYpWBYt9sG12FH14387S54LXdUnxEMMRrIBz4/uA94VN5FgLNy0OlkaiDjHPm3oUxAy
	TaTh6uXrn1xQslNtkijdo=
X-Received: by 2002:a05:651c:a38d:20b0:3ab:1864:5004 with SMTP id
 38308e7fff4ca-3ac6f9f52damr659021fa.0.1792786714401; Fri, 23 Oct 2026
 13:18:34 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn> <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
 <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
In-Reply-To: <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 24 Oct 2026 04:18:22 +0800
X-Gm-Features: AclHuK_EAQno5gp97BTsUaFw5xbfmoJyDrYbxbG_JGUedumrttOcvXcOiHkHcgo
Message-ID: <CAKspUh+c2ZStWkBU6CnhRXEMzqpW81MrbRaTtJtHBDvEfwJ6Sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Daniel Pereira <danielmaraboo@gmail.com>, wy@wyuan.org, jani.nikula@linux.intel.com, 
	alexs@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, si.yanteng@linux.dev, federico.vaga@vaga.pv.it, 
	akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 23, 2026 at 10:10 +0800, Dongliang Mu wrote:
> I agree with this proposal. Ask maintainers of each translation to
> solves these issues first.

For zh_TW, the three moved documents (security-bugs, magic-number,
gdb-kernel-debugging) are already relocated in the series below, which
Weijie has applied to the zh_TW tree and which is waiting to go upstream:

  https://lore.kernel.org/linux-doc/20260929131020.266120-1-chenyou910331@gmail.com/

So no need for a separate move on our side, Daniel, but thanks for
offering. One file is missing from the list: filesystems/sysfs.txt,
whose original is now filesystems/sysfs.rst (zh_CN has the same file).
I will send a fix for zh_TW.

glossary.rst exists only in the translation by design, so the rule in
the guide may want to allow for files like that and how-to.rst.

Once these have landed, I will drop the ":Original:" fields from zh_TW
in a separate series.

Thanks,
Chen-Yu
