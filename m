Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416482;
	b=1NdmJ6VPnb/2QvPMvrxQB1l/G/pegqLL9uOtiRklmkFA4cw5QvxlSEcWlqj9NKaP+kUQ
	 2jR3UMsaRauOZu05UwGlkiPtmsY1roNzXsYNn1HfCluORJjCMDqA+YmESeToj+8ztFGKH
	 1GEw2hoiN8eRp9MdL9goJfifpA9VnnabrCb1lqvtbGARJgkjqNFt+9696ynm0mdj5yg2L
	 EldLhyx7lOFg6gaSiOltDBYihVTAh49WLO13gapi8TBcTxiMa2eB8UaVyHVkoqoQNY0UY
	 h3QshRVvIK0bW3JWRBCCHIKUId7Esai1urTjAeLT8nmBdN53j/HeMJAZ6NatdaRLgMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
	b=dCuOOO+rXpScYcVJ3ycQZ+7OR24FHgNB1v4ylXzAArE0LBEL8MLMJzQz+4PN+XYxM8/B
	 x7Y6BQPEwdnJdzu0SJoAcj77i45XD5xTjPJ2ThYFD0hzKQ0e7p/kVkj8XESz07CQ5lC13
	 HEYTJTaQlwx/7ZTaQwpzG/gFAZ2mzYgrPOhBM2VjUdFHMBAJcdQbXsCUabMNAOANEeIYE
	 phezEkGAtKDBXHlHT5qoSCTadCRDd6AQk7THzS41bLiD9pLW2nRrgtiO+MwhgIDptxdVC
	 6q9JD2WTlOH6puTQDXAizSB2MyVlbsbhlnxYz7wW9hPTobtJVvobDZNi1M+RkoxFqdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV24wG6k;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64918606A324
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 17:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64918606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV24wG6k
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-99bf7b97f12so26338241.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416481; x=1795021281; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
        b=eV24wG6kUDKl/1BRzugsFu4O6Q8IMvuBMVX/hw3IwA8m/Qdq9KxFfGNdIwU/1eK/S/
         ryB9W0aiepskzNkxFtuLuS1B8mDbwU0HwpPUMSHmC1vGEAs3AcwgrIuW2dj/HE+iOpfC
         c2D/uE7ouHDAkBbJKtQh2hwdmG3Kxw5BCw6dYMAOxlPArZVX8CZnIRFqD41fzK06ZI1q
         GThZ1b4wU1om1c6zeGKhdtmLDrJKAvlzi1ckauC5O0yIfDFOTVBPJyXqT0g4guj/7j90
         CH18VtYry2bKaO8SsBtHxaYYhBDJn51m9CKVYwR7LJa5RW9yCa7mGQnRL7KBGekkvjZ2
         vXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416481; x=1795021281;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
        b=nH9AasXwL2N8rZWWhxrMDpv2WyDEjSaPXrc+jmEP4PhDlcUJ2JjSw+enZMOOJhdlg2
         vRld4DqqnD3LvhfydmFjKECtK1H95OTDduHOSjp4DKsLr7T9yEOJTeo7BNtNFC5KJXA8
         SEsy/6GtmoztcJWxA07Dci9xD6PDRPXgi6oU2SVfOJnlNUgg0bvmjVLHgWMIIl8AoEP2
         JYHPObsxDabm440UHyNp3lQz6QWLrbYMlWvvvn4cKWT9+yZ7TfNDcYJ/J1W2pN0QoR7Q
         hN1a6BV7O3NU2Vz7uanrw4cZhlydUlHsZa28u1DFYW1/E2NAsA2N7Rv9B9Z+rPTucOnD
         YS+A==
X-Forwarded-Encrypted: i=1; AL+hErEAvOtyQoMbB/OvpZWcblRIfBYZS75ir332t2eoI3KOZFrdD4AnOxveYwvJvGg9V31+zDrxLfEBDK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/yNi1ndE3zTNwv07gI8emvb2032K5jpZhMQmqAuG9zMeom5zz
	pO/2I6fAdVEZJc4ejTAW+NRyNMu1UWSz4IylkLkNPrUPLSNDdAWzhruD
