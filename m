Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AE044E021
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785270685; cv=pass; b=NDHdQKrvkU35MT9XTf7nOURYKzjmixulD/I6XeAmqREA7zN7f+e4jqonOLlJiajQyWDSoKv1kyAR2YrNIi+KSmadx4i8zl2jet0ZwSuES8XWuYyXV+RomZEOMgoLP1C0yLw33u2Fj7YGbafX19rU9PGbE5bgxO0Becm4747HNkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785270685; c=relaxed/simple;
	bh=QBEZk28u8l0tC68ChRM3uPxPQzGaPC03GuBf5OSvxgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujzyBWbXTUBhBXpyGbgQe1FlQf4sLADZFUJZFkx5k7bveZXtGHqsMJWiGupstuTyCcpKrjtCZDLBumhG+rdy4NhsORPbIuENg97jtUt6ZbhJzM/0hpJ0Snc+EKioIeI6ez/XdWFztwiknB1JBPY4e9Nx5/BDU97uRpYMtJGTRYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fE//yhf9; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fE//yhf9"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c10e86e52so16831cf.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 13:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785270683; cv=none;
        d=google.com; s=arc-20260327;
        b=mrFx8PLVFLbxY8Luyf8cRtZ+VRt2MkRHTbSG7AIxQS6/bw+n6GJk+lS1kIE7naQuGW
         9ga4w4ARt8/N8+a9k4ybq5ZDDRux/PJDW6gqFzbneAuML3LCS6CjXSHm+bTcMPyTYJNc
         yJOCWVQghH4BQlt9c/v56fSv6DSfTlV4+JhuHWRBeMlWlZzTQSbrF4Da0fwhmW9dH4+W
         FUqUm0qiocxSKDYHdyH3TjIlyMciNpZeSz5hjHY6V3d8Z03sf48Fygf9Lb+Ldn5UG3b9
         ZnKV+aSlt2ZvpNcPY6XtH9dTjjJ5LffupZZ/HHVRZN62LXIKDPk/PtnHD9uRiXyo2Gi1
         /gwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gdrCD6x4jI++tlW4BafXvn0zPc1UaBDwNSYo1OXHEU=;
        fh=qSlbN6I5Gjd0JX1Ytc0T4HJPPCa6/ihGAN3trRi/k8o=;
        b=Py1ZXUccpnJBkX907NLha4dlhGl4U8644e1Oas9D7Hoqhba5R7dSD5fmBCNt9JCY+Y
         9HhYve2wXWZP1ACgLdNfbtCa5URsnRKJ531tAkLsYlXv3iveW4EHvkPMlLJBThiADnYf
         1v8NI5fDttRhhQ+9KADgx4Qj9xeafCSK89od/Aak8CVHiNB0xm4ISrcR8sl+jVZhxxCj
         9+yqkYv1Z/6f7L7WQiRo2/y9fYXtaaD3xqydRcQZjcAdO3a/z7WuT+tHtJ7LYKhWnj3p
         N4pV8pcMhPxxWYIstbGklR0NL7Vxh/tEYw7ucqCthGdp8Fo3PWDn/H98ZHYbBW8oG0+j
         gn9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785270683; x=1785875483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gdrCD6x4jI++tlW4BafXvn0zPc1UaBDwNSYo1OXHEU=;
        b=fE//yhf9i0aJqmbuCudy1D28oTXYUkKcqM2qhtdZJb16kmt1jDfsghqkchFmmM4KCe
         9BkZ5GVIPM3J7gYtbVEefT7PClH4VU7vco4h4WOmBrwHOCIQH4AZwlp9aryHYTdHXBW2
         I+SbV9vPHVftK58YSS5Hxz8E0Uk1jQGE+Zp4UO6kFEZP0hi+mGKHixnkEnu6Mnfcqoo9
         LQpdJvTgo67sMzjj+cR9BvsoTmTAhwxJPq9eh8/QLzwVbZuaBO602PBbFJUmIUM/76yS
         WP/rqLzbCEcb1YSU0bEvr758UV/yA4MieSXZHl8v9ecPcE9vvBPZlPbXsA4+wHAMC/H3
         MD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785270683; x=1785875483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gdrCD6x4jI++tlW4BafXvn0zPc1UaBDwNSYo1OXHEU=;
        b=DZlbWmXo9v4EnOZsBs5RAa8tkl/fQoIJJ3C0YBvcbQ0YeeifsCBmMFJKNxoBGAlK9U
         EpsYRlGNALmpn5OXUmg7VN/fRwFU4KwkBlX70xwit5KwSnZzqhJ1QkWDRkkrElDh2Efq
         OZMesiM3bBXLM0YM0fnZqvEl9lG0SjI5aqIstTV6uACX25KDsEUmEm8+cIER5eTW4Ebt
         uRcDlDcnrHctMKTWb1jwzdot7AfbWrm2c6jAVSjH5LXrMX0Kn6YJpOw62LQ4/2Gjb6NC
         xV+IdnneNQNvSjV3L6OGGsKYrhmj9LYME6uOr58q37xHYEMNGSFtlrUiY4/IfH9uooZv
         h+jA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+JSAiuwMAXRbQrosAkT9/3l6gUU7giBAKwy+Mi4pZ0F7m9q4frsn7YW4xzDBnCqvk71gjNvRc3fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwykRH7M2mE7FSjS4ZwFmSWQuitvOt1GjZGN5mN512moF/gjGFU
	n29VQfDXkQp8LDevI3xRpEe16OSR+Dj2ao5NGfrm+qky/qK0vHIGX1dqXJRWV497atpXddPZ2fI
	vVkxLta9YDTUHC37H8wOWRgjyrHltGSBpNjas/aaC
