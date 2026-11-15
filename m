Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794785806;
	b=iuUBLPK/N/xLaJ4OVETwDfJwSCAcbUO0hSKuXoGfsoVeR00PYUCsd1Nu+K2/2DVE8oBp
	 UUuTVfmazdUZVIuMiBwrnhLi4fQHrye1UWteLF+vLHln7ADf8GhHB2cxvPbfbvVRQXNS9
	 g0v1Stgy/DMr8EVNbL7sWRdq0sDB87VqrIc0IIewtxU0uDgbLSk0LlXHVAmIMuMiXml1v
	 gMABrcq4vNJKgK4M9D5ehYnXVCrnJmwfT7nPDjpIK1DfhwFVTyT+23GDXYZv31iffZQXN
	 IVQMSJdbE0SizcJumnbUG4Y6xxziq29+wUl8rM0Jgzq0M92GubssiS4qiCc9qXpn0Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
	b=PdqzmKTx0Z/3Qq7lYcYdN+2iaGJVOF0gJyX5FRsg+kt/Nc2C7XCUH3eaVDxYsRAZXjIV
	 xipFP1dBxNc5kxP5uKpVz3VfgyUlrnCbCQGY2hwoTE9amlPoKXQnloyOFpqvj2uJFJK3/
	 kpjuws18HkS5mHC22pnmYeRNUv+qV32F4DPn2mF/PDpwma6ftXrIXoHs2BRl+t30xShuC
	 4xlc9Kgb6NL4tPp69PNL0ohRilXQ4DA20fjsoac/hqLWs6amEU5TOEYevJ+mVaZ+m7j63
	 flUOUuj7q+5eIVmutD2QWrqw03ib2PmZCSCA1se76CWyzsZtjs5mZPnQUcIIWRkiKEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Zmpxi2jL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BDD606A32C
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74BDD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Zmpxi2jL
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ac9e15640so1335176eaf.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 15:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794785805; cv=none;
        d=google.com; s=arc-20260327;
        b=j2z3fZMEhYIlmwdT6gOTfVFm/xtpwQSEadVCLWUSg9k+V0jT7XbkwiQRcLFDa9R5BT
         0VNakfKZUN6I/sfHx0LH7v76S9xCh0wlFu6yEYTJHc63w7aYn9d6y2mZaSYMFiwV7rm6
         bixjg8Fj32H1QKbynUx4Kr3c5F2eWuf+TktKjv/w7btm9Xwyqa9vQDbNBxtznPqNvVuH
         H9gDQV4NZSTUZ8Czbd0bKxk8REcTwILsMsPYK8x7150hT71a/kg88RyeJ+/V1DBKTQED
         /vTZRkvGhOOl8nNGpMqoUsqGPCqob5YgwQB1p0zh0j01fOeKlP0FN85wyHjUY+XBQ0Cq
         P7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        fh=5pPIQadMBOs4OdBaY9YZu4TLOZ99F6kbZvKzCekk4UM=;
        b=GdFJr8lsK/r6f/FKcxhYD+2HQ0GRW9vVY1WzIn+8A2eqp5hW5fTMCkcB1AQG/B63HB
         BEejaw5FiAt5vEElaqiirPBvHRIP43OJOj3jBtklJ/kp+4R3uoJeJRRNEhaf6gJF2ey8
         d98JTMt9IrSqpq8n+HANNVbQvzvr91sc9Ghek6PH4+5pt9ZjkuRr2+zqtUm1gOlIhQTK
         raVRZbq0EPgq1vSyDnXtethakndsNGg5+Qm7s1lmkDp4TXDX0ScsGfvfeSHIb2eOH15z
         crJs7thwOYnWaEWoZbMsB6Ulwr0FHzbtlI+DoTrGWOQlQAiD7y052HXjCLXPL435frgn
         FATQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794785805; x=1795390605; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        b=Zmpxi2jLhXSm+xCyJlTdzyhYrYxOhwtwnZiPPOViT6SmtKy4Igqbe58in1dXdljPa5
         odULis3BU8aEvIzMrkCPSOWvtShZW07qQQKGRG/uCEK40LNJvS9VS1MHC+1cK5cE+88x
         Wkakd87wbsOKtHD+85cG9Y8BDYm21VJUwuormhJMhBg6ms6ZqxN7bKewkahZAArP4k5U
         4iyaONp5TNg1pYjLWDT0L0NCPwogNvCbKN8doTyDHkmy/1O8TDtKGuMR+ZhV1GvB4GjX
         YNF9M/z+z1n0JUvO57uhcw7KQgxPFjtEqMAGWnxKoh3OFvh6kp8Z0a12mv3XIxy+drs8
         59Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785805; x=1795390605;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        b=GY8trMlclfzrcuavH50WvzNSLJzF11w/6gVjiDhZ39lzUgnu4jDJT171cH3NatZTWe
         ch89/Fq9KNj2TWc/qqoXRloOkTwxmpBxBwTalHShGLggXXzKA/ger8lEyYlUh1TbxEXv
         GuxuEjRSijQ8pg8UqT+rhvll9cwipnwTCHs8yZa6OmPLjnNwnZVRor58uIkTohUYYT8v
         00JensokzFmWrvB+SxFcVaUGZpWOo2I2deyebibCaPYt87KcIVQc1V90VEdHBy/0cyX8
         E0YZA3Nm1oVkWRbLc9rQZrNElWWw4NDwy8QhbTKvAFGxT2KRq3MLpJ2ZbKOdy4pTLs7L
         PAYA==
