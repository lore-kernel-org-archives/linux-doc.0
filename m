Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794495328;
	b=wrTI6shNDh1QTpvaRSVYf4nt3M3NH1auohoZE5w8XQkzpGFw5O9u0X6mntwp5Ha5I0Dq
	 +zw1+sjU8gahiKrYr1g+X6if6E6d4MbnsrorAs3vTQdJwP95NgXGSY78m8C4X8HRC8DD5
	 dovhhynfXCI+Y3DAT1Z/RipGB4yTQfUBDw9l6+vMWpSHkGMPeemx++31eZ/56c0MIGmXN
	 FLXaav7vQapyVCtJQEHn27Lzb6Q8k09xcZdaZFJa514mdKWzU3eMAslICpIsBEEfQQVLi
	 UcSM/M4Nej2uq6TgenEoqjyxzsC38qRnbri4ZeON15ZXfxtsndb17EBO0DWEI+ZQZHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
	b=fsCXM5NJviVWk6P4z4IAZOflf+NuVEzgo8htuywkyQRy/BmuRhOlI/JMcbCjT18KMS4k
	 HMQIpzFdBIH6VotgQbCflozLTP+EQ4UDq1jZovwLrXnqXom1ZB+x33TKLc/MreNFHzGC7
	 fcuUFDrN2xKekvztKWdLW3UrmR/YDaPwHab4tXyiBPY+npuipzbEWSK1heSqMEg+QpSkl
	 iDqliCo9FWTsiHqUTi3LqUcRYCIeHMWD+KdAjvskXNBAfZ0EQ7bZerfhsKYG/1dA2vA9R
	 6LDbuM0Wewvx/7I44a62e5KzOgxHa3RLIWsqQ0Hgz+I1QdnXF2dAwd6GcIOxcboxPTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=U5KQI7tP;
	arc=fail smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BAC606A323
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 14:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BAC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=U5KQI7tP
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-716b58a4365so2295704eaf.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794495327; cv=none;
        d=google.com; s=arc-20260327;
        b=XIOcsPnfyGIednpSh8WgDPd/iUwSJLeskyHjVl6S8Wge90f6PbdBbfBLPQaCsruLQg
         t1iAvv1tJ6rJvniRGxpNJC8ImxWKcW6QKITVhB4jnFc+thv2jRN57vgH7gW75YWkD28y
         avCOXLyupf/HBKwPZdkR/jYRMC6HioaxNzAhZUthV2fueBltgedf/mtx6e0JCZsbFFSZ
         mTwnf0L2pj+mQmtbXkxvultSEarBeEmbzaJhS/53gFq0ake/a4XnKvcu2f4f96WBUv7N
         z4J2SLgk2kdqlZZa1ssl/LI05hcMhV3zLBbc6k9aYfqU/cC4OR3MONuKBx7/1RDLKMrw
         bfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        fh=oQ/pCNBMOrJYgMJsk4YWGNA0b89OY1WSVlbHEYCyxC0=;
        b=p9G6nAk9Ex7Pv926BWy2PhpOTdq1USL5+7inGblpdmHD5qpPn/4PjYe4+I6qpKIm7n
         kzoMJFETeOW3mln+ZLXSkApt+9HTL+3tlzqWQJZV067zLKNMFVh8TAk9wsr0/IK3My9K
         C93tloziqIrhpL7WwoENnfx0hhcjct22Koy3v9uVecw1fOrEF/+dXn3ScVloPXLTeOcU
         qtlygTcnqC9f7FsjfQEj0nuFw9862gDyDeyZgXXhoXf1p413dzxzY74NSBHitEXTJuwd
         +pCpPEupZjUVFxnzWfIx1aP7fQXi9SJW27dvCQ6VZRWBHVVe1HFxWGvtSUXeRNLtqWQ+
         NAbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794495327; x=1795100127; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        b=U5KQI7tPQrZmVs2O+/K/2qinNoIrgmL+JN3JGy7b9UiDPeSLDrYZUz8m3+Fi+GmK4d
         FPhVPTsRS15yE/k7GknytYpWAG6MwHXBIIKa8+5OUMRQdlbNuFvA+ep3tr0dGAEsUuqS
         a+qAoHXBep9HV3bGKKYHTsPNJ9pBthMfNLk3q0DuYIG3pLV59xn/MzPe5hgZKfRheDNT
         6JXrnL43z2Low687s4+keArBSR7IBzhVjsWA3Ig96aNpRQIwExEY7RDDcIQ+BgeozV2b
         TQoClntxCegkGq8td3fNEFFkUr2rZefYM3k1Tn1u2EN6NmmUeW9xJMDbZ19emN/tNOTo
         3cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495327; x=1795100127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        b=cQ/IUuYUnZRH9+f9jWF6FwyChCpuFNaKq5TsaFcMPWd+l5REHbBL3hAlmh65Hd6T3b
         rZbG2pxI7tZKO0zu8imtv1LKyYwBWT7OyzoEs2OIri8kvCPHjoLP5AC7IJmygSWS3Px0
         j44aK1bBQ+kDTgKM90HBKpINNMmXAhLlj68zcpcAD2d/eyaWMUmi9iwlyw61ooey9UQl
         pKkDofFO8a898NyzhlzxyHoIG8Ac39esj52j+oIiDkoN2+3zIeabKH642lec/ta1AxB1
         8RuLg2er5X92QzM4PBB7wqZ066WOt0z0k8+i5i72B0s1ZoQhdmQW7yP5izN+qiJNCDP9
         HKEA==