X-Gm-Gg: AR+sD107kzGPROlEKBh5+MFjFmmjtF+ST7vxNjbCaH6v7LElTSGNjJ+M5jAnaqVp96Q
	Uy+ecY3l3u2ISxZoUURL5kaJAKgdp0SQA/n8kr58lV9EPzjZxrgAclrl9pWSor34FDfaE6xA9Ox
	dAe2XBPBUynMJaOOdhIECX73izFzWjuij9UgvRaI33dlHfTqHUTvHN29WyOllWyVzWuZOCaskT+
	clZLzvBXe4EhyyJj8U8IrOpRSQXBP4Tgc6myZd7ILzOLMyoZTVyQo7jwMIVEh0peppKc26abcth
	Ju/+nitxvp6uAPZ3hzBfzzD7LHQLiPaqtfvSkd2NKuqy06/C7/wVT1fxZJ2TBzbwecnZ6ORVP7q
	8I+QNZVI78w==
X-Received: by 2002:a05:622a:e198:20b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-529a5c1acfamr62875321cf.0.1785270682059; Tue, 28 Jul 2026
 13:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727230545.262579-1-pratmal@google.com> <amiN82J8p5z9l_Rm@lucifer>
 <91b61f02-c533-41b9-b680-7de52a5c6918@kernel.org>
In-Reply-To: <91b61f02-c533-41b9-b680-7de52a5c6918@kernel.org>
From: Pratyush Mallick <pratmal@google.com>
Date: Tue, 28 Jul 2026 13:31:10 -0700
X-Gm-Features: AUfX_mxgIRJBXBwbH7AVrBFi5kQIUVjGvMfmV7Gjhyfe0uQX7ygDuNF5Wvy5kVA
Message-ID: <CALHaPKeOs25YNRg60+NxfS3E5RYLt5hJqFNX02ZCEBrjcDua0Q@mail.gmail.com>
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module parameter
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, sj@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, anshuman.khandual@arm.com, 
	gthelen@google.com, surenb@google.com, mhocko@suse.com, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, liam@infradead.org, rppt@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 11:55=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 7/28/26 13:13, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Jul 27, 2026 at 11:05:45PM +0000, pratmal@google.com wrote:
> >> From: Pratyush Mallick <pratmal@google.com>
> >>
> >> Currently, the free page reporting uses a hardcoded delay of
> >> (2 HZ) between reporting intervals. While this is a reasonable
> >> default, it lacks the flexibility to adapt to varying guest workloads.
> >>
> >> A low delay allows aggressive memory reclamation, returning unused
> >> pages to the host as quickly as possible. However, during spiky
> >> allocation/free churn, this immediate reporting can lead to a severe
> >> performance penalty (nested page faults) as the guest re-allocates mem=
ory
> >> that the host has just unmapped. In these scenarios, there is benefit
> >> from increasing the delay to batch free pages over a longer window,
> >> absorbing the churn without hypercall and re-fault overhead.
> >
> > Since you're talking about increasing it, maybe set the floor at the cu=
rrent
> > value of 2s?

We benefit equally by setting the value to zero as well. This would immedia=
tely
report the pages being freed back to the host without any delay. This helps=
 when
the host is under pressure, as any immediate memory release would help it.

> >>
> >> This patch exposes the delay as a module parameter:
> >> /sys/module/page_reporting/parameters/page_reporting_delay_ms, measure=
d
> >> in milliseconds and defaults to 2000ms.
> >
> > I'm not sure this is great as it means we now have a parameter we have =
to
> > support forever and autotuning becomes harder to implement, also if lat=
er the
> > implementation is changed, this might prevent a reimplementation.
>
> While I'd prefer to keep the implementation as simple as possible unless =
really
> required, I guess auto-tune could be enabled by setting the parameter to =
e.g.,
> -1 in the future.

The case we're trying to solve involves tuning free page reporting based on=
 host
memory pressure. I think the host is the primary beneficiary of free page
reporting, so if we wanted to dynamically autotune this delay, we would nee=
d
some mechanism from the host to enlighten the guest about its current memor=
y
pressure and the autotuner would build its heuristics around it.
As far as I understand, no such mechanism currently exists. While
we do have ballooning, it requires the guest to actively allocate memory un=
der
pressure, which makes it a comparatively slower mechanism and wouldn't help
much for simply adjusting the reporting rate of already free pages.

> >>      /*
> >> -     * Delay the start of work to allow a sizable queue to build. For
> >> -     * now we are limiting this to running no more than once every
> >> -     * couple of seconds.
> >> +     * Delay the start of work to allow a sizable queue to build.
> >> +     * We limit this based on page_reporting_delay_ms.
> >>       */
> >> -    schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
> >> +    schedule_delayed_work(&prdev->work,
> >> +                          msecs_to_jiffies(page_reporting_delay_ms));
> >
> > Err, do we not want to limit this to something sensible? What if the us=
er
> > specifies 0 does it just hammer the system at that stage?
>
> IIUC, 0 just means "as soon there is a suitable free page block to report=
, start
> reporting immediately".
>
> With 2s, we wait 2s before we start reporting immediately by kicking the
> workqueue immediately.
>
> So "0" does not mean "report all the time", rather "start reporting immed=
iately
> as we are notified about a pageblock to report".

Right. Setting the delay to 0 does not hammer the system. The execution
is constrained by two checks:
1. The worker is only scheduled when high-order pages (default is >=3D 2MB)=
 are
freed. This makes scheduling relatively infrequent compared to normal 4K
page allocations.
2. Even when the worker wakes up, the actual expensive operations, such
as page isolation, acquiring locks, and hypercalls to report pages, are
guarded by the watermark check in page_reporting_process_zone(). We only
proceed with reporting if the zone has enough free pages to fill the
capacity batches (32 slots by default). If the watermark is not met,
the worker simply
exits and returns to the IDLE state without issuing any hypercalls.

> >>       state =3D atomic_cmpxchg(&prdev->state, state, PAGE_REPORTING_ID=
LE);
> >>       if (state =3D=3D PAGE_REPORTING_REQUESTED)
> >> -             schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY=
);
> >> +             schedule_delayed_work(&prdev->work,
> >> +                                   msecs_to_jiffies(page_reporting_de=
lay_ms));
> >
> > This code is duplicated, while you've making this change maybe pull thi=
s into
> > its own function?
> >

Thanks. I can create a new function for this and send a V4.

Regards,
Pratyush
