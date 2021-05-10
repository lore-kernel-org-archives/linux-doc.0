Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674A5C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 14:19:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3410460E09
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 14:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbhEJOUF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 10:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbhEJORr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 May 2021 10:17:47 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C271C061377
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 06:53:44 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id l4so24632069ejc.10
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 06:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3/BpnWJEv4o5FfX0aIZJ40Ru/5e0Tbvo6Tknzzoadv8=;
        b=UkesQq7U/Vv6j8enBp4w98nDH5cgHq2J7P37F7StYDrpooPI34/pzSH+hT06U1W2/C
         SrQRPskipuF0pIQL1UWCrC9wa00Z1+Yz3mVw580J9TEeRv3YPQHJNDnWVxiWayqSliYW
         RvfQn8L7qemW7Hrg0OdX5lvb5WihYgqnewGXnOLz045bXvi4zEi2/Oxj+Wauz/coV+oI
         ruLiqiRfuX3z5K7puwuN3t4pIlz9v0QtXaRPLKqSGgZn8bn9dS0VOVSQB9yNuoNxLH6Y
         +PLT34lTaDhXYKBD18/9HqcwDBz7y26rzkTPDRoLriu+O7/qfQSeCtDJd0B1431ESYj1
         CgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3/BpnWJEv4o5FfX0aIZJ40Ru/5e0Tbvo6Tknzzoadv8=;
        b=beGACoy9yRz5J7CnKRP8P9thP6o3Ve3jy67cuR106vBpbnNgtXy3/9SmAOkZsPpoMp
         ZvvsXCea7oqmpPTtFL7x12X1v50xEs269D1dfoPCTEcgk/su/w6ooM+7cLBwoCJUrGvN
         SzHbI/7//jHPbVf4/HmmCAdgPdmDYM9IW5xQ4sN/68pnpRmerQRSO5hyuIWBbNz13OiR
         MgxqfeEpZT048dE/q3zbFhkk2C4/FpdfwvoXOfkXgGyWu5WtaTQDYPx3slBPxDOSdcTn
         x48EsysvduMfiHFp10Uwf4F2342z7DFXt3by0UvyzfLOXglaHGVeSMEdTFPR0NDhUUhJ
         X2BQ==
X-Gm-Message-State: AOAM5330uVIdT2fyZewFi42zf9ewYkuqon0gJwTZibeEmBfojNY6aDE4
        bEavR0469UKFku7SOg45F2lDO1ShU15pMEU2qFPshA==
X-Google-Smtp-Source: ABdhPJxTc1BkzCj3RKu6aUlgFJxgyFP3L14QOJWTKLIzRzZDXDruv3cMRlZzIFPCM95csvx+Esb4EjCSrpUflzt4+aE=
X-Received: by 2002:a17:906:fa86:: with SMTP id lt6mr25351839ejb.547.1620654822363;
 Mon, 10 May 2021 06:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620641727.git.mchehab+huawei@kernel.org> <16298d18c8bada9775e32d5f7f9edf664bce820d.1620641727.git.mchehab+huawei@kernel.org>
In-Reply-To: <16298d18c8bada9775e32d5f7f9edf664bce820d.1620641727.git.mchehab+huawei@kernel.org>
From:   Guenter Roeck <groeck@google.com>
Date:   Mon, 10 May 2021 06:53:30 -0700
Message-ID: <CABXOdTctRP0qHzgJGKXuE6AnroP-J1yJVYEDNQ4O-NKMC0ajcA@mail.gmail.com>
Subject: Re: [PATCH 41/53] docs: ABI: avoid using UTF-8 chars
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Steven Price <steven.price@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Tom Rix <trix@redhat.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 10, 2021 at 3:27 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> While UTF-8 characters can be used at the Linux documentation,
> the best is to use them only when ASCII doesn't offer a good replacement.
> So, replace the occurences of the following UTF-8 characters:
>
>         - U+2013 ('=E2=80=93'): EN DASH
>         - U+2018 ('=E2=80=98'): LEFT SINGLE QUOTATION MARK
>         - U+2019 ('=E2=80=99'): RIGHT SINGLE QUOTATION MARK
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  .../ABI/testing/sysfs-class-chromeos-driver-cros-ec-lightbar  | 2 +-
>  Documentation/ABI/testing/sysfs-class-net-cdc_ncm             | 2 +-
>  Documentation/ABI/testing/sysfs-devices-platform-ipmi         | 2 +-
>  Documentation/ABI/testing/sysfs-devices-platform-trackpoint   | 2 +-
>  Documentation/ABI/testing/sysfs-devices-soc                   | 4 ++--
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-class-chromeos-driver-cros-e=
c-lightbar b/Documentation/ABI/testing/sysfs-class-chromeos-driver-cros-ec-=
lightbar
> index 57a037791403..a7fb8f1169f2 100644
> --- a/Documentation/ABI/testing/sysfs-class-chromeos-driver-cros-ec-light=
bar
> +++ b/Documentation/ABI/testing/sysfs-class-chromeos-driver-cros-ec-light=
bar
> @@ -29,7 +29,7 @@ KernelVersion:        4.2
>  Description:
>                 This allows you to control each LED segment. If the
>                 lightbar is already running one of the automatic
> -               sequences, you probably won=E2=80=99t see anything change=
 because
