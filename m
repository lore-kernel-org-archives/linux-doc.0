Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAEA3E3165
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935672; cv=none; b=GG4XHdozEuWkcqR6l1sykpKmCBubJ/Qz0IHXVGyqYL7DPgx4SzMXV9T93DrUNC0W/7CHI/xT/vK1m4ZPhOwRjb5lnjfFbut3vF3qC2O/Rn9Qh8K8wztvxOPqFeUWi+d4+ZgehQMd5ZmUxuugrmL0EGTzWs2t+606ZxeLrUtGFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935672; c=relaxed/simple;
	bh=R8P+nzrGUnHar1fqbHTHhRFzTZN26dppzSbv7zUS0FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+252xh+xs21AqBLuYR3klhAf6QXYCqcVxaDUhabVSZC81pjvsUVvIGq3qB17qcQ/sqZC+bQLzHdUhVlpvxqSK3PPDWDRn8TNv0DIbx9vpsSw9LwvTCc5IuKqFWrVV8SftXwQfnKnzzYaNMe4nCWzwutE6PM/o5XrgOZ7TV5ZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+8mmbCo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+8mmbCo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82a62714fe6so548114b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773935670; x=1774540470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flkM1UPgnzZIIWUPlhpYdE/CMruOMnml9ArMjCoVGE8=;
        b=m+8mmbCoDRXID1BSDq4Yo8bF2vMzor2WqvMm9Nw0Y2AJ63KQ206DCRziTdiW6BuDBa
         l+3E5e+hcL9SDO6+it1cO13CRo3sa4QYguChCHGKFBQQhZMsvRiNm0vpukn293Wesyw5
         NyhmpGeXMjIp52E4EiVka+WgbJIHq1h2wd1RegjH5L/RoZ29l8se8WoEOvKNAHhmRw1l
         ZSVEx2JAz5+O4cjZI1sVEGiqv0IXjbsOj8VtE0s8fsH3mR1Nho6okKKHAWGpQ6rXOUfK
         atalspuIyLhm79iWEeJCJ4L3dLxGToieE5iZjdmC+/p8rGo1NxzcAFaCVSlx+p11o04x
         S8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935670; x=1774540470;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flkM1UPgnzZIIWUPlhpYdE/CMruOMnml9ArMjCoVGE8=;
        b=Vy1dv4xpQsRegAiZPtua327RSo6L+imLc7etTgHrnabctBmEkRbAMx0oV09BHKdMr4
         pUvvS+SKTWEphM9Pg1EpHH3I3I/7+Cbsmeuu9Xmr2Qc07mcJywcYA7HnaEONK3E8tgA9
         EmsUUTq4CRQmJsBVnLH7C+UfKv6FRs7rOPlRymunxY5LLVzG5r4TGvOIy45prsKW1kdH
         f5/tUybPNJ1tu/iOziMnIjpMNiVou+ayK/fozx5QDpZXKGRRIK4sjdoDzM3S0n67kGcs
         vTKW5BpVTv49RzQGkjXs3Zh2tVUlxtqzYEsnbYQBpGabN+9u7B9SoKVklsRDgXG8OgM2
         Szaw==
X-Forwarded-Encrypted: i=1; AJvYcCX2BtubKtqCaDQwh9MsUTnjaqGrrcyZI9gBsz16Ti5JZBOQZfptlrVFuSe9hYN5q4YigVTkG11LHsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmE5mWMX75jSUIV0IEU0V611jA4MsfJZJbM5YrnK2kyoPIQXC8
	i6lRXk7IM2WJ0OJglofU5ZJImAOwbROQ9ovC9XD73AzPOS1hd9OXey4=
X-Gm-Gg: ATEYQzyRNcQkcRAguNHPUcY3KNko/ktgRIHdWK2ycqjlOqyKGT34r1T26YVor8o858E
	/1vE8saUIdL5lxFxJVfjRHC5HQf09KmO8JX5SGlee2Vro0mc2Ui3vf9mxSWb/8t8B44+EHkE0lW
	A5NjYdfx5TDrS7gqlc/5xETJfgZMBpyrPFsy5k9PqXzkVGVT3UvizJEN+F7+SQ16ko0Qq5WFLuF
	o9vudKsTyhbxnABVqnq0A08QlCr9SklbXqSR4/SIqYR/C8YlfZau439rjj/bbxPEHyZ6ei63dDE
	cs4oeL5RaM0BewZg2GBO/xCqYdU84xnKaTKyg2nLBVg7BEQRfMDgGaLnQFIm5kQyiZMlXcngAPL
	pOY0t75MqCJ4EWcWtbNW4yu2OdE2gQRG2WBEz6jAnVPki6whET1Uv/5hHsgLVEn6ZejZtw8AEpG
	RIUSVswY6ohw8LwJ3C1UjCRKheevT27PL1w4gyZ3GeWgOXmXlYJs1vDn3NimJaktUR6WtF0d59u
	0XsfQaGCLt7jtVQag==
