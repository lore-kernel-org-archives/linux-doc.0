Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC31280329
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 00:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779840610; cv=pass; b=O6DoDYcEEO7+RZtryE3DH+LflkPcBs7nrta0qGtsGuRQxytplxtZu4Y6eNkkEQ9fACy0y0jGfhIxoA9/z8nnjBO1r4pCwa/gNeOqvv9v026UMYXlVHTY2X1rsODyYm3EVedwumeRCT0eS+HJfWI5YWz5HXIVKaE6Vdgze0tx9vU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779840610; c=relaxed/simple;
	bh=L33PMpmqldJE8hUwdrP4yB/KEPLiHIqLF9aQuKNtiK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eU24W0mapNqJVIKkQ+FGqXqcJraIU4tCwofl8VWw1FyiVCGvgojvcJgPIoubdLY1qxyan7PVqX1/XQKnVDxS7XD9MVFjJRpqnhM7eQg+/cE+U7Z6fdYhkT9E38XsIZy8lkcsdcsJ/rMcdOYxR2M779FkberMsGWMweEwffk93Z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7gE0VVp; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7gE0VVp"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8891febd2so14770365e87.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 17:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779840602; cv=none;
        d=google.com; s=arc-20240605;
        b=Mh+uL/yh3IR64BSZAtKJb3mNd4xBRI0IgTWS2SgSC3DohJ5/k0Vlu2fs1VHNHS4YpG
         +gV3ivEN4vPJpsrwaUT0TDG0zj9TqR9oj/Ta7jMdQZd6yhelBcOu0e+2+sbyZUjAHAvQ
         dxY9PPdDC8DyceabT4pFSPp3bzl7IFY7Mq00Kk4gWQ74MdPx+NnqqqX4Nh2EHqAsp2qY
         2Ofw+jfNqQL2Hy/2Op2pWDAij7in32CTRFqx3iYHt9Y+yb0HwHUAoYjr1wWgbX7WZ2eM
         yCnFq5WOsPkEIyR7/fzkFaCiGbPV6sx7juaDioRfOQDFOIrLumL5l0tYN4q0VaIHS874
         5WBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1dUEn5ycQfesG2lJ3B+UmfZ9JOjta7vw0pjQ9lZ6tM0=;
        fh=SvaCmvctlCmUm0o3t6KCWt/9fsTd+i0P/00KytBJaEo=;
        b=fEAOlmmIG9+xOD7rzwrcLl+WcTss+kebM7vZQEKkcSrxfvlKp+zkAdu8LvXfKF7wq9
         LFIjDIXQh58aucrmEITMvyqdqz7spW0axOLDj10jL1bHe91yTswD1joHkm/BDeU0vG87
         E+2TrYHxUXLdJeQHa8A+4gvC3PIvFyowLkxmhnFeC/J9uGeI3xjhKQdSTgJgNLZEz4wx
         y4wZf2X3+wA/frwfmkcreXowtpvt1bT+EnO8j0EW0reyU42jXht+pxq30w+tmKUxf0cw
         PLYwYHLLNNnaKswSiNAd1NtW2FVluYpzZ4SkN7XBdLHosQHsFtxtPLZ3OIooMeH01fiQ
         6ECg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779840602; x=1780445402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dUEn5ycQfesG2lJ3B+UmfZ9JOjta7vw0pjQ9lZ6tM0=;
        b=W7gE0VVphxx6n3an44rKhZRc+ahDz2sbeRsKnZjcIWdics5R4cPu4mfZ6iieZRpXr9
         yixME7jsIIsdB45nTZVeJleODKRcQFwVkqnrNMyA/MYyQkQzuJw0r4PEbaORtlUfyRJy
         CI6xmBnlcIo2pWdmM80Oxga1gaOLytOzqWvQ71SUiUBAosUfNa91dlkBoT8GE97LKY/H
         BbZn5cYkd1Y5xceC7rG5AftpBPrkeuE/Gepz6scKMZ0ciwX2VB1cqIdok4Nd3JL1kpBM
         j0F3+CyXG/772Gak9cNS4W/VahMMSUJ8Zu19Pgr2pOV3M3oCh/gwNdW8OThTr5XwQ3oJ
         yyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779840602; x=1780445402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1dUEn5ycQfesG2lJ3B+UmfZ9JOjta7vw0pjQ9lZ6tM0=;
        b=KqwtYsJgiTrOIXglbGrM2Q4Ah9a1XhA6W3DjmQyuKtS0iF8bIf9SoaeIn1YsX6hORw
         pya4v/gYkdVeyFDPhzB1YKwLYz1mPt3N2qwin9CxtMEvBAZxbrX+2+UeO+ZmTMALCYGq
         jkUY7vT1pUdYs2QeHXRdz5feggXKdK5OukFmIRB7/TQydQ6wDMfAphGvaeVH+sSD8q7H
         PqOdKLm6afhMNEoyT+xmrQwJGtHJK+QrdM/mDFZKz1xyUSYgcP/T7165CAfs+tJf2G67
         Vo7QkH7237MlMQHsx5/lO5kYuSd18CR43xSD97ZhD1yEoFt1mV8S+OUOGq7z8h0I0OBU
         wp/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+4BNAbeb90y0ZAymh/H/FtKfj/imTolDyZN6uUocN6icvQFl5flnuDdM5W3DmbTm3+Lv7sSPPfIKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwKT6eKnGDhnYIV2P9QGNcES+5CUf4frPlfOFTo0pVm0DtNbXV
	s3zqwC9/WqRvLOxXuDS2NMTLM295mA4ThzXxm/UHyCQIWqnPsfoGMxvBKioJz+ezFJv0E6mWnoR
	AzzTMkKmE0yUOVLwtdXJ154ojQMtoXFc=
