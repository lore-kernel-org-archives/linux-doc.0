Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B9DFA373E
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 12:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbiJXMag (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 08:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233805AbiJXM26 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 08:28:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E829C870BF
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 05:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666612819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oBddTd2aL3cpMShQLUMXQ70zqgPBnwYQKQRFaU3QDlI=;
        b=RqHojH3Ic9ozDWXSJ3psNOFKpuRU7nx1MeT5sVOopF+RhH2BEj8QfyXbZf5+GKYub5DIxv
        yVIi1Tp5wP6R0OYLtY/gup7NXDikxwEtxfZVeAyQSoCuLpqSEqHS+RFBLCPsSwfqij/PBg
        fkGbmhcFqMCFgenN6di6xnAsn3FQ+0w=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-JGlK2apdOuixhS-Mqu66Kw-1; Mon, 24 Oct 2022 08:00:18 -0400
X-MC-Unique: JGlK2apdOuixhS-Mqu66Kw-1
Received: by mail-lf1-f69.google.com with SMTP id s1-20020a197701000000b004a2aebd8b14so2653012lfc.21
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 05:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBddTd2aL3cpMShQLUMXQ70zqgPBnwYQKQRFaU3QDlI=;
        b=7KZtIT0x8G+vUoVJ7nTMGqJMGeYfNNOSCh+xEddi/HMCfP6rq/J03OwFHNC5HF5+0h
         BTr8qcJ+iB9Lzsbj1HSNoytuadC5WsCC68ndlZunuGbsK++GZWWAF316zBM5ukae7ctR
         PjjXFz4NkbE4pqUOqd3RSbMX+2FLSBmGfzhVamU9dlyPY4ob6jsp7lvFdfSYc4GmTY38
         m9kp0C4bRUY28BqKs85lJ6AZ1ah8cWXhuCZ8bKlhlfyY4/r+H/MFcPEpyZxeYN2DBYJs
         sOBMxfji2aZXSytNFJ5lj+uK99f43aQhW+mKGxF8lU1lgHz6BJVMHXpTohqyCoEjVutS
         iBKA==
X-Gm-Message-State: ACrzQf1GM6/0+gFSMq/v/rcDazN7Bpw9SFEuhxwJdcUOoogfdeuG5X1H
        nuGFAwBaivrcwmlK7Bk4LeieUARFGsfTiCj9SJwqAdAJ84CEkg63nnl2c3OKzbtOP+l2AsVLxd3
        dIe0jj9tz5wgYI4hXMhdk
X-Received: by 2002:a05:6512:3c90:b0:4a2:5168:b410 with SMTP id h16-20020a0565123c9000b004a25168b410mr12501699lfv.163.1666612816699;
        Mon, 24 Oct 2022 05:00:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4tdZDsl2pNG3Zoy+jU7SoBTHTkz51iCC/iggC9kztg6HWE+mkD8tnuNENa1Jj/GJlMZnu9qg==
X-Received: by 2002:a17:907:6e24:b0:791:905f:7881 with SMTP id sd36-20020a1709076e2400b00791905f7881mr27267484ejc.120.1666612806299;
        Mon, 24 Oct 2022 05:00:06 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id u20-20020a17090626d400b0078907275a44sm15446126ejc.42.2022.10.24.05.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:00:05 -0700 (PDT)
Message-ID: <bec2bb19-392d-0a69-f8f7-66bb1f8d9495@redhat.com>
Date:   Mon, 24 Oct 2022 14:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 00/22] Fallback to native backlight
Content-Language: en-US
To:     Akihiko Odaki <akihiko.odaki@daynix.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "Lee, Chun-Yi" <jlee@suse.com>, Mark Gross <markgross@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Jonathan Woithe <jwoithe@just42.net>,
        Ike Panhc <ike.pan@canonical.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        Mattia Dongili <malattia@linux.it>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Azael Avalos <coproscefalo@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Robert Moore <robert.moore@intel.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net,
        ibm-acpi-devel@lists.sourceforge.net, linux-fbdev@vger.kernel.org,
        devel@acpica.org
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
 <87tu3te92n.fsf@intel.com> <18478739-625b-0c16-cd5a-e05c5372a74a@daynix.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <18478739-625b-0c16-cd5a-e05c5372a74a@daynix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 10/24/22 13:56, Akihiko Odaki wrote:
> On 2022/10/24 20:48, Jani Nikula wrote:
>> On Mon, 24 Oct 2022, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>> Commit 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native()
>>> helper") and following commits made native backlight unavailable if
>>> CONFIG_ACPI_VIDEO is set and the backlight feature of ACPI video is
>>> unavailable, which broke the backlight functionality on Lenovo ThinkPad
>>> C13 Yoga Chromebook. Allow to fall back to native backlight in such
>>> cases.
>>
>> Where's the bug report with relevant logs, kconfigs, etc?
> 
> I haven't filed one. Should I? Please tell me where to report and what information you would need (to bugzilla.kernel.org with things mentioned in Documentation/admin-guide/reporting-issues.rst?)

As mentioned in my other email this is a known issue, and your effort
to fix this is appreciated very much, but I don't believe your solution
to be the right one.

See: https://lore.kernel.org/linux-acpi/42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com/
for more details and possible solutions. Please try implementing one of
those solutions for your Chromebook. I unfortunately do not have hw to
test this myself.

Regards,

Hans



> 
> Regards,
> Akihiko Odaki
> 
>>
>> BR,
>> Jani.
>>
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>
>>> Akihiko Odaki (22):
>>>    drm/i915/opregion: Improve backlight request condition
>>>    ACPI: video: Introduce acpi_video_get_backlight_types()
>>>    LoongArch: Use acpi_video_get_backlight_types()
>>>    platform/x86: acer-wmi: Use acpi_video_get_backlight_types()
>>>    platform/x86: asus-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: asus-wmi: Use acpi_video_get_backlight_types()
>>>    platform/x86: compal-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: eeepc-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: fujitsu-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: ideapad-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: msi-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: msi-wmi: Use acpi_video_get_backlight_types()
>>>    platform/x86: nvidia-wmi-ec-backlight: Use
>>>      acpi_video_get_backlight_types()
>>>    platform/x86: panasonic-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: samsung-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: sony-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: thinkpad_acpi: Use acpi_video_get_backlight_types()
>>>    platform/x86: toshiba_acpi: Use acpi_video_get_backlight_types()
>>>    platform/x86: dell-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: intel_oaktrail: Use acpi_video_get_backlight_types()
>>>    ACPI: video: Remove acpi_video_get_backlight_type()
>>>    ACPI: video: Fallback to native backlight
>>>
>>>   Documentation/gpu/todo.rst                    |  8 +--
>>>   drivers/acpi/acpi_video.c                     |  2 +-
>>>   drivers/acpi/video_detect.c                   | 54 ++++++++++---------
>>>   drivers/gpu/drm/i915/display/intel_opregion.c |  3 +-
>>>   drivers/platform/loongarch/loongson-laptop.c  |  4 +-
>>>   drivers/platform/x86/acer-wmi.c               |  2 +-
>>>   drivers/platform/x86/asus-laptop.c            |  2 +-
>>>   drivers/platform/x86/asus-wmi.c               |  4 +-
>>>   drivers/platform/x86/compal-laptop.c          |  2 +-
>>>   drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>>>   drivers/platform/x86/eeepc-laptop.c           |  2 +-
>>>   drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>>>   drivers/platform/x86/ideapad-laptop.c         |  2 +-
>>>   drivers/platform/x86/intel/oaktrail.c         |  2 +-
>>>   drivers/platform/x86/msi-laptop.c             |  2 +-
>>>   drivers/platform/x86/msi-wmi.c                |  2 +-
>>>   .../platform/x86/nvidia-wmi-ec-backlight.c    |  2 +-
>>>   drivers/platform/x86/panasonic-laptop.c       |  2 +-
>>>   drivers/platform/x86/samsung-laptop.c         |  2 +-
>>>   drivers/platform/x86/sony-laptop.c            |  2 +-
>>>   drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>>>   drivers/platform/x86/toshiba_acpi.c           |  2 +-
>>>   drivers/video/backlight/backlight.c           | 18 +++++++
>>>   include/acpi/video.h                          | 21 ++++----
>>>   include/linux/backlight.h                     |  1 +
>>>   25 files changed, 85 insertions(+), 66 deletions(-)
>>
> 

