Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5F22AE7A
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 01:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763517209; cv=none; b=AUxZ4kzYS9ge8gxHuB0mPAGrQfvxdKfemKmV2o6RbjdH5cVyiGU1zYvrM6vDdZSn9SoQ61vY3DFlBLw+cd/d6IsAtdCOKq/ipj2ghfVeQAgIgRl8dh+mRgw1Rr6jAJ+Xo7wHLWEyLSteVkBunHM8K//z52iDsn5Wsp5F0NuXueI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763517209; c=relaxed/simple;
	bh=KyrZzK9mqPm9s39/r9lrWoYLT4pjxbJQMQSDqyYyq8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCL7GVOXD/BtL8LoDt4tz0MSx1e9cawwPM22vEsyMO3vBHi4TiBTx0AOY73bH6txntVtFDpdbEjAflN1oQmKYgy/JU7nZ5tsuuXrX2OLWqMSLDVg8DAiHQesU78E9bauxqTeoQ3ofzFo3mAJKTDZUj1GkPMww/eS6yngDefKNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhyNiyHU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dbSa6r0n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhyNiyHU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dbSa6r0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763517206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyrZzK9mqPm9s39/r9lrWoYLT4pjxbJQMQSDqyYyq8Q=;
	b=FhyNiyHUFiEbK7+aO7jIqbf3CJcqADxzOG8cWKBBn5/MCeLDSarxphcElGbEuAcn7iImPi
	K+UGJkhZxlTEsEHifixMpGR2m2yB+qt4YgT0+YeRlHm+ofudnolbt/grOSG/csUa2VqcDG
	Ud0gd0jo32UdSxJo28VE66+9AnuGkZI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-aPpo6sFnNHG-sXDiYOATnw-1; Tue, 18 Nov 2025 20:53:25 -0500
X-MC-Unique: aPpo6sFnNHG-sXDiYOATnw-1
X-Mimecast-MFC-AGG-ID: aPpo6sFnNHG-sXDiYOATnw_1763517204
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343bf6ded5cso15359713a91.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 17:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763517204; x=1764122004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyrZzK9mqPm9s39/r9lrWoYLT4pjxbJQMQSDqyYyq8Q=;
        b=dbSa6r0nkDdbm+V5KCUkhCTZxbROcrLh0L+HY42grllXPmzS17SgzS36oXf50q4R8Y
         ywLUo/UoUhao0gswGVS2/79oQRXE+0FhQTy/kkysag1NbUOaWL0Y1IhJjScckP3HC7+3
         bM4aZ1/x5BeLKkLknumpdGDPXOLCmSliZ2jKUb4OfZUlZtwYYeRA/jkYWdJdweFLP1vA
         MabGVR5F3uM6g4xCANkfuvr4cLiaRdxSx+HzeRx049Xwbk9FL5QF11CcgMDLhccqFaed
         gudX08bOP5NQ/vVkDz5VZRM9EN76AUvVNeNGb5jQTYJIBzxZdYsUX/QWYMMTnbgsIEC3
         cysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763517204; x=1764122004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KyrZzK9mqPm9s39/r9lrWoYLT4pjxbJQMQSDqyYyq8Q=;
        b=Kz38GR4SGx7xiNXlD59NJMAPznUfbiLJnIUwvLmo6uS6HBtP77cL6iUp5X0l1/c/DI
         0Lwuuiakrm22z9NjgFIvjF55Ty/TrBOlJJElPCO0kS6XTM8ruaH0HunbbKlaCOdbtLqf
         8nfaZCvKL67JAwy1EKXiQDjZdP0HyOPuLxScJqjF2+q/YT+RCId89fbEWdl8nUvtNHgq
         441NsKe9BFF3EOVCFrMR6GfuG0n5FHrtJ9Gnk0R7TErPNAOvr578j5v+nldEN6mxgx0p
         0feifyeS1fZR1rt3Y1XOufJQh0HfU0LKO81UXl9f5X59fVoFnOPNftscKyND3o7uNy/E
         4zGg==
X-Forwarded-Encrypted: i=1; AJvYcCVuIo/SiuVaUisAphAOThFYvtQTFiHqeHshaAZMaawfazZ+uxZ5FR4yi1HwnKEVDjsUmdPqz028w3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxti6VehE6gxcwEDI2l8DzPd3jkqIfy0wcIlsjFauHlH0Tf8rZu
	0W4QmHbt+agGsUbAa96BpmTTDvBf0Cs92wzko78MVWGnSNdj8T+z7z3kxUONfM3JyDvD4+nx49Y
	+vHvE0Hwlqn2t3END8K1W5De6qYpZDyRBfnANw3VIU0A1j6tRlS4PYCY09V6cuLkI+yoLOkCevK
	XtQBKGSbBzcTnREEe24qGSP7SuFDImGsbgblLl
X-Gm-Gg: ASbGncvUXe3wKCq5CaJl3rNXGvRa0UGUU5EnI2eXSWZcI5W4QnOygs01xXn5jVV1xP5
	VV8Cx44bJlEJOO+q5KKIaxB9ofLo7w6Za5EZ7SR03PAJ38lSJTG8AfDH1MRrAE6UWxv5Vn3tIba
	i6I846hxg37uXHj4jzK/vffardn6ru3VGZzPaMMPRGo+lJqUpieiFH6mo0X1zlcgk=
X-Received: by 2002:a17:90a:c2c5:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-343f9ed96e7mr18500458a91.13.1763517203968;
        Tue, 18 Nov 2025 17:53:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK0BojLkbLsinUEMLK9poTO5T3VKUI0LJ7vBrGV4ZQeudjfClMdb+kGPfFRQFUzDtww/LkSD4FupuTf50Ci1E=
X-Received: by 2002:a17:90a:c2c5:b0:32e:a5ae:d00 with SMTP id
 98e67ed59e1d1-343f9ed96e7mr18500412a91.13.1763517203120; Tue, 18 Nov 2025
 17:53:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763278093.git.mst@redhat.com> <67ae57499e779aef2c5bd7ee354af5d4af39bf60.1763278093.git.mst@redhat.com>
In-Reply-To: <67ae57499e779aef2c5bd7ee354af5d4af39bf60.1763278093.git.mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 19 Nov 2025 09:53:11 +0800
X-Gm-Features: AWmQ_blKYAEU3q3XwJg467m-DKxSN_o3KNaIqr46lnM6uOA9mljHAoG_O8bYpVw
Message-ID: <CACGkMEvgQmUNVOzceNscLJiBxUiJDwJeST4Fe4Up7yBgbpxu4Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] virtio: clean up features qword/dword terms
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Paolo Abeni <pabeni@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 3:36=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
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

