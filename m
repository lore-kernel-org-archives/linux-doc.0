Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78643AC0F5
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580219; cv=pass; b=SHzVzElgp0mkDMCfZ6U9d9jsoGa5pftaGpYCOiSYCJ6prbk80CWfHzWYsP0b9DuG658G/NfsNYVmGFaLd4kGn6+YUuIVqxXlazG7wzFkL236P3PjWheR/zQdsdRMFY6paO6huONtEQVMurqFmHwhPwaLAN667qN8eQMZwrqWRG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580219; c=relaxed/simple;
	bh=3oQSk/uVjA1as9ZVrWH+Ah6AoeHdCwAMDsov0zYevO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEGQaCWQ9+sRKfQfCwylRRX1rhqg/t/JhAZxU7HLlOiS6L1rMjeAKab08B/8awzzdtEkNXh+uApniYH3gjiCfTTQrUPxAsd0b/BOZp5XpVf29Dz4EfRzV1zACd83tHIw+/nxlsbD5gRe1DEv+BoIkfnD08N87XiKfx34kxjk9n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hic2GOX4; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hic2GOX4"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4232323a7daso2466774fac.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 03:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778580216; cv=none;
        d=google.com; s=arc-20240605;
        b=eGJDRdC1VHaGy6FsVGTAFb6z8A4Zo+NeimJ5A+y9+xxISzHl3Xa/9btmmIAqmYuF6D
         321PcD/2pItxfy0GHruiQ/nRNjIRoesld4awb5SvywSzzQs7aVET325ohYiF35slPjkO
         q8AW0zzljOfzscBuAerkbuLB5t0UnT7/R0ruMKcxka0eBqAMUy0vr957dTzcqpE9TcRF
         sZGtT3irXtcK1wyWiFVisw1JvLTIGGsUps3FtGRIb1try/F5oBvptAY3CxXi36q/4PcV
         DJQDfD1JOeDditWkFPP+4hU5eLYhKCsAjbaxQGcapf4AAS+JiSMamDww09KB5DVzilT1
         ijYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9vpyC9g/4a6soW3baW1ZfRfFD5ejqC8VcJYB7ujrZwE=;
        fh=ntWrhissB4Bky2NUU0YoBC6shiLTG+L8iWZBe7A7bas=;
        b=X+CYxSgns446ypTg60ag6F2v3ERDks+97QShrqhImaiuNKRazsv79Be8lEh8A5jlXn
         7C+K+hiQCYvJp5V+9KPOlskZq2JV+d6/rotdKz2U5mfxNi4Gv9eG4Am37aREHIlLotUM
         Wi8QmU7wYCNMUCwaFbEvdl8qdnR38RqCtBIxu786BqO2E+uwherIb6HtTEJegic60568
         1VN1kwzo4mZjXPPoCeIE+2tNIZd7zo37xBDes0Rwtm63GN49PssEedZJl6LarP9Eg443
         4vSX3FRN4v6q9wo8rwXmDFzPnBEk62ClLGjat3bbT03m6KUfYPOpDmOutW14LFL3A31j
         U/Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580216; x=1779185016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vpyC9g/4a6soW3baW1ZfRfFD5ejqC8VcJYB7ujrZwE=;
        b=Hic2GOX4ca7GcES0yoK82n9A2MO58pTEMcJhxYXfvYp49YCWn+rdKxl6IUb6nT9isk
         lboX4WozB8R2oCyvHEinBfVdv57UQr2XdRuJEYRGXrKHqzcpVPhyfsPwn3Ubfpd9mrzw
         NLMev3XNuD1M0ufDQNFTXbhqOWx7ynquQ1tM8zmgIuE+nRuo0Z/qCZrxTTWvRbX59kpN
         S7SNypyQGPbye26SNo391Q1asHMZ0+Gdk2jM3ffYr6bZcOc9XxFOd90e57cNN5VGK7Up
         9MwReLX2Fk8dNy6bgBWqeyyZVt7s3ZCTYlZkONulfewCyLmnQiqzlHLo1DNDEaKGxIfG
         J4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580216; x=1779185016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9vpyC9g/4a6soW3baW1ZfRfFD5ejqC8VcJYB7ujrZwE=;
        b=D0SlMqAKv3xD4gM5R0aoq9qUNXhCyT5kgF2hZVg4iN/tR9UGfhqr+c3N5d0SIY7wVg
         cg/I63MVv8PGx/mwSfrHH1iyB1Raj0on1XP4x2+N+6qWHnBSs/VJ9IAAd4ZMEXMHVacC
         iOSHgRFiEzxSMhQvQXwY/5/QiRl2DxWqQY+pi98pGtYi0Xbuj5zKID3jAfNYDzP2eSXo
         FYmop74/IU3BiQy4SBHm3/0MUesGaLXSv0tUvaJMtDudTYdPmj0KAhxC8X+fqjC+ZAk+
         L7MVDbAAoyUygLVCDAka8EHEK94tHwQM7QVE9R9ICAEApIDUL8DDoGdofFgqbfP3IscL
         zS1w==
