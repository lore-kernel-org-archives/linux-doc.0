Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825F3A1A59
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671230; cv=pass; b=UjiX2J2YFTXl6QFi2XHiJ4fmOdZ6VXaFBbRaNESFKdSSyA6UEC+vnXzX3SK3W84T3emE+sF//V6LI2Jp6n2TsrKAaPnra9P2emwnyz4XsI5HYwSzPlrFl6NaSJojGDsXDhoTYh9UYNSCcnz6t3ZKPotuiokXBDSZ0CAnqqnw6Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671230; c=relaxed/simple;
	bh=Iuo9YKVaBydc0nlM1kPuqsWlse8oIaDRa7dh5NmGq+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtMeW4fDBQK151sZoEhNg+A5EQbuXK471MOQ2kDS4CO1eQHOworwQRePOETZnuo/W8rNsKSw+tA1CqIqZTdKytuufM8hiEAjNwxH15QjF7BiRCglKrbqJiG7yfYaHF6WVOvmHL8fnap+nYTAt9AwN5A71EMsjY6ku6LS0gYHX/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0KAXk8v; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0KAXk8v"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f1b00a75ffso473008eec.3
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 04:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778671228; cv=none;
        d=google.com; s=arc-20240605;
        b=eoKMEOOiaOb2AjNdrORh9N8lwuLgN7zSNMpND+lNSwEvp3m4AycFzQnHmpLE5RMTVm
         TPRzyTlxP8Dowi89Gdr4xK6HISNYbHVJHkFsV4oiE1KAknpHkWRJVfl54Aq//uGY8IxE
         FR6fvLm0cfTGJ0euPJCXxsZGf2BogmeXKtPBMyhAJERU8lyhmgIT5khflteelFHibOzs
         xGg7ee2js5jmuJOBA5/KtjPHF+VyL8IeteLf/rvFGHTiRa1i66moHAXMRvZt4rGr5uDr
         tE6jwug7QArwNClIn7SdjtqCsZtDDzxtDDcGeH2HaqvAakq9w5CvSwvL2k6pYLfypsJk
         MWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iuo9YKVaBydc0nlM1kPuqsWlse8oIaDRa7dh5NmGq+A=;
        fh=meo5N+PnWNif+6zODpBCdZnyxQ8zKkVd62t9MnX+OZk=;
        b=hMUaKQFzzt7zHYnYs3nyntg70RFWnmatJ3J5l/GVbg75JkYPmorkpNFrhUHzYkgxpv
         ZURXJyIfNkhoxKZYm9Wklb9pTP52c/c5CJ9mLy/NKt0HoSZQVPKT6HiyJehbD9x/y7Mj
         1aELHnoUKG8v5dHzlFabP0ew9QrvN2qs7xkfj6PZPMMcvmHAEYp9+zO8Dz9VKJ2ikfJn
         g7DXVOwXYk1osMgUDP6EpFyJCwE/XChWwJVQEQP8X4RoWgOESbVU/8gXWlgJeDSYjzdi
         qCRFO+fK9x1afHx1RDZeOBfMIqjklDWwtXVV7NzGvjY8Blc802QiYxgNuGYW3Wq8JXhU
         eSIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778671228; x=1779276028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iuo9YKVaBydc0nlM1kPuqsWlse8oIaDRa7dh5NmGq+A=;
        b=V0KAXk8vt5St07kIkKlGLuZQvNc3cF608jr7GUutGB4OjDHDDddl17R156PJbZamkG
         6rXrQYyMoO6eBc8F6zvGBjIcXkNNkz4xQZLbOz0RR37U0YyHq8+TfBWL235M8FXgPj4i
         VSKbH4X5reETdfXaYrhoHkL1yrQXGlF3kS+QswAGdWtjC5uLBf+oKsNGf99CLWOJW0Ny
         6OaYwZuBkHCaBs5dAc1iLdWLvqY77mq9buDEP6wTEcYLD/9WoLhqNO4XJOEqb66st/wQ
         eoPrCO8QDMWvk4iXtrN+rbtoFB3id+ne2sjK7sohlbVpesO203QxB3/FS1ypeLZE0n7n
         11hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778671228; x=1779276028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iuo9YKVaBydc0nlM1kPuqsWlse8oIaDRa7dh5NmGq+A=;
        b=MSrkUBRZZ7IHrS5DQvAEGXEnn+1jCriEsmaeEtNNas3D7EB10Gc6iC5pwxXzP8pNTR
         s4LuWeby+KJ+YITKQPotNm5vO85tTJNTPitSCu9bPDMrltQNtTK38dEMu9RPvxN+1D02
         mJfEaIO56IP/0DtL/zN7i9tnuuiDWPfUnLew1iLSof8qjUhwZwME9YkSTD5Az1Kb/cnJ
         p0WTW5GnHMhXKBgN2OM6Od7535NsMH1RjhAcJSL7r9RlsMoDBbI7laTa6q3R7E2Yhq81
         1Hn9k58e/aPOCSNoKVnvOynOaFbSALpI6U1GdPPHapMivibsFHAn90GegwPkluEsEbee
         3tlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Iu0So58m4NiDuToBcJ4pDUwGfl1HryodhxPul0R6A+/LMgcODZOt3e/rdUI1LFlfGnRLXgQr7bJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGHmhbJ8lhGBabh1IMHqXfKM7UcEAQ9FNEJM027XtgDIKSJLFF
	D7Zha1eAdBN3RHGd23BCbRu2mlsUpDHAYtCXuqLjtLT51RX6bch1jFb1Yx0fJBjlwCTEAWM73Vb
	KmyJ9RnW4GQjJpcvI+HBM36Lygw2Aqcc=
