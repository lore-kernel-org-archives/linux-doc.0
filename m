Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415799;
	b=zEZhqIwrkWgempCGtyv3DdhoCl9kcJn2/OgwqcKoviKWdPBYoeb+DI/0NuMjtWttOPWc
	 ksfaWpUFAm/TyOLmSkqgHA8lCNru1uFf0LH94GpRl0xBI1rVPFpHGGYXAz4fjUffVmiSf
	 P6d3lKXvC5jq2ytoXikJ6KYBwaZ7B6CHXmWGS9kgqfOUv5vezk5XefGBKNCMlQVo/De3Q
	 BjW/yZ6lGU3QOkWwgibnPSzRRNR0c6gOBqWfVyO+63X3NbBXeYtus44jW4W9PYcF7LnDK
	 zJ7k2Ch5C7HvW+nehu7WZdHIAHJpfUREhR9AMdkO5/YiQ2/eo2p47y4j+BhTA5aWdRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=rFud020d6ZqbAIZTEaEuXG8erb5QVVdBjItcD5kJ9qU=;
	b=KxR22TrmfoDdcDbsM6G9gW4y036TJQ3felNPPXN2UWVYLZ1LVRRt4y0x6NThqn9JukJN
	 mS3mkIK2VUA+GeT/ISrJwqRb2rU4jJGuLqs4uEvnyWP9Z2hfsvEqJzlvW2/kB5Qu7/1D2
	 +RCBI+3zbM79LkjjpQ0Knb1hqTeMDWVBLChPgLcl+ZisnL2zJSUDYaooUtgVzVH4GPZR8
	 6YYIkjJrlne9rN0Yf3MKLifx9y1XSn8eyGiG2pexuqJl84cXA86cYaB0l19dhSDnXQRih
	 caj6WVD+JEaW+bREFsrIvEP9m93pDQbpVdqdbWt5TXRuMirkvMpM3yJ07BskK1DjRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJL1TZqY;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34C606A337
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F34C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJL1TZqY
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91e8938fd01so37101656d6.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415798; x=1795020598; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rFud020d6ZqbAIZTEaEuXG8erb5QVVdBjItcD5kJ9qU=;
        b=HJL1TZqY3pycAyt7sUA767m90KqajI8zY0xT1ZfuAA/QfImIGgMx+vAqH5Imyi/a6+
         aMEZPSuWC0VKrlzb13m1Nrwk3QQ1wPZefNNmLRBLCtq5cxDePjkDtwTpye0fVTiEcWB6
         aQ5mmiFm7UHTtv3f/HgmSB/WAizRAoppvvJqsmn96SgIn97pqx1oC1BFwsrGLw8pgc3I
         Zt2pBuE1m63/KLFVCv993l8Nq/ZcD/Q9G+j++A6DU9uB42JKnPgnXP5fvqJ5tv1540yF
         pMvXIlsts3LByVlAX0I2AnxgbnLfwxfrlIL0MQSTx9vfi1sV4y8WMcWGj2UrnyRyZjKB
         Frcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415798; x=1795020598;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFud020d6ZqbAIZTEaEuXG8erb5QVVdBjItcD5kJ9qU=;
        b=s5RG+pg1I0A8UGDSCJzNN8c9+pEYAUqKHt0Yz9gY+B0rJn/64Qq2goQqZaCDu6sAUA
         o0zoXtNzV3l/K/zrhdWaZnmUEbQqE73HVK4TGf1ttXXSGZg54LwpVRMx0SZR9MHRo2AS
         gVzEFHYWwkuvTNyIRiyoGsHqoBTJN5QYBHKBSVkKbPSF+tY8kB+gblbdggk13vP4P6Mp
         u851qOqr9JGAS6wlLbHxlt4QX+8b2zSdbHh7Qnxy5oBVFzaa6zmqg90VTJufGymPknTZ
         9/SDWQ+ekNtgH5FvJ3XxnJNPT1SLDlj1mmUZ2Bjq5uXatJcUmKBMVO4WMWnBYHFzsxTL
         +jyw==