X-Forwarded-Encrypted: i=1; AFNElJ87Xk+4UVkSS5FGoCwEUWfsD4p08JagmYbITanNJBJxN4y8sdnwtZvSPKhiNgOlpDd/hjXxGzA4N18=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLdj0tt7ar8R8S6kWDWYC7zdQqsL32XBPHxvbjOEDyJaV0rHVp
	Kdnskjek61L9Hg2et5dX12eT4iFkbueOQV7j4huq9QnRFJlWtfqsFH4yub7iqgY87y899PmcHYv
	WC7NYEJn7f89mj4W0jqb5s5C5EYucTO8=
X-Gm-Gg: Acq92OH7UGGac6IWlJn3yPXW51pAf0UkJB4d3RRaiQLJhG5gjsKfiUUdvRsO3V6s+YU
	YpFrC4Yb5f8We9kWAM8MjePD+PnURwfWmUSHRupiyU80qu0dQTy85RntTXA1SFPlcja5bWDNxzV
	KNUr+ND9hkVwc/xisp+M2Z1AaSl7AkaY9Gq1Q6wCvf4auvAxP4qI5uYYNL4x41t4UvKn/OWKWBk
	1MYVyBQ2X+Mo77tlLnwQaC7tGLtIS6mMbdmt7dNBqAbE5EwKdySZoWzp6ldF3LYWm2tKzi+WiAZ
	RSdjd7/BYrxZS8aXY9Q85O3zPikbICMV56GFxw==
X-Received: by 2002:a05:6870:55c6:b0:42b:d0fa:771 with SMTP id
 586e51a60fabf-439a29aa5d3mr1258410fac.21.1778580216477; Tue, 12 May 2026
 03:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512060627.3781329-1-danishanwar@ti.com> <20260512060627.3781329-2-danishanwar@ti.com>
 <CA+XhMqykBWcMdk+iNnOtUxM4MX6jpDyUwfuAVZFbjAShO9_v7Q@mail.gmail.com> <6a1f411c-d7ed-463b-abf1-277d8cc0c184@ti.com>
In-Reply-To: <6a1f411c-d7ed-463b-abf1-277d8cc0c184@ti.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 12 May 2026 11:03:23 +0100
X-Gm-Features: AVHnY4JoBEuCCshjttiiP4pUrkdFzUklGWLsHa6Nwoh6aUuuy2gt7vVqJ1dT2a4
Message-ID: <CA+XhMqzx9CUX5H7q1UqL=heGWLFjZVfyiTx6b45VW=E9t13Fow@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: ti: icssg: Derive stats array lengths
 from ARRAY_SIZE
To: MD Danish Anwar <danishanwar@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jacob Keller <jacob.e.keller@intel.com>, Meghana Malladi <m-malladi@ti.com>, 
	Kevin Hao <haokexin@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Danish,