X-Forwarded-Encrypted: i=1; AL+hErG2sUOLqBkDnG0L1Crg2Vk6SeCtesmHlhxjgpupTrkIQMQmVcnepupWW5lDqOW5ELtMW+NRrk2HKRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c3FgI3nkd/qkHZUuMx68tPPmK7e/SkDOjkayr/vNI0+EBik1t
	BqSPxVD0dPY6+FQqNIfjhxbZikBxVQzfvXOcgCpSIGvxc1H9lIww1ccxehSEuCU3yqq0sCEQqUR
	axLad4QzDaDmlxmoR0uz26tdDbWc3uE5Kd2/Bjota8w==
X-Gm-Gg: AYBFou3Izyqp36DqOUBZw/uzEahUUqz7gCeQSHGcKWNA0mR4dTFMx7ifRE39wUDvI4w
	TVV6BhdxSbqUNbLdmpM9WWnbHnufFWWSs6Meqet5QEtyNtnz/ZysEfmXCexDPUt9c6ahB6/plR5
	KKObDgtkPjT0TtVpPi5HVZ54vHyNRIv326Jj+cjk1zR3CtzzzOIxmnyWy//G3LZ6hKY+8n4jVEl
	oMEQOXlQYES94FdSzHWwV7XjHK0EUAegGYcCHBOhnpbWuRyZu7MgBzuxx+wnL4WoZ4Mz14eRMRP
	hRZZOZvq1kKEWzTIY19WGHjW+kVtx4+rc8BjdKUUogU5ZL66u1G6Zw/zcnKAKxLtysO7zLnS2nz
	CCjjp0AbE8b8avV7ZTC3Xl3idEYRhJgXy4RHFenuHPIi9WzZzgL3G6BdNBGDPuFNxNhLwMyfknA
	ghBciA8idF5Q==
X-Received: by 2002:a05:6820:a50f:20b0:716:bb4f:9d1c with SMTP id
 006d021491bc7-719179b52cdmr2435932eaf.70.1794495327350; Thu, 12 Nov 2026
 06:55:27 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <DMST78XBB2RK.2BKP3O07GEWZQ@gmail.com>
In-Reply-To: <DMST78XBB2RK.2BKP3O07GEWZQ@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Thu, 12 Nov 2026 14:55:16 +0000
X-Gm-Features: AclHuK_osBWVQK63DcE7gK81kaRbLSav5BXe8bL_6Bp3W1Mewum9RV7hacJBHqc
Message-ID: <CAG4wq-cXJtTzG2GO9KTL04b=prS+X67fRBJ=nriOO0G-24Rjzw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Vladimir Vdovin <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexei,

On Thu, 12 Nov 2026 00:34:54 +0000, Alexei Starovoitov wrote:
> I'm with Stan on this. It looks heavy.
>
> How about the following idea:

Thank you very much for the patch and the idea. I really appreciate it!

v1 uses the skb_ext-like layout mainly because of the earlier pushback
on a fixed struct [1][2]. This series adds only the three most commonly
needed types of RX metadata. A 12-byte fixed struct that takes headroom
only when any RX metadata is stored can be a reasonable middle ground.

I would like to hear from Jesper and Jakub before I move to v2.

Thanks,
Tianyi

[1] https://lore.kernel.org/all/20250805172831.213ddd8d@kernel.org/
[2] https://lore.kernel.org/all/1d5521eb-84fc-4417-a3f5-6366694d160a@kernel.org/