X-Forwarded-Encrypted: i=1; AL+hErGK1A0eiZVStdW0l/Cdgb1AhZ8B8Z7Hz4rnRLdjXQ2hktrylIIWzbn3UjnWkYoPL7PPJq1l+CjeoHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XuDk+lPp4JCb/4QjKoe1HM/C6VhtRo24to1E49You9rpaReIJ
	79r2EE42ugmCSPE9B8/K79or6edp8CQRzyMHyA2iddHihrze64kSD6Vk
X-Gm-Gg: AYBFou0KH6GYmrh7E0IQ6/FFSF9TNeTlsEy5iU/WsA+rWbUbxS6poHmyCMSm58DUnJ3
	7lSjNsmDcmWiazyjcLeBeJ3jLyZM5ZwGtYnm37pTqtToDOnny+upm0Z7AwLUBUpS8S3v6ATqPBD
	IpRmSZDqnlfeD8keK+tp7AYRaydkaQOjTLQd4DkNU4JdxXxMtwT1TznfFzBH/cC6uR1ks1B+mHX
	JLYxyd+6hlPJ+xHSMzOR3PboJCFv5mXUacF/znq5unl68x08p/+jhpDNJ52Ngs8QDl3alxcJ0Yw
	UDpbGJoHAZ/9JKLhnsGBQ/gj/gljcGyCQXhx6nFvgJFrzOOHxxoOxxwQ21isQXCLLwbPnSp18+g
	BHNQAVvn9L4I/mYLaF4dwkojpkr04P0wDPeAIscwu1L9KOIUWTv6z8W62B7WDsiGaknvVAVOkOl
	QfTrjWK7nU1E0JlN38wgeF1N3/sCD0rriCpjp6PVe+BEqGCOgmH0ve68jw9m2wDRsG4D5rooVpi
	D0jrOShAV+7RRPtQlE+uUoOOTdGl/ncguRGqJ8tG+O7xWt9hIT75RoO17HsJtMt48Iun7mEhE8V
	NzgAqvddDFESoAmC
X-Received: by 2002:a05:6214:398d:b0:91e:aa6d:d408 with SMTP id 6a1803df08f44-91f03e88ff2mr51627976d6.7.1794415797982;
        Wed, 11 Nov 2026 08:49:57 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::6:868a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04ab626sm51981516d6.15.2026.11.11.08.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:49:57 -0800 (PST)
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
Date: Wed, 11 Nov 2026 11:49:56 -0500
Message-Id: <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
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
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp
 associations
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111005533.6436-1-toddfreed@meta.com>
 <20261111005533.6436-5-toddfreed@meta.com>
In-Reply-To: <20261111005533.6436-5-toddfreed@meta.com>

On Tue Nov 10, 2026 at 7:55 PM EST, Todd Freed wrote:
> currently, a psp association is bound to a tcp socket when it is
> created, and can hold both an rx and a tx key.
>
> add a small registry of un-bound associations. These have either an rx
> or tx flavor, and are referenced by an id. other parts of the stack can
> then attach them to packets. see the subsequent patches, where the tc
> psp action does just this.
>
> an rx association records the spi, version, and device key generation,
> primarily for describe (assoc-get). a tc filter matches these fields
> with the flower keys psp_spi, psp_ver, and psp_dev instead of
> referencing the association by id, to facilitate hw offload. these
> matches are added in a subsequent patch.
>
> adds the following new netlink commands for managing these associations.
> note, these are admin-only and restricted to the netns of the psp device
>
>   rx-spi-alloc  allocate an rx spi + derived key, and publish an rx
>                 association for it, returns its id. the key is
>                 delivered to the peer out of band
>   assoc-add     create a tx association and install a tx key, returns
>                 its id
>   assoc-del     drop the registry's reference to an association
>   assoc-get     get / dump associations ; only the spi is reported
>
> assoc-get and assoc-del operate on both rx and tx associations.
>
> socket associations do not go into the registry, and these apis do not
> address them. so for example, assoc-get does not list them.
>
> socket-less associations are on the device's association lists, like
> socket associations. they are therefore marked stale by key rotation in
> the same way, except tx ones: they hold the peer's key, which the
> rotation of the device key doesn't affect. assoc-get reports it
> (stale), so that user space can identify such entries.
>
> key material enters through netlink and is never reported back. no key
> is stored for rx associations, and users reference associations by id
> and never handle keys
>
> published associations are dropped from the registry when their psp
> device is unregistered.
>

