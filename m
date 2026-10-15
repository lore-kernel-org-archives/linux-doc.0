Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E27522EF0
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071309; cv=pass; b=TtuMe9Zd4tvIcvWWg7n3pz2J0siYAxYEA6pb7JV9CBl0C6Xnxx34BvMH0WeKvgwcgChcJT+xzHhMAz/7SDskhtgP+NrP9CtdVYSXe6ymMkO7BYAIdt90+CMrP3IR0VvcsVyUKgHNhLQX128RMi4e3t0NXBQN4QEpaKhQ+WUvQZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071309; c=relaxed/simple;
	bh=n6somPboGLO5GGdI2pdHi8ID2iHiXrA6b6ac7+gvryM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgNApP40JB5P3MUByCHC927Nh4IjZ/X1vTqQ8MiiQsKJHZeGb/tuzJYSo0ao0DNdW6rf72ZaIKccJAyFx8nKT1YQbVvMnIbTc/rxpfjxpqSfQwtPLI3QWx8KA1dxSnCdBPo4118k6fsUTtY4LQF/QDWvLRdFY5r5QUJsU2MZEXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSf5bRjP; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSf5bRjP"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91986c5cb75so16554806d6.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 06:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071307; cv=none;
        d=google.com; s=arc-20260327;
        b=oKPWS8Ge5ASyWFelJEPPGbUDtgS3xpVwGrnnAemxg5T83bOw/eLk92CZzPf5CzutS4
         v9XXHiA4cNCUIIdKdpVIYSlJymuFf4U+KncmT7JLsqSx+0HYifjwHVKrU6gtStzKV1jz
         45AiZ118OvLaPTO+DKMcksUugKalDZDMhVyuwVdw790rPHY0Dd6jpfviDivxs3ndFArk
         ix/6eCwOSES0r3+A9ElJU2HZrM05ZCkVpbxyccXqkubl4PQFoYt7Xnyth6ZK/qGnlhUp
         h+BbWvZuG2y/KLfwRZzs6DG4pWI66nOjpOpAEymX/N3Dvwhy0qLe0RO/U2Ts07SsXL+G
         BZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n6somPboGLO5GGdI2pdHi8ID2iHiXrA6b6ac7+gvryM=;
        fh=A1YGztaTmA9W07sevnv4f1XlLTXm/MoctbEU7Pf2v0E=;
        b=JoerTEP1zOhb73T9ldrHrg33WBERZ6xOiEX64veU0zGu6hsBv8xg02I5o+3YnrVXmT
         5vEq55akEzm2wzOT0ZBtrnbEjHXsK2jTKnLCUcGaPXOr9RJhGKu/v70y1+9RelmQliQL
         Zwp5qFXdhUREiKaLrN3IvDiI8JJkMQvoFfaHk4gEKFX7BmgX/4B+RRtTVn583f4tAle3
         5l/l+iimKnZGcbbDuR5/t0nzhOhBFkFX/XWXOH20VkQTqOhllK3fm/YmaMbL3LHm3zrY
         d+ruHXLrgDKCwKcWlLlCqHpW0EPc6s+UZZ2UG1Aty4D7aGeP4FLvMmZo77wfLCHDmf8p
         XI4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071307; x=1792676107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n6somPboGLO5GGdI2pdHi8ID2iHiXrA6b6ac7+gvryM=;
        b=nSf5bRjPUND40qMFK11yz+WvkG4qB9h9inGvj+bwfGnqzNioh1VOjamsn46JtZA7wC
         zfw0rQf71E/Q8zvryEcVeUpikgs+RYu7n4jvq/v2paOimvYECBrIsRGDTjDVHhB7+Ut0
         wIyJ2Ps9zDHfGXtitJyAeZXrBUtIlE7ax4qI9HEi5r5ghlWJ6k24dYaLJ5tO8XPgamff
         SaV3pGn/Mw3q70SoqmpKth+pA935lEXdXTd2jH0ZKO4A20wyVwrjOep9OXPY35ACXYTG
         vxomqDCova59NloRR5WCRW0lFQTai6C84VSuln6tnXHDS9RJ3xChtX+7NtNjHoCSidGb
         bkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071307; x=1792676107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6somPboGLO5GGdI2pdHi8ID2iHiXrA6b6ac7+gvryM=;
        b=XfVkdWd35US9Mc2bsNFd6PRJOVqYmPIg5RvXtn/PkxsJwatRyFbpuS6XXIUn8qRCuS
         gPBAeDVZnGZGS9N7P3nujmATICjeGXiX+HbKW7d3IHIbYc1Tn26Qb2GJK77u7gB4hZ1D
         1r+J3OfcCF5dLAQET3tSg+bPGetaDuQkhq/o/+Y0S9mb4KtLH8V+Ty9UrzhFARS0Xpt/
         sgW+4TsHg91zX0OJ2yHf8R2TMaFJlRWmCFo2JMtXHIFZjHG0wu9VNu+6tiDOwjhAVVCO
         UIk8Uf2aQbaCLHeJgOd6nxVb/PoYY7xP9U/J5vqdt7/TsrYOrPvWADYL+5I8q9PpG9tt
         LzwA==
