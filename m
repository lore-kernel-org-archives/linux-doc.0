Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC283CD8A7
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021278; cv=none; b=hwU00JxuPEf8SmAlP5hQR7D+lN7+syK9kyKqeSoiSacxmn+6krnPtvrg37h8BpomsdA0Jd1jylQdN+qXnp/+xdQD7pBf9kv9T66y6FM/uhwqpBnRN9AvRsQql8TeuZQeP29D/kB1qC18UYuSbEuMVKjBoLe0A0iRDzq1y6RS5bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021278; c=relaxed/simple;
	bh=7W8Zh+eJcNEP6cSAx/szdWUQ7Euc/dI9gMu3jX8uY4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjm/yyKfZMLAjCN8ojQPyERWo1vxn8WovDisA8QUhux7vHIjvIDYMX4uunYx6gvSG3/e4kO8Z6bqEmUsdlcsMPcU+6A76G0cjptNJzi378LTYpE2UGb+2azZPKifuhahCNSsSzcaXPcT2wyQrSG8GUa5AfXP6buXM5/q6l37gzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEVWGRrS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEVWGRrS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c74280e3468so326781a12.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774021272; x=1774626072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNUDTw6UmasFeJqzydufaazuaNtX8ofv0HS08KI6BZg=;
        b=QEVWGRrSmxHnKPGQYHSTm35KrVIkNuhUhtVZqtFWsblmKA7DHQKR2rIT2cnJuBmZOG
         YO+zMiPVsPKIBu8sCHK8QHu4gA3Z2uQD1Joiuah3re1W9fzTkbI0sP/vmhTOABCwfXrc
         j57B59ZbeaMcOsHpdQ3Yi9z6ovLhQaRZoS+2YyRd5LfJKFXPobwUkRXoRxpwYNFJSuYc
         iuvXchq3Zl+QqRbQJ7vDLWQbZ5SGVxCnYcpua6E+sa1P78S83QRFjbOWJ+WepF6HmYD6
         9DE0jI1Y/JRlhlqdhguZhOkSn64nL6NkhfjyOxAr2KPnnlWBebT+jg24b42YsoY2eNbu
         qdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774021272; x=1774626072;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNUDTw6UmasFeJqzydufaazuaNtX8ofv0HS08KI6BZg=;
        b=mj0TzZ5U9gmVryeQrzRIm6tkoNn3Tw4l8nk5U9d3Ir01injE3IOifED+adqVwWneBk
         Ce+oeCWWav1HBOB7rNNkqsr/xZrlt7hZNXpESn/Hhwox+UH0jAvu6I0/UMnbzmAiywGV
         IMWvRYQmtPk0pJvI+E6leer1983cWbH143aLwF503hPbQ0yjtc805/8xt1Q1RhasYf+c
         gNQr7zwghm+Z7l4F3syrXwwIr20agAhAeGzELjzlPmDaVesgpznmVFqrFYomyBpEPm5O
         2FmgJJ88yY1ZU0eJ4g+dKh0HHEJRRI6xEkz5l2f3VsX94rWzBFB796vXDy/adavH6dxq
         GkMw==
X-Forwarded-Encrypted: i=1; AJvYcCXYAVFZtxrD6QufInzyiujciUorum/ri44Dzvl/lenThcocFS9L3CWE73hS3AmTITr7jYhueK11Zzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyqEH/2LZ9bD61pMASpo/4BvHuNWfEHEu7i5KDBN2AbSC3BYkI
	9wZd2ctLkYkSeDhw65Yb7SbCyT9yzYhPfkXKqDlZBMWZlmDmJGjcd1M=
X-Gm-Gg: ATEYQzy2/EJkQp0gQiXeXuf8+VDcGV6/10akvQ2CFmgMtobJ9H8KQKQYVn8MLhsWUct
	0r7ZKQv2cTHtVs/7UkKj5c50ZVIEcZesuHP+37ThpsVUNOUtgSHhlz/SPx5nS+44rJo/qVMX8Ew
	0abo67d9r98YbIOv1nFAeb4xSrOt6JAqht1TEzIO/AKvhPjenp0ZgzYMi+cJd4MgdZ0SKoND5ja
	TS3e17Isv6F1J2GRERCTUEqpahJCguVe6MKLnkvoAL7fc6TIuCeRueiJGIhBJTUzgcRihSy6hGw
	o01OUTcfY5r6G3RO7NTvmRkFncUK6isolrkqlD3dPhaEzzWWxrZkTQoNmF0Ty6WeQPKMbY6W+1D
	T5YL88r9fGMqDRApMPvgdY7p5LQCfgDrrvqJpmIu84U1taS27sf6C9PrXb8SzB7NMIrkOMWT31J
	fJJVsB5nqy+kUY0b66jqFjYt+BJW0IPENPrl2Q5s8opbGBf7hGZ6Y/AEENke+49LFp3+ugHgbxl
	kxZO5QLgY0vGR0Nbw==
