Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8851A3264FF
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042701; cv=none; b=lQ8wPOG2ZhfLFu44uJIDXgadMOODxi0P6hg1++Vtb0RT6eM+SiW9Fo3VesqUeU3uVw5Cmcs3CHF+eI0oNeLpX2L6vlaIcTwCZ83ZC2Xl9nKC+ujhtcjpUk2a1C1A3M3e6gmgdrdM2jMMNIBootkC9ub8+nE0z0fFlmJ2YuNh9Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042701; c=relaxed/simple;
	bh=U6STYFc1MSV2t8PYiQhu3Ra9FUPADWa8sNTge/8tcUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6IGvJiPX38NOR04dAMxMJezOJMiyrqbmHWFLzuxCmbNjPospTD4MaoWpArBF2mgBqv27qw7TNsYxsWr/A53kGd6CA+XfID5ykYmEyyMrg/uCDj3fn6daqyeW7BKqxPijqj7yqgUTZ1DACzeQgTqlDBuo/1uywo2U+B/kLl1N20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95697b46831so8688808241.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 01:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042699; x=1780647499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9alDc2PG7AUKpxvXQsiRJG2TJjrrZTsIKTRjeEkVAY=;
        b=ZeJ6FqJMQLxmutc3YyXz+vQVvwCWEow5xzgIX/Lhw8pT891chjXDgrbGCaHPrDOHxY
         o+KS/WjA9O+KiWFQsHemPdL9Hs/MsXP8w5fBo+EurNnIkC/+OuHEVIxYhaIQOEq+taer
         kuCmwIPtuGatgxm23+Grqtd64JCkfR41F3Cxbwrxzn+YeK+SNC/1O2p9gV52qmuGwXBk
         xhMogvVxHrrBJlS1QPW7+YwU8eYMgFdwjphE+j7OwZaXwOx7kyEZfsfwjtSVEgmgkpBe
         HX8S+Ob/6KyRRWqoyY3K4nV20zPdmWg0dziBI9LKHJ8QaJFKvBsItvwyElpgRn2QhU6z
         ksAA==
X-Forwarded-Encrypted: i=1; AFNElJ9F+T2VX/1BNxlAdmJAzzGjYES4guawLl1c9mHKBxWLOTFLeJ1DVjrF2FfXQDsqlskdSee5qU4yVLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSz7xXtJiyxTOJMJXzY+PA2zcC4NwzOe351AkD5H4SkES2PaYH
	zYKyTTnES/dmqVaeOqhfVsdcfU7/eTapXrYsBA/Y4njUzmCf8nGSovPOjrE5Jk1nJM4=
X-Gm-Gg: Acq92OFZSWlypgxA+S6DWSN9agYkYPZH/eT42Mawv0C27Tddsdm0Ma3p6V8pSRCz10o
	azkjCR2NVy1q3d1S77B2e/bNhbT59pWg5fUP3AE7q/AnE5S+vy3WyK8gQ5+3akeaC1LNN5DuQK1
	GgM51EPWPmZ4SWEMEYlqm5v6FGTKRRS8EdZ83i5UIyiaHtk1dR3Y/5Kj4jX3MjnKCcjdMev7Qm4
	pvvcDvC41bYsrCaMvw7U299dBB1SxuvhVjczihovFoBsFsOHwWUTR4LhV3ugDHG7Jb40WwK5r8V
	nol5poyvnsoN0bLOilXBM0maI1NFyDKmsyAr6Xkc7lMhFFy94dS59skKgfnGUqu4r8M1Lbu25D6
	GMl/hbQ3FI17iRt0bL7o281gI1RkIYnaQrBNdvm/ijxqTb/MADfhi7hm6rwrRCv2sp3YzRJ+ToM
	tMIhHz2dRbAifFDFNOddPTKZXCzkX78eBSIrncSy+kUxHmWF61nYhvqAOJosfz4hDcRyig4Tk=
X-Received: by 2002:a05:6102:3711:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6bf2b14b116mr644551137.4.1780042699603;
        Fri, 29 May 2026 01:18:19 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfa6da4d7bsm675787137.0.2026.05.29.01.18.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:18:19 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9639d7daff3so842539241.1
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 01:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ASzfMb4PBBIk7cb7WXgcWF+cvrl1u5OCUNXsrXHx/94bSZhp8KQROIk9noU4Ig/I+uPsxjXdajzc=@vger.kernel.org
X-Received: by 2002:a05:6102:3e1e:b0:631:3bbb:f23f with SMTP id
 ada2fe7eead31-6bf3dd78c59mr540627137.26.1780042698332; Fri, 29 May 2026
 01:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529081006.2019687-2-ukleinek@kernel.org>
In-Reply-To: <20260529081006.2019687-2-ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:18:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRuOxznAK3HP_GSGGv+RdkTxkWb5-6xwnUs50qQnbnUg@mail.gmail.com>
X-Gm-Features: AVHnY4JEuppnDpcn_tQwKsOIJi3aBauvsKBhjusGGgi5MxkY-7ZvXd-5Sqe46dE
Message-ID: <CAMuHMdVRuOxznAK3HP_GSGGv+RdkTxkWb5-6xwnUs50qQnbnUg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Fix syntax of kmalloc_objs example in
 coding style doc
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Manuel Ebner <manuelebner@mailbox.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 May 2026 at 10:13, Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> w=
rote:
> The first parameter should match the variable that the allocated memory
> is assigned to. Fix the example accordingly, the one for kmalloc_obj got
> it right already.
>
> Fixes: 7c6d969d5349 ("Documentation: adopt new coding style of type-aware=
 kmalloc-family")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
