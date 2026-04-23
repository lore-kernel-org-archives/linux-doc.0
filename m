Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4867B2765C4
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 03:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913621; cv=pass; b=PWzglRn7EKgt1rvdb5qaq31jZuh1hfuQSj9mKJzOY7V/C/zgt4P0/d2UlGc6qji8Ub/cEVgxGJyDJRNMPfWxQlSUK1KIHzd2TW5+TgPgcwXQN/cddJjWwtICJWax745znT11Hd1MGx3Y4ZhTyUCf4Mo7lB82m5iOnnBEfDVjjA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913621; c=relaxed/simple;
	bh=XCLXDbphdhLQ8I7NEFQiQanixH7UqHhty+yjIG/7YyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOxQJIh6kWQKY+a0wlGtJhUZKt5PjlZC8fkRwgMq6sPgSkhrZXuZlJlHdejw5iT/ehxh4R7mD/uZrUVoSdrgHNhYVxTRgfnlMU33L5MXcJ/hVwN8gaAhaRzrJ8XKZX4rSjc0JTl5nl3nxAHS5UN5eSLBobXosATnpkUxF19QCP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ej1N1txR; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ej1N1txR"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2de831d2b20so3535501eec.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 20:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776913619; cv=none;
        d=google.com; s=arc-20240605;
        b=HjpNQOGWmtvI5jR6EmKtUXV4dDIwuofI4Ml66vtduLre9T2Y0qOCUDqxBegq/L/Tr1
         Yzfs+jFE/dgVLZfR19BQg19kVCCIoU+A5FnV/BW3guBs9Rra+IvqCR8tpEu1LU9WlgnI
         399NirHe3Xbp3L6oQCzAB5vsD1y1S7Wsf42F8Sdf18hLRTY7FBbTj3Q1Nfk/QnHNdxOb
         g3XjZXEMdzagp+I8PYwb4B/HuDVzIb/6deT2D4PfYH/bwGCORqhdSNro6ckJn1bl9Scg
         nfUJriDuTScEwxh/vbVtgRtIdZoSVG6QOn3ad1z6OxeIXF6zNCTiGw9+Bxhw8Kff62WR
         mZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XCLXDbphdhLQ8I7NEFQiQanixH7UqHhty+yjIG/7YyQ=;
        fh=bJNPrQbvPV36T4YR43acasD1XegMGI99SqkXVxeJzd0=;
        b=i4IV1bdtKxWvgUSeozrXsl5aL2SbSESVe4Hcgbldil7SnkbAwCOolub+Y2A48aB5C/
         9bQkoK4Rl7wSoPSD9wQeyN7Mks7TjufHVlqiK9V7pxvrBn2ouDaYyee/hJ4ZnheWDoRL
         S7riZP+5ZQFY0beIM4nkn/QNO0hMj05cxS0t3CKT+bGi5kPRXUKeQlt4M+VyOYHzzGpz
         8/WQpnZwbZdNjD08X6g2a0oxueCc6QHr4euC0ls8kdb6dBh4yPGhnSlVG6le/i0TbwE1
         bAPXZDbV6y3UytmeaYeEP3f/zoXRH1/qtkInofQCj5yGwa4CLILledivnQlApJZ81MNS
         BrwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776913619; x=1777518419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XCLXDbphdhLQ8I7NEFQiQanixH7UqHhty+yjIG/7YyQ=;
        b=ej1N1txRZVXBkMgsUrykOzJKn/MqbcJKlGZUKe4lnycAS8NPyPEpRLAX/T33qNpbS9
         eRJoKxAEZyLiBK0XaxPKYzkP6v1RdRdzOwch1CochPY75yyExkZdl6wqdB2UR/cT9KGN
         XS6J8CePVkHpDvfEW4eQ3Mh7qmCI2FXYBQs93+NBc34+3XUGu/xUCnwCWK+nlmDwd1gK
         rHk5TT9X7A0yrxByOGSigmQiST27c1mDDZDilDYcoGS/uJe9QNdS0trGyYnq2ohDmZIJ
         r0r9fj104cE5q4xv6IabjccFCCi347D2P/jbc5t1+zMCZJ7F1yjhcVjSa2peysZL8+hJ
         2YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776913619; x=1777518419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCLXDbphdhLQ8I7NEFQiQanixH7UqHhty+yjIG/7YyQ=;
        b=WNdowcKskustbvHWWIs4SOa4XImNKiFDVAIJ/RitC4Sk6tCjb3tZDIgNnbDdiHw4TH
         tCnbTvgdd1FQVGYQ8+6/Avp1QDcX7XLMUKuWluz4BtZV78zaO6O6qYdRNag0Ki/0J4pc
         lk1aFjhiah3qRZrSGa3OdD2lTHpb2GeQlVv9UNAN079sA3kd4T+cZhsnF62CKXX2v+V5
         yKGCL07n4exUDV/Oxyz4niqZlXSHjclGER02nsqWZwH2pAKFRbNnBcutw2m8KEQx9ML6
         7ffc0f1/822iJvyXdySbQ8iYRfy3849So690uk2leRh8e+Z0rnrzGgYr+z78ndBAxUjM
         PgHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DE4xxP0+7obJc5mFwZO+LqsdEiMOSsCm9R9deglgT2ZfOi5GpC8YvuFetwEWYYgh+t+zJwf5j32I=@vger.kernel.org
