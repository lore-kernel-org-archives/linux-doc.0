Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABE4199923
	for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729593484; cv=none; b=Umkf9/45kcpBUwxrHstVmxBOGMfNtHr/fP3tix0i0d2/ch8VuPXQN7lP0igoJpD5OoTgQKhDNtyzVYGn29CsCN6/+XJstDVPtbP9wcVgQtpU9gQHVU9pH9zWY0aAW/tlDzyZQ143M7063HZe6QmvV9uat6CwU/3Ceoi+W86Vck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729593484; c=relaxed/simple;
	bh=ffFIq/gaiGrXB3V8+8QiuT3BPvz/9MKGdcuUtNI5Sac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y2a5NGm/cP2i9XkpBZ4RxhNXedixbaqQ3/uWnJ/aOtAN1uHtb7/wgNmlmU8ZcT2G1+A/CSXHeYp1A9hjf5fMz4rz8c2T7J0VRvViWcJvwsUEfCuI58LZ8PwOvCQyIC97KxhSey3zUtH0R3azNvQ9MfgeFQFDFOy6+bg2opkdU+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ERtG32q+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ERtG32q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729593481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffFIq/gaiGrXB3V8+8QiuT3BPvz/9MKGdcuUtNI5Sac=;
	b=ERtG32q+3SUdrqsZxQiURJwZq64n71jT5Bq6CXbeHaeo43lT0veL0yIxMCkMp0/v85NCeM
	fR05PGHtfpK5nz36oaQk5DqlVfjWtDoS1xUN/MUtTstgdXaxpUfp8R/WrRyxQeinI6VGcj
	X/0S3ClvE6WVz+k+8wThVoklpHu03b8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-TeZ4LaQdPpOpcraNJqvySA-1; Tue, 22 Oct 2024 06:38:00 -0400
X-MC-Unique: TeZ4LaQdPpOpcraNJqvySA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a1828916fso610514466b.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 03:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729593479; x=1730198279;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffFIq/gaiGrXB3V8+8QiuT3BPvz/9MKGdcuUtNI5Sac=;
        b=o1KUgKy1SdTQlQ6BP8socBfhqOY3KWGpKSs44cD4IfIrYp9C5OxbyBswhgkN/iPhcc
         TeUDcNIgeuQ1DsDetPMpC8eZtWRj3hsR6lOh6dvHLvRT8o2/FKI4p5y/c10rMtS1XkZY
         7yHQ6kn/M4P+PnzNf9euebLmX0o9yxhyj5hd3Yij94hf+EDjcbFleyl9lVuj5bk09dJY
         gGTwYZKkD8M4hV2MgaXUEz1MG7jSN1BZ+Rps8740UT7CbFZgOoKLlxOJuHEvPtd8wKc3
         a0WCl0Ar4oIntprwvXcbFWsWxxxebpfU5MKiNp+peaG+kBne883nt0jSPxpBg2iMhnUo
         OfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqAMhU3kKsPAlF2d6fhgPJtsmtBeHvRFpJMrO0yOwrYYi2Cp/2C6GgrY54t/SKZ/+NGdBOK7mXCRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6GOqfX5PgvSNj5rGP8gxvylSgGi3DZVVRlDHtRXZk9cEGVwU
	izlw0Q53F8rZM3ovN29v07ZGGZ5zZWl8fTXoY0chHuSUNtJqODCS4y4p0r5ZTR/40lD7TQ8Erag
	i2OGkPqy2UCit3Fgsvm7lJndvEo4p27ziuYwOgkD6/n/enU+S2amtR0f+6Q==
X-Received: by 2002:a17:907:2cc7:b0:a9a:170d:67b2 with SMTP id a640c23a62f3a-a9aaa5d907fmr283640366b.29.1729593478857;
        Tue, 22 Oct 2024 03:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEripPrAITA/WLQwqo9WurNo58xCXU6eZjF2PPYNfcl+DENvnVnrciJi0HPoUTYPFfXpqprVw==
X-Received: by 2002:a17:907:2cc7:b0:a9a:170d:67b2 with SMTP id a640c23a62f3a-a9aaa5d907fmr283637166b.29.1729593478361;
        Tue, 22 Oct 2024 03:37:58 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9157363asm323363266b.173.2024.10.22.03.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:37:57 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 4B16E160B2E6; Tue, 22 Oct 2024 12:37:57 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Jussi Maki
 <joamaki@gmail.com>, Jay Vosburgh <jv@jvosburgh.net>, Andy Gospodarek
 <andy@greyhouse.net>, Jonathan Corbet <corbet@lwn.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Nikolay Aleksandrov <razor@blackwall.org>, Simon
 Horman <horms@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Hangbin Liu
 <liuhangbin@gmail.com>
Subject: Re: [PATCHv3 net-next 2/2] Documentation: bonding: add XDP support
 explanation
In-Reply-To: <20241021031211.814-3-liuhangbin@gmail.com>
References: <20241021031211.814-1-liuhangbin@gmail.com>
 <20241021031211.814-3-liuhangbin@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Oct 2024 12:37:57 +0200
Message-ID: <87sesoh18a.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hangbin Liu <liuhangbin@gmail.com> writes:

> Add document about which modes have native XDP support.
>
> Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

