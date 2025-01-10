Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22285204C2A
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 03:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736479652; cv=none; b=NCa4oJ22EedL8ppnc5h5qsUCKEp85JvE8N/9sHGAaNMl5/XhNWUTiSX0twID+SwnMh69u+VHsAWj3DurV3Hcymvz4iKJuXjn3zHkhyQmG5Bb13TBasDZeSCLyU96V6mh9O7HGzPiHXOfJEtVfETcb0149IjTM1hqM84vDcVBQdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736479652; c=relaxed/simple;
	bh=7uR8vN0M0CFh5qpZV7D1vSWR3xVu4IYzXqUeioDmijc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBrxMeXkN9S2V0RE//dgoktSGyrSuiU1/3DIbqBNAr+KDhN9ZybihO+4GjiFq9sQMbm8zJblQYJnJSC5CrVnIr3bujqrjmE5htEb3d8iF2unALFINp+zqDzxvbTL7nUc6spsvilgarxWYIntQelKDE4JS3hV0tB7xfZuUraG4YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nb4QVI9m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nb4QVI9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736479650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7uR8vN0M0CFh5qpZV7D1vSWR3xVu4IYzXqUeioDmijc=;
	b=Nb4QVI9mHzICmqRIZVeZFZY9R5ZTx8hooto6Moan0/cZia3CmRd0TIKaW8gNrAtJBp9Dce
	DfCqWnBkBXKRVFWyvxY+Fpxrtc204L4k/EXG/Wt1cUGoccyQpkRthZObV0BTh+UZVmegpm
	FW3LYu5c7nRSJyIj1E8dkq2cEQNGdi4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-m567kb8NMxO4Vi6R6VfLBQ-1; Thu, 09 Jan 2025 22:27:27 -0500
X-MC-Unique: m567kb8NMxO4Vi6R6VfLBQ-1
X-Mimecast-MFC-AGG-ID: m567kb8NMxO4Vi6R6VfLBQ
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so2894658a91.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 19:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736479646; x=1737084446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uR8vN0M0CFh5qpZV7D1vSWR3xVu4IYzXqUeioDmijc=;
        b=ggmYxfUi1kwsP3n4E2lv15J3T6cF/GOERsWjWvcYqWKo76VF8BbpX0SOdzPNI2Gvxp
         wcx/9rGFLqFn4sOzYoXD6xxHq0HkTIiypzhkEQygk5dMtnN2KLu8pRbkjW+MdQSxpDgs
         UAOUxFWuHhCT39CiRpO0Q05w4vDjPe7B1g2lJ3xO1jyYG7HT/gOFhrWbfRAGnnn4rdp1
         mS4tLSyYSjKo9VzaJ/2av4ljL6r46rxYzjO0U/ZcJQbuFcd90pGbKAQoebZ9NwD8lkn/
         ddDZ78e55+MdCIk30YYrsKXdxAj2AZR9hOcljuvqPmtVvd+7rXVRKy7Y6MBShPReyOK9
         R3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeSTtfUjbL/q3B1pIxPcKdYXttbiddzPu4sxJ/TNVpmORnj+Dh9skU9nWJkJvsONZyMONGj5Qezbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU9z3EinUJ/iJXtucn4sFTP25QHzlrajY3CZdo0/dMDr20jRKS
	DxGROoIvZ3j1IxapT0aN9Z39UBtmuHS9eL6nP5J5Zh/5ijYDRyT+Kjh0IT/UqG8fRGEZu4SbKtL
	U8c2j4YDNu3m6Rgpilsq2wo2XkIDhdc2QQrNaW0CuwSqnZLSSfJQGRnEms2FF3t7BJDPYFF/GJp
	8aoTSXVQQYH02vQ7IwqqD/yH+cXgPMQ+UX
X-Gm-Gg: ASbGncvxg34RSEgqYwjkggein/vKkcR3jZiaY3Bu0dNmjFVKvFamVCcYjHq8Zi8heYw
	f48veVcFREw3oZMpS4dSzIGDJPuV7Iq66ptZjX8k=
X-Received: by 2002:a17:90b:2f0e:b0:2ea:59e3:2d2e with SMTP id 98e67ed59e1d1-2f548eb9e0emr14161350a91.10.1736479645914;
        Thu, 09 Jan 2025 19:27:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr6qt6YqI8gxH2NjDJ69HLIEFDu0/JDwyZCE+11GxsqEEXtLHHfTQDNxjuhLS8NYQPmojHsZtINe9boq5qSYU=
X-Received: by 2002:a17:90b:2f0e:b0:2ea:59e3:2d2e with SMTP id
 98e67ed59e1d1-2f548eb9e0emr14161300a91.10.1736479645509; Thu, 09 Jan 2025
 19:27:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com> <20250109-tun-v2-3-388d7d5a287a@daynix.com>
In-Reply-To: <20250109-tun-v2-3-388d7d5a287a@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 10 Jan 2025 11:27:13 +0800
X-Gm-Features: AbW1kvZyiy6igQIYtcT2bEIGGuMlsgd6CYsI8IZapQaNgu__KkmEtAKFahTJbko
Message-ID: <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 2:59=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix.=
com> wrote:
>
> The specification says the device MUST set num_buffers to 1 if
> VIRTIO_NET_F_MRG_RXBUF has not been negotiated.

Have we agreed on how to fix the spec or not?

As I replied in the spec patch, if we just remove this "MUST", it
looks like we are all fine?

Thanks

