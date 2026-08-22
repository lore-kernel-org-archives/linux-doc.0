Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533D349B0D
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424915; cv=pass; b=GrNKfipQGa+OVBl3lXTq2ctohiayBQx3BPNifxTBBjYQgWEeseTDpRTO7Ta0/Iv0uUm129LuOJ58h1tSZyreoITt7DJ7Da6rcNdUeJXKcYFiD8W/MQ4twt+hZsboeNqNmaA2BygDn5x8RFfnELbliX0ZQN1hkSj6gee3NcXEfww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424915; c=relaxed/simple;
	bh=aNr9GYgdP+GbqHKodE3ZKcQDLBHMbLfgSHC1yg+XDUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgSyZPkYBjE7QgMabzQ6yph2q8sj6m4Wjp9Ph3OxvN/fN23qBRiY56PsYrcGmTiCMQ3ZO/wD6EcM6q2XdF5pzo3fUWxuIkNpGmC3AhWwhIs4gWNw3kjJ9KXiT0rLWZberRnT14KuYqtGq1RLnz3ipZBhd9eD8Ftyw2CjYzIEX6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4kdr6NP; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4kdr6NP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5655cc850so25750675ad.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 11:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787424914; cv=none;
        d=google.com; s=arc-20260327;
        b=eDhfJM2/OsZZwTNjSiETW410MhVqFE+ABAT6ED57dLvhQeohEGWk0PnkbpH5iIe3yC
         9nOIJ07ANWiKn7ILFXUuM8OBFgTiLMX1MoVIqdMLKd4peV/Q5osgTIT++tDUDqJ6sgtr
         eassPuYYZPHd2t9KVJeDN3dPJjxJd3SgZ8NRnXo/sKhLpzzCFni5VieBFUjdpa6oTon5
         k1Az13+9tGeJ9Dz7KZiVTzkjLvgFkcEXHYRpw9p5jKyKONzx5SPCxP4sm3XpOHGg489B
         eZuzJt5uXerfjphP+3xCILqS8/Z+g2CV+V7k9S2+17onA5a+/o+JuYXzGke9srPaAtq8
         UK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mvK0RY2HKtmadRl6++lIGpPq87natXNqkqAidZVTzH0=;
        fh=KMLYp2mnPivh+krxSnPU84dWbenItXbLFDxU07Suxe8=;
        b=N3591USCVIrLppTOBLqoAUoVVKhq/IyRNeWhqtzlEBMG97d5RSeYgG108cd2HzaI6Y
         Xj0N7Ze4ZabfcRjGu+5E2mh6RoyZ/Dfm+OO9Gw/wqwXwu6fSvUTbd8vPkve8i9qEfRjz
         xdusrdznNthVC6+DLgOlQTGeE2Fv/5eDxOPljuZaU4j7mVnYdw11qTLICj+4phmLIsY6
         q/UfZA1t6RVGIQKxW3ZM9XuUvmo8kOvkPIduGh8yIWoMLF8ke4XF7T6PSa5X+iycsQdI
         dZAxPhChYRtTzpxgCtjqUF09eeP4V1z4WwSlJPkV7s20T6WdijNrtplnikn0c8V4JXxi
         XE5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787424914; x=1788029714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvK0RY2HKtmadRl6++lIGpPq87natXNqkqAidZVTzH0=;
        b=R4kdr6NPKkVeCfqPggYDLKM75wkUoa8tof8xni4FWBDKyF/lqOmnvK4QAXea8g1A/Q
         LJ8yWt3I/WQ9pI4qwq6cUJizJRRavU1PQeBI5kdiPtfYGNaGGhLnQM0zln7Dkoh+TMwl
         0IsHAfYlKEntLuWSyj2JXcre2VB+TYcPh+g2G7QRHBOqTSSp2y+i5xlJn6wnP4a0TxTb
         6ppAvA0H/2GyYzPMFu/gHrhuYa9XilS0XBRhP8rVIAKdMC7SqAJiZbTqjCdzMbrs16+F
         1u2GHpG2fgYOWZYhgS7T7SJs6hyg5lVPWv+xZE77wltKtxvwS8Jfbmpvut/73y6UocMi
         hEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787424914; x=1788029714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mvK0RY2HKtmadRl6++lIGpPq87natXNqkqAidZVTzH0=;
        b=GD+Nn0Yrs9kElgUoyC7T6ZnqrMF3h8T4I6oUCom9ZHLXzd6BUk+O3rRHUUQ3Si5sg/
         mrfIRVRRC3LIrDptucpcAgAHax/ATpKt4X54b8mo7gKShkyvffv7FcAgwI6eKZ7QLUUN
         1AeKAFHXNspUukEP0MPHLsbQ6N4FJxLje8p5b0m9QHbAPYdYjiXqc0NUuRrz1t+LR9Kz
         VnNwQPaLTI38dX+5EEHQaoublJciae8kUn7zyMZopBLy6nbwONz8garTBaeZQQtUTHvP
         1uIYFSiRhhCNn1M123+aYEgBzblFnSJjo40siGdWg7xBHmalaNcsLMUaQjU76HKgtuzb
         LHfw==
