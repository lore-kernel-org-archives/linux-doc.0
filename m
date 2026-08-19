Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600C353A98
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149582; cv=pass; b=R7Pg2VSxI2l5Qf/4rJa0XCAfV0TL++WiWCgHTT6juNZxDMqYZZpVt/V7YuSp39FaGJE638iCzdqEq9sEHf2TmQitafyr3XUINPvfGWNHwRZkIDkUEw2CmJP64qp14WIyH9lwwXwKesUIxRxtYp3c/VlwHsr/wf0FgP7gOOf3de4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149582; c=relaxed/simple;
	bh=mtLHmPpOiePeRFfAyGUsz76wlHeLqchwFt029X15pLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGDQ0jMOwUkpJSCyaoitC/MGjvCqadsDi1wNiIKmQITYkVnZ4hf5THP/rlxrwVP9csUMmAvW3uwWdpWk3aSnp+pwKYWxa1n/9gU+2WJaNA925R8HLBWs4LeBouxTO+5d6+YXemfOw0aBLvb6GXs25mwTxyjG8XrbCLCmAHfrGXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl2AX37l; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl2AX37l"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f4351e4a12so140174a34.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 07:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787149573; cv=none;
        d=google.com; s=arc-20260327;
        b=CsL7FXBdbR/kGhvQTxk4MXnLfvlIahdSIFrcK016b4oZMWyT/jzhEIV6pymdir2kHv
         nkl9YL6a7Y2KiZVWU6d5nT9p2I4fcTkh7YWbmb+QD02NQcDrjU+sZ5w3VmsQUSkgP0Ri
         DePhWSM9t8SC1YkDi7IrQi0yG/6iW8wIwcNSmt5cCoYMKlaM0eu6XDEq/lAfVXj+gje9
         F6iBTq7ysQQHag4P3iotdsW3YziMi9bMqjYSR9afA2HLcA/liwvtHO+uiutQWf1jvdCm
         E04mEKNVOKg2K0DA2GtrmH/aCNg5Kz0ZZYh/UdlJGE4OTLr5L08/Q/4MOYp+TuhL3HBD
         UnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mtLHmPpOiePeRFfAyGUsz76wlHeLqchwFt029X15pLE=;
        fh=bN9XrV817z+oz0g59/oi0KopX8DkRzeBkc0TgJ1fzuw=;
        b=PxWetxSaP3d+psURLlDdN1J1niKGvMcMLZNJj/Vqsl9A7NiQLSa7ITGHYdlpke2ynR
         owQexU5jW6bpCyRhI7JCRkgvMSc9Q0VmJeg1HxFO3YoqdHpVvQ1didQ6q3a5QM/FtUC5
         O+rCCsSHQxCpw6EQeaRotK7QcRcRaGoPQTSHmp3rKRJsEjOjV4Ix5X65exM6fW74DR7J
         hKyB5VAkXtNyR+tzW9NnQGlSwoOsyWxAv0EfHkwA8ARnSy8S6jy9RNPDQjaL1caGKBlj
         B+cOvG3PtFukJHd/aif1ACPE/x+MuFlhYrqrLj046rGPgM4oL5PbYfczD9NqHapUS6Ia
         nWDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787149573; x=1787754373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtLHmPpOiePeRFfAyGUsz76wlHeLqchwFt029X15pLE=;
        b=gl2AX37lK5/bpSpoABYA4jl9JrAnrb71JDrAxNLuqB7NC53x8BNZJ9yZpga/Kg/LPX
         eSwi60UKCJk8JJg5cUYDLKr0gemVlQa5BMs7iNsJS/6sPMUmgvQzLLOusvDANcwi8WCq
         lair9RIv2lwYsrsV5kzw3cITRFUlED+d7pClXb8EVf1WfeSTn6iMCs0svNsZ2repBF48
         p5U87gBnbvT56gPXaZ3W7Eod4fODK4DvWmT8W9RgIqS0daFeSjQhET1f79VjttWG/w1Q
         +4uH4UhQ0nj519TNPkNU7a4THLQo/bBDbYgHLook9paV7YQvYWH5Sr4i7dgqd3rsvqY9
         TxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149573; x=1787754373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtLHmPpOiePeRFfAyGUsz76wlHeLqchwFt029X15pLE=;
        b=QEfSfrFtMpm7luyUe/dctXUajtL80xhkMQzb3kjNHd1PuxU87ei/bDlbbi47KkHl15
         kxNC3+i9zCs0+Fgl8tdYEXTEyNCM4xRs8hZEiBIQ8yC9e5WVAzoEByIVbOmK6aTV1Fio
         ixDWtIw2HDmQAT64swiZfi55T1sHrVGpligORbal1dUHvvyJvLnJ0ybF2ELllHsXP6uT
         DBCsVrqzRL7KONSf1OUTYHra/S/mb0XaE3pwPVLe1/1GVm/xYXGu+0VM/G1sAZIZ+l56
         APMpyK4hLhCD8qmKJXI+omU3AWfa/PIPcypt0WkH6NWlLP8Wk3cZQoh8Pf/mEOmx8vAq
         5jyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEjhTfiUwxurRCREkj/cGfO36lGU7U66NgBH3WjTyagE/HsaUGEdvlm2yVejPWCCEdZ1aYSx3UqH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFqXjlYWc1sgyJQjfBquLtkQcEcBs3PVZ3eiBq7JyKTktrseZ
	zWlrJc6woGCiqybG/38i4+ru5HJi9wwl7bfRDOXf/AEbK4n6l3baX85/Xi4rbrF9HDyzbmd6Tpd
	S0bBcdPU/muSLO4/SPHex8BntNUtT1pU=
