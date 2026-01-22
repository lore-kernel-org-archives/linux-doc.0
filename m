Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65637AA8E
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 18:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106489; cv=pass; b=MlIcpyZIF82vSPYkhLm/qXGwuOzCm+yiNA9EZ/i2d5yrUhYGAUeTMJ2LzqQfeZHnblbeTgsajZQhrVpuPZ6bMS4sbOh7l/VAr/JViuz2+//bu+g+alvlJUlS4vZKHxG5CpxtgDEhb/92OyyatTaVtaIseVkBaiWiw6euvE4Oq5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106489; c=relaxed/simple;
	bh=mouF04Fjg8ir5c/+5/uLoczeIu6+gVBtr+E4eejz/fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/alGWW0bPE6x6hvNQ+uxcKigQ5I9IpzyEOyjZjcT+C1zXY7ANjNYOCiMfITJSWYtRBJmTUy8YT5PpQwKkQ+4QS7EH5Qn/BeBud6if2ezF/NlcAZxAu5hKhMaTjBWpiab2ccYpTyTd6lb8NuZ6dMPmR7SOJor/PQ+m7uDjTag94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=AsLRqZA7; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="AsLRqZA7"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso2719240a12.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 10:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769106475; cv=none;
        d=google.com; s=arc-20240605;
        b=Uvy/ZM1NVyBBHgSzIpXoFBLPPQOhatpi+FVbeHD3Bn8tThZA5FUlnViTRZX7wkBNZZ
         zgEBlmaddjReGN8HzEK1wnZZirNZd9pitKMbYVdpuoVt9lW3pL2l2PGq94iU96DDF4KS
         8qpEq4RCZQaYk9A9VkpGfsIskaAXDZ7HRe7V5ZSg6kCad658YHbU27bt2ZCBDnLqMcZO
         AIl48oYs3uJAXF9qaqhaKOWxFRd0MAj1zhkYsmkFczKJxZThxr7g0KwGT6jUVzKWB1o4
         U0vXMyRrwUSzylBmaTHGqhhTz0q+nuI5vyI0XbrWUQd23WLtLt904ullSthus3w+tFeP
         MoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mouF04Fjg8ir5c/+5/uLoczeIu6+gVBtr+E4eejz/fc=;
        fh=WpCldiZJeHq4KeLidP5u0418tlMwbYsAHsFxXOylIM4=;
        b=TYRA6rGz/jGzovkrGxqn5g0PaZorBP8fnN5W7P8IuH52XLqrPOkHu+84TWvqENvJ36
         zu+LwcFozbxOPfhlxcEw54FDSHhxMmV32CGY55LrNtvMDb5EmcwAc3Y5M74WTp8hMSiM
         qmRKEVt5VdG310JNPmi0/PaS+LfxjliQp7fZpT6Dx1fAU5/sEyDNLN86UHuLK3l2Licb
         mGB/TkQi+F28etJcsz+Hwy2ZT15DSxU3cye32hM4/VIOSLrGjVozv+MuUXNGKUhJwF6V
         /yPQqLLLS+FoiK+IAPIZUY+ofggJtrE4ZLalp6XU1KCGNHhrZx9d+suKUiZr+I+4Lcm6
         hyZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1769106475; x=1769711275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mouF04Fjg8ir5c/+5/uLoczeIu6+gVBtr+E4eejz/fc=;
        b=AsLRqZA7j9j3Hhvt9hFhSWXfWhwbfRpwcB4HEj9xsvUp8u8h2ND5oMm3VcPEZVSTGd
         WAL6hXYs1+ClXPvK+BCMfYhtYIlL280a1LyVrSoInp4HLrFfC79bwaV1YiyBbWmdUtzP
         bIOo9DIx6MP+wVYdCJXkOmkC8LA9dHv7YkP5BFA5fbnM92gnqtkBbr14Qv6UKCuY6LJE
         otyx3CNBtHVuh9Idh7YUDxR/Jz4dsgkTjkU/jSJ8BiqGcrL56l53fmfWL2yyNJIyS917
         WozI0jWG77q4gJVbxQC+n1JXox3j5voA6D4VzVS90ksUUkiKgYpufNMuI02OUbNNJ7b0
         uJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106475; x=1769711275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mouF04Fjg8ir5c/+5/uLoczeIu6+gVBtr+E4eejz/fc=;
        b=DnNjwlOWh8COXrfh/90QHnl/xjujD5TN5j0Pxw8s3HTeVirlXQnUUkmjEIa+SK1jzq
         yHx4R09azNkFl8J3Ux95QwuIJm17N8CaPCZi8jZ59d+FcrrLEcYijsz4rG1CziHGqj7T
         qk5H5Q1Pfzb0Zr/Aq1CmfzsMFJ+k9Ekajrj41oCH7tMDawC1v/jY2KKoxlnORVq2l3Mp
         /uJX/Ch5W1ftgROSaM0r1r67SgLi3O3K5nhDMK0YTErdQ9YpUZv4lpQAZm05jEyB7zm8
         toU2Oi7Oxqn3slZAoOKG1gOgDJXezGcw64lZJSEyc0WiPjSkjtaZWNt6fH1OC6mhdrsu
         aATA==
