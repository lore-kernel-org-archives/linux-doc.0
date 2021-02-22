Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CF2C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 18:10:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CD2764D8F
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 18:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhBVSKW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 13:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhBVSKW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Feb 2021 13:10:22 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C59C06174A
        for <linux-doc@vger.kernel.org>; Mon, 22 Feb 2021 10:09:42 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id s24so14225074iob.6
        for <linux-doc@vger.kernel.org>; Mon, 22 Feb 2021 10:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+giKpRbegYYfbOyat5lyHFg99I4++GstldCObu1z82w=;
        b=GaaRmKxeR67OQoVmLXevbUUsL9qxK17fXoTFCZ3PIEa+MXI9+9xXs7/8pwsf3YpVTv
         tB2y/vkcDrZZpGKHyDG3XqsxEC97QJwO8ite2CqH+c9q3z1PINPHRE4nhjoqx7lM7/yd
         S+t+5ZQrpKOZ7e3xESmEs213W11mdN+LZiej9iZufgiOXlgW3x9Gqs34YbuisGQmO2uW
         5xbs/BgCxHFIq9O+vB3O4Uu9d4s5PxzaR52IK8Ooh8y0DWn2a7S9s9qjxG4TrxeaBfGB
         3M5PEQvSeelfNwZOCWbo7aqgei24aQio3GY4bFQRrEv9CtQbwhpvrHsZiuYwuo1DlY3v
         dMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+giKpRbegYYfbOyat5lyHFg99I4++GstldCObu1z82w=;
        b=BpTQWh+O2V44K7meNWnAPWZ3g2I4TWrcLO84kThg/xgXdZaZjH5s0aiX1h0YZbaq7s
         tCfzStyJXqrgTdctefYZfHa6dFlz9gmV18Fu/Zyr6QTyL2RlBSWAhd4EtdMTou0G6oaC
         ElKFBdVouvqvdgtQvoXA1ZynN7vs9TkrvrSw1AThFSciwZrZWZXhjNe++Oxdfnx0VgM9
         SjDP64fZ8OHVY5Pdpfzq+/4FvPNqu8MPYDRLanArMhwC0vOy8odhadq4oUprgFuPCv7Y
         6F+yR/EcU2db91TmewXBlmJxtLOprMB1zHYeDAQKNaZyGKqymA25RdbGwHnjrgdBnT09
         7mtg==
X-Gm-Message-State: AOAM532pWhBxGNoXkiw+63InRkejDcpU9EEVc8Y0JOeGSU6JRqPo9ErM
        AwFjCv6bAsXsO6UfN50i6REBaehm+rjRvFMldKO0yNNfFIdNdw==
X-Google-Smtp-Source: ABdhPJwu/x3We4/pQ4Y4FXmVZq+ZxyPHRck/C5c6TTZLxn+mTRU0uSshu5w3Vt5KSr+xiwXgT883A/jM2ipmN0cmvYk=
X-Received: by 2002:a05:6602:314b:: with SMTP id m11mr2852611ioy.158.1614017381531;
 Mon, 22 Feb 2021 10:09:41 -0800 (PST)
MIME-Version: 1.0
References: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
In-Reply-To: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Mon, 22 Feb 2021 19:09:30 +0100
Message-ID: <CAKXUXMzBACaZzGkoF772y0pySc+UKyK_iW967nJkJTtVc93+LA@mail.gmail.com>
Subject: Re: Investigating parsing error for struct/union
To:     Aditya <yashsri421@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 22, 2021 at 6:27 PM Aditya <yashsri421@gmail.com> wrote:
>
> Hi Jonathan, Lukas
>
> While investigating "error: Cannot parse struct or union!", I
> discovered few more patterns causing this error:
> 1) A large part of this error(~80%) occurs due to the presence of one
> or more lines(such as '#define' lines) between commented code and
> struct declaration.
>
> For e.g., in include/linux/platform_data/apds990x.h:
>
> /**
>  * struct apds990x_chip_factors - defines effect of the cover window
>  * @ga: Total glass attenuation
>  * @cf1: clear channel factor 1 for raw to lux conversion
>  * @irf1: IR channel factor 1 for raw to lux conversion
>  * @cf2: clear channel factor 2 for raw to lux conversion
>  * @irf2: IR channel factor 2 for raw to lux conversion
>  * @df: device factor for conversion formulas
>  *
>  * Structure for tuning ALS calculation to match with environment.
>  * Values depend on the material above the sensor and the sensor
>  * itself. If the GA is zero, driver will use uncovered sensor default
> values
>  * format: decimal value * APDS_PARAM_SCALE except df which is plain
> integer.
>  */
> #define APDS_PARAM_SCALE 4096
> struct apds990x_chip_factors {
>         int ga;
>         int cf1;
>         int irf1;
>         int cf2;
>         int irf2;
>         int df;
> };
>
>

Aditya, I independently made a similar observation and noted this
issue in my personal notes, which will serve for a cleanup patch
series, as follows:

"SKIP DEFINITIONS" Feature:

The kernel-doc should proceed the code, and the required definition of
data structures should stay close to the function in between the
kernel-doc comment and the function definition.

Let kernel-doc know to skip certain definitions; the actual definition
documented will follow directly after the skipped definitions.

E.g.,

include/linux/cgroup.h:450: task_css_set_check: SKIP DEFINITIONS
(struct mutex cgroup_mutex; spinlock_t css_set_lock)
include/linux/hid-sensor-hub.h:174:
sensor_hub_input_attr_get_raw_value: SKIP DEFINITIONS (enum
sensor_hub_read_flags)

I have not thought about a good syntax for that:

maybe something like:
/**
* foo - description
*
* @arg: description
*
* ::skip: struct bar, enum blub, define MACRO
*/

where "::" serves as some annotation to instruct kernel-doc

> 2) If struct does not contain any members, for e.g., in
> include/linux/xz.h:
>
> /**
>  * struct xz_dec - Opaque type to hold the XZ decoder state
>  */
> struct xz_dec;
>
> Here, it causes error as the curly braces and members expected by the
> regex, are absent.
> This kind of use has also been made in include/linux/zstd.h:
>
> /**
>  * struct ZSTD_DDict - a digested dictionary to be used for decompression
>  */
> typedef struct ZSTD_DDict_s ZSTD_DDict;
>
>
> 3) Different Syntax than expected. For e.g.:
>     a) struct xyz struct_name {} syntax. This syntax has been used in
> arch/arm/mach-omap2/omap_hwmod_common_data.c file
>     b) "static __maybe_unused const struct st_sensors_platform_data
> default_press_pdata = {" in drivers/iio/pressure/st_pressure.h.
> This kind of syntax has also been used in
> drivers/iio/accel/st_accel.h, and drivers/iio/gyro/st_gyro.h
>
> I wanted to take your opinion if we should extend support for any of
> these syntax, causing the error. If not, perhaps we can make the
> documentation a bit clear, atleast for (1), which causes most of these
> errors; so as to not include any lines between comment and struct
> declaration.
>
> What do you think?
>

I certainly appreciate it if you could work on that SKIP_DEFINITION
feature, once we agreed on some first syntax for this feature.

Lukas