X-Gm-Gg: Acq92OFQxGIJR6RdbwpkhyhVgs4gs16JX8sllgZArB8GvHUUJPvV3YuIGmJ5Ee0kwMY
	ZEVUedT0LS0q5bU6J6UTrhI/D6LkTHs2y+FRqb/k1yp+gBmclYBShFkR64Xcb7eKoUngTWnhqhV
	v70iZuEndjQBtAwqzL9bolqgIgwUQc/Gvmlu4XkE3JntETugaepwJlKHdjNuL/GrQNLBiKTw9K6
	pltbQg1OakADuBs8vMCYPLl2CrKpmFx1lmhVLgAqba2C73lWDLxbGnYloaSUVzDv+Yk4eTBSg7O
	d2q8IH2vEsxYeeGxVg==
X-Received: by 2002:a05:6512:1108:b0:5aa:106f:87bb with SMTP id
 2adb3069b0e04-5aa3237d3d0mr5981253e87.3.1779840601715; Tue, 26 May 2026
 17:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522100715.20036-1-vishnuocv@gmail.com> <c4c0632b-0a24-8956-9557-69b927e451fb@linux.intel.com>
 <CABxCQKuWt-iGENEaC_gNFMfWHrr80zJe_xnwEQz1Q-1yADcDOg@mail.gmail.com> <d9f33111-cd96-a37f-cf3f-23f6758c7e18@linux.intel.com>
In-Reply-To: <d9f33111-cd96-a37f-cf3f-23f6758c7e18@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 27 May 2026 09:09:25 +0900
X-Gm-Features: AVHnY4K8wwM0WjCO9By7whwNo4J5Dc7g3yxToCZixcCz3ew9PRR1atOagGd-Z9k
Message-ID: <CABxCQKupvszZb6-7qKJkXftFtFhu+MobLgbqQ=nK9JGPApLooQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, skhan@linuxfoundation.org, hmh@hmh.eng.br, 
	Hans de Goede <hansg@kernel.org>, corbet@lwn.net, derekjohn.clark@gmail.com, 
	LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 6:16=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 26 May 2026, Vishnu Sankar wrote:
