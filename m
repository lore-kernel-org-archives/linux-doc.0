Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566552F62
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828582; cv=none; b=eCr5q7Q0PAJUwf3E81ct5UGNl66CYHXX5hx4di5DVQ+5E7fFrvsDuNZPGkEiIc471DL44vipuSNgmY/P0WiScSljWq3MaDCOEagc+whNxQNWvtXrNyMcUO68NSgSxyaFsbjTMX4sdZQowIYZsW/pXVC0HKEQ/hsKuDtp5JG3360=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828582; c=relaxed/simple;
	bh=gTTZh8BhzQptepzYG+1nG2a8w6BJrqYUeFg1d22FTRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+T4iqmCgMDYc7r65n+DU1Be9tWcGXsjcn/KG0EA81a3Pk8tiUcP53N3YTxNTWJiI8j4rxE8VTq+5/Z25F7plu59/Czun8cHJkl/DZ7qYw3uYTqXi9aU/N6EkgwadIHTtYvDfQepdm75jIQZ59ZVfPiHqfuQSxdKuzzu+6MvkjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ezYR5hSg; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ezYR5hSg"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bed0a2ae0fso850204a12.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 10:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723828579; x=1724433379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTTZh8BhzQptepzYG+1nG2a8w6BJrqYUeFg1d22FTRs=;
        b=ezYR5hSgSpfKr6VNpkvnZUXXfBySSY+CyaA/b49Ea0s98vYrdT4fRM4PZuju11Tybp
         uDIjvsq0wwNhMl3AhzcT0QD6ZG9h/puVb4/5IVewgMSNXLaFiem+xVPSiZDDHYAsNlYZ
         G414Ww8nYUclfjuHULz6JnSdVq93dvItkMbFXoFlmF3xKBnOms/VvNsZAqjof4YqXSPC
         RjaMpsLzq7VBJOmnxO2TZ12qZE+X4L5euUe3n4UYG1OgruaR2fjFtNlEAYyKf5X7OYBd
         6pZFayTeS0wtqOgDkyrzm+Do85oWtVYhyvSjQOXFkTyWTvynBHrwSPtlFaFmPI5yhUsZ
         VO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723828579; x=1724433379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTTZh8BhzQptepzYG+1nG2a8w6BJrqYUeFg1d22FTRs=;
        b=VXHUkSNROA8nKZQyOiavcmt9NjM51uquwsEz/Z+8E2NT7LpXZeWqZTSUf8t1YDFmqq
         kdJzeR9DWi7kHkp6wLHfm5qiKP9UIoKyMzdBbC14gW629fMXKrYswoHq+8kFqqUDRbDt
         nQA3OGoW0pmRLPx1sOcOm7Ecuzocjzysq/e6ec9ezRRUqrnzJqPryzMkH86niTfOaqqW
         8iT0Crnx06at2I/p62TBx38L1VPxnlnpEz0aFRSerfmNcTRHVreuajwb8IUORer3y9GK
         yEtlbhC6aj873BLwjZ2f7bw2SrNCDahlKj4LZAqN+dxlFYthlXfSAM9sXTsoMXb75sPF
         hzTg==
X-Forwarded-Encrypted: i=1; AJvYcCWM8L3Lv6ssHMVMDn3F36JLA+glS5+LNpI+fXXVZoXakKSsslYYpMCXA+k3d5u0YIDvv3B9MFsSupc2AVZdRtLZtbzT5myPjGO7
X-Gm-Message-State: AOJu0YxBICicQWnuhv/ZJ1NEoRCKMoWLEOs+WjeiA+oB+GAQujN/Xfaq
	QQVN8YoeHjB5kMip5D4g/RLvTyfSvFoi+pNMRHY3ESSeMld1U3UXAkv2tw36Z0h4qfZgPdprzgz
	8Vm7TvV1IwtwxH1tb8e1FX8jZNopBlNGIDoIY
X-Google-Smtp-Source: AGHT+IGh9qT1AMeaxkAVVpMXaOhcrQoHKbRBo1jsonnHJGdLvz3C8hk7x+togERmJ4+UjoznIlFNWNKgSOxCHBrk0Ho=
X-Received: by 2002:a17:906:c115:b0:a77:cf09:9c70 with SMTP id
 a640c23a62f3a-a83aa09f219mr10837066b.43.1723828578258; Fri, 16 Aug 2024
 10:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1722981659.git.babu.moger@amd.com> <784eaa900b9e0778ddc534c04c7ded9466bfd19b.1722981659.git.babu.moger@amd.com>
 <983fded5-48f8-439d-8afe-45b60841985a@arm.com> <8c93c091-39b3-4219-b892-9df2747eb91a@intel.com>
In-Reply-To: <8c93c091-39b3-4219-b892-9df2747eb91a@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 16 Aug 2024 10:16:06 -0700
Message-ID: <CALPaoCjmRyP00b9rTCjpxwLDJ2rYkQ8HuNMYJA+qVNo5a4Q9JQ@mail.gmail.com>
Subject: Re: [PATCH v6 19/22] x86/resctrl: Introduce the interface to switch
 between monitor modes
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, x86@kernel.org, 
	hpa@zytor.com, paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, mingo@redhat.com, 
	bp@alien8.de, corbet@lwn.net, dave.hansen@linux.intel.com, 
	fenghua.yu@intel.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Reinette,

On Fri, Aug 16, 2024 at 10:01=E2=80=AFAM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi James,
>
> On 8/16/24 9:31 AM, James Morse wrote:
> > Hi Babu,
> >
> > On 06/08/2024 23:00, Babu Moger wrote:
> >> Introduce interface to switch between ABMC and legacy modes.
> >>
> >> By default ABMC is enabled on boot if the feature is available.
> >> Provide the interface to go back to legacy mode if required.
> >
> > I may have missed it on an earlier version ... why would anyone want th=
e non-ABMC
> > behaviour on hardware that requires it: counters randomly reset and ran=
domly return
> > 'Unavailable'... is that actually useful?
> >
> > You default this to on, so there isn't a backward compatibility argumen=
t here.
> >
> > It seems like being able to disable this is a source of complexity - is=
 it needed?
>
> The ability to go back to legacy was added while looking ahead to support=
 the next
> "assignable counter" feature that is software based ("soft-RMID" .. "soft=
-ABMC"?).
>
> This series adds support for ABMC on recent AMD hardware to address the i=
ssue described
> in cover letter. This issue also exists on earlier AMD hardware that does=
 not have the ABMC
> feature and Peter is working on a software solution to address the issue =
on non-ABMC hardware.
> This software solution is expected to have the same interface as the hard=
ware solution but
> earlier discussions revealed that it may introduce extra latency that use=
rs may only want to
> accept during periods of active monitoring. Thus the option to disable th=
e counter assignment
> mode.

Sorry again for the soft-RMID/soft-ABMC confusion[1], it was soft-RMID
that impacted context switch latency. Soft-ABMC does not require any
additional work at context switch.

The only disadvantage to soft-ABMC I can think of is that it also
limits reading llc_occupancy event counts to "assigned" groups,
whereas without it, llc_occupancy works reliably on all RMIDs on AMD
hardware.

-Peter

[1] https://lore.kernel.org/lkml/CALPaoChDv+irGEmccaQ6SpsuVS8PZ_cfzPgceq3hD=
3N2cqNjZA@mail.gmail.com/
