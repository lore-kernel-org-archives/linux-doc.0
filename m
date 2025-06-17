Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE21FFC49
	for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750139881; cv=none; b=QBgpPqXPeh49awLlDHRJyS+G1PRVPcGv3sPVTNW8c05Ik3H2N7uyV17hBwVmOPbp0jIivPpkOvfKL/p1pQPNnmdyJvqUYok6fAvLCZb0uG9orx92DI9n9ovHYlTFuOTde1+xfku1ch/Xu3lKLfOY+MEF7qVa/iNWAEBl4tMpdC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750139881; c=relaxed/simple;
	bh=GRYarQ+kHkb/ukxZY27ulsblCQqYCRFLgbkK8/s6tj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfg7C5C4omkWSRcikfvLArvH94H3YbIT5aooEdtcWCSvNNr1aUuupV+bXOWzNgmVjj0mo3cpi42X2OFuIZVy/5Ua9/0a6ZEY0okRK2yp2PQiZrxcr0MESAfSAEq8w6s3009rbJvLnAHEBwpI7Yl60CMorl1oXqpw+eHN+dlgbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=khyMBJjL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="khyMBJjL"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so9070118a12.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 22:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1750139877; x=1750744677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orUmTfObyCoRilgOAZEE4KG1ZsUE67JBZL30U/ZdLd4=;
        b=khyMBJjLeH0NmVcdbDi5nC+whlK62cRoVOsAWHOqy4UG62hhqtRXZdj+zLKA93nZ5I
         6Nu6YwGkJXRRSzJ3vHjr5WlGKbSotWYegt+Zwwr5L45/vYIZpHh6RtAF+lNjdra7VH16
         JXV49SMjr8CY7AKFapv6wU3Av5zkJqWXWseoEsEbrlZiYKkSwA31nYgwrzjYN70xNpXo
         mGvvJC7Vbi132I5rZ2bjuRL6xpMKbwl+BbhwCTzTvNry5V5wPKHIBAVWj7lFnIhH8K2k
         4TDGRU2zP9lCTfjJOCnwr3uOSb5UeK4dzpeEf+8MCl6QjrAIVhqer42yX/x+Gn/V/rGh
         Zztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750139877; x=1750744677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orUmTfObyCoRilgOAZEE4KG1ZsUE67JBZL30U/ZdLd4=;
        b=qzqddCoWYRjS1rxMOX8BEVX4nlkmbfXH24Y2R+53KVyuOs7k8xpzmPjP6FSvXaAPM5
         6D/8/e54MXAT9tp9zWjkE/qs2i8GQ0gs3rk6s74yr7JRJXM9ro0/mzJznAmiy6UlT84t
         hMwdipIidP9FF4OB7QOSuP0Kp+0Mqydw6nokAgSXrHQ1oIQWDOSlNP3aIljeFdi5I2oN
         R515mDfaJfV7AdW8tH2K8k/PcGRnvZFWm5yCFI/kjt9zeOlQgj+VO1Qil1BKrzBIwoaZ
         D/GGcNSg7gNmL1dkqyI4FAIBtKW48T7u/Xy1U9flquywpOEIPdaa67mRspLEHxVEwyCu
         igaw==
X-Forwarded-Encrypted: i=1; AJvYcCUYZrubpzF/gdKSzT9tZl4VyoY06LBxjMmyJ+kzrWnvBzTbhts2dZGT+iZJ3T2ZRxuBMJwDWH5Af40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbiLpMlxw+bBxnHm1sZni4GRod5z0GWZpt9H0KAFaZiJgxsgKX
	YleswQz6guH+JBVklj4fEOH4lmFkyx+imFpavudmgs6kw/uGS3xr1Us5mFtRNLWDVn4=
X-Gm-Gg: ASbGnctCPRU2tqNawu2zw6SYrZo4uflOQ0VUYvwgqbMTb2Bz4xDxuvV4iAcidBHDBPH
	1BM1+EhBSBP9jX3KU1O9JtZyDHN5DsRF6RouxjW6LUUDu6qfKGklYpAkwlTmFKAqDKnpo8yqTpQ
	44g5vmscZXb8mcETHM4yXWA/1d8TQ5M2MXk0pC7iq3h18tWyTjfJgth3eOWAkFhDpu4UMxmb2oQ
	BTIYC5MlnzV9+XnLMWlN8qCyc6eT/FolTT59v9GIYltNPfI1THg3D9VroENTFVHEL6OEMEhVC7G
	PunUzPqWnvTFNMZgc2FQAuolePx07qZEaczE3Y/IhhVQ3c3aDMRiY6Gu3ccl6/kCJb3LHGQ8xp0
	dbPIZvJPjanpmBYZYznyAAjDSrKGv
