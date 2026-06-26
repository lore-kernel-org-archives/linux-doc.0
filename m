Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581882D8385
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 01:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782437372; cv=pass; b=SVQmXbFOhrTU4/BoQNtk0zHBtCRSqJYsHrpiGdTau1JTBMvwoJXLUCsWXwEpjEOY9tVu924DRyffV5HirjnXTbwEYlqL+oh2+A5ZS7P/9iyM4AWh1JqiQE+e3TNJSeh+pQHZhfLtnlvXWvGfQ/AzUH5hcHbjxUDEAdenkOEytwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782437372; c=relaxed/simple;
	bh=dPA+cAv6wJfVglp6kTL2Q9WqiYIczZLZkh7uBv/P7mQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CP6UHYyC+HG3a4jKSwunyHdinnotPgxyo1+h5aS3UZxYTxk80q9jXOFpCd/+Xul/Hi8zCFn0r2wfe2KMocrtmLu/LRNAq0I5kbTjCOQ4hxLPrN62S9FL7KC1paNgWuEzGNMpRvwc0IKJ0dxkLBk5ZBSFMLGN2jfAsKFlOtpmLT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7tXOodX; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7tXOodX"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3967726bc47so3508591fa.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782437369; cv=none;
        d=google.com; s=arc-20260327;
        b=NBcmrhytuHwU40etEQmbIaHqXStAvn2vQbvlOvmOd2xhW96SddyNqOG402uVVSp6fR
         qpBijQtJfjn0Q4hsQwCQ8SpP/2wkDAuQSgOp/JR4um3Pu9q8K0p44Qu6GiHwiUXkjEi/
         2Qe0p2/vXIHI536rEXxXcB3rqafBWZwlri1+GoQqMQ/twTDs1OIyrK1Kf93vTKm0Hc1A
         NTpBL1BxUYurBg6ai33hzVH5hcq78OVnyuzhQLcidWmU8jHEA4DX1E8nMBFEzAU2Exlc
         Is2SKIbzNv8RX5qBZ0dYi6rrahbkwLcVxIjUTfiQ0mvgs0FS4+sB+Y+G9M8N+PGtoFzD
         yiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a+Tk6Ua+Aq2vYOoByA/2G2JLk2u44/cP19OthE82/HM=;
        fh=ELvOi74/1Vw7zg/JFD50a1kWpF2+rgseqoz+UhtQCYg=;
        b=cQ/Ly4Xp6aiYBlZtBOBlEu1Vh6YqtASVOdNVfJRrXYGQnDIh5jTm87+eai9uo+EOLg
         e4Jt0yh6Dnx6tXMjtVLL3VMrJYAZO0oJHn7JgtbWoFJ9/hsT03HpFHn8caJciGnz1hUq
         44qppG8/7lIJ4KPc4Igqa6CiWRBwwCY99AFXR7UGJwmm3ygoZGGSnxdx+htn6+jihso/
         UrVpo025cO7wahdiOiXFIbQK66GwCtJeBRZ0Cay6d3ydkWsnWBkqLqiOrKVc0AQhxarQ
         1AyuKfSDP1wBaQq0o3GLldbVe7Vl9OUib5Yp3WVfnWno56GMt2y9lo01WpA6gehQWFpX
         mDKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782437369; x=1783042169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+Tk6Ua+Aq2vYOoByA/2G2JLk2u44/cP19OthE82/HM=;
        b=M7tXOodX8lxk2VPKz/9cvxGgmuG7Gn/xtYi4AgBbmKbz4d5gc4WoeV2JXJ8uWEqlwA
         Ve/YvRINo9viq5j3zKaX3qdM14/f82l1cW9quNsueaRUhJhZ1M1V/sEpJwl8pqyRrBBi
         NZWYStcXCgdopweEbubAgAb461sYI1hoyTbLFL0KsGqktIH1QxT52vzeJ7AzF9MpiWnP
         8Ienoaf3mjxguDE2cIStsE4gt96IqGkgOzucjvAw1Tquojqq9pBG7hdLX/6rE0Ph+6A1
         0o598ZS68jS2rrTXgLSE8iLA0Xa23PV+3vtZ8ORCMoVtVG97LsJV1jQM3uTlsF/5NWO8
         tx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782437369; x=1783042169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+Tk6Ua+Aq2vYOoByA/2G2JLk2u44/cP19OthE82/HM=;
        b=lc8jBTwQXCJmjoojkXBOyz0KOtQyX0OEwkY4RFLVgA/0+mxNvgDot8NI6vNRlFn43/
         v9a07ZOFO1IHGXgLkGF6V5EUyjRZfi6+hV/apn+52MMa5r0Q/v9V5SI0vI3acT8G6glk
         6Q/sdIdh49HCh1604tV016bIWZb2jgAgSy33nOD4AQ7Hk3vh+Pll9zV9O4EQp040Fh8Z
         H6P9723FWu/KR1oMc/TxknxfDtDBsgCi+t+susJYbV457r9Bv8RKNnGj8L9cR/rCGUUw
         +Wqkbj4zu1xEIbaF/r3TSz1Po6JrGqGZsL7aE8NwgtrXVxob+1xELIxww2sjpRyuUC5F
         bTNg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6csa06TTjBdn5hYzhKtUxGXJ0vTpJ/B2QudyyryWV4GJMxmqIqdHYZvkGmBIbdf28F3zQldD22ng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0v7bET5tgOrItejiCMUOoVyrTQ3dSHyO9dsNdK89deSrH032s
	Jqc4pb8Lg7pZcaI1sOJrYLvM1VwBHC0nQrhHN1JNUVN5LWLa5lmDxacSchvdvVMsboAVg+HfTBs
	VjV+HEgNNsVHQonKb2kn1XlkWz2Mlkgk=
