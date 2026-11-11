Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439265;
	b=qAm1wY8sSaS81ykeDWQpRZ0nueHNl4gLN2A9bxgHWOreoezGZ9ThIpIxmkjQs1rwZpSO
	 sKGYY61tlQ/7ChsDhTkRT3239PvhPy+/bB1Mb37JjNZJfYW32jEL/OorlyqsLG99HVxe+
	 A7GokmVRQdKsP+Jx2WfNN1q3X7G0l0sscDpD7h7RJ99vWFc5XgjrRUZbgYeI/vpzek1D7
	 QjBBQVcRPDk4ZDbAixfwURbeacR/cyQfg7Kvpozbakrjn2DJY1cSLHKeqajLD9kfEt+FE
	 bhAF62sB4BPPkpJFTabj7+G2hzeoeE4pf8OsV3VteDXO/CN90OV+3YbgdTmqsyoksvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=KNu4FBFo+NiXU4uk2EB8iN37f7AOkMfz2eB0q/Nmt5s=;
	b=bVth3voE7ObAirGw4mbKAiyO62N6TrTTLyHneZkVh3SY3ACQ0LROyV9KFEldSMgsLGCV
	 U9rQPrhaF1npV2YpXLoGuCev+ta+4f1czQdMclgODAX3bgPWAwoJHrXatr2JtOIbT5WcT
	 IcOlv5cgziMNgZOE8W/eod3AtVkcyF2v298E261+rpTZzqRrPJxbiTP1L/z2B5HufqGg5
	 PxBrLReXm/3wBwrfXqhPwWka9qd0FY6DAP98KoLuFxh+LAiKnSNQVttheTD9fngJujvZJ
	 ltek+0vR0NG00BqhJbpJf+xll8WBmlMq1AbUJffVAEwFP9FTODMkjp9c5NVEJUyaciQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PG06NK+8;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09B60A2616
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 23:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E09B60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PG06NK+8
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso2244925eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 15:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439264; x=1795044064; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNu4FBFo+NiXU4uk2EB8iN37f7AOkMfz2eB0q/Nmt5s=;
        b=PG06NK+8sjeCnFGsPkv7biN/XWVPp8cx4Zvam/TsDYmOaiYK6pe/9gJPX+5xFQMDwG
         FI7ZSXarOy2ZHCcYR5HKV+yYkrekblBvCUk1vUXz8MBnle4pAyi/GaiRzj0Y8Nfhmwvr
         OtfaG8jT6g6qhd4JuBpdh076rXDErLVCFrVlN+o2mFB/qS+lMM/hs33G70qIsK6M4TEJ
         J9VDq8+u00RPZUP2ARQzoVo6UUoByewIDiHYnMAJTB80Wztg6WOV49S5nQpMmODo77Cm
         n18RFe/aTJZ38OOYzqUaC6AVSKP3D41+hpBAIqwtbHebYSyUXCxDDrF162O6k1hWddDh
         Thdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439264; x=1795044064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KNu4FBFo+NiXU4uk2EB8iN37f7AOkMfz2eB0q/Nmt5s=;
        b=vBtUsY1P6Pptz26GIHswxdpMh0kzTsxWZQjGcmTurDSEaFAvABJB3WWE4uYY7ZzTdZ
         UxhAHZ+dHDv9Tq6mZBADyUMpoW7EWZ3JqdnqRsRiRj/gOccH+jeQoL1AxXUejbEXwU/H
         bA1o9nSzaPmHWRBxfNuTaz33QQ3xPt2DGY81JPFtoYRxRW1UVr6XnljYGoakx0dhNGCW
         0rQMniY97v0R/JZtxzzEM8KdS3WC5kaf7q/IzTIcTRO/TrtRjGRGIguUnMi7dyRAAxru
         LhcijrYDDN0K5Vh1vgGh8Z7ImfrQKEt6JfTHZS7K2pglDVy4KtRgQwbKGR2y4trvg+fL
         rLHQ==
X-Forwarded-Encrypted: i=1; AL+hErE2ZzNEqepE6DXOV+qSe2tlD/T48nVAEWEk6HMlC08Ck6nuJzzLdgs2Y8y/U1Pvbm/R++1ZV4DvEmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Psqus3S43l6KUk3CTYk1QZbhEifRPH1LFgxvOt2XVv7YCJwe
	7XXljYoS/82G1UKCeIqhqcqgsAxcu4fcbnfgaz00Pwy1p/uHjIHuR2nx
