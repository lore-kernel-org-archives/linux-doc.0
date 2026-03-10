Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26BE3ED119
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143720; cv=pass; b=iWrwEtnQrTYxKbkgj0jSgeVp887hTAIEo/S3aUOYfbNZ/Ksg10x1XtMAw5qAWb/kBFjeTQD/evtsLPj2zzeyFROFaIigRMdheFexpzbfCtzpWIiNG2RZbcy6YFlGhAdHDVvCNUu/HuxJf53CSueSBTVMR//ecDo0sOjNEfsWr9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143720; c=relaxed/simple;
	bh=KJ34G7jXVW6vaVlUYzHj+z8DcGKlvG+6o58Yti9Gnh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYDZeKD9819l6gVmeYxqzRBBgmtgTuPdokfN+a8dbsNFHLbVJS1fJn+DLHT5CWyCUCoVknhoWPz9Ur0Pxpacz6PnzUTIHT/oN74oZcQopGL/JGpTljwcEs1HYQqun+WMY0Qfh18S5eDXdlxmmL9m+0AV86p0sgI6/LY7LCKCqsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6wKgHzv; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6wKgHzv"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e4989dacdso7260191e87.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 04:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773143717; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3I6y3/9AkKUGlH37g/Ai9hTm8+yxNMmJX5W33luB8v+rqNRmqFJoNOPvY0JO3ZdhJ
         g1C48Rke0f4Aj3yUqZeAa6qQeNq81KSgvv0aRVcCXmCe7A9b9oQHWeT9oCFQqgdkp2B8
         1rPFuhByPlF4xm49/xPMxw1WxIMnpZorpNZc8fHjZGM7bIb0K7qnzriJ+f2enwZHWRrb
         NKyZYB9iOMIGzSmUqTCj8l/1frBkOCD5zTD5ONq65z49bp8xoEWkGKRhyIrDGaULcUih
         QS+AI7A0t7VXGIv4NM57Cbj526gpKAdWlLAnVEMR8qGbzw3JbAoCoYt0bk8kNhD/P3ZT
         0SFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W70+Vn6PejFfPeY6VWdAiMcWtVOjKl21UuQnq+3EYxE=;
        fh=o4Fr+v7yCrSDQSuVt4m0avWf7NSlNikT9SU+5iVEIRY=;
        b=bjyVYMfPgHL4voAaJyovidBy9nmG9X88xBzaEsBi975Bp+tKjURkYn2iScbwHsw883
         715kCEE8chvVNptYpXBI9wUvJ4x9FHYml3zntc4bWYEhy4np5ALlXuCGevhUo3xEvrSP
         jtIOWwnZd3rl/8SGcJV+DVkqjefwkoJLicMpLA0QEiNSUSgZ5qhAjLehzxiurABpRFrC
         WltzP1TCG+a5P5hec8bs6JtX3TMefhJeuPS0YRqh6EkAmpmihF001ESSy4MYEu+Wl1ah
         e/Au9N/tZSc/hanzGJsQjmdmoOTQk/KMOXMj55Q5cMHIGs2sO0IPeWaX6UYarYDN78YF
         KH5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773143717; x=1773748517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W70+Vn6PejFfPeY6VWdAiMcWtVOjKl21UuQnq+3EYxE=;
        b=X6wKgHzvGfZjbb1VVXQ4DqgxIlVZOJBD9U1LIvi4mW/O5C0P62KEy9HGblhr0BMtAM
         npdmJAQ9sUaSzeKYQ1R7qXnh++b6/ua7hVl4hFVp1dmMq8r0++Oqq097Q+rF1V+u8b9f
         otHVbs4H/CtAwLry9pjvlj4kY9oYBtNTzCy+mYpoBhik9xRHRdfm60SKlML/GENR9IM4
         0BfEP69xzxRmg967Xb0piwhVLFux37sZJGAPweJxGVy4HgQqwuCrKwgyKqaSdxhMgwXH
         5173A89GAwer+msqJZPK8tcuJETMTkmYKmMTjILAFDieO4nk2vyjiSx06I3cHXOR3ytA
         0/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143717; x=1773748517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W70+Vn6PejFfPeY6VWdAiMcWtVOjKl21UuQnq+3EYxE=;
        b=iJ9+r90nDT2jXIFSYmwIcpLKp79AfJLJpkPDUnsuRNsySNHVh4TT8mq0tjmOBBPK3G
         suwGocaHNRIJxZ1Krk4T51+KYcIZsq53pC+/2zpFYH9sRZQ3OLPpb6CAgudNFs7i3taL
         MwaqgnzqL9thek1uh+24ddbtKf/QLmgPK72juJnyCSWV1MckMNp5+Y7vlUHHV3vi0eBG
         N22ig1n88YYKWZ5HMscIumyEoM2Y0wtXVxBSKaOJKNLBasAGtLc6EF41Ub/bS+hdsT59
         JeJUfA+44KSxt5RrDqJAwz8GNzdm+vXE+pEzuv9wq9YH2t7RAN5niUIisEGMAsHrian9
         SCUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLDBNqS5iThutd27P0zBABJEpNC7ZbuX+mXjrCb5a3VB3ngt8UfzECvNrqGsvLEN0cfQNytbatUfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBH/t/UB29KPJkaqEbfAlanIjR2sKhdGVES9QhC47JWyqOUCL3
	oxbnHOlIow2avStdE2gbPFzowfA/VIjHv+8m62NLmcjCSZvd8Il54IZeaHZs/S4wSvlF6WEkLqo
	0R2LvM70U0qqNtJ2X3GRf2iWGPvCoL3E=
