Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794962588;
	b=WyS6VTn0km5WNq8nZaprBLtW7dw6EoaMHf5bKoREsaHqfUv7X/w09v2O62PDVkM5GVGE
	 ozQGtJV0IXVoYVzl7twnTnLAPWEz2hwAL2M6MArjlgfL+HlWguD7orYPkwpbwr+bd9pp5
	 SiI54E7JOYn+6dcxuo+htCLz6AFHtKNj0pbtX+2WoBHEWHi0FQcvPfGq0ea750MqLvRqz
	 GedPmbnjmlIi3TTCcnPVFalzQiV+pRJyyYONFz4F77XDmUdcjDZQFho8ILEs9i3y9ciDN
	 SIOvdxCAzA4rULGLkbMZHmUUyqeOUffCnFLocOY2sfRsSISMGa2l1jM0NNqPzEd4z5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
	b=Z5J5MX60e3Hs0qGAVsQjpw9MXkjG0mgYmbDaVM0MaYEJ4UwVd6LK3ezgrHGN/EC+fpOP
	 7srKTwPCdy4ZiQB4FhG/b9BnmXp+wwrC9cDdUwL4MzqJD97fRIGJ4DjUe66JskfntqH2D
	 3A/ZkJd+xTuLHunGaF+1lVttrkhgJubPo0Ctz1YxSr8dO9o9Rv5l7FiW0+J1V3CsoIc0B
	 0dpG7nFRAXCFU17WyDaVk7EJOlpbojScWZOIn0onbLIWQiPa+Q6VOHQgRn9QsHNxl8pFq
	 tgiJ3Vp0WrVLzxWUyIcrk9W2yd8aGzMV4xD8Fl5JXMddOh2yMC5XR64g6DY5lGvewiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QoQgSM7k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D5606A339
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 00:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80D5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QoQgSM7k
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4adae187d94so281991fac.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 16:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794962586; cv=none;
        d=google.com; s=arc-20260327;
        b=nkYaYG73yitPVc23Ts5mC2HasAskCeyVpCTz8IsGxpH/PbkXJPcnJHWrSoebMgkpqI
         D0w9okIiaSSSahyXmD8sO7Ec5Jd/foPYTPRodI/GYgvepGk0xtdVn3xNqsysme3IsMv9
         vEgZyevfqMrmi7GMyuyrkDxPH6OCV45CnG3w9blqMtId8+qhI7W09Drh+On0oUWP02tJ
         HhQ8jVArLiGetlrlN9z0Zb/GGwZELZJJmUwlbMoq5Vm/NLYOBg68M2Kw1QsLNRU/us09
         SE66U7M7OQlaQvojG12GxesEf4rRbU6zQYDVksGRw3+66uUnTQ+UHzq1j2yTEkWaQfsY
         QZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        fh=5WA37xYnDg+QxqCap8sRG8MUHLFU4NaVAvXb2xapXTY=;
        b=KrT1G/fGQtKQAAc4L02tcFVC8LLaX6LrvoD4ZJ0jlYRzMITy9eFknb81VdkOZI5JU/
         aY+ULQLPd4zilCtTHDgtCNT51bz9T56IGGC2krvN8H7IQWPpprS2Gf8szXY7/hsRcZ6I
         +R7WwtManfOKPmBd05J7O7H4afX0qVMbpLVyXDhGzdJIgK6VqY2kVlhR0xnlCNpk1xJc
         hgc+/IjvHUJ0aUgCG+ZqoY2YVKntJIqyYLAJsXMkT3BSjWPHYKx3lFrdyC3VhtBYzczI
         sveyghFY01JC+Jnw+Kp4l3lb4rw/Jgno5d6UhowAOl+S3DiaMQ+JpIdYz5OE/iP+LZJl
         YKJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794962586; x=1795567386; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        b=QoQgSM7knlmQduEbalOghi/sOtbUt1RV5d9sPkjYyyVMIE6R1Kp7b4wimTkhe2Yx9I
         bQMdOzdqMed+XivU6bq71iIaeaVoVc7sZyWfap2u6yi7mll11YX8P49J3lvA0YXdc+nX
         ZTDSbaBadvIpnnxmFa+Tri/OuLybsQtUe8BaIEz6Et+INEWS1J9mO6tqyrP5pRBfS2ys
         K8BEF2IqiQQrqxBY/1lNDNLhABCxpAGq06QUY+MXEHZICS9TzjnYQKppfWjSpaRhGIBF
         ogBWvrfRSzVZPHTPGNTRNdjyZ58WBn0UWOcANINrg0lCJV4LPen6qxERF29IH31qzMuS
         ngZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962586; x=1795567386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        b=jUCA3gYj1KaGVIOigcuVIAG21l7uFvHHE5a3CpXBb2cFwHzf1N86D4XlJ9Km0D0SeO
         Pv5qrnGWtvwO6Wq6RqQKiPJXDJfbhuWFUQCDm1LmRxQsEFgwTwDdKjeaJGNzH/JnR1VX
         33nkSK6a/ikfDBH9IQ8HsRODEdfcu8wPXWMl/DQSC7ERRG1G0ifb5pMwdXzMe/dHIEiG
         ppzW3OHAo8VBa0aMVs/JE8CVGmlkwJzYe1DdAhoGhsIxPWwoVBQJ6UFci00H3Wdza8as
         5JXW3WKgNhdWsNURteZWb4sZnkb1WI26RjoLnUeTT6iZhjFTcbJW0901Yz6OznUXwuAl
         ZuxQ==
