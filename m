Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794873355;
	b=FiBWJCrOmWqbud/Wigw8PM3Bn1l3vf+K+HlEstY0qEowFAGONa0zmvOxSJhOBbE/BUQc
	 0EdTKf+gLWWXthU1Fvl2toV4iyUomd3Sqq/BETLOBpsGp/z00oJqA8pVEzu/0Y1geIRX2
	 5I84krYCUyItoV3regOc67PsUQnZ41bOqucK4s1qbRhXv291TwGYA5hPQzfQd0dKHopeV
	 jN9VwxRGn6LF5r+y/21as7PySSkR8nps/gmcaPFZkSxq9os5YB7DkK8Bb737DQ+iUXu0J
	 1fTud/NbaT5h9TOgoYsMVa0OVFL67fFMBHlcRgfvBkB2nZz6bCUkIazp6XXudNz2/fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
	b=JlDOluShnzvFEKCAhw9/nOI0+x4f03wNurOpr+mxE+gSZOXEqrT+i+/O7DXM4IFswwvR
	 ne6qcMuxNWW94j5f8YX4KhHbY/dm5LmKIcwPqIGB2TfI5e+aNMoEJKSDkUnv+3RnkFfwO
	 NtgCgnXii8y983Doh/mSTcD7Lie8OPQYEHKGHOIQlxAn5qY/1yR7X53lvFOokhAy47m87
	 E/E226JKRU4S7YOdErG7ve+guZ9+IG+1jCb/ewqsv04+t9ZNox0vudNEqgXcm2Y3SSA4E
	 m/XL66ahykG46jVBEU1g0R7PLObJe9vBaObuH1nSXquCoaHeBQi8Ci0u4zUBSz6rzrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=JAkvmEBC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD96B606A323
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 23:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD96B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=JAkvmEBC
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43bf9548df4so5386409fac.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 15:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794873354; cv=none;
        d=google.com; s=arc-20260327;
        b=BDu2WJIPqJK47sQMXkG3AuN7bHepbTxHxz96EtgR/wSCYWdZ5Xj39v5gjAU6UtJx3i
         ati1+pVOTW6YkMH2mc1JH0wlRRRUuttbPJ0QQXtRWlPGOS6qFI+C6tZIXen9/3KbACmG
         +tg6x2fTj6N+yaRFsFUfQp6Ladj2QATaYyVZYGIT1fkJjJiWSD59OfaYpRlPJogANpBT
         tY5ymZstnG5ikmdOWvvdwFRalpyMgPaYonRsQ8dxkpkErqk0gVwN0cf9ZFOZ0aZhs+by
         Rq1lhRm9qdXkbiSgP8LpBnGluPWGU917JRbuiU4Q/L9cLMhbmAHKsInItVcMm68BF/pq
         DThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        fh=xsaXBP3/1bvGW1Y3Z1HIIhoQ/9sreUkkhNChSZiVPxk=;
        b=KdKrXDeeS/MIl6IpuL62psfIOKTHWfKRGsto9VQwrSsvrctISQb+grrWLG9lbm4qBF
         ZXsYAS9JGqUQ6q1v/4AUbpTPSvsFILOFcnaXCYp2W+c/y4cpfkCUgYfmexyVK18Sqc1L
         4nCjFztmt08GXxqWf0mRzXWGQM1+JsRZli1YRUUEYwXVDde6bPy74Aeu8OufJ0SzH2LN
         hwNzYlyst/b2bjpnTfrWqJq6ulW+Hrr5X0DW8bIjiVofJ3QMc3hSIg9w609cjvdjtRVK
         KfD2M0L9k2o6xHN1cbWatOcAmbKcGSFQsi+O758O7XjVpPuQOTlU20iqcf+Wb1hPDrlc
         eUJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794873354; x=1795478154; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        b=JAkvmEBCaNDQqwC/zKowMzj6cpiI7lgA6iaz0LI7B90FIdYKT+zfc8mHOfbT+8rfmy
         SkxZwQ9E/3nRcFpOdPfK4YkO31ptJrj017y76GEN9o+sriJn2LpPhsvGdy4+6ZVs7P7b
         gWmNIxbWSERHhTKd2zkL1m6C4vu+dM8FCwNbEDFmf98bujAm6BesiHJVeKB6Mv37oIXE
         DWAm2yXQzqAAVjsc+DybarNPT6YXVie4MGJHRFFkjGvmOyHEShJDDqv0maNaWckg64Z2
         L/XJP7qjo7r7unFg1B4QzrVD6lfR0b+R5Old5lYIyjznlmAyd2cbZ0Uxx0FLIGVM4o9N
         a3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873354; x=1795478154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        b=UdB89ko1xks+z8NDZNEPN7EtLw0mjDE9LqFLQXJpEjXdWqsr6SKmBRVBeeS4BioOpW
         pIXj0AmQUAGnyA60oJTqkmmq+CIUplMbEp2ia1ZHNXtqgJ9VFpCGYKyzS01spFXmz+q3
         FcSSkqrMJFow+BMDvJH+JcNGW6oMYDAJb5cI/vk50MmReiHwItwPENTCDIUVLE+K9AGP
         aWweqgqQYPWljwC/jhjrCTfyyU7o6JBTYrU+Gw+d3mlFKPf/kFFk+vCWy7RcLLRYAbOy
         f8eJ6VKSAtHkMVkzMLzmAui8N+nXzem6lVDjiGubUCHL6HI7G64hvtiBH0MAnAFz8BHu
         A9Hw==
X-Forwarded-Encrypted: i=1; AL+hErG0j6n9IVnHHMo/yEuf3lAQ4vBmWHns8SlceLHHyfnk5vTEUg2QCVhuuFT3sKCjkLJBLv+3RWloZuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rV+NbhdGkCUvv4On6kP3seEGh3hkjX3ZJFLDZHe7RmrHU8PlN
	91TJaVJPcd4g0hWXC6q52Fim8f7LEMY0PfC+zcYVsk8AoPa3ASChCDihvSIgVIumC6OwQSMadW8
	+WrJkrMaruGvFQzkgY9AuZfnre1ExTOEaSMiZdcQM0Q==
X-Gm-Gg: AYBFou2A4UpUXfFDpC8PP2qkFp164MWuAjquxXxlXcfKkCikZoLI/mdHgVswliiMFTf
	1zpmSx2huM0vmbtEYUf7siRZYZH+lB4I0B8MvbXktwMZtZa7/BUVfg8qJd1CSEsq4wyFxOgxjWf
	pC+dEtprV4hvTH/eUwCpQb3V0AYKdQjC5Lza+nq/ly7y8xhvjI+VkDUa2nUD9asVEtZxNePnY/+
	LUoi+NgldL1sV/5EuthrJcmXITg2JJqZx8uCfV4avVW5V05V9QmNHPUz85Snl7R3RcIV0oYhlik
	XFWrCHzF/hv7G+7hY6vDMMa9aGdSQHCymdh3/BWXeDzuCFrwfpWSACPVJ6vPF2y7RGcKAT/kGnG
	nM1JHLig8/UmNFjo9JeNP2jriqL9AVXfL/zHxKJFgIyrXLilX+MCvXKk20oOfv9xwuVdG/fH+d0
	qSQTUm7ZQj9g==
X-Received: by 2002:a05:6871:b2a:b0:494:b8f4:9a22 with SMTP id
 586e51a60fabf-4afdf70bba7mr10365207fac.28.1794873353687; Mon, 16 Nov 2026
 15:55:53 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
 <20261115113902.4834dda6@kernel.org> <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
 <20261116142710.347e8571@kernel.org>
In-Reply-To: <20261116142710.347e8571@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 23:55:42 +0000
X-Gm-Features: Aa3M54oRvcr-c3A5HCcCKnOxqAqDaGkfnfsAP0Ey0SL0I7zgF2gu0s6ZsVqnle8
Message-ID: <CAG4wq-cDYa2GkpWSYeOLwEPv45BtucZk+r=N2b1Srd=gUUO4MQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
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
	llvm@lists.linux.dev, kernel-team@cloudflare.com, 
	Tianyi Gao <tianyi.gao@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 14:27:10 -0800 Jakub Kicinski wrote:
> The question is _why_ you use it. Let's leave the cpumap case aside,
> you provided no legitimate reason why having an XDP prog in that case
> is a problem. With veth - you are right that attaching XDP causes
> problems for pure skb traffic. For veth cases, however, there's no
> strong reason to delay the skb allocation. Hence my question.
> Why not let the driver allocate the skb if we know that the
> redirect target will need to allocate one, anyway.

Sorry for not being clear enough.

On the setup we want to build: an XDP program on the NIC does the
decap for all traffic. The services run in namespaces, so the packets
must be delivered into them. Some services attach their own XDP
program to the veth, and some do not. The host does not control the
service's program.

For a veth with a program, the skb path has the problems you mention,
so the host uses XDP_REDIRECT. For a veth without a program, we want
to use XDP_REDIRECT too, so that the host delivers to every namespace
in the same way.

In a minimal benchmark, pktgen sends UDP, and perf stat counts the
cycles on the RX CPU. bpf_redirect_peer() from tc costs 3% more
cycles per packet than XDP_REDIRECT with the checksum status kept
(mlx5, one extra __netif_receive_skb_core()). So one XDP_REDIRECT path
for all namespaces is both simpler and cheaper.

> Since your patches are not a natural / clean extension of the existing
> infrastructure - we should step back and make sure the use case is
> practically justified.

Maybe I am missing something here. XDP_REDIRECT into a veth works
without an XDP program on the veth. To me, it is natural that the RX
metadata also reaches the skb on that path, without attaching an extra
XDP program.

Thank you for taking the time to look into this. I would really
appreciate it if you could point out which part does not look natural
to you.

Thanks,
Tianyi
