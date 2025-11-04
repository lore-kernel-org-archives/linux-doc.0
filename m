Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9339325717
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262952; cv=none; b=n8sk0VzC4djIxp0LMp4a7T0Om6QKpQwSHP0UAv7J8rGrgzPfL6+Ot9Hu8WPgWl8K/UfXRwPJuuTvUwaEIKi4/tTPzMiE5pu2/fI+L/yJ/POkmJksGouZWnvN/agxp6AKYuvVEYc2rvkP2cZVnOx47V8L5ZSOMlVh1xASYP6odJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262952; c=relaxed/simple;
	bh=jz4XbMEhT14ABokNLSyNocUWmIjvQFrqSNdxYOhl118=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqN3/ufUpt3h0vfaoshbYUEL+okK9W9bHEZj03HLj78ONKa8yeK9ARX/L+9iJSgkLT/dDmT1iJ2apT4H3wnKTlFT48p3kezZxRS0YlHIrrkqugycoH9tQjz1nI4LezAQQwhFyiTHwmukfjDN+wFrNPQBxTTa/AkycxGeWmUgZ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9352980a4f2so947851241.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 05:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762262947; x=1762867747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYDUlHzikfVS+CmiS/PszA+brPtjo5Wdl3Z2oI+5wg4=;
        b=XAL483xRDKVHj/B6ccO6AnpaO8l0dhNRz1EfEDmggo5tA3/fU5NJtWF9XgS9287khp
         5nRCFzgEPsk/LdaV53Xn8bqUJeTL741T8dT4WTN4RmjYqZUNPo/N0LY63mzt27xOj/ME
         4PTVexKA1A9LT2z8ChFxMOpVJeNOsT9v3N2JoOcoS3EmDMd8Bl9oLsgVnGxVZ4+QboTC
         ZVgjHrTe9WtwozN1xjTAZe5PFc1JmLYrn5qgLZPP/PdVddDyDa2VV2FvmAmbOxFIOoeW
         Nz9IH039RPwVcV8Q9VhyiVA2qCB2TG0CDSHQkBCzw6EkN8FR+WBx2VkS2t8dUOpo0Mcu
         2kJg==
X-Forwarded-Encrypted: i=1; AJvYcCXpwhfOVuZOklq63NwWlFq/f9Ue/+mnOXm2eHEUVROyrS38brHIuRXwqQ5wGXUxE1Ky3yo9L9pVyhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/pfrTp7w8omcB4aS2udpIICY4N7ARI9xULbCLm1GxUDvhXiE
	E4JnHJkzEO+wcXiQh/PwGYMNxjpgrAiwoWTQEVw7ayRZSBYAdqtSQ80yqy4FWFhA
X-Gm-Gg: ASbGncteQ2FzHSjI38wGyRcQIb15n72upbWZVXFMgudhDwB5+Eb0SF8RTsx+/pCgkO/
	zFBYE8yB0ceNGGk8XdAeyjnBZaAiwgazF8pYDF1GCtf89cSfJ/R/yuUP9Scn9qSewlrl9+V4P03
	jH15QBCtHwWsMKDKJRfHEJ6sjuOVqaU/6lIMo5nO21nK4dseLlShmT4nSEmsvzeglHzg1mmPydF
	20JCnhDuMx7/yydH3gdwqqvrCrsN1TEw98Jd5vnGwNAzM3wspgZIeVhL2QJQ6nvubjP2u4kZ/Oj
	lPIaqOwMkpO8+xiTpgp7VnZedx8ChRtiwMC3xdR3yEp3Wt/snrmQKJR7bh1cui6e7qaSdnkfQJd
	WhGus+aEY44x2DkgwnZHgDaL7PtGXGY/qesXEb09Ip6TT4plUkKtx4f7QQ+BkXDLYWvsDY1YhyL
	Baa6xGcO4RrrLAQA+pduk2MYodWBBcG7DgcMRnnOGSprw8TwCWrx2f
X-Google-Smtp-Source: AGHT+IFNCIwvYCPjyhPVc9e/BmVQBZYctZVOgA6xDYNzXDRtSRTAZQmnl34gQuBNhWWf4kJquQZJ3A==
X-Received: by 2002:a05:6102:cd2:b0:5db:e64b:f68c with SMTP id ada2fe7eead31-5dbe64bfc99mr2267317137.33.1762262947190;
        Tue, 04 Nov 2025 05:29:07 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dd83e29f1dsm138143137.13.2025.11.04.05.29.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 05:29:06 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-557bf688086so964917e0c.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 05:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmtkn3muo0+c060C8CnPpWDo3EViUmYhXXr29XmOS0ndMslX09FoTIvhyWea38zQiN8fbwfgAx6ZE=@vger.kernel.org
X-Received: by 2002:a05:6102:4409:b0:5db:ecdd:1819 with SMTP id
 ada2fe7eead31-5dbecdd1f41mr1520007137.4.1762262945679; Tue, 04 Nov 2025
 05:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104-aheev-checkpatch-uninitialized-free-v3-1-d94ccef4917a@gmail.com>
In-Reply-To: <20251104-aheev-checkpatch-uninitialized-free-v3-1-d94ccef4917a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 14:28:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+12MoAGNHC9kf==Bt0cLuJ39Fs+W61DN67sE_p-u=og@mail.gmail.com>
X-Gm-Features: AWmQ_blcNEGb9JhXjFZhCY93PMFoseFIULDniUnWfKSfhj8iZuZ5UaoNxtqoLrc
Message-ID: <CAMuHMdV+12MoAGNHC9kf==Bt0cLuJ39Fs+W61DN67sE_p-u=og@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] checkpatch: add uninitialized pointer with
 __free attribute check
To: Ally Heev <allyheev@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Hunter <david.hunter.linux@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-pm <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Ally,

On Tue, 4 Nov 2025 at 10:58, Ally Heev <allyheev@gmail.com> wrote:
> uninitialized pointers with __free attribute can cause undefined
> behaviour as the memory allocated to the pointer is freed
> automatically when the pointer goes out of scope.
> add check in checkpatch to detect such issues
>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Link: https://lore.kernel.org/all/8a4c0b43-cf63-400d-b33d-d9c447b7e0b9@suswa.mountain/
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Ally Heev <allyheev@gmail.com>

Thanks for your patch!

> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -1009,6 +1009,11 @@ Functions and Variables
>
>        return bar;
>
> +  **UNINITIALIZED_PTR_WITH_FREE**
> +    Pointers with __free attribute should be initialized. Not doing so
> +    may lead to undefined behavior as the memory allocated (garbage,
> +    in case not initialized) to the pointer is freed automatically
> +    when the pointer goes out of scope.

I think this is misleading, and can be improved: if the pointer is
uninitialized, no memory was allocated?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
