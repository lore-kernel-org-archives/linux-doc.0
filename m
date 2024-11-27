Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5AE201102
	for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 18:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732733482; cv=none; b=ZvGkXMnBIrzqV0i7rJlrXQ1287KzN2BfzPqQGqf24tG6MViAe8Q2QC6rgAuOwoI2n+5261DPEPOUXxGYy2D4DJ5gIiyGUqhDgPeUDlgMKoqFbz0XFTZsn5LEIKBoTQasNgJlqjBSRWVxYB9gczdZlFJ1XHEEvC/DlnmuEK6qYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732733482; c=relaxed/simple;
	bh=fPfgZwnSLS2kQoF5+M1p4U2PsLLTNWNdyf0KSRk/2Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciImLwDD8yP9otkohefPojUYDYKBDNadMM65lkkijkSOqOyiL4lcCHrgUdkdlOkqq8xiXDTQPEKh1VdVYBYeU0O3A49qcQ0UUeoLiq+LxskhGHvh/1um/CRjR9+cztk/Tz6ffEHQaLt3q1/iFiZCxaD3dHiUNFxvDmw8fLP6Hms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=bxQdiNYV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="bxQdiNYV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7252fba4de1so129404b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 10:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1732733480; x=1733338280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsL5lh4/mMVU/3l2rG4YRwXPxx1DY2vb0Xku31fNN8c=;
        b=bxQdiNYVOCoV86TNypKTMtHh5xZE7IcTPty5DaA0c1XveT92yI3GTHGH0uhmQXaFaF
         V12FF1UtlJIipXL0UOnxy7F4YlybM2J8itU8o7m0papgTBdjhXX0rkkbpl9tSDmfjUuK
         YUhBGyEMfA0Jf/ge4NrQFR9xK+Ry31untqYKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733480; x=1733338280;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VsL5lh4/mMVU/3l2rG4YRwXPxx1DY2vb0Xku31fNN8c=;
        b=et+2Yz2/9r+4+Ii7aGkjDmVq9zL3qqP6boY8gJVamB706AqVuDg60wIl3ZBiyvX+Jp
         /BTEo3YmEODux/Q7u9ELAKfOTKGyehV9BvyXMyGsJ/Jka3Q3F0zZSNwqX7TnI3/b11bd
         /pW/OC1W+8+p8190A+WIeoSwBhyn2Y9bA9SKw18e3HqW1cQ7JuDDVDOxHlZtUJJ3MNpc
         UGZd8Vb2cmfdzdcIalnwIeFtJfKPZ/C7eTZPEem/t7zcXCUfMCVH21x1/H3xG5PQuUJl
         bXN77pttqpB+AbgwOwejbCR/sx45YVvOicSpi9oTxdgbxd9mJ0M7oX+/mWF+cfQLD7GI
         UzLA==
X-Forwarded-Encrypted: i=1; AJvYcCVqta7xB4htnkWLbNnkCTFCUZLGxdnDbrzNl3J642kA3K0AwXB/+9YYb4/y3M5dOZIF8j3jQ3RSsnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwI/RNUqJYf8OYqobkvNZb9y1KodW/7inJ7drhEXiPw91Uq0rL
	zFqiLJOBhfBcgaqXiPcRVHGNisWRy8xSHrg8P+4IXjMiA4R/H7uVTA31yf4Nsa0=
X-Gm-Gg: ASbGncvf5vzHNzZGh6LLnFhOMn5zpm+6FBsS0M6R2dMWU2AAlFliq2m0Ni9zS3KqmLr
	8kdqigkMldHVyB/tR4uoKYz1L5C/TKaxY7hrV2vaU10uB0eBOiOyQRYgLYfJjpP0OwtM4bLRvcJ
	P1MkouQzFF8uH44vcPJ21qDFmlE4b0GYn5pMHVNq4BKzCdvd1P0RSDf24dhtDkj6O3BbN2HkndV
	yUQuP8SCzfrV0PMpOu8viOi1adBvK5lw1Zk10RDOI6pr3Ru7Vs9Ur/yoUJnIh10LMU1ILTs3imV
	C8jIqs6imCVRNh2J
X-Google-Smtp-Source: AGHT+IFkJr9GlfDzMfKesKE8ace4E8O09xxP/zgehp8g1sOlhe/RbcBXYI45O4OUnl3dYJmueQxa4g==
X-Received: by 2002:a17:902:d48c:b0:20c:5404:ed69 with SMTP id d9443c01a7336-21501a43fc5mr51658525ad.31.1732733479954;
        Wed, 27 Nov 2024 10:51:19 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2150b4d9abasm15364505ad.35.2024.11.27.10.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:51:19 -0800 (PST)