> +               sequences, you probably won't see anything change because
>                 your color setting will be almost immediately replaced.
>                 To get useful results, you should stop the lightbar
>                 sequence first.
> diff --git a/Documentation/ABI/testing/sysfs-class-net-cdc_ncm b/Document=
ation/ABI/testing/sysfs-class-net-cdc_ncm
> index 06416d0e163d..41a1eef0d0e7 100644
> --- a/Documentation/ABI/testing/sysfs-class-net-cdc_ncm
> +++ b/Documentation/ABI/testing/sysfs-class-net-cdc_ncm
> @@ -93,7 +93,7 @@ Contact:      Bj=C3=B8rn Mork <bjorn@mork.no>
>  Description:
>                 - Bit 0: 16-bit NTB supported (set to 1)
>                 - Bit 1: 32-bit NTB supported
> -               - Bits 2 =E2=80=93 15: reserved (reset to zero; must be i=
gnored by host)
> +               - Bits 2 - 15: reserved (reset to zero; must be ignored b=
y host)
>
>  What:          /sys/class/net/<iface>/cdc_ncm/dwNtbInMaxSize
>  Date:          May 2014
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-ipmi b/Docu=
mentation/ABI/testing/sysfs-devices-platform-ipmi
> index 07df0ddc0b69..3935cdedea0e 100644
> --- a/Documentation/ABI/testing/sysfs-devices-platform-ipmi
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-ipmi
> @@ -52,7 +52,7 @@ Date:         Mar, 2006
>  KernelVersion: v2.6.17
>  Contact:       openipmi-developer@lists.sourceforge.net
>  Description:
> -               (RO) Lists the IPMI =E2=80=98logical device=E2=80=99 comm=
ands and functions
> +               (RO) Lists the IPMI 'logical device' commands and functio=
ns
>                 that the controller supports that are in addition to the
>                 mandatory IPM and Application commands.
>
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-trackpoint =
b/Documentation/ABI/testing/sysfs-devices-platform-trackpoint
> index df11901a6b3d..82a38ac0435c 100644
> --- a/Documentation/ABI/testing/sysfs-devices-platform-trackpoint
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-trackpoint
> @@ -105,7 +105,7 @@ KernelVersion:      3.19
>  Contact:       linux-input@vger.kernel.org
>  Description:
>                 (RW) This parameter controls the period of time to test f=
or a
> -               =E2=80=98hands off=E2=80=99 condition (i.e. when no force=
 is applied) before a
> +               'hands off' condition (i.e. when no force is applied) bef=
ore a
>                 drift (noise) calibration occurs.
>
>                 IBM Trackpoints have a feature to compensate for drift by
> diff --git a/Documentation/ABI/testing/sysfs-devices-soc b/Documentation/=
ABI/testing/sysfs-devices-soc
> index ea999e292f11..7f90c6a44610 100644
> --- a/Documentation/ABI/testing/sysfs-devices-soc
> +++ b/Documentation/ABI/testing/sysfs-devices-soc
> @@ -27,11 +27,11 @@ Description:
>                 (e.g. DB8500).
>
>                 On many of ARM based silicon with SMCCC v1.2+ compliant f=
irmware
> -               this will contain the JEDEC JEP106 manufacturer=E2=80=99s=
 identification
> +               this will contain the JEDEC JEP106 manufacturer's identif=
ication
>                 code. The format is "jep106:XXYY" where XX is identity co=
de and
>                 YY is continuation code.
>
> -               This manufacturer=E2=80=99s identification code is define=
d by one
> +               This manufacturer's identification code is defined by one
>                 or more eight (8) bit fields, each consisting of seven (7=
)
>                 data bits plus one (1) odd parity bit. It is a single fie=
ld,
>                 limiting the possible number of vendors to 126. To expand
> --
> 2.30.2
>
