Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ABDC6FA69
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 17:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbiH2RQQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 13:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbiH2RQN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 13:16:13 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B82A786CA
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 10:16:11 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id h5so5464667ejb.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=j2z/n7eMw3f3j7EBd6Q4JVoMSwtLsVBiipYe75KuXHg=;
        b=TKbYjetujPctiPYNjbkJ9aq8EL/rgg0D25oRV4c705d2jwFlUNO/wk19ajGMSNo2kw
         8dycZyi9V+9vzrQURZiMwf+sb2PX62rESS1GXTknyDQeyrT2F5OuhWmYbp7Z4c22wCVf
         1vUXRQ+2SR3kxT62M6Fpn7gn/0ZKbTLWESU0JvD76UPknnzefl3lKeHriXjdoavUAVD7
         UChJhcg9PqFbrWkK/gzNRi6lcOlukmgk4Q3FTUDLOpNncjJDYn97S0vmiiaq+b835/Nj
         Dlmym/55nlX5PdmBm6McpbjxtXq7ahtV5t162Zn57rjtzm+KkjAb+d8MG4OAqb8/mX1n
         h7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=j2z/n7eMw3f3j7EBd6Q4JVoMSwtLsVBiipYe75KuXHg=;
        b=UebidB2iibDXBF1UDHYYEna5iKKi/3Kwb6l8oRaskCOhamc/2f0aHNIQ2c5yY6vout
         sCsUyzhX13DMokAvr87z8s3aKA9DueESaWYBAOFuEuNbE9ON0OgBBd5BzSP93n2uhSTy
         /mWoBDpe4HQ/DWCLKS3+OpvD/Cg/aSfttoBFl/Wq/PfRGSs0mqmQSXiReeSyJjinz25C
         fb93xrKVotdNNalWZGpCxFQETfpQUe6NOhKKBnfTyQHcTQH4xpVf2z7addfu+MlYzTt1
         2M4QrNS7CJuq5mqgBoy8/4ZBShcdWDVTp+jBJt7zRkUpcFn6m/f172jiU/Znk2LmfLGL
         8aEg==
X-Gm-Message-State: ACgBeo3MqTIUw8MKXkmQ+NqyhnjdDktdBxVkvIByoa6v9ev9m0lABqhd
        iBrH3Q33B6LS+EhbIZhSGUaNsItpd97i/k2/Dw5ttt7Iueg=
X-Google-Smtp-Source: AA6agR5x6VZN3zVomElWr0Y4N4SPNr2IokZM89ZoLvJJ3bnv8SVxPEvKEdqtkCsXiLZxgIniRgJ3mxhx39JLn51f3Ks=
X-Received: by 2002:a17:907:97cd:b0:731:5d0:4434 with SMTP id
 js13-20020a17090797cd00b0073105d04434mr13484082ejc.603.1661793369740; Mon, 29
 Aug 2022 10:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220829024351.2415147-1-justinledford@google.com>
 <20220829132017.GA3039965@roeck-us.net> <CAHCvCEcGvrS=3p2Whj0Cmx9sx+aSzX2097LahQ=f3eRCCAN_bA@mail.gmail.com>
 <20220829161135.GB1320973@roeck-us.net>
In-Reply-To: <20220829161135.GB1320973@roeck-us.net>
From:   Justin Ledford <justinledford@google.com>
Date:   Mon, 29 Aug 2022 10:15:58 -0700
Message-ID: <CAHCvCEc27ozgr6pthRZ84FzJnhM+X705RJpW4z4SB-P9dV_aSg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (max31790) add fanN_enable
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 29, 2022 at 9:11 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Aug 29, 2022 at 08:09:21AM -0700, Justin Ledford wrote:
> > The tach input isn't enabled in the device by default. So the only way
> > to start using the fan input sensors is to set the regulator mode
> > through the driver to RPM mode and then back to whatever mode you
> > actually want to use. The I2C interface to the device doesn't couple
> > the tach input to the regulator mode so I don't think it makes sense
> > for the driver to do this either.
> >
> Please don't top-post.
>
> The above does not answer my question why fan_config[] wound need to
> be updated repeatedly.
>
> Guenter
>
> > On Mon, Aug 29, 2022 at 6:20 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On Mon, Aug 29, 2022 at 02:43:51AM +0000, Justin Ledford wrote:
> > > > The MAX31790 has a tach input enable bit in each fan's configuration
> > > > register. This is only enabled by the driver if RPM mode is selected,
> > > > but the driver doesn't provide a way to independently enable tachometer
> > > > input regardless of the regulator mode.
> > > >
> > > > By adding the fanN_enable sysfs files, we can decouple the tach input
> > > > from the regulator mode. Also update the documentation.
> > > >
> > > > Signed-off-by: Justin Ledford <justinledford@google.com>
> > > > ---
> > > >  Documentation/hwmon/max31790.rst |  1 +
> > > >  drivers/hwmon/max31790.c         | 44 +++++++++++++++++++++++++++-----
> > > >  2 files changed, 38 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
> > > > index 7b097c3b9b90..33c5c7330efc 100644
> > > > --- a/Documentation/hwmon/max31790.rst
> > > > +++ b/Documentation/hwmon/max31790.rst
> > > > @@ -38,6 +38,7 @@ Sysfs entries
> > > >  fan[1-12]_input    RO  fan tachometer speed in RPM
> > > >  fan[1-12]_fault    RO  fan experienced fault
> > > >  fan[1-6]_target    RW  desired fan speed in RPM
> > > > +fan[1-6]_enable    RW  enable or disable the tachometer input
> > > >  pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
> > > >  pwm[1-6]           RW  read: current pwm duty cycle,
> > > >                         write: target pwm duty cycle (0-255)
> > > > diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> > > > index 7e9362f6dc29..3ae02be4b41e 100644
> > > > --- a/drivers/hwmon/max31790.c
> > > > +++ b/drivers/hwmon/max31790.c
> > > > @@ -118,6 +118,12 @@ static struct max31790_data *max31790_update_device(struct device *dev)
> > > >                                       goto abort;
> > > >                               data->target_count[i] = rv;
> > > >                       }
> > > > +
> > > > +                     rv = i2c_smbus_read_byte_data(client,
> > > > +                                     MAX31790_REG_FAN_CONFIG(i));
> > > > +                     if (rv < 0)
> > > > +                             goto abort;
> > > > +                     data->fan_config[i] = rv;
> > >
> > > Why is this needed ?
> > >
> > > Guenter
> > >

