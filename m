Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3024438FE7
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134530; cv=pass; b=GV/JnhdOVljIO9zc8XW05O9iB6CVRXXs65T+dWFj0UPwEgOqslwVI3FS/o9lOmzyYRULT/4nyOc0SYRDiHFNPBWvRe1FjarRPosJRu0KAbHd4L0c+Bbt6FasNa0QzBKQHtLwQS+g2MaLUwRT/DXmTgxk7kGrg96E1X6+c+/MU6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134530; c=relaxed/simple;
	bh=tl5/g99NELzOxMGo409f19JuxHQ2pLmrUlfv8ogw/uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McV+Dr9fRG7NThTRN+A2wc1kpfoQnBWCCWvK3t3d9TrNhDFryzXIOs9Ls/eYdN0TlwyOyjbXgHV+WpV71kFs76MB4NkYlHTkZfbchTxg0WekPNy/QYtGNotKIjZHS1QYiMdCFMfN1vMXCjQIPYmTpTj1bNgCYEUWZ7NSxunRb/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwPL/Evq; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwPL/Evq"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12f6871b2so7209165e87.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 02:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773134527; cv=none;
        d=google.com; s=arc-20240605;
        b=b8/gRDVr6rpr1WHmj8a8VXNhyVauV0hLsbEUZ4MShC2RaV/g18Gd4VbSsCuyq1cuIQ
         rAKIE/lVQqKlZ+Z8gBAaznG4Qls2iwWIq+FJY+yYIPc6Bu7eOcxxA6U9uHAi4ehVBb+C
         um46bXcz7UgaW3BTJTPrtR8ektiEhm0lpiceVGZg+vDf2UdPNNnkg5O4cYrYqn0r5VQw
         YVAASWY+XqMRKm3olhNflpTH8g3jnqpZrRog+g81GRT1Che2ZNBSSVkHoZRnw4kI61eo
         IFVa2qmcUVyCZiGoCz8z6mgDt0RMFYYsoS52lE6rlCZGSOjdUh+QvaTV6RTBO/U0xVDx
         1Chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8fpTI3vdEJL+Z4u+Q4DZneNzvVwr7TWL4qTU3qawv8Q=;
        fh=VW1QDFLZw3fFR6c/gIzR/yw4rf9X+lUbCb1HFMfyZnc=;
        b=MPL7vXdiC0WYon662JVAqBZnQswEPwinCdC7SG5Mq+QEB+swAcCM27wAeTWURWnE3R
         /bn9AC/iWd303YNGzy3f13pQKYAVcLwA1Gx9TKWOL0PGIGY/4tFZYgxyDrOslLX4LlkF
         6Ysbwl80PWGl2Vi703uEQKb4HkJuBqzYmxr6tfpX/cNdjyjm3rb/M+MJG8wCl4GEoVLK
         3btsA1wBpdPbeyB+MhaDdaB8R4clKNmb9Co1mZKtLztVwYpjDuj9r+u5Omvx56Stk28K
         M7sN8VaeuSchFq+1f0BIdiXt+2OcLL0gjr9yqsAxRiHASBKpmkiKRz5VwOUOpQXTP1Ty
         nx0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773134527; x=1773739327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fpTI3vdEJL+Z4u+Q4DZneNzvVwr7TWL4qTU3qawv8Q=;
        b=bwPL/Evq+eoeHEke2+3CCTMUTkJrW502WokNIAE+vXjl0wyTEGRuTvhUkoyF4bMr39
         ZL4UjOhSKK3VSVI88rSCaNCaVzFzwLSb79OBIOSbrkTJ5vHTL7Do8ojXXNzQ8kUKrxU0
         IfFzOvabzSrLHkGVxHwbWa6/ZBfwGnMAWvcITUhTlD0tH7K9cWHXmMSWZTPSHhpEb3hy
         JwqldQaPzrSuBsg8Zvmv5+AAO4NvynMnL4Rb7wKNqik/LGD6SYfMEqhOg8wMhS8TW3Iw
         gGPjwKIKYqgLrPaWneYjC1rYwKrU7V/oGzznSNqj1t65BRnv0ePLBU+y8F6V7KNgyR6W
         Qi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134527; x=1773739327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fpTI3vdEJL+Z4u+Q4DZneNzvVwr7TWL4qTU3qawv8Q=;
        b=WzFTZ38GOnzgGIJSZLHCgO92hgMnj0wIPLfXvukTdEKlltHN6dn21vxPsh9Tgms+zJ
         tCNwoNTfC3yMQe0HDqcCL21h+dbN4V9XpnB4cnxWMOJXXpLwP0Lm46JgK8/WUtwBEmIj
         CZ5g1FYfr2jkSguuKeNgh9MWlR68dDEeUMW7/auhNXb+U0Q4FjZn3rNVz0cni+7ACHeC
         9uu1Kwkybmc/YdGWSJYG6PmU39V1gFFGz7Qll+hG76pwg3UT/X44r1sFvHfr9l7AHN64
         XTvJYJtU765VnGJVQ2h/9gjSqPp5S+1wtUsSmPPPlg9Ya/PQrRlGWviOKXgqoG7N/ILo
         WrgA==
X-Forwarded-Encrypted: i=1; AJvYcCWO3ssKC08w51Q4nZjQQ3IBWwwG4Y+YDgPvSPR+qgKcIwVXtyxcpW/XolK1EIUAncnsYrGTxWUWC9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rxH1NGIO9KZ+wYqwfr+4Q7VJJuORbnIyweVCTu1wVthnR198
	U2e5TmfMBuI3HApfQnUOxI5ORCKZkoyM1kEOhc2jfmZOZx4NTFqgObLMt8eKdqPHB3XEUFYEMV7
	gfvFcnltcuIST8FqEcGHsQVZ/sqlEeiQ=
