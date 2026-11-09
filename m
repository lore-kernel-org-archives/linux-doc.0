Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193715;
	b=1PCpCZUJEt7aTxNx6zk+fUH0VgGTfQvNmSnybunjGa/RHNW/crTEDnEQxt7E7ckhXbUx
	 80PtSwDVeKsogltuIvS95H4pcI7pbswSzc/XcXfEJEDEA3iSUAUYJbgTbVqeibJvhNZWO
	 ShblsvFMbWbPyfumIZejhkY8NT/2wx0qoYs5Qkq4Ep9Jw36pcgfcYUrEGtGLuXSKWG6Zu
	 zzh857ptoBnyvR3q4myUjAW39puGy2yi2im6j44wiLy3LxbQS0/kz7pndVjSpXB2dIg8N
	 XNhc8BWnDzsOaywsHlhN4mkE0lTmhuaewwHr/U2XdP4DF0e8p2wzb6hE7AcJWoL3DmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0sZDYHfCBUrE7G/AgueE+PrG6dEwDPLCmAlQ7vBMuvM=;
	b=fQdnDgiEk/2n0FAwrw+TybChOngJOns2DMX3dV+pTEvHNacdkFdH5IcgBOeSgqOmb7Wk
	 cmLulICl1R7fOSbmStEonbLpkAAq2iS0/o6GXxyKbv7LB3iY8cXJb1HQZFSpd0OzSLUeO
	 5tQWNDdD3rURQ9hcOtgZlvo6Ncc06JDTm3SobJ6/Feept7PnligF/QewsP8q+5Np22V0P
	 RvLGrBKTevKukmv6CCJRdj2y80+/9gz94X2bghTD3hEsltTT0fqga1w54bn5+cboeBnpE
	 G/iLgXrpoO46YtzwdJ/a0ax1EHufXEfnRysH/dml4ueBqwQMbSsMdZWQJ3EDaDGa+Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pt7WhZXe;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDAF606A336
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 03:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DDAF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pt7WhZXe
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so323860a91.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 19:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794193714; x=1794798514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0sZDYHfCBUrE7G/AgueE+PrG6dEwDPLCmAlQ7vBMuvM=;
        b=pt7WhZXeywLb/bcQV2nL6QpkS6JEXGU1cssautcEf6mWoJC18Gr54ooaweb+t1ZFIE
         ghCjULBymeJWwH+qHK0m1Spx+TGMO7fWA2VEegBq5iws/+OKiAROe4ChxlkcrC6TXsu7
         WT97TK8qLmt/p895r9JSxv3Qdcu1UKN5ZdMtLrmiwjFTBHBNa29uUxZ1SUXJBuWNMrem
         RXbIrgMJILoskHstKp8XhrNVuesrbsywHykYMIn3llw5DKc5SzjrQxZfDAE6Cz8XyXbl
         ihhd2u7ePq5vCeNgxuVZd2bAObcHZa59CgKxl4MwoUuiC9m1mxyFHKyrMSC5UyvM1KFB
         PHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794193714; x=1794798514;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sZDYHfCBUrE7G/AgueE+PrG6dEwDPLCmAlQ7vBMuvM=;
        b=mwuDLrL+8c+L+yOPnrkA9CvvuMeknY5YGVo7CArLL8gJ8Ot4zQSLno5FJVKJH3jXqx
         lVI9aFK800ayzKjScrqF7GhSsueAzzKQa6O6f4Nuy5163lWI8YycSbvFTOYkJzr2nge0
         AabEBGyvxkLgp4bg9//1labAcbohAgR8kk/eaje9FtfCj1J9Hi1V8d9S5eVaxDijQImD
         93EH7cceLNurl6raa2AgTI69lo/dGk7RhPMfL12xWLVwDXInS7oilM3bS0j28z8Npd3g
         xOZkUIlwpnQZYLE0yJ2+irLi3j3c7mCD/jBPUYGYtqq+3zHCqPrSRhixDdsnj/WdSjf1
         eBVA==
