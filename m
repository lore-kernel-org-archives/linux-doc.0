Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 07E8E7DF90
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 14:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752233AbeFAO3j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 10:29:39 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:46358 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751598AbeFAO3j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 10:29:39 -0400
Received: by mail-wr0-f196.google.com with SMTP id v13-v6so24862385wrp.13;
        Fri, 01 Jun 2018 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4UktN3NH2pBPYZoryYZ5VOcRLY46S694/1kkbT8gqcA=;
        b=NF2MybQC7EyPAO0Fx7lxSlLVijTZxYWvWT8P3uCWzwQCyLGzTjNlyPanUzl+qmZA6l
         /c/DvOZMSK3+f51R2IcnD7VM7FOQEosyASI/LMOu+HJyIcYM70Pu8ZwqggjHBxj68/It
         ielJNsH13Mhj4gwq0eM1JA0KY44IYM8fjRCzjGOv0WJKCukRZMjZLYZlRIfX8oOZb7+L
         QYNVo8sWkNgBBH2sMOQi72MOMirlLCTVkPqRz1SNoPYKp90xb1zDSjekadS8mtKhUU40
         izogHY815kKA/kymFhXLNYi+jAyDAXSxT6GGDYVaNdS3NbU0vtLez7jaMzpM1+KKQtDl
         nSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4UktN3NH2pBPYZoryYZ5VOcRLY46S694/1kkbT8gqcA=;
        b=qx60YF0bjE3OItseDPhKqUlMR++bSnKhY7rE9cvjo90TbEPMJZ69wMyC2wulYPBYKT
         peA2o5TGT47EMKIJr/01BZpFywdHXHmvm7Kw6gYql5xe+6TeJwQABNG7/aoYzmly6PMK
         sY9WtcUYQ1AYWVAlYRbgXfv/RO+QuCPgdanrsLN8JDpy4/1f4DzXNmHS4NXW/xpxyppt
         XXepG2gqqCERDCHAtfrBGJakQ2p3fQYiNSZPOpcwkeVLPwsCAdwVphzbI+yhKjqjyvkP
         dfq2/RS1RUJgqdDpvpLM2lLZvyPdti/YEmD2HAEk0ISda2UE8/tquAkBqbRiQV0hXvkJ
         xmNA==
X-Gm-Message-State: ALKqPwcnq5WpQtdvVPX/13MDkEotK9Rvell3UxxxDAQJ4ze/1Tn/KCR2
        hwHib1r77VDZj3OB75iUJ7O5k6DSJj7j1s2D13s=
X-Google-Smtp-Source: ADUXVKJ7tFPFXNPrRL7xURHuxFCyurzo7glfUbbAyMbmv4sSjZ9CAvL/ZWLWqs/8oL9bD/eQRGpLm3P/rOAykqWdx0A=
X-Received: by 2002:adf:90a3:: with SMTP id i32-v6mr8672224wri.78.1527863377761;
 Fri, 01 Jun 2018 07:29:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:dd4f:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 07:29:37 -0700 (PDT)
In-Reply-To: <494c2768-4ac8-7282-80dd-122add15b2bb@daenzer.net>
References: <20180531161708.5894-1-michel@daenzer.net> <20180531161708.5894-3-michel@daenzer.net>
 <CADnq5_O5-m_=xqszq41eOAVaLTytHUHmtDaSc1MeEorZML6T5g@mail.gmail.com>
 <b458561f-b4e5-58bb-eee0-e3451312ae41@daenzer.net> <CADnq5_M-kS58ScgOBVQG7Mxxepae9b9gqUdMdFgaPaaxQ4NkjQ@mail.gmail.com>
 <494c2768-4ac8-7282-80dd-122add15b2bb@daenzer.net>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 1 Jun 2018 10:29:37 -0400
Message-ID: <CADnq5_McUDsTS3DkHWT-xriEm9AZ=zkfZKZ3r0Uxu64bCU1m=Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Add documentation for PRIME related code
To:     =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 1, 2018 at 9:56 AM, Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
> On 2018-06-01 03:44 PM, Alex Deucher wrote:
>> On Fri, Jun 1, 2018 at 9:40 AM, Michel D=C3=A4nzer <michel@daenzer.net> =
wrote:
>>> On 2018-06-01 02:58 PM, Alex Deucher wrote:
>>>> On Thu, May 31, 2018 at 12:17 PM, Michel D=C3=A4nzer <michel@daenzer.n=
et> wrote:
>>>>> From: Michel D=C3=A4nzer <michel.daenzer@amd.com>
>>>>>
>>>>> Signed-off-by: Michel D=C3=A4nzer <michel.daenzer@amd.com>
>>>>
>>>> Series is:
>>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>>
>>> Thanks. Is it okay to merge all of these via the amdgpu tree, or should
>>> I wait for an ack from Jon and/or core DRM maintainers for that?
>>
>> GPU documentation usually goes through the drm trees.  You might want
>> to push patch 1 (drm_mm.rst fix) via drm_misc, but the rest are can go
>> in via the amdgpu tree since they are amdgpu specific.
>
> I'd prefer merging all three patches together, since without patch 1,
> patch 3 generates the warning below while generating documentation, and
> the reference to the PRIME Buffer Sharing section doesn't work.
>
> .../linux/Documentation/gpu/amdgpu.rst:2: WARNING: undefined label:
> prime_buffer_sharing (if the link has no caption the label must precede
> a section header)


That's fine.  I'll take them all through the amdgpu tree.

Alex

>
>
> --
> Earthling Michel D=C3=A4nzer               |               http://www.amd=
.com
> Libre software enthusiast             |             Mesa and X developer
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
