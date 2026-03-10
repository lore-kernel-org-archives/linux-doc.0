Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F7837FF6B
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 02:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108746; cv=pass; b=OXka8WDo2kQxy+OTgtqVmGBO6lqCO4NtRSEYq8bB0AwHLJveCWL251yqicyu/0WsOd5XBV/A0NQrGFx2apDpBKgVeJbCaekoc4cwyYOlo6plb0HF9ckJ0AeQ19D03ti5g89emD4Kb8Ie/htDpgn3yVjinYOUMg1GMKb7sjp9l4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108746; c=relaxed/simple;
	bh=qInFR7+ruku82QTeduGJJurbtW8DPI5C9OdU4RWav24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXAxIYuYgazXZUXUOJrnJZzo6zIom7tywGc2BfveoxSy+Gwt/M+un74aB2WbzK7NapTPJ5QHHqX1CGZ8Oc4vGvyOqa5Qcv6u/eN95Tf0zSzm+PaS1AcLkEtWSjkm0KlA+rLzZpMVChVoe3ezgNxRIfhdD6pYTD/JgORtCV4b9aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaFVSkng; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaFVSkng"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a2e62b893so47072121fa.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 19:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773108743; cv=none;
        d=google.com; s=arc-20240605;
        b=j/zO2UdT6pGZKC5OfOi1D+Hy6ZJ8jTH9gXZbMvNXCWxGP5EkpOs6uWUkABFGRSuLym
         Br4H3b5GQxHODV/6Kl9WL2ROfxPP0LQG20vFfyOCjOLzePNMrWz3JH7OKPpf0rOXJdq/
         9+5G5a11IdkTSBa3zCeRvJ2JaE7qdm/zkXdCOrAtrJaRDgLqXV4TYTdGDqQEq3oelfbD
         cxx+FywZ2v6x+AHD9q2QmcGdNpvAefUX8iJS5OXocxPZpYuIg1nKXHztuFjc8MQWRaGR
         27Z2yqZcqJLDdcgWWacUGvSMSBpxvm9jC7oTOWt0yojYijUlPcSNG3G43E8By2ozqHNA
         UQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KtlsLU3IPO5uqXUZY8olaTkPpadXjE8FCVLC/ftGY8Q=;
        fh=MH/z6knmaUm8fmSccv1YGnk5hdsHMwtXlFL+5JM15Ow=;
        b=IXj6OZBBzBV4uKsHW+hpdxTV6teT5oaC1V1NNhyJsnZIhPZABxuQ3C2d1n8VIcja95
         r2qOWLNQRayy+uWF0PUVVEBz+jtIY+4msJ96xOdgT4kefAsAs7jexbDnxC6L/IIhL/+a
         hOFtwh1nGeNvgzCzkETKz4R7EH78SDu0BQahCQWpwUTga7zor8hJUHJeZMCRRx2oan4k
         bC/oK3xzx3eEjmBhac/jITLEw3sh6D2dZ9Q7MXNFnyY8hbs+N7BASBuMNgJWzM9Jd1kU
         26MrU0wPe6N5k6N5F6qVFWo7OP5kkNVyQg6Mj1R/S1xbVZH77nRfqhm8UqXDFX5drsbV
         BLdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773108743; x=1773713543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtlsLU3IPO5uqXUZY8olaTkPpadXjE8FCVLC/ftGY8Q=;
        b=NaFVSkngboq1hHClKBNqJ3FuhfV0ZssRBy4ZTnxtJvCgURRChosdINNJB++x8ET3ew
         AeiJ9xDiUY3byUaJbIGDmTTouK4gaXztLmfSw2Q4x+0sT4erJvvUBqU6o48Z4nWge674
         DMJQyu4T2bHoxPwaxPMjKUAdQD90AYzZmPC1BG3hR16BkuV8XvI9x15N5rZLJHj1oja2
         rbjIMuAn4xF+Q/57f15taFtBCwjNmlqO+e86ppNn7h14IRC9guKptVhqRYR8wiECu5Ri
         UhWrk7lnr4hjxi2XPVMpmLmyaVL3H4yaZJSFSVUDfn31jM8VJh0+RRZonxU00LgWCEdL
         bzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773108743; x=1773713543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KtlsLU3IPO5uqXUZY8olaTkPpadXjE8FCVLC/ftGY8Q=;
        b=gTmfdPHVabQUKHsFH32G8BsC2+5iOKfiWsKA7oSlD4yDSo6wkjRJsC0rnIyb/Od+zw
         SXy68zGEK7DkY50tNrCqxdsXBdkS9aeNOY3HgAH1n8Jb6JDFTAOR6XLy43/TfC30kcNH
         ApU1bMfIyROsse9gVKYRkmhwcR+i5ln6Zrpo2c4hYFC4tpTKLn4kIOE1ixxhg++Men9w
         KEzTd/HhbeOu5jFB3JPYpqr421/2aSNb+2UXxse1/I3cncJmu6CB0gUma1L1xKjA/vbd
         XMkQ8PBxFr0D2Rv2Ec34iJ3XoNHOtD9Y3v0dxSgiS3aPqXBgH09UoAAgv1eya/pGOEIr
         FDYg==
