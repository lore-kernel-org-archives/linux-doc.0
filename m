Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC512FB3C
	for <linux-doc@vger.kernel.org>; Wed,  1 May 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714578514; cv=none; b=bLu8HQuVpKtVO4s5qcZLLD+mgbvAdYl1MP8o1EaBVcBFATOa9YMuhNrfi9i5eKGTwByta7D1ADQshDY8mx4O0PfyN+V/EFZzGhBao+hiSDNaweRPQgFJn91bxLPhPickbDfdG/g7yMW2AjK1W67iNFcj7huqscYrLbF5y6xGNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714578514; c=relaxed/simple;
	bh=ep9gRD8mGOXCtjRdooKCCClREdkKGq/7TcmThE40S2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HInBbWQCMiMFOF+77pVO/jfHKxyDq1vKHcLUOm/QAyYST026an7CGmLytsp8xYW1tjhXTd7Qn/A1esrQ5HFKOPrXFcei/VHl4gD4SiGkW4JvAReJx/Cs4CpiVRjRjh9x2Ny/NcjSxL9TRJaRtuTZk9Zl9FGF4rHm3LfOtNR7q/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ii/rOyYx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ii/rOyYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714578512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9vXPnuPC4TTKf1aPUT/9gMUEiWKzRf5rqJKHhBZKq84=;
	b=ii/rOyYx/PXPv/8uFsVS8N4KfOoBSyJQD+1xY6oywdabS/RBrh9ngROXqEjLzd41bovZfc
	7DvOGjJAY86ZqTo8QYygpgZnkdlLS4mzZLs/Ym/+KEXwa1sZCwQ2ydq49ttS5UZG2RSTi6
	9+k8lK4M4kUG/nk8jPMnTcFZQVPNOhA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-9Vv51LoaM3ql8SEfWULK5g-1; Wed, 01 May 2024 11:48:30 -0400
X-MC-Unique: 9Vv51LoaM3ql8SEfWULK5g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a58bca80981so370685866b.0
        for <linux-doc@vger.kernel.org>; Wed, 01 May 2024 08:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714578509; x=1715183309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vXPnuPC4TTKf1aPUT/9gMUEiWKzRf5rqJKHhBZKq84=;
        b=JKh/lTK39ZESVafxP+dTYWQDtYPOnrbYJUid5gYnDYd7P9shAY5OU4Ju1o1T20s3bv
         8BgYzjuQJiQsjyqi2rMO+xjdGd89lztt5Ghni1N+185zTT2DIK4blxhHq861i4JgWIW3
         9W6BAKIQkO8tziwM6ZauanQLBYGJVc/9PjKCaW/QG2ymO49MAnPJPrVwIR9fCL/E1uqm
         SGuKoh0Rqrz14R2DJNScyKfVoCa2d0DLMbdLA/Ws+94VH3FozJODqlqVCDlq/FoZbwzD
         w4A0r2zj/VroTl69aHxPagIH4HoxohT1fdArEib4OT6z3m6SNvqwm84jWDQeV2jcVbfR
         4+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWQyLzIxYYON4Z6OULO5+JyDrPQHHAXhj+YF5cOL5vk3Cvk19KA7F7l6OSP+AaUkt1wd8bDpSrMTtnW8xpXTaoVax467eSs8OrG
X-Gm-Message-State: AOJu0YyzrAzBIjaRpXf3dJoUIsoCcD115pW49HOHxB0O41SGb88w8efP
	qOgkr8fBdyaoL78+TsB2w/REQttGVHycFmk6zGopqEmfA7GWHyzqetg6+SqIr5JJECwGn8FOdE5
	DEPdeul9e22cRqMZQ86sZAoe621zIij46f2d9ID5iA+89m/j3ceF4BtaAKA==
X-Received: by 2002:a17:906:5d2:b0:a58:e4dc:ad99 with SMTP id t18-20020a17090605d200b00a58e4dcad99mr1916524ejt.2.1714578509554;
        Wed, 01 May 2024 08:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPkX5jNP9njQFhCTsNr5Jxg9lBydsGfLtvu6aP6rVyCQCFHRXL0OAvf21MC7R4anBI/wEV3Q==
X-Received: by 2002:a17:906:5d2:b0:a58:e4dc:ad99 with SMTP id t18-20020a17090605d200b00a58e4dcad99mr1916493ejt.2.1714578508989;
        Wed, 01 May 2024 08:48:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:346:6a42:bb79:449b:3f0b:a228])
        by smtp.gmail.com with ESMTPSA id i9-20020a170906090900b00a55b05c4598sm12447242ejd.133.2024.05.01.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 08:48:28 -0700 (PDT)
Date: Wed, 1 May 2024 11:48:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Jakub Kicinski <kuba@kernel.org>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Jason Wang <jasowang@redhat.com>, Brett Creeley <bcreeley@amd.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Tal Gilboa <talgi@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Paul Greenwalt <paul.greenwalt@intel.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, justinstitt@google.com,
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH net-next v11 2/4] ethtool: provide customized dim profile
 management
Message-ID: <20240501114754-mutt-send-email-mst@kernel.org>
References: <20240430173136.15807-1-hengqi@linux.alibaba.com>
 <20240430173136.15807-3-hengqi@linux.alibaba.com>
 <202405011004.Rkw6IrSl-lkp@intel.com>
 <1714538736.2472136-1-hengqi@linux.alibaba.com>
 <20240501074420.1b5e5e69@kernel.org>
 <1714576307.2126026-2-hengqi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1714576307.2126026-2-hengqi@linux.alibaba.com>

On Wed, May 01, 2024 at 11:11:47PM +0800, Heng Qi wrote:
> On Wed, 1 May 2024 07:44:20 -0700, Jakub Kicinski <kuba@kernel.org> wrote:
> > On Wed, 1 May 2024 12:45:36 +0800 Heng Qi wrote:
> > > >    net/ethtool/coalesce.c: At top level:  
> > >  [...]  
> > > >      446 | static int ethnl_update_profile(struct net_device *dev,
> > > >          |            ^~~~~~~~~~~~~~~~~~~~  
> > >  [...]  
> > > >      151 | static int coalesce_put_profile(struct sk_buff *skb, u16 attr_type,
> > > >          |            ^~~~~~~~~~~~~~~~~~~~
> > > >   
> > > 
> > > This is a known minor issue, to reduce the use of 'IS_ENABLED(CONFIG_DIMLIB)'
> > > mentioned in v10. Since the calls of ethnl_update_profile() and
> > > coalesce_put_profile() will only occur when IS_ENABLED(CONFIG_DIMLIB) returns
> > > true, the robot's warning can be ignored the code is safe.
> > > 
> > > All NIPA test cases running on my local pass successfully on V11.
> > > 
> > > Alternatively, I remake the series to have IS_ENABLED(CONFIG_DIMLIB) back,
> > > up to Kuba (and others). :)
> > 
> > You should remove the ifdef around the member in struct net_device.
> > It's too much code complication to save one pointer in the struct.
> 
> Makes sense.
> 
> Thanks.

if you really want to you can add a comment
 /* only used if IS_ENABLED(CONFIG_DIMLIB) */

