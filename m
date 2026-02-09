Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDD1352C5D
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 12:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638553; cv=pass; b=nBDjGtIbsU3+LDNjMfoHMTaAzjitUsH+rDV354p4TW4AZdK8mPXBDAcPDSrb3NGSoMm8z55ZYoIkktNxTaymsHwsTFDW5/aH0jkm3CMZwjb7TxQcCS4IXgypFmNFw9C67DsQrFEa+fwZuftEefCtNSimmrxiFLR8AtLyEOJCt38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638553; c=relaxed/simple;
	bh=4aNQGxtrrEdzV2sLkA1xkh3R9gSFeyePvFhc254cg14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ajf77F5pVz4Lq99UxGl3SOwhwogiHpTWPtzOpYMH7jwlA2bBCtEYY4z+iuNIJfS65pRgIUJ9lKpTMTz1pw7PXKZYRTyvGYiV4Q5SirT5hqTONnUvijhu/deY2eMqoRcVbJxiAMN3gMOK+d2AH5MsTKtzBy3DjLfxdbpLfcoQ9vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXimIWKl; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXimIWKl"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ba716126f5so61539eec.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 04:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770638553; cv=none;
        d=google.com; s=arc-20240605;
        b=MHUF8Bgsg8wKHHmebKFHdsKAva6JAwgP50HB3wQIh6/CwawadS2EcWjhJSrvi0Q2mz
         5MgtjagOJjLfR0i+upyk09JRYRAgakGmcJ1RUrW7p345kiyamrdfKAwfoQkKWCVu1yeB
         iWdZPHeNlVrI9/IeLGhmaIhFUKxG80UYV27PqUzlMmxHPfiIhnH40XN69zpF3fJHcfd+
         /UKYkkDrqYspqOeGcHubPMvOESDE9DXROYBTBHFALr1iK+cIeyFFgc32fazNY8IQBk+z
         I0LJ9DDhnK7xjGhLCZHRsUx9WAdZAlqalnlOSDV5O+14jBxzNWHKEnhw/MdzifLs5yzS
         CmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        fh=3X+HnzdBY1asOwU24uvrLjCtve11NS25pZiJr0fcygQ=;
        b=TsoNjDbPpov/tzfYLaMeAMwq5xH3yl1HKrk5zasXjWTuiDCCJcyRncvB8Kp0xbGG3o
         OmDkRddCaNpkY1SIvR/NxFmeAGVdnqw7aAnp8kEaJHqI6urC3I+w9KGeqNTdCyhaBQ9A
         jqtJFXq0sOX4bHa/qsOJO/zqzLk3JRBymD85AiN9ZSzFOLoep5JPrqUaURS9LIUe4Mpa
         D4G7i2iVSKcXU4lCeysaBLtZvgBdP0aLwsp3oKCXeqwiFemHGHjocY1p1F1ItzFNs6FS
         V8BE0MR8jdLjOXGf1hYCxz0ia//OCocDGP9mX7LnrIRS+FEeTKoFuIC6pUQu9muIve0u
         K4+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770638553; x=1771243353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        b=AXimIWKlJR8bH1ueiSRf8KqGT7rZyKXn3uTki1QyUFxYIjL3PZ+r8XUw1BR8bWYbgJ
         1MMLrz1I3GcroR4GYPWhu4XZlqhl+cvP31FWcDWk2k9XTwN2HkiJWC+Dw+tWvf3bhtEG
         RL+pP5pq4nD+y25mSViXOsnOj5og4j3+BcmJiUSLQx6nEWTYehSGMfByJAggpybZKAzD
         2O3/oqLyC1RKQJE4xu4sP7Yw7f2muJF2qZXqGzldRXdDiAyAr8A5bOf5/MYdDMpeGn/i
         ICfvMi9o4xgMg1Dia7v4Y//bpCnsJi02Rr5MECLJ9GKrOn61ZKD6kWX92DruN45Z33je
         gENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770638553; x=1771243353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        b=n+BV5l/QKkMlIDcw7Z3K8tbm0oFE5TNnPvMuwhQcbSbKD6ueMvaXNgL2CeLvCNueRz
         DcnW9XPcXZ3G5p5tZmdBUm2accXxWXwHJWMHtCeSdQQ8BOCjtzcI+Ip6k/+MEIpzDTf3
         YOo9Oa76h2LeGYRmhwDwKrOuDQWbMMf1OjP1NOEqKRwqEgzYQ8dYieJg+7xJo5hXMQTI
         tMjQfttkdjrasLqm8QpsfCnhTYUb8qQ9NulEVtmapqCFsEWd40wLzWL+XlapsT1jYgvW
         Fzw1WpNzFQ3kz7Y2FnGnSMk9UMLbXKt4Cx9eYxKIGTl3Qg8STUUcsTLB6AlJ4X9y3jun
         pzEA==
