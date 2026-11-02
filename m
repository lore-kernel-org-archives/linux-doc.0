Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638240;
	b=B6cnsa29Gun7TtjbbAqf0hBc+oENcmd9/E9KEWi5C2s97KBDqw+LnqGT38j3/uCIwo4y
	 S1wys/sC2XXnr8y38Rl0e4DP6EKpDM4g3xMLJSP4RGamt1QMMaJiNGzZKe31kxf20aHo3
	 CIcMgqpH8/i70UJdnpXiUp5jOamM/V4AjFSeylHvCsCDF8KWt1D5M23UawT2R+XTvjYOp
	 LUT+9TdxQRT+NVWgUvVYFHtWquoKS241+1XY4ujrTReRvTWhRfwM8oVsksaN63c1ssrU6
	 cACx8qa2Sw/fKjvSEbWF4Jd1qJ1LXbpSg0WFKoSAbniI3YHiC8fq+02IvitG7mOSuHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=I+MJWuTHvHgN/FhY5omphd4Ba1tdxtV5zHdjWOwg5V0=;
	b=4tcBYt31wXyqg7Sm42ZBi047ZZK1I9UuTAxw+wjVHhspwQ36XpqFOoJ7m9NQoNQTE38o
	 Ozb5CqdejcAScdSNmGzTghas8s1CFsRSpEc502QVgbF1vHNoWDGqCCvBGQr8K5z9ZRYi4
	 JnCnJHNiFl39nI/yk9dHOVDhgbARPfIfrVtresrFfS/GdkgBqlc1G303ccYn8oLZ5oZDn
	 H8cdd6uBfVxManngwM/BEaTpNKV75NSc2wz/kYeejTSTQYSZEtLFL5dXTyktSPdbPG3NM
	 kDZAeXjASt9UKkUvctxTwHGgjgS6nSVV4wlKNO/QyWcHcp5GTFAaMs13aC1YY0hMUog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bS16b14r;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C876074670
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 16:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C876074670
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bS16b14r
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1364351a12.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 08:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638239; x=1794243039; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+MJWuTHvHgN/FhY5omphd4Ba1tdxtV5zHdjWOwg5V0=;
        b=bS16b14rPOrL3wo4ue5Txv+qnV3i3hmCoMiwjUFcZ2NO+0DnPvtzWW4UzXlRcRDmED
         8lghrxfcDBb/NrgVeaPkPP1AMRPtPXwrMCqbr7q1u02svA+63NbtsPLtZX6YsFyMlxba
         LjmHqJnMdbwsoPeLBe0PgE1EE779Fx7MslOYPUxveDssom+iac/04doEZuQmrlrb0+w6
         nI5Arqpu3To6Pq7TUFHDlMe1+k/YUumGYmRgLvI8M8orbsAMeNRrIvyRXUYYuHT3FLuu
         s4/65OwiQ6Q+KBGInUl7DEEJofV2FMe8Tc0iEFliJ5Y+JTHyL3RTfcFqHzYdZcS+jAE4
         Ix7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638239; x=1794243039;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+MJWuTHvHgN/FhY5omphd4Ba1tdxtV5zHdjWOwg5V0=;
        b=oa2YK9j5dUbKbCXyeGrDxIMvgXwS4hGvv5/QmALP4+4yl00jOL4GP3p5dTpup/dL2E
         Kr7+eHqtn9LbfSneJQX5+tFE0sZUVrRYFBG0l8cbRC45tfZ2yTuFivxksTldrukpGxCI
         Hxj8nArEu3mAoGPznqjuXvToCHSRj26rzREbtjr8oP2zRxLoHp4rdBlmEmzzdU+D0IFl
         ltp7uTU4mZmOg3cx/zBW6ZK6BC7oVHjcvA+x0fHSsE6YdJwXWU9sXU3fSbFsp5XrF4RT
         pdVoz5ujQYV/RSOJhFlxFpgjJqJVTq2omI1C9Gu7J3/mD9p31FdJuJ5rh0A9VsYGREyz
         mWQA==
