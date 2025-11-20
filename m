Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D635F8A3
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652676; cv=none; b=uB78/YzmaVeKSZoK/3Lh/twfE35qldiGIVyhX0BSn7HQnjWzRSXcAekbd3Xj8YspVoV2w6HFTDbm88rNQfBparD8eIRsktXK1OC/37FFw8Fl09aQmz4LkRo3ba0gR2Ff/1gn4Yv05VsiEJBlQ6mGCj1idJFf5ub+wIVZMa4KBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652676; c=relaxed/simple;
	bh=wMnT47phEFuGfAdPalYZmpWGC6ln9kV4Q339Ib+0xuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgdN0bbmMHuML/B3HayGYnLLccy89Hn4SOJm4S7MCenIvRa4EUA8pT07iavWSUHy2+JO3XYypR1XbhMAehemu1WqpZckLnmvAVxY9SPMybRD883R6F3DTImswg2XA+/Pu1ZvwdL/WgptiDlCdzRJEkmU9dpp/gbHn+0d2m28AGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbzlHOj7; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbzlHOj7"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-640d0895d7cso1282945d50.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 07:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763652673; x=1764257473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PFiT8mQz2EeFfhAtckqnTM9BcNHX0xiz9tE4/FBhkTE=;
        b=lbzlHOj7nNZO01ylI7WXU8F4o0tSysm4a2eWQsStUmqXbtFdoDctgJ9r196y/ZMHFF
         CNCzckt38jO/1VY/nyuIvSSHn8iBArZd04LYVFofPSKZs1UrMIjgTSxZeU6nWwuqillY
         wKbMquXENiQGkkXgKReO54LN5792IV1wxdaQZJV54+XqH8fEWqIcDw3XhyuPOK0KQ2WU
         /nw3G188kAh61IeWc2FZ3Amig8SovI+FzqoQ56g8wSSD3owR+M9smjMLKHGkxG1d06ze
         ftfV9xm1sZNsVIg/uUqmSJK9h6W2eSZ1gi7FBtIbjUhhMnvNkPSq6zX96irGDd2CE0jt
         jRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763652673; x=1764257473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFiT8mQz2EeFfhAtckqnTM9BcNHX0xiz9tE4/FBhkTE=;
        b=N12I6fntDQx/F+3hwS2W9/083av8JQ/QdxmJqLasRjK3trsHuPVHMDC7XGjSKDtq6L
         tUWkXLAisbRhwr+NX5gHM3UnnJoSgpX7QhNf4G/lGlO0IH2E7IA31StbqewBLLiVnwEL
         HN+9s4Ptzn+o6PwhwbXkZbCM4BmNTreO/GUA2h/1fLyNItS5LjzQiQQWVsmjEPfYBPIx
         rHxuhtSgODq1qVAX82TDqa+zOm6Y9YVYv0QzfQ6F6WbW4gB6eiaqQaFUYLgy2Q3Abanu
         TFmdWDAuYqkQJgYwDYt8nVPorSZL4uCoavsLBeAUynLiGVOvqBH7PxPllo0xdWOnWmHB
         ZTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrp5mvJSS+Cc+gIpCKDNoV2FHxjY4ECIIIqy0MC+1fWwfgoXnhwdbftfuaGPxWlYUW7wnw/F4GKwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6VpVqyypVdbk+WfFFGEwGPKVAyUf42jMUOR2Grx2KdUHa5yHg
	nuKHvdfUDC4vHZEiwz6NmJ/7tyLs219RRdnZXfNwfnj/Ne55G07yF+QB
X-Gm-Gg: ASbGncupell3TqRirM8eZhlHazJs4rnQQ+z3ykkc8I9u0SQeUPU//ZotL63h+e21ik+
	rJxeDz3BYjuv8S8dYDVJIeZpxgA9TPIED0sIdA1lLdL4Lz4J7UceJNUEWuLC6a50lRNKwmqsdW6
	+urzi+DWR6k5GmdoYuZWvouuJbENPb9dh79LpwfgH9+IaAq+SWXkqg/IiG3MBPwiJ/rnG62b/aP
	khIvHP+V01XUwzo8fTn4PAQY4Mx7JOJC+7M7uEcvZW3RBC3RDQEN9G//PI/oI8z4czAhreJRL6m
	axHKjSA2PbLMCDnfpXv+pYDv/A+z1BVJDvjRKcRxmOt5JDkE8mhTf/2nIHwkOYtZPsppV6vRKPK
	JwUJzPb4P7XJjPibglWBc7qF/1CxcQenecp3zmJgCGysvaV+VnuA92x/+3C+1D7OzDMN/7r1tTU
	QAYQuJaaaan6MxzojhiBKDE0DCZifJ2doOJnEc9Tlrm1IqoEY=