>
> > Hi Ilpo,
> >
> > Thank you for the comments.
> >
> > On Tue, May 26, 2026 at 2:19=E2=80=AFAM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Fri, 22 May 2026, Vishnu Sankar wrote:
> > >
> > > > Newer ThinkPad systems expose a USB-C Security (Restricted Mode) fe=
ature.
> > > > When active, USB-C data connections are disabled while power delive=
ry is
> > > > preserved. This is useful for kiosk and physically-secured deployme=
nts.
> > > >
> > > > Hardware interface:
> > > >
> > > > The HKEY device exposes a read-only ACPI method USCS():
> > > >
> > > >   Return value bit layout:
> > > >     Bit 16 : Capability flag (1 =3D feature present on this SKU)
> > > >     Bit  0 : Current state  (0 =3D security OFF, 1 =3D security ON)
> > > >
> > > > The sysfs attribute is read-only.
> > > >
> > > > The Fn+U followed by Fn+S hotkey chord is the only way to toggle th=
e
> > > > hardware state.
> > > >
> > > > Hotkey:
> > > >
> > > > Fn+U followed by Fn+S generates HKEY event 0x131e.
> > > >
> > > > sysfs interface:
> > > >
> > > >   /sys/devices/platform/thinkpad_acpi/usb_c_security  (read-only)
> > > >   "enabled\n"  -- data connections are currently blocked
> > > >   "disabled\n" -- data connections are currently allowed
> > > >
> > > >   The attribute is hidden on SKUs where the USCS capability bit (bi=
t 16)
> > > >   is not set, so there is no ABI impact on unsupported hardware.
> > > >
> > > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > > > ---
> > > >  .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
> > > >  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 115 ++++++++++++++=
++++
> > > >  2 files changed, 139 insertions(+)
> > > >
> > > > diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/=
Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > > index f874db31801d..db4588af0278 100644
> > > > --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > > +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > > @@ -1543,6 +1543,30 @@ Values:
> > > >
> > > >       This setting can also be toggled via the Fn+doubletap hotkey.
> > > >
> > > > +USB-C Security
> > > > +--------------
> > > > +
> > > > +sysfs: usb_c_security
> > > > +
> > > > +Reports the current state of the USB-C Security (Restricted Mode) =
feature
> > > > +on supported ThinkPad systems. When enabled, USB-C data connection=
s are
> > > > +disabled while power delivery is preserved.
> > > > +
> > > > +The available command is::
> > > > +
> > > > +        cat /sys/devices/platform/thinkpad_acpi/usb_c_security
> > > > +
> > > > +Values:
> > > > +
> > > > +     * ``enabled``  - USB-C data connections are currently blocked
> > > > +     * ``disabled`` - USB-C data connections are currently allowed
> > > > +
> > > > +The attribute is read-only. The USB-C Security state can only be t=
oggled
> > > > +via the Fn+U followed by Fn+S hotkey chord.
> > > > +
> > > > +The sysfs attribute is not created on platforms that do not suppor=
t this
> > > > +feature.
> > > > +
> > > >  Auxmac
> > > >  ------
> > > >
> > > > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/=
platform/x86/lenovo/thinkpad_acpi.c
> > > > index e1cee42a1683..889db802185a 100644
> > > > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > > @@ -185,6 +185,7 @@ enum tpacpi_hkey_event_t {
> > > >       TP_HKEY_EV_AMT_TOGGLE           =3D 0x131a, /* Toggle AMT on/=
off */
> > > >       TP_HKEY_EV_CAMERASHUTTER_TOGGLE =3D 0x131b, /* Toggle Camera =
Shutter */
> > > >       TP_HKEY_EV_DOUBLETAP_TOGGLE     =3D 0x131c, /* Toggle trackpo=
int doubletap on/off */
> > > > +     TP_HKEY_EV_USB_C_SECURITY       =3D 0x131e, /* Toggle USB C S=
ecurity ON/OFF */
> > > >       TP_HKEY_EV_PROFILE_TOGGLE       =3D 0x131f, /* Toggle platfor=
m profile in 2024 systems */
> > > >       TP_HKEY_EV_PROFILE_TOGGLE2      =3D 0x1401, /* Toggle platfor=
m profile in 2025 + systems */
> > > >
> > > > @@ -373,6 +374,8 @@ static struct {
> > > >       u32 has_adaptive_kbd:1;
> > > >       u32 kbd_lang:1;
> > > >       u32 trackpoint_doubletap_enable:1;
> > > > +     u32 usbc_security_supported:1;
> > > > +     u32 usbc_security_enabled:1;
> > > >       struct quirk_entry *quirks;
> > > >  } tp_features;
> > > >
> > > > @@ -11265,6 +11268,111 @@ static struct ibm_struct hwdd_driver_data=
 =3D {
> > > >       .name =3D "hwdd",
> > > >  };
> > > >
> > > > +/*****************************************************************=
********
> > > > + * USB-C Security subdriver
> > > > + *
> > > > + * HKEY.USCS(0) is a read-only ACPI method; its argument is ignore=
d.
> > > > + * It always returns:
> > > > + *   bit 16 - USB-C security capability present on this SKU or not
> > > > + *   bit  0 - USB-C Security state (enable or disable)
> > > > + *
> > > > + * Hotkey
> > > > + * ------
> > > > + * 0x131e (Fn+U, Fn+S): firmware toggles USBS before firing the ev=
ent.
> > > > + * The driver reads back the new state and notifies the sysfs attr=
ibute.
> > > > + *
> > > > + */
> > > > +
> > > > +/* USCS() return word bit layout */
> > > > +#define USCS_CAP_BIT         BIT(16) /* capability: feature presen=
t on SKU */
> > > > +#define USCS_STATUS_BIT              BIT(0)  /* current security s=
tate */
> > > > +
> > > > +static DEFINE_MUTEX(usbc_security_mutex);
> > > > +
> > > > +/*
> > > > + * usbc_security_query - read current USB-C security state via USC=
S()
> > > > + * @enabled: out - true when security is ON (data connections bloc=
ked)
> > > > + *
> > > > + * Returns true if the feature is supported and query succeeded,
> > > > + * false otherwise (feature absent or ACPI call failed).
> > > > + */
> > > > +static bool usbc_security_query(bool *enabled)
> > > > +{
> > > > +     int status;
> > > > +
> > > > +     mutex_lock(&usbc_security_mutex);
> > > > +     if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0)) {
> > > > +             mutex_unlock(&usbc_security_mutex);
> > > > +             return false;
> > > > +     }
> > > > +     mutex_unlock(&usbc_security_mutex);
> > >
> > > Please use cleanup.h.
> > Will do.
> > Will replace the manual mutex_lock/unlock pattern with guard(mutex).
> > >
> > > > +
> > > > +     if (!(status & USCS_CAP_BIT)) {
> > > > +             pr_debug("USCS cap bit absent (raw=3D0x%x)\n", status=
);
> > > > +             return false;
> > > > +     }
> > > > +
> > > > +     *enabled =3D !!(status & USCS_STATUS_BIT);
> > >
> > > No need to do !! when assigning to bool.
> > Agreed, will remove the !!.
> > >
> > > > +     return true;
> > > > +}
> > > > +
> > > > +/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security -----=
----- */
> > > > +static ssize_t usb_c_security_show(struct device *dev,
> > > > +                                struct device_attribute *attr,
> > > > +                                char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "%s\n",
> > > > +                       tp_features.usbc_security_enabled ? "enable=
d" : "disabled");
> > >
> > > Please use string_choices.h.
> > Will use str_enabled_disabled() which is already used in
> > thinkpad_acpi.c for similar pattern.
> > >
> > > > +}
> > > > +
> > > > +static DEVICE_ATTR_RO(usb_c_security);
> > > > +
> > > > +static struct attribute *usbc_security_attributes[] =3D {
> > > > +     &dev_attr_usb_c_security.attr,
> > > > +     NULL,
> > > > +};
> > > > +
> > > > +static umode_t usbc_security_attr_is_visible(struct kobject *kobj,
> > > > +                                          struct attribute *attr, =
int n)
> > > > +{
> > > > +     return tp_features.usbc_security_supported ? attr->mode : 0;
> > > > +}
> > > > +
> > > > +static const struct attribute_group usbc_security_attr_group =3D {
> > > > +     .is_visible =3D usbc_security_attr_is_visible,
> > > > +     .attrs =3D usbc_security_attributes,
> > > > +};
> > > > +
> > > > +static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
> > > > +{
> > > > +     bool enabled;
> > > > +
> > > > +     tp_features.usbc_security_supported =3D
> > > > +             usbc_security_query(&enabled);
> > >
> > > Fits to one line.
> > Acked.
> > >
> > > > +     tp_features.usbc_security_enabled =3D enabled;
> > >
> > > I'm not sure I follow the logic here as you always seem set it enable=
d
> > > disregarding even support or not?
> > >
> > > And that hotkey enabling seems deadcode with it already enabled here.
> > >
> > > I feel like I must blind to something obvious but cannot just find
> > > what that would be.
> > I'm sorry, this is a bug.
> > I will change to the following:
> >     tp_features.usbc_security_supported =3D usbc_security_query(&enable=
d);
> >     if (tp_features.usbc_security_supported)
> >         tp_features.usbc_security_enabled =3D enabled;
> >
> > The hotkey path is not dead code =E2=80=94 it updates usbc_security_ena=
bled
> > when the user presses Fn+U Fn+S, since the EC firmware toggles the
> > state and fires the event. The init only captures the state at boot;
> > subsequent toggles come through the hotkey. Sorry for the confusion in
> > the init code.
>
> Oh, I see now what I was missing and it's just as obvious I was I
> thinking... I, for some reason, read these as:
>
>         tp_features.usbc_security_enabled =3D true;
>
> ...but you had =3D enabled there. I'm sorry about my confusion.
>
> I find the the way usbc_security_query() is architected a bit confusing
> though, it returns supported/not supported in return value and another
> boolean through the bool pointer. And that looks broken, if
> usbc_security_query() returns early, it won't set *enabled which then
> remains uninitialized (contains pseudogarbage from stack so your testing
> might have been luck and had it always working the way you wanted).
Yes, the usbc_security_query() is confusing and does have the
uninitialized *enabled bug.
I only tested on systems that have the USB-C Security feature, so the
unsupported path
was never exercised and the bug was not caught.

I will do something like this:

    static int usbc_security_query(bool *enabled)
    {
        int status;

        guard(mutex)(&usbc_security_mutex);
        if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0))
            return -EIO;

        if (!(status & USCS_CAP_BIT))
            return -ENODEV;

        *enabled =3D status & USCS_STATUS_BIT;
        return 0;
    }

