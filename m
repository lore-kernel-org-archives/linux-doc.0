Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6B097E244
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 09:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1425557AbeCBJUH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 04:20:07 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:28747 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1425539AbeCBJTz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 04:19:55 -0500
X-IronPort-AV: E=Sophos;i="5.47,411,1515481200"; 
   d="scan'208";a="9313871"
Received: from exsmtp01.microchip.com (HELO email.microchip.com) ([198.175.253.37])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES128-SHA; 02 Mar 2018 02:19:53 -0700
Received: from [10.145.6.76] (10.10.76.4) by CHN-SV-EXCH01.mchp-main.com
 (10.10.76.37) with Microsoft SMTP Server id 14.3.352.0; Fri, 2 Mar 2018
 02:19:53 -0700
Subject: Re: [PATCH v3 05/10] pwm: add PWM mode to pwm_config()
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <shc_work@mail.ru>, <kgene@kernel.org>, <krzk@kernel.org>,
        <linux@armlinux.org.uk>, <mturquette@baylibre.com>,
        <sboyd@codeaurora.org>, <jani.nikula@linux.intel.com>,
        <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
        <airlied@linux.ie>, <kamil@wypas.org>, <b.zolnierkie@samsung.com>,
        <jdelvare@suse.com>, <linux@roeck-us.net>,
        <dmitry.torokhov@gmail.com>, <rpurdie@rpsys.net>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <mchehab@kernel.org>,
        <sean@mess.org>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
        <milo.kim@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <corbet@lwn.net>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@free-electrons.com>,
        <linux-pwm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <intel-gfx@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <1519300881-8136-1-git-send-email-claudiu.beznea@microchip.com>
 <1519300881-8136-6-git-send-email-claudiu.beznea@microchip.com>
 <20180228194429.GD22932@mithrandir>
From:   Claudiu Beznea <Claudiu.Beznea@microchip.com>
Message-ID: <0c3fc3ba-8640-0b2c-a9ec-ab848227c92d@microchip.com>
Date:   Fri, 2 Mar 2018 11:19:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180228194429.GD22932@mithrandir>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 28.02.2018 21:44, Thierry Reding wrote:
> On Thu, Feb 22, 2018 at 02:01:16PM +0200, Claudiu Beznea wrote:
>> Add PWM mode to pwm_config() function. The drivers which uses pwm_config()
>> were adapted to this change.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>> ---
>>  arch/arm/mach-s3c24xx/mach-rx1950.c  | 11 +++++++++--
>>  drivers/bus/ts-nbus.c                |  2 +-
>>  drivers/clk/clk-pwm.c                |  3 ++-
>>  drivers/gpu/drm/i915/intel_panel.c   | 17 ++++++++++++++---
>>  drivers/hwmon/pwm-fan.c              |  2 +-
>>  drivers/input/misc/max77693-haptic.c |  2 +-
>>  drivers/input/misc/max8997_haptic.c  |  6 +++++-
>>  drivers/leds/leds-pwm.c              |  5 ++++-
>>  drivers/media/rc/ir-rx51.c           |  5 ++++-
>>  drivers/media/rc/pwm-ir-tx.c         |  5 ++++-
>>  drivers/video/backlight/lm3630a_bl.c |  4 +++-
>>  drivers/video/backlight/lp855x_bl.c  |  4 +++-
>>  drivers/video/backlight/lp8788_bl.c  |  5 ++++-
>>  drivers/video/backlight/pwm_bl.c     | 11 +++++++++--
>>  drivers/video/fbdev/ssd1307fb.c      |  3 ++-
>>  include/linux/pwm.h                  |  6 ++++--
>>  16 files changed, 70 insertions(+), 21 deletions(-)
> 
> I don't think it makes sense to leak mode support into the legacy API.
> The pwm_config() function is considered legacy
I missed this aspect.

 and should eventually go
> away. As such it doesn't make sense to integrate a new feature such as
> PWM modes into it. 
Agree.

All users of pwm_config() assume normal mode, and
> that's what pwm_config() should provide.
Agree.

> 
> Anyone that needs something other than normal mode should use the new
> atomic PWM API.
Agree.

> 
> Thierry
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