X-Gm-Gg: AYBFou2he1yZyzPK7QgIZlgiJ9vG01zSy+rlH7z82FI8Y1YF3me6DrJ9WhqQ4/Gw1gj
	/QYsmpJjvJ1SzwHh/igFw0MHvEAzKRB+UEQIeAnvO0ir6izgiaYmkPbfaqBmBuNlRK8cQ0epFqU
	NedvK5toDG4UqJFsL1LL4J0IaWJM5FQcdgw4vSsyef3qW9BbL+FmbC+QmQh2lA9Q6L+k20fXTzg
	1KFgIQFONvOeDAUoXAO4P29RJqVAK7WNwBS/Gk5bUF72weSCRolxozesIK5M+OXRqg+P39JTjd5
	0KhuksxuLQi/miWkqZN8mwgu/VWGuwagR564RMThb2rUGKKrbmADmc68sBMLuBJ7RZQqkRgfQCm
	JUZR14umLnKvyqWUJKBQ9Lmx/zbBGm0u8cDiFhQEkXkKc56stQZM3oComsGT555Vkqr83eCb5cK
	HCgKUDJ9UOEw0H3jDjwGNazd8SntDEeq0go/EVkPXV7W44LWuOjOOmNGrZRtUMjhiVGQNFDrl8R
	xhPsygSL4QPKVp3ZknMAmZ2VTOB9YAPydGmSLmvqKdYhQiEbDLaltGqSf0LgpgdcWfAV5d2P4rK
	oxZ4EAKnds7i6uks2wNBaGM=
X-Received: by 2002:a05:7300:fc13:b0:375:87f5:ccee with SMTP id 5a478bee46e88-37686a456b0mr3993699eec.29.1794439264317;
        Wed, 11 Nov 2026 15:21:04 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm39819238eec.16.2026.11.11.15.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:03 -0800 (PST)
Date: Wed, 11 Nov 2026 15:09:21 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stuart Clark <stuclar@meta.com>
Subject: Re: [PATCH net-next v1 04/11] xsk: Allocate UMEM chunks through
 page_pool
Message-ID: <avT1lx9mdbzz8OGo@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-5-bjorn@kernel.org>
 <avOia/ZPWiFdfW7y@devvm16445.scu0.facebook.com>
 <87o6bv8o5e.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6bv8o5e.fsf@all.your.base.are.belong.to.us>

On 11/11, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/10, Björn Töpel wrote:
> 
> >> diff --git a/net/xdp/xsk_pp.c b/net/xdp/xsk_pp.c
> >> new file mode 100644
> >> index 000000000000..fdd55265a6cd
> >> --- /dev/null
> >> +++ b/net/xdp/xsk_pp.c
> >> @@ -0,0 +1,246 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/* AF_XDP UMEM as a page pool memory provider
> >> + *
> >> + * Each aligned UMEM chunk is a readable net_iov with one owner at a time:
> >> + *
> >> + *   userspace --FILL--> page pool --release--> reuse --alloc--> page pool
> >> + *       ^                   |
> >> + *       +-----RX ring-------+
> >> + */
> >> +
> >> +#include <net/page_pool/helpers.h>
> >> +#include <net/page_pool/memory_provider.h>
> >> +#include <net/xdp_sock_drv.h>
> >> +
> >> +#include "xsk.h"
> >> +#include "xsk_queue.h"
> >> +
> >> +enum xsk_pp_chunk {
> >> +	XSK_PP_USER,	/* owned by userspace */
> >> +	XSK_PP_POOL,	/* owned by a page pool */
> >> +	XSK_PP_REUSE,	/* on the reuse stack */
> >
> > Can you explain more about that reuse/reuse_cnt? When is the chunk reused?
> > How is it different from FILL->RX path?
> 
> 
>             FILL             RX ring
>   USER ----------> POOL ---------------> USER
>                    |  ^
>    release_netmem  |  |  next refill,
>                    v  |  before FILL
>                   REUSE
> 
> POOL is a chunk in the page pool or on a driver ring. XDP_DROP, copied
> XDP_PASS and XDP_TX recycle it inside the page pool, so it stays POOL.
> FILL->RX is the only way back to userspace: an XSK redirect puts the
> chunk on the RX ring, and the flush (patch 7) marks it USER. Userspace
> posts it to FILL again.
> 
> REUSE is a chunk the page pool lets go of without a packet: when the
> pool is destroyed (queue restart, unbind), or its ring is full on a
> recycle. Userspace already gave it up, and the kernel can't post to
> FILL, so the next refill takes it before FILL. Same job as free_list in
> xsk_buff_pool. A FILL entry for a chunk the kernel holds is dropped.
> 
> I'll put that in the comment at the top of xsk_pp.c.

Yes, that helps a lot, thanks!
