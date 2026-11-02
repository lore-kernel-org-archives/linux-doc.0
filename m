Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662687;
	b=OR5C3pFsZEENPt0io1EaZQkVlPeOvAYYKuSUgM1IBqRFdO8kh67lxeFbCZJkR4phTM13
	 jWRlS1iyY8hdA4ONi3hdqOAyJ6WHSFqIsuV+HD6FRnzSvzShtHqetj4lVD7l1iUVgUgWv
	 7CHjosfJo4eHEsyupz656t2DGdxrIFP3oh3CuoGSUTclaqcmP0GBymiV+EkONHsGvdyUJ
	 7QmT778b4PhJbrh4c0Wq1oFA5jVI0JZBARDIs6rAqnDRwQYdbHzgoeKzijyiBjn9BnIJ7
	 tdwkGCh9BEuSS0BKuRZpZ0Gb/da4mWHjbPI+T9t4Hm9dgnFr81rqIyME+vXjFxzpixQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
	b=IRxVJJGFOFjQvjphMZqCSq5CT+QtIDEgXkHfw8Y2uaXulFzMxiAYXZf+0QTNSHw/q4RM
	 /oclu/6dEmrghCAzYsUSN7A6Cx6Dv9O+iC4hFxHrvqhtby7BdgVcCCBGc7iIX1Jm2U/Q9
	 mTgmzWLaocw9KdE15AVl87IaZR+K31wGr2eLFGeq/YLt43Q9wBDcJQOmXfUUjzyJbev/1
	 C8QP7DwVRgWcmZOTkhNSlGJ7D/ZliMfqEqkM5YaxmqmJu725KpW10sr3G5BTJOTr0C1PI
	 PUYSO7S4NbRFHdLkUVQIyOEUF0y6h+w8vQhTPqmb3iv0n/vWbA9Ki4tNwGt6CgMzytQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwrWH4g5;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109E606A33B
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 23:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7109E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwrWH4g5
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so1676269eec.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 15:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662687; x=1794267487; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
        b=DwrWH4g5a2ySoC+GOC6eDg0PYRp7kGP9JqdiDDKQU+vGcurm0exab5wPwxJ0QyOwWT
         2Fy1qABOHcYH4XtCS9N93PB3f5mLk9h1CqWwZKRqQOE0783eu+1pjl+5aBSA8aIDUT5y
         kRsrGrXLGooT2yuPKu1NHWCBJ8t8DbWXvJHSr8qpg7OenSVvzNivb3UVHBsv8XUuzv3d
         EFEs/jZg5QvPXc78m9V/s4lPqx8NYIz1h4wQ2paI/UL85bH2HHR5x0gwnKVWe5NepVeM
         npoBHLbHCq2DQ4oqarJVcLy1iMxKK3M4BZkpFG4cdgyiRfVDfKbEiy4SLaa+Z8J1JNQU
         F6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662687; x=1794267487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
        b=qXv+8GxIyvAF2xcc6ZmwIF0OSh7K6Olk2ZzVq9i1WJbQXesCNsVjCqnS9r6QN7PyEE
         O7fZ3YVMMRvWyCHvjlPETt6Q0jh1XE2DiVQK8FxhAkyXUwFpdSfaBic2Ob7ZnIifIqZl
         j/9SAtGoQSh8Zni5XTDqLYm5UlnklUBerPISCuIhr/flS751dfFU4y4dmMzFF97hc2xE
         Jqjk7kKGsiGL30fqVrAsxuX+83+T8NDVrBlOO63AoXUeJ/so4W4/I2M3UQfb/t/hDBhd
         Y6RGvkALkQKFb48BtF49KdVIIbe4skYNslAfoHlvqc8boxO9ppk1bYTJoB3FZ3nDPP/7
         qNkg==
X-Forwarded-Encrypted: i=1; AKwUvBw2rWdq9b365IJiQ9LVlC/BKSu5AqISOwd2MHhEDMcMLbOzUCdpQlO8GRGW3DyKDxC1SDd2Ot6CNYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Y80Zswj7GH7lRXVXq3exNDMFNV1gAqDDIUxjiw9tsXFbPBZn
	HyE9iwUu63fwaCppBSNwgRce7spBDB+a7s62Hogjy2jox/4WXq1ScG15
X-Gm-Gg: AYBFou3FT8/JgyaK8t7X+/xBEp8jLvlFRJv6W3pRszax9d+XliPRHyfcIbWLajsQcwP
	t1iYtkUr3Puo9jfD/MdsTvg/osVcs7mewPVab5DDTixentegFCB3FB9j6nWMUrDpXwUtLYtSyWq
	wnoXluPH4ubxCFjNwmt37FSg+/Kh4IbFJ+Re4mzaL08xBnQVgTlPHGz9pRzQ8P7WG0CsO+qF/6E
	MElfbzwk9/al7TGPzvX+HYpInhIY0g3RPh03a7S+ZYq35fNUVtu1MpA+9KrS/ZHJro9LUNvzK5A
	/imi6NapX0CsJ0RwbGAD/4JuOyr4TzZdky3VBGHb5zM/OaLEaSg+U2wvGU/cj+eLqSrbh8QmwU3
	6vzBSsddmqOUrGWOuLqzGUEGmQzBwu4tJkphB5VDND4xptWdyHMezGQ4LiW0Gh4axkAaURjvaPw
	OfrCxo2IkwYxSfEGM4UktCL1G33fJE3Ljyqt442S25xsgj9ASwrH+Fp+8vtTZ7HcCVLvH3H5wjw
	GagYzNe9/PStupRzu6y9K1zVVTxesB+WcJYtboSgLV+ki7Z1a7gA2n2fbe6y5dInVHlH0c7RyLo
	pP7Hjdd6Kg+0PB2VoMMobg==
X-Received: by 2002:a05:7300:c7cb:b0:36a:214f:169e with SMTP id 5a478bee46e88-36a4238426cmr18543511eec.21.1793662686396;
        Mon, 02 Nov 2026 15:38:06 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca83sm1701518eec.0.2026.11.02.15.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:38:06 -0800 (PST)
Date: Mon, 2 Nov 2026 15:27:23 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 4/7] net: devmem: add a per-device netmem TX
 frag size limit
Message-ID: <aukb2qxV5Y0b3H0N@devvm16445.scu0.facebook.com>
References: <20261102191438.1059771-1-sdf@fomichev.me>
 <20261102191438.1059771-5-sdf@fomichev.me>
 <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>

On 11/02, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 11:14 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > Devmem TX frags are bounded only by the net_iov size, which is about
> > to grow up to 2MB, more than some devices can describe in a single TX
> > descriptor.
> >
> > Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> > frags to the limit of the device the binding is attached to.
> >
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> Abstractly LGTM but I'm not sure why this is TX-specific. Didn't we
> add non-PAGE_SIZE rx net-iovs? This should have been a problem then.
> Either you know what you're doing (maybe document in the commit
> message) or we need some more alignment on RX and TX.
> 
> TBH I was dissapointed when LLMs started reporting that
> binding->vdev/dev are treated very differently for RX and TX and I
> have to write a cleanup that consolidates this:
> 
> https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
> 
> I think maybe my reviews and yours maybe should be more mindful about
> keeping these memory things consolidated and as much as possible not
> RX/TX specific.

This patch is mostly a bandaid for bnxt which can't express sizes
longer than 2^16-1 in its tx descriptors. And rx is even more restricted
I think? Up to 32K HW GRO aggregated?