Date: Wed, 27 Nov 2024 10:51:16 -0800
From: Joe Damato <jdamato@fastly.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	edumazet@google.com, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, pcnet32@frontier.com
Subject: Re: [net-next v6 5/9] net: napi: Add napi_config
Message-ID: <Z0dqJNnlcIrvLuV6@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	edumazet@google.com, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, pcnet32@frontier.com
References: <20241011184527.16393-1-jdamato@fastly.com>
 <20241011184527.16393-6-jdamato@fastly.com>
 <85dd4590-ea6b-427d-876a-1d8559c7ad82@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85dd4590-ea6b-427d-876a-1d8559c7ad82@roeck-us.net>

On Wed, Nov 27, 2024 at 09:43:54AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Fri, Oct 11, 2024 at 06:45:00PM +0000, Joe Damato wrote:
> > Add a persistent NAPI config area for NAPI configuration to the core.
> > Drivers opt-in to setting the persistent config for a NAPI by passing an
> > index when calling netif_napi_add_config.
> > 
> > napi_config is allocated in alloc_netdev_mqs, freed in free_netdev
> > (after the NAPIs are deleted).
> > 
> > Drivers which call netif_napi_add_config will have persistent per-NAPI
> > settings: NAPI IDs, gro_flush_timeout, and defer_hard_irq settings.
> > 
> > Per-NAPI settings are saved in napi_disable and restored in napi_enable.
> > 
> > Co-developed-by: Martin Karsten <mkarsten@uwaterloo.ca>
> > Signed-off-by: Martin Karsten <mkarsten@uwaterloo.ca>
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > Reviewed-by: Jakub Kicinski <kuba@kernel.org>
> 
> This patch triggers a lock inversion message on pcnet Ethernet adapters.

Thanks for the report. I am not familiar with the pcnet driver, but
took some time now to read the report below and the driver code.

I could definitely be reading the output incorrectly (if so please
let me know), but it seems like the issue can be triggered in this
case:

CPU 0:
pcnet32_open
   lock(lp->lock)
     napi_enable
       napi_hash_add
         lock(napi_hash_lock)
         unlock(napi_hash_lock)
   unlock(lp->lock)


Meanwhile on CPU 1:
  pcnet32_close
    napi_disable
      napi_hash_del
        lock(napi_hash_lock)
        unlock(napi_hash_lock)
    lock(lp->lock)
    [... other code ...]
    unlock(lp->lock)
    [... other code ...]
    lock(lp->lock)
    [... other code ...]
    unlock(lp->lock)

In other words: while the close path is holding napi_hash_lock (and
before it acquires lp->lock), the enable path takes lp->lock and
then napi_hash_lock.

It seems this was triggered because before the identified commit,
napi_enable did not call napi_hash_add (and thus did not take the
napi_hash_lock).

So, I agree there is an inversion; I can't say for sure if this
would cause a deadlock in certain situations. It seems like
napi_hash_del in the close path will return, so the inversion
doesn't seem like it'd lead to a deadlock, but I am not an expert in
this and could certainly be wrong.

I wonder if a potential fix for this would be in the driver's close
function? 

In pcnet32_open the order is:
  lock(lp->lock)
    napi_enable
    netif_start_queue
    mod_timer(watchdog)
  unlock(lp->lock)

Perhaps pcnet32_close should be the same?

I've included an example patch below for pcnet32_close and I've CC'd
the maintainer of pcnet32 that is not currently CC'd.

Guenter: Is there any change you might be able to test the proposed
patch below?

Don: Would you mind taking a look to see if this change is sensible?

Netdev maintainers: at a higher level, I'm not sure how many other
drivers might have locking patterns like this that commit
86e25f40aa1e ("net: napi: Add napi_config") will break in a similar
manner. 

Do I:
  - comb through drivers trying to identify these, and/or
  - do we find a way to implement the identified commit with the
    original lock ordering to avoid breaking any other driver?

I'd appreciate guidance/insight from the maintainers on how to best
proceed.

diff --git a/drivers/net/ethernet/amd/pcnet32.c b/drivers/net/ethernet/amd/pcnet32.c
index 72db9f9e7bee..ff56a308fec9 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -2623,13 +2623,13 @@ static int pcnet32_close(struct net_device *dev)
        struct pcnet32_private *lp = netdev_priv(dev);
        unsigned long flags;

+       spin_lock_irqsave(&lp->lock, flags);
+
        del_timer_sync(&lp->watchdog_timer);

        netif_stop_queue(dev);
        napi_disable(&lp->napi);

-       spin_lock_irqsave(&lp->lock, flags);
-
        dev->stats.rx_missed_errors = lp->a->read_csr(ioaddr, 112);

        netif_printk(lp, ifdown, KERN_DEBUG, dev,
