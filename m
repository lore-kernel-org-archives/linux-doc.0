Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E1113D636
	for <linux-doc@vger.kernel.org>; Sat,  1 Jun 2024 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717231595; cv=none; b=sCtSEurRjhlFXFUT+OOPmEg4iI5m/ocPEUJv/FEEvaxRtIb6ARuh86TKM4FOoCXiMUsSFuaCLk2GgFNvQ+zN02uulCMOy/iFzodgkyA/nSxDNtFn/WW4s7oZAOlfq2Wc15pWYhWvtouTTOati9EzwKllmPmYVMo9f/P6A0WB7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717231595; c=relaxed/simple;
	bh=n39P43ilSKNrAL3vLU0xZC6c1odihG0/bwgLoJaJ2iY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2nsXx8LjNjLjDZHtCCGij2yCW/81OXMxbDnIVJrR/GgeaYDHJKO0X7+V/+3qpS9wGxV2uSsCeKi5PvvGFA1Ml3o3CcrRpnoOMVTEptllkiuBuoEhnVBrnoZMbnOAM8hb38bZakTFcSPVhQWEIZjht/6q60CMCJIJeQGyDCszmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BTrfWa2q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BTrfWa2q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42133fbe137so26345e9.0
        for <linux-doc@vger.kernel.org>; Sat, 01 Jun 2024 01:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717231591; x=1717836391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkCBwJFH3FQQjhEGVUSmMAPZxzATBED22vdUBPssCpo=;
        b=BTrfWa2qXiEnnSTagMvpJxdLxWXertmX+lgnjbPkpRdI1VJFf9zRpawk6NFhtcIXGV
         CzsLA/9nSccUt4UbktXZrhhyiNI8dHVA7O/HQiHIKKMl9ipKE5ujNCl6bWW+VoEi1np4
         HzaFoMgwgKHMbY4B4wYZsGIATcNFkBYuIHLkZi5CRskRudExzGqiw1hJRRNzhFfnSViV
         1xdi2H76l8jBBF+fN2r2tBlcOE/Qu7Vv3pxwbEGnRjB57OeUSTXwuDmzwLHRR+lyuYGr
         Ypbre2YEWeENeHXw0RQMuGmXl/7QyWHGB9QXf75l4wuP5TTEh8ohXNrwn/fLv8yqCQta
         yJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717231591; x=1717836391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkCBwJFH3FQQjhEGVUSmMAPZxzATBED22vdUBPssCpo=;
        b=IbnmealOF9rys/BoTykJvkhKf4xoZbFs4snmUu2uPVbabydh+K1vY/NIyUYMr0FVC3
         UHfrmQC+/jxGPwXxhAfXwIlp4/Gn3d/8qlhcW/4J3U3L7eZOSUmbT1dJNWhoAT0+1/w7
         xgrBZlLqc5l20RraHPvH4dohYbQtMI1AyHcqOCx+byTtohPLAJqfYFzczwyOkHVC1jtN
         nMQqi34NLT/EFV4PW37gnN2TJjFPweyisg7lwIduf21+EMOJZiy5A5pKCviKG6pa4+Gf
         uuU6azrX+Q2+JBQP0Xy/CHC+r+BM/UvLOTpsMir1P5Pd6kzU08vi8cPCSLumSFy1o5mY
         hejQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX9Xm24ZGYyqh4ooJw5ltTf0ijI2Puyy8faxgu/oHnbRk/LZlKM8tIHOUpBWNkohosbA0qeWXdBu8/P6kMLpDO15YnPivjz5bE
X-Gm-Message-State: AOJu0YxglgKcuHwfi2XITeJJRzBhSE1QJOMCaJToQA+oq84637s334nj
	lXMsDvZLldIVawUzADpYW7JJQrDwsQm7krkAbIFI5vlf2mjhlW0/JpU54HOeOzVf/WVcG721LvZ
	9kNlc0VL0Yrxf1Z9FqcsVCW7IyF59dAJFe8cH
X-Google-Smtp-Source: AGHT+IGqcSxJEUtmpYkzXz1v9dsUIixWDloYhRg4yMzs1O1FPjmhoX1qHONtxeNkzCEYdabvfw1JGy2vc4W7BCuX++8=
X-Received: by 2002:a05:600c:19c8:b0:41f:9dd0:7169 with SMTP id
 5b1f17b1804b1-42134ed2115mr1168505e9.2.1717231591043; Sat, 01 Jun 2024
 01:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529111844.13330-1-petrm@nvidia.com> <20240529111844.13330-3-petrm@nvidia.com>
In-Reply-To: <20240529111844.13330-3-petrm@nvidia.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 1 Jun 2024 10:46:16 +0200
Message-ID: <CANn89iL8P68pHvCKy242Z6ggWsceK4_TWMr7OakS3guRok=_gw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/4] net: ipv4: Add a sysctl to set multipath
 hash seed
To: Petr Machata <petrm@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Ido Schimmel <idosch@nvidia.com>, David Ahern <dsahern@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 1:21=E2=80=AFPM Petr Machata <petrm@nvidia.com> wro=
te:
>
> When calculating hashes for the purpose of multipath forwarding, both IPv=
4
> and IPv6 code currently fall back on flow_hash_from_keys(). That uses a
> randomly-generated seed. That's a fine choice by default, but unfortunate=
ly
> some deployments may need a tighter control over the seed used.
>
> In this patch, make the seed configurable by adding a new sysctl key,
> net.ipv4.fib_multipath_hash_seed to control the seed. This seed is used
> specifically for multipath forwarding and not for the other concerns that
> flow_hash_from_keys() is used for, such as queue selection. Expose the kn=
ob
> as sysctl because other such settings, such as headers to hash, are also
> handled that way. Like those, the multipath hash seed is a per-netns
> variable.
>
> Despite being placed in the net.ipv4 namespace, the multipath seed sysctl
> is used for both IPv4 and IPv6, similarly to e.g. a number of TCP
> variables.
>
...

> +       rtnl_lock();
> +       old =3D rcu_replace_pointer_rtnl(net->ipv4.sysctl_fib_multipath_h=
ash_seed,
> +                                      mphs);
> +       rtnl_unlock();
> +

In case you keep RCU for the next version, please do not use rtnl_lock() he=
re.

A simple xchg() will work just fine.

old =3D xchg((__force struct struct sysctl_fib_multipath_hash_seed
**)&net->ipv4.sysctl_fib_multipath_hash_seed,
                 mphs);
