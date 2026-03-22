Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48639221FDE
	for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 03:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774149641; cv=pass; b=UzFqSwlvFKayKB6OSIO5RI/t4skujYzi0K//QTzkJyF0mff6Q9qfu15NQ8sj+zt5I1jNas/Lzx8jSomSTnGHG18boostkaO2m1kxZ/u80GTHDxoOmY3eCCu9pBDz/asWoBtjwXZjlVoMARwiVOlnA8xhe4n9XlRQv/qZYSmJkTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774149641; c=relaxed/simple;
	bh=D/jXk1pI5cXw11B7dE5qYnkpodxoajS0naREmh8Tang=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEki1nHgbqzk0VHRvdFLWszvFPotCTT50QSJSmw98O53EiZL1nRz6KqoN9qKd9gvAR+pWmxr0J7rYVHeAiy68N7w/jDrMkoCr+0gqIx3TD9HruU4Sm8k6o4+n3UfiT9W2JrTfZXuDVIK/6MwgSSJNsI5h+GaSIBSNbf9ixi7P3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy+SnTzT; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy+SnTzT"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89c52ef3c2fso30780616d6.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 20:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774149639; cv=none;
        d=google.com; s=arc-20240605;
        b=gmk8cn9vFqhEukp1gApk02U1GQyDR+3N2O3ZcyzdEMs5GyZC4zjuhVr2RnBmDkas8T
         E9iW465RbyYVQsIVj1DsCvvH3O+h9IHZaaxSyfYY7k1AaxQc0+7qVMmLpx6xDUqw2t3w
         3e4saSgigNmh7CmRXK6YxfaB+zMYzY2yggAXSsUfv2YKrT8iMi6JD5sWIBSMPvlJMmlW
         DTgCPr5VSZmjGZUwfu6Zkqd4+JakYEwB2gLLj3ahchZoDzjAJmPeJ4Pu64X5ygkJlP5S
         WiSeKzWWbcg7BEoYG5bz3EgVr5m9ncd1pb7KZdcJTiqgh+gyz1quEZpZKwJHdy3H/xEs
         WPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JuN3KmF+V3XuyVg+Ox3zokYqXtXUn8OU7JfRGLL9pOw=;
        fh=WfhSUNMEeTSgCODiWs4Xl1I1POTl83J5+S4jUrhBVDg=;
        b=KagzZtsDk9qXuL3U3Du1XW5OUicCNCpdffCyZS++yOO4FLe0bTzpl5KfjvV6ZSvKiH
         vdJZS2IglfdeUMzReJHGHgQ9NrjNOUAWK/PerH9Z8PgnF7yurHBbN4TZ9+rnCJmCRq54
         W0htnJRb5rIX0K566447YUjen4xg+RLowO91h45bRHRIuoHVwD0VYPrIYUKpGoxG56Yq
         42oNmy67Hl9YMSIYKke0GpYRg4S67A8qIqzHUjlXLekOj/hZP8xucq1i2VHXVFU3SLGk
         IEaiBYViZ+p0IxqvjPLya1GoEsBRkwOZQXLvbS7/uA/Yv/0WfPhy60meGuN0kKCcf4gD
         2ENQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774149639; x=1774754439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuN3KmF+V3XuyVg+Ox3zokYqXtXUn8OU7JfRGLL9pOw=;
        b=cy+SnTzT12rdFe52I1H6QnKGY58j2E2ZK5q1d1acOg3CJ29DSLcYpm5SRbSAa+mK3D
         SC9ie1gCLDIzH7PGWs5lJvl66fM55H8Pavl8RUTd8d/F/oz/IZoB2foEm5kbsQz1k5e2
         BE9ySdGSwy/j3K9na0ZR6yETuPJCE66hUEfBuxTAKjlR+Y5AMJGLZCeA3nc63AXOTpEs
         FG78RAAgs/SWKqpQ3QrSZtECv3UubABNKG5HXzM6kG/bmioyjDE9grwXi+8x21hjfFiq
         YPslOQ8a4Kl9g6WwxcxWUSmohQK9/fb2cfMmXFzAQ2CHLWr+X9dgfDPjO1hlGLuJwuKg
         c1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774149639; x=1774754439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JuN3KmF+V3XuyVg+Ox3zokYqXtXUn8OU7JfRGLL9pOw=;
        b=CY84DDoQv4bvPJr0/ocj/KdeGsWQxenRm8ZXiSGLzyvK4Nho4rPayEK/3qyh4zGeJX
         fHjulha7q8HRJFzA9X/Vj04wG8wiuMJLgeTDfhH1VVu8MkxK3V0K78hjD8U9Gjw6KAlV
         m2rZZdRFkX/Bsxcfy9FLCcDU0OVDJTgeec+1chAbmC7S5e7Nw1g8x2hTfEamLgIuEcOi
         5aCJ4gjctU56mVs26HLcShbw3l1Izt8XsgQCSBWN2UcBXf6niJUa0rdzKUd3qXClXWEv
         Ihts3vfR+wndUfTtnOmnoq4Z0/BEgb1xtSZIzLlGXjtJqwEpD0MRkZsTzCJeFqG69ZK8
         MQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbkzssd1KdvAsR+kvTWn80Rz64Uc3WlRiSU0vWHQmrJ9V6Mj02URuNqVKwyoItJfSxV5lYklV4+L4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkwuebWGVPCO4eWOPFlwRJfnVhVytDiDca4LWV9F54lbW2HDOv
	gXmQzaxKU7i2taRLNHDDTeb8vZoQBF27sNtUCgZpQ0XT6Gv/9kFkbL3Gy3FqTUMUAtQNF8YnxbX
	3PwhMvVwAZcsQiiKCjZvMwdVN4jlMfdw=
