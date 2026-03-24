Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C452F3C5DDA
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392571; cv=none; b=JeyztE3FWAcs4Qkae0bWWRdQJHAQxsNtLMkI2hkVMMi63A4l3ukO8KAqK3G2d1zwjj2Ynle0P9McibpnTrovctnNSNl+myWyf8cEEQ9XyiCJLNrRx6dkw/HhU+n2yVjdwKiY4Yl6Bi1g3XPkBiB+X+bv2oHlhviiCKsxpjcpfBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392571; c=relaxed/simple;
	bh=x66sLBkPM9N4hLXn1DtA+Tsks0CxriXlzYTWpFI/SYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDUI+jPquwKDYIKZfOACdat78nLDvmZpb8z6Ou9duWyjzfbUZJFGmON46SDhPDfSrguqRxFkXgeq2r4oJZUibt9az20Vow3B9/OXZgltwxULvXWqCNzeEQL4gnjqeTJLsclVsHvkCdl6M2C21nuc7BcNndRlZSOZ4hz7bkwxhiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goFNEleL; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goFNEleL"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6b0500e06so7119317eec.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774392569; x=1774997369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNx1VzVQBg2bGT4I9Bs+XmhXlek+bgkFq6Ick2G8sfw=;
        b=goFNEleL/6OQLHn+J+oosYrN144Gvq3n9PxHX01b3AOoBSzMntlYyfDBUev1IPmigZ
         PJNtk4Puil6DsOG08u2pCFDFISC0hZRWi1B9SPmvozkwDXnq7KMGHUMsTG48keNg0TzD
         4ux7C9aM+cSk5nll4X0cKKMzWfJza7Ui2/qr02Y9axCLE+5UeHxyAg+zw5hr5ZMGy+s2
         Wr13RXhhNNJkgmTqx7vNdoQdlkz6i4BFXe5JyxWiA7mIuFsP21vN0NKAed52WPvzDxz3
         ClVP44k1pNh21rMwxWJ+CfYqfExhhx0OcvYywKMsYisw5flN0b4YHgQc14etyGiDFJ7r
         1NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392569; x=1774997369;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNx1VzVQBg2bGT4I9Bs+XmhXlek+bgkFq6Ick2G8sfw=;
        b=pbsPwMkI6CN66a/NJj0VQKjFm7P12wGrI3zqMDnNcFHRMntNbSvfi1R/YyDpmWUwgq
         j/7ha7xtxJMekSCnJ7/roBJyTI5FDteqro7LCEqshSf1+740eOs+Y2jGeZb/rtszp6kz
         wJHNPpIaDDHZ5ezujU1oaung7p2lLnTozEKaQUG3Sve4iYgZ5uQmyJ0zHWUSWGUnOO4E
         sGb8+1xO9nikM3t7rkiBK/E+qYzSe797zyuT+rWrrKWi0Pqk8ovRWnxnMs0hUBsiB1Vx
         eWCxIKNzzlowNAS3JD7czhLpa9Lc6xx8lFqpeRELglelK6RvoImYXkY1yS7GhsxAUJz9
         dz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuIiupkFmVxbd9T6L+wAAEbGd5jntiD1QNELbJpHm3QiqV9k8y+NtQ+ZdxAXbVyxZ7Kc+BDH3+ff0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5Te6gDbxxSDtxdP+qKeiw7wVJ4gB3YDiQZtD0rtvbiYgEP7E
	Pln2zKf8mXGPDUcNaK3JcvjIFWDYV/2W2ao7+M6ObXTnW/yXdA/14ps=
X-Gm-Gg: ATEYQzyAUTaTdJDSi/SKLB/DiZU3WzBvkSy4xKFADcEZMIgpUjQ+lkPvVOfueYa8o1B
	7k/j3t/K0UE6EtfLbr71hynZBtpOJKJKxFK45XfLrmdZvWoROxXqrXtHO/pRkVmWb/bgY1z8Ao8
	QCf/YuAyUhHFuaZxl6AmqkIyjuwlekpfkbFGdx2lGsdHUXe7Wpq8YnVIBCtIxTdooLd14iWFFPM
	WhNd8a7IPUSTiy3dRTCy79CLZ7D3vRs1ESYOB0ZSGO47lCO16X7mmRzUTuJZXP13tsv4hKqvZzM
	M+Sc8kcVe7SbEANPiADRTMSi9VNTdCkDGXaC3tFz27huJ9qSgDaHrXS6JBvNd7DU5OtH7tOVxLA
	P753N240vchBVkS+yaQvudgxHRfNCgs6l3Oraz+N9i25gRixvB0AN/hSL2WbUuXwuO8/wBvl/dI
	Q2Fno/nYplPlvDnvlfNO+baRBdtqOrmiqqEMWC2Iyc2Du5iZmn/8P/CRXMt4TRw8vK7btYskQZz
	BcjCLcGjuHWIg64xYOdu3rmviDR