X-Google-Smtp-Source: AGHT+IGnxsv7O9k5uQ7ryneqkrnqq+cPJZPkqCvcNCDp+BprL3ACVr9C8SpKEUSItTS/dKmykTVJvA==
X-Received: by 2002:a05:690e:12cc:b0:63f:b4b4:7758 with SMTP id 956f58d0204a3-642f8df4854mr2073800d50.11.1763652672604;
        Thu, 20 Nov 2025 07:31:12 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:45::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-642f71787f3sm871532d50.16.2025.11.20.07.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:31:12 -0800 (PST)
Date: Thu, 20 Nov 2025 07:31:10 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v7 3/5] net: devmem: implement autorelease token
 management
Message-ID: <aR80PvXaX1+S/avE@devvm11784.nha0.facebook.com>
References: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-0-1abc8467354c@meta.com>
 <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-3-1abc8467354c@meta.com>
 <a0543467-df01-4486-9bac-d1a3446f44cc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0543467-df01-4486-9bac-d1a3446f44cc@redhat.com>

On Thu, Nov 20, 2025 at 01:19:54PM +0100, Paolo Abeni wrote:
> On 11/20/25 4:37 AM, Bobby Eshleman wrote:
> > @@ -2479,10 +2504,12 @@ static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
> >  			      unsigned int offset, struct msghdr *msg,
> >  			      int remaining_len)
> >  {
> > +	struct net_devmem_dmabuf_binding *binding = NULL;
> >  	struct dmabuf_cmsg dmabuf_cmsg = { 0 };
> >  	struct tcp_xa_pool tcp_xa_pool;
> >  	unsigned int start;
> >  	int i, copy, n;
> > +	int refs = 0;
> >  	int sent = 0;
> >  	int err = 0;
> >  
> > @@ -2536,6 +2563,7 @@ static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
> >  			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
> >  			struct net_iov *niov;
> >  			u64 frag_offset;
> > +			u32 token;
> >  			int end;
> >  
> >  			/* !skb_frags_readable() should indicate that ALL the
> > @@ -2568,13 +2596,32 @@ static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
> >  					      start;
> >  				dmabuf_cmsg.frag_offset = frag_offset;
> >  				dmabuf_cmsg.frag_size = copy;
> > -				err = tcp_xa_pool_refill(sk, &tcp_xa_pool,
> > -							 skb_shinfo(skb)->nr_frags - i);
> > -				if (err)
> > +
> > +				binding = net_devmem_iov_binding(niov);
> > +
> > +				if (!sk->sk_devmem_info.binding)
> > +					sk->sk_devmem_info.binding = binding;
> > +
> > +				if (sk->sk_devmem_info.binding != binding) {
> > +					err = -EFAULT;
> >  					goto out;
> > +				}
> > +
> > +				if (static_branch_unlikely(&tcp_devmem_ar_key)) {
> 
> Not a real/full review but the above is apparently causing kunit build
> failures:
> 
> ERROR:root:ld: vmlinux.o: in function `tcp_recvmsg_dmabuf':
> tcp.c:(.text+0x669b21): undefined reference to `tcp_devmem_ar_key'
> ld: tcp.c:(.text+0x669b68): undefined reference to `tcp_devmem_ar_key'
> ld: tcp.c:(.text+0x669c54): undefined reference to `tcp_devmem_ar_key'
> make[3]: *** [../scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
> make[2]: *** [/home/kunit/testing/Makefile:1242: vmlinux] Error 2
> make[1]: *** [/home/kunit/testing/Makefile:248: __sub-make] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> see:
> 
> https://netdev-3.bots.linux.dev/kunit/results/393664/

Thanks Paolo, I'll fix that for the next rev. And I'll have to add
building kunit into my flow (currently using some custom stuff and nipa
ingest_mdir, but don't think either has kunit).
> 
> > @@ -2617,6 +2664,7 @@ static int tcp_recvmsg_dmabuf(struct sock *sk,
> > const struct sk_buff *skb,
> >  
> >  out: tcp_xa_pool_commit(sk, &tcp_xa_pool); +
> 
> [just because I stumbled upon the above while looking for the build
> issue]: please do not mix unrelated whitespace-change only with
> functional change.

Don't know how I missed that line, will definitely remove.

Thanks again,
Bobby
