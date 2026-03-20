Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931343B637E
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021766; cv=none; b=SgvX628x2vc6ER36yiI9D9PqGaIMZWTTZUdTbeb8bLnjOxVwFwtQrbS/i++qfxg5Uehkao/rqUlonl3nJY4TImHmBVbIG0qsWH0dWZICwxJQMzIabqFvoSZk0ptBa9HNz1x/k8857k20MxkKRxUluXBoD/95UhumD9tVhulwnIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021766; c=relaxed/simple;
	bh=5bNAXGs4cIMFl6Jp32gKXXVAunXQc+McFM1c11Lf6k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc90T1Egcz0E4IbY9O4Xo4KVy+uMX4QB0FsqHt+a5NzHlwq6sEKSgyOTuQvB/hhM8gJTbSWu1BQflEPOw+hSAXCID9nLty5/aSnJBNzxwCUTvWdQZ1dVWrQn4bI1e3/izyAzjZrJ2yEQ7OKVdmQQ3omSmDl9DSWLKH5eAChmeug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqsD+V0e; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqsD+V0e"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2316185eec.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 08:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774021762; x=1774626562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1noh5STaRC1HybhuYlkIMhR1r7TUdhM17pEfO/82ZhA=;
        b=TqsD+V0efLCtHkR1v28WRt0ZjiiW/DszxVXs02Ss3Npx+nBeLDXahfbuKHiLDCTLSe
         inyjk1ptvRR6l54nMhspWFgyvXYAUxbWUYiolNYh9Qa1qGeooZziXfx+RfI9uXO2njsA
         PIpZtIu7oWFT6pEsus+o8J8qjU+m5TpUDuoHorrWyc0ytHXUY8FhseaZTO8w+V5uKNYY
         a7o8ojWZZeV2eg031HmOhxAtE60w6Jg0HANc8MKeFab2GPPV44poRCB9TV1I26WLeYov
         WLaN85UITDG7rFc9tb0RrZC4GSNptfEm1lkkFmW71Hpg0Y6NXP4QijvMFvn72cUC5MRc
         tQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774021762; x=1774626562;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1noh5STaRC1HybhuYlkIMhR1r7TUdhM17pEfO/82ZhA=;
        b=kq7n+LPQ63rr1UVGeDq6CIhLtme8+RELE2OR5DFCXDgql4ldObdngTANSFQdrFugv7
         yysPFx0dJDoDAJ5ubDAYEd5WPFOHIm30fOwOrAz7pBt2Z6l8hWkmHRrGm/IxDepeH2s3
         I1Zqiirdj6evir1n0Z6Gy9mAboz2MBd0LW+W86WnnpUpsCFl7Mo6z5lgLAN+YILAwRFQ
         6K/PlTiqBRkFtsoR7PA7/51/IRQFmliJjFxBwQ+WIJmxhWl8Bbv0U05O8rO2v3Nu7z9e
         IxKYIiVAyf4wcl4jSGad7mXddfU41x4NtxR9OeS2KrRK0keABzPy/dWz+IN4/3SD2NQ2
         BbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkdwbhJWSHuZ5JYJwoYYDTJtrC9XvwDTe67u1nWZAFFT0WPGF9RzKdFru4cz6OlWatZRLh2O1LykQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSxXKc83ttNTPHNbbUOGtrAXe1aC4vBKFBz3ICimXU0FiMo1E
	vY83cbRk73YBnkg1hkQabDd4ODabkIiysWB9hmSZTOlpf+n6MOf74Nc=
X-Gm-Gg: ATEYQzwj/LeS7QVIgCUGxuo6gBWORQSxLOFcrW9KutUH+UK+TBwMCJVABZ5ASMzQe+S
	2pu1sF9/oqbIRQX8S8E+FMqmBqMpZayavEV5MKe6stOF4y382E5xr8n8dwV7tdLWXhhJID5L1o+
	k+M7OlXSke6dPAXy4gsNhH4lo2O3z+ksreIGWb0UcZGWih6Dpb7p2R2yoOpSq9mhWDGhKPooKHz
	orVN8XNgFhEAU/Bl7vJA7wrf4+V9YP25xSAYQ7r/4QcP8kUVCBwv1WDbsKx08zNIhEbgStjVgT2
	DVOUVvWcdTfkUUPSyvh5ezM/NOg2MyoTSk1D2cV7ZuwMSz2Fdv75QnX7j81Or/glBYcUviaOCzI
	2Ytk+i4CfxiZRfVQYa3g5B7zcWfMg2p0tX87lMD/ppNf07LwlJG6d3XBbbx61UrUsfX/jTQrYbr
	FL+vylJlwuxegpIba2Prh4/78DmqxkI0Y39okJkZv0T7ZWnP4CHNCfl2tbyPlXc16LKTlI2O3ds
	VxkZk8NxqpCm386le7npoVdZGzc