X-Forwarded-Encrypted: i=1; AJvYcCVDGf16ontGolR7nm5kOaVgLwLpRWp+Xw+J0LsxhFw+snmQ5iDj9jg/i7D8WbV32ZZq5fMyyI9XKes=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOr4NWZj+3+r9xtpY45P50FPizHRjOe/t04zA76mgGuodX6gYU
	QL61K0DsYNU59gm6ThcYAP/Fkll14y2fevQczxfQuvuFjsGum1s2R/VwMaFs+m3KvwdaTfK7y18
	IMmEqONa77mFxF/fGJkLSVvS4K8qOoLg=
X-Gm-Gg: ATEYQzz8Oe+EfLwS2w0NLyLmj8gk1/8s0qXpW7+RmZuAM/+nAn2OJ1qdeOXHQ6QD+vA
	hyu0KZHS3az4DBh+VgiIcb/Daq5PFwg9PdMOQPNu5Vz26jVt+LNeEbC1fZ1XccyW2EN5o4AXhYR
	U4p0jK7FVCESpkYjtspNzFaL9NVsDempFOQZsFYv5BgK8nf2P8O6LsGGSzS6Z9bNTN1vqapPI5+
	1Bf+fIvm49LaHAQcpoVAtGolN6JihvZ7lPdtx/8SyldwgJtyxL/pILufbBG+hUs1VCDPicUcWm5
	apHSpO0AtoHuaf0=
X-Received: by 2002:a05:6512:640f:b0:5a1:2fcb:1da4 with SMTP id
 2adb3069b0e04-5a13cabad88mr4615178e87.11.1773108742407; Mon, 09 Mar 2026
 19:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-2-vishnuocv@gmail.com>
 <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com>
In-Reply-To: <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 10 Mar 2026 11:11:44 +0900
X-Gm-Features: AaiRm50mcZVhLubnwdp-BsgTf6noF_Wn1o5ArrsQT_Cbsc-4CO86otqEZNqhq_c
Message-ID: <CABxCQKtf=RYrpgnbM0ODo3GA0oW3jgR=_erc9RCD6gEasasA+A@mail.gmail.com>
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

Thank you so much for the review.

