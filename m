Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD09376BEC
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475916; cv=none; b=dGYkLo9WRQ8m75jpdtjRV6Z2NQpTJuw181FpVOtTbEGVdL4CRCR5a4p4LiTSmptSocYVvNcasClPmRhz4JZkTattTnxut1G3AiviCJGjMS4mfM5Q27nEhdVsouQgrzxjCD+UKS5DKJobbDLNWO4DDxisgw1bqn7NLSzE4KXTsGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475916; c=relaxed/simple;
	bh=/BimwSCUsuashVXwD+dzxd+4t5G8fzzhA6oBT4Cnlr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fo5iaWcoTesBvzHuiMNDQjPCJd/qgw5YHjxHi9easbt9hkMSdCTLjHaLLnx/iLVydPcdqggO+zPCqAWzuBhKoQDR8dXJmp/ia+mI35FJt7c5n66uHk9dCTgQm+2YRZsPE1kvuecWlnK8Iv23XC/EqUNl+xeNjgha/rzOTsQKq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7iJCGba; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7iJCGba"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dbd23bc684so7133165a34.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777475913; x=1778080713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hCAZnYdZvdp+ak79vsUFUwhsK90OGnLnVC3WYq76N8=;
        b=b7iJCGbaNlXtp4X0g6/WayFeLAL1bJl7AXsejxs7Gg1yd3+tXxfLCqVRJ6zgl+87Ty
         AzkjBbmGxQXA5dPHLvzunpTs8WxAQ7r7BYtmSYzNn8xmKooUmrYgvDByEfrGR9oMNHST
         6CYlQCxvgSVqcxF4KUQH1q7M9m7OjIWYp2+HxRh/LoRPURMvrEgXRK9WNLNlB7BsykRX
         Pmu2UsOH9F8ek8o5h+A7RETSgO/zEg5diwBo2XSltxub7IYnetVfLLiar8QOKiuubRSR
         mVR2pcvukrXZxLDMZLKOgq8uo+utneT0SkFkFgAMAA8W5wNs+4wTTLLdIaYkjcrXUpMc
         ExWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475913; x=1778080713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hCAZnYdZvdp+ak79vsUFUwhsK90OGnLnVC3WYq76N8=;
        b=ISCVoApR2Ndr2wtvTv0/H8C0G86zr+TNgJungpJVmh384dDT0SEXUqKAB7BDI9Jl4G
         S68oYUyhG9jEKWQLOYhOxT60Es/+JF/fUbcNooiEbX39BskLXxNjB6juMgYs/7qlYdr/
         FxpxLQag9OaRK7YEK2CAWG7GscGwbhySrg/Gkj204PB69lxeaE+7rkoRc6iucI39xNkO
         fJHyweLl1QI5fykKHXaKl0JZggXtI6suNItHWLXhbkItj3hBLnK3upxjGhJ5Gu3VEpST
         6qYcSKVeQGDnhGc+00o8K3fm+pqUvarmWNBasV8nvjeuNMdQjE2LfYezfEcGaAjcz3ya
         n7ww==
X-Forwarded-Encrypted: i=1; AFNElJ/TV6XHdEW7z9y8kBqe56AagmIOokrdQXDHP3qWRKl/Mn98GPo3fQIsRGJDwCWan6SxDK8X8GS58ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCW2suPYb5JcSFEZ+QdCx1wr3REbX6zkEbsiig+pSO0p5Ymt47
	vahFgI3F3o/wNO4UgGtYbefhgDidZJYN8N/KdYM1x8ZHNe8BuX59aM09
X-Gm-Gg: AeBDieuN+AgRy31W+smZ0R6g4u3mNJpo6lNt1JXokXRBuef+eKuGMMBUq5yDjblMYgd
	8xxv/i6MkmFWjdFnd31SyldgiNBQV5iWuS/jFgonPBr9VyqyXy5+m67ChY07QhgpnfirBE70ZU/
	YZCWXkew7c04z4rTpTtST4BVYKAAGZ4diKSsDJthAaCy3oe7ae+0BoR4qO4x7P5dzIJYrn4Ssmr
	6YjWQsoGqnWtaoxNhTTa1kPnHE/CE1fFREDFSlgNCrhJ0k5SOZJed8x372Jr0oUozaNm9K+hLxq
	MBeH8P8YrkhycMRca8KbZhRAHtKMhp4JWZp4sOyXW1nVah/06gplIv94Ktip8VUeonX0H3U3EQO
	ESPehI/ONyLwXdWAgsGXewScuT9cwvChF+1AHP7oo0nZn0nCxLsOFvN55Wx+A1+/7W2imbfiV7J
	rbXMZcJcW873lrxkWkg+guVrEeo1ysxchv1kOmtF0sN/z8hh3xx8Z5sIluFA==
X-Received: by 2002:a05:6830:25d1:b0:7dc:da80:42b4 with SMTP id 46e09a7af769-7de9a1002c7mr4284996a34.24.1777475913099;
        Wed, 29 Apr 2026 08:18:33 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f812:6a::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deab99036asm1469135a34.17.2026.04.29.08.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:18:32 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:18:23 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, David Wei <dw@davidwei.uk>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 00/11] net: devmem: support devmem with netkit
 devices
Message-ID: <afIhP5dtlzCtzn1T@devvm29614.prn0.facebook.com>
References: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
 <f954a636-4d21-47c0-8afa-cc4b24adb0fb@iogearbox.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f954a636-4d21-47c0-8afa-cc4b24adb0fb@iogearbox.net>

On Wed, Apr 29, 2026 at 02:08:31PM +0200, Daniel Borkmann wrote:
> Hi Bobby,
> 
> On 4/29/26 12:41 AM, Bobby Eshleman wrote:
> > This series enables TCP devmem TX through netkit devices.
> > 
> > Netkit now supports queue leasing. A physical NIC's RX queue can be
> > leased to a netkit guest interface inside a container namespace. This
> > gives the container a devmem-capable data path on the RX side (bind-rx,
> > etc...). On the TX side, the container process binds to its netkit guest
> > interface and sends traffic that netkit redirects (via BPF or ip
> > forwarding) to the physical NIC for DMA.
> [...]
> Thanks for working on this, after the RX queue leasing got merged, I've
> been looking into the same actually. :)
> 
> I think the NETMEM_TX_* enum approach seems reasonable.
> 
> What I have a PoC on is to build out TX queue leasing as first-class
> symmetric infrastructure to complement the RX queue leasing - basically
> I implemented an equivalent to the latter in netdev_nl_queue_create_doit
> et al, so you can have independent RX and TX leases and per-queue
> accountability, such that ynl queue-get op shows the full picture, and
> lastly we could also enable AF_XDP TX-only support through this infra.
> 
> Would you be open to collab on integrating both and migrating the devmem
> code to work off an TX queue object? Next week is LSF/MM/BPF, are you
> there by any chance to catch up in person?
> 

Hey Daniel,

Definitely am open to that. I will unfortunately not be at LSF/MM/BPF,
but maybe we can schedule a meeting offline to sync up?

On the approach, explicit TX queue leasing sounds like a better way to
permit devmem's tx binding than implicitly via RX lease.

Best,
Bobby