X-Gm-Gg: Acq92OEs5r/f7vRL2/qfQjY2bkVLau7YlwrqLqGBuLQDKC8bDlS6vw3I9bU7K8Iw6DJ
	+mJRl8i9Qani8xPWbM/I4bKfvDsxn/xMozHMWkg5dgACoA3d24JwFGMqSGk1PZo4iacKRBZd2fx
	7m/jUeXczkV6J+aEn9Y1iWzPqyPVLae7eGyXvkL9K0upqxHdaoWe5qAgO+S/qTfmDyyzLDw2kso
	k7bpb0ltKhyCVjMPt6jndaEwkgn9x8i2uljeZa0ZpjHr/OaXrIfSiCO4poNtMFjK+BpWeyWP4Jn
	e/708EEPf7rVdb3QDiOCRkAo1xGDoyr7wNZBd8udgjl5UQlD2kxXYLeNYbadXZWR/wvu5r6c2pA
	05mssX/cvaaf9/iiI9ZBc7I4=
X-Received: by 2002:a05:7300:c86:b0:2dd:5641:ef0 with SMTP id
 5a478bee46e88-30119a73848mr943073eec.6.1778671227908; Wed, 13 May 2026
 04:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513092017.265269-1-work@onurozkan.dev> <DIHHZLJR583G.2PP9PSQG3HTSR@garyguo.net>
In-Reply-To: <DIHHZLJR583G.2PP9PSQG3HTSR@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 13:20:14 +0200
X-Gm-Features: AVHnY4ITSI9NBcJjvw7hQkE_KivgW37VLCDitganNRd16rOTlXJVouIiC6TuvDM
Message-ID: <CANiq72m27gP3z0t80bSUds=2tDcnt9JU5X-=4nW9XwpZsiLuAA@mail.gmail.com>
Subject: Re: [PATCH] docs: update rust-analyzer command
To: Gary Guo <gary@garyguo.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 1:04=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This should be fixed by marking `prepare` as a dependency of `rust-analyz=
er`
> instead.

Onur suggested that in Zulip, but it is not a real dependency (in the
sense of generating the file) nor a hard one (in the sense that
rust-analyzer works to some degree without a build).

I am not opposed to it to make the target about "setup rust-analyzer"
rather than "just generate the file", since I think that is what most
people want, but I wonder if someone out there may be already relying
on generating the file without building.

Another alternative is an informational message about it as a middle
ground between "just in the docs" and "not being possible to avoid
part of the build" (and without introducing yet one more target, which
is another option too).

Cheers,
Miguel