X-Gm-Message-State: AOJu0YynwC2UMbRfXC38EewpSZEDFsa/dSUMzVOvv6c9um5QBYY5myLP
	JqpaYM9c08TPQK4B6wPsP0UjxlbvmkkDQsONuvI1uiKz3Yqmdtmc97sxITqJcEK3pEtSNe7ubxf
	tUVTY9lUlEI2zpK3UAEdKtzVTVL4z1/kJJsZQ28xq
X-Gm-Gg: AeBDiesVWKWW778W93hs97759W+Md/9UprBvP+Ho9bTUassmnH/lEFkixCFLC4Q7Awg
	zn6bFxlPdm4j7U6CFsbowex70XiG34Lm4odYnAgjhHu+/vqxs/IF6mwgpRPh3squbchxLyvxh8j
	3uUubEeXwSJoY3wyd8X/qIKwNGbTPZhQDdFLuvc2G08NzYsapShD+z+BN0mL1LkJnK68pTyVojW
	5J8RYBZXLv6uDrJU/1wsRm06D8zPcw+WAD29Fzo2RyPdF0y7rDo7wX7KPIaNzTKHH+mDpsLv9KR
	9dK+HCH2FFmJiMzffx7i+z7N4oaVBQK0E5cU17efb5Tg8WeI7086W1E9Qc+sx5TH/h5lZZ5PqPK
	xwREecChHdJypfI/BQKewjQDUFz2BeHEuGL6diM5Va/dUz93WyBoyysvq5W+2UuglZlzOzPEqFg
	==
X-Received: by 2002:a05:7022:eac8:b0:12b:ec96:c936 with SMTP id
 a92af1059eb24-12c73f70bc8mr14367576c88.14.1776913618818; Wed, 22 Apr 2026
 20:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421021824.1293976-1-kuba@kernel.org> <20260422104522.GK651125@horms.kernel.org>
In-Reply-To: <20260422104522.GK651125@horms.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 22 Apr 2026 20:06:47 -0700
X-Gm-Features: AQROBzB6Gd9vT7YrdkLSBHh2mcbacrp5O3_yj1j4ISHF0fFTaxESKOHzNGh7T24
Message-ID: <CAAVpQUC8N5+V+ZSq_=TVf5N2f=L71vrRsyo65U96V17as8+0kQ@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, Simon Horman <horms@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it, carlos.bilbao@kernel.org, 
	avadhut.naik@amd.com, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de, 
	dsahern@kernel.org, jani.nikula@intel.com, mchehab+huawei@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, tytso@mit.edu, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, johannes.berg@intel.com, 
	geert@linux-m68k.org, pablo@netfilter.org, tglx@kernel.org, 
	mashiro.chen@mailbox.org, mingo@kernel.org, dqfext@gmail.com, 
	jreuter@yaina.de, sdf@fomichev.me, pkshih@realtek.com, enelsonmoore@gmail.com, 
	mkl@pengutronix.de, toke@toke.dk, kees@kernel.org, crossd@gmail.com, 
	jlayton@kernel.org, wangliang74@huawei.com, aha310510@gmail.com, 
	takamitz@amazon.co.jp, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 20, 2026 at 07:18:23PM -0700, Jakub Kicinski wrote:
> Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> and all associated hamradio device drivers from the kernel tree.
> This set of protocols has long been a huge bug/syzbot magnet,
> and since nobody stepped up to help us deal with the influx
> of the AI-generated bug reports we need to move it out of tree
> to protect our sanity.
>
> The code is moved to an out-of-tree repo:
> https://github.com/linux-netdev/mod-orphan
> if it's cleaned up and reworked there we can accept it back.
>
> Minimal stub headers are kept for include/net/ax25.h (AX25_P_IP,
> AX25_ADDR_LEN, ax25_address) and include/net/rose.h (ROSE_ADDR_LEN)
> so that the conditional integration code in arp.c and tun.c continues
> to compile and work when the out-of-tree modules are loaded.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
