Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579D3D6495
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297803; cv=none; b=iONj+JXrU0u4sukBcsk0qeT3PzHg+wXKeMeO1nOzqaWw/7IUybDtk9yZO9J1uc4NCTbMIjwOhysmTne5rHqa1/NXtpUcvYCa+Q+hCDB8ZEZPd7SVsA+Z+hHPAEoq3FC6dHj4D1EY3Bzli5gq2QgqF55vypeaQF1RM1HHkxDbjp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297803; c=relaxed/simple;
	bh=PMM7c97R/drK3ewQAF+DF/VgfVSeDOrJp7PFhAklFVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnSZilrzENPz8tpLK4mAkQNJ9Mtlx6FH7Vp4tzw47soJzV7NiNitehzB2JoI563Artg4+z8LThpvw9cuX9zu0mfzPr4SYmdCBVI4vj+D+qD/9WXr5839HCnz9W/zdS4Rhy/ASIZtzpBCcE7zTCElLAn2YPOmoZgEouUBnDzhKm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-566fe6a4ceeso125229e0c.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770297802; x=1770902602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iZaBgu/LE6ooqSSPYf4KAoNzDeR4fkN3eDnxP0i4eE=;
        b=WjBs5WUs5AgyOn9ZxuBEbLHdWes8eFdImsRkLWChT8fCWXsx+ljRjv3Y+S/sdCEzke
         vWHhp0/OI636onFgC7t1mefd7r+2KOzg/ZmM1vqS2xsICN1m20wfUXWSKXbsugqwG3l+
         KHhrgUKIJYb0TcYgazPrsjPwhOCi/+jwx6DWhMnvbQfEp4xLNiezkF6Lv+oaUK1d3uuL
         098b9OuxH2TUGzjLvMHP2+x8ojOUDgPIGz38TR67nrpdExuiepiDvKYRkcdxczKBAy80
         fJXD6VZfwfzeztE9ntPvcPN6R1ZVWiHe9aBr3937VYhPeUnZtrx0ORDTHsn9/HeBAQDQ
         Y9TQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6B7D5Dy3gV4XruDOfQ+OZTPyBlmyuCYeqycrc53Nu03UIZB5pRGLxIzvR+CkPFb0eXsHNyhHH+OI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHpIpp2OCkQEAd/a2ilsJbu2uY+PIcikNwypWJqlBh3V4Reqn0
	ZoH2g88G07Cmjf55Blp4bDJ5h1aqRla5zNZHoi/Cq6AmN1/ZM80UaNmGy16ZTgGn
X-Gm-Gg: AZuq6aIs8BfCQ+npFdXZaYpR8rSXpdHkco7DIexZb7N46HM2PMxj8t91fmxTOspbIEx
	hLgsnDTbi4fIQsPaB9OySAoNmkGpJjcdDHpikKM/7kDSlKgFPKSPxWJSuvEfNYlSUmCP1E+58nr
	HK0M6TVRCOkwx7XuIDEd1bPmG2KwXbCUGx1wi/KUXimnF0VLJGZc7hrmPCCYXLTgW5xTf0Iilal
	RVsK74Brr0eLFEZYtW3y10ykvlWhz4vaM3GKktWZh3vjipvUTTlXbk58TVKH9L1qGiBFGKCr9w/
	YoYXRN2wZnsx7X6Vz2t/MHSBSD7E5bCamPvPlJleh8NGyOjmSs4JXrCLuW7wq1qZCo3MQq6r6n0
	hm1KWwjxU42Y+0MQ+pRJTsEBk/TdJ4jelmusk7PHw355Ob1caHhStClqQ9aKN7ihdcEEF37RT4x
	18reikMPaJbS5Mnw7zw1wb4apCOvEGEUS6axYUgMpxXsbhnXIz
X-Received: by 2002:a05:6122:4587:b0:566:36b9:ef3d with SMTP id 71dfb90a1353d-566e815dc25mr2170845e0c.21.1770297801679;
        Thu, 05 Feb 2026 05:23:21 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-566e8227340sm2329852e0c.17.2026.02.05.05.23.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 05:23:21 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5fae36baefeso20270137.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:23:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+0/1CArF4+qqPXwOlEKWQg+zaFYR4qoYGcHFGAJWyuvxpbB0WLrnuPTxtUnGU5F+PWluvmjKpIAY=@vger.kernel.org
X-Received: by 2002:a05:6102:3f06:b0:5f5:4d9b:bd67 with SMTP id
 ada2fe7eead31-5f93948bf84mr1818118137.6.1770297800806; Thu, 05 Feb 2026
 05:23:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205115554.7795-1-amitabh@amidevlab.com>
In-Reply-To: <20260205115554.7795-1-amitabh@amidevlab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Feb 2026 14:23:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdBoXKg-7wDshMRGi05LiCOi62ETYzyV5HFbQXLinK6A@mail.gmail.com>
X-Gm-Features: AZwV_Qh0a5h_NT75kZDoyAvwWdJrS77Gn494KjkZ5QmAqdy8rvo7Eq26c4lI8IE
Message-ID: <CAMuHMdVdBoXKg-7wDshMRGi05LiCOi62ETYzyV5HFbQXLinK6A@mail.gmail.com>
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update kernel.org
 docs link
To: Amitabh Srivastava <amitabh@amidevlab.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Amitabh,

Thanks for your patch!

On Thu, 5 Feb 2026 at 13:09, Amitabh Srivastava <amitabh@amidevlab.com> wrote:
> Update http link to the documentation about how to add a kernel.org UID to
> the maintainer's key. Add missing SPDX-License-Identifier to fix a
> checkpatch warning.

The first sentence states the obvious, but does not explain the
rationale behind this change.  Why should it be changed?  Both the
old and the new URL work.

> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>

> --- a/Documentation/process/maintainer-pgp-guide.rst
> +++ b/Documentation/process/maintainer-pgp-guide.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  .. _pgpguide:
>
>  ===========================
> @@ -864,7 +866,7 @@ don't already have them)::
>  If you have a kernel.org account, then you should `add the kernel.org
>  UID to your key`_ to make WKD more useful to other kernel developers.
>
> -.. _`add the kernel.org UID to your key`: https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_pgp_key
> +.. _`add the kernel.org UID to your key`: https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
>
>  Web of Trust (WOT) vs. Trust on First Use (TOFU)
>  ------------------------------------------------

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
