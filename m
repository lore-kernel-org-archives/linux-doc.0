Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018073;
	b=yw4W+Z8Jb1v+e22lJUBrseW/XjQow4N6X3GDfixEChevgiIplqEbto7I4HjjkRMfDSYK
	 v7UsGIexuPAv38wXsJ2RWcRG7Hi55iWaPMZXxxZy1vSnP2VEkr9zdteVFYyiWjiaHVGdk
	 QjfjYJOUABDjKMJ94wVN/t8woONkYgNqOsqmIsLwIBiqw8QwN6hRawRX0m/vWKela5UWm
	 FZOuDPIAS7g6AJSrcPiIrwF2uwE6/MFfMCBgRaCSIe2xkl9wJGcs8hato8K02ZHwABZS9
	 aCbHjTjn4Ubc9i4dvwfl5hx2ydfRT3LXHtFaJVvBBuTwQ6OVt9Xk4naxZ1PVkIPPG6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Sq9RmYzcNH9B/wayIUueB9ggWDiYP1P/tLsuJW/Tbnw=;
	b=0x+YYgPCjNbpuj7CjjzeqE5r+BjjB7iN7FPLcevHK9PMINbnaQXRGjB1h9qZlAxtWvd/
	 vsyg6px9Pmm8C09ybJaAKyUYjrVnopTRyFJ2MUBrQibSw43kPC5thxRlkhBg3tOvUD+N0
	 pEttUdGwg5lC2xto/3WBiPmLKcMeBZq6M1Zaz1vGYy2JiNlCBq1jZuivIAoYEpe8UukX2
	 XgcDaZrQdczXk2RnVzBUprNS1eSqWdZturTbaH0WoBofSDW+o+VDtn1P9WcMAA7uoS3YF
	 ddgzbBN0OEb2/UmtH6+2jpeSdn7UU+n4D4WNu87QVmK0YMGY3yUJqsyG5RSk99d6P9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dTgR1f3o;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2F60A6F4C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC2F60A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dTgR1f3o
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71ad2c6491fso1244482eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018072; x=1795622872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq9RmYzcNH9B/wayIUueB9ggWDiYP1P/tLsuJW/Tbnw=;
        b=dTgR1f3og9a0vBhrk79J1moJmlLMa/Fa6bpbkeW9vt/uz99+uvVA4CNebGriNhtftB
         3KScmsBDYtIouXo/NWiqMm5BqyXTGIO+u4eeRjaVUfcuM40shyAyRSXMCOkPd/cC26u1
         WOnHUaA5WQg8bQYexiUTpf73CbV4aB1kjJPhR3IiqikKxwcGjkzQP8iZidIuE55TfjYN
         C3ZM0ZYPIsNXrb1Jj3StcFa1N/5OsDo8WrytQXXoTjfJLgwJighHosOeOXNt0jL4rQQZ
         1NNE9jBw5/3sC6M2pYKyQIJddk8h/QOYHo2kWVRymfltt/Q/RhyBVcOaWuRehwkYH7o/
         pAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018072; x=1795622872;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sq9RmYzcNH9B/wayIUueB9ggWDiYP1P/tLsuJW/Tbnw=;
        b=olyWVewUZY/mLnyEuvv+xsnbls7vbghy7oh1aLkwXVLjn5vTkqnjzDnFKXoznbd/wW
         9NHUnsLZFhKv9v8xeGmOgpJhae+3mxDDaTGt1z10Rcma7QRa4wkdHYFx5+ddtWxKr3nN
         DKeOcUt6mMUmor/5gcCuMwRMCJbo3k7rr33sqrl3V3800QeTttQrKZBAPaZ49NAP6X+j
         GeiLv8QNDRCAkX3Yu+8MzZ8+paXWGEeNog4Ohz9R+yNhOyOnP6LPnA5Cxrhixlqk8CF/
         TlyPbQ1gJRLKuVErbtfLed2t0Nib+JNdH7IkiW9Tat7uWj+NAQBXsMzRaPBsjN0bVyuX
         nvpA==