X-Google-Smtp-Source: AGHT+IEe9oiH/XW45dcZzWkk+b2BNMUc2j8IfiGoL68WhUG3Yi3uAEdxwgcuEWUTHnM1E0z8dGSjwg==
X-Received: by 2002:a17:907:72c4:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-adfad320f66mr1273488466b.18.1750139876819;
        Mon, 16 Jun 2025 22:57:56 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81b8a3fsm793128166b.38.2025.06.16.22.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 22:57:56 -0700 (PDT)
Message-ID: <92580e9d-55c1-4298-ae7a-00726a727fb5@blackwall.org>
Date: Tue, 17 Jun 2025 08:57:54 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] bonding: Remove support for use_carrier = 0
To: Jay Vosburgh <jv@jvosburgh.net>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Stanislav Fomichev <sdf@fomichev.me>, Hangbin Liu <liuhangbin@gmail.com>,
 linux-doc@vger.kernel.org
References: <1922517.1750109336@famine>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <1922517.1750109336@famine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/25 00:28, Jay Vosburgh wrote:
> 	 Remove the ability to disable use_carrier in bonding, and remove
> all code related to the old link state check that utilizes ethtool or
> ioctl to determine the link state of an interface in a bond.
> 
> 	To avoid acquiring RTNL many times per second, bonding's miimon
> link monitor inspects link state under RCU, but not under RTNL.  However,
> ethtool implementations in drivers may sleep, and therefore the ethtool or
> ioctl strategy is unsuitable for use with calls into driver ethtool
> functions.
> 
> 	The use_carrier option was introduced in 2003, to provide
> backwards compatibility for network device drivers that did not support
> the then-new netif_carrier_ok/on/off system.  Today, device drivers are
> expected to support netif_carrier_*, and the use_carrier backwards
> compatibility logic is no longer necessary.
> 
> 	Bonding now always behaves as if use_carrier=1, which relies on
> netif_carrier_ok() to determine the link state of interfaces.  This has
> been the default setting for use_carrier since its introduction.  For
> backwards compatibility, the option itself remains, but may only be set to
> 1, and queries will always return 1.
> 
> Reported-by: syzbot+b8c48ea38ca27d150063@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b8c48ea38ca27d150063
> Link: https://lore.kernel.org/lkml/000000000000eb54bf061cfd666a@google.com/
> Link: https://lore.kernel.org/netdev/20240718122017.d2e33aaac43a.I10ab9c9ded97163aef4e4de10985cd8f7de60d28@changeid/
> Link: http://lore.kernel.org/netdev/aEt6LvBMwUMxmUyx@mini-arch
> Signed-off-by: Jay Vosburgh <jv@jvosburgh.net>
> 
> ---
>  Documentation/networking/bonding.rst |  79 +++----------------
>  drivers/net/bonding/bond_main.c      | 113 ++-------------------------
>  drivers/net/bonding/bond_netlink.c   |  11 +--
>  drivers/net/bonding/bond_options.c   |   7 +-
>  drivers/net/bonding/bond_sysfs.c     |   6 +-
>  include/net/bonding.h                |   1 -
>  6 files changed, 25 insertions(+), 192 deletions(-)
> 
[snip]
> diff --git a/drivers/net/bonding/bond_netlink.c b/drivers/net/bonding/bond_netlink.c
> index ac5e402c34bc..98f9bef61474 100644
> --- a/drivers/net/bonding/bond_netlink.c
> +++ b/drivers/net/bonding/bond_netlink.c
> @@ -258,13 +258,8 @@ static int bond_changelink(struct net_device *bond_dev, struct nlattr *tb[],
>  			return err;
>  	}
>  	if (data[IFLA_BOND_USE_CARRIER]) {
> -		int use_carrier = nla_get_u8(data[IFLA_BOND_USE_CARRIER]);
> -
> -		bond_opt_initval(&newval, use_carrier);
> -		err = __bond_opt_set(bond, BOND_OPT_USE_CARRIER, &newval,
> -				     data[IFLA_BOND_USE_CARRIER], extack);
> -		if (err)
> -			return err;
> +		if (nla_get_u8(data[IFLA_BOND_USE_CARRIER]) != 1)

you can set extack to send back an error to the user that use_carrier
is now obsolete

> +			return -EINVAL;
>  	}
>  	if (data[IFLA_BOND_ARP_INTERVAL]) {
>  		int arp_interval = nla_get_u32(data[IFLA_BOND_ARP_INTERVAL]);
> @@ -676,7 +671,7 @@ static int bond_fill_info(struct sk_buff *skb,
>  			bond->params.peer_notif_delay * bond->params.miimon))
>  		goto nla_put_failure;
>  
> -	if (nla_put_u8(skb, IFLA_BOND_USE_CARRIER, bond->params.use_carrier))
> +	if (nla_put_u8(skb, IFLA_BOND_USE_CARRIER, 1))
>  		goto nla_put_failure;
>  
>  	if (nla_put_u32(skb, IFLA_BOND_ARP_INTERVAL, bond->params.arp_interval))
