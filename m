Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81D36BCF3
	for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340935; cv=none; b=PNkZ7kqCRCTNh5bFvZwrxgJDavTyRHrKge904E9jSK7lfd+djVQYU8yG/f55G2P4IGNq/JOWRwvnAQ8ud/plOz6g6m2W9MLslUeugYringGVtADWYC/qBFiBo28sPv7QFpZvsyIvLIJ911UP91MgWY+cCNAv+4NSmJlil5Edd6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340935; c=relaxed/simple;
	bh=FATg9XsSiPlYwAbae8L/USKuKRBil6Mn8gqbYCmEG2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDFk40iNdzPuPKGA6oy6fKzP+HLSEYhXzhg7dy9zkigm6iKlssUSN0tzDvfaT+B3sIE8g2OM+KipnfXvEXHWBwZ5LMbYifGlUYw/5viYNBQRlW1jvDC6AjKjCD2NfoUnDvDU3rnjinWRDYY+o4z4k9t/2bs52Z3Bphi+pEt88TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNeaDh9G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2wmJ0DP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNeaDh9G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2wmJ0DP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771340933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jEc67c+eucBHPlMa8Z8GafQvzyfH5CJQ48/ZIvcQG9w=;
	b=cNeaDh9GMewGjsMFeYSHua2ChE6tehApHILnL7kiAjWin9ln/0CV1hBgNhGHD5IKzqqJRw
	lq7TVxJNqd5LcFKQ+a/KjZojKYEICgp9Xk9Bq3WFglyg2IwRnnm3omZhh8pVm+/piYg5JN
	nQ42RlfFVY7fAixXKYCeohlzyF69Ec0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-NCJfr1qXN4WeQt8qPLjYjg-1; Tue, 17 Feb 2026 10:08:42 -0500
X-MC-Unique: NCJfr1qXN4WeQt8qPLjYjg-1
X-Mimecast-MFC-AGG-ID: NCJfr1qXN4WeQt8qPLjYjg_1771340921
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4836e35292cso34161845e9.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771340921; x=1771945721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jEc67c+eucBHPlMa8Z8GafQvzyfH5CJQ48/ZIvcQG9w=;
        b=Q2wmJ0DPwomE3lsee1BYstQjxqAnEoTsy5rJ+GWkPVk8D2TXrPTr+q9n8RfHUtq6SU
         QkMKme1nOLQPh3W91U2V+9xYt6kUNqX56HkI+vksqVJHb6CzSYBoBA04iEkLOkgvJfCN
         Ak9ZVvabnKDg1E6BW13xVNL6Sa8FLyHglfTZqy7QFyBj+p/48xxZCUIIJM4N+rEyGXRS
         fKIP2GV0s0i0ZcDAVrdZ+qjYM5Z0bSsjw5cdpD8bvUd3kH5FphEqA1D4QKB6MteiGUIV
         yfznMv6w5ra0fpKcDt+HWEkfAb+DPIZNnqqil2+Y7sk0/jNVnCXcsc9CyiIpOav8I+n5
         dBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771340921; x=1771945721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEc67c+eucBHPlMa8Z8GafQvzyfH5CJQ48/ZIvcQG9w=;
        b=g8W5Q6sY9lEyVQEh7EA5+vYUX6I63zig5vF+KKj9M27tDNeK+X9W085sVzdTaqW2An
         9Yf4Cc1hXTYsstAKcZruMFsCZbPvIYF0jn6NavQzDgOFHWM+wPrWtgVlB7aXaSmqzPZA
         nVph/CnqRRbx7vBkN+sUkkcmgnjrp5u2ShTn3Cg9UdqBFgsH+oe/sWLH/VqfAwDSXwlZ
         yYc5Ei2OUMh+eCA6zC7EwFHimxecnw6evZgfI+QaJlgW0uvYzaXfGTwONagZyndsbQTs
         K5EG45HE1O+jtZMUtfprh67ewuugXW8KEfIuqbXsc4J7G+cfckGdytX8Lv1VL4GtNz63
         li1A==
X-Forwarded-Encrypted: i=1; AJvYcCUMJCrtu332aiVEcT02tkjEqm628OSo/BtwDgyGlTBuNT3i0UV14+VNphuBVo8nGAMM59hlKM4FZiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YysxYC+cKzc7eWk+CbAFqBGVaFvILiKHZ/pAALLRA/F87wF6Zz0
	JhM8ORNwXFEQFQflWnlDKwU4HwtoSWC6gulDCcRk8Zcj/CsvvymSVs/+SzKgk0P2zYLbpBogupE
	qnfvnX65MSdz055k0eFurI4CQJ45/MLRdAUGH8bmrtP0JedXBaATDGSmtr7I3+g==
