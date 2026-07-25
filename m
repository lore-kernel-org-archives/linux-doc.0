Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36E35E930
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785012920; cv=pass; b=ueCNPDmouTzsmACBasmzgO8F/KfYg6H7bkoHJE6Bfu3/tEtUtIpXQ6Q8VDVgk9VF/np9GncgbOePNNHz503WOfDiMReadQiXL7h9S6yt/ZLoCFh0bAt5qh39g5rv6MFVVQ9yPB4zzU1jA4sLi3rFS6NXiqYces9H5NMdyW5wcgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785012920; c=relaxed/simple;
	bh=zw51gC5xIPlAb+ehmicqnY9g7AruYRjvzVknaMunE54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSTi01A1gSdn/ndu0YxGSzWbzU9aSJMcvOwBryadGnDJOpn8RoZODpaitotyhixBDYIeJfHEqO81hUNGzz2+TTPRAp7211axAQkKmRHLJuHkrliOr94+cIhyNZ9otAVm7gRK5eu/0w29tdU04oYuhH1IDwDDmLc4/ScQyzmhVWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCfA16sJ; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCfA16sJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1094173b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 13:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785012917; cv=none;
        d=google.com; s=arc-20260327;
        b=rOqsIhmK4wu/4AUVSkNVuzz5CKbWTvGI+MY3r5CAS6YCM+KhypEfEC7AVW0SnUoc0H
         eLLKNSDcTBvxim/OXU5xSjNJoMEv9Yg+Ro47DRo78X/7pOWL3r/ebYitZGcj5Z6MFk8I
         YgEGJkhsyAhLaM5hZRk+hF489JiqQs35UwEPY3G2WJT+fArGMQjxYIU66ZKcMHsiJ3Y1
         USAWlpad4w7DDRTEYkDD0j7phfiz5Zd7rHYSabspuzXd21jf5xG1o+tmKfIHGCmgbbCx
         lVc/WxhKqG5MCNmYTKTRa5QDxeyNS7DcJoGDsqIaJFBjDBlOypTbcwFWLlorUlts4YJ5
         VC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8WOQSahUV2FdjC/IM2f0n66+R/EWHlwNnk6q/oqvWX0=;
        fh=TGR5ZRtJ+ogVq4KoZvu0+/j/p81e+qVPxi2EWC/t6UI=;
        b=BXvtpjYzseOEY9xvWbIh8I6IeBNlYZ050JxbCbfIGZ+chUXHLCZUYWgdAClbXw97YN
         4SZmxzemheZLe0KW5SFOLxd4eFPNfDd1cg5mdH/oZixtTC7a0SqTBXqfy2IOFqQQPeK4
         ganC5UPZv8g5WoLnvrZCOsLTboetrkRJsWxAmAS4Yd1GsYncyXDgK1bzbSf89kEmRS0z
         FI/B1C5MemyQASHBev2HBK7SNh5cfklnlqCTcWBS99FrTjxuEFcY3NEviC/43FksocL5
         /8n51udb/Uj6pKvIgb/6zNVrdqEzTbZmV5DXGm38nocDL8lQquQYZLESnlRLOKrNduLG
         MQRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785012917; x=1785617717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8WOQSahUV2FdjC/IM2f0n66+R/EWHlwNnk6q/oqvWX0=;
        b=CCfA16sJBtgz8hldzWHYxUcyEjDqG0Y36DO6tVDS/ExmfNKDZzPZL53IiAy2HXqw2O
         KGAlALuZKD65GL9IxDdiAKuHMignZ6WXOsZx1samvNlbskdHpyC7TijOlka7b7Ab7JlX
         9DOirbvc9OUcRek2FGlvwCYNbjCSoGUKFnIS+mB249msG4ov5+/MS9llmMgoi6gXo4wR
         SQnOgz2SA+68IAreR4Ru1Uk0nfis315U2LA9sR0U72Iezp+sgkabMYRYXpfdgB4JiNMS
         jEuo3pZ0GvvmCxcqlnHbjxszgy/btfDRvWGt+aeO2Q/am25HTFd9D96Xz6Fy0N7YIeZO
         Yw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785012917; x=1785617717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WOQSahUV2FdjC/IM2f0n66+R/EWHlwNnk6q/oqvWX0=;
        b=fAUajDLDauOaWzKt41C8ycKcr6QAy7zyjjFNjMFXLs5rPnw90fzIt8vVIohRQEQoHc
         6yGozKb1sP5eZS8dMzGVkdE0shjfE2ZAVDaC7olyyktLBp1vUYp3E336myu2R9qRlpDe
         f40lzOmLitLN700N6a0FDjwxNj6G15txIT4GVk51LIsE/12ch2RNTTS78/oFF2P57Zhw
         pDogjb7rCQPxszJ4iot4RW4Y+f37LNB5upVHgPPKjMVzHZFeeFy1nqeiFD9zK8M0NmgD
         Y0r/TSWSqzi3HgKucIIohsp5lgQ097fY3/KnHoBYuSvHHKYaC0Z5+36vDl8/bPMBUMir
         LqQw==
