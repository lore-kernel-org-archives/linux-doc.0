Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7DC477E58
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572752; cv=pass; b=snApUnKKRk9r/yZtaTWClcv2gVgVQ6TgfqbE7QQEoBzkjcX61FORyliJ9AWlBkP5DyuPX8oY5OU+V24AD7Xwmkun+vAiNrNwMPGxF1244hKJ4/SxQkw/Lmj3/8nzW9mz6UNbb2S+VdsnPCh5B0/LL57EXv46S7EdfINH92YUiqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572752; c=relaxed/simple;
	bh=30iutcuNkxA3MbU8ClPbF9XgC6/qeK2gA65ZZUzFKfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqpa0/PeDvsbNgncMRoWUXzBpOvWI9XdHFvH86g62MDoVhcVyhMqTOH2lUdZF47LFzdYR7lnVpqlkyjB2qTANtiOcWvSzaTcDFFhnt8UhrLalIpxCa+28T0RMrhWYXOiNr8MAifmV8EamUHZgqdyj6wB6jS7OS7oUoe7RfwtFFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=la16prRE; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="la16prRE"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43587e63a8eso1623279fac.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 00:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778572750; cv=none;
        d=google.com; s=arc-20240605;
        b=i0aLj3oABoXOkKvCxetZkwRxH5/nlsCZFFqanfTEr3McVeN8xNm7Z6XmY6MzSUr3TJ
         NgA7Hh7O6LAsh5Owf+lQypOUnOBha/OIAth3ivzDoesdUdIGUU6rYX3BgO7DzAABK9/x
         CLRq2lUGCkJ1uOiL35flRBK6O0uG9X0gWYuWmA5nIYACDxTfyPaKpzdbVYbh/cFFGecb
         CET6uowZQ9gqHjDmIDc425W4w6YyZra4ngYnJJHzpnGan4/Hyl5jCcDuotrLAhWbCB0G
         aQ+NDzJnKRgsa9JhG05q2ju8eJPQdgD628bCHYFM1KmIf/GQYhhFBKtYnFdC9mW3qsQL
         ZAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GNxFi0i3Eh2p+y16pwvSqh55C8YjwWwX1e+4QDG9pEw=;
        fh=TQLVu08zlnf/3YRz6y0jSSYMgGveb+II1sqZeOmir/g=;
        b=TrdITLdp+7CasALY8qeq86zZeeJ/uQEwrvN3k19oDD0kMgKsHtgaFV2ALg3xrlteDD
         QtOV2YqZYVNn41enPMAGjqPPqCoUdGDykOJXjw42GHHcv6UTnz39qoH9lDcXHWmUQLtU
         QSMa4iT3Pa5wLVXVmFG2KSOvC1SKW5jZ8qnEjZtXm2xgkjPo6CtLooFbJPqaLkC70Oa/
         fTYEcyNNY98JoFpXI4jPPaCsOp87bhthtj1TDccRy9FQHSloAAqentZVl0O1kb2j/M7w
         HiKsb/cdg2d/NMR7mZcY5Ddx00+H/yWhQb/8qJbZBsHm7woM54EeKsbYdQ3OlXYRg4M3
         nYmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778572750; x=1779177550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNxFi0i3Eh2p+y16pwvSqh55C8YjwWwX1e+4QDG9pEw=;
        b=la16prREOPQxt1NSM/azbfSZGedMqtjqeQOslYha2sMqERwz+2pOKVMBHPL8NLmAnP
         snHXyZH8ur5dXoXByJpbjQZKxJzqLwg3cavHhV3LyNiltl6ehAf24m0kOq5ruBPZTgZn
         t3EF6B+8D0YIIQP2lELxbeD85kR8IRSfKWqE293Anz90pR3O4aUsg8wZd1/7PgiInc7u
         WYcpVHGqka6pXcvTYJvOWw5DqQwhBOMetRgD+HggRCjhUXfPML3Em2VaghVlI19dTm7F
         61eFCvh4U24M04fvgb09kFyHqIA4svjc9uuJXPfhHH6L0rVNuglvq617CC7G8+NdNQMm
         nitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572750; x=1779177550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNxFi0i3Eh2p+y16pwvSqh55C8YjwWwX1e+4QDG9pEw=;
        b=iTd+qGIdheZ62ldrvTSG816VUJ6RTrZ4NMH239cYyCXuPms2EJ6Qd2t8gOIfGdhekv
         5a5PwzURUHiXb67VzirDCO1rPJkRxQw41W+NW8R6FdQpCYT3YOgOC8PY6+MvXed+x0SA
         zUcnXOcAzq1//xW0ZBtj2pBDy6d0eJ6hxcxyl+tksFNBXyTnBEol8tJKwGGSN72Du3cG
         rGaA6VnuQ+s9M6Ru+f0ddwuYJ5D7OmxsFCynQsjjuztgjHxEWO3IUxJM2DoEMDUuf+Rw
         uJcaduXOHKpXuHqbfBjLANm1BiGEZyX+0IaG9fCsUoAAbewmrieJMADzJOQLOtr3WyYZ
         h6sw==
X-Forwarded-Encrypted: i=1; AFNElJ/ILEX0DNmihJovvzAUpoqTbPcN7H/oRP0cLr8g+COFNfLBojb+RgWUnPdHbYaRUkm79Em8tch7gsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpFoiB9Bk4YTw3ziG5di1PnmjDrOlcrzIf07MM2Opsm7C1HueQ
	jxUNKlLMQxCmPhKCJYNDdBM7BlI4XXY6ZUKNmGciizcZHXywMjDzgpojEGvNBHox7EPEkeVCVvc
	luaw8MqdS5FhCXoaXvYLutOB9vjerznk=