X-Forwarded-Encrypted: i=1; AJvYcCXWJ0FaW7MmN7u6lN+N/4bCRgvEkC+SkNug7WqhzXULu/ls/pNAsUvhRVl3cRR0jPqcUkPl/s1hkbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdsVKjTkyxCkmkJFzOrgNk0PRCIX3yADzdS0LkAK5PDb+WWQlZ
	Sy5IJFDYDs0aPZBsWZ2fA+I//5J++PAtwkoJe83x9Ks0Rl80QZNfVG/vtzncAEK1mK/ht92tMa5
	7P5zxycf2HbbZEGExNtVZLCHpgC2MfSdkZQujel5qmA==
X-Gm-Gg: AZuq6aKuoI2AwDo83fkCGfl7+HSHl5h3O/drJf9FIYQuHjh2rqf0dL+Fjr8VtYAeoZS
	yGZ/b44PaaHKJC4smvU43BJIb0t2Kk+ViLjSQIrsQG6/yME1LCXUi6aMmy3Gzlv5ph/76HCW8YL
	kgx8JoyQw0pxzu/sxDz0ZCkUxwPHhjK5OgYHETDEqF3wXRB4WN5T9LzsEbIYSJL4YO5J14CcUO1
	D49xy9jl5C4SCpryDMfLZZpSZmikS8isKM0D4hAQqK1vc1wHOWi50enboOkeQBlvEgopvs3ppax
	zyFUGu2LeemXqpGz4MFwD5YuxQ==
X-Received: by 2002:a17:907:787:b0:b87:bb45:bd5c with SMTP id
 a640c23a62f3a-b885aeea0demr12601766b.58.1769106475582; Thu, 22 Jan 2026
 10:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105165839.285270-1-rppt@kernel.org> <20260105165839.285270-4-rppt@kernel.org>
In-Reply-To: <20260105165839.285270-4-rppt@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Jan 2026 13:27:19 -0500
X-Gm-Features: AZwV_Qh5OQxnhkP1BE91ywGY4oJqPabhz38UybbAGCSh0mnJSMFxpX6QR-TTRaM
Message-ID: <CA+CK2bBzv4mLEmFSQszHdcO9x+YJ+UA001KNvS2of8o_Wa6itA@mail.gmail.com>
Subject: Re: [PATCH 3/6] kho: docs: combine concepts and FDT documentation
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Jason Miu <jasonmiu@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:58=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Currently index.rst in KHO documentation looks empty and sad as it only
> contains links to "Kexec Handover Concepts" and "KHO FDT" chapters.
>
> Inline contents of these chapters into index.rst to provide a single
> coherent chapter describing KHO.
>
> While on it, drop parts of the KHO FDT description that will be supersede=
d
> by addition of KHO ABI documentation.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