X-Forwarded-Encrypted: i=1; AHgh+RpuGSoa7tyter2A9Myhe0Z0DLaEzl0/73eQcKgS9gMUN/yeeqmlkVC7y80j7re5sXksi9in0brnw/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kIx6eEDYVet3gg6lFMHHUwSoDvquyAgFd16XlHt79rjvVhaP1u
	gt1GpPSEsQi73jiQVbMy68NtXyhluFMKztHOX4LrqfBcqMJkc41RNpi30zoDJ09X2EBdf/FnZTY
	UxgTskeM6gpy5Vl+2r85W+9bZU2xo8Ng=
X-Gm-Gg: AR+sD11ndmIVwn6QHnygfzbLZrLzeYoZkvHG2VZimZZZit3jynoMFL2cJ4kMLGjzxco
	lUM1nRxTsjb7NIYiJSViyMeaSdYhQw64nUELxdaNnNiSTgL1SqBF/Q4MLnWmp3sdY4aftbNCvEi
	3NcYocEEkrIIDLEDYuCtqV9jCXEyNai9kRHy4BEfrQ/fnOHAgHi7LOPrB1u7boFt4O2vrPpTGqu
	jx6iCm71vcIMTBCgpp4Txy+k0aBl0IKISqze2C8JwQO5T6NI/eAkid607XznIw1KYC9c8P9beNS
	LXnfmQQOSrakdCdfEzqu0mKunyJlyGM9ZoJCDXwgBZ92bCVzBX3/sDH7VGmTRJTXyBJYySYaOJO
	/G3rzt+CgjZuptGASPF+K6FuT+XlU03RySK1e1VvVUr8LiiL0EFurGgQ5QUvDxbQcQ3l7om7lKe
	ZfNVworHtYj/8=
X-Received: by 2002:a17:902:e943:b0:2d6:3c2f:69b with SMTP id
 d9443c01a7336-2d64af6f8cemr289247205ad.8.1787424913629; Sat, 22 Aug 2026
 11:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821214728.87773-1-mradityadash@gmail.com> <20260821214728.87773-2-mradityadash@gmail.com>
In-Reply-To: <20260821214728.87773-2-mradityadash@gmail.com>
From: Antheas Kapenekakis <kapenekakis@gmail.com>
Date: Sat, 22 Aug 2026 20:55:02 +0200
X-Gm-Features: AcwNN1XYCgUsRE1L2izsL95rXobTakiN25NcV7-_O-nIURiBuX2hxxdWaTEe8KQ
Message-ID: <CAGwozwEg060P820Kdi3bZ+nFfH6eGXEpx_5Dsnkn_rDsRoNLcA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] platform/x86: lenovo-wmi-other: Add Legion Go
 Full Speed control
To: Aditya Dash <mradityadash@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 23:47, Aditya Dash <mradityadash@gmail.com> wrote:
>
> Selected Legion Go firmware exposes Full Speed as Other Mode feature
> 0x04020000. Capability Data does not describe this feature, so
> lenovo-wmi-other currently ignores it.

Rephrase. Legion Go devices expose .... The current driver does not
handle this ..., add support for the Full Speed attribute ...

