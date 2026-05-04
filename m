Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCB3ACA65
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 18:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919243; cv=none; b=F6rHSLF/xPe7P2DJVK4SU0r8d21stR0IWArifnyctF5ZsxvlMv5wkxUTXJ8ETsfAIsnPts4yeYXtw1AASfGCg+Gc9/KVwiYqD7xGxav1H6tveB3Wy2xzNyw7KAtWMSSbJf646xpwQ/xcCLEtI99I4gNXwBub7VydZPzP/s9y4tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919243; c=relaxed/simple;
	bh=y/kTyLZ+HlrQ86LL8qEx3AHdGjyMN0oqqtY2orbYvNk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t7/7MlpFO2sPOar5w3qymA8FZsm845PGTmG8qC7L1iPgq0BDJN4STtZ5MLJfw8mOhzCo7J0mQwaKg1pCfCpc5iGx33BxuQ1pYEknIqmc/CEvcudTsCe6m6wgl/qCfR7lGRuuXL0ZoqEzT4W23tpJEL46rjQ/UbeJ5ZJkXxekvys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ajFqOG7n; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0TACS4X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ajFqOG7n";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0TACS4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777919241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QcIoIPVGpy+t+hQB2IAxs25ATlafdN5syK1oi+kQ6lo=;
	b=ajFqOG7npDB9cr38r1KHbO6t0tbncY2+MTX6CEOyHqNrMpqCftF7ObSow3Ut8ncyHv12BB
	gqQfWPUwReD6wAmbyb8TgXUTdwQne+EZ2KeY/ojPRawQFyXNwi8av0Nc2q1xpzfVBfBSHx
	k6EfqxfFdRJOoTRLxmaDy3l43OEEipQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-cHUMu3fFN_6g49VKiwz6Zg-1; Mon, 04 May 2026 14:27:19 -0400
X-MC-Unique: cHUMu3fFN_6g49VKiwz6Zg-1
X-Mimecast-MFC-AGG-ID: cHUMu3fFN_6g49VKiwz6Zg_1777919239
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so80245661cf.3
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777919239; x=1778524039; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QcIoIPVGpy+t+hQB2IAxs25ATlafdN5syK1oi+kQ6lo=;
        b=X0TACS4XXf3YLMC+ZSqUzPgih6j7BGfb0qvSALIdbFSgXDcnSq2D+/roChPmKAB2i/
         I9xJTYPXRGwYI9krqrt4HBBkZt1iTt2kuy7+n5nE4y7RW48VgHJC5RRCpBnEFGgGW6Jw
         qvYJ3XN/yC6htjdvm+27ZEePZy/0sx6u4mZGt8KF9dj72Bjip+70Ps1XFczIH7jQHNdu
         rXLWE4L6lKh8kKrA5Fm4OQajZjqFBqOU6/iPZLvmzB3Exzjo19dsWjDQtBpGJ4czXSQX
         uOapTF9697atNxMLgyuiRMPiUj6qJMg5X7WofJaEKn1wx3ZOtGJ5TvtomBXLoUHifK0M
         8cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919239; x=1778524039;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcIoIPVGpy+t+hQB2IAxs25ATlafdN5syK1oi+kQ6lo=;
        b=DDUe75uP3pau+t9Y4nZeqOPxGVIF0Dap/bxIKhQmKi7D4LUSDXIMIaRrGTy/Ahzdaq
         ml0K3392qk7pifLyvjNoKqYZAxFF4/mPP+tBSvRMs+dUSSan2AuMrg4A0BKNdMXdDYq0
         0fPD0L4XFJF2IbCNbrtXOBsuE3JkabfnEnzUj6SAzk8EDbb6qzZm7sFzIhF0eSOxHHVM
         YqLLbuEgigFD8cpH6xsEyIeRa9aRZOw28Ttiu5iMCWuE3/0iXBeK5JPjBkuxeSRtk6i5
         ufEV/jNvACQXUptPGf3Y5i35y5qKRL/dVclm7rACmxs13eflUNaNHZrJs3mmuVWAL/RX
         TJ4g==
X-Forwarded-Encrypted: i=1; AFNElJ8YBJrgQlVwdH+NTqOr1+se2ghYhGg2xyjbjDPpGmIz0Yq8lLXX7L4D2VwIqdImmE0dolVdpsNdZbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/Cb7GRp9TDbKg5o1UZPKMBgT24FocLxt+gFMqN8b7+V/+cFK
	uvWfLqkP0i8qj//X+YuwTcOXf5B7+ErRt4DElhBABszBtRl2bipaMCgP98gKpK3sP/gsO/DOlhi
	emn1BxvJOkc2oSMwFU8heZDX4pwBexoQwd0AKFtqV2XfeybxDzypV3TIqixiQVw==
