Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793584574;
	b=J4nO0LlvSL+W8G42iRAV8zLLCQCFcMll7jxbDyQ8ER/eHA5ENzjNUkJOHs+u23uldk0W
	 2iLTF7G8KTADk8MFir4QCIzhPJWnXRxRnvETVMzzxZYMTfIdqLoUzKyrRNdF7U/Rd518r
	 OvWR34TL1244/UmUGZyubIkSNiKCa6Wl+UJeICSe5hOIBsGE57RwPlGAMwg2UmtbysFfu
	 nU2omtMqXXUsyE5/NVoQi7o4+k3FTjzKeBj0rmLTlLoP671GdSfCi7fLiicu8+1DdWmjz
	 1TKQmDs1H4kr2WpeOIAf7KL9o/aqXzwb6YNwJygodPLrnb3eBQ5pVIZXtIRedb5QC0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793584574;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hPEzD1WQWoI6DLgJc3nFH78eRCH06B+HG0fOl1fLX4c=;
	b=bXV20bsYWWLyi/BC0td1s5fYHQbXk56IaFaFfrhV/Iq4A5ztab5OPMFrFLb7ZLr3qx45
	 vsISqnkYvINgKHiMr+mxGah+6inoIMBVri+RFPEIdHEyiNjU2NhF+2PQj0p3SBt6t6/jr
	 ofqlCX2Tz734jRBxJ7HTd5KlPhPUWQptZlF2zlCSF4Fdpu/BjZsvPQ2hCgfwalrzbrIt/
	 KTY4xb3xilAIt65yty92NpEqM+M56Fx8gNx1HX1S8GkbuLfbu05M1dYguvNdXyOlgGimb
	 dmDdK2MHUlhrG+ozFvh5j1Wfqta7WJU/TrN2bjzUpdqCkgDH77sT5f9u45R/cDn/9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hn2rxo2K;
	arc=none smtp.remote-ip=95.215.58.123
Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42076606A327
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 01:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42076606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hn2rxo2K
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n3WZoTD06QO8DsgnhDFWT7ENJHabABG8avIZs4EqSgM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793584571; v=1; x=1794189371;
 b=hn2rxo2Kp3RPsFUeD5iMp+yYiNkD9BkO8dPlckuu9ygmt5q8l1cXVMVU8N3BkLMc2AdWBfRN
 gAb+aCNZzDwjD3+4F5iPSSo551rEMYDktlVT6ye0WJKYSTilNMHSWhCfBKlpncIUTQWscDGWwAB
 JxhSdSik670VSwjfK+HCmneM=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d5ce155f172fdd98;
	Mon, 02 Nov 2026 01:56:09 +0000
X-Mizu-Trace-ID: d5ce155f172fdd98
X-Migadu-Flow: FLOW_OUT
Date: Mon, 2 Nov 2026 09:55:55 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Thomas Gleixner <tglx@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Maoyi Xie <maoyi.xie@ntu.edu.sg>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Neal Cardwell <ncardwell@google.com>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Flavio Leitner <fbl@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 5/5] net: restrict message_cost and message_burst
 to non-negative values
Message-ID: <auftqzpuuNFiScrb@fedora>
References: <20261101061331.286404-1-jiayuan.chen@linux.dev>
 <20261101061331.286404-6-jiayuan.chen@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101061331.286404-6-jiayuan.chen@linux.dev>

Hi Jiayuan,
On Sun, Nov 01, 2026 at 02:12:03PM +0800, Jiayuan Chen wrote:
> net.core.message_cost and net.core.message_burst feed the interval and
> burst of net_ratelimit_state, but neither rejects negative values:
> message_burst uses plain proc_dointvec, and message_cost uses
> proc_dointvec_jiffies, which happily stores -1 second as -HZ jiffies.
> 
> Since commit a940d145cc38 ("ratelimit: Warn if ->interval or ->burst are
> negative"), ___ratelimit() splats on such values, so the next
> net_ratelimit() caller warns, e.g. a martian source log:
> 
>   Negative interval (-250) or burst (10): Uninitialized ratelimit_state structure?
>   WARNING: lib/ratelimit.c:43 at ___ratelimit+0x56e/0x960, CPU#1: ping/3218
>   RIP: 0010:___ratelimit+0x578/0x960
>   Call Trace:
>    <IRQ>
>    net_ratelimit+0x1c/0x30
>    ip_handle_martian_source+0x1bb/0x340
>    ip_route_input_slow+0x1057/0x3650
>    ip_route_input_noref+0x104/0x260
>    arp_process+0x109b/0x2510
>    arp_rcv+0x381/0x460
>    __netif_receive_skb_one_core+0x173/0x1c0
>    __netif_receive_skb+0x21/0x150
>    process_backlog+0x37e/0x1200
>    __napi_poll.constprop.0+0xa5/0x5e0
>    net_rx_action+0x4c0/0xf70
>    handle_softirqs+0x204/0x9b0
>    __do_softirq+0x10/0x18
>    do_softirq.part.0+0x49/0xd0
>    </IRQ>
> 
> Negative values never meant anything here: 0 already expresses both
> "no limit" (interval) and "suppress everything" (burst).

Will this limit breaks the UAPI on old kernels that supports negative values?

As the comment in ___ratelimit() says:

        /*
         * Zero interval says never limit, otherwise, non-positive burst
         * says always limit.
         */

If all others agree to set the limit in this patch. I think the comment
and the WARN_ONCE() , and the admin-guide/sysctl/net.rst all need to be updated.

Thanks
Hangbin