X-Gm-Gg: ATEYQzwz+0Nal2v+M7wPT9GunM9N/UnVoMGreWm9hlJ1JcjuORm32ntEm/p8QzwDhJZ
	c103xoZY8xWF+3MsHr7OFe0bsmaUGAfJJBSKo6LytvAS/8MqdUoTd+lLRe9/SIkoP1w3QUILFCe
	KbYD1rzjOt1RAd0AKTWNvHUvw8HBmY2OyZLSe+saz4mr1UP4BSZs6s6pEnOeeeEcjG2LeBc52t0
	Lp6EzQSwdTeHj/M3u8KASrSBwudfba62Upd0hvkVWFOVchpfGhNFbzunBkmuuigoF3d3yQC2VoJ
	MICpupg=
X-Received: by 2002:a05:6512:6c8:b0:5a1:18f0:930b with SMTP id
 2adb3069b0e04-5a13cd1c912mr4967420e87.42.1773143716734; Tue, 10 Mar 2026
 04:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-2-vishnuocv@gmail.com>
 <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com> <CABxCQKtf=RYrpgnbM0ODo3GA0oW3jgR=_erc9RCD6gEasasA+A@mail.gmail.com>
 <0df2daf8-31ee-4fe3-fc38-de138b302549@linux.intel.com> <CABxCQKt_1Hv2hPDpzQQ3TxFJWbRNHs-vRDi9hNhBq4oaoGkt3w@mail.gmail.com>
 <8216aaaf-bdaa-2a48-a7de-b0b81d49eda5@linux.intel.com>
In-Reply-To: <8216aaaf-bdaa-2a48-a7de-b0b81d49eda5@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 10 Mar 2026 20:54:40 +0900
X-Gm-Features: AaiRm53Z7FInzVa7AHviwaQEjkqy6ucSeO9srFBPc2Ymkf_rnYJvGp7zbxxDC7Q
Message-ID: <CABxCQKsWtmM5zJDKM35WL_bvi=01QLT0ot5fidH-9yZ70_Q5cw@mail.gmail.com>
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

Thanks again.

On Tue, Mar 10, 2026 at 6:30=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 10 Mar 2026, Vishnu Sankar wrote:
>
> > Hi Ilpo,
> >
> > Thank you.
> >
> > On Tue, Mar 10, 2026 at 6:15=E2=80=AFPM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Tue, 10 Mar 2026, Vishnu Sankar wrote:
> > >
> > > > Hi Ilpo,
> > > >
> > > > Thank you so much for the review.
> > > >
> > > > On Mon, Mar 9, 2026 at 5:01=E2=80=AFPM Ilpo J=C3=A4rvinen
> > > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > > >
> > > > > On Mon, 9 Feb 2026, Vishnu Sankar wrote:
> > > > >
> > > > > > Enable doubletap functionality by default on TrackPoint devices=
 that