On Tue, 12 May 2026 at 10:40, MD Danish Anwar <danishanwar@ti.com> wrote:
>
> Hi David,
>
> On 12/05/26 1:28 pm, David CARLIER wrote:
> > Hi MD,
> >
> > On Tue, 12 May 2026 at 07:06, MD Danish Anwar <danishanwar@ti.com> wrot=
e:
> >>
> >> Replace the manually maintained ICSSG_NUM_MIIG_STATS and
> >> ICSSG_NUM_PA_STATS constants with ARRAY_SIZE() expressions derived
> >> directly from the corresponding stat descriptor arrays, so that adding
> >> new entries to icssg_all_miig_stats[] or icssg_all_pa_stats[] no longe=
r
> >> requires a separate update to a numeric constant.
> >>
> >> To make this self-contained, break the circular include dependency
> >> between icssg_stats.h and icssg_prueth.h:
> >>
> >>   - icssg_stats.h previously included icssg_prueth.h (transitively
> >>     pulling in icssg_switch_map.h and ETH_GSTRING_LEN).  Replace that
> >>     with direct includes of <linux/ethtool.h>, <linux/kernel.h> and
> >>     "icssg_switch_map.h".
> >>
> >>   - icssg_prueth.h now includes icssg_stats.h, giving it access to
> >>     the ARRAY_SIZE-based ICSSG_NUM_MIIG_STATS and ICSSG_NUM_PA_STATS
> >>     before they are used in the prueth_emac struct and ICSSG_NUM_STATS=
.
> >>
> >> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> >> ---
> >>  drivers/net/ethernet/ti/icssg/icssg_prueth.h | 3 +--
> >>  drivers/net/ethernet/ti/icssg/icssg_stats.h  | 7 ++++++-
> >>  2 files changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/ne=
t/ethernet/ti/icssg/icssg_prueth.h
> >> index df93d15c5b78..e2ccecb0a0dd 100644
> >> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> >> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> >> @@ -43,6 +43,7 @@
> >>
> >>  #include "icssg_config.h"
> >>  #include "icss_iep.h"
> >> +#include "icssg_stats.h"
> >>  #include "icssg_switch_map.h"
> >>
> >>  #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
> >> @@ -57,8 +58,6 @@
> >>
> >>  #define ICSSG_MAX_RFLOWS       8       /* per slice */
> >>
> >> -#define ICSSG_NUM_PA_STATS     32
> >> -#define ICSSG_NUM_MIIG_STATS   60
> >>  /* Number of ICSSG related stats */
> >>  #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
> >>  #define ICSSG_NUM_STANDARD_STATS 31
> >> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net=
/ethernet/ti/icssg/icssg_stats.h
> >> index 5ec0b38e0c67..b854eb587c1e 100644
> >> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
> >> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
> >> @@ -8,10 +8,15 @@
> >>  #ifndef __NET_TI_ICSSG_STATS_H
> >>  #define __NET_TI_ICSSG_STATS_H
> >>
> >> -#include "icssg_prueth.h"
> >> +#include <linux/ethtool.h>
> >> +#include <linux/kernel.h>
> >> +#include "icssg_switch_map.h"
> >>
> >>  #define STATS_TIME_LIMIT_1G_MS    25000    /* 25 seconds @ 1G */
> >>
> >> +#define ICSSG_NUM_MIIG_STATS   ARRAY_SIZE(icssg_all_miig_stats)
> >> +#define ICSSG_NUM_PA_STATS     ARRAY_SIZE(icssg_all_pa_stats)
> >> +
> >>  struct miig_stats_regs {
> >>         /* Rx */
> >>         u32 rx_packets;
> >> --
> >> 2.34.1
> >>
> >
> > One thing that caught my eye: icssg_all_miig_stats[] and
> >   icssg_all_pa_stats[] are 'static const' arrays in icssg_stats.h with
> >   ETH_GSTRING_LEN name buffers per entry. Right now only icssg_stats.c
> >   and icssg_ethtool.c pull them in. After this patch icssg_prueth.h
> >   includes icssg_stats.h, so every .c in the driver (classifier,
> >   common, config, mii_cfg, queues, switchdev, ...) ends up with its own
> >   static-const copy of both tables.
> >
> >   Would a static_assert() work for what you're after? Something like:
> >
>
> While adding more stats manually, The ARRAY_SIZE() approach was
> explicitly requested by maintainer [1]:
>
> This patch is a direct response to that feedback. static_assert() would
> still require updating the numeric constant on every array change. The
> goal here is to eliminate the need of manually incrementing stats count
> whenever new stats are added
>
> Your concern about multiple copies of table is noted and valid. Could
> you advise on the preferred way to reconcile these two requirements? I
> am happy to restructure if there is an approach that satisfies both.
>
> [1]
> https://lore.kernel.org/all/20260112181436.4s5ceywwembn674r@skbuf/#:~:tex=
t=3DCan%27t%20this%20be%20expressed%20as%20ARRAY_SIZE(icssg_all_pa_stats)%3=
F%20It%20is%20very%0Afragile%20to%20have%20to%20count%20and%20update%20this=
%20manually.
>
>
> >     static const struct icssg_miig_stats icssg_all_miig_stats[] =3D {
> >         ...
> >     };
> >     static_assert(ARRAY_SIZE(icssg_all_miig_stats) =3D=3D ICSSG_NUM_MII=
G_STATS);
> >
> >   next to each array, keeping the numeric #defines as-is. Then 2/2 fail=
s
> >   to build the moment a new entry is added without bumping the count,
> >   which is the case you're guarding against =E2=80=94 without touching =
the
> >   include graph.
> >
> > What do you think ?
> >
> > Cheers.
>
> --
> Thanks and Regards,
> Danish
>


  Thanks for digging up the context =E2=80=94 fair point, I'd missed Vladim=
ir's
  earlier ask. Reading it again though, what he calls fragile is the
  silent miscount, not the keystroke of typing a number. A static_assert
  turns "forgot to bump" into a build error, which I think gets you
  there.

  What about moving the two arrays into icssg_stats.c, declaring them
  extern in the header, and dropping a static_assert next to each
  definition? Numeric #defines stay where they are, icssg_prueth.h
  doesn't need to know about icssg_stats.h, and the tables live in one
  TU instead of every .o in the driver. If the count and the array
  disagree, you get a compile error on the spot.

  Probably worth keeping Vladimir on Cc for v2 in case he had something
  else in mind.

  Cheers,