X-Gm-Gg: AfdE7cnES3nUCVa/aVGnOiE1PL0ggmHQaxrGCLFbaLUBJW0oZb8grsuZZf/01JQxJ68
	VYwWa3mSz3er/+027TWku8LhttoliYbIXQSiz7nmbwQsvC6FRd7Tbu2kFI1ggfLjLcLJwpTbVrQ
	JcmbX3YAE8LRu/gKP3XcodpJNJe9I6af2oxv/9ClJNQmIUqGvDNxz/biSgzqbN+JDyZJq1PfWzT
	b1T8J3e7cTzPWL/uVOLtzG7jlHX21Hph2r2PYhRa5+YS7q6tnYphzgfJqIwMPicwO2yHQ==
X-Received: by 2002:a05:6512:33d1:b0:5aa:8822:f280 with SMTP id
 2adb3069b0e04-5aea2062e82mr1547603e87.48.1782437368257; Thu, 25 Jun 2026
 18:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613225736.30906-1-vishnuocv@gmail.com>
In-Reply-To: <20260613225736.30906-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Fri, 26 Jun 2026 10:28:50 +0900
X-Gm-Features: AVVi8CdEtyxqGp0i_zQpmnd_l8jmZZX0pNSswwOB0QQQELKXZLJLGvLmiTLb9F0
Message-ID: <CABxCQKsvK+SmmhyEWfJwoQ9z9-03iFi6eZ3Aa_LrxaKredGvWA@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
To: mpearson-lenovo@squebb.ca, skhan@linuxfoundation.org, corbet@lwn.net, 
	hmh@hmh.eng.br, hansg@kernel.org, derekjohn.clark@gmail.com, 
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just a gentle ping on the v3 patch below. Just wanted to check if
there are any further review comments or if anything is needed from my
side.

Thanks,
Vishnu

On Sun, Jun 14, 2026 at 7:58=E2=80=AFAM Vishnu Sankar <vishnuocv@gmail.com>=
 wrote:
>
> Newer ThinkPad systems expose a USB-C Security (Restricted Mode) feature.
> When active, USB-C data connections are disabled while power delivery is
> preserved. This is useful for kiosk and physically-secured deployments.
>
> Hardware interface:
>
> The HKEY device exposes a read-only ACPI method USCS():
>
>   Return value bit layout:
>     Bit 16 : Capability flag (1 =3D feature present on this SKU)
>     Bit  0 : Current state  (0 =3D security OFF, 1 =3D security ON)
>
> The sysfs attribute is read-only.
>
> The Fn+U followed by Fn+S hotkey chord is the only way to toggle the
> hardware state.
>
> Hotkey:
>
> Fn+U followed by Fn+S generates HKEY event 0x131e.
>
> sysfs interface:
>
>   /sys/devices/platform/thinkpad_acpi/usb_c_security  (read-only)
>   "enabled\n"  -- data connections are currently blocked
>   "disabled\n" -- data connections are currently allowed
>
>   The attribute is hidden on SKUs where the USCS capability bit (bit 16)
>   is not set, so there is no ABI impact on unsupported hardware.
>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
> Changes since v2:
> - Move usbc_security_enabled out of tp_features bitfield to a bool
>   member of tp_features to avoid unsafe concurrent bitfield RMW;
>   usbc_security_supported remains a bitfield as it is init-only.
> - Pass &tp_features.usbc_security_enabled directly to
>   usbc_security_query() removing the local bool intermediary
>   in both init and hotkey paths.
> - Remove extra blank line before */ in block comment.
> - Fix kerneldoc Returns: syntax and rewrite return value description
>   to match the int return type.
> - Split ternary return into two separate if statements for clarity
>
> Changes since v1:
> - Use guard(mutex) from cleanup.h instead of manual mutex_lock/unlock
> - Revert usbc_security_query() to return int (-EIO/-ENODEV/0) instead
>   of bool to avoid uninitialized *enabled bug on unsupported platforms
> - Remove !! when assigning to bool in usbc_security_query()
> - Remove dead tp_features.usbc_security_supported check in show()
>   since is_visible() already gates the attribute on unsupported SKUs
> - Use str_enabled_disabled() from string_choices.h in show()
> - Fix uninitialized *enabled bug in tpacpi_usbc_security_init() by
>   only assigning usbc_security_enabled after a successful query
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 116 ++++++++++++++++++
>  2 files changed, 140 insertions(+)
>
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Docume=
ntation/admin-guide/laptops/thinkpad-acpi.rst
> index f874db31801d..db4588af0278 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1543,6 +1543,30 @@ Values:
>
>         This setting can also be toggled via the Fn+doubletap hotkey.
>
> +USB-C Security
> +--------------
> +
> +sysfs: usb_c_security
> +
> +Reports the current state of the USB-C Security (Restricted Mode) featur=
e
> +on supported ThinkPad systems. When enabled, USB-C data connections are
> +disabled while power delivery is preserved.
> +
> +The available command is::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/usb_c_security
> +
> +Values:
> +
> +       * ``enabled``  - USB-C data connections are currently blocked
> +       * ``disabled`` - USB-C data connections are currently allowed
> +
> +The attribute is read-only. The USB-C Security state can only be toggled
> +via the Fn+U followed by Fn+S hotkey chord.
> +
> +The sysfs attribute is not created on platforms that do not support this
> +feature.
> +
>  Auxmac
>  ------
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index e1cee42a1683..59b485a57ffe 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -38,6 +38,7 @@
>  #include <linux/backlight.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/freezer.h>
> @@ -66,6 +67,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/string_choices.h>
>  #include <linux/string_helpers.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> @@ -185,6 +187,7 @@ enum tpacpi_hkey_event_t {
>         TP_HKEY_EV_AMT_TOGGLE           =3D 0x131a, /* Toggle AMT on/off =
*/
>         TP_HKEY_EV_CAMERASHUTTER_TOGGLE =3D 0x131b, /* Toggle Camera Shut=
ter */
>         TP_HKEY_EV_DOUBLETAP_TOGGLE     =3D 0x131c, /* Toggle trackpoint =
doubletap on/off */
> +       TP_HKEY_EV_USB_C_SECURITY       =3D 0x131e, /* USB C Security (Fn=
+U, Fn+S) */
>         TP_HKEY_EV_PROFILE_TOGGLE       =3D 0x131f, /* Toggle platform pr=
ofile in 2024 systems */
>         TP_HKEY_EV_PROFILE_TOGGLE2      =3D 0x1401, /* Toggle platform pr=
ofile in 2025 + systems */
>
> @@ -373,6 +376,8 @@ static struct {
>         u32 has_adaptive_kbd:1;
>         u32 kbd_lang:1;
>         u32 trackpoint_doubletap_enable:1;
> +       u32 usbc_security_supported:1;
> +       bool usbc_security_enabled;
>         struct quirk_entry *quirks;
>  } tp_features;
>
> @@ -11265,6 +11270,110 @@ static struct ibm_struct hwdd_driver_data =3D {
>         .name =3D "hwdd",
>  };
>
> +/***********************************************************************=
**
> + * USB-C Security subdriver
> + *
> + * HKEY.USCS(0) is a read-only ACPI method; its argument is ignored.
> + * It always returns:
> + *   bit 16 - USB-C security capability present on this SKU or not
> + *   bit  0 - USB-C Security state (enable or disable)
> + *
> + * Hotkey
> + * ------
> + * 0x131e (Fn+U, Fn+S): firmware toggles USBS before firing the event.
> + * The driver reads back the new state and notifies the sysfs attribute.
> + */
> +
> +/* USCS() return word bit layout */
> +#define USCS_CAP_BIT           BIT(16) /* capability: feature present on=
 SKU */
