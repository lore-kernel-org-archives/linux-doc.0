Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33BB286881
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 01:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777597657; cv=none; b=ajigYmox0CRR/lJY4waLtKh2HHC/Pq1YnOnA7RbqG7uM0q/pb4Z3P0DJgL5KHo6hGR5NzBPLNnc0Q2AbuOXFjMASTOOInQyy4l4ajyyPwTmeNb6qafQquKSxWkw2vdVSAAu4HHxTnA+RFZsTBWujRE1NeRF/Fr74RUp9eEFHlsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777597657; c=relaxed/simple;
	bh=bzjWLrIg2CCN3/hGH9Hbm2IFgPMgmGCzp/tnDAxT9M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cr/b9gn7727imzX8EudIkyceh0djZZRAEhxN4kFOEb+ZETCJWTzqcG4nC+MUlAhqJjxveFaJ3LeYJ/wwTmlZP6tcbIcqpEJHHLmdLrvG/+h02QBxyszty66VJ0FoBNT8HS9cKyMXB/2jVOrpgf6xp1chvkmOyJ6/vNIN2ObAKIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJOX65wu; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJOX65wu"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8d65f4073bfso192619585a.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 18:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777597655; x=1778202455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=luFHJPJpmJJ6ifj+D224jn0aiIzHHo2nBsB+na/dGdA=;
        b=MJOX65wufmDQeqKx+vwHw03RyQT9lsJPsjLW7k/6ZLPq7CxaUZ7dTyBDlybRSduKLt
         dFq1nfTiOJgS9d1B7nARYKb0jiG4jV38iFuIwRB7CGF+f25SuuUGfbEVBAvyuHokZUsU
         iONNlx8TjiehBmGif707jRp0OG3Ty5PjBQI9A8zvsUzVleaBlXNGgUdi/8xS5e52RVsQ
         zIcREcDAbNqGZr2LFax8rYh0SK+CyFwQzavB//8J+pEvYkkRKpdW0ARUFubew0zHL6K9
         Cp7RvW9yO+Mzz/qLvFRktTAPrzBGY+X6tFN7yj743axJJ5szrzSkaNkOLQvoIDIppYcj
         xxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777597655; x=1778202455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luFHJPJpmJJ6ifj+D224jn0aiIzHHo2nBsB+na/dGdA=;
        b=s1aynY1QOAE6ZyN01NgT5/qCYKuttcqgafYmnx8sSaHZB26em7JIlOOd30JJ9LhpGZ
         uPYZIz+LDwyw4H8iEiedGYfgEvJx3EneAIr4CrFkTOAFEwiaKj3I8hNbDh+Pf9E8Ajmk
         mu0b6rqGF9RXMajIyiJMJoF0+BWa4OrbOlzOFPbBm71MhsnmfWzkBdzZ5qb4UeMcWQqI
         xeUz/xbbtQPNIxu3VanWah0+aKCpnbzXqGI8pxJOOcvGV5XOK3RmoIfMnWwIzq/OfAGe
         t87QNGloNB0eILkxpLf1RwBWe9ZNDV4NrdSqJ+wO31iSQS5BPhJPzKWm9UckWdkEOLLO
         Naaw==
X-Forwarded-Encrypted: i=1; AFNElJ/siIx9y92wFXXa9ptm+7vxysMyyqoDY4vfXhs0kfy3BorHnTOy+CkPFR4xxdRhYcQGGn4EcDOI+bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyqeQRJjdNrKkK5Uqarz57lH/shbNvg6c6hSfOODYdCffHiC8V
	PmrfZ95Em//4qJfQreqqbSG7ZJkcY80w9xUxvqR/CPILAzNA3C74U2LG
X-Gm-Gg: AeBDieva5nWpyXZuIngwLSEVI204hXQre3yjuoqpfonc2XgbHMOuo9h+8v4heNcQNiW
	NadQFYJxrFZgT2LA0Ngsy8CYDdizxYMUMNOsv/ASmmfHBzbi4LOqyyJmgwaxb6uS+DG09SdRaT/
	IMxU6h/UUu8EI4mquxkXneY9Ay1VDb/wQVw7jTZXAfNTGJCgLAqkO3MqQbZlccqJspLNcXslrml
	qz897mo/2exUy0ZS+6aC91fsN3QfKRjYDBegf26XAxXOmJLJ1ooAm5JAGscMrOjzdNFcHTOa9Lv
	iR91uqpX85LYZkYCPCVi4Ohz4ko9MZfm6Ub1jMxzYeCWuidqeU7ZMToYPZsE3SgRY6lVKB9XuY+
	QKgO2miwLYIz8RbZMkXYY6wdxG5boA1LYDtt1WAJTq5vAI68gDW92hgzMBGsgRb2mbXXJRVSbSA
	ia854HQKbtsrGAoxXHg+J4B0mrMXAth5EbzHDMrqTZ7fcCbmTGRI4LkRa5LoAOjArja/kD
X-Received: by 2002:a05:620a:469f:b0:8ee:e011:a77a with SMTP id af79cd13be357-8fa863df021mr885936585a.13.1777597654699;
        Thu, 30 Apr 2026 18:07:34 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f814:17::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c253264sm18485785a.22.2026.04.30.18.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 18:07:34 -0700 (PDT)
Date: Thu, 30 Apr 2026 18:07:28 -0700
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
Subject: Re: [PATCH net-next 07/11] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Message-ID: <afP80MVBJSYJQTx/@devvm29614.prn0.facebook.com>
References: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
 <20260428-tcp-dm-netkit-v1-7-719280eba4d2@meta.com>
 <20260430175724.0c134a0d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430175724.0c134a0d@kernel.org>

On Thu, Apr 30, 2026 at 05:57:24PM -0700, Jakub Kicinski wrote:
> On Tue, 28 Apr 2026 15:42:04 -0700 Bobby Eshleman wrote:
> >  	shinfo = skb_shinfo(skb);
> > +	if (shinfo->nr_frags == 0)
> > +		goto out;
> 
> Feels tempting to cover the NETMEM_TX_NO_DMA / NETMEM_TX_NONE
> cases here before we even look at the frags?

That sounds good to me (had considered it, but opted out cause I felt it
might look odd with the switch-case that follows). And I'll address the
bug(s) the model called out here/elsewhere too.

Thanks,
Bobby

> 
> > -	if (shinfo->nr_frags > 0) {
> > -		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
> > -		if (net_is_devmem_iov(niov) &&
> > -		    READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev)
> > +	niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
> > +	if (!net_is_devmem_iov(niov))
> > +		goto out;
> > +
> > +	binding = net_devmem_iov_binding(niov);
> > +
> > +	switch (dev->netmem_tx) {
> > +	case NETMEM_TX_DMA:
> > +		if (READ_ONCE(binding->dev) != dev)
> >  			goto out_free;
> > +		break;
> > +	case NETMEM_TX_NO_DMA:
> > +		break;
> > +	default: /* NETMEM_TX_NONE */
> > +		goto out_free;
> >  	}
