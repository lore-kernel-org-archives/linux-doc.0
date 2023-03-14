Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B93C6FD1F
	for <linux-doc@archiver.kernel.org>; Tue, 14 Mar 2023 18:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjCNSSm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjCNSSe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Mar 2023 14:18:34 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF5114997
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 11:18:09 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id m6so3618260qvq.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678817888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/oXPUDws4BJmskLg06ZOZmdtGjsDoZUu//GQ8EHZUQ=;
        b=dKEdwytrGx3bim3/p9GLNa5u3Sf39opNFbejQRt+FhF9cKHpUQJCOaGp1NTK0spM42
         UPQw+17WasHSJH2xT28RoJxx2OXeDTNCFJdbNFC0ZKLhUTxef+xhK7mrfSC8sEdFh8Nd
         2+3SvoLy9PxMG7U9hCE/JdocJtAeTPy4Z9xok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678817888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/oXPUDws4BJmskLg06ZOZmdtGjsDoZUu//GQ8EHZUQ=;
        b=ZbHQipprbSew0aFOacJOffpk3k0QjLR/L5aGtNtxZEcswD6NgNlv+tjHrD3Kz35Nt8
         OS6NEHK114DJ1qpPi4p8MpUsg12c9Vxe9l6EWogn4XcekBabez4nWvFvQeNUcuTA0UwN
         vDuzFI5zWXKNioTGYKIF1dEl/o5zZrWDJk2gUsChl4GvK4Lq9HK0Sem27S1diVRDdTSH
         D/xpmlb2mNMPTxfPAmKlBbSvogPcD+o0wkhULg1GcZInpgWZBD2b+w2MMX1bFKcsCTJQ
         i8V70R4PbV86GzG3rFIGP+ziQZE3tDVFDQGCiOGLctfjJQZH/bo9NOvWUojWnsux6ocD
         1B8g==
X-Gm-Message-State: AO0yUKV1eqwG+m4e4YpSMAu8MTNDziKE/ot0VDT7aed9ddnZB5rnnSes
        sguVR+jkfRmqUiv6QIb1YeS+OPWoOy8swbp1UN4=
X-Google-Smtp-Source: AK7set8h+jCCWm4o84yBmGGewJi21Njo5mi/wnBaFhhgiTkT5CVqWSv+K2Dm1KTOt18WTMDe4iRevw==
X-Received: by 2002:a05:6214:b63:b0:5aa:9502:4ec1 with SMTP id ey3-20020a0562140b6300b005aa95024ec1mr10830525qvb.49.1678817888243;
        Tue, 14 Mar 2023 11:18:08 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id d6-20020ac800c6000000b003bb8c60cdf1sm2243995qtg.78.2023.03.14.11.18.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 11:18:06 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id i6so16614546ybu.8
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 11:18:06 -0700 (PDT)
X-Received: by 2002:a5b:24c:0:b0:b3b:a48c:b23e with SMTP id
 g12-20020a5b024c000000b00b3ba48cb23emr5696849ybp.2.1678817885569; Tue, 14 Mar
 2023 11:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230313100414.v7.1.I8e7f9b01d9ac940507d78e15368e200a6a69bedb@changeid>
 <CAHUa44HQkdN3dgtDA=_J-TUm=AY69=em4Ox6R3q8wj-sLhh+Cw@mail.gmail.com>
In-Reply-To: <CAHUa44HQkdN3dgtDA=_J-TUm=AY69=em4Ox6R3q8wj-sLhh+Cw@mail.gmail.com>
From:   Jeffrey Kardatzke <jkardatzke@chromium.org>
Date:   Tue, 14 Mar 2023 11:17:53 -0700
X-Gmail-Original-Message-ID: <CA+ddPcNiYnMV_1B-BAbdBusbYrGKWRrHtXG+D0Zf65pS_av5MQ@mail.gmail.com>
Message-ID: <CA+ddPcNiYnMV_1B-BAbdBusbYrGKWRrHtXG+D0Zf65pS_av5MQ@mail.gmail.com>
Subject: Re: [PATCH v7] tee: optee: Add SMC for loading OP-TEE image
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     op-tee@lists.trustedfirmware.org, Jonathan Corbet <corbet@lwn.net>,
        Sumit Garg <sumit.garg@linaro.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 14, 2023 at 4:24=E2=80=AFAM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> On Mon, Mar 13, 2023 at 6:16=E2=80=AFPM Jeffrey Kardatzke