I think the design could be improved by not reusing struct psp_assoc for
the socketless rx spi accounting, and by not placing the socketless tx
assoc on the active, prev, and stale lists next to the socket
associations. I'll try to comment inline to give you a better idea of
what I'm talking about.

In general, what I'd like to minimize is having one object used for
three different things, where each usecase has its own subset of fields
active, and then having a bunch of glue in places like
psp_assocs_key_rotated(), where you have to check if the assoc is
socketless, followed by if it is tx or rx.

[...]

> +int psp_nl_rx_spi_alloc_doit(struct sk_buff *skb, struct genl_info *info=
)
> +{
> +	struct psp_dev *psd =3D info->user_ptr[0];
> +	struct psp_key_parsed key;
> +	struct psp_assoc *pas;
> +	struct sk_buff *rsp;
> +	u32 version;
> +	int err;
> +
> +	if (GENL_REQ_ATTR_CHECK(info, PSP_A_ASSOC_VERSION))
> +		return -EINVAL;
> +
> +	version =3D nla_get_u32(info->attrs[PSP_A_ASSOC_VERSION]);
> +	if (!(psd->caps->versions & (1 << version))) {
> +		NL_SET_BAD_ATTR(info->extack, info->attrs[PSP_A_ASSOC_VERSION]);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	rsp =3D psp_nl_reply_new(info);
> +	if (!rsp)
> +		return -ENOMEM;
> +
> +	err =3D psd->ops->rx_spi_alloc(psd, version, &key, info->extack);
> +	if (err)
> +		goto err_free_rsp;
> +
> +	pas =3D psp_assoc_create(psd);

I'm not sure the kernel actually needs any bookkeeping at all for these
generic rx spi allocations. You could probably just pass the spi, dev
id, key, and probably rotation count (as a device key generation of
sorts) to the user without creating a kernel object. For socket
psp_assocs, the rx state is consulted on the datapath before queueing to
the socket. For tx state in all psp_assocs, there is the possibility
that an SADB handle needs to be cleaned up. Neither of those apply here
or in the rest of the series as I understand it.

I figure the tc ingress rule can just take the spi and dev id by value
rather than needing a reference to an object that we create here.

> +	if (!pas) {
> +		err =3D -ENOMEM;
> +		goto err_free_rsp;
> +	}
> +	pas->version =3D version;
> +	pas->rx.spi =3D key.spi;
> +
> +	err =3D psp_assoc_publish(pas);
> +	if (err)
> +		goto err_put_pas;
> +
> +	if (nla_put_u32(rsp, PSP_A_ASSOC_ID, pas->id) ||
> +	    nla_put_u32(rsp, PSP_A_ASSOC_DEV_ID, psd->id) ||
> +	    psp_nl_put_key(rsp, PSP_A_ASSOC_RX_KEY, version, &key)) {
> +		psp_assoc_unpublish(pas);
> +		err =3D -EMSGSIZE;
> +		goto err_put_pas;
> +	}
> +
> +	psp_assoc_put(pas);
> +	memzero_explicit(&key, sizeof(key));
> +
> +	return psp_nl_reply_send(rsp, info);
> +
> +err_put_pas:
> +	psp_assoc_put(pas);
> +err_free_rsp:
> +	memzero_explicit(&key, sizeof(key));
> +	nlmsg_free(rsp);
> +	return err;
> +}
> +

[...]

> @@ -310,7 +311,13 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
>  	 * be able to Rx any traffic.
>  	 */
>  	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
> -		pas->generation |=3D ~PSP_GEN_VALID_MASK;
> +		/* A socket-less Tx association holds the peer's key, which
> +		 * the rotation of the device key doesn't affect
> +		 */
> +		if (pas->id && psp_assoc_is_tx(pas))
> +			continue;
> +		WRITE_ONCE(pas->generation,
> +			   pas->generation | ~PSP_GEN_VALID_MASK);
>  		psd->stats.stales++;
>  	}
>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);

I would create a separate list for the socketless tx assocs, so that
SADB handles can be flushed on psp_dev_unregister(). Then you can just
leave this function untouched, because invalidating the generation is
only for __psp_sk_rx_policy_check(), which isn't used by the socketless
rx assocs.
