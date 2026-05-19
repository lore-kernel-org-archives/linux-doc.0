Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB71331A41
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 02:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159324; cv=pass; b=As7nYLYGUi6EO8f3A0yTjOz9YEkABfgOw5M1ycw7CssyWcGRIo7ileIJ/Jm4pCiX/9NmYCzXpSUsy1e2WmLs+UJjLa5CcMFlC46niBMFBr+DPZTYhLYMuFzBoQg3/6oe4/ayP+tT1df7RqQ9XkZ79i8vedScxiT5gzYY5Yw46nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159324; c=relaxed/simple;
	bh=7UyJCqBRdDQbRUMfdCvNywEZmQykXXP5gBZZWpmEPYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QX2il3HHfz/M1Esjuuecb3mkUXrOfrMwRP8GiIGTyPlvrLeq9v8UZlVNcuK5hb7Pdf7nokk8WwFDC8/kAFEl5RLPo/I6pVeSGIcdjT+ehUWvGP4xbDfN3r00yybsPyPAVze4N3cYGReLwJsAXj85ml0vNxV9ZRYloQlAv8Ph2DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=LHig9NhB; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LHig9NhB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bab2548e8bso12574495ad.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 19:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779159323; cv=none;
        d=google.com; s=arc-20240605;
        b=NmpMCQRERdMLE2ctz/WEtl/GllFTzdEVlbdx8/E/CyeSAvM30igm/2zQN94i03Aqla
         XJIJTphOncixhgnj2+1o28sw6BVybIXz+6VXMxAnd9Bu7Mhvykuexjq1m82NPaXeDCXi
         rOx8NZn0EorVDSvD2CTUSkG+XGuClM3nZTyEQ0gqD9CZSHIZw58rXTYxSm+9q6IMTuiC
         n+/5u9zg+aFp5sa/JcxKjZXXtc4aXpcmey84AiZozBhbdyIIQwKOVHyj0yK1gLXo9eHz
         Yb5ga2mw98ZmP0MyL9wDrLCD7Fx8M+U9/X9MK6Q717BIy6FLLyFUBv/h69xdIrt5rNmC
         MqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48t5Wp7GpUaD4JVHMYGaZTa+PdE+2hwEulXY2P1l2dE=;
        fh=5iap7V3gaK+PrOy1te05Bf8f3IcvOX7GJS9Pp11LEJc=;
        b=WnmrIflceBkBhurmax1lRcI6/JlbT02g2gB+G8BXKs6R9n/nweDbEpZ71AFLDzsn23
         9PyoLYJk8RxGis+mumDG2avkuLyX+Du1CLxFgAaMp1kmQJ+uDkKNDTBmGYOiG5kPfQWe
         oiUzRi2CvUDzfp+TiFGxMt49kHorvrOsfjdSVgxhmEp85AJ6wZoqtNzBkKiK7I4iEy8n
         xUZkVv0+i0Dq8DLHLZwHcKlVexjV/4lM4BdEBGEbNkqTzqnlIK/WjHu8b9HkM3CR35yK
         VOjLphoM/ERCIrDUpT+/j8AArLpDPt97LGQPnwGxWSegXHSsSEktBPhevZyjky8JeQpY
         2BQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779159323; x=1779764123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48t5Wp7GpUaD4JVHMYGaZTa+PdE+2hwEulXY2P1l2dE=;
        b=LHig9NhBYcp4lvu9FsDgRb8HDOdpTciWKsFU0bX2LCajRvpkNxObfIMDmhbSB8zXoM
         y7KuHzobb9crsODCEHkINJ38esHDaFhWFxEsNa/7rSvANhMEbWEOjH7/CUoPeU01RGz2
         orqC8Np5R/PrR6zsxIfNkWHQc2puRSbAmXmob1Jvx2P0JMBZj16WkbRJobH2GXBGpbUq
         AaJuMKdEsWXtAV2E7Uq3T/B9Y1otAYfrPiruwuhkQXXK3IOAY5heSjjvxAkbq2biXcQo
         CHbyGUzBuM8FEuHef0eEWxXyqV0D7IG3N4PKmgkIiEtcb8LPpw9+5aB0+qaDFmanYJVr
         0ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779159323; x=1779764123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48t5Wp7GpUaD4JVHMYGaZTa+PdE+2hwEulXY2P1l2dE=;
        b=mt3lUIS1W1u8avWxXpmfs/rv9raFlM+/s+zI8VYS8dgV1vj27rH4FNIo/56/JcAquS
         hoavyHCjuJhsrQAqZefTguUgo9lsJUA2p8d9dGDLjp3uIaFV3aKd6lAyv1u2GoNBAupd
         Vlr/vpRu8Eqi+aaV7AWefyS6IpSyAX6vpwH4SlttDdSF2owiWmtJl8AD15/365APNqmQ
         A57QigtKXQpV1mPeq3sEApaiBISdYIO+Pp3b4tnmKy+bWVYjCg8XxqC9ewoXgZSzABPH
         9Or9uCU+0lKv7QQ9Fd6VM5ZDG+YdSywUHiofxpBUgeZbiOTCRueFfldMlZ/eTUUnFukM
         UMIg==