> <jkardatzke@chromium.org> wrote:
> >
> > Adds an SMC call that will pass an OP-TEE binary image to EL3 and
> > instruct it to load it as the BL32 payload. This works in conjunction
> > with a feature added to Trusted Firmware for ARMv8 and above
> > architectures that supports this.
> >
> > The main purpose of this change is to facilitate updating the OP-TEE
> > component on devices via a rootfs change rather than having to do a
> > firmware update. Further details are linked to in the Kconfig file.
> >
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@chromium.org>
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > ---
> >
> > Changes in v7:
> > - Added documentation to Documentation/staging/tee.rst
> >
> > Changes in v6:
> > - Expanded Kconfig documentation
> >
> > Changes in v5:
> > - Renamed config option
> > - Added runtime warning when config is used
> >
> > Changes in v4:
> > - Update commit message
> > - Added more documentation
> > - Renamed config option, added ARM64 dependency
> >
> > Changes in v3:
> > - Removed state tracking for driver reload
> > - Check UID of service to verify it needs image load
> >
> > Changes in v2:
> > - Fixed compile issue when feature is disabled
> > - Addressed minor comments
> > - Added state tracking for driver reload
> >
> >  Documentation/staging/tee.rst | 41 +++++++++++++++
> >  drivers/tee/optee/Kconfig     | 17 ++++++
> >  drivers/tee/optee/optee_msg.h | 12 +++++
> >  drivers/tee/optee/optee_smc.h | 24 +++++++++
> >  drivers/tee/optee/smc_abi.c   | 97 +++++++++++++++++++++++++++++++++++
> >  5 files changed, 191 insertions(+)
> >
> > diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.=
rst
> > index 498343c7ab08..315aa8e35e6b 100644
> > --- a/Documentation/staging/tee.rst
> > +++ b/Documentation/staging/tee.rst
> > @@ -214,6 +214,47 @@ call is done from the thread assisting the interru=
pt handler. This is a
> >  building block for OP-TEE OS in secure world to implement the top half=
 and
> >  bottom half style of device drivers.
> >
> > +OPTEE_INSECURE_LOAD_IMAGE Kconfig option
> > +----------------------------------------
> > +
> > +The OPTEE_INSECURE_LOAD_IMAGE Kconfig option enables the ability to lo=
ad the
> > +BL32 OP-TEE image from the kernel after the kernel boots, rather than =
loading
> > +it from the firmware before the kernel boots. This also requires enabl=
ing the
> > +corresponding option in Trusted Firmware for Arm. The documentation th=
ere
> > +explains the security threat associated with enabling this as well as
> > +mitigations at the firmware and platform level.
> > +https://trustedfirmware-a.readthedocs.io/en/latest/threat_model/threat=
_model.html
> > +
> > +There are additional attack vectors/mitigations for the kernel that sh=
ould be
> > +addressed when using this option.
> > +
> > +1. Boot chain security.
> > +   Attack vector: Replace the OP-TEE OS image in the rootfs to gain co=
ntrol of
> > +                  the system.
> > +   Migitation: There must be boot chain security that verifies the ker=
nel and
> > +               rootfs, otherwise an attacker can modify the loaded OP-=
TEE
> > +               binary by modifying it in the rootfs.
> > +3. Alternate boot modes.
> > +   Attack vector: Using an alternate boot mode (i.e. recovery mode), t=
he OP-TEE
> > +                  driver isn't loaded, leaving the SMC hole open.
> > +   Mitigation: If there are alternate methods of booting the device, s=
uch as a
> > +               recovery mode, it should be ensured that the same mitig=
ations are
> > +               applied in that mode.
> > +3. Attacks prior to SMC invocation.
> > +   Attack vector: Code that is executed prior to issuing the SMC call =
to load
> > +                  OP-TEE can be exploited to then load an alternate OS=
 image.