X-Forwarded-Encrypted: i=1; AKwUvBxxIHr7Ixf0Mh7HuGPFnxjUN5sWxT3/CtgkAY+Rgukl6922QtkzbkO8xiT65T1dMeZnn2BbEnQNFJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+77QGtGm1j0fw+3Fo2IfFlYrfkVPqGc2MKc/cyxIEKoRvfvwIz
	xVWK9wv6KGBUn//S/1yS/excpRztFJuSk/4L4tRHhSFHsPzdjKxxnzM4
X-Gm-Gg: AYBFou0BEPjlWB7IGl24AUIRZuSbCpzk9xXHyzFg0FdRXwL2fj4UYElLOWLomb1OX8v
	UqJjbyLwrAhQP+ds1UzZOm5HZVObpzDmvrVY2OaJZ3F+8vjUM57Cp2uMXNy37PvxWx4cTwoULlW
	RPKqrb8CuMXX12bZGg5v+3+yXjuzvvwLCVFMg+ceAYha7CPxAZT3btBg9Q+dsq8NrqNt8q2fVlA
	jDAUn/mr8RgeVfxwS6BGrWzfo9OJJbmPuqXCXnvj0pZJerTAqOiAcsoH6gEbdLtyuhDB1m4D7RR
	1ykCYDVgLT79mFjFd+rKCa5YPB+BAD9UFpKB9KE4kbt0KtIQmGh5Z4oKjemyweliFSiu5vTuHef
	CPk2IAuRTwrPlTY6qpNgc+e4/ykH4tp1aZk5JnKj0/5nUd9zxDXy8cmCA+GeTsCMLlslmPNE2Ma
	LY4EuRq85aMVLrwhg0MSTtWtN1ZNF35PhQvSEKtd1RkKQzW0lAdSmOXUyQEOj75VwWsFcqmt5UA
	6BqrI6m4t0zVRi+M4+elKCBoiCOOowhCqdKvVT3jsHjEgKA/0an62bgzzmQYBY6OPbS+354vCyB
	VukPvEVrcJikyW6VpoUjncYxD+dvc/y4eql2iY00N/q3kWGA7xD0z3GN06uCXgHgLe9ttBny8jq
	oQiOTwXLdEdDqp0CD1SKhY6eNv4D/6ZPTaA==
X-Received: by 2002:a17:90b:2d90:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3ae8957cca9mr8105797a91.7.1793638238825;
        Mon, 02 Nov 2026 08:50:38 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84542a13sm14956309a91.5.2026.11.02.08.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:50:37 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 16:50:37 +0000
Message-Id: <DMKVOUX2GDZN.2Y8MKLR367NU8@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, <bpf@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf: Use "new" URL to show if net-next is open
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
References: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 03:15 AM Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
>  For non-subscribers to kernel mailing lists, there is also a status
>  page run by David S. Miller on net-next that provides guidance:
>
> -  http://vger.kernel.org/~davem/net-next.html
> +  https://netdev.bots.linux.dev/net-next.html

The link is not the only stale part. The whole paragraph is wrong.
We apply patches during the merge window too.

diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_devel_QA.rst
index 4729efd..f6b9533 100644
--- a/Documentation/bpf/bpf_devel_QA.rst
+++ b/Documentation/bpf/bpf_devel_QA.rst
@@ -231,19 +231,9 @@ load or urgency.

 Q: Are patches applied to bpf-next when the merge window is open?
 -----------------------------------------------------------------
-A: For the time when the merge window is open, bpf-next will not be
-processed. This is roughly analogous to net-next patch processing,
-so feel free to read up on the netdev docs at
-Documentation/process/maintainer-netdev.rst about further details.
-
-During those two weeks of merge window, we might ask you to resend
-your patch series once bpf-next is open again. Once Linus released
-a ``v*-rc1`` after the merge window, we continue processing of bpf-next.
-
-For non-subscribers to kernel mailing lists, there is also a status
-page run by David S. Miller on net-next that provides guidance:
-
-  http://vger.kernel.org/~davem/net-next.html
+A: Yes.

pw-bot: cr