X-Gm-Gg: ATEYQzxxxZZL1nLGwPZBLM6X3NS9fSwnv3OEKcfrcUA/ofhSPu/2FvbzEDe82Owxg5a
	W7jxhUNWlLMbt6LOWPD7eSwstu0tx99/YRNQNorj+cqA7sD6qW1mMxwz+PDr/19PC7MAvCbvJcX
	tdXD7r0/EWhc5d9NiyJBkoDBdmU1Nbol7fbeIYoIGca6mh97mZsuM/RDnMJtBg2isnsEtFj1Y8G
	7QClE0N20GfnfkvhPDQYkHiWaci+IjYEK89s1N+S07pMIloQSWO5vkTBoBTlPTAeVolfwqTcliy
	iOKXPsDd
X-Received: by 2002:a05:6214:1bce:b0:89a:10d8:f9ca with SMTP id
 6a1803df08f44-89c859e84d5mr132297946d6.26.1774149639178; Sat, 21 Mar 2026
 20:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322031615.1524307-1-derekjohn.clark@gmail.com>
In-Reply-To: <20260322031615.1524307-1-derekjohn.clark@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 21 Mar 2026 20:20:28 -0700
X-Gm-Features: AaiRm51WFDkUJtKya_d2Hd7XzkBhvrWuYD4OyuVFWBTk5xib76q2ZKap24xbwmU
Message-ID: <CAFqHKTk54aN0c1SjjjEf33rbWuPWEfDpaKpDvmAPJ-2L1PNcwQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add OneXPlayer Configuration HID Driver
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, Lambert Fan <fanzhaoming@anopc.com>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 8:16=E2=80=AFPM Derek J. Clark
<derekjohn.clark@gmail.com> wrote:
>
> Adds an HID driver for OneXPlayer HID configuration devices. There are
> currently 2 generations of OneXPlayer HID protocol. The first generation
> (OneXPlayer F1 series) only provides an RGB control interface over HID.
> The Second generation (X1 mini series, G1 series, AOKZOE A1X) also
> includes a hardware level button mapping interface, as well as a
> "takeover" mode that was added by the ODM for debugging the button map.
> This takeover mode can be useful for exposing the M1 and M2 accessory
> buttons as unique inputs with some userspace tools that can consume it.
>
> Signed-off-by: Derel J. Clark <derekjohn.clark@gmail.com>
>
> Derek J. Clark (4):
>   HID: hid-oxp: Add OneXPlayer configuration driver
>   HID: hid-oxp: Add Second Generation RGB Control
>   HID: hid-oxp: Add Second Generation Takeover Mode
>   HID: hid-oxp: Add Button Mapping Interface
>
>  MAINTAINERS           |    6 +
>  drivers/hid/Kconfig   |   12 +
>  drivers/hid/Makefile  |    1 +
>  drivers/hid/hid-ids.h |    6 +
>  drivers/hid/hid-oxp.c | 1340 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 1365 insertions(+)
>  create mode 100644 drivers/hid/hid-oxp.c
>
> --
> 2.53.0
>

Note to everyone: I forgot to rebase to a clean for-next branch before
sending this so build bots will likely fail. I'll be sure to update
the source branch to the appropriate branch for v2 after a few days to
allow time for comments on the patch substance. Sorry about the extra
churn here.

Thanks,
Derek