X-Forwarded-Encrypted: i=1; AL+hErGJ5bSwTuDIiy5r6sckShAXAWp7Ubcxr3LW34p7XdG+THBCCHbWP5GmmodtiDQNaJZ2v4yzvW9QHus=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WKspOjdTnKNHxRHzwZ2hU61F8SMdt1nFulNBD328gX7ULVen4
	wC3X26TV9to9XeD7zXjrRhbxGvHM4xLOfV8I4Em+32y3eOS2jvgGJRidc94EFR1qMDI=
X-Gm-Gg: AYBFou0nl9Sg5PNfswCHqu9zr0eOGxPoZpqpb+vUph3ev0IgZLQfrMXLfMec7fIOba2
	a1dbtgJq/bwKXu4x3oAIWQ3YS8Rp1bfh2z46Rg4YdrrE8ZeblMhqaGZzMHR3LsEGUnkwAM+q0Sf
	7Zw4c95ZDHUPIiFE2TXnvAbniNFy+NkuYRPwvhN3c2vAZsFdm5gVhFP4weBeEcsCqf4jVbagV/O
	sm1CDXmqDpmJB3XvU5z1vYFM8B23sTVHHhRzhIA4AsV1XGdOxYpMYYqQ4GPCfHK515lfk0LcA+q
	ax4SpvabpMXP9qNQFbxRzZ5+zXtkCJC7mhNZ4NLkjsderWyzPGE8WjJNZnfo76sYf3Y7o59m+EQ
	skIFo84ZWmhsyxBgMpWV4KFk/U9exDsVgXgqeHmKZoXCAzca314VNJ7/bNFztqq0fKOKoiPMB7a
	wDkiUaLp2jpvOOHymoOLG7aytVrKG/Wao5L7DY4MVnr5ka9PXhvgWP5xAyLFrYmSOxbsaS5WohX
	9jDpvGql+UJLcIWC7l4b9w1ncGRTk4ws0ADhtCPSbPP72jBn71HKlMH7UwRnSOhA5HoInX73Zf/
	8sCjV/eDiBiKgXEOE6x/0lPqzMWXMdWoV38kpI6/umM9br8UgRIV8/82Nw8UIvjXNQsAQl0r
X-Received: by 2002:a17:90b:2d87:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b12d479035mr2604915a91.54.1794193714581;
        Sun, 08 Nov 2026 19:08:34 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1032b8c55sm5027795a91.2.2026.11.08.19.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:08:33 -0800 (PST)
Date: Sun, 8 Nov 2026 19:08:31 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Tianyi Gao <tianyi@cloudflare.com>, netdev@vger.kernel.org, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, Simon
 Horman <horms@kernel.org>, David Keogh <dkeogh@amazon.com>, Jesper Dangaard
 Brouer <hawk@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, David
 Woodhouse <dwmw2@infradead.org>, Dragos Tatulea <dtatulea@nvidia.com>,
 Nimrod Oren <noren@nvidia.com>, Alasdair McWilliam
 <alasdair@mcwilliam.dev>, Maciej Fijalkowski
 <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Magnus Karlsson <magnus.karlsson@intel.com>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Alexei Starovoitov
 <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Donald Hunter
 <donald.hunter@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan
 <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Breno Leitao
 <leitao@debian.org>, =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5l?=
 =?UTF-8?B?c2Vu?= <ast@fiberby.net>, Danielle Ratson <danieller@nvidia.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, bpf@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@cloudflare.com, nh-open-source@amazon.com
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and
 LL_ALLOC_SPACE()
Message-ID: <20261108190831.3f991a13@phoenix.local>
In-Reply-To: <willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
	<e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
	<willemdebruijn.kernel.1d64e7848503b@gmail.com>
	<20261107182526.69543-1-tianyi@cloudflare.com>
	<willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 08 Nov 2026 10:13:03 -0500
Willem de Bruijn <willemdebruijn.kernel@gmail.com> wrote:

> Tianyi Gao wrote:
> > On Sat, Nov 07, 2026 at 09:51:07AM -0500, Willem de Bruijn wrote:  
> > > Tianyi Gao wrote:  
> > > > From: David Keogh <dkeogh@amazon.com>
> > > >
> > > > Add a tx_extra_headroom field to struct net_device for that purpose,  
> > >
> > > Main high level concern is just adding an extra field. What's next,
> > > do we need to add a field extra_extra_headroom?  
> > 
> > Thanks for the review.
> > 
> > A user needs more room either in every packet or only in new skbs.
> > needed_headroom covers the first case and tx_extra_headroom the
> > second. I do not see a third case.
> > 
> > needed_headroom does not only set the headroom of new skbs. It is also
> > the minimum that ip_finish_output2() and ip_forward() require of
> > existing skbs. Raising it for new skbs also raises that minimum. With
> > XDP on a veth peer and needed_headroom raised to 256, throughput drops
> > by 2.8% to 5.8% for local TCP and by 4.0% to 20.8% for forwarded
> > traffic. The cover letter has the detailed analysis. veth also cannot
> > set needed_headroom from user space today.
> > 
> > pahole on x86_64 (defconfig, net/core/dev.o) shows that the field fills
> > the 2-byte hole after needed_headroom, so struct net_device does not
> > grow:
> > 
> > before:
> > 	unsigned short             needed_headroom;      /*    60     2 */
> > 	/* XXX 2 bytes hole, try to pack */
> > 	/* size: 2688, cachelines: 42, members: 187 */
> > 
> > after:
> > 	unsigned short             needed_headroom;      /*    60     2 */
> > 	unsigned short             tx_extra_headroom;    /*    62     2 */
> > 	/* size: 2688, cachelines: 42, members: 188 */  
> 
> Thanks.
> 
> Pushing back on another design choice: the UAPI change. That both cannot be
> undone, and is fragile and laborious, requiring manual admin arithmetic.


I agree with Willem. This is heading the wrong direction.


The more wordy AI analysis is from the iproute2 patch side:


Network configuration should not require pre-guessing this value. To set
it correctly an administrator must know which TC egress programs are
attached, how many bytes each pushes, and whether XDP is attached on the
veth peer. That is a kernel-internal sizing decision being pushed out to
user space, where the information is not reliably available. Worse, it
goes stale silently: attach another encap action or move the peer to a
different netns, and the value that was right at "ip link add" time is
now wrong with nothing reporting it.

The reply that a stale value only costs performance is true but does not
rescue the design. The entire purpose of the field is performance. A
setting that quietly stops delivering the benefit it exists for is one
operators carry indefinitely without knowing whether it still helps.
Failing quietly in the only dimension the knob was added for is the cost,
not a mitigation.

Since the motivating case is XDP, the mechanism should let the XDP program
ask for the padding it needs, rather than making the operator translate
the program's requirement into a device setting by hand. XDP already
guarantees XDP_PACKET_HEADROOM to its programs. The requirement is known
to the kernel, in the right units, at the moment of attach. Propagating it
from the attach point beats an administrator's arithmetic and cannot go
stale, because detach undoes it.

Your own reply already works this out:

> - XDP on a veth peer: veth_xdp_set() and generic_xdp_install() can
>   increase the headroom of the peer to XDP_PACKET_HEADROOM on attach
>   and reset it on detach.

That is the mechanism, and it needs no uapi, no operator arithmetic, and
no stale state. I would rather see it implemented for the cases it covers
than add a permanent uapi that removes the incentive to do so.

To be clear on what I am not asking for: this is not auto-tuning. Your
objections to auto-tuning are good ones. The kmalloc-2048 to kmalloc-4096
cliff being crossed without anyone deciding to is a real problem, and the
reset-on-detach bookkeeping across namespaces is real work. Attach-time
propagation is a different thing: a known requirement, declared at a known
point, with a natural reset.

On the argument that program-side declaration is itself new uapi, and that
the labeled device is often not the device the skb was allocated on:
granted for the general TC egress case. It does not apply to the
attach-time propagation above, which is in-kernel plumbing rather than
uapi.

Which leaves the genuinely hard case, the one you describe at Cloudflare: a
service in a netns sends through a veth pair, the host forwards to the
uplink, and a TC egress program there encapsulates, after ip_rcv_core()
has orphaned the skb so the allocating device cannot be identified. If
that is the real residue, make it the problem being solved and argue for
the narrowest mechanism that solves it. As posted, the series leads with
cases that in-kernel propagation handles and uses them to justify an
interface sized for the case it does not.



