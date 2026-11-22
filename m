Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391797;
	b=fpcdPP42alvQzIp7UfxWLL+nSZd9PIA6NA3D8oE6Cky9hoQOeFb+E9EtOQ06TvTYpebw
	 wXXIOmyzXhTANmaVyTN1h4Cm2pvNk8mBrIh0C11m2kDN+x9noneVzVxYUMErIiQ0x/Ye5
	 F0SwxZV/DEMJKXQ/pFrxtwyJw84HjCwppl3VLAk/2iwcPhm63hf/hQew74OB+h55OJuDR
	 lRwzNJ2u/M7qKwVpexl1dpc+WURGatuPvmWGCNp/4NB6UKzPOP3ldmaTVVFzQOmpeML4n
	 02SsqpSimMEDgdwGCSwHlgh4uxNpDKtld5hTIYoWRpmIJy1UJouRX/OCqnrEtc92kKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tfPqNoLhAduUsXQbNqthxVyl7ng3BfDwZ/i+ckPcnwg=;
	b=HEymke4g2YVc6WuE9Q6Pyzdr5KqGfRmwQN480sc0SH/bVFYwVEDzYciCY6GW/Xld64Yd
	 kooN4wSuXkNzXvXGUUaX17rANK2ixd0l+uyW8rSquBD4S0KvWiSiXOphHpUxZX07JCzfK
	 QSsJaLmADipViShERDKv868pbvso5ZrK6WnGySGMgzVVipNS1g+0jVfnwEoIx3geymsm5
	 /HNzeCQECPI6B6mCJBv7Hem0VSP369tOCSC4b+0SyRA42nwyKe2ACX8K8jHI8KfjJyLCh
	 gKZklX+wuPC43xFkrHsRO7Y1nKf+hpVNBPHNqY8g/q2lp3BI+SA8U/Tddkf/GJ+Jbig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gG/BboSZ";
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A27606A31A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 23:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gG/BboSZ
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2e0e8bc27so70683137.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 15:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795391796; x=1795996596; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfPqNoLhAduUsXQbNqthxVyl7ng3BfDwZ/i+ckPcnwg=;
        b=gG/BboSZU8fNpoulWKQTT3zi27b/qWOjjdPRV0tuTrFKmhjWW6ivbE6amJtEhjWzhh
         0kvqN42AVUa52hZMKrRLiH1uOYi1XKv0pcnDm168pNYpmvDzhu31jlq/7lWlbmy18Axv
         YibOzR+QJWAZ8Hv6UzB7qoeka8GTKlzaTv9kc02YjoND2MZIhFOR1iJMowEZyI0l5Nth
         iwCDJRutvN2eA0d2L2Gq9HvP6a0w3lcxbiGNh4W8R4quGbSe7ieuGDuELA5azcreKqdq
         B47pC/UEJyy568F6KhI52M2IDJdEsV3JgnOdGQayf4G8TrcikUIDRsw1CX2Ec7HATcEm
         zITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391796; x=1795996596;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfPqNoLhAduUsXQbNqthxVyl7ng3BfDwZ/i+ckPcnwg=;
        b=S0qAUP+a71upC4B1hOj8iDAYhfpDcSrOBH8zwZodP4da7OygyyWT7M5vSIDY8mrQFe
         9hPaCQ2JVCZI8At2kN1H0qDuYu5OVS9D1GR5z0SNoNNTJWnBMVo+mcDeXA8HQGFZXbZb
         V3+ZJyNxM84NsOUuYrZjl8rDJhYqJgKsAV31dVdQL+X4z5RrqHtu4jRb0QPaq9sfUsNA
         ZGLf+GWaa+pnLdf0mJ7SNEgE0eZU5IShLOjQg88ApkvcFqiNApgVt9kOHCrMnHfEDdNu
         5f2Ms97DdGRFgiWZVqRZwFngRr/YqKftlab7ygLBK+/ZvzLu/xjAjGQwdWATYNKwwqWp
         V+GA==
X-Gm-Message-State: APuU4Z9Ju4I2VC+aS2kQfc5WwShECorJxaP761V/G9OgR9ZhNuYPeHLU
	nxDbDLFG0IDY8WZd6HZtMN3TN8g+uYNyZBFkH0PVsDmkm/TfgTwPvCnnn/dK34mmyEE=