> > > > > > support it. The feature is detected using firmware ID pattern m=
atching
> > > > > > (PNP: LEN03xxx) with a deny list of incompatible devices.
> > > > > >
> > > > > > This provides immediate doubletap functionality without requiri=
ng
> > > > > > userspace configuration. The hardware is enabled during device
> > > > > > detection, while event filtering continues to be handled by the
> > > > > > thinkpad_acpi driver as before.
> > > > > >
> > > > > > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > > > > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > > > > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > ---
> > > > > > Changes in v7:
> > > > > > - Removed unwanted comments
> > > > > > - Removed psmouse_info ()
> > > > > >
> > > > > > Changes in v6:
> > > > > > - No Changes
> > > > > >
> > > > > > Changes in v5:
> > > > > > - Renamed function to trackpoint_is_dt_capable()
> > > > > > - Simplified string comparison without sscanf()
> > > > > > - Removed wrapper function as suggested
> > > > > > - Fixed missing period in comment
> > > > > >
> > > > > > Changes in v4:
> > > > > > - Simplified approach: removed all sysfs attributes and user in=
terface
> > > > > > - Enable doubletap by default during device detection
> > > > > > - Removed global variables and complex attribute infrastructure
> > > > > > - Uses minimal firmware ID detection with deny list
> > > > > > - Follows KISS principle as suggested by reviewers
> > > > > >
> > > > > > Changes in v3:
> > > > > > - No changes
> > > > > >
> > > > > > Changes in v2:
> > > > > > - Improve commit messages
> > > > > > - Sysfs attributes moved to trackpoint.c
> > > > > > - Removed unnecessary comments
> > > > > > - Removed unnecessary debug messages
> > > > > > - Using strstarts() instead of strcmp()
> > > > > > - is_trackpoint_dt_capable() modified
> > > > > > - Removed _BIT suffix and used BIT() define
> > > > > > - Reverse the trackpoint_doubletap_status() logic to return err=
or first
> > > > > > - Removed export functions as a result of the design change
> > > > > > - Changed trackpoint_dev->psmouse to parent_psmouse
> > > > > > - The path of trackpoint.h is not changed
> > > > > > ---
> > > > > >  drivers/input/mouse/trackpoint.c | 45 ++++++++++++++++++++++++=
++++++++
> > > > > >  drivers/input/mouse/trackpoint.h |  5 ++++
> > > > > >  2 files changed, 50 insertions(+)
> > > > > >
> > >
> > > > > > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/m=
ouse/trackpoint.c
> > > > > > index 5f6643b69a2c..e12d76350252 100644
> > > > > > --- a/drivers/input/mouse/trackpoint.c
> > > > > > +++ b/drivers/input/mouse/trackpoint.c
> > >
> > > > > > +     /* Must start with "PNP: LEN03" */
> > > > > > +     if (!strstarts(pnp_id, "PNP: LEN03"))
> > > > >
> > > > > Missing include.
> > > >
> > > > Sorry, I am a bit confused here:
> > > > strstarts() is already available through the existing
> > > > #include <linux/string.h> in thinkpad_acpi.c.
> > > >
> > > > Do you think I should do anything else here?
> > >
> > > Yes.
> > >
> > > The file you're modifying in this patch is trackpoint.c which doesn't
> > > have that include so please add it also there. :-)
> > Aaah, Sorry!!. Got it.
> > I=E2=80=99ll add the missing #include <linux/string.h>
> > Thank you for pointing it out.
>
> Thanks. Please also double check you added inux/array_size.h into the
> correct file in case you were confused what file this patch modifies.
Thanks, and yes =E2=80=94 I got mixed up earlier and checked the includes i=
n
the wrong file, which led to my confusion.
Sorry about that.
>
> --
>  i.



--=20

Regards,

      Vishnu Sankar
