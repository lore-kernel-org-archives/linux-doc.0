Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6463BBFC7
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021251; cv=pass; b=s3ByNryOiXV31X5xpvvveQJL4v52+6q+qMQjdNRSN9lZeMs+4Bkvf/BhgHzY9vQ1tRvat3xfAIYHN2PUWi0HsP8q0eiKL69rn52fsPTXfU81YwdguMGUFW/VNOy6IkB1KbQi2/9JMSlsyoYsQ7xxX8NKZrQwSJeoPPjWnREctZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021251; c=relaxed/simple;
	bh=CnE0JZcmqvEBiAZ90fg4GY2g6dG+y5C9xZqui1pBuJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axvFJjuGvyAjJKJTujhKHXK20zLEzTy5g9xHUeIVWsc2y7z9vGnaf3eYp0WyKXE8hMov5GnwCOZSdMNfQvR73IrczIRgDdh3UKyzpAXoP+LxbwRDyzJtC7SueKAd2XnqKkB+opge9Y7kGLHAv/E/5uofIn9PBHzmZm+5o35tBGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9RiiPhk; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9RiiPhk"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a78129ac98so849081fa.2
        for <linux-doc@vger.kernel.org>; Sat, 03 Oct 2026 02:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021248; cv=none;
        d=google.com; s=arc-20260327;
        b=EOEtW2SWHTFVLB5thWPO0UMEr67Kwq6kmgVQg/DBaIn1POkrI+iKNyxRCoSyLidIj5
         iQ/zAe4kOQlS7V2ID3vYwLQsfqBy7n68GBf5hOXPdYWgTaPilkQPehX6CPu7Y2daGydi
         71wYEx9Acka9lVeZqz0LmIaclVobYXuiV+MljFyYrhINtCYMG33SjcnlC3Gwdo0fiPmB
         A1Hl5BM57pQYLIVn1vMSD9H0nhv+kg+jYyBpwNRmUsY95Wzruia/Mfg57T3ZISL0ZcYR
         vcHO1EgSVJX5CrbQOTpmy6hVpQhTKWgICtNSJUx8kFnx6C2XTuyWKShKX7trdXVzDvT0
         F0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=59m585tSdpKgbYDacI2/yAe8XjAbCmVed3datZmQvfs=;
        fh=UmZAaq7BlhibZ6KPy1uYPJOaVgcGW145PsfBs1X+Z5E=;
        b=qhTAZ6HH7widB8pIPloJqAjRDvGYQTPIAHOUpcqru6JimBEZJjXVtYgnd0sq8xxMEy
         K8ntO7fysiMXauS60Dl/vtE30LcKdHPQfNISaNqLhflU1i6I5RX/v3w6VelIk8yCkqYc
         qUeXI6uOCLDJK8dx9GpTvLotKHWTO/rBXkVH7B6xvGDpE+B5NlbkGYWZzY78WJ8QDl/V
         gSsbTCPn4nVjC90rlwuLA5BZ5d4dfuCwIX2tujkguEBm/asrXhKUR6X/BUiEtCIpC7qK
         Qw/AKreoE0Uvg1SBQgLhKAVuY/Kw/24tdV7LIi4QdGpqKtSI2E0Y6RoXV0tvn6I7m2fZ
         bVFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791021248; x=1791626048; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59m585tSdpKgbYDacI2/yAe8XjAbCmVed3datZmQvfs=;
        b=S9RiiPhkA740TXlPgWhCO4ABWKPhDE5S3YYLbXzb6c3MK+CYUPGcyszhEG/Y+xKerW
         WbIjdODwAzRVikfkSnslRFySZ0XMm41XDxg4z8skVc9xD4GDmS/3AOzgnqZZ/NA370As
         9Z3JU+sV4jbXSPphUTZw4Dq+YDMbnzOdksYFlKXVRarLDi+NJ1+xCUpNHrZBj5W0Q+H7
         o3H3Wn8g9Jx6gwfxRlZlUi6/oZ5V0RNqc3F8+fNhz0DR+wbiniwX6p2hWtZNuvCPzp+g
         PSUaeBI8SbQbNAuan00BTF7GsnRnGPAlCUj1p5TjsSvRQaqlGZC6PDMbo535ydxHdv2N
         2U8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021248; x=1791626048;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59m585tSdpKgbYDacI2/yAe8XjAbCmVed3datZmQvfs=;
        b=JWVLwpeTgh8Rvgg7mh2CiNTFBpzl1tcztEfD4TRKsKn4mNBUB+EH7f1OH+Gkrtez/O
         hQzD2SETEXV7d4qCK2bkhQkKiLGeoVQ39+M+qWb0t71bQazOQpci9fLj1RQ2y105ZDAQ
         XgcwpvmYZ0kn5n8vyl7Y5+08dvn+byIORJxwFssRL8EZgFYRfyiU20mG5X+vIP1RysjK
         HtDPYNnlZud0AoH6O3a27oIbYaF+5Ik2aGXA+2dC2uEPlc0wgnrystxX3xieLnmKAjpr
         Oyr4xn1Q2wkFxFYuYMyLUs4bD1AECh3DLq90jsf0PgAKLqXj9nTr+9uAPZiQGGtc6iH2
         XjCA==