X-Gm-Gg: AZuq6aIxXCaMN+KMQZibXRsRPzg7fa7ZPgXBMK7Efc87cdiYow0v4/K4HC4n8iFIeZi
	S+T/RLTUoZtNyIxvGqHjYOTk61bML3Bu4IQQla6ZD8sFvbN69IQC9PoEz08lnw9mMOJQlutAX1s
	yrUNG0DKNzpjdln4yNP5Cd0hRQAlhO+InhWr1kFtyth9TQYsmoTu6sjmiJ6E/veAzsZFK0MEHLE
	1nag+8kf3ejUA9QEH5FoAR6Wi3VrI8gLwb3aMW4gnMe/wl8hNb202T1cEETgPhR0sGyUhsdace2
	lKGTWgJ9FuGkZvAInXQ2q2IMvsERTnpRx+00AtFQcwQ1E2dqpPZ1WpmdR9hTVGPYCUsHJdFPtMi
	4evg6plP4o4MxTEgxSszRCq8RqBw5udL25E1rM9RSAgTvjNDBwyX0wKIG9vMu1bI4vHUSCtI=
X-Received: by 2002:a05:600c:1c1c:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-483739ff8damr256414535e9.7.1771340920683;
        Tue, 17 Feb 2026 07:08:40 -0800 (PST)
X-Received: by 2002:a05:600c:1c1c:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-483739ff8damr256413865e9.7.1771340920135;
        Tue, 17 Feb 2026 07:08:40 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837b64b08bsm102571985e9.6.2026.02.17.07.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:08:39 -0800 (PST)
Date: Tue, 17 Feb 2026 16:08:33 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shuah Khan <shuah@kernel.org>, Long Li <longli@microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, berrange@redhat.com, Sargun Dhillon <sargun@sargun.me>, 
	linux-doc@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v16 01/12] vsock: add netns to vsock core
Message-ID: <aZNNBc390y6V09qO@sgarzare-redhat>
References: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
 <20260121-vsock-vmtest-v16-1-2859a7512097@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260121-vsock-vmtest-v16-1-2859a7512097@meta.com>

Hi,

On Wed, Jan 21, 2026 at 02:11:41PM -0800, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>Add netns logic to vsock core. Additionally, modify transport hook
>prototypes to be used by later transport-specific patches (e.g.,
>*_seqpacket_allow()).
>
>Namespaces are supported primarily by changing socket lookup functions
>(e.g., vsock_find_connected_socket()) to take into account the socket
>namespace and the namespace mode before considering a candidate socket a
>"match".
>
>This patch also introduces the sysctl /proc/sys/net/vsock/ns_mode to
>report the mode and /proc/sys/net/vsock/child_ns_mode to set the mode
>for new namespaces.

talking about this new feature with Daan (in CC) we were discussing a 
possible change to `child_ns_mode`.

Currently, if two or more administrator processes in the same namespace 
set `child_ns_mode`, they compete. Obviously, after unshare()/clone(), 
the process can always access `ns_mode` to check if everything went well 
and eventually retry.

Daan suggested a more conservative approach, allowing `child_ns_mode` to 
be written only once (a bit like we did in the old version when the 
child could change the mode only once). This way, most users who want 
isolation write `local` in `child_ns_mode` at startup in the init_ns. At 
that point the user  and can be sure that no other process (including 
administrators, e.g., container managers) can change it, so all new 
namespaces will have `local` mode.

I think we should support this option in some way, because it seems to 
simplify the user space in most common cases (ensure isolation). I see 
few options for doing this:

1. Change the behavior of `child_ns_mode` to be written only once, but 
this would limit other possible use cases where `child_ns_mode` can be 
changed more than once (I don't know if Bobby had any in mind).

2. Add a new sysctl `child_ns_mode_lockin` (or something similar), which 
can only be written once with a mode (local or global). A write on this 
will also locks `child_ns_mode`, of course.

3. Add a new `local-locked` mode, reusing the same sysctl.


If we go for 1, maybe we can do it in 7.0, or not?

2 and 3, on the other hand, may have to wait until the next release.

What do you think? Any comments?

Thanks,
Stefano

