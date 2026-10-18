Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92031330307
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289512; cv=none; b=IsKoMqhrwcWt8Z4Uc4bp3nr4jbOgdttrSs46n26MlrcrC6BV2cVhztXA39bwlv8wmzCKstQHMH4HTcSGHOzS+U2h2ibAYPB5Wu4fvpIyzpNc4z1DqWUP2boz2JFuZcY1ltuQNR+M45+NItFihO9XDN3Bi3SvVBLA3gH7rDkdfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289512; c=relaxed/simple;
	bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPljZHcZGU8dYUAt7utcMewQYMtJHGWqbH7BclyinzkK9KG7T+yhTIdg8uinIfbcYtPeawpUIa/TdrSelEKhXLf1LoP0gRAwIAi30fnenqj2wXuNSDrp81zj2VXSAZle41hUcfuL/x993HshG1S0mBZXHqJ4LZjFX3KuXM+oqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=QQIw8NTp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="QQIw8NTp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so93204466b.3
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 19:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792289510; x=1792894310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=QQIw8NTpx0NQVnPaElOZevzSeEGsEd1HNJUlehuDS2MEursrdpPIEapiL/nlrwPAE/
         vq1GtTOJLBBFzsy2D0eKUgVaMXkXNnlc9hM9pcp+OFhy1Qqea/tzUdKQb4PA1t6akFN/
         cHtMznWJFCw4lQ27SP+Fn0vLmmQnDzceYS703/4CVpDi+IOwlQpwy+l/6eu2+UseMIPO
         ag5rkYqKZqUJYwHjnvtlCMlqbB16c80fXFZqqfGFY+Fc8LCAzS1UAKU7KONBsC0sLibl
         4CEkkS5xkd1WiCOa1QExUiKXoKCDozL1d7rLPQHNqv3/HHW6ctYc2n7SAyJEMueDqmDm
         DxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289510; x=1792894310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=yY1x9LuG0nbzfutO2wi5AhjzqCCi+S9F9oSkAExkDWwFg1n2jngCj8eiR5tty75IQJ
         vX7+X9dJTokMvuq9vNKmfgrk07HOBu3bQGfKOkUIcEyDLjzGaiEtB1lA6EfRH6B2H0lh
         Feq1vFZXiIY4y4cw+mLOIEjA6irk0RsTYJ4j+uEukYvKfWyrp/Vt3zfJWzxRUqWrKIyI
         G8/Pr+FLY29ZjUYDg5tDT7kUsSOiRIgvErbC6kM4QmtPyHeMzPLnHLn6stXqjDDjGLBz
         zupyadCdz+5588dngDTEENvaot6WJaKSAcA08pC5pIhkiL13fjyT8yLWiwoSO71dYozs
         FevA==
X-Forwarded-Encrypted: i=1; AKwUvBw2Jl8nWue1ZULp5sc2eOxLWFeOzwMIIpq3v9j/kTsaCM+fBSviZ4kklO4vJSCbSfvMwy6jRdJvmgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGW56kgeUni3jvzQ+ZJywsUL56CGwUMOny3+o3OWg1gmc3DWtW
	GspSSdL4OLGAa1uGBQNIUmgT8Bu3yUNXAzgvdFSOjfU04thpJvgjHpf33R+9SlCYiw==
X-Gm-Gg: AYBFou3VRT10kkJ/g36TO6dqNRMw8jYq3TCn0QJWyqFSSSHypN7A8DUL6QDVNTJYlRS
	asoBgFUrwP2lZ3eQlwMmHrScmNWIzGUexl5AKjEU3nrGeYZUeQL1AIpkBcWJ1+gSkcM416R1hRI
	Xeu946snuvhUaOhHXvqM4ZU/IC5oW8IJbfxYqcHYWTIKrN109ZEyu2F9q5RW7+jN4YNmWDT00Lj
	5g4pvMSFM650NfAp7+tbOnI21t20Zx41J6cwQmLva1KWaImzamM7YAFUC4K/LdwCbzBjvvTSyHf
	7bUXEDKRuHjjij7ip2JcOB1u2MqImBAzXSofaG4MnIpsyM9jftgZLeNRAIJDHPdmvfYVNZCzaPx
	8o1Ka3U/uA5TAkNHa85mHFvBSCepzHgEFSvL38YlgXT4/ZOaPqgPe33I7F0gL83a9IJ8t9a8c9U
	P87NgvVw12RfaG3w47JcoX+xsOCtqmFWz4tA11rfqjh1s9Mfo16uKHPeCXgLkCQeybgoM4nrtmC
	WkYb6iXNQCzHfcsFvAFSvY2QGEQgMmUBZ+YnUEzUjN3EpIrbThNuJaG0VnE71AdwldeXU8sUO1C
	R++E0/tNu6Lt+0KMujTWtwP6LaKtHLxzFA/4nC6F6GE88TfpuJzb++V7rAVrAeoEN0HOGMm0eJR
	J4lp/1vgZCuH7rGXc9/I0dMHR3GLvNK6fiPpwZwBZ7pdOhaHszMfVj2GwyDHODQZ6wAD6cxXhqc
	zZkXc2kHOo8CqtUQAmmEudvOXMuNQQp6z2xOuLDD5eam15356XUey1tBAYhUn+3t+SegNjPQIBH
	2XhARIE
X-Received: by 2002:a17:907:c48b:b0:c35:d50a:1356 with SMTP id a640c23a62f3a-c41a08dc5fcmr283934966b.42.1792289509761;
        Sat, 17 Oct 2026 19:11:49 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247424f103187cc9af620d661.dip0.t-ipconnect.de. [2003:f2:4742:4f10:3187:cc9a:f620:d661])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1835sm224698366b.79.2026.10.17.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:11:48 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:11:45 +0200
Message-ID: <20261018021145.3769432-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQkUoH3aa-J5-vf@chamomile>
References: <atQkUoH3aa-J5-vf@chamomile>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 03:43:46AM +0200, Pablo Neira Ayuso wrote:
> I think we already mentioned this only works for hardware, this is a
> no-go.

It works in software too. nf_flow_offload_forward() and
nf_flow_offload_ipv6_forward() set skb->priority from the flow, see the
nf_flow_table_ip.c hunks. The selftest checks it on veth, without
hardware offload.

Julius