X-Received: by 2002:a17:903:38cf:b0:2ae:47c9:68c4 with SMTP id d9443c01a7336-2b0827f7629mr35987865ad.50.1774021271829;
        Fri, 20 Mar 2026 08:41:11 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835429afsm26089295ad.26.2026.03.20.08.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:41:11 -0700 (PDT)
Date: Fri, 20 Mar 2026 08:41:10 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"michael.chan@broadcom.com" <michael.chan@broadcom.com>,
	"pavan.chebbi@broadcom.com" <pavan.chebbi@broadcom.com>,
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
	"Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
	"saeedm@nvidia.com" <saeedm@nvidia.com>,
	"tariqt@nvidia.com" <tariqt@nvidia.com>,
	"mbloch@nvidia.com" <mbloch@nvidia.com>,
	"alexanderduyck@fb.com" <alexanderduyck@fb.com>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"sd@queasysnail.net" <sd@queasysnail.net>,
	"jianbol@nvidia.com" <jianbol@nvidia.com>,
	"dtatulea@nvidia.com" <dtatulea@nvidia.com>,
	"mohsin.bashr@gmail.com" <mohsin.bashr@gmail.com>,
	"Keller, Jacob E" <jacob.e.keller@intel.com>,
	"willemb@google.com" <willemb@google.com>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"bestswngs@gmail.com" <bestswngs@gmail.com>,
	"kees@kernel.org" <kees@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"leon@kernel.org" <leon@kernel.org>
Subject: Re: [PATCH net-next v3 04/13] net: move promiscuity handling into
 dev_rx_mode_work
Message-ID: <ab1qllbwt2zCnQhI@mini-arch>
Mail-Followup-To: Stanislav Fomichev <stfomichev@gmail.com>,
	"Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"michael.chan@broadcom.com" <michael.chan@broadcom.com>,
	"pavan.chebbi@broadcom.com" <pavan.chebbi@broadcom.com>,
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
	"Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
	"saeedm@nvidia.com" <saeedm@nvidia.com>,
	"tariqt@nvidia.com" <tariqt@nvidia.com>,
	"mbloch@nvidia.com" <mbloch@nvidia.com>,
	"alexanderduyck@fb.com" <alexanderduyck@fb.com>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"sd@queasysnail.net" <sd@queasysnail.net>,
	"jianbol@nvidia.com" <jianbol@nvidia.com>,
	"dtatulea@nvidia.com" <dtatulea@nvidia.com>,
	"mohsin.bashr@gmail.com" <mohsin.bashr@gmail.com>,
	"Keller, Jacob E" <jacob.e.keller@intel.com>,
	"willemb@google.com" <willemb@google.com>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"bestswngs@gmail.com" <bestswngs@gmail.com>,
	"kees@kernel.org" <kees@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"leon@kernel.org" <leon@kernel.org>
References: <20260320012501.2033548-1-sdf@fomichev.me>
 <20260320012501.2033548-5-sdf@fomichev.me>
 <IA3PR11MB89866C27B28AE7D7D807F37EE54CA@IA3PR11MB8986.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <IA3PR11MB89866C27B28AE7D7D807F37EE54CA@IA3PR11MB8986.namprd11.prod.outlook.com>