X-Gm-Gg: AR+sD11QZYGG0ow0iqFR9vJRpGFesODNNw8M8Fv1JTX6qTF0dkXTf3jhgWYlT54Fx5w
	7igcnp31v3ggpMoQg/7SOIrtMzvSfNuFb5EN8GeOFaLbuZQmr3TdX6n58xxS4wFXr/MAv1expFt
	n1p2CucdmdG896uxk9cz7bbiB0KEm5Vhf5CTEfCkbS/E7fOWXlqB3pmS8z/7/51Mk5JsbRWN2yL
	hwOvAJyTOg9qeDvTlQBCA7ZgysnXstB1ous/pNSHEOje8D+JOuQQKww5vW1494QPYe+A2JOOZ5U
	SDah6iuCl/Uk7T9Nc2fYj2uZY2v+iki9o46kdFAD6L5MBdYKBLauQOqGWogLnjBhgw==
X-Received: by 2002:a05:6808:4fce:b0:4a3:f036:f3bf with SMTP id
 5614622812f47-4b2bc8c1bdcmr2756929b6e.1.1787149572686; Wed, 19 Aug 2026
 07:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814-netcons_ipv6-v3-0-bc0915e8c75f@gmail.com> <20260818095103.7a7f4c51@kernel.org>
In-Reply-To: <20260818095103.7a7f4c51@kernel.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 19 Aug 2026 15:26:00 +0100
X-Gm-Features: AcwNN1WvWAT473hyfFIV9m1jLgdW_32ZW6vRQrZ00niDYYx8NpT_8AvwknomriA
Message-ID: <CAGSyskXAivuJ3=+3HgZeN_EUH1gw4A6+K=uLdr8Vc2q8swhW7A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/7] netconsole: validate a target's IP
 address configuration
To: Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:51=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 14 Aug 2026 20:28:51 +0100 Gustavo Luiz Duarte wrote:
> > This series adds two validations to the target configuration when the
> > user tries to enable it: first whether remote_ip was set, and second
> > whether local_ip and remote_ip address families match. Refuse to enable
> > the target if any of those validations fail.
> >
> > These validations are already done for the target passed on the
> > command-line, so this aligns dynamic targets with the command-line
> > behavior.
> >
> > The first two patches replace the per-target 'ipv6' flag with a
> > per-address 'family' field, which makes it easier to detect these error
> > conditions. Patches 3 and 4 implement the actual validations.
> >
> > Patches 5-7 are follow-ups from previous reviews: move inet_addr from
> > netpoll.h into netconsole.c, show an unset address as an empty string
> > rather than "0.0.0.0", document local_ip auto-selection.
>
> LGTM, but feels to risky to merge during the merge window.
> Since we're changing semantics we should let this sit in linux-next
> for at least a week. Please repost in Sept.

Sounds good.

>
> BTW please carefully review clashiko feedback:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814-netcons_ipv6=
-v3-7-bc0915e8c75f@gmail.com
> It marked as preexisting the problem of IP versions diverging but
> I think it's relevant (patch 2)?

The issue of IP versions diverging is indeed a preexisting bug and it
is fixed by patch 4/7.
I deliberately kept the fix separate from the refactoring for clarity.

Another preexisting bug that sashiko called out (patch 5) is the lack
of locking on local_ip_show / remote_ip_show, which can lead to
printing a partially updated address.
But worse than that is local_mac_show (sashiko missed this one), which
can lead to UAF if the user reads local_mac concurrently with target
teardown.
I will send a separate patch set to fix these *_show callbacks with
proper locking.
