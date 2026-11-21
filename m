Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286103;
	b=0jBS+3BHyWpyGoGt9lrPocqsZCmhoFdRkcG77d+Od2roykUsxFuztdLNRBl63rhgglQt
	 NTPlzghkTC+MzKDOmyZMBH/nDFgYsGZC6ASQDwgYrzV/86WjvhA3QQcTeJOC3c2ujpsmP
	 BcA2W21f3zwzf7wyUxjBMZPuiqdzag/CWCzIs60sqJVbnAe8yWvG5FzbNRxs7Z4io0O6u
	 G2R6dAtrx1UTxxAWqFnXHXQ9igczjk7YJuo0Doc9R4jS35mtF4nt08xrfFS3UqvK+hcxK
	 6HK8nFHIRaIyyB9+t5/NsY1Y619uLlrGUcl3qltTmtTuZhH1ncgURN0dCZauBqBKu1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
	b=klPf0xq0mbAfUrgO310vbgrJYGiYEF2MVDVoy9dxhc/L9W6scH6McC/LMEgOa1LEoOp5
	 xjbow3U5pGZkP/FefpUy2+Lw6nP7+Rl7Zfk1b52U/R6HAU102v1BlhYx9VWLnSOlUW5KY
	 Ci5AJnBaawhbdDkQgz56G/lNJBefEGX67XeI9VuMQuqm5ywfWWhJcMqjSLY39JbOncQ3R
	 H2zYBbRBILPGhbMsvIRXTWoVMflYMXDbj80M1WrgqjDi8wn4jLIw0+Gii3CMzW8ODnfae
	 UgbsaAoEacrwviNyM8VgF4RmrActul66IU6DmqOZfCNlOzCbmb2tApFBWzph+GS4pjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3zTH0VM;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B5D606A330
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 18:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B5D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3zTH0VM
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so1937889a91.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286102; x=1795890902; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
        b=a3zTH0VMfDOtA3qASaPnyRTKrbn0QPoswlB+TwNBUhyHrMnQxSfUx6JcQY0XZK4GFv
         ddqpHhn/lT88Xod5yWmMdd0jBOfshGBd4bJ4tzLCmz4ocn+YIWEdPRuroOse/IE5dnLf
         9v00BNW7ERSQF3WDPV2odW8vWdDVHs4+bin6/Q65eue9tF+EYuIDfTYGYN4en7Ft7qEz
         vot/4Uoghuda1BQrflDK9a/770qtve9526opQe2mxjHfUoqCoiTDPH8yTroT1NFHhqDV
         9SDCNx2Uj9G7wMKvLOMjyOaMwvfec7qEh6/BWqkRX+6mLuKJpht3T2zTAgF+pI4L36/c
         RHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286102; x=1795890902;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
        b=McQIe07oIekctEcfQakjX4YBkbUYhC4ovwyC2qaoQjo7hBZHSDve0pEQs893JrQxmd
         vlXOpp5PDK8g1PSocE+tn00+fke/YJk+25kITZ7RVFoIMsTOt51y7Jc4eueYRMQfBsvF
         RTtiGE1/FnP8jPiL4eU8zBdqD6n/BwW6BypHIZxHNBl6fp/Dw9eO4TXu13n7SiMNbX5c
         SkWGKUBcjeQsRuy/dKcKeh408n0zSuss/jbYOYPPf8ovmxI39zp3aCc0UknZSOVoe3fD
         TPlQ/4ZXqXdC7iEgtCAGtzNlUJASN3Tgi/cmP7Ezgg1ZO3hFxiIVDIekjEC1/WxBjK+G
         JJag==
X-Forwarded-Encrypted: i=1; AL+hErG6qa18LnzGGZfxBegM5eJ01qur+FTJPWJbihMcfJ4zc6h4LFOew76RuEyS7qJjCiVLu6DS4UIv0Vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZH/JP4l4gUJ9oIIX5Ehtr7EvAsnqjJen1ntadW6DAEqcZpiCa
	xolzTevSbEKntC8sQp73OXVDNksR63714qAnRBa7z7JoBI2NusNuPNV1jJDqJWnp7qZzjU+yEMQ
	U5OTT+Q==
X-Received: from pjbrm1.prod.google.com ([2002:a17:90b:3ec1:b0:3aa:fb90:d203])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70c:b0:3ac:9df3:6b07
 with SMTP id 98e67ed59e1d1-3b41c9234b2mr7049150a91.24.1795286101862; Sat, 21
 Nov 2026 10:35:01 -0800 (PST)
Date: Sat, 21 Nov 2026 18:35:01 +0000
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com> <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
Message-ID: <awHkTCbtUgkJoAW7@google.com>
Subject: Re: [PATCH net-next v2 2/2] selftests/net: packetdrill: test tcp_mtu_probe_floor
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 16:10:53 +0800, Yongjian Wang wrote:
> tcp_mtu_probe_floor has no selftest coverage.
> 
> Add a test where a full-sized segment keeps timing out without any ICMP
> feedback. After the first detection falls back to tcp_base_mss, check
> that each further retransmission timeout halves the MSS, and that the
> MSS stops at tcp_mtu_probe_floor.
> 
> Use tcp_retries1=1 and disable TLP, as in
> tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt, so that every
> retransmission comes from the RTO timer.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