X-Forwarded-Encrypted: i=1; AFNElJ9sYF5QDtO7BsKVQP6riMQ5RVKuNKMmTfuhRuAlz0TIITOL88DaJq7+eW1uCpRgSThwhdP7H52Dxcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxky1Hho8ccyLlZ+1uK9TkLfCPwccCdBOnGyVjz3sK7ofv+Ikzi
	1La9mTYLk7zzlTm4RcGbgN/y/9Umd8YcVi8hfdNcH97XNP+fTIcHSiAg5sFpH7fxOyLBdDxNRKm
	slTPm3xFaQTIzy3ELrrR9xrGm/VkSEy4sEN1HyRr5
X-Gm-Gg: Acq92OHxvh6Pn1wxwkqRIukX6qx5wXWRMPiktfkMCtUu3Zuo5+7bjBppKpb9nQyZfkb
	KvsUOSN0VOCLqDA0RCdYw+Ts2LHN9ECmYqb4OV3LofiMuAtdMYgG2T4LJonMnftR1R5niNatBHJ
	yCLXNKXTMcvTuQHNUmcQwEM+Uv4LAWo3S8FjMnOCd1xNlXFHoONW4lv0omkb4pb4Hv4hyWoiZtH
	6mB/uqM8WMlQvX97nn1O7SXuFqRX2M/U4zrAY4sp2TuJ6ID0J+94v38H5jLrczd129x7UlTG4/Z
	alvsuUU=
X-Received: by 2002:a17:903:17cd:b0:2bd:8938:b811 with SMTP id
 d9443c01a7336-2bd8938b845mr174842955ad.34.1779159322627; Mon, 18 May 2026
 19:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
 <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com>
 <CAPhsuW5jQOzRTi1ea+=UPhx5W9bkBdivPagRE=O=nx0zf_vb8w@mail.gmail.com>
 <CAHC9VhTGDOJZDzEA31qc0S6FJpYNC4oD__HQ-65wqqwhng=V9Q@mail.gmail.com> <CAPhsuW7Js0Z6tU30RphbUjWsJXETkxaGOArfGZpDjNPmZFUpuQ@mail.gmail.com>
In-Reply-To: <CAPhsuW7Js0Z6tU30RphbUjWsJXETkxaGOArfGZpDjNPmZFUpuQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2026 22:55:10 -0400
X-Gm-Features: AVHnY4IvhqH391i3RQ33XvQXVamFfTLljbGCppZ7t8Skv2w-HCikKnYPe2_pXNI
Message-ID: <CAHC9VhRiDyGT6R+yqxS_oMBSiD6x01HNTb9jWq6B55sfdDkqbw@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Song Liu <song@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 8:01=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> On Mon, May 18, 2026 at 4:57=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Mon, May 18, 2026 at 7:23=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > > On Mon, May 18, 2026 at 2:29=E2=80=AFPM Paul Moore <paul@paul-moore.c=
om> wrote:
> > > [...]
> > > > In my opinion, making killswitch an LSM is more of a procedural ite=
m
> > > > that deals with how we view a capability like killswitch.  I
> > > > personally view killswitch as somewhat similar to Lockdown, which i=
s
> > > > why I made the suggestion.
> > > >
> > > > The use of kprobes, while an interesting idea, presents problems as
> > > > allowing any kernel symbol to be killed introduces the potential fo=
r
> > > > security regressions.  As a reminder, some LSMs, as well as other
> > > > kernel subsystems, have mechanisms in place to restrict root and/or
> > > > enforce one-way configuration locks; while many people equate "root=
"
> > > > with full control, in many cases today that is not strictly correct=
.
> > > >
> > > > Yes, kprobes have been around for some time, this is not a new
> > > > problem, but killswitch makes it far more convenient and accessible=
 to
> > > > do dangerous things with kprobes.  If killswitch makes it past the =
RFC
> > > > stage without any significant changes to its kill mechanism, we may
> > > > need to start considering more liberal usage of NOKPROBE_SYMBOL()
> > > > which I think would be an unfortunate casualty.
> > >
> > > I don't think we can use NOKPROBE_SYMBOL(). There are functions
> > > that we don't want to killswitch, but still want to trace.
> >
> > That was exactly my point, but we need to figure something out so
> > killswitch doesn't make it easier to cause a regression.
>
> killswitch is making it easier to fix a CVE. It can surely make it easier
> to cause a regression. AFAICT, the only protection here is "it is only
> for root".

As I mentioned earlier, several LSMs have the ability to restrict root
beyond what is possible with traditional Linux accesscontrols.  For
example, with SELinux one could deny root a specific privilege while
also blocking changes to the SELinux policy; the root user would not
be able to restore that privilege without rebooting the system.

On a killswitch enabled system the ability to restrict root is lost as
root would be able to kill the enforcement of those access controls.
Presumably one could have the LSM block access to killswitch in this
particular case, but that defeats the purpose doesn't it?

The audit subsystem also has a somewhat similar one-way configuration
lock, which when set does not allow even root to unlock it, a reboot
is required.  By a bit of luck with regards to how the code is
written*, it may not be vulnerable to a killswitch regression but I do
wonder if there are other similar things in the kernel which would
have the same type of problem.

* This is probably the first time I think I've ever considered myself
lucky with respect to the audit code implementation.

--=20
paul-moore.com