X-Received: by 2002:a05:7301:6582:b0:2c1:2999:498e with SMTP id 5a478bee46e88-2c15d3a1176mr717588eec.18.1774392568523;
        Tue, 24 Mar 2026 15:49:28 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm16796758eec.12.2026.03.24.15.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:49:28 -0700 (PDT)
Date: Tue, 24 Mar 2026 15:49:27 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: Re: [PATCH net-next v3 03/13] net: introduce ndo_set_rx_mode_async
 and dev_rx_mode_work
Message-ID: <acMU93XN02PHmAGi@mini-arch>
Mail-Followup-To: Stanislav Fomichev <stfomichev@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org,
	leon@kernel.org
References: <20260320012501.2033548-1-sdf@fomichev.me>
 <20260320012501.2033548-4-sdf@fomichev.me>
 <20260323162003.0d155055@kernel.org>
 <acLUMN1BYkIVyOk8@mini-arch>
 <20260324142114.216fcb01@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324142114.216fcb01@kernel.org>

On 03/24, Jakub Kicinski wrote:
> On Tue, 24 Mar 2026 11:13:04 -0700 Stanislav Fomichev wrote:
> > > > +		netif_addr_lock_bh(dev);
> > > > +
> > > > +		err = __hw_addr_list_snapshot(&uc_snap, &dev->uc,
> > > > +					      dev->addr_len);
> > > > +		if (!err)
> > > > +			err = __hw_addr_list_snapshot(&uc_ref, &dev->uc,
> > > > +						      dev->addr_len);
> > > > +		if (!err)
> > > > +			err = __hw_addr_list_snapshot(&mc_snap, &dev->mc,
> > > > +						      dev->addr_len);
> > > > +		if (!err)
> > > > +			err = __hw_addr_list_snapshot(&mc_ref, &dev->mc,
> > > > +						      dev->addr_len);  
> > > 
> > > This doesn't get slow with a few thousands of addresses?  
> > 
> > I can add kunit benchmark and attach the output? Although not sure where
> > to go from that. The alternative to this is allocating an array of entries.
> > I started with that initially but __hw_addr_sync_dev wants to kfree the
> > individual entries and I decided not to have a separate helpers to
> > manage the snapshots.
> 
> Let's see what the benchmark says. Hopefully it's fast enough and 
> we don't have to worry. Is keeping these lists around between the
> invocations of the work tricky?

Yeah, that sounds doable, don't think it's too tricky, just extra
list_head on net_device + change the alloc/free to use it.
And then we keep this cache around until unregister? I will try to add it as
a separate patch to cache these entries to keep it simple for review..
 
> > > Can we give the work a reference on the netdev (at init time) and
> > > cancel + release it here instead of flushing / waiting?  
> > 
> > Not sure why cancel+release, maybe you're thinking about the unregister
> > path? This is rtnl_unlock -> netdev_run_todo -> __rtnl_unlock + some
> > extras.
> > 
> > And the flush is here to plumb the addresses to the real devices
> > before we return to the callers. Mostly because of the following
> > things we have in the tests:
> > 
> > # TEST: team cleanup mode lacp                                        [FAIL]
> > #       macvlan unicast address not found on a slave
> > 
> > Can you explain a bit more on the suggestion?
> 
> Oh, I thought it's here for unregister! Feels like it'd be cleaner to
> add the flush in dev_*c_add() and friends? How hard would it be to
> identify the callers in atomic context?

Not sure we can do it in dev_xc_add because it runs under rtnl :-(
I currently do flush in netdev_run_todo because that's the place that
doesn't hold rtnl. Otherwise flush will get stuck because the work
handler grabs it...