X-Gm-Gg: AeBDievtADZQ5x8PJ2PdMI5z+N6Qk4BUz47GrEaCHEdUxuCjsgZKJ7bQi2kxXAunoxy
	r5I67RViZZciXYY2EvWCJGfu0WxjS8ZAJkJYLp0KSOVvzbGKpeC1mXJU415pQY2uWmkhaTg9gkj
	K7cYV46U8wZyWJ/p6OEawNjOfqjeO7LOdBLVoQq/7nvT3BNbWkTvEDLWkseNk6WNiRRXpb8FAvf
	plkva6Y++mAur7Ii6on0iuDk6vyG+iWIC+WF+qb9uOusWWAr6Wkm65FpiG1wnunfGVOTdv6jacO
	Vwt/LtP5JloKmmSnal2u2fOkHPHT8jw5kY290HzAdBTlyngXAo+SGnGkUihXlmmaaH0zyau66r3
	rOJpqRyO3g6zosH0zj8TjxJ2BHyE=
X-Received: by 2002:a05:622a:5c09:b0:509:26f4:64e9 with SMTP id d75a77b69052e-5104bfa3385mr199674361cf.51.1777919239187;
        Mon, 04 May 2026 11:27:19 -0700 (PDT)
X-Received: by 2002:a05:622a:5c09:b0:509:26f4:64e9 with SMTP id d75a77b69052e-5104bfa3385mr199673581cf.51.1777919238563;
        Mon, 04 May 2026 11:27:18 -0700 (PDT)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::fc6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53ca982a1sm142199276d6.38.2026.05.04.11.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:27:18 -0700 (PDT)
Message-ID: <2890ba9558b503c5316f04aed958337455b8f7ad.camel@redhat.com>
Subject: Re: [PATCH] crypto: af_alg - Document the deprecation of AF_ALG
From: Simo Sorce <simo@redhat.com>
To: Jeff Barnes <jeffbarnes@linux.microsoft.com>, Eric Biggers
	 <ebiggers@kernel.org>
Cc: Jon Kohler <jon@nutanix.com>, "linux-crypto@vger.kernel.org"
	 <linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "linux-doc@vger.kernel.org"
	 <linux-doc@vger.kernel.org>, "linux-api@vger.kernel.org"
	 <linux-api@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	 <netdev@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 04 May 2026 14:27:16 -0400
In-Reply-To: <F100C726-F841-461B-BE2F-C2018C122426@getmailspring.com>
References: <20260504173952.GA2291@sol>
	 <F100C726-F841-461B-BE2F-C2018C122426@getmailspring.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-05-04 at 14:12 -0400, Jeff Barnes wrote:
>=20
> On May 4 2026, at 1:39 pm, Eric Biggers <ebiggers@kernel.org> wrote:
> > =20
> > That seems to be an implementation of FIPS 140-3's integrity self-check=
.
> > A few observations:
> > =20
> > - It could easily use userspace SHA-512 code instead.  If including
> >  libcrypto.so in the "FIPS cryptographic boundary" would cause
> >  certification difficulties, then a sha512.c file could simply be added
> >  to 'libkcapi-hmaccalc' which is already in it.
>=20
> Indeed expanding the crypto boundary to include libcrypto.so would cause
> certification difficulties, it would mean certifying all of libcrypto.so
> with the kernel. There *may* be a case for saying that it is outside the
> module boundary but only if:
>=20
>     * The integrity mechanism is clearly external
>     * The cryptographic module refuses to operate unless integrity is con=
firmed
>     * The trust relationship is clearly documented
>=20
> I don't see how this could be justified cleanly without significant pushb=
ack.
>=20
> > =20
> > - It's compatible with all of the proposed hardening.  It doesn't
> >  require zero-copy performance.  It runs as root, so it would be
> >  compatible with a capability check.  "hmac(sha512)" will need to be on
> >  the algorithm allowlist anyway for iwd.
> > =20
> > - FIPS 140-3 might also allow it to be simplified to use a plain hash
> >  instead of pointlessly using HMAC with a fixed key.
>=20
> FIPS 140=E2=80=913 (via ISO/IEC 19790) draws a hard distinction between:
>     * Integrity checking (cryptographic protection)
>     * Integrity measurement (detection only)
>=20
> A plain hash provides no protection against an attacker who can modify
> both the object and its reference hash.

The integrity mechanism is not build to detect adversarial tampering
(at least at level 1), that is not its purpose.

That said a HMAC is just a hash with a secret key in the mix, it does
not change the conditions wrt Hash if the key is known.

=20
> > By the way, also on the topic of FIPS 140-3, some people do use AF_ALG
> > for ACVP (even though it's not all that great for that purpose, either)=
.
> > But ACVP is a testing thing, not something that is needed on production
> > systems.  ACVP can just be run as root on a testing build; there's no
> > need to enable support for it in the actual production build.
>=20
> Agreed it's not a good use case. Unless/until pkcs1 is supported, I
> don't see how you can use it for all of the test cases. Plus as
> evidenced by Ubuntu's new cert, it requires validating the library.

Of course it requires validating the library, validating the
cryptography implementation is what FIPS is for. libcrypto.so can never
be outside the boundary, unless you turn it off at runtime ...

The problems are rather that libcrypto is not instrumented to enforce
KAT tests are executed before it allows operation (crypto-API did this
via test manager) and does not provide an indicator (or blocks)
unapproved algorithms ...

Simo.

--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc

