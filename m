Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785200;
	b=bwurS/7wepWeYaEGbeVlOmMICSrE13NamEQIp/lH6r2s0AOccj9avjtJiOI5x5FM2To6
	 xJVs8a+76kCi7jok4yry2GlBa8d1DnAXpNR5eQySOSjmSyOzSSRspANlAhZ5iiW8PuKIw
	 RmUs9jhqXZjgOcaG8Fhjp/ZPeSP7YsGcuOHSc7uX+s1549RgV8V8HpOL0ZumF3EaiIofP
	 ucFyVynbdxrxFMtstzdic0QyzngD5RBX2dSSSBNyhtCszmw+92HvwAFN6M8jbTdMdPGSo
	 Q+gZWsBqq45BME4OO8AgRPvgEPSo8AoCMCvU1A1W0+3RyyNSk+hKI83PZkZWWQFA/Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
	b=Q51HgwfNlCDyFpdcSVBDLaGeGWdKFKCuf19jVNjLy0aaF0vURstKd3LvHlKxK8lG/hja
	 6B9blUflAIvdJqhYW+Va59perniqSrvKzBZdoFwGPH6o3Qoi3lSR/0LwcLd8VBtDuVnf9
	 9ChLv3GjYlZgMGj8pnUWLGT9PsrkDnNFWhFCpKzhNaFO00N/zEmHkwpHnaXx6e5Idd55n
	 HLAhAtr+ABy7LD/LyV36x09Dlkh3TStEp8w03i3U0Wdm+4r3KYJi4bQQjC5NejKakYt/E
	 0Ftk5RiyxhUoVbNbxlSXf1v6fofKwAqsShqpDX7SWd6hI6swzl5Q21fbbJPKGyTJ2Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gj10Swzo;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A644606A323
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A644606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gj10Swzo
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so2021499a91.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 15:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785199; x=1795389999; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
        b=gj10SwzoKMqoqx9yr7X2Fju4cNBju2Oqd5X0Ay4Y61hHfD7PCDp9yiFRZZggUUCphi
         EgquiXzLIx6aY4R2RTd5ZLyzF7a+dFyArlFGpwOF8hzIuQxpoF1rvqBPTA90bbQtiSc3
         ZX0RVckXRZHz0dFR0n/+vn5BPOC/cB4YcRGnL/oyILEIke66Jod48SG+Qv5PIZtk+cJ3
         a4jGk58g4rcuy6H/nHZi7pTcKmRSJIlcgRxeZ8a/8BRn14ucVJyS4iEkzUGGbVSfsTxE
         PA1L6L9cE4UDQma31GznSkYOnY4WfVQEo52nxdxOSnQrrOnmbWew4sNB0BE/xLjNWEuG
         NuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785199; x=1795389999;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
        b=fVoAtyK/F094XrgcRTdC/z+zicG7/CkHTrmsJeqxi/9IfqeNQkdI16M3O3XS1y96BZ
         jICrKR166KbllpGMBW3wDZaM9uH019VnE9Bb5rLhg2ly7RmsZjTKIJI7h9OV6XGZehdx
         4+HUnLaYlgmW9snL56hOp5RYR0Tc9FzkkEBuwjxfvDyXv3OnG5MZLYeuWkek6xhLKaKw
         12OiD5Gza8yyc9wLS+zf3BdatYz7avrKdhXBoWSZCHtIOiV6ZHah5i7uSvYewbd74xQg
         CXiVXqFK2ypent50KrA3m2uUst1GmzHNUhGAglTqvM0I+WmATMGAto+prRkooWVvO7Oc
         1ViA==
X-Forwarded-Encrypted: i=1; AL+hErH4LdFuNcr4ZK5hUVviF8eiqQRuWSwdW/Y37GACwcJ0CwCOtzu024qksxJfiJfsYVLkYDnqV0xbrNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8urfZ7LzMV8xaDMwA1iPM5Phd2K7mcWHkRP4ozrEl14AwAH8AJ
	F/JgXemvctfhayHU/vZObJfmwwqzHk4Z3QTXW3zQYrCSPCc8bEXhoFgZ
X-Gm-Gg: AYBFou2tm70OqEEVY2dWZRBBK1RhUCWepzemnlfExaInucCseo3tEbAEteR+HU43WV0
	OUfYQ9nEi2zUUQZnumfh6+b8DUO5bW4652Swmvkn9kDZEG18wupoyvV2p+ZiMw2Gsz958EVnjC7
	ihsHWaDHfO3JoUSsuK4lw60ycfE5z1KyujfWY9KcdSb8MECSuBHtOdcP0Ows+nrEW+SvKNt1CbD
	GglB+5TsExsXbmSzPUbbHP/CkwvOyhX/MsFwu0/b5hxvhGRMbn3EUwSOyo+Rqwz/V5UPbFJUO2l
	QyhVPeSx/op9D96qow6aEEj2c82+y4UI5Ph8Ohl7s3GSlLtcyD+Vy/QqpvW8ioYHCjZ+hptP7gy
	BG9MGeke8YWjMu1nhrerDaTExp9SnEnW9akKKTSjeIooWEZQwMAUz6/+3KmfSVa0hUGiwfnCZfo
	+PkCMTGIfYSE94ZCUIV65BIRDNDZNuYHME6k7v3NpQS4PfMYeCL04PBZSMo8eQPbPpPheY15+9p
	AyteWKp+8ZUbpLX+3M8mlFdi1brsAEi42zyZl4OhMVofEE1STltuMw28Wo9/TcnZHbYGPOco2LM
	3myxJpcH8K1jj94a1mpv/oFW/M+pQauzQ6C53lm/YfqfJjHPJQ4NbqoOZNDuVnzWpbFAdcZTrQZ
	rBXtxDDgV0N/8oJ3P9FJIF6VjsdatIlvfeg==
X-Received: by 2002:a17:90b:2e06:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b1b07e1cd4mr8163612a91.6.1794785199420;
        Sun, 15 Nov 2026 15:26:39 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm6832094a91.4.2026.11.15.15.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:26:39 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 23:26:38 +0000
Message-Id: <DMW695ICRVGM.2YJJUJQ12T0V6@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next v3 0/8] bpf, sockmap: Restrict iter-context
 sockmap updates to sockmap iterators
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Stanislav Fomichev" <sdf@fomichev.me>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
 <DMV5NLOEYFGF.C7ITHCRCNA7P@gmail.com>
 <e8f1736e-3f13-4f92-ad69-8b166c41e68a@rbox.co>
In-Reply-To: <e8f1736e-3f13-4f92-ad69-8b166c41e68a@rbox.co>

On Sun Nov 15, 2026 at 11:10 PM UTC, Michal Luczaj wrote:
> On 11/14/26 19:45, Alexei Starovoitov wrote:
>> On Sat Nov 7, 2026 at 5:58 PM UTC, Michal Luczaj wrote:
>>> Follow-up to Sashiko's report [1] and the decision to restrict which
>>> iterator may perform sockmap updates [2]. Series started short: remove
>>> about-to-be-stale test, restrict updates, add a negative test. Then it
>>> expanded: mark bpf_iter__sockmap::sk as PTR_TRUSTED, restrict
>>> bpf_sock_destroy() callers to iter/{tcp,udp}, few little tweaks.
>>>
>>> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
>>> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
>>>
>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>> ---
>>> Changes in v3:
>>> - Drop RFC prefix
>>> - Update bpf_iter_reg::feature docs
>>> - Fix tcp_request_sock BTF build error
>>> - Restrict allowed callers of bpf_sock_destroy() to iter/{tcp,udp} (Ale=
xei)
>>> - Link to v2: https://patch.msgid.link/20261102-sockmap-update-limit-it=
er-v2-0-e96a63c43b39@rbox.co
>>=20
>> Sorry for the delay. Applied.
>
> No problem, thanks.
>
> To follow up on bpf_iter__unix::unix_sk, looks like there's a single help=
er
> that will become unusable from iter/unix (once plain-PTR_TO_BTF_ID is
> gone): bpf_get_socket_cookie(). PTR_TRUSTED then?

I have a patch that 'forks' bpf_get_socket_cookie() into two helpers.
One for trusted and one for untrusted.

Also have a patch set that removes legacy ptr_to_btf_id for good.
Hopefully will send today or tomorrow.