X-Forwarded-Encrypted: i=1; AKwUvBy5m2ceOhuvsCvkCEwOptAqQmLlqyfmwaO2NK/ZetMkbioNozXaU6V0DoSqNEdEueu5hkVRQGN60ak=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiEtEhNVEtMDqiahB5T5EwCtdC81lEkBU8TSvRVIt6RK3Ogayk
	VPfCKsME9hYPizdL9PhBbxjmR2xGlyVcPU226oWd+cWaS9LE7JKEZal5QJpTqFV6CCHnlANJW92
	xXJJUoYM9FFKmBwIG0Faz2Lw9PUSYHoU=
X-Gm-Gg: AYBFou31YRKGe7HQYwn/3bWGco6qUO+HmV3gPpfGLsLC/TZi5mLQ4BF5SLu1t9wtH1N
	iHxovwZJldtoone1mN2dxq/8Ke557XdfjFt7zBUAM28dl7yc8BIrwyhttHvKJAXnURC4Ua53Z2/
	4oysoQwKiH89IlpKtLVjP2Vbv33CVKJDqPeliB0Ex7KXBrJhsF7SIg9BdV5jM75pH63v+SG8Vff
	UZQKOKrIA6dBRZCM1T1U+Pl8tUc2VFTp3IgTG/4YHrJWZhKbwJLrDOBI8H3KqvShvv8nBZvmQRX
	/ei6Vy3BFSxWDdQsJdNRYb9GzU7zsgMl9onKZoVRC0J0JO5HkmI3LRJjMqtxWnPQ4qf2jYFEduB
	RjFm3wOWvLgbdWJFXYWB1p66aM8WbWUBEuYOPE5FicKPEEW7x5Y1vot/VbAzu6q5vfKHCaw==
X-Received: by 2002:ad4:576a:0:b0:917:8752:8214 with SMTP id
 6a1803df08f44-91b5532f60bmr316865156d6.1.1792071307041; Thu, 15 Oct 2026
 06:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014173814.103903-1-igorgphotoarte@gmail.com>
In-Reply-To: <20261014173814.103903-1-igorgphotoarte@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 15 Oct 2026 10:34:55 -0300
X-Gm-Features: AclHuK-mZ1kO57TmCWayeXLT4d0-1hnfCy0AkRWUCzWDdY4SG8vnio0FpdbYMvA
Message-ID: <CAMAsx6dQ_pOOQNEPPVHHYo36-ov6o0U+Hj7C2CVf2X6aeXNL6Q@mail.gmail.com>
Subject: Re: [PATCH v4] docs: pt_BR: process: translate userspace debugging guide
To: Igor Giamoniano <igorgphotoarte@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 14 de out. de 2026 =C3=A0s 14:38, Igor Giamoniano
<igorgphotoarte@gmail.com> escreveu:
>
> Translate the userspace debugging guide into Brazilian Portuguese, so
> that pt_BR readers have access to the overview of the tools available
> for debugging the kernel from userspace: dynamic debug, ftrace, the
> perf family and the kernel panic analysis tools.
>
> Add the new document to the toctree of the pt_BR debugging index and
> make the index point to the translated file. Cross-references to
> documents that have no pt_BR translation yet still point to their
> English originals, so that no dangling references are created.
>
> Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
> ---
Hi Igor,

Thanks for the patch and for addressing all the review comments. v4
applies cleanly on docs-next, builds with no new warnings, and the
translation reads well.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