> > +   Mitigation: The OP-TEE driver must be loaded before any potential a=
ttack
> > +               vectors are opened up. This should include mounting of =
any
> > +               modifiable filesystems, opening of network ports or com=
municating
> > +               with external devices (e.g. USB).
> > +4. Blocking SMC call to load OP-TEE.
> > +   Attack vector: Prevent the driver from being probed, so the SMC cal=
l to load
> > +                  OP-TEE isn't executed when desired, leaving it open =
to being
> > +                  executed later and loading a modified OS.
> > +   Mitigation: It is recommended to build the OP-TEE driver as an incl=
uded
> > +               driver rather than a module to prevent exploits that ma=
y cause
> > +               the module to not be loaded.
> > +
> >  AMD-TEE driver
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> > index f121c224e682..70898bbd5809 100644
> > --- a/drivers/tee/optee/Kconfig
> > +++ b/drivers/tee/optee/Kconfig
> > @@ -7,3 +7,20 @@ config OPTEE
> >         help
> >           This implements the OP-TEE Trusted Execution Environment (TEE=
)
> >           driver.
> > +
> > +config OPTEE_INSECURE_LOAD_IMAGE
> > +       bool "Load OP-TEE image as firmware"
> > +       default n
> > +       depends on OPTEE && ARM64
> > +       help
> > +         This loads the BL32 image for OP-TEE as firmware when the dri=
ver is
> > +         probed. This returns -EPROBE_DEFER until the firmware is load=
able from
> > +         the filesystem which is determined by checking the system_sta=
te until
> > +         it is in SYSTEM_RUNNING. This also requires enabling the corr=
esponding
> > +         option in Trusted Firmware for Arm. The documentation there e=
xplains
> > +         the security threat associated with enabling this as well as
> > +         mitigations at the firmware and platform level.
> > +         https://trustedfirmware-a.readthedocs.io/en/latest/threat_mod=
el/threat_model.html
> > +
> > +         Additional documentation on kernel security risks are at
> > +         Documentation/staging/tee.rst.
> > diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_ms=
g.h
> > index 70e9cc2ee96b..e8840a82b983 100644
> > --- a/drivers/tee/optee/optee_msg.h
> > +++ b/drivers/tee/optee/optee_msg.h
> > @@ -241,11 +241,23 @@ struct optee_msg_arg {
> >   * 384fb3e0-e7f8-11e3-af63-0002a5d5c51b.
> >   * Represented in 4 32-bit words in OPTEE_MSG_UID_0, OPTEE_MSG_UID_1,
> >   * OPTEE_MSG_UID_2, OPTEE_MSG_UID_3.
> > + *
> > + * In the case where the OP-TEE image is loaded by the kernel, this wi=
ll
> > + * initially return an alternate UID to reflect that we are communicat=
ing with
> > + * the TF-A image loading service at that time instead of OP-TEE. That=
 UID is:
> > + * a3fbeab1-1246-315d-c7c4-06b9c03cbea4.
> > + * Represented in 4 32-bit words in OPTEE_MSG_IMAGE_LOAD_UID_0,
> > + * OPTEE_MSG_IMAGE_LOAD_UID_1, OPTEE_MSG_IMAGE_LOAD_UID_2,
> > + * OPTEE_MSG_IMAGE_LOAD_UID_3.
> >   */
> >  #define OPTEE_MSG_UID_0                        0x384fb3e0
> >  #define OPTEE_MSG_UID_1                        0xe7f811e3
> >  #define OPTEE_MSG_UID_2                        0xaf630002
> >  #define OPTEE_MSG_UID_3                        0xa5d5c51b
> > +#define OPTEE_MSG_IMAGE_LOAD_UID_0     0xa3fbeab1
> > +#define OPTEE_MSG_IMAGE_LOAD_UID_1     0x1246315d
> > +#define OPTEE_MSG_IMAGE_LOAD_UID_2     0xc7c406b9
> > +#define OPTEE_MSG_IMAGE_LOAD_UID_3     0xc03cbea4
> >  #define OPTEE_MSG_FUNCID_CALLS_UID     0xFF01
> >
> >  /*
> > diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_sm=
c.h
> > index 73b5e7760d10..7d9fa426505b 100644
> > --- a/drivers/tee/optee/optee_smc.h
> > +++ b/drivers/tee/optee/optee_smc.h
> > @@ -104,6 +104,30 @@ struct optee_smc_call_get_os_revision_result {
> >         unsigned long reserved1;
> >  };
> >
> > +/*
> > + * Load Trusted OS from optee/tee.bin in the Linux firmware.
> > + *
> > + * WARNING: Use this cautiously as it could lead to insecure loading o=
f the
> > + * Trusted OS.
> > + * This SMC instructs EL3 to load a binary and execute it as the Trust=
ed OS.
> > + *
> > + * Call register usage:
> > + * a0 SMC Function ID, OPTEE_SMC_CALL_LOAD_IMAGE
> > + * a1 Upper 32bit of a 64bit size for the payload
> > + * a2 Lower 32bit of a 64bit size for the payload
> > + * a3 Upper 32bit of the physical address for the payload
> > + * a4 Lower 32bit of the physical address for the payload
> > + *
> > + * The payload is in the OP-TEE image format.
> > + *
> > + * Returns result in a0, 0 on success and an error code otherwise.
> > + */
> > +#define OPTEE_SMC_FUNCID_LOAD_IMAGE 2
> > +#define OPTEE_SMC_CALL_LOAD_IMAGE \
> > +       ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, \
> > +                          ARM_SMCCC_OWNER_TRUSTED_OS_END, \
> > +                          OPTEE_SMC_FUNCID_LOAD_IMAGE)
> > +
> >  /*
> >   * Call with struct optee_msg_arg as argument
> >   *
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index a1c1fa1a9c28..00b6b69b6f79 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -8,9 +8,11 @@
> >
> >  #include <linux/arm-smccc.h>
> >  #include <linux/errno.h>
> > +#include <linux/firmware.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/irqdomain.h>
> > +#include <linux/kernel.h>
> >  #include <linux/mm.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -1149,6 +1151,22 @@ static bool optee_msg_api_uid_is_optee_api(optee=
_invoke_fn *invoke_fn)
> >         return false;
> >  }
> >
> > +#ifdef CONFIG_OPTEE_INSECURE_LOAD_IMAGE
> > +static bool optee_msg_api_uid_is_optee_image_load(optee_invoke_fn *inv=
oke_fn)
> > +{
> > +       struct arm_smccc_res res;
> > +
> > +       invoke_fn(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0, 0, &res);
> > +
> > +       if (res.a0 =3D=3D OPTEE_MSG_IMAGE_LOAD_UID_0 &&
> > +          res.a1 =3D=3D OPTEE_MSG_IMAGE_LOAD_UID_1 &&
> > +          res.a2 =3D=3D OPTEE_MSG_IMAGE_LOAD_UID_2 &&
> > +          res.a3 =3D=3D OPTEE_MSG_IMAGE_LOAD_UID_3)
> > +               return true;
> > +       return false;
> > +}
> > +#endif
> > +
> >  static void optee_msg_get_os_revision(optee_invoke_fn *invoke_fn)
> >  {
> >         union {
> > @@ -1354,6 +1372,81 @@ static void optee_shutdown(struct platform_devic=
e *pdev)
> >                 optee_disable_shm_cache(optee);
> >  }
> >
> > +#ifdef CONFIG_OPTEE_INSECURE_LOAD_IMAGE
> > +
> > +#define OPTEE_FW_IMAGE "optee/tee.bin"
> > +
> > +static int optee_load_fw(struct platform_device *pdev,
> > +                        optee_invoke_fn *invoke_fn)
>
> Please align with the '(' on the line above.
I think it's just misaligned in the email due to some other formatting
reason...it's correct when I look at it in the editor with tab sizes
set to 8. The diff will also look misaligned by one because the plus
sign on the second line is stealing one of the spaces from the tab.
>
> > +{
> > +       const struct firmware *fw =3D NULL;
> > +       struct arm_smccc_res res;
> > +       phys_addr_t data_pa;
> > +       u8 *data_buf =3D NULL;
> > +       u64 data_size;
> > +       u32 data_pa_high, data_pa_low;
> > +       u32 data_size_high, data_size_low;
> > +       int rc;
> > +
> > +       if (!optee_msg_api_uid_is_optee_image_load(invoke_fn))
> > +               return 0;
> > +
> > +       rc =3D request_firmware(&fw, OPTEE_FW_IMAGE, &pdev->dev);
> > +       if (rc) {
> > +               /*
> > +                * The firmware in the rootfs will not be accessible un=
til we
> > +                * are in the SYSTEM_RUNNING state, so return EPROBE_DE=
FER until
> > +                * that point.
> > +                */
> > +               if (system_state < SYSTEM_RUNNING)
> > +                       return -EPROBE_DEFER;
> > +               goto fw_err;
> > +       }
> > +
> > +       data_size =3D fw->size;
> > +       /*
> > +        * This uses the GFP_DMA flag to ensure we are allocated memory=
 in the
> > +        * 32-bit space since TF-A cannot map memory beyond the 32-bit =
boundary.
> > +        */
> > +       data_buf =3D kmalloc(fw->size, GFP_KERNEL | GFP_DMA);
> > +       if (!data_buf) {
> > +               rc =3D -ENOMEM;
> > +               goto fw_err;
> > +       }
> > +       memcpy(data_buf, fw->data, fw->size);
> > +       data_pa =3D virt_to_phys(data_buf);
> > +       reg_pair_from_64(&data_pa_high, &data_pa_low, data_pa);
> > +       reg_pair_from_64(&data_size_high, &data_size_low, data_size);
> > +       goto fw_load;
> > +
> > +fw_err:
> > +       pr_warn("image loading failed\n");
> > +       data_pa_high =3D data_pa_low =3D data_size_high =3D data_size_l=
ow =3D 0;
> > +
> > +fw_load:
> > +       /*
> > +        * Always invoke the SMC, even if loading the image fails, to i=
ndicate
> > +        * to EL3 that we have passed the point where it should allow i=
nvoking
> > +        * this SMC.
> > +        */
> > +       pr_warn("OP-TEE image loaded from kernel, this can be insecure"=
);
> > +       invoke_fn(OPTEE_SMC_CALL_LOAD_IMAGE, data_size_high, data_size_=
low,
> > +                 data_pa_high, data_pa_low, 0, 0, 0, &res);
> > +       if (!rc)
> > +               rc =3D res.a0;
> > +       if (fw)
> > +               release_firmware(fw);
> > +       kfree(data_buf);
> > +
> > +       return rc;
> > +}
> > +#else
> > +static inline int optee_load_fw(struct platform_device *__unused1,
> > +               optee_invoke_fn *__unused2) {
>
> Please align with the '(' on the line above. The `{` should be at the
> start of the next line.
> I'd prefer the normal names of the parameters instead even if they are un=
used.
>
Done and done in patch set v8.

> Cheers,
> Jens
>
> > +       return 0;
> > +}
> > +#endif
> > +
> >  static int optee_probe(struct platform_device *pdev)
> >  {
> >         optee_invoke_fn *invoke_fn;
> > @@ -1372,6 +1465,10 @@ static int optee_probe(struct platform_device *p=
dev)
> >         if (IS_ERR(invoke_fn))
> >                 return PTR_ERR(invoke_fn);
> >
> > +       rc =3D optee_load_fw(pdev, invoke_fn);
> > +       if (rc)
> > +               return rc;
> > +
> >         if (!optee_msg_api_uid_is_optee_api(invoke_fn)) {
> >                 pr_warn("api uid mismatch\n");
> >                 return -EINVAL;
> > --
> > 2.40.0.rc1.284.g88254d51c5-goog
> >
