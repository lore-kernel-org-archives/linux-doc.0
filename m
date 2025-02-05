Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F86155335
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785155; cv=none; b=BhVEjY8r/g82aenxwnUKAKP2Z2iRaNw8HMBVLDz4vX5ecWhto2nxYPwsX1+OcRS1vWXfTs+n5bQh1YWEYsQZrBKJNpZI8cjkS2NS0TJFyfq7WGrE2CPEzeNoKGc2wMZHe/EuCn5511/befOgfXOYexai4bEhQpb5mzdO3Hel2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785155; c=relaxed/simple;
	bh=ylXsVJQ4SkSRoIxit5Ty1D4Df/HyuC5GpDfK6nUoWVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZhymE4O/r/FJS/3uTwvRlpVarOLkJaPgtg0ROquB28ykaLYMwxAQZJhJcvi6R8cBx4xVjCMplRolhiwZnssKF8hawq+XvBLVp/K3x9SHVfz3UJPD+JyuvvmKk5do9+hAtK5CTPD1/itjBf7bwMw43KUwZn49Q6hREOY+8f0jkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UpB1XR5E; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UpB1XR5E"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f032484d4so26675ad.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2025 11:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738785153; x=1739389953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWWB+QEPZ+Au3FNEZ2YpDzx0U4CEf7uGyoSwdOXplO8=;
        b=UpB1XR5EmxINE2f/mfWjDipOftmw7hO5LdxoEeNMTw09zC+JiN0JAUo+m51ldCY1AE
         rRAPP09/qVH2y7LQJkisZkV1Im452uVrI6JIIyhu6BPH0yhKL2yA9XeVLeVMBItPgx7a
         2u7Ehtm4ZlT6SxeENivcsRN6lbjl3QzdKL2/ZEA6giQUw6Z8GW5G7MhzsTxtaqufIF+o
         77h9IZTipLicVd4gcARjzVJhTS4DToxwD6d2Te8Z1wvYkXbB6h7qjHKD/2cL/JMp3cE4
         bEDDToDfLnyG4PQhOPxS+9p7f9W+Ba3QFiYisKC9iktLLMfBP1miIKmZ2QAd2a73k2ya
         JnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785153; x=1739389953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWWB+QEPZ+Au3FNEZ2YpDzx0U4CEf7uGyoSwdOXplO8=;
        b=bHPwGAUPw4sKdvdj0G6hEgaWb7FDBC+QBY4MtPapetokXTUPqhFmAeODXiUfOUUaKt
         fYVyhFUaM8m5Ib2tbmm51k/Dr5ojdLzSdT0IcIC/GxWWkZi1v+XB6p8B47QB37agCosa
         O6cufi6H9Y9lJgiGVGkeN7t3hh3GhRSYovYVZot07seDF8qb2XWHirwhdViMndBq31yn
         zHEpNjy/nvHBtqdparzC1GMkhS9TKaM1LlKEK04/ED0aa1gEy93nV/sKlXS3+nUdhZAt
         QwJAopw3yWOqacgk0dbHnHtMyOlVlT31bZPi2aYStoCUd/UX5NUfOeQpJR/kfvzSPQIJ
         fI+g==
X-Forwarded-Encrypted: i=1; AJvYcCUXZBvpkvYjXxgtD+LZJNE19SESsTh5CvtNILMGG/vJNT//pfqgXKB923vs+Ubh6ABFdgB1R1Ulbiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNRbYx6HpBt56SRnewtA5zTVfPWPcmV9jMEEj6lei/bh1KN34R
	gj7sfKtRY7zQ5e/LbPiOkcXoepiV4UjSRQoQPYDpgTzY6M4a/KGS0HviImveFMW86zO0mJ8Ps+L
	1tr8vB47li0H5NUsnoCGs5eAqgO4iWYWZdjLI
X-Gm-Gg: ASbGncszTl6ANLSS8FXStA3dzeO/Zvtqu0vmg+K3m75VBUd7XkpBMxITrBfxQCRZvxU
	0HL0R220PL4dFL1qI5QIKyW2mqycZ3fdx1AlXBm1hUUV5HKZth4fCC/4xDTPFucZ0RyhZaPD4
X-Google-Smtp-Source: AGHT+IHSXvK084oC3z+1fgrASub/JYpZd/AoLG9lE82EQY5MiiDttWHzSDZOOWYo0x2zVfAmQP+VclfQEe9+CUjMAGc=
X-Received: by 2002:a17:902:f64c:b0:21c:e29:b20d with SMTP id
 d9443c01a7336-21f311d088bmr191825ad.3.1738785153331; Wed, 05 Feb 2025
 11:52:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com> <20250204180833.48cb40cb@kernel.org>
In-Reply-To: <20250204180833.48cb40cb@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 5 Feb 2025 11:52:20 -0800
X-Gm-Features: AWEUYZndLUQ3-Ja5MRaU3KyullgQr0rdTygpMSUSH9To-Lupoe-x8bvGN-ZuNjE
Message-ID: <CAHS8izNxi+Dc6mXPNaQSjtmz5YzmeA-Sn8JdMWLpYRomJdCWMA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] Device memory TCP TX
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:08=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon,  3 Feb 2025 22:39:10 +0000 Mina Almasry wrote:
> > v3: https://patchwork.kernel.org/project/netdevbpf/list/?series=3D92940=
1&state=3D*
> > =3D=3D=3D
> >
> > RFC v2: https://patchwork.kernel.org/project/netdevbpf/list/?series=3D9=
20056&state=3D*
>
> nit: lore links are better
>

Will do.

> please stick to RFC until a driver implementation is ready and
> included

For the RX path proposals I kept the driver implementation out of the
series and linked to it in the cover letter. Just to confirm, is that
OK for this series as well?

--=20
Thanks,
Mina