X-Forwarded-Encrypted: i=1; AL+hErHYnQTK3+np4EMqY+dq8eGvG+o+iGKvOorr6n0yGzpy/byF8n/I+nwIWLfaRVu+RPQVsvSOzlpBbtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iJbG7tkeKVDKc05BCGM11Rjud4cjoM2XreOy9/c2auiFX9kH6
	Acku3TxNa48rlQJk7MhPt4/Bmq6dYVA0sSwc7QUcfeMn/Byuc1ygh1FwNorou2stQuVuK5Gv+H8
	oD4mmksHFS7i7aU2wcaHvsopKqvd2jo5XN7JHH+ZmUw==
X-Gm-Gg: AYBFou2WqFEuXnCQmkX4/PKLBXQz7Nj6j2+99pkVRFcBAojxSuFwYHLbbwMPyUoJP1e
	40D8EsUmRMjOmqa9PjJ64liAdj/xu4Vo+RX26Vywk4GuV2Avn/zX4zaOw8q0hRWQGBu5Nqs36mk
	U5WxGVO9IUVghXdbEvwNcbNqA8jDVf6FVZMluryI1iX5mAGBMFBYHLGBGv7oRYc5cG+YT1xNY4T
	+NtsYUP14rDi/R3cqHwKUTFV0QWRkoOu1pYAo4I+Moj85zBik/AJQbbsaXiFYZMTah/A/kY6VTu
	ZIR96dLTjB3sQxioU8nGl9bORBE8BE6homsxRna/GK029WsjFqGub/TEmCocr38lym3CfSBpQ1n
	ep9Vo+JYvErveMx0PQcMXbKDaQsV7tN0yurfz/eUJCyy0wJtEEkhusTxYA40kVDKferzXwEGexR
	qpijiBifJh/w==
X-Received: by 2002:a05:6871:b11:b0:491:47e1:6280 with SMTP id
 586e51a60fabf-4b75bb74ec7mr770348fac.15.1794962586147; Tue, 17 Nov 2026
 16:43:06 -0800 (PST)
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
 <20261116142710.347e8571@kernel.org> <CAG4wq-cDYa2GkpWSYeOLwEPv45BtucZk+r=N2b1Srd=gUUO4MQ@mail.gmail.com>
 <20261117161856.6f6c2ce9@kernel.org>
In-Reply-To: <20261117161856.6f6c2ce9@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 18 Nov 2026 00:42:55 +0000
X-Gm-Features: Aa3M54r-Qn1bATmm01-LGWkLr4tuoSPVNlK5FfS3xcLFtqloul4EQ0s5CX5Sq4I
Message-ID: <CAG4wq-cQVUJgizeowhr4s4Z2Q_o0_dWfAwzXthpBATBB-7edLQ@mail.gmail.com>
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

Hi Jakub,

Thank you so much. I am really grateful for your comments, and for
spelling out your views on this problem. I learnt a lot.

I would like to share how I see the problem. I understand that you
want the setters to mirror the existing getters, so that the metadata
stays with the driver. But I see a fundamental mismatch between
reading and writing the RX metadata:

- To read it, we must go through the driver callbacks, because each
  driver keeps it in its own descriptor format.

- To write it, the target is always the xdp_frame or the skb, and
  both are the same for every driver.

So to me it is natural to set it all at once in one helper function.
This also makes it much easier to support a new driver than
implementing three callbacks in each one.

Overall, I feel this has turned into a deeper difference in design
direction. The same question has come up in several earlier series
too. I will discuss it with Jesper, and we will come back to this in
the near future.

Thanks,
Tianyi
