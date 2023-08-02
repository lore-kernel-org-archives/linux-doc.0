Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F73C04A6A
	for <linux-doc@archiver.kernel.org>; Wed,  2 Aug 2023 14:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjHBOvu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 10:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbjHBOvt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 10:51:49 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76721171B
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 07:51:46 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so11021283e87.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Aug 2023 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690987904; x=1691592704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRsiMyy83ll7ZxD3exDSOM0mCfjRFxM0+ANJLzPtR8E=;
        b=aMaI3QcvZGfm3AQNtxQUwoGw8eJbgKYhC7PZPJMmLoUL2jEr42i+/cj2xJfWDi0vgx
         sHDLmfPQpJrFUwKWAlOsknukj2MF48HEpvG0caNShjXyOLYcYDFJ1DuDubRauWhqNvVA
         d8vwkVeBZhwe+KR3N4lcDlWAeHn0duImmaZFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987904; x=1691592704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRsiMyy83ll7ZxD3exDSOM0mCfjRFxM0+ANJLzPtR8E=;
        b=YgMgaS/7rdHKpi7hwI/QVAOednflSCCFNv//Mg9vLY7MfSCo67OYKNgzdKgCxvFWiY
         LwGhPv2odRgJMJYA/pugjS1gquAoR9tsxXl0cjQa2j0r3kGgyzNThUuRKrc2Lixa6H+j
         DOqWcaHikbnvMysMhvbwEeps6w8eL+CBxCX5k71iMUFGOXfICMZiUz7FFihMJ9DH9iRd
         11/h92uWzNLI7xSbS3TCBxqyg9/pwyDty1z9nUrTI8E1Be83PILvbo5CM2JL0+ezJepZ
         NG9zSnyz6VGYYUn33YjtfaAe1fhD2S+pCqNj++jMyk/Ff5EG6zi7CNPuoNbzXhCcuIGj
         o8RA==
X-Gm-Message-State: ABy/qLavFkSxdP4OpXDFUmvTF/9aEQZkYsIbKsYzvOXdnZ4rVDNatoQ9
        WwekfNPPHIHVreeaJ9Vz2w7t/p9QxrDLoM4333rgytlT
X-Google-Smtp-Source: APBJJlHaG94G9/yHYVn/KMqTISbioqhks8TWH2bEO0dlwOgYTCoPjjXFPyyChCIIN4rtCtojr8/3AA==
X-Received: by 2002:a19:4f1a:0:b0:4fb:751a:98db with SMTP id d26-20020a194f1a000000b004fb751a98dbmr5223843lfb.63.1690987904095;
        Wed, 02 Aug 2023 07:51:44 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id n10-20020aa7c44a000000b0052238bc70ccsm8725215edr.89.2023.08.02.07.51.43
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 07:51:43 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe2a116565so76695e9.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Aug 2023 07:51:43 -0700 (PDT)
X-Received: by 2002:a05:600c:1c90:b0:3f7:e4d8:2569 with SMTP id
 k16-20020a05600c1c9000b003f7e4d82569mr347125wms.5.1690987903338; Wed, 02 Aug
 2023 07:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <202308022221.APCRi7vk-lkp@intel.com>
In-Reply-To: <202308022221.APCRi7vk-lkp@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Aug 2023 07:51:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vj5t2tPUX31rn1EjZcH10UGHN+AUov7N9xy6R7_VZWMQ@mail.gmail.com>
Message-ID: <CAD=FV=Vj5t2tPUX31rn1EjZcH10UGHN+AUov7N9xy6R7_VZWMQ@mail.gmail.com>
Subject: Re: [linux-next:master 5684/6443] htmldocs: Documentation/gpu/todo.rst:469:
 WARNING: Unexpected indentation.
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Aug 2, 2023 at 7:43=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   626c67169f9972fffcdf3bc3864de421f162ebf5
> commit: d2aacaf07395bd798373cbec6af05fff4147aff3 [5684/6443] drm/panel: C=
heck for already prepared/enabled in drm_panel
> reproduce: (https://download.01.org/0day-ci/archive/20230802/202308022221=
.APCRi7vk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308022221.APCRi7vk-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Documentation/gpu/todo.rst:469: WARNING: Unexpected indentation.
>
> vim +469 Documentation/gpu/todo.rst
>
>    465
>    466  In a whole pile of panel drivers, we have code to make the
>    467  prepare/unprepare/enable/disable callbacks behave as no-ops if th=
ey've already
>    468  been called. To get some idea of the duplicated code, try:
>  > 469    git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>    470    git grep 'if.*>enabled' -- drivers/gpu/drm/panel
>    471

Thanks for the report. This was reported by Stephen Rothwell a few
hours ago. I just posted a patch to fix it.

https://lore.kernel.org/all/20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87=
b1ae198a857@changeid/

-Doug
