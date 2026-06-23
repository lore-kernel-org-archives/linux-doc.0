Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007D34D916
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 18:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782240990; cv=none; b=L/rKRz5mR1y/eUp+y75Ztvwxvfo0tGw8P5z9cAeUcQpODRWehlicI7BLVrM/qAx0Rr++x9jYP8t0WKNfV+Iga4Zxk4VrU7Okp8bwHKBx1djUFoC2ca7/52/kwvqQa9TQkndypXmHjXok6rLGcvDsty5KKW+IKYom6onU4egoZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782240990; c=relaxed/simple;
	bh=24Dn8UqRZ1p8BQICezHYOo9NJl5h5GUSnVLscYJARrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqkN1iMxkck/PLPAr16MgnmPFH6NI5iu0Lr10jWJHwA026CFvZ2JYBdRiSuolbiw5sVLb0r0wfnDhqRKsN3qIHdJrVhnSUzCz8liwJMV7Hn6tgdzOXCuU0dbhgoFJeRIigDtIE3Mc6mV4Ir8zhHv1CszBdqbNN3iZPPNrCkXk4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GjpMQAhk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GjpMQAhk"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c029505b389so230352066b.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 11:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1782240987; x=1782845787; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sTYMiI8T7qy3LqZCJa3jMkJNbrBL8JjUNCpZXVETjNU=;
        b=GjpMQAhkhcE8X4RT++ptLx82xBK1oNGSa/InTX9Vzyn4cK/rWE3Dy226VmQ1csGENE
         4IP8uBlPo7j8O7MVdp03bntvV/2cT/lQtVmj80MQFtZ4M2dIt/KyfcaweKLuCJ+3DisO
         412Jt2KYWBLogZEBYNLk8k6DwvQy3QG4my8QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782240987; x=1782845787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTYMiI8T7qy3LqZCJa3jMkJNbrBL8JjUNCpZXVETjNU=;
        b=rYTW27l6PSnke3Q69AbooH7Lph1EfVaDeaTpY6SQOPexUJxNuL7hevXqF90qdF+ddr
         I72K4n27vwVTuz2WdU/UEKhJa7+M+k5wWFQWwZMaN38JSJqiNNpoOo8nXUmJrWtw0yD1
         cSJ4qHz5tDmSq5JsGQ0uDvd93/F6wxtb3IFKSS1NDhZ6LIPp2jQnj7XYmsHa48MQQqbq
         nN8m6nM0tJg9NzyMq2Zn5RZmfbGg5Ls9/geV8EM0x9LJTxMsKrUBvT7yYxXGMrGoUkJl
         kJtoEFOC1kuo20dECISpgxXUzNf9MELxipOErHYPMHRvocSfOHxQY0xpRRDRl355rlcL
         Odyg==
X-Forwarded-Encrypted: i=1; AFNElJ90pSAYocyOgUstlvrGlQNEfk7EH0WUer1kj7QJQ7gHwW3Uw/RwuA0upNHyhE5IBm0n0wPlb84QUgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sUyj8OS0fMtXKZPySXfzO9exuHAzX81chi1VF5qbTvgdNII/
	EWHFnn0YYuHaGO8Z39Ycitvs5dk7nLfkupWtAOREDus00TgsTwFhD/7mwQKdJOKuvp3ogbhM/K1
	2oRpYr4A=
X-Gm-Gg: AfdE7cmy+6RpVWpJm37t6f6nVeSTlTolYzEjIGWt96seJgj/khh7FB+QuSh+2ti0DPG
	neBBelqfnQGFSBQJ2hj6JX++j1iDL5D/VYlrpMPtZI5uFZdUdu7TLC1ZdE8joicySPxoZIZo0yJ
	J2KoIg2jgVuqTVRMqriJudKhCLLMZr5yiA2updn60no6L2AhUE1MKJDChBftdAYnifLRz558HVn
	etFFENWvebW396PcaQsxNlhZIVVqhRhRUUAlhT516tGRkZ3WmbNesunpiK0umR2UAV5/LwHZXbl
	0BXiWek1jH8MWrJGiRjQafc0frgxlayE5HC9deT5xoKY9LGm0UE443sBT8hwc+W1W4KR+Wv4pc1
	2mpFhcLCp7CFp7t3geAcKWy/AaULwIQKksmrhxGwYQsXegOhGdWEdLCrZwQjmTRQFNeEE79E0dX
	INi6Km8mBAv5nNK0fJlblmFsdhXd8t7VeJrguS71f1PN1BAJ/fuBXjtEaO2DvLwx2yC+jHsBRb
X-Received: by 2002:a17:906:1383:b0:c11:5a1c:b1a7 with SMTP id a640c23a62f3a-c115a2c8561mr49394366b.7.1782240987409;
        Tue, 23 Jun 2026 11:56:27 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5280sm564516766b.53.2026.06.23.11.56.26
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 11:56:27 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-697e96dd8d2so825371a12.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 11:56:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zeV2AGhWm59sHOe9TNQZnTPIx3sQzy6mafCMN2lOGjPsQLMA+3ZB++eK55nTvw0/OZvxapM1KzRg=@vger.kernel.org
X-Received: by 2002:a17:907:c207:b0:c11:8357:40f with SMTP id
 a640c23a62f3a-c11835704bfmr15229166b.2.1782240986490; Tue, 23 Jun 2026
 11:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430011544.31823-1-ebiggers@kernel.org> <7d08a6df54279e9915f5df6bd4e5e5dde52b4fe1.camel@hadess.net>
 <20260623164932.GA1793@sol>
In-Reply-To: <20260623164932.GA1793@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Jun 2026 11:56:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNG=F3xO9PjL0RcKy3UWvq0Np9uZu+nFUQBAA8So9xdA@mail.gmail.com>
X-Gm-Features: AVVi8CdpFGqem5dP7mBI1VIDKVc8WIWTZWMdjSeug8fejnSzLkFpq4QaapJhuLo
Message-ID: <CAHk-=wgNG=F3xO9PjL0RcKy3UWvq0Np9uZu+nFUQBAA8So9xdA@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - Document the deprecation of AF_ALG
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bastien Nocera <hadess@hadess.net>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-doc@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, ell@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jun 2026 at 09:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> We're aware of that and are taking it into account in the allowlist:

Note that if we can  just unconditionally make it depend on
CAP_NET_ADMIN, that would be good - independently of any allowlist.

Because if iwd and abluetoothd are the main two users, and both of
those already require CAP_NET_ADMIN anyway...

                Linus
