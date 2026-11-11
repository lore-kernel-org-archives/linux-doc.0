Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433936;
	b=VuaHXAcawWnMKhTM+KHBGdBpCzJ4R0rKiCmlBCth2Z09beGkJwdC6a2iia6k/BwTqht7
	 IEoYWMLVtVXAVZZDoG71C4J5O06OHI2W4Yiw5BlVpvIafBB5WTKqr1+NzU9b534plfx20
	 1eCPlGtHSmwre9oSK1U2DJ0lUBoLi9gpx+3W9P6Be5x0smRevG9+9L2LOLdL1N1w5WHFT
	 ZfrHnnT6dTuAvucLu7HtulOLenDKpbN4W7ZURdoxdsq8CxdpMWbQDKpvdfGsm6DxZj1in
	 8NyAyGhUIGShd/2A4WWT4wjcUzDJhY/JC84nRehtg1GO0bj6m2W3uNCtUbwO0+MTifQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
	b=Jy76dH/GuF8pDUWwE66h4h+7nP1gvWX+uTxS8b4IbeAYGNt+TuQzfgXU7hxnyc/x2yGB
	 evj18tnh5shcs7v+LH2DDyK2j/TdXfgBvcBIVvOnhipbnIp9bMuE2BJmUzmaMNWCRhcfH
	 E5Ef0GFnS0kra7NFMev6w0pU65hGDMaMQN37fxKjqiUmRLRVtDytHt+8gSiIFCwvbn0Ei
	 vHf/QGO4Jco/8XkN6OiR+lOcLVm0JEWtAyVRyPrVpXjTT1wdCcp3Z03pmR9CM+Emq1WoR
	 6zjXtlLglgkYnSPtDgOPNkWyIdeUHB7LeXjTwQLXPX/ZAmBy6eLmiw5c315+l52bQpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVadYj45;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10253606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10253606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVadYj45
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1801811eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433935; x=1795038735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
        b=LVadYj452qYWKXqudUfJYP4vTIXJJ1dd3U7RzKuzs6NI9h1XPCVOlLH2NMyOw/fSpE
         a88EhfciP9x3tgYLLbGHfZo127HjqFmkiin6KdIsTfgtrTwkMzRTwMGranMmPEkRP4af
         1fgYgf7SIEfRGRKqH/+rnq1nmaqMdDGChDU/8bSAhmdWZvQmWYxe9hk/nKnyh+hUXQpS
         RuZz/rfJupbQipvOUhYUOt4z/uqT3MMyj4Fxlml3BRqUtntjB8kfTsiEqHI2gsRKou6J
         mzatv8neNrpup03S/lOw+mLiQnIi5+xiU0V2Sh/BMvr0RUOSPeWmUcV0x7Pv860pKpje
         f9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433935; x=1795038735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
        b=qo2LTF3urP7rWzD1HgJZjOwEGAyrek2ECWYP0N9IrgA7bAxDvv1u9VAeHTh2CyVggA
         pBW9DmtIG9omqCIGnogMPPvdQ6lwAC8FdWsRyIYU23x30TNx6xoRwi8SueAFpdg4qfsR
         ZYfgq1MzhZQH+NLqyz6nRisJiz4L1P9eNyJ0g9/Q5wn4uxWbJS42EnV2fVGJNPkPr0Xz
         xULAnH8xWQYYOs7OaUGHOqZ7lyJEDpABdrAww5rhqOBGTYAWpkSDt8FQWZ0PzmMNwYX8
         xyUtitT4a1xeH8tNgyFnB0o2SYRdp3WbIvKzm0HWQ3/4bYFeUy+px/7ixuKfK1yRkAnq
         YvUg==
X-Forwarded-Encrypted: i=1; AL+hErEs4h/iLMKgadfHy4wHDASJMYrcJM4TD48Vtwtl1I/EdJVqulBKpi2NWFpzTd4xzXCCj7n6yz7Mhsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ldbcKGqR4Ei4+We2v/8eL3WhBjKaRxC/FBxtQbQuW2avV8Fcs
	+IKS/WrBQ0+v04TdkwxwsoejmxB9YqAqn6oQdl8KqoAor6eNSPe3RIMs
X-Gm-Gg: AYBFou3OFGWwZQr7sBYGpEd+V7zs0Gwto7X6ej9Nz5izudF+3XiUu9W3OGkuBjTzbTm
	WXSTgFkfSgSj63OuK4EuXrUwXPLIpiJRw7CSXCOAnz5Vs3yZez6ZpvV8kW58GnKgetx6rlwvDkz
	VPN1YLTMvcVisLHdvG5uekqd4NzNL6rsa05uiJfUPmvGMHKRTEVYorEUrXHi5m1hQ3Om/j2/p67
	ZvGrIrRCRW6vj1SyLjkfoCKqn0HGG7ZNyVjp8bu5FLklipU+21D33s+D2WasZcG8YL5NcvBUOLt
	2ft5KUqFmn1uzql7goQVTOS1gitTsN+DeCA0EFxMG3x5UhJEEf/2V6LKKW4deMVMh4wxh+sBYoO
	0HCrWswv5WaWb02SvoL4+gIcpr/1VwuykO0nJnV2AIQrVvJWEZmE2xXvaOT6osvD52fNe4ht7FU
	LBczGoaNn2gUYLpHeF7aVUhBFSQZ2ISFMSTyQgH2NjZMx6XscuwxMGxQDhqto5t8H6PeIcdNAYy
	RpKS3OxWbNtW5IKex4+0TnvOb6SsrE1vw6BP3ZZB8HK+QzPqcTe9cbM5BFeceiRbxUG7ritjc4+
	cUjrwRterFPeTIMgYEplkn4=
X-Received: by 2002:a05:693c:894c:20b0:36d:5102:9974 with SMTP id 5a478bee46e88-3768327e7ccmr4031936eec.2.1794433934007;
        Wed, 11 Nov 2026 13:52:14 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:44::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm38761082eec.16.2026.11.11.13.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:52:13 -0800 (PST)
Date: Wed, 11 Nov 2026 13:50:20 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com, 
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com, sdf@fomichev.me, 
	dimitri.daskalakis1@gmail.com, almasrymina@google.com, dtatulea@nvidia.com, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	leon@kernel.org, narcisav.kernel@gmail.com
Subject: Re: [PATCH net-next v3 4/9] net: devmem: add a per-device netmem TX
 frag size limit
Message-ID: <avTiZVzjvMLQjnJ1@devvm16445.scu0.facebook.com>
References: <20261105222058.944293-1-sdf@fomichev.me>
 <20261105222058.944293-5-sdf@fomichev.me>
 <20261110143615.05f9adbd@kernel.org>
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
In-Reply-To: <20261110143615.05f9adbd@kernel.org>

On 11/10, Jakub Kicinski wrote:
> On Thu,  5 Nov 2026 14:20:53 -0800 Stanislav Fomichev wrote:
> > Devmem TX frags are bounded only by the net_iov size, which is about
> > to grow up to 2MB, more than some devices can describe in a single TX
> > descriptor.
> 
> How is this different than normal zerocopy Tx?
> Drivers already have to deal with long frags.
> Having partially applicable limit seems like a bad idea.

Thanks for the pointers. Yes, looks like I can drop all this per-frag
enforcement. But bnxt is still broken with bigtcp, will try to hack
on something separately (queue stats/etc to make it actually run tso.py)..

CC'd Narcisa (synced offline), unless your priorities change and you get
there first (or I get carried away by something else)..