This is needed in case the fan_config is changed outside the driver
with something like i2ctransfer, so that the driver reports the actual
state of the device, rather than the state at the time of the last
write originating from the driver.

> > > >               }
> > > >
> > > >               data->last_updated = jiffies;
> > > > @@ -202,6 +208,9 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
> > > >               }
> > > >               mutex_unlock(&data->update_lock);
> > > >               return 0;
> > > > +     case hwmon_fan_enable:
> > > > +             *val = !!(data->fan_config[channel] & MAX31790_FAN_CFG_TACH_INPUT_EN);
> > > > +             return 0;
> > > >       default:
> > > >               return -EOPNOTSUPP;
> > > >       }
> > > > @@ -214,7 +223,7 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
> > > >       struct i2c_client *client = data->client;
> > > >       int target_count;
> > > >       int err = 0;
> > > > -     u8 bits;
> > > > +     u8 bits, fan_config;
> > > >       int sr;
> > > >
> > > >       mutex_lock(&data->update_lock);
> > > > @@ -243,6 +252,23 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
> > > >                                       MAX31790_REG_TARGET_COUNT(channel),
> > > >                                       data->target_count[channel]);
> > > >               break;
> > > > +     case hwmon_fan_enable:
> > > > +             fan_config = data->fan_config[channel];
> > > > +             if (val == 0) {
> > > > +                     fan_config &= ~MAX31790_FAN_CFG_TACH_INPUT_EN;
> > > > +             } else if (val == 1) {
> > > > +                     fan_config |= MAX31790_FAN_CFG_TACH_INPUT_EN;
> > > > +             } else {
> > > > +                     err = -EINVAL;
> > > > +                     break;
> > > > +             }
> > > > +             if (fan_config != data->fan_config[channel]) {
> > > > +                     err = i2c_smbus_write_byte_data(client, MAX31790_REG_FAN_CONFIG(channel),
> > > > +                                                     fan_config);
> > > > +                     if (!err)
> > > > +                             data->fan_config[channel] = fan_config;
> > > > +             }
> > > > +             break;
> > > >       default:
> > > >               err = -EOPNOTSUPP;
> > > >               break;
> > > > @@ -270,6 +296,10 @@ static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
> > > >                   !(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
> > > >                       return 0644;
> > > >               return 0;
> > > > +     case hwmon_fan_enable:
> > > > +             if (channel < NR_CHANNEL)
> > > > +                     return 0644;
> > > > +             return 0;
> > > >       default:
> > > >               return 0;
> > > >       }
> > > > @@ -423,12 +453,12 @@ static umode_t max31790_is_visible(const void *data,
> > > >
> > > >  static const struct hwmon_channel_info *max31790_info[] = {
> > > >       HWMON_CHANNEL_INFO(fan,
> > > > -                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > -                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > -                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > -                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > -                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > -                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
> > > > +                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> > > > +                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> > > > +                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> > > > +                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> > > > +                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> > > > +                        HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
> > > >                          HWMON_F_INPUT | HWMON_F_FAULT,
> > > >                          HWMON_F_INPUT | HWMON_F_FAULT,
> > > >                          HWMON_F_INPUT | HWMON_F_FAULT,
> > > > --
> > > > 2.37.2.672.g94769d06f0-goog
> > > >