X-Forwarded-Encrypted: i=1; AL+hErGGhIGkKmS3ohV20veTSz7+nk0rQr574bxM4p4CiJPhr1Mqx9eMxsnyvf8ebhDE291s3251p9MSo/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oJfZ5+1kKjxaw0Dgr+7vde48zWtl6Nas6TftogE5I9jPhl6Uj
	5Gnhc2ZDK+Jb0/JB3EWoiSCux/kJ6esKnn/CzZP0ThNFrVlgZEUBP9gbOIrtqi/1XagLXzaF0gg
	qiEEivTe/BpBAoGuzaKHT0K6YSvZmsZcxVXc5ejGDdA==
X-Gm-Gg: AYBFou04IqNpkPLf5FjBnaqG+tpxK7etBk+ew9vXfNz8hv6nuw6pCim81kXIeyuvglD
	A2+LrQT+gRJFz/UhgbbKT9LsVuvERMkiMjOL8qubO24XgV9/WcFTGQrKF/vRcxhctM3XGIMbByk
	QGgUn2+cYBwmiCOZOD9coD1m7hXJdrmad1pfodLxcE8i15o5yZAD98aNjcVGkiWsGDCG0OTARit
	puRs3AbHFL9EQEHD1Nvx6E1+4JB6lviMrh/f7IekawKCYOGEPMJVbSTcqtUiRZtCPp9DmUNZeXP
	+FNw03cSnWuFic/byE5sP3J0M/wIjeYBtzN5oCjZXGi/6iPjbbvOlDwS8rKU8Ez2Czt3Es3oWb2
	0P5MdUwc7qjkFJEbROFptOufMcWiXdhnoXi3LR8UscvmxI3wIcdCri7+NDJIL9MwGEKWwPMPwRn
	HPluptGfamBT5YjL6KjVpcMby17Ie93aU=
X-Received: by 2002:a05:6820:3411:20b0:71a:f794:49af with SMTP id
 006d021491bc7-71af7944afamr223598eaf.56.1794785805311; Sun, 15 Nov 2026
 15:36:45 -0800 (PST)
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
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com> <20261115113902.4834dda6@kernel.org>
In-Reply-To: <20261115113902.4834dda6@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Sun, 15 Nov 2026 23:36:34 +0000
X-Gm-Features: AclHuK-Ta2Fkr4hOVhZX_y8Xr7mXxa9_sbD5R_U1pL1RP64y3ME0zGRwgXOH1aQ
Message-ID: <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
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

On Sun, 15 Nov 2026 11:39:02 -0800 Jakub Kicinski wrote:
> On Wed, 11 Nov 2026 01:07:46 +0000 Tianyi Gao wrote:
> > - On veth, an XDP program removes software GSO from the peer, limits
> >   its MTU, and can copy skbs from the peer.
>
> Could you remind us why you XDP_REDIRECT xdp_frames to the veth
> if you end up allocating the skb on the veth, anyway?
>
> I thought that was to let veth run its own prog before skb is allocated
> but you're saying that you want to avoid veth having a prog, so clearly
> it's not that.

Thank you for your comment!

XDP_REDIRECT into a veth without a program on it has been supported
since commit 0e672f306a28 ("veth: check for NAPI instead of xdp_prog
before xmit of XDP frame"). There is demand for it [1].

With or without a program on the veth, and on cpumap, this series
keeps the RX metadata from the NIC until the skb is built.

[1] https://lore.kernel.org/all/20210416175929.35c3c389@carbon/

Thanks,
Tianyi
