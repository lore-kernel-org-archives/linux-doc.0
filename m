Received: from antelope.elm.relay.mailchannels.net (antelope.elm.relay.mailchannels.net [23.83.212.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F3B1F5435;
	Fri, 27 Dec 2024 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326832; cv=pass; b=Vujjuy0WS+vNzYntR1aS95w2INIQV1VPiVFjIdUuXjdpeOPZYFlruDvxIaU3oiTOUm0SZx7g7Q5Ruuz9hvTMcTHhmFSJYmWYQQTGSWZSMLgZ3nEvpXaTg056g4GSuGAQtLtwl9Tn5ZwMN04MECsLP/eTMtBFJyr5mwc6j74NvOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326832; c=relaxed/simple;
	bh=rxN/Vx5Wj+ibp9OxsDUHqFeqRz+0mdwQXidywRVne/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLVUnTZ6ADq2KW3a6m6M22lKnfUXG2cQJORdbNl9JhmbzKVpJ+dVLeZFDvYzdssZWyH9TeBW/ixO+wxprUfvGU3mKmSJdMgbI1AuKDLBOYkUdNR6SMqieB0c4FiEohM9wayEN4smNUsVL7Xy9mPkibg7IGG+4JZFYs8H0SHDKBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=BCtIffAK; arc=pass smtp.client-ip=23.83.212.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="BCtIffAK"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7D87223C2B;
	Fri, 27 Dec 2024 18:35:19 +0000 (UTC)
Received: from pdx1-sub0-mail-a235.dreamhost.com (trex-7.trex.outbound.svc.cluster.local [100.107.64.70])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A965123631;
	Fri, 27 Dec 2024 18:35:18 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1735324519; a=rsa-sha256;
	cv=none;
	b=vRlX9lCpJ28STztifrEhEhoyOf1uz84YzR4VFGRm6AOEB+YTHXLsN5pjWQnPSABD4PRGJV
	WbIZeF+7Lck0tpeVfOuQjauprxx6q7WbniFZbeMNzTpiVvimCWUTZr7418/7PeWDqHl5GF
	4u3v7V9RyTJ0AZahtYNnyM4LrQqVoU9eW5txWwkYQsKKmgMEYuWLHUCDdnxTjk113sticf
	pr72+aGC51iQx15LmDU0MQ63YC4Q/RTlm8nYQZ165lDABMerSOeYO11WBc2im5vGDYXgHq
	H4cVrWpTy08YV7Qzhj0MwL0Zz9ROJsAYHtK8mn/WgveeW//YMabZ+93EuzSwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1735324519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=rxN/Vx5Wj+ibp9OxsDUHqFeqRz+0mdwQXidywRVne/s=;
	b=ofqzrSyr2veLxsXFMSce3xp/GTruc++Vbwk2oe8mqW/nh3fbYcAmGfKu0jwLaaPqIwZ9PE
	r2BdCv4i4fxVcg6UMn578QikY4N9MTLaJBFLKE4srLI3PjS8WzGPKi4J7M6e9s7qrYrnyk
	cZVmJbGgI3LqJnW0/T9K/NoKb6A3wb0fSL3koiXetFU6U5buSRaTlbUu7Oj3N/9x7p7r1V
	3OXpxak2lKKO31Ad5G+KBdR+vjbJWcTkT1e/WZEz6PedDnSVA4FvOR10d9PKFjZgft41Wc
	WIbboDfhmrCJCWA6UIhESc0EMEqEigQLXBwg1ufdtJHtW3ibVu26uPCZ5IUHOA==
ARC-Authentication-Results: i=1;
	rspamd-56bf78cbd4-ppwqp;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Attack-Obese: 6cc8b6c47408087d_1735324519285_351277178
X-MC-Loop-Signature: 1735324519285:2359817915
X-MC-Ingress-Time: 1735324519285
Received: from pdx1-sub0-mail-a235.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.64.70 (trex/7.0.2);
	Fri, 27 Dec 2024 18:35:19 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a235.dreamhost.com (Postfix) with ESMTPSA id 4YKZ1K06GHz9r;
	Fri, 27 Dec 2024 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1735324518;
	bh=rxN/Vx5Wj+ibp9OxsDUHqFeqRz+0mdwQXidywRVne/s=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=BCtIffAK3FdCR0KZ/3Q59IftZsJVrhcvUEgiL9Y3xMhNuqgkZy5tN6RB02+ahkURR
	 a7M2xzTXj2wTSTw/kCdPNlnwhuZVwk6gxqhZVcfGsHBV4zxc2HHT2IqUeHfJmp78pp
	 zlHGTMwfBFpr9v8To/1sAMpgR8LIohvhVrwaFSuELn5C0Bo+D61sKKmiWJxX2GLpHn
	 n3PQ0lVOLIwSMT8YsqhmJh+yr/Nacun7pompeA8oyNGPrapBbDVztv9jetC8HPw0Wd
	 SldqNaSIzjur58NbsuPXaHzYDAxLUrMQpC0kvDi4qqzL6K5/6N8jc8ns5EJUDxQrp4
	 IdWB9DMmo7+XA==
Date: Fri, 27 Dec 2024 10:35:14 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v7 07/17] types: move struct rcuwait into types.h
Message-ID: <20241227183514.v2kgrouymbcvbazw@offworld>
Mail-Followup-To: Suren Baghdasaryan <surenb@google.com>,
	akpm@linux-foundation.org, peterz@infradead.org,
	willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-8-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-8-surenb@google.com>
User-Agent: NeoMutt/20220429

On Thu, 26 Dec 2024, Suren Baghdasaryan wrote:

>Move rcuwait struct definition into types.h so that rcuwait can be used
>without including rcuwait.h which includes other headers. Without this
>change mm_types.h can't use rcuwait due to a the following circular
>dependency:
>
>mm_types.h -> rcuwait.h -> signal.h -> mm_types.h
>
>Suggested-by: Matthew Wilcox <willy@infradead.org>
>Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Davidlohr Bueso <dave@stgolabs.net>
