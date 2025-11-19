Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78123F429
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 01:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763517268; cv=none; b=CIUslxl/loc198oohZOesp/ZoUOplS2ia1NpzctFCKkwg4HSe+MPqr7orvTH7foqkO+uSx6np1dMVbcOZM0ef7SntfvyjL6lzIcRyUnGJHzEfE2NSRbw9xcYcL2JwRfj+y7ikdT8Wg0dLuNG19hQwQ9R0jP5nHaLdSUPPr2yWzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763517268; c=relaxed/simple;
	bh=Ti4if+e0vZ3+Heb4vsKFgYIQ8JY3byZZQGyu2jg9Z6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoqaGrkYA+5q0/lJtuEv0FwskfXXp069AfAZrdzG9yJi2GVYrj5UaXFGaOSqx7ZFCcu9bOSWulsdfMGQAytJkNtog7e0b9jrpb93kcEfDtqpnqU+1R/TqYC3txBcOopeQN3qSC59UouFJGMAxrME5zpIyP8sHhDLli8njBXRZUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WT4zwZbD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MASS4D1t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WT4zwZbD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MASS4D1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763517266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ti4if+e0vZ3+Heb4vsKFgYIQ8JY3byZZQGyu2jg9Z6A=;
	b=WT4zwZbDi8b0EzXjVRVj8WPvPn7X2SsvNCB1G+KEQx/kW35zx50f6lI48IvBXSmVZ3SXIU
	X6bupue5LMl67B7aXsy7cYs/CvoWFzSFmYlcq5on5S5I+/IEddO+17R5Po4S+mdUnedVTL
	mCPlusLg3irDOX3HeZK5ifqiwC1mHmQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-vYhsZRBjNY2f4ZrGgVQt5g-1; Tue, 18 Nov 2025 20:54:23 -0500
X-MC-Unique: vYhsZRBjNY2f4ZrGgVQt5g-1
X-Mimecast-MFC-AGG-ID: vYhsZRBjNY2f4ZrGgVQt5g_1763517263
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso18796143a91.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 17:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763517263; x=1764122063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti4if+e0vZ3+Heb4vsKFgYIQ8JY3byZZQGyu2jg9Z6A=;
        b=MASS4D1teYG3gCx0wqopD8kITLT+rPBpfC4L3+HYxDblTPYoZS7LS3uf4eM0P6ri1N
         zF98uazmVswlNFbm/Nzl7HvT9A/zKXtE9Z0zvG//K5d39jQUZlNLqUZKEnpv9sKZ1rnf
         0+tk/9OCWbo7VGb5zZU/tBV7MwuQYKDumP9b1gpahNormDGlyfW7YSxTOHH4Tk2Ro8i9
         ukSPC4tneZi2qHHWe3JfG9zWgO10F3hwiMR+EwSSSn9snalgVeeClGOQXWcSD8zrRv+9
         ICzKNphuQx58FvR69ru5g39kDg/BM9KkzSnkVNNHiPtWTF3egCPGIiYL3dPv0MeSBQZH
         nOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763517263; x=1764122063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ti4if+e0vZ3+Heb4vsKFgYIQ8JY3byZZQGyu2jg9Z6A=;
        b=eLqd6Wkk5mW8Qr/eWXUgrHWKF7JCfrFucnzm7zMD0Qo6fXr7drP6H5anGL6bB2PNiQ
         acVo3bxza3XqariqWPY8ZaDzeqzZ5tqYm8hU8Lbmac7R8wl0YCUKesiPUct3/wlj1iOu
         jqiKhUfrWbU3nxUD2BLDjPcwuM+CYha1CsCYRb4t4oyizfo0tb6BxnsU3Xd25phHg/6a
         TvAtJYM9cDOyDE6NhkvJQYKpUE6T5sAMO3gHBx9r9QKUqru9r97n82RP/lSLPA2vGC2T
         1p18KjVwI+F5NZvNnXSz5p+WarxiDtTKL7TaN/V8S4nQRkGV3OrLugkheEUt6/0Mop4u
         TkKA==
X-Forwarded-Encrypted: i=1; AJvYcCVk5v765fe+9MxqdOeAi9ufCCSBx9otrtbBmePgoAaOlbN0mrhSN8V206re5vbugybzjSJGj7PbKjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbXsncR2qQkU39smJrXrDMYdrfpoW7Pm8FOh10udwf7+yY5yin
	QVHNWW0RPTNxFqnSgyeYYvcO+VgilfWNY3svSwEDShocWp3N437wg1CneINBB4avrZpm/feIbI3
	yeQ6nerPLXFF9pnf8akYdV4HKF3PvYy2mN4uiZApdkIefbEnnG6AmTDIlHX/wqjy2Y5nqSmELuH
	tQLuUwJDkjQvEYwll6SXgth3+egC5QhHtKxEAU
X-Gm-Gg: ASbGncvWeGZtqSgI8iD6HgYhW5kWXpORSzNkH+GW6ZaQFUyCbaW1W/Au+JtR5dteAh6
	q0jCiAI2ESy0Jwu+Fw0SkpUAf1nOE9f7E1R78MC9F5ucwlm5HlDvgqQhppEk5ertnqwL00e2Ds6
	ZKyldJxkrMeKkGHNIlzYTfGwmSLeuF1LkAjlkV0pxr36B1BSPOuVS8FSJJWr0HVbQ=
X-Received: by 2002:a17:90b:3847:b0:340:e103:bfdd with SMTP id 98e67ed59e1d1-343fa73278cmr18556661a91.25.1763517262752;
        Tue, 18 Nov 2025 17:54:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5GXGkEHQ50wOVjXeybBNs1hI+lnVX7iORT/ZASpo0ztu6fbH4EioPP1/R57VRfBgN1e8GgzjV0oQvyiZ1tT0=
X-Received: by 2002:a17:90b:3847:b0:340:e103:bfdd with SMTP id
 98e67ed59e1d1-343fa73278cmr18556631a91.25.1763517262213; Tue, 18 Nov 2025
 17:54:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763278904.git.mst@redhat.com> <dde7267a688904e4304bebfdbc420877cca70891.1763278904.git.mst@redhat.com>
In-Reply-To: <dde7267a688904e4304bebfdbc420877cca70891.1763278904.git.mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 19 Nov 2025 09:54:10 +0800
X-Gm-Features: AWmQ_bmKidj7jFUERWFCVnMYooo3WyTNjYb-AYGW49thc84xS2-48DV1m8Bt6Ms
Message-ID: <CACGkMEsnS9GCYCq-QVqv7W0Em76KKyFeWXOhkHNJmUWh4bsG=g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] virtio: clean up features qword/dword terms
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Paolo Abeni <pabeni@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 3:45=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> virtio pci uses word to mean "16 bits". mmio uses it to mean
> "32 bits".
>
> To avoid confusion, let's avoid the term in core virtio
> altogether. Just say U64 to mean "64 bit".
>
> Fixes: e7d4c1c5a546 ("virtio: introduce extended features")
> Cc: "Paolo Abeni" <pabeni@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <492ef5aaa196d155d0535b5b6f4ad5b3fba70a1b.1761058528.git.mst@=
redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