On Mon, Mar 9, 2026 at 5:01=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 9 Feb 2026, Vishnu Sankar wrote:
>
> > Enable doubletap functionality by default on TrackPoint devices that
> > support it. The feature is detected using firmware ID pattern matching
> > (PNP: LEN03xxx) with a deny list of incompatible devices.
> >
> > This provides immediate doubletap functionality without requiring
> > userspace configuration. The hardware is enabled during device
> > detection, while event filtering continues to be handled by the
> > thinkpad_acpi driver as before.
> >
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > Changes in v7:
> > - Removed unwanted comments
> > - Removed psmouse_info ()
> >
> > Changes in v6:
> > - No Changes
> >
> > Changes in v5:
> > - Renamed function to trackpoint_is_dt_capable()
> > - Simplified string comparison without sscanf()
> > - Removed wrapper function as suggested
> > - Fixed missing period in comment
> >
> > Changes in v4:
> > - Simplified approach: removed all sysfs attributes and user interface
> > - Enable doubletap by default during device detection
> > - Removed global variables and complex attribute infrastructure
> > - Uses minimal firmware ID detection with deny list
> > - Follows KISS principle as suggested by reviewers
> >
> > Changes in v3:
> > - No changes
> >
> > Changes in v2:
> > - Improve commit messages
> > - Sysfs attributes moved to trackpoint.c
> > - Removed unnecessary comments
> > - Removed unnecessary debug messages
> > - Using strstarts() instead of strcmp()
> > - is_trackpoint_dt_capable() modified
> > - Removed _BIT suffix and used BIT() define
> > - Reverse the trackpoint_doubletap_status() logic to return error first
> > - Removed export functions as a result of the design change
> > - Changed trackpoint_dev->psmouse to parent_psmouse
> > - The path of trackpoint.h is not changed
> > ---
> >  drivers/input/mouse/trackpoint.c | 45 ++++++++++++++++++++++++++++++++
> >  drivers/input/mouse/trackpoint.h |  5 ++++
> >  2 files changed, 50 insertions(+)
> >
> > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/tra=
ckpoint.c
> > index 5f6643b69a2c..e12d76350252 100644
> > --- a/drivers/input/mouse/trackpoint.c
> > +++ b/drivers/input/mouse/trackpoint.c
> > @@ -393,6 +393,45 @@ static int trackpoint_reconnect(struct psmouse *ps=
mouse)
> >       return 0;
> >  }
> >
> > +/* List of known incapable device PNP IDs */
> > +static const char * const dt_incompatible_devices[] =3D {
> > +     "LEN0304",
> > +     "LEN0306",
> > +     "LEN0317",
> > +     "LEN031A",
> > +     "LEN031B",
> > +     "LEN031C",
> > +     "LEN031D",
> > +};
> > +
> > +/*
> > + * Checks if it's a doubletap capable device.
> > + * The PNP ID format is "PNP: LEN030d PNP0f13".
> > + */
> > +static bool trackpoint_is_dt_capable(const char *pnp_id)
> > +{
> > +     size_t i;
> > +
> > +     if (!pnp_id)
> > +             return false;
> > +
> > +     /* Must start with "PNP: LEN03" */
> > +     if (!strstarts(pnp_id, "PNP: LEN03"))
>
> Missing include.
Sorry, I am a bit confused here:
strstarts() is already available through the existing
#include <linux/string.h> in thinkpad_acpi.c.

Do you think I should do anything else here?
>
> > +             return false;
> > +
> > +     /* Ensure enough length before comparing */
> > +     if (strlen(pnp_id) < 12)
> > +             return false;
> > +
> > +     /* Check deny-list */
> > +     for (i =3D 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
>
> Missing include for ARRAY_SIZE().
Acked.
Will add linux/array_size.h to the include list.
>
> > +             if (!strncmp(pnp_id + 5,
> > +                          dt_incompatible_devices[i], 7))
>
> Fits to one line.
Understood.
will come up with v8 soon.
>
> > +                     return false;
> > +     }
> > +     return true;
> > +}
> > +
> >  int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
> >  {
> >       struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> > @@ -470,6 +509,12 @@ int trackpoint_detect(struct psmouse *psmouse, boo=
l set_properties)
> >                    psmouse->vendor, firmware_id,
> >                    (button_info & 0xf0) >> 4, button_info & 0x0f);
> >
> > +     if (trackpoint_is_dt_capable(ps2dev->serio->firmware_id)) {
> > +             error =3D trackpoint_write(ps2dev, TP_DOUBLETAP, TP_DOUBL=
ETAP_ENABLE);
> > +             if (error)
> > +                     psmouse_warn(psmouse, "Failed to enable doubletap=
: %d\n", error);
> > +     }
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/tra=
ckpoint.h
> > index eb5412904fe0..3e03cdb39449 100644
> > --- a/drivers/input/mouse/trackpoint.h
> > +++ b/drivers/input/mouse/trackpoint.h
> > @@ -69,6 +69,8 @@
> >                                       /* (how hard it is to drag */
> >                                       /* with Z-axis pressed) */
> >
> > +#define TP_DOUBLETAP         0x58    /* TrackPoint doubletap register =
*/
> > +
> >  #define TP_MINDRAG           0x59    /* Minimum amount of force needed=
 */
> >                                       /* to trigger dragging */
> >
> > @@ -110,6 +112,9 @@
> >                                          external device will be forced=
 to 1 */
> >  #define TP_MASK_EXT_TAG                      0x04
> >
> > +/* Doubletap register values */
> > +#define TP_DOUBLETAP_ENABLE  0xFF    /* Enable value */
> > +#define TP_DOUBLETAP_DISABLE 0xFE    /* Disable value */
> >
> >  /* Power on Self Test Results */
> >  #define TP_POR_SUCCESS               0x3B
> >
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