X-Forwarded-Encrypted: i=1; AJvYcCWbusWPLw9qqnblzNH98kcrTJ3RKKRArbdxc0Bn1Fj6wiF12BME8l4XeIPP0QdpWAtoQfmtX6U/Yq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyggnz7c1FIlVcx7OtpSAMNgNMM+t7M8NegZfVwYZs+2CZuph6J
	sliZgKTeESr+/746vVc+xuKc1QRc+uczxx+rntFEhY8/kWb659zCaaX0Y5edH1/K52hysY+3XbH
	EisybwVOO0wwfWkOjz9uzR0Pbo56Rhfo=
X-Gm-Gg: AZuq6aLZQdqj0vOZ/8n5cKauQmk04IiRsLMxD/brla4UP4+ZwN9GVsg/gcs+qP7Ocu/
	xiLqT9fJxksUTMoH1YPFxlp3bPScRK5PhfxRnNWIyBFmRGJwYlSSAaLZoF6BANBmo8bnuYjNvuh
	NjwWL5xH9Jm3n4qESpleQZ45K+zRiW62ITmHcVnikEh3SSdE5cdVkKuLzpIJPQCcNx3uJOH5AOY
	FdBaOFcXZKCnjj79RuvS1xb7cV9135P1FTQl8M3YFWpVK/B2esf2foHRJ+z6YC+5Ztyj8Xlk9bw
	ArWamW/QMuM44BkosnTvXETAt1zaL0c9LU6DOig8xWkH9ptodeSZAg6weNmIpysEN30L+k+SuOF
	+ZNyiKn4m20xh
X-Received: by 2002:a05:693c:6085:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2b9ddef3bcdmr780273eec.5.1770638552639; Mon, 09 Feb 2026
 04:02:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
In-Reply-To: <20260209105456.1551677-3-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 13:02:20 +0100
X-Gm-Features: AZwV_Qj0qLrj8jckFchFsbULIvtu6ZjFQsKyUw2LAuw6MCkfc5efrXbsku0JQ84
Message-ID: <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 11:55=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> These changes aren=E2=80=99t the only ones required to get the kernel to =
compile
> and link on PowerPC

Is this patch not complete, then? It is up to the PowerPC maintainers
what they want to merge, of course, but I don't think we should add
the line in `Documentation/` if it does not work yet.

By the way, regarding that:

> +``powerpc``    Experimental      32-bit Big Endian only.

These levels are mapped to `MAINTAINERS` ones:

    Below is a general summary of architectures that currently work. Level =
of
    support corresponds to ``S`` values in the ``MAINTAINERS`` file.

But there is no "Experimental" level there. The idea is to know if
there is someone being paid to work on this, or not, etc.

This should also be changed in the other patch that adds ppc64le --
e.g. Mukesh, is IBM supporting this?

I guess it may be simpler to not add this line here until it works
properly, and only add the ppc64le one in the next patch, with a fixed
level to one of the `MAINTAINERS` ones.

Thanks!

Cheers,
Miguel