X-Forwarded-Encrypted: i=1; AL+hErG/E//ULu9T6KhGv9TwBtKjoA7mfmP7XRNh8cnXpWhqyXzFe3J47RZgk78bZaWvnSlhPnLuBimEtxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qyQbTZNfdVOtTsv4NeZlmsVr+GJ2ViSn9OKKImFjnj2nRsIpV
	9euQz7XnzwbHmGeh3SatLGZPJLyuNdw+Ts5o7eeUJwvIHbUN3PdpYWioNDMTS+3I1co=
X-Gm-Gg: AYBFou1/Lw2muY0kL59Dp/wo5ba3x/H1+xTLKaTrcGnVQQ3u6ZHceDQPdVQ2jkn15Me
	BbSg2PK9YMzH1bYY9ASWFJAV3CA4oeX9DHfyWwhNE0We2Nr28Iz5OBtPhVIPU2clbxaNwUpOnnK
	Ru0LTvCN9CFc0XnSyiXojqDpCwKlpi+9oB7Wkg7P2ilfP7DMmXVTSGyg3UxFPbapQqJfXBqo1t+
	x6SqFdgYkRQc0EgjSGkAPozfUHF6xFPKsYTqF8rkCdSXqIsJZBoDgpnabYEUzAAR0wwR7XBaKE0
	6ZSCDCcIM0/nBzhPjLb6C3OwoDmKXgU77WkkByEkxxMbFr4DRvjiPVMWRm9vruuVcmR7ibBhrFg
	uhbr+62CR7HhzHDLsPefy7OhR+2JD3eYMkM06pB1zDQuK3m0HCafpGIn5wRwrtT8p5Ee4aRctgx
	bu3wuPmmq+UeN8YFe+euNCUt2wEL6yfpndYv9DwIfJiro9qyXtMf0uRS0BTXo/EHvl5CGuvHrcF
	yrbUlLsjRK5gb5sgfu7Wjd1n7426wafccFqOOuHszAN+NNAMgh0bCcTFln/OojKaxjk1vh3sU/s
	n8d/sECl38HM1HQZdnMw08WA2ZulwjvwUJsk09I90YO8DdKiRxw6Xebq4KWHF//eM8lbhQu9T9U
	BX7P6DioOabwFb6I24kZKC6gzMu07lc7u8i0la5ZD5f5KYX8ZcfY=
X-Received: by 2002:a05:6820:308b:b0:70b:930f:9a9d with SMTP id 006d021491bc7-71b028d29a7mr4357375eaf.31.1795018072097;
        Wed, 18 Nov 2026 08:07:52 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:50 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Md Haris Iqbal <haris.iqbal@linux.dev>
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
 Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org
In-Reply-To: <20261111215838.103356-1-haris.iqbal@linux.dev>
References: <20261111215838.103356-1-haris.iqbal@linux.dev>
Subject: Re: [v4 0/3] block: delay support for error injection
Message-Id: <179501806989.17649.3138860274842922761.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:49 -0700
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 11 Nov 2026 22:58:35 +0100, Md Haris Iqbal wrote:
> Error injection can only fail a bio today.  This adds a delay_us option so
> that a rule can hold a bio back first, to model a slow device.  The delay
> happens above the driver, so it tests the code waiting above the block
> layer, not the blk-mq timeout handler.
> 
> A delayed bio is marked with a new BIO_ERROR_INJECTED flag so the rules
> are not applied to it again, even after a split.  Christoph asked on v2
> to avoid the flag by allowing a delay only together with an error.  I kept
> delay-only rules, as a slow device that succeeds is the more useful case,
> so the flag question is still open.
> 
> [...]

Applied, thanks!

[1/3] block: Reject unknown status tags in error injection rules
      commit: d239710cf3e6bd5fec66766957c3752d9cfbd2c5
[2/3] block: allow error injection rules to delay bios
      commit: 6bd856cc99963b786cb530141745ef733de76cc3
[3/3] Documentation: block: document error injection delay feature
      commit: 5a29cfaf51105039d156dd8a61d2783e8b653667

Best regards,
-- 
Jens Axboe