> +#define USCS_STATUS_BIT                BIT(0)  /* current security state=
 */
> +
> +static DEFINE_MUTEX(usbc_security_mutex);
> +
> +/**
> + * usbc_security_query - read current USB-C security state via USCS()
> + * @enabled: out - true when security is ON (data connections blocked)
> + *
> + * Returns:
> + *   0        success, @enabled contains the current state
> + *  -EIO      ACPI evaluation failed
> + *  -ENODEV   capability bit absent; feature not present on this SKU*
> + */
> +static int usbc_security_query(bool *enabled)
> +{
> +       int status;
> +
> +       guard(mutex)(&usbc_security_mutex);
> +       if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0))
> +               return -EIO;
> +
> +       if (!(status & USCS_CAP_BIT)) {
> +               pr_debug("USCS cap bit absent (raw=3D0x%x)\n", status);
> +               return -ENODEV;
> +       }
> +
> +       *enabled =3D status & USCS_STATUS_BIT;
> +       return 0;
> +}
> +
> +/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security ---------- =
*/
> +static ssize_t usb_c_security_show(struct device *dev,
> +                                  struct device_attribute *attr,
> +                                  char *buf)
> +{
> +       return sysfs_emit(buf, "%s\n",
> +                         str_enabled_disabled(tp_features.usbc_security_=
enabled));
> +}
> +
> +static DEVICE_ATTR_RO(usb_c_security);
> +
> +static struct attribute *usbc_security_attributes[] =3D {
> +       &dev_attr_usb_c_security.attr,
> +       NULL,
> +};
> +
> +static umode_t usbc_security_attr_is_visible(struct kobject *kobj,
> +                                            struct attribute *attr, int =
n)
> +{
> +       return tp_features.usbc_security_supported ? attr->mode : 0;
> +}
> +
> +static const struct attribute_group usbc_security_attr_group =3D {
> +       .is_visible =3D usbc_security_attr_is_visible,
> +       .attrs =3D usbc_security_attributes,
> +};
> +
> +static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
> +{
> +       int err;
> +
> +       err =3D usbc_security_query(&tp_features.usbc_security_enabled);
> +       if (err =3D=3D -ENODEV)
> +               return 0;
> +       if (err)
> +               return err;
> +
> +       tp_features.usbc_security_supported =3D true;
> +       return 0;
> +}
> +
> +/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
> +static bool tpacpi_usbc_security_hotkey(void)
> +{
> +       if (!tp_features.usbc_security_supported)
> +               return false;
> +
> +       if (usbc_security_query(&tp_features.usbc_security_enabled))
> +               return false;
> +
> +       sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "usb_c_security");
> +       return true;
> +}
> +
> +static struct ibm_struct usbc_security_driver_data =3D {
> +       .name =3D "usbc_security",
> +};
> +
>  /* ---------------------------------------------------------------------=
 */
>
>  static struct attribute *tpacpi_driver_attributes[] =3D {
> @@ -11325,6 +11434,7 @@ static const struct attribute_group *tpacpi_group=
s[] =3D {
>         &dprc_attr_group,
>         &auxmac_attr_group,
>         &hwdd_attr_group,
> +       &usbc_security_attr_group,
>         NULL,
>  };
>
> @@ -11479,6 +11589,8 @@ static bool tpacpi_driver_event(const unsigned in=
t hkey_event)
>         case TP_HKEY_EV_PROFILE_TOGGLE2:
>                 platform_profile_cycle();
>                 return true;
> +       case TP_HKEY_EV_USB_C_SECURITY:
> +               return tpacpi_usbc_security_hotkey();
>         }
>
>         return false;
> @@ -11930,6 +12042,10 @@ static struct ibm_init_struct ibms_init[] __init=
data =3D {
>                 .init =3D tpacpi_hwdd_init,
>                 .data =3D &hwdd_driver_data,
>         },
> +       {
> +               .init =3D tpacpi_usbc_security_init,
> +               .data =3D &usbc_security_driver_data,
> +       },
>  };
>
>  static int __init set_ibm_param(const char *val, const struct kernel_par=
am *kp)
> --
> 2.51.0
>


--=20

Regards,

      Vishnu Sankar
