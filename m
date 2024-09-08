Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E3A2D
	for <linux-doc@vger.kernel.org>; Sun,  8 Sep 2024 20:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725828571; cv=none; b=WaicQj8UsWm8L3mj/PQ1c7ZNHlF/Fg6d+uXn63vbFn5wZvhgCnPUBKuPUwIbN5U/NcQu8C8s2ki8kth2VxezvsW6av4TpDEmycGcXEdJ3YUY7beMm65pM3kNFA71uZDYtBFZu8Xzx/ZhpAY+rRiu8aywETrqlAlPz5FX7jMoePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725828571; c=relaxed/simple;
	bh=EoBKEDH3k4qBQyLBQhS51btl8ruh9qqZSDp7H6obE4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqOIntYWLdm5f0s8UEAruIQ+f014v7o/wUPFmyPE+4BOTZHM5w3tXcFa+xFyEGMFhRRrZE4rT6HMPG+zYMbF4XEDlgYtPvwqY9jR67J32uhpvPwSXsNld4SXwgHgbdrY9MQeWWP/tzRG6ZKy4Ydgubl6S9RG6tiCHhM1Z6ZW1IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=DsTGXWoz; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="DsTGXWoz"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a8d2daa2262so106667066b.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Sep 2024 13:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1725828567; x=1726433367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEC4wQ1JIXOpeG5hhCNp2MQwBTDr5gpJ3bo6M3CBVtc=;
        b=DsTGXWozC0utvVsJa3InhG1XGU+B/yEZ+wok3O0ikK+btkJIuqrUeaZwhLy/IZUI2X
         rv8CxMqnTYwQa3C5tE9rJM04dRkkb/pA5cc79fj5t1xU5m7UNAkQLNjKIVjRGOhpHB2W
         NoCc8FEKttJ3NnC/gTuP53/q78Zcme5e+lhvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725828567; x=1726433367;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEC4wQ1JIXOpeG5hhCNp2MQwBTDr5gpJ3bo6M3CBVtc=;
        b=CFpJO/sbsPqxYdQsAZPH4hl7QgP3taUy6GzjCUe4yCFU6VzZSPrnJiu+n0UOS8SHSQ
         budfwXbWeVRtqFkseo6D9ueOgRrgu8DaR1a08TSbITPpnO0wnlGjQf6RgV/+TqS9PUI8
         j4Gj251YD0Mgd/E82Kq8HM0y1REa69TDm5mDEnqYfYG3uZ3HeKBsd23tz7YpbuqS5VcB
         DxBvAiZe/Z/llevfdrtI5oAdF8kEkIM81q/U4o+LkLnGDMJtlcWPr/30lJHyFfwCKYw7
         rj4bmBno3ZSQaFs2ns3hFJR5PCisUpIBVkGqejgPCdlc/VgPS/FInXeeG6mpKGdePdDT
         2a7w==
X-Forwarded-Encrypted: i=1; AJvYcCX8r9htVh30hphcAEIfPqDQIF7G+FVE0KRMcXjV4Tx8uwUnYljRJ/5iMRdbvZ5m/cy7MPCb+F5opNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YDBZm4CBFNWb735mcW0+wiJzl/dTQ/N+uzTEqTZ5Tt3/ra1v
	60CSoRG/4I+/XThIZk/BNklLWkId7nzc6VXgexGpI26ay6zKgLiBmoRuKWDyc/8=
X-Google-Smtp-Source: AGHT+IEpMGHYf5BD/zUKQTqTgiisAQ1anJ5u/AzUGtH+fTD6Vnd38+tGUnUUgp5rDSrfzmoVdpGKVA==
X-Received: by 2002:a17:907:97d2:b0:a8d:5472:b56c with SMTP id a640c23a62f3a-a8d5472bbf6mr81751866b.22.1725828567442;
        Sun, 08 Sep 2024 13:49:27 -0700 (PDT)
Received: from LQ3V64L9R2.homenet.telecomitalia.it (host-79-23-194-51.retail.telecomitalia.it. [79.23.194.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a2844fsm247389666b.88.2024.09.08.13.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 13:49:27 -0700 (PDT)
Date: Sun, 8 Sep 2024 22:49:25 +0200
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: mkarsten@uwaterloo.ca, kuba@kernel.org, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next v2 1/9] net: napi: Add napi_storage
Message-ID: <Zt4N1RoplScF2Dbw@LQ3V64L9R2.homenet.telecomitalia.it>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, kuba@kernel.org, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240908160702.56618-1-jdamato@fastly.com>
 <20240908160702.56618-2-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240908160702.56618-2-jdamato@fastly.com>

On Sun, Sep 08, 2024 at 04:06:35PM +0000, Joe Damato wrote:
> Add a persistent NAPI storage area for NAPI configuration to the core.
> Drivers opt-in to setting the storage for a NAPI by passing an index
> when calling netif_napi_add_storage.
> 
> napi_storage is allocated in alloc_netdev_mqs, freed in free_netdev
> (after the NAPIs are deleted), and set to 0 when napi_enable is called.
> 
> Signed-off-by: Joe Damato <jdamato@fastly.com>
> ---
>  .../networking/net_cachelines/net_device.rst  |  1 +
>  include/linux/netdevice.h                     | 34 +++++++++++++++++++
>  net/core/dev.c                                | 18 +++++++++-
>  3 files changed, 52 insertions(+), 1 deletion(-)
> 

[...]

> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -6719,6 +6719,9 @@ void napi_enable(struct napi_struct *n)
>  		if (n->dev->threaded && n->thread)
>  			new |= NAPIF_STATE_THREADED;
>  	} while (!try_cmpxchg(&n->state, &val, new));
> +
> +	if (n->napi_storage)
> +		memset(n->napi_storage, 0, sizeof(*n->napi_storage));

This part is very obviously wrong ;)

I think when I was reading the other thread about resetting on
channel change [1] I got a bit confused.

Maybe what was intended was on napi_enable, do nothing / remove the
above code (which I suppose would give the persistence desired?).

But modify net/ethtool/channels.c to reset NAPIs to the global
(sysfs) settings? Not sure how to balance both persistence with
queue count changes in a way that makes sense for users of the API.

And, I didn't quite follow the bits about:
  1. The proposed ring to NAPI mapping
  2. The two step "takeover" which seemed to imply that we might
     pull napi_id into napi_storage? Or maybe I just read that part
     wrong?

I'll go back re-re-(re?)-read those emails to see if I can figure
out what the desired implementation is.

I'd welcome any/all feedback/clarifications on this part in
particular.

[1]: https://lore.kernel.org/netdev/20240903124008.4793c087@kernel.org/
