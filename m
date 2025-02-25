Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7AD23ED5F
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 03:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740453582; cv=none; b=Tr0hF8+N5/qZ3Kd6F1BHT93BNWWpTeltTt6FAFX6m8Um3/KC6pKLwyol2pzyFBL3l8s7rkpXgijGN5tmoKEJdZkFsppZckSrACdcCkERqwdysEWx0/sqY9vgeAwlONcfxf5TYEA5R9rfbbo0HkRHwqGCafb2sYqK3e5dJjYvFtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740453582; c=relaxed/simple;
	bh=KmqJ5UPyUn4QKWhlPOJYvXUy8SdtTAvRkRSjnFipiZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdOxvSOCSCJ4kI9FRNjHfmtG2J/6p41Y9cHvNzmGDVxdoLlI4F3EKXDW6h2hfuXDnSpdrR3smq0yUyrT+cCDsksluHpIFMYGeViG9W1FPuOv9KONux4gZ5rQJ5wY4x/feWJLY0eNlcjKLJ7vs6geMTaiF8TIbJ8EqfnC7/wqKcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=22496/5r; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="22496/5r"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22117c396baso61995ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 19:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740453580; x=1741058380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG0vPvDkU+Cn7gEuriL77ttwykS6l1lmqIssAkQWxSI=;
        b=22496/5rvjtyzQzH0W2UwpDmopdQIHamOSIGdKMwVApZn6ch4fQ7Rqj75B9/Hqax71
         +Yq2guFcmiIDCFM5gOL/3n3a1zsTYzeK2zX6xQogM7DHiRuZNXEehzGvBlbUsdu50CTm
         mftau51LHosFLeUs/pqIyOpgizpPQcu5lqGW/9z8WuaT2erles+9DpullQ/Hgrz0rJ+V
         96bXfVjA9CXMKyPmef9qdpDOu7gavaPAfTguaIdeencBnHK496j7byYM6Njsx5+OH3af
         sddMiBAr7k2QoAs0ifssP5UvX1ekfIShCO7e7H+rXm7Leq4pVOfkIkgnE3BbpINsvTMJ
         rZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740453580; x=1741058380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG0vPvDkU+Cn7gEuriL77ttwykS6l1lmqIssAkQWxSI=;
        b=uzkYoHAxlyH16ftex1u4Zksalo+eNB5gtg4RHBS9HV46NbXptRDgwlN4mxROJkYt2E
         u0SLquCIFLiTZjAnvtBcNNSWzhM6ETtm90UNzjkqHNfI0wI8ANzmDdz7EXAJjS7VLhjh
         c4F+mvXRimtiwwUk1UFAx3phyhRwY3UkWVbG1HJthgr6SfEC87CCqp74polKGQ1Z9iBv
         mbQ2bAUpyUIMZtj60IYNZVYGTLO/3n4eHkZzUDvI0JFIIUqBsmeP2w2gOb7PUF4BsIr6
         +vRLI/Ihf85NscjZHEkzgTuh63nt3isQnoF1cU0VGdcvL7EvUozXpowVFaDDkFz+6M4Q
         M8/A==
X-Forwarded-Encrypted: i=1; AJvYcCVfMptdNJKwerXFniUKs0aHQvBebRIewvqJuJEKChECTXO693+E0iTzsArjHLhF06CCqKs3SQ1A2hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCMK4A+4n7DjYq4B5MhPgjb/hHiAKxOZMtQnyEfYWe8P1LtvcB
	7KDw7A7DAex+pdOB7YvisuoJffSojr8UoHa0R8qVaWZ0gacEkhqbeUx4MVllpb1Nof4p8fUrIzt
	8/SqMMNyPxBdeLCW7AkIuX/gqzkHMEjxXz1fT
X-Gm-Gg: ASbGnctZZouVBmYLGUGKUYKxlKCVIBFDq3GNlaWKaenb52R5e2EKwmYm5zEH6F0FZmF
	fLrrEqFVuGy32naOSLZt3YvWSkjX5CdLvMxBgAuY1Cy4Da2Wbar4NAYtVSG5MsFjlfciApdY8yd
	rYb+lwdnE=
X-Google-Smtp-Source: AGHT+IEtZxuCVd0tnzxcUGZ4gQTicVs14GYdJr0CNhWdXPCDZapgO9XyLPZYzQJgLaG9UA9AQIHRIeLixV4juXWMkIc=
X-Received: by 2002:a17:902:db10:b0:21f:2306:e453 with SMTP id
 d9443c01a7336-22307a3d994mr1928995ad.7.1740453579681; Mon, 24 Feb 2025
 19:19:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250222191517.743530-1-almasrymina@google.com> <CAPpAL=xvVYmiekEkQZO314JczbNK3kf_2Sw=15crgjQLfzQU4w@mail.gmail.com>
In-Reply-To: <CAPpAL=xvVYmiekEkQZO314JczbNK3kf_2Sw=15crgjQLfzQU4w@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 24 Feb 2025 19:19:25 -0800
X-Gm-Features: AWEUYZkE739kPYOS1vvRcfM-p2BwFYz8vTlR5KcbwCGeAbQzIBCCJ-WS6P6ifgA
Message-ID: <CAHS8izNtGrMV+6T83-tNGpXsFqLo5N5jZpHueZ=SkDZ24pvKsw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/9] Device memory TCP TX
To: Lei Yang <leiyang@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jeroen de Borst <jeroendb@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Willem de Bruijn <willemb@google.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 6:54=E2=80=AFPM Lei Yang <leiyang@redhat.com> wrote=
:
>
> Hi Mina
>
> I'd like to test this series of patches because these changes are network=
-related. But there was some conflict when I tried to apply this feature. C=
ould you please help review it.
> The latest commit id which I tested is following:
> # git log
> commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6 (HEAD -> master, tag: v6.=
14-rc4, origin/master, origin/HEAD)
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Feb 23 12:32:57 2025 -0800
>
>     Linux 6.14-rc4
>
> About conflict content please review attachment.
>

Thanks Lei,

Did you just want me to review the code in the attached file to make
sure it looks good or was there a merge conflict with some repro steps
that you wanted me to look at? Or you do have a diff of the conflict
you want me to resolve?

The attached file in your email looks like an exact copy of my first
patch in the series,  "[PATCH net-next v5 1/9] net: add
get_netmem/put_netmem support", so it looks good to me.

--=20
Thanks,
Mina