X-Forwarded-Encrypted: i=1; AKwUvBz8MR5uhQr6MVw64+qr7ahOW8R1J4yQAxjyp8xuTF2AlFwhm21VDFF7uKjorbLSRIs7Cz0aKh7IX8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsEapvdAmyKW1uSJBMUu2ZxzcfwresCelDmXUTEvlNiQaC/Wtu
	1SFyk9BqEgJhlajjJsxgW9qjgJqF7zfhKMFgp14e1NQsawd2jEFxoseQO/8GoUqHOPzCC1ueuJa
	R+agr1w1ywGnEuci7p/CRKRHBY3tY53o=
X-Gm-Gg: AYBFou3M9Al3WG6jlRKrnQZdS0t669aGTMkTm+z/Kmj1LBdkpZHyf5it2zxJi+tAuDB
	MJZDtr/Fp85PF4rIE1FFWKqQR9WEjOUWPXS7qkQlMou6UPDFPV5NUSLzDBiViYEUPllYfCtNq9n
	ZKp4RhW3BY9jHl/Z12owk5q7dAee8OM2VW6aq0wIEXpZHR8TC/nKmgvzYE7M4Wcq2Xoy1FKh7aa
	Ae6syG44DmyrR1LaM/zAOoq6WoOxAWnRH05PQFHBK7/bgmYiugpybOJYapcdUROyWnilaIP985s
	09+Uim90ZBWaOe1i2j6BLirMwGDTJJlu8UGo5s0KLVxPVbyG7MfrSzz6FL3PwIFprvw6nJNQxvy
	LOBt5bkqS1gwRomjJ+pFvXlNijUr0h73sZw0ZoQ==
X-Received: by 2002:a05:6512:a356:b0:5b8:ea1f:1225 with SMTP id
 2adb3069b0e04-5bb9380e793mr1239589e87.1.1791021247487; Sat, 03 Oct 2026
 02:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-2-chenyou910331@gmail.com> <ar_APS7UG25kXXYH@wyuan.org>
In-Reply-To: <ar_APS7UG25kXXYH@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 17:53:55 +0800
X-Gm-Features: AclHuK8TZRE0VVG543rmFerG4IkGYKm6eK50YeyZ_bRq_POnKgAP3J-x2u8ADoI
Message-ID: <CAKspUhKypHhegcJJ1DokVhUqLCBE+VaQkX4cMw+tt2L2p1FgYw@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs/zh_TW: move security-bugs to process/
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, si.yanteng@linux.dev, 
	srcres258@furdevs.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 02, 2026 at 10:31:25PM +0800, Weijie Yuan wrote:
> > The translation has only had mechanical changes since it was imported in
> > 2021, and the English document did not change between that import and
> > its move,
>
> Hmm, is it? What does "mechanical changes" means? Does it mean small
> changes like typos, format, and etc.?

Yes -- changes that did not touch the translated text itself: the
address updates in 2023, the tree-wide character conversion, and the
path updates that came with the English move.

> Maybe I got it wrong, but I noticed that the current version has quite a
> few new sections and additional content, though. Am I misunderstanding
> something?

Those all went in after the move. The window I meant is from the import
(July 2021) to the move (March 2023), and the English file has no
commits in it:

  $ git log --oneline --since=2021-07-29 --until=2023-03-05 -- \
        Documentation/admin-guide/security-bugs.rst
  $

The <N> commits since the move, including the new sections you noticed,
are exactly what checktransupdate.py reports against the 44ac5abac86b
baseline once this is applied. That is the point of the move: the
backlog becomes visible instead of "Cannot find the origin path".

I should have written "between the import and the move" more plainly;
as it stands it is easy to read as "since the import".

Thanks,
Chen-Yu