With this, *enabled is only ever read after a successful return 0, so
the uninitialized value issue may not happen. Init and hotkey paths
become straightforward as well.
Hope this is fine.
>
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) =
*/
> > > > +static bool tpacpi_usbc_security_hotkey(void)
> > > > +{
> > > > +     bool enabled;
> > > > +
> > > > +     if (!tp_features.usbc_security_supported)
> > > > +             return false;
> > > > +
> > > > +     if (!usbc_security_query(&enabled))
> > > > +             return false;
> > > > +
> > > > +     tp_features.usbc_security_enabled =3D enabled;
> > > > +     sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "usb_c_security");
> > > > +     return true;
> > > > +}
> > > > +
> > > > +static struct ibm_struct usbc_security_driver_data =3D {
> > > > +     .name =3D "usbc_security",
> > > > +};
> > > > +
> > > >  /* ---------------------------------------------------------------=
------ */
> > > >
> > > >  static struct attribute *tpacpi_driver_attributes[] =3D {
> > > > @@ -11325,6 +11433,7 @@ static const struct attribute_group *tpacpi=
_groups[] =3D {
> > > >       &dprc_attr_group,
> > > >       &auxmac_attr_group,
> > > >       &hwdd_attr_group,
> > > > +     &usbc_security_attr_group,
> > > >       NULL,
> > > >  };
> > > >
> > > > @@ -11479,6 +11588,8 @@ static bool tpacpi_driver_event(const unsig=
ned int hkey_event)
> > > >       case TP_HKEY_EV_PROFILE_TOGGLE2:
> > > >               platform_profile_cycle();
> > > >               return true;
> > > > +     case TP_HKEY_EV_USB_C_SECURITY:
> > > > +             return tpacpi_usbc_security_hotkey();
> > > >       }
> > > >
> > > >       return false;
> > > > @@ -11930,6 +12041,10 @@ static struct ibm_init_struct ibms_init[] =
__initdata =3D {
> > > >               .init =3D tpacpi_hwdd_init,
> > > >               .data =3D &hwdd_driver_data,
> > > >       },
> > > > +     {
> > > > +             .init =3D tpacpi_usbc_security_init,
> > > > +             .data =3D &usbc_security_driver_data,
> > > > +     },
> > > >  };
> > > >
> > > >  static int __init set_ibm_param(const char *val, const struct kern=
el_param *kp)
> > > >
> > >
> > > --
> > >  i.
> > >
> >
> > I will update the v2 with all these changes soon, if no further comment=
s.
> >
>
> --
>  i.



--=20

Regards,

      Vishnu Sankar