X-Gm-Gg: ATEYQzxyL3DRAO8d/XsRjKxjm4iYkJnvoFuBs/e3entLwC+x+jx63O5FcKjfrRmLbPa
	4iMYHwuC+X4ydsNID0RIAlD6mcIz9UKH70S4oCgrdZSui9OAeZzhgQ5zv/eVXSY9763go0m0ILD
	UGQZmuhnKyTIiUOIHrK2PpR4Drt4IVT5+TOulZI5vktTYX9AUgh6wF5MtRB5sN5w0jp2ZfvROeP
	ZTDbt3Dm1stVQqsj2kps/MoN4qZjKcWufuuJkYzRhePkX86oXoc15Unos+FtgP+oMw/dR/+nzcp
	qhSAfKc=
X-Received: by 2002:a05:6512:39c2:b0:5a1:3d47:1308 with SMTP id
 2adb3069b0e04-5a13d47160amr4958370e87.31.1773134526632; Tue, 10 Mar 2026
 02:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-2-vishnuocv@gmail.com>
 <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com> <CABxCQKtf=RYrpgnbM0ODo3GA0oW3jgR=_erc9RCD6gEasasA+A@mail.gmail.com>
 <0df2daf8-31ee-4fe3-fc38-de138b302549@linux.intel.com>
In-Reply-To: <0df2daf8-31ee-4fe3-fc38-de138b302549@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 10 Mar 2026 18:21:30 +0900
X-Gm-Features: AaiRm511VEyn4PbFLInkP2GfrKMqwBNJnODO-jlyMYwiozSyz1gLdW_tLl1yvUM
Message-ID: <CABxCQKt_1Hv2hPDpzQQ3TxFJWbRNHs-vRDi9hNhBq4oaoGkt3w@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] input: trackpoint - Enable doubletap by default on
 capable devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	Hans de Goede <hansg@kernel.org>, corbet@lwn.net, derekjohn.clark@gmail.com, 
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thank you.

On Tue, Mar 10, 2026 at 6:15=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 10 Mar 2026, Vishnu Sankar wrote:
>
> > Hi Ilpo,
> >
> > Thank you so much for the review.
> >
> > On Mon, Mar 9, 2026 at 5:01=E2=80=AFPM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Mon, 9 Feb 2026, Vishnu Sankar wrote:
> > >
> > > > Enable doubletap functionality by default on TrackPoint devices tha=
t
> > > > support it. The feature is detected using firmware ID pattern match=
ing
> > > > (PNP: LEN03xxx) with a deny list of incompatible devices.
> > > >
> > > > This provides immediate doubletap functionality without requiring
> > > > userspace configuration. The hardware is enabled during device
> > > > detection, while event filtering continues to be handled by the
> > > > thinkpad_acpi driver as before.
> > > >
> > > > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > ---
> > > > Changes in v7:
> > > > - Removed unwanted comments
> > > > - Removed psmouse_info ()
> > > >
> > > > Changes in v6:
> > > > - No Changes
> > > >
> > > > Changes in v5:
> > > > - Renamed function to trackpoint_is_dt_capable()
> > > > - Simplified string comparison without sscanf()
> > > > - Removed wrapper function as suggested
> > > > - Fixed missing period in comment
> > > >
> > > > Changes in v4:
> > > > - Simplified approach: removed all sysfs attributes and user interf=
ace
> > > > - Enable doubletap by default during device detection
> > > > - Removed global variables and complex attribute infrastructure
> > > > - Uses minimal firmware ID detection with deny list
> > > > - Follows KISS principle as suggested by reviewers
> > > >
> > > > Changes in v3:
> > > > - No changes
> > > >
> > > > Changes in v2:
> > > > - Improve commit messages
> > > > - Sysfs attributes moved to trackpoint.c
> > > > - Removed unnecessary comments
> > > > - Removed unnecessary debug messages
> > > > - Using strstarts() instead of strcmp()
> > > > - is_trackpoint_dt_capable() modified
> > > > - Removed _BIT suffix and used BIT() define
> > > > - Reverse the trackpoint_doubletap_status() logic to return error f=
irst
> > > > - Removed export functions as a result of the design change
> > > > - Changed trackpoint_dev->psmouse to parent_psmouse
> > > > - The path of trackpoint.h is not changed
> > > > ---
> > > >  drivers/input/mouse/trackpoint.c | 45 ++++++++++++++++++++++++++++=
++++
> > > >  drivers/input/mouse/trackpoint.h |  5 ++++
> > > >  2 files changed, 50 insertions(+)
> > > >
>
> > > > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse=
/trackpoint.c
> > > > index 5f6643b69a2c..e12d76350252 100644
> > > > --- a/drivers/input/mouse/trackpoint.c
> > > > +++ b/drivers/input/mouse/trackpoint.c
>
> > > > +     /* Must start with "PNP: LEN03" */
> > > > +     if (!strstarts(pnp_id, "PNP: LEN03"))
> > >
> > > Missing include.
> >
> > Sorry, I am a bit confused here:
> > strstarts() is already available through the existing
> > #include <linux/string.h> in thinkpad_acpi.c.
> >
> > Do you think I should do anything else here?
>
> Yes.
>
> The file you're modifying in this patch is trackpoint.c which doesn't
> have that include so please add it also there. :-)
Aaah, Sorry!!. Got it.
I=E2=80=99ll add the missing #include <linux/string.h>
Thank you for pointing it out.
>
> --
>  i.



--=20

Regards,

      Vishnu Sankar