> Probe the feature during HWMON setup on those products. If the read
> succeeds and returns a Boolean value, expose it as pwm1_enable. Value 0
> selects Full Speed, and value 2 returns fan control to firmware automatic
> mode. Reject all other values.
>
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |   7 ++
>  drivers/platform/x86/lenovo/wmi-other.c       | 108 +++++++++++++++++-
>  2 files changed, 114 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 011054d64eac..75f2deaaef16 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -49,6 +49,13 @@ The following HWMON attributes are implemented:
>  Due to the internal RPM divisor, the current/target RPMs are rounded down to
>  its nearest multiple. The divisor itself is not necessary to be a power of two.
>
> +Legion Go fan controls
> +----------------------
> +
> +On supported Legion Go models, Other Mode feature ``0x04020000`` controls
> +Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. Value 0
> +enables Full Speed, and value 2 returns fan control to firmware.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index fbb32bf404f2..c180933e1d18 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -32,6 +32,7 @@
>  #include <linux/component.h>
>  #include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
>  #include <linux/hwmon.h>
> @@ -83,6 +84,7 @@ enum lwmi_feature_id_psu {
>         LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR =  0x02,
>  };
>
> +#define LWMI_FEATURE_ID_FAN_FULLSPEED 0x02
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>
>  #define LWMI_TYPE_ID_CROSSLOAD 0x01
> @@ -102,6 +104,10 @@ enum lwmi_feature_id_psu {
>  #define LWMI_CHARGE_TYPE_STANDARD      0x00
>  #define LWMI_CHARGE_TYPE_LONGLIFE      0x01
>
> +#define LWMI_ATTR_ID_FAN_FULLSPEED                                     \
> +       lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_FULLSPEED, \
> +                    LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>         lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>                      LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> @@ -115,6 +121,50 @@ enum lwmi_feature_id_psu {
>
>  static DEFINE_IDA(lwmi_om_ida);
>
> +static const struct dmi_system_id lwmi_fan_dmi_table[] = {
> +       {
> +               .ident = "Lenovo Legion Go 8APU1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go S 8APU1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go S 8ARP1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go 8ASP2",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go 8AHP2",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
> +               },
> +       },
> +       {}
> +};

Why DMI match?

> +
> +static bool lwmi_fan_supported(void)
> +{
> +       return dmi_check_system(lwmi_fan_dmi_table);
> +}

Why not cap match? My version might help you:
https://github.com/anatase-org/patchwork/commit/3d326d36ac8839f5d6f1d3ab1885322bbdf4a3cb

Best,
Antheas

> +
>  enum attribute_property {
>         DEFAULT_VAL,
>         MAX_VAL,
> @@ -144,6 +194,7 @@ struct lwmi_om_priv {
>         int ida_id;
>
>         struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> +       bool fullspeed_supported;
>
>         struct {
>                 bool capdata00_collected : 1;
> @@ -237,6 +288,38 @@ static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val,
>         return (retval == 0 || retval == 1) ? 0 : -EIO;
>  }
>
> +static int lwmi_om_fullspeed_get(struct lwmi_om_priv *priv, long *enable)
> +{
> +       struct wmi_method_args_32 args = {
> +               .arg0 = LWMI_ATTR_ID_FAN_FULLSPEED,
> +       };
> +       u32 value;
> +       int ret;
> +
> +       ret = lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_GET,
> +                                   (u8 *)&args, sizeof(args), &value);
> +       if (ret)
> +               return ret;
> +
> +       if (value > 1)
> +               return -ERANGE;
> +
> +       *enable = value ? 0 : 2;
> +       return 0;
> +}
> +
> +static int lwmi_om_fullspeed_set(struct lwmi_om_priv *priv, bool fullspeed)
> +{
> +       struct wmi_method_args_32 args = {
> +               .arg0 = LWMI_ATTR_ID_FAN_FULLSPEED,
> +               .arg1 = fullspeed,
> +       };
> +
> +       /* The WMI method has no return value. */
> +       return lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_SET,
> +                                    (u8 *)&args, sizeof(args), NULL);
> +}
> +
>  /**
>   * lwmi_om_hwmon_is_visible() - Determine visibility of HWMON attributes
>   * @drvdata: Driver private data
> @@ -255,6 +338,10 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
>         struct lwmi_om_priv *priv = (struct lwmi_om_priv *)drvdata;
>         bool visible = false;
>
> +       if (type == hwmon_pwm && priv->fullspeed_supported && channel == 0 &&
> +           attr == hwmon_pwm_enable)
> +               return 0644;
> +
>         if (type == hwmon_fan) {
>                 if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
>                         return 0;
> @@ -311,6 +398,9 @@ static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>         u32 retval = 0;
>         int err;
>
> +       if (type == hwmon_pwm && attr == hwmon_pwm_enable && channel == 0)
> +               return lwmi_om_fullspeed_get(priv, val);
> +
>         if (type == hwmon_fan) {
>                 switch (attr) {
>                 /*
> @@ -366,6 +456,17 @@ static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>         u32 raw, min_rpm, max_rpm;
>         int err;
>
> +       if (type == hwmon_pwm && attr == hwmon_pwm_enable && channel == 0) {
> +               switch (val) {
> +               case 0:
> +                       return lwmi_om_fullspeed_set(priv, true);
> +               case 2:
> +                       return lwmi_om_fullspeed_set(priv, false);
> +               default:
> +                       return -EINVAL;
> +               }
> +       }
> +
>         if (type == hwmon_fan) {
>                 switch (attr) {
>                 case hwmon_fan_target:
> @@ -420,6 +521,7 @@ static const struct hwmon_channel_info * const lwmi_om_hwmon_info[] = {
>                            HWMON_F_MIN | HWMON_F_MAX,
>                            HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
>                            HWMON_F_MIN | HWMON_F_MAX),
> +       HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
>         NULL
>  };
>
> @@ -440,6 +542,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
>   */
>  static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
> +       long enable;
>         int i, valid;
>
>         if (WARN_ON(priv->hwmon_dev))
> @@ -458,6 +561,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>         if (relax_fan_constraint)
>                 dev_warn(&priv->wdev->dev, "fan RPM constraint relaxed. Use with caution\n");
>
> +       priv->fullspeed_supported =
> +               lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
> +
>         valid = 0;
>         for (i = 0; i < LWMI_FAN_NR; i++) {
>                 if (!(priv->fan_info[i].supported & LWMI_SUPP_VALID))
> @@ -474,7 +580,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>                 }
>         }
>
> -       if (valid == 0) {
> +       if (valid == 0 && !priv->fullspeed_supported) {
>                 dev_warn(&priv->wdev->dev,
>                          "fan reporting/tuning is unsupported on this device\n");
>                 return;

This log is a wart. You dmi match anyway. Preferably, you would cap
match. Even then, silently dropping the unsupported features is
preferrable.

> --
> 2.55.0
>
