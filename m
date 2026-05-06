Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F3345CAA
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070848; cv=pass; b=TuNbSUkN7epKCha8jobWX5foV4h+iWAv1GClKJeA5I47nn2nKq60qIhzmDS94RmIOZ0RmixFiyqz1upBlkAhmrWI3fe2MvGON4vTYMAO/92bake+2+BDrumQuZNNheR9iBroBkhbe9Bc6/uhiUDgenYKH35LwADnjfaGzZ2WHxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070848; c=relaxed/simple;
	bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXJq4YDUdi21dpWhnaWBaw/8D5NNzHFMjeDIMVWHMAklaD02F+TxPG7Az5FaxkPFF9Q/Ykf57gkcK4e2bjOGULU2asoHVxpQIogrmfRin3v716NxJr2HQbT7SsDWIwqIhP90Ag7n0QQgfycShBvtS9e1drv3WHaCKEGsX4/j/N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNwSmzvK; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNwSmzvK"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-679f6ee3fb0so2570191eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 05:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778070846; cv=none;
        d=google.com; s=arc-20240605;
        b=emLXfkDjImJNFq6NK6pBx5ktmBFMVHuKQc6XmCkQgV+kQSwS1tESUosHvB9ukOGIRL
         UhcYoj5U+9lgygmPaoDMy5aRZBi+tbGE7rkGsJKlxuse7obZ+9GXKLa/aMg56O5VBHLD
         gA4KYg1aBthbs+RnDCrMzijdPXUszKmdECLhCgjMlxhkG9FTnbrfDRY4tZ2t2pg7pzPl
         /6QxpJ3bpCcrtnkygMxHVJDERFHq4VIhxypncSHTecna7ZOuHkX6/n+9vI/4aX2Z/hOx
         pDKBXq+eIsd4DyLozKnlGlyZLbh3MbLoexo7wNYD9PysJJfdT+618vW08b0VedDseSJt
         6VOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        fh=icDSYQmnPy9aYV44MjLptuIjF4FN1EXMcbKO78ruTwY=;
        b=fdf0xhAPWccW/fVOvl0daSHyiLYpYWy+/IriFtxRWZgHWSbqINHwoX4aKMlLoo2m3d
         IRdB1CuYtsn+Ob+dmDZPsMZDvKAKheOPvLEFIAOyG2yNbPrP2cV9uBkENjFwOi1ezWAS
         Rn/dBvulzRYEHt0nZl3PCTl5Vwl02wLvkuPLgA2icgDMMrOAewzrSeFuKLdvBoj3GU5z
         HPdb1q4BjYXBxWDHlXgr7Ky/FmSpt++6sZ1KzwAY8PJ5jXaWxQDOQ2VdMHUwrO8Prma2
         GAIHfkRPjwiSewQX66jmcTmF3WznjC7XSdvYWWJF/fPIjb6xHNugAQhTU/blN2j3xR8f
         d4MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778070846; x=1778675646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        b=sNwSmzvKCZbXiIF99yD6NQtSo0UvmJY9nNHv4s9MZvIT4GxvdmPSB1CvzxPAwfNjqX
         19DP4zdMmfhl2yJblz041NJb85RUGMnZRrinvic1M5xNHAA+V2hEZlDd62syc3iyeX1O
         zmagvw2HQBahaLZFbsJ8/a1w9VANOX68V2x9Nvgomy2My3clqPbjvr+89IAMWMpKbffF
         qwivhlKvGvG2OJynxnDaiBtLv/E1EgY4kHY1yPIYE7aUy0rEXcPGCgWrS81NaFPb42V9
         76P8S41QxxD/hLxr/0qSR7S6Y27Vny3f+BN0N8QYr22S0gZfxBbD4FIpyqn7ugjzKDZc
         NlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070846; x=1778675646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        b=tRzKTy6Ba495M7NjFvPg5cQhb4zQyemwcaxekQ9WOs7YbUS+sn985Qs+hCzB8bDun1
         RsETuPmNe3aoAFRmhbMjqrzdeDTdBTKtKEbnx50KaQ9O/ujARloMyAwGhQWyiEDA0yKk
         6oOF10ZhVuAuPM5lwr1LXaYxdURpEqiD/S/Vw9N5f2rBw4bLINZkL8BECK+RYU9vaB3T
         3z92fnRhs6IxvQLDvcaHQbm4hDJl15BsA4RZnLg2EnXQXOV3c9ByOnyMwd8HyMy1hh81
         3OUbbVpH+lG13tBOjiDHKaD4iG/OqK/mEprqOyr1S6T1JYv7Ez9ea1bhSmuhZQWp/+DF
         Gwdw==
X-Forwarded-Encrypted: i=1; AFNElJ9Jar77ds6IpQrIGD4NMsi+CItZOdpxfao8EbR/W7CL2XurY3uTXxI9rnqRkFoDQEw6ikCxZNb++H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqleFY5ZMdqZ6NS7iPn8ZvbTS7euy/HcbjWdIt9RX8hwUE3xQ
	GYEGax4+71U1bM1qG17exOc1Av2EQqkOMKHq6Nuk1T7ET0bbG65tBUUjx821avWHRwK08mSleYQ
	kN6Emg52NI3e97f+POPlpjxw6cqDTdMFunghE
X-Gm-Gg: AeBDieunlyBNL3JktCBZD71spSIzlPDejfY+OTelRjgZ7JEH894+ECsoHe/ftHTNaGx
	qeBpplgG2IHJfPB3cMcsHQA2MPujwP8u+Oz2Dab5AKdmVYvSIbsUxzxsprvWrG2b28t88RMgQZ8
	xlbsaJ1/TgHZ0yVX4qTwpND0OCqvvlo3kzpJ/Lp5+W380f3SKr0SVBi5/HDy5QQ9mmJPamZ/Brn
	zijOmvPERnJqE3Z+Jp2Or5Iyh7PUIh/WOvOmqBISNO+Zdmhter3N7lKgXaMBLYv3jubeSa8l4PB
	E3xS2WFXBynSiq4bNSgWUQ5MynDT4OWYSudIdhzA1sMID4UgKYs7FmD+Ce3YapltK+6Yu9+fj2W
	D5FHzOGsoxN94Xfw0t9s=
X-Received: by 2002:a05:6820:198e:b0:684:743e:86a6 with SMTP id
 006d021491bc7-69998cc6383mr1554293eaf.20.1778070845636; Wed, 06 May 2026
 05:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
 <afoMRMnSQUwk1eaN@levanger> <CAMAsx6cPfPVDBpL6wwHeqzWLqPwQB15pKgvgVu-Ni3Sjjkdf4w@mail.gmail.com>
 <20260506062128.GA322298@ax162>
In-Reply-To: <20260506062128.GA322298@ax162>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 6 May 2026 09:33:54 -0300
X-Gm-Features: AVHnY4Kqm0TmRbtoSmYSXiI54AO8i3XE18imVYZf5RenKY8Zy6KgZxL5067apnU
Message-ID: <CAMAsx6fDE8WFfhiRRe5CM=oxUhBPAnWD_DiGsY6mC76TPTgXMg@mail.gmail.com>
Subject: Re: [PATCH 01/14] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 3:21=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:

>
>> Thanks but I think I can just update the version number in this patch
>> when I send v2, as the update should happen atomically. If you patch it
>> separately, it might not be true depending on when my change is merged.
>
>> --
>> Cheers,
>> Nathan

Hi Nathan,

Thanks for your reply. I still needed to adjust the changes.rst file
for the Portuguese translation (pt_BR), as I found it was quite
outdated compared to the current English document.

Thanks,

Daniel Pereira