X-Forwarded-Encrypted: i=1; AHgh+RoztY8jhRWnxGF39Fo3Qoqlx4F/T68TXgDXRZBlEF26ldksdI28Y6sD+vq34CKOy8JKiY/sk/SWPZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwV34I783HT6PLyDeMX7BS5vnIATl/ZLdNKoeEI/8K/zCqwGu9
	G4ZAIjopsGlMyaID4G1qKfkbYOJ8RJnPlKsdIP9mvuPXMg3+v1MCQ9XYvoXoxSidvF9RPSr5b/I
	aVns/tkHhOyu2LDEsJDNW2e80hlQpeZ4=
X-Gm-Gg: AR+sD12fe7Ern7wkfMzbWamnmBFTjA2qVLm31KYDNiCGtxEd1S5h7pEpQ6dXNx6MKXR
	XG5pu1wv3S8f3KZW7Z7fswRoTcNDNeX/PIqUlZ9yap386L66bTRUbx8gdAeWXplk3bdKk3YtqJ7
	spC6dttG/E+Fn2CMV3UF5eNb5k5EOzeg3gDR8ISiE0oQ3v7nLpgAjP9bsbA5DKHJ56aohXoHPYU
	iWVCf7KVrmahSmV1m4iZt6zAo3Os8bRaGICkwF9jxJlEJHzfWtzDC4lqeLe2A==
X-Received: by 2002:a05:6a21:4784:b0:3c3:990b:2292 with SMTP id
 adf61e73a8af0-3c67dfe6723mr2903792637.57.1785012916705; Sat, 25 Jul 2026
 13:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-af-alg-harden-v1-2-c76755c3a5c5@gmail.com>
 <20260603133312.12848-1-freude@linux.ibm.com> <amOGWwdjnJqyxH5L@codewreck.org>
 <20260724160034.GB2032@sol> <amOTjPW__CNZui3_@codewreck.org>
In-Reply-To: <amOTjPW__CNZui3_@codewreck.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 25 Jul 2026 22:55:03 +0200
X-Gm-Features: AUfX_myV9AV5bwxaPxDCds8CpJSSwUUfrEfnR7d5D_zQ_thbtzqC3K-k805u5U8
Message-ID: <CAFLxGvy+ec3nQLrQtwFZgGELhT2pKBDnHdD0pMvEGh-Mf3rjgQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] AF_ALG: Drop support for off-CPU cryptography
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: Eric Biggers <ebiggers@kernel.org>, demiobenour@gmail.com, 
	Harald Freudenberger <freude@linux.ibm.com>, acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ardb@kernel.org, axboe@kernel.dk, 
	corbet@lwn.net, davem@davemloft.net, edumazet@google.com, 
	herbert@gondor.apana.org.au, horms@kernel.org, io-uring@vger.kernel.org, 
	irogers@google.com, james.clark@linaro.org, jolsa@kernel.org, kuba@kernel.org, 
	kuniyu@google.com, linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, namhyung@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, peterz@infradead.org, 
	skhan@linuxfoundation.org, willemb@google.com, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 6:41=E2=80=AFPM Dominique Martinet
<asmadeus@codewreck.org> wrote:
> > There's no "tk(cbc(aes))" algorithm in the upstream kernel.  So, it's
> > not possible that this ever worked with upstream.  Given that, there's
> > no regression in upstream for this program, and it wouldn't be
> > appropriate to consider a sysctl knob in upstream at this time.
>
> Bleh, you are correct, it's an NXP patch in
> drivers/crypto/caam/caamalg.c that they've been carrying in their
> tree(s) since 2018[1] and has apparently never been upstreamed...
> [1] https://github.com/nxp-imx/linux-imx/commit/6868c9e49c1854028fb46022d=
aac3b1b10ca2c70
>
> Sorry for not having checked, I was hoping for better.
> (I should be used to it by now...)

Sorry for joining the party so late, you're killing AF_ALG faster than
I can follow all the mails.
Speaking of CAAM, there is a legit usecase which exists mainline. No
vendor patches needed.

You can create a CAAM BLOB (a generated and sealed key) using the
trusted keys subsystem and use this BLOB
later in AF_ALG to perform AES with a key invisible to userspace.

e.g.
kid=3D$(keyctl add trusted mykey "new 32 pk" @s)
keyctl print $kid | xxd -r -p > blob.bin
Then just create a caam_pkey_info in userspace and feed it into AF_ALG
and perform AES with it.

So, pretty please,  if you kill AF_ALG and all this, offer some way to
achieve the same in userspace.

-
Thanks,
//richard