On 03/20, Loktionov, Aleksandr wrote:
> 
> 
> > -----Original Message-----
> > From: Stanislav Fomichev <sdf@fomichev.me>
> > Sent: Friday, March 20, 2026 2:25 AM
> > To: netdev@vger.kernel.org
> > Cc: davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> > pabeni@redhat.com; horms@kernel.org; corbet@lwn.net;
> > skhan@linuxfoundation.org; andrew+netdev@lunn.ch;
> > michael.chan@broadcom.com; pavan.chebbi@broadcom.com; Nguyen, Anthony
> > L <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
> > <przemyslaw.kitszel@intel.com>; saeedm@nvidia.com; tariqt@nvidia.com;
> > mbloch@nvidia.com; alexanderduyck@fb.com; kernel-team@meta.com;
> > johannes@sipsolutions.net; sd@queasysnail.net; jianbol@nvidia.com;
> > dtatulea@nvidia.com; sdf@fomichev.me; mohsin.bashr@gmail.com; Keller,
> > Jacob E <jacob.e.keller@intel.com>; willemb@google.com;
> > skhawaja@google.com; bestswngs@gmail.com; Loktionov, Aleksandr
> > <aleksandr.loktionov@intel.com>; kees@kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; intel-wired-
> > lan@lists.osuosl.org; linux-rdma@vger.kernel.org; linux-
> > wireless@vger.kernel.org; linux-kselftest@vger.kernel.org;
> > leon@kernel.org
> > Subject: [PATCH net-next v3 04/13] net: move promiscuity handling into
> > dev_rx_mode_work
> > 
> > Move unicast promiscuity tracking into dev_rx_mode_work so it runs
> > under netdev_ops_lock instead of under the addr_lock spinlock. This is
> > required because __dev_set_promiscuity calls dev_change_rx_flags and
> > __dev_notify_flags, both of which may need to sleep.
> > 
> > Change ASSERT_RTNL() to netdev_ops_assert_locked() in
> > __dev_set_promiscuity, netif_set_allmulti and __dev_change_flags since
> > these are now called from the work queue under the ops lock.
> > 
> > Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  Documentation/networking/netdevices.rst |  4 ++
> >  net/core/dev.c                          | 79 +++++++++++++++++-------
> > -
> >  2 files changed, 57 insertions(+), 26 deletions(-)
> > 
> > diff --git a/Documentation/networking/netdevices.rst
> > b/Documentation/networking/netdevices.rst
> > index dc83d78d3b27..5cdaa1a3dcc8 100644
> > --- a/Documentation/networking/netdevices.rst
> > +++ b/Documentation/networking/netdevices.rst
> > @@ -298,6 +298,10 @@ struct net_device synchronization rules
> >  	Notes: Sleepable version of ndo_set_rx_mode. Receives snapshots
> >  	of the unicast and multicast address lists.
> > 
> > +ndo_change_rx_flags:
> > +	Synchronization: rtnl_lock() semaphore. In addition, netdev
> > instance
> > +	lock if the driver implements queue management or shaper API.
> > +
> >  ndo_setup_tc:
> >  	``TC_SETUP_BLOCK`` and ``TC_SETUP_FT`` are running under NFT
> > locks
> >  	(i.e. no ``rtnl_lock`` and no device instance lock). The rest
> > of diff --git a/net/core/dev.c b/net/core/dev.c index
> > fedc423306fc..fc5c9b14faa0 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -9574,7 +9574,7 @@ static int __dev_set_promiscuity(struct
> > net_device *dev, int inc, bool notify)
> >  	kuid_t uid;
> >  	kgid_t gid;
> > 
> > -	ASSERT_RTNL();
> > +	netdev_ops_assert_locked(dev);
> Can you explain why do you add new hard precondition of ops lock must be held?

The context is that in f792709e0baa ("selftests: net: validate team flags
propagation") I had to add locking around NETDEV_CHANGE notifiers and
add that ugly `if (notify) netdev_ops_assert_locked` check. After this
patch I believe we are consistently calling __dev_set_promiscuity
with the ops lock (for ops locked netdev), so we can cleanup this enforcement
part. 

> >  	promiscuity = dev->promiscuity + inc;
> >  	if (promiscuity == 0) {
> > @@ -9610,16 +9610,8 @@ static int __dev_set_promiscuity(struct
> > net_device *dev, int inc, bool notify)
> > 
> >  		dev_change_rx_flags(dev, IFF_PROMISC);
> >  	}
> 
> ...
> 
> >  	__hw_addr_init(&uc_snap);
> > @@ -9704,16 +9720,29 @@ static void dev_rx_mode_work(struct
> > work_struct *work)
> >  		if (!err)
> >  			err = __hw_addr_list_snapshot(&mc_ref, &dev->mc,
> >  						      dev->addr_len);
> > -		netif_addr_unlock_bh(dev);
> > 
> >  		if (err) {
> >  			netdev_WARN(dev, "failed to sync uc/mc
> > addresses\n");
> >  			__hw_addr_flush(&uc_snap);
> >  			__hw_addr_flush(&uc_ref);
> >  			__hw_addr_flush(&mc_snap);
> > +			netif_addr_unlock_bh(dev);
> >  			goto out;
> >  		}
> > 
> > +		promisc_inc = dev_uc_promisc_update(dev);
> > +
> > +		netif_addr_unlock_bh(dev);
> > +	} else {
> > +		netif_addr_lock_bh(dev);
> > +		promisc_inc = dev_uc_promisc_update(dev);
> > +		netif_addr_unlock_bh(dev);
> > +	}
> > +
> > +	if (promisc_inc)
> > +		__dev_set_promiscuity(dev, promisc_inc, false);
> But it's being called here without any netdev_lock_ops(dev) ?

We have the following at the start of dev_rx_mode_work:
  rtnl_lock();
  netdev_lock_ops(dev);

Or am I looking at something else?