X-Gm-Gg: Acq92OE7oD6n4udF3Kc30M7Aq+bS1mzVmoiv/87nJAbYGF5KEn7ggx3tES13FgCZmfm
	Mh/Af1sNnWyjQhp/wflRah6QyjSCY/LPsOu6nCob1kQxikKnNpr1XnB+6jSY/d9G90fQ5PPhDUg
	VTb5T4rDFT1WfFPolaDEqsk3q/ZFXk8ds3aLX9mMdiiUk/U9eUKaWBZ+laKWj6DEux5OpvGr8Wy
	Y9a2olV9g94vQwmQVhqzaShwfoQdQmJqse3ELuhn+eVI3i4sc07xsM0MLVHQXZTuSa/xRgCx0Z1
	aMqyzBuAUmUmS62kmqBljW8sZqmCHTmeuDSTRQ==
X-Received: by 2002:a05:6871:3412:b0:42f:af81:2765 with SMTP id
 586e51a60fabf-434f69a0b03mr16855497fac.16.1778572750275; Tue, 12 May 2026
 00:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512060627.3781329-1-danishanwar@ti.com> <20260512060627.3781329-2-danishanwar@ti.com>
In-Reply-To: <20260512060627.3781329-2-danishanwar@ti.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 12 May 2026 08:58:59 +0100
X-Gm-Features: AVHnY4KyYcOEEwQtm4OTa_bKSqp7vmL-5pqMaYZfRIc_VgOTVcf64VUdTb9yyXI
Message-ID: <CA+XhMqykBWcMdk+iNnOtUxM4MX6jpDyUwfuAVZFbjAShO9_v7Q@mail.gmail.com>
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

Hi MD,

On Tue, 12 May 2026 at 07:06, MD Danish Anwar <danishanwar@ti.com> wrote:
>
> Replace the manually maintained ICSSG_NUM_MIIG_STATS and
> ICSSG_NUM_PA_STATS constants with ARRAY_SIZE() expressions derived
> directly from the corresponding stat descriptor arrays, so that adding
> new entries to icssg_all_miig_stats[] or icssg_all_pa_stats[] no longer
> requires a separate update to a numeric constant.
>
> To make this self-contained, break the circular include dependency
> between icssg_stats.h and icssg_prueth.h:
>
>   - icssg_stats.h previously included icssg_prueth.h (transitively
>     pulling in icssg_switch_map.h and ETH_GSTRING_LEN).  Replace that
>     with direct includes of <linux/ethtool.h>, <linux/kernel.h> and
>     "icssg_switch_map.h".
>
>   - icssg_prueth.h now includes icssg_stats.h, giving it access to
>     the ARRAY_SIZE-based ICSSG_NUM_MIIG_STATS and ICSSG_NUM_PA_STATS
>     before they are used in the prueth_emac struct and ICSSG_NUM_STATS.
>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h | 3 +--
>  drivers/net/ethernet/ti/icssg/icssg_stats.h  | 7 ++++++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/e=
thernet/ti/icssg/icssg_prueth.h
> index df93d15c5b78..e2ccecb0a0dd 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> @@ -43,6 +43,7 @@
>
>  #include "icssg_config.h"
>  #include "icss_iep.h"
> +#include "icssg_stats.h"
>  #include "icssg_switch_map.h"
>
>  #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
> @@ -57,8 +58,6 @@
>
>  #define ICSSG_MAX_RFLOWS       8       /* per slice */
>
> -#define ICSSG_NUM_PA_STATS     32
> -#define ICSSG_NUM_MIIG_STATS   60
>  /* Number of ICSSG related stats */
>  #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
>  #define ICSSG_NUM_STANDARD_STATS 31
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/et=
hernet/ti/icssg/icssg_stats.h
> index 5ec0b38e0c67..b854eb587c1e 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
> @@ -8,10 +8,15 @@
>  #ifndef __NET_TI_ICSSG_STATS_H
>  #define __NET_TI_ICSSG_STATS_H
>
> -#include "icssg_prueth.h"
> +#include <linux/ethtool.h>
> +#include <linux/kernel.h>
> +#include "icssg_switch_map.h"
>
>  #define STATS_TIME_LIMIT_1G_MS    25000    /* 25 seconds @ 1G */
>
> +#define ICSSG_NUM_MIIG_STATS   ARRAY_SIZE(icssg_all_miig_stats)
> +#define ICSSG_NUM_PA_STATS     ARRAY_SIZE(icssg_all_pa_stats)
> +
>  struct miig_stats_regs {
>         /* Rx */
>         u32 rx_packets;
> --
> 2.34.1
>

One thing that caught my eye: icssg_all_miig_stats[] and
  icssg_all_pa_stats[] are 'static const' arrays in icssg_stats.h with
  ETH_GSTRING_LEN name buffers per entry. Right now only icssg_stats.c
  and icssg_ethtool.c pull them in. After this patch icssg_prueth.h
  includes icssg_stats.h, so every .c in the driver (classifier,
  common, config, mii_cfg, queues, switchdev, ...) ends up with its own
  static-const copy of both tables.

  Would a static_assert() work for what you're after? Something like:

    static const struct icssg_miig_stats icssg_all_miig_stats[] =3D {
        ...
    };
    static_assert(ARRAY_SIZE(icssg_all_miig_stats) =3D=3D ICSSG_NUM_MIIG_ST=
ATS);

  next to each array, keeping the numeric #defines as-is. Then 2/2 fails
  to build the moment a new entry is added without bumping the count,
  which is the case you're guarding against =E2=80=94 without touching the
  include graph.

What do you think ?

Cheers.
