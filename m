Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4CA201258
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250978; cv=none; b=VLstjFnVoUBQHMPpYqCPS9XGXtbMCGg3cCipUpWHdji8ur5JKIUpmz7uOaC9QXn/dlDuqiag08hbnEqsFxNBt+q8Ra1Ct5x/27oyzAmyVPcmzyTRypJ/Qy2iWAA0CZhM6z6wCX2tcp3Mp83neJxqKgiihPe59JcrX24T/ulBioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250978; c=relaxed/simple;
	bh=MjnDskMjX8cG2gTKpro8itIwMnxgsfUdurZ3ZhmFgTA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dib6oItqIY3kP80SpCHjfGXtwd1TvpcyNn9hu8tD/rOidcuRgV9F25XwIORb1zquj8tra4ncLuRDYrrhCO5GBMgO1KDfqTKdTBYPnkRwuPXSdHfUHdDtZq2jiCkoFdq5Rz1ooWhnqUyjnBmNQ03+fqJ631aoTckx1d5uH8gRUz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fLZn0G+q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fLZn0G+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729250976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lX94VYYZhI1GNdILyGrNjIWxjBQHORxdJBShMvr6xl0=;
	b=fLZn0G+qEvlSGbCA2DHJYyXFjNGmG0uKn2JV+QxF/r+rMahtro0eHq+s3sgcp5btiFZZ3X
	cTQAJei5p7RTHAXr4bwQMYxEmXqBIIynW0ev1dPLcF3bZWe1O2SymCC9X5/0X8AFPoLYQP
	r9n2Nt9+BKlH6fZX2YhgAs1z4Q08sBg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-x5bcab2cMAiSA8gdoL4OMA-1; Fri, 18 Oct 2024 07:29:35 -0400
X-MC-Unique: x5bcab2cMAiSA8gdoL4OMA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d4854fa0eso1137465f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 04:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729250974; x=1729855774;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lX94VYYZhI1GNdILyGrNjIWxjBQHORxdJBShMvr6xl0=;
        b=uIS4ekCrl3GLKFubpw3cqPMxIwgWftBZY4R4boelgUgPPBU2oHhthgvE7SdbY+ZMjW
         WLiOr098CBQHiOuXh7vrZWJFGUGPKtxyZkETNyB4ndI3no3RyDH58JyxUoHQWrMr+E1J
         U4f6BmIFf7PNAWITvvgqvq5w8kNmDcmGJhBDVBJBwoktJRLrM8iDasctYciaZvkzX6nb
         Qk66qbmCvMIkXXow6OhK9X7kLv0TEoAdqzDUdo58mam8MSuqJkg+y3UmAd/we1yVNOSf
         aqzn4yhufGtvnxfRivgF5H+bbe1ZPJ6Jm98jQDAjWsRgRtwz0ImzRcMsKAo30KLHbYWe
         4Bvw==
X-Forwarded-Encrypted: i=1; AJvYcCWsGGmVp4Sw49xyoQThBKB5xFG+asgwXMEmkEAHP/4uJYzw0Py/d68giBsD/bGylV/2211s//gvDRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8ePfvSiXF7+nVoxqM11jYgiYPSMJAlTS4qyHZyG+qc7w10QC
	Iw7f85fFnunVPmc23lW/zmbkPJ4Tl8KWEg02BauAWrY72q0YKOkq8dJagpZCXvOiL6e0kFlV3vT
	RZFrBUqFZ5RXfosw+uFBwg9qJ0WxZHeaBjqAj9+9MpItVN1fRx8pj/DDm5A==
X-Received: by 2002:adf:fc86:0:b0:37d:3bad:a503 with SMTP id ffacd0b85a97d-37eb5c41d3emr1579070f8f.40.1729250973932;
        Fri, 18 Oct 2024 04:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxj+RvOltwYR6fUpBQ1sN/oQ7XL95/bAOzHFTi1ZdTbNwHM8snVRBHz14JHHkUGM4OhZdH6A==
X-Received: by 2002:adf:fc86:0:b0:37d:3bad:a503 with SMTP id ffacd0b85a97d-37eb5c41d3emr1579044f8f.40.1729250973469;
        Fri, 18 Oct 2024 04:29:33 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf088c63sm1694054f8f.58.2024.10.18.04.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 04:29:32 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id C221A160ACC7; Fri, 18 Oct 2024 13:29:30 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Simon Horman <horms@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Jussi Maki
 <joamaki@gmail.com>, Jay Vosburgh <jv@jvosburgh.net>, Andy Gospodarek
 <andy@greyhouse.net>, Jonathan Corbet <corbet@lwn.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Nikolay Aleksandrov
 <razor@blackwall.org>
Subject: Re: [PATCHv2 net-next 2/3] bonding: use correct return value
In-Reply-To: <20241018094139.GD1697@kernel.org>
References: <20241017020638.6905-1-liuhangbin@gmail.com>
 <20241017020638.6905-3-liuhangbin@gmail.com> <878qumzszs.fsf@toke.dk>
 <ZxGv2s4bl5VQV4g-@fedora> <20241018094139.GD1697@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 18 Oct 2024 13:29:30 +0200
Message-ID: <87o73hy7hh.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Simon Horman <horms@kernel.org> writes:

> On Fri, Oct 18, 2024 at 12:46:18AM +0000, Hangbin Liu wrote:
>> On Thu, Oct 17, 2024 at 04:47:19PM +0200, Toke H=C3=B8iland-J=C3=B8rgens=
en wrote:
>> > > diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/b=
ond_main.c
>> > > index f0f76b6ac8be..6887a867fe8b 100644
>> > > --- a/drivers/net/bonding/bond_main.c
>> > > +++ b/drivers/net/bonding/bond_main.c
>> > > @@ -5699,7 +5699,7 @@ static int bond_xdp_set(struct net_device *dev=
, struct bpf_prog *prog,
>> > >  		if (dev_xdp_prog_count(slave_dev) > 0) {
>> > >  			SLAVE_NL_ERR(dev, slave_dev, extack,
>> > >  				     "Slave has XDP program loaded, please unload before enslav=
ing");
>> > > -			err =3D -EOPNOTSUPP;
>> > > +			err =3D -EEXIST;
>> >=20
>> > Hmm, this has been UAPI since kernel 5.15, so can we really change it
>> > now? What's the purpose of changing it, anyway?
>>=20
>> I just think it should return EXIST when the error is "Slave has XDP pro=
gram
>> loaded". No special reason. If all others think we should not change it,=
 I
>> can drop this patch.
>
> Hi Toke,
>
> Could you add some colour to what extent user's might rely on this error =
code?
>
> Basically I think that if they do then we shouldn't change this.

Well, that's the trouble with UAPI, we don't really know. In libxdp and
xdp-tools we look at the return code to provide a nicer error message,
like:

https://github.com/xdp-project/xdp-tools/blob/master/lib/libxdp/libxdp.c#L6=
15

and as a signal to fall back to loading the programme without a dispatcher:

https://github.com/xdp-project/xdp-tools/blob/master/lib/libxdp/libxdp.c#L1=
824

Both of these cases would be unaffected (or even improved) by this
patch, so in that sense I don't have a concrete objection, just a
general "userspace may react to this". In other words, my concern is
more of a general "we don't know, so this seems risky". If any of you
have more information about how bonding XDP is generally used, that may
help get a better idea of this?

-Toke