X-Received: by 2002:a05:693c:3106:b0:2b7:b7e7:9025 with SMTP id 5a478bee46e88-2c10980a36dmr1639723eec.31.1774021762125;
        Fri, 20 Mar 2026 08:49:22 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b1b8sm3724371eec.8.2026.03.20.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:49:21 -0700 (PDT)
Date: Fri, 20 Mar 2026 08:49:20 -0700
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
Subject: Re: [Intel-wired-lan] [PATCH net-next v3 03/13] net: introduce
 ndo_set_rx_mode_async and dev_rx_mode_work
Message-ID: <ab1sgEg9ii3se1Zq@mini-arch>
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
 <20260320012501.2033548-4-sdf@fomichev.me>
 <IA3PR11MB89865C96824F6518F4A01B9CE54CA@IA3PR11MB8986.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <IA3PR11MB89865C96824F6518F4A01B9CE54CA@IA3PR11MB8986.namprd11.prod.outlook.com>

On 03/20, Loktionov, Aleksandr wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf
> > Of Stanislav Fomichev
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
> > Subject: [Intel-wired-lan] [PATCH net-next v3 03/13] net: introduce
> > ndo_set_rx_mode_async and dev_rx_mode_work
> > 
> > Add ndo_set_rx_mode_async callback that drivers can implement instead
> > of the legacy ndo_set_rx_mode. The legacy callback runs under the
> > netif_addr_lock spinlock with BHs disabled, preventing drivers from
> > sleeping. The async variant runs from a work queue with rtnl_lock and
> > netdev_lock_ops held, in fully sleepable context.
> > 
> > When __dev_set_rx_mode() sees ndo_set_rx_mode_async, it schedules
> > dev_rx_mode_work instead of calling the driver inline. The work
> > function takes two snapshots of each address list (uc/mc) under the
> > addr_lock, then drops the lock and calls the driver with the work
> > copies. After the driver returns, it reconciles the snapshots back to
> > the real lists under the lock.
> > 
> > Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  Documentation/networking/netdevices.rst |  8 +++
> >  include/linux/netdevice.h               | 20 ++++++
> >  net/core/dev.c                          | 95 +++++++++++++++++++++++-
> > -
> >  3 files changed, 116 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/networking/netdevices.rst
> > b/Documentation/networking/netdevices.rst
> > index 35704d115312..dc83d78d3b27 100644
> > --- a/Documentation/networking/netdevices.rst
> > +++ b/Documentation/networking/netdevices.rst
> > @@ -289,6 +289,14 @@ struct net_device synchronization rules
> >  ndo_set_rx_mode:
> >  	Synchronization: netif_addr_lock spinlock.
> >  	Context: BHs disabled
> 
> ...
> 
> > to
> > +device
> > + * and configure RX filtering.
> > + * @dev: device
> > + *
> > + * When the device doesn't support unicast filtering it is put in
> > +promiscuous
> > + * mode while unicast addresses are present.
> >   */
> >  void __dev_set_rx_mode(struct net_device *dev)  {
> >  	const struct net_device_ops *ops = dev->netdev_ops;
> > 
> >  	/* dev_open will call this function so the list will stay sane.
> > */
> > -	if (!(dev->flags&IFF_UP))
> > +	if (!netif_up_and_present(dev))
> >  		return;
> > 
> > -	if (!netif_device_present(dev))
> > +	if (ops->ndo_set_rx_mode_async) {
> > +		queue_work(rx_mode_wq, &dev->rx_mode_work);
> >  		return;
> This early return skips the legacy core fallback below.
> Before this patch, __dev_set_rx_mode() continued into the
> existing unicast-filter handling when the device did not
> advertise IFF_UNICAST_FLT.
> 
> After this patch, any driver that implements
> ndo_set_rx_mode_async but does not set IFF_UNICAST_FLT
> will never hit that fallback path.

I believe this is addressed later in "net: move promiscuity handling into
dev_rx_mode_work"? That should take care of doing __dev_set_promiscuity
for !IFF_UNICAST_FLT+ndo_set_rx_mode_async. Not sure if there is a
better way to rearrange the chunks in the patches.

        if (ops->ndo_set_rx_mode_async) {
                ...

+		promisc_inc = dev_uc_promisc_update(dev);
+
+		netif_addr_unlock_bh(dev);
+	} else {
+		netif_addr_lock_bh(dev);
+		promisc_inc = dev_uc_promisc_update(dev);
+		netif_addr_unlock_bh(dev);
+	}
+
+	if (promisc_inc)
+		__dev_set_promiscuity(dev, promisc_inc, false);
+