X-Gm-Gg: AZFdTZfP9wsH/PBWfrwqj5PxBmuVpJa1zQjV9ng5SupSdtM2xEiscOr7riib+kKawoa
	UqcBp6Ds3BSfN6dd8W82vnqAWRUgF+ubvPDQQHEiL4qnOMN9u53Aymre24gdN8w1ByFscNy6H4P
	gwLRxx+5LWfpYsR3fl/EtKrK1NnEtyn8x3sYwYln4IwoQQ/tEU74gD0Bwfo7Xay4utXEpGnG7DX
	XGjBlwIpJCA9H941Lb6WkpKR4fbMSQX3ga1bLp7Xxx7ztVkeOOVvv8Mur8eR7ygePMqCyngu/Oy
	cYeUaHrYeHUaWtZOZEO8yAgzMe94LN5W4Zk2sRYlqFcwHNKUdBYUxOqu3ZLQg30wh+Ood6DKQZj
	VhQtemk3yayqZhbSL66YMmQoGVj8fRQrZDRnwZ6SxYelJp5+U8bOJW6xWdwDwVUPRkT2KOKtOOY
	FuHkUmggWZWKC1UOZB60aywgJGsLOIo/cPvCz/IbjuFPFQ0/kdy3e4jp1PTAO+UODlTLx2krod4
	tQpsvYp4z8BLm/Hzty1oIIxN2yuyK7RSUHfCyKakNwQ9JlClBH6qujiAKZ9BCz9K6HKzbIFlUR5
	miHEWYdQn3hnTrqD3sn+2XbOBlt3OpfuAg==
X-Received: by 2002:a05:6102:325b:10b0:7d2:9573:8c1e with SMTP id ada2fe7eead31-7d739460f8bmr4667721137.3.1795391796269;
        Sun, 22 Nov 2026 15:56:36 -0800 (PST)
Received: from [127.0.1.1] ([2804:214:c00d:301f:284:97ff:fe25:710a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d76b74sm10055181137.1.2026.11.22.15.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:56:35 -0800 (PST)
From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Daniel Pereira <danielmaraboo@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v4 1/3] docs/translations/pt_BR: process: add
 handling-regressions.rst (1/3)
Date: Sun, 22 Nov 2026 20:56:31 -0300
Message-ID: <179539179181.2062350.15070190318926848939@gmail.com>
In-Reply-To:
 <CAMAsx6dVo+8RL692xaVDnaqjMKr2JggSCjgYJPkKXmz2gby2Zw@mail.gmail.com>
References:
 <CAMAsx6dVo+8RL692xaVDnaqjMKr2JggSCjgYJPkKXmz2gby2Zw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Daniel,

withdrawing six of the seven series I sent today. All of them are either
duplicates of work already in flight or, in the case of
stable-kernel-rules, already being translated by someone else as you
pointed out:

- threat-model.rst          (duplicate: Vinicius, v5)
- researcher-guidelines.rst (duplicate: v2 in review)
- generated-content.rst     (duplicate: Ygor Otavio, v3)
- programming-language.rst  (duplicate: v2 reviewed by Jonathan)
- maintainer-pgp-guide.rst  (duplicate: v3 by Gabriel Ribeiro)
- stable-kernel-rules.rst   (already taken)

Only handling-regressions.rst remains. I had already sent it as a single
patch, v5, just before this message:

  https://lore.kernel.org/linux-doc/20261122-handling-regressions-v5-1-cb363b=
082adf@gmail.com/

It replaces the three-part v4 entirely: one patch, no patch touching lines
introduced by another patch of the same series. If you would rather I had
held it until you confirm the queue is clear, say so and I will keep v6
back until then.

Three things I fixed on my side, since they were my mistakes:

1. Duplicates: I had checked the git tree instead of the list archive.
   The tree does not contain a translation until it is merged, so
   absence there means nothing.

2. Indentation: a script I used to rewrap text duplicated list markers
   and rejoined bullet continuations. I rewrote the wrapping by
   paragraph and by list item, with proper hanging indentation.

3. Labels: in maintainer-pgp-guide.rst I copied labels that already
   exist in the English document (devs_not_infra, pgp_tools and
   others), which collide in the build. Translations must not redefine
   them.

Sorry for the time this cost you.

Best regards,
Eduardo
