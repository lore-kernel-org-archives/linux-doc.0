Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA233CF02E
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168347; cv=none; b=QI4Ooy/BBQfKlS4U9lbz8N6uU4s1gapnEuu6mGdJy4dclM/c0KX5UDToEFAdAF5iq5TGh4EPvbOgjbG4FUq8pbkwIEcruYKCoxC5pU0xDl1qvovBW6iRe8pB62o7wCkGDbCnRGf3yOI5fjAWZlOdAzReC2fNgYMDGoa/lkKAoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168347; c=relaxed/simple;
	bh=I7bHVcUPCbFavnPQE9NIAPWTbSlQISkdMWu7R9FX+Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZvYyCAF6QpVe6qR97mZIJ/ddFWd584bJbFN/tyoXrEemgOCH7JIQ4cO1Mi5TnbZFojbRCDQjMhbzyVNsiHWvGwiWjOr4zcc0sKRTsqAGNfvMJCozqmIE5fJZ28bQxn6k1v/HcfBMc0V8JBjwEa3L3NBMP/IGDZIvdgdXB234uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lELMVwd2; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lELMVwd2"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8ea8563c693so108524385a.2
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778168344; x=1778773144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQASz0K9bAEWsvTANOg3uGMuZOgruzesi2JgdTAVAkE=;
        b=lELMVwd2v+v3Y2UjmN0rjzuYIZkTeRK8VqQUHf+rI68gGfgcG8NCRLWnzDSU7Ejg3a
         Fkw6my+S6bAF/4E4hCUawNWJPvhr1TNcPhPRWjqkvLDfn3aOBNptDGyNH86WSvyJo283
         sWtpk53zfbttBN4gwE+xdhjPtewc4RWBahS89D/lN22YvuzFwhbBxwkjAQV+wl+AgeCk
         lXNzb4qXqs00gTDv0uytVS0ClClxoEGzxVnEniq0d3y4Gw9GHs0fmfn66iThHtOpR7TJ
         l3wCy1J1YODPtn2r0c+N3ZstW4mN3WeMU4SFG3zlY2trp4eE2dESUXTSK8mMG8ZRqvme
         3PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168344; x=1778773144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQASz0K9bAEWsvTANOg3uGMuZOgruzesi2JgdTAVAkE=;
        b=isdh8Q05FlL+KJJLoqTw+Y3AKaEKf3JHQ4A/OMenpw2RpniFAFxL50mgYUpAIWydIl
         Nh89r58ntK4MAvYJpWHZecSyFVQtU1IFAwYJfpCPkGDGABtQhrrG+CncxcvzqdHYmyOU
         danqJB39QQM/58pft5W9d/VF+WUtEo07Ub6kIgQbiOoz4ZRJTJhf3cR6crslKF3G3f5K
         hF2BbC42pTKvonkzqRiasOnil/gXUHvPT8SkSQC/vU7vH+Tw2XWXxKFgapzVrI7WiUrC
         7DC4RTON7gFVg0q0bzx3K+o23uC3VjkaNYplCBEoKwuXFy8ekKNn8i/3UT1IOZTj8PES
         gVWg==
X-Forwarded-Encrypted: i=1; AFNElJ9PACmOa1sL1x8hr6PZ+5A7GzNuIQMo2hAljufu+lGiUR/631gKsSjeXK/vGTGr206Oyh+mwofr1XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeGgEy/KywNkb3tN9m3W0rpabPDB6hxNDieCdHU0+9blfaTqk0
	MIPA25hh9vwtcgVChKiuAVR9qcZqU57jOc9DMhAMLb+OwCE59Whhah2z
X-Gm-Gg: AeBDievf26VApcGmNSY7BwXQsA42eMcK5U3ZapE1MW5YRqLVP6O1gLTekyIb9+T/2pQ
	fcPP8rk0CfXMLDrHX+kLcJOJyZZaBCgoJIeN+mU9AMUVhv5qqee7Mr4PBRtbYN5H9aH+xPqJ9ZW
	b77AIcQPjz7lRKD5MayfwvOlpop/04yWO6Hy/NzGFupfXU+BWpH/JzX6KHo7egilbTEmVLPuDNV
	nK8KIfjzElg9WIPeKjxQDZACZpVmS0yderAAbl7CZnHR11+Nw0A3S9x6HMwsokFohEwgE8bPvOQ
	W9yYixf+LuO8c68KYS6PMNlIiVzmalEgklFcjtBxtip+9rvDMb7et03ehdmMBwtlCtv0MAHF4U+
	lLWFGWFJ/iPh5E19dGZHmAWTF1aFaHzlWYwwt/wVBSEtvkJfVMPHw0kmskIPTYGqbROYMPUa2Re
	9gNMt3F0plObiHaBPivRrT7vXUwpE0bDmkrO8qUbcZHTwoEQOKy/BFIao7SQ==
X-Received: by 2002:a05:620a:440f:b0:8ed:11b9:1ecb with SMTP id af79cd13be357-904d4b58929mr1205520185a.20.1778168344205;
        Thu, 07 May 2026 08:39:04 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f800:13::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc293837b5sm2153539785a.10.2026.05.07.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:39:02 -0700 (PDT)
Date: Thu, 7 May 2026 08:38:56 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com,
	Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 2/6] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Message-ID: <afyyEJNbrBem8igi@devvm29614.prn0.facebook.com>
References: <20260504-tcp-dm-netkit-v2-0-56d52ac72fd4@meta.com>
 <20260504-tcp-dm-netkit-v2-2-56d52ac72fd4@meta.com>
 <20260506193420.575e1806@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506193420.575e1806@kernel.org>

On Wed, May 06, 2026 at 07:34:20PM -0700, Jakub Kicinski wrote:
> On Mon, 04 May 2026 17:27:49 -0700 Bobby Eshleman wrote:
> > +	if (bind_dev != netdev)
> > +		netdev_lock(bind_dev);
> > +	dma_dev = netdev_queue_get_dma_dev(bind_dev, 0, NETDEV_QUEUE_TYPE_TX);
> > +	if (bind_dev != netdev)
> > +		netdev_unlock(bind_dev);
> > +	binding = net_devmem_bind_dmabuf(bind_dev,
> > +					 bind_dev != netdev ? netdev : NULL,
> > +					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
> > +					 priv, info->extack);
> 
> Not sure if it matters but are we intentionally releasing the bind_dev
> lock before calling net_devmem_bind_dmabuf() ? Previously more code here
> was covered by the physical netdev's lock.

True, lock needs to be held at least until after binding. I have this
fixed in the next rev.

Best,
Bobby