X-Gm-Gg: AYBFou0ADWz0exl5MtDuNkGdR59v8i1tNCj6VU/zuvznYw72+QpZpFtNbzoDbGPBg8z
	lY3qKU1wCs62+LNLiu8w8WCJjka3tMK5TD263HOZmWkCko8+EfmHnnmgF++n0s8Owqg734fDl+v
	D7SIX4/THoAHok/Gu+SL0BEJcSlln9tfYDTq0+SmR7iy43fZVK35OieH057wZzDufMqzCJaOWzk
	6SXvLBn46COECH9EJ/WRoAlAY6BBo8z1xqFH7zfiWf2/grCs+jV7j1ggCFHuKTG7R6atYMgOREW
	sg14MMnL78yYQiOhDBT2y4BnOTFPn6fHqDTl5zoL4/JQyD31TFeaoR2ujCrbp34SEg3fGls2OuX
	kvSz9WIINCpSE6kXAdUUZVxWpGni0D8EQelgW9nHjZFbrAj/kUnRJb7ROd0e2/4fvFVqWKnOclv
	XQw/z4fAXBrfmTaJUeMKHoaLZRB5blMVUcsnR36jtPnR8KDQRdOcA7DuDom2XdupNp7ecLgOiok
	o8LoHWfijRv34sLlyfO+ynsPCdY2FTvpKcskIYo5fCIL2q9Yc6GYWDjHzcx2a8xGaBsNGjIKBBA
	WmHur0lRSAT9jg7T
X-Received: by 2002:a05:6102:a4d:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d6316c856dmr19138137.14.1794416481052;
        Wed, 11 Nov 2026 09:01:21 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::6:868a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302239188sm4078178137.2.2026.11.11.09.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 09:01:20 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 12:01:19 -0500
Message-Id: <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Donald
 Hunter" <donald.hunter@gmail.com>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Jamal Hadi Salim" <jhs@mojatatu.com>,
 "Jiri Pirko" <jiri@resnulli.us>, "John Fastabend"
 <john.fastabend@gmail.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Paolo Abeni" <pabeni@redhat.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Simon Horman" <horms@kernel.org>, "Tariq Toukan" <tariqt@nvidia.com>, "Wei
 Wang" <weiwan@google.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less
 associations
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111005533.6436-1-toddfreed@meta.com>
In-Reply-To: <20261111005533.6436-1-toddfreed@meta.com>

On Tue Nov 10, 2026 at 7:55 PM EST, Todd Freed wrote:
> psp associations today are bound to a tcp socket when created. traffic
> on that socket is encapsulated in transport-mode psp, and encrypted.
>

You can start sentences with capital letters in cover letters and commit
messages.

> this series adds associations which aren't bound to a socket, which
> allows psp encapsulation and encryption to be applied to forwarded
> traffic. you can use this to transparently apply psp tunnels to flows,
> with help from userspace to manage the tc rules and orchestrate key
> exchange.
>
> the lifecycle of socket-less associations is managed over the psp
> netlink family. socket-less associations are stored in a small registry,
> and are addressable by id. the registry does not contain socket
> associations.
>
> socket-less associations are on the device's association lists, like
> socket associations. rx ones are therefore marked stale by key rotation
> in the same way. in this series, nothing acts on socket-less rx
> associations on key rotation. instead, userspace should replace decap
> rules for a SPI before its device key has been rotated twice. a
> follow-up will bring enforcement.
>
> series structure,
>
> 1, 2/ prepares psp to work with non-tcp packets
>
> 3, 4/ adds the netlink commands for managing socket-less associations
>
> 5/ adds a METADATA_PSP dst which carries the socket-less psp association
> on an skb for tx, and the transmit checks for it
>
> 6, 7/ keep mirred and bpf from sending decrypted skbs from egress to
> ingress, since skb->decrypted depends on direction
>
> 8/ limit time-wait psp socket validator to sockets actually in
> time-wait. the new psp actions check for presence of the validator
>
> 9/ adds the act_psp tc actions, psp encap and psp decap. in software,
> encap is egress only.=20
>
> 10/ adds flower matches on psp header fields, for rx matching
>
> 11, 12/ add drv-net tests (netdevsim and hardware)
>
> 13/ makes tc-testing run dependsOn probes outside the test namespace,
> where they currently always fail
>
> 14/ adds tc-testing tests
>
> 15/ Documentation for socket-less psp associations
>

Some of these can probably stand alone like the bpf decrypted, psp encap
helper, and timewait validation, and be submitted first to shorten the
series. That's just a suggestion though. If there are dependencies on
the main series you can ignore.