X-Received: by 2002:a05:6a00:a8c:b0:829:f777:dad4 with SMTP id d2e1a72fcca58-82a7a97b202mr3053986b3a.29.1773935669410;
        Thu, 19 Mar 2026 08:54:29 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb51d1sm7913205b3a.28.2026.03.19.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:54:29 -0700 (PDT)
Date: Thu, 19 Mar 2026 08:54:28 -0700
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
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"leon@kernel.org" <leon@kernel.org>
Subject: Re: [Intel-wired-lan] [PATCH net-next v2 08/13] bnxt: use snapshot
 in bnxt_cfg_rx_mode
Message-ID: <abwcNMcZHW0ThCkW@mini-arch>
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
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"leon@kernel.org" <leon@kernel.org>
References: <20260318150305.123900-1-sdf@fomichev.me>
 <20260318150305.123900-9-sdf@fomichev.me>
 <IA3PR11MB89866985981DB64EFEBDF0ACE54FA@IA3PR11MB8986.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <IA3PR11MB89866985981DB64EFEBDF0ACE54FA@IA3PR11MB8986.namprd11.prod.outlook.com>

On 03/19, Loktionov, Aleksandr wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf
> > Of Stanislav Fomichev
> > Sent: Wednesday, March 18, 2026 4:03 PM
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
> > skhawaja@google.com; bestswngs@gmail.com; linux-doc@vger.kernel.org;
> > linux-kernel@vger.kernel.org; intel-wired-lan@lists.osuosl.org; linux-
> > rdma@vger.kernel.org; linux-wireless@vger.kernel.org; linux-
> > kselftest@vger.kernel.org; leon@kernel.org
> > Subject: [Intel-wired-lan] [PATCH net-next v2 08/13] bnxt: use
> > snapshot in bnxt_cfg_rx_mode
> > 
> > With the introduction of ndo_set_rx_mode_async (as discussed in [0])
> > we can call bnxt_cfg_rx_mode directly. Convert bnxt_cfg_rx_mode to use
> > uc/mc snapshots and move its call in bnxt_sp_task to the section that
> > resets BNXT_STATE_IN_SP_TASK. Switch to direct call in
> > bnxt_set_rx_mode.
> > 
> > 0:
> > https://lore.kernel.org/netdev/CACKFLi=5vj8hPqEUKDd8RTw3au5G+zRgQEqjF+
> > 6NZnyoNm90KA@mail.gmail.com/
> > 
> > Cc: Michael Chan <michael.chan@broadcom.com>
> > Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 ++++++++++++++--------
> > -
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> ...
> 
> > -static int bnxt_cfg_rx_mode(struct bnxt *bp)
> > +static int bnxt_cfg_rx_mode(struct bnxt *bp, struct
> > netdev_hw_addr_list *uc,
> > +			    struct netdev_hw_addr_list *mc)
> >  {
> >  	struct net_device *dev = bp->dev;
> >  	struct bnxt_vnic_info *vnic = &bp-
> > >vnic_info[BNXT_VNIC_DEFAULT];
> > @@ -13623,7 +13625,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
> >  	bool uc_update;
> > 
> >  	netif_addr_lock_bh(dev);
> > -	uc_update = bnxt_uc_list_updated(bp, &dev->uc);
> > +	uc_update = bnxt_uc_list_updated(bp, uc);
> >  	netif_addr_unlock_bh(dev);
> > 
> >  	if (!uc_update)
> > @@ -13642,7 +13644,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
> >  	if (netdev_uc_count(dev) > (BNXT_MAX_UC_ADDRS - 1)) {
> >  		vnic->rx_mask |=
> > CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS;
> This limit check uses the live device list, dev->uc.
> In the new async model, the live list can differ from the snapshot.

Oh, yes, good catch! Will do s/netdev_uc_count/netdev_hw_addr_list_count(uc).
