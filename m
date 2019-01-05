Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C9527D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat,  5 Jan 2019 21:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfAEVF3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 5 Jan 2019 16:05:29 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34379 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfAEVF3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Jan 2019 16:05:29 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1gft8F-0004tL-M5; Sat, 05 Jan 2019 22:05:23 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1gft8E-00086A-C5; Sat, 05 Jan 2019 22:05:22 +0100
Date:   Sat, 5 Jan 2019 22:05:22 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Claudiu.Beznea@microchip.com, thierry.reding@gmail.com
Cc:     corbet@lwn.net, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 1/6] pwm: extend PWM framework with PWM modes
Message-ID: <20190105210522.ho2o2a4gc7r7ijeq@pengutronix.de>
References: <1546522081-23659-1-git-send-email-claudiu.beznea@microchip.com>
 <1546522081-23659-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1546522081-23659-2-git-send-email-claudiu.beznea@microchip.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Thu, Jan 03, 2019 at 01:29:44PM +0000, Claudiu.Beznea@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Add basic PWM modes: normal and complementary. These modes should
> differentiate the single output PWM channels from two outputs PWM
> channels. These modes could be set as follow:
> 1. PWM channels with one output per channel:
> - normal mode
> 2. PWM channels with two outputs per channel:
> - normal mode
> - complementary mode
> Since users could use a PWM channel with two output as one output PWM
> channel, the PWM normal mode is allowed to be set for PWM channels with
> two outputs; in fact PWM normal mode should be supported by all PWMs.

I still think that my suggestion that I sent in reply to your v5 using
.alt_duty_cycle and .alt_offset is the better one as it is more generic.
A word about that from Thierry before putting the mode into the pwm API
would be great.

I don't repeat what I wrote there assuming you still remember or are
willing to look it up at
e.g. https://www.spinics.net/lists/linux-pwm/msg08174.html (in the 2nd half
of my mail).

Also I think that if the capabilities function is the way forward adding
support to detect availability of polarity inversion should be
considered. This would also be an opportunity to split the introduction
of the capabilities function and the introduction of complementary mode.
(But my personal preference would be to just let .apply fail when an
unsupported configuration is requested.)

> +static int pwm_get_default_caps(struct pwm_caps *caps)
> +{
> +	static const struct pwm_caps default_caps = {
> +		.modes_msk = PWM_MODE_BIT(NORMAL),
> +	};
> +
> +	if (!caps)
> +		return -EINVAL;
> +
> +	*caps = default_caps;
> +
> +	return 0;
> +}
> +
> +/**
> + * pwm_get_caps() - get PWM capabilities of a PWM device
> + * @pwm: PWM device to get the capabilities for
> + * @caps: returned capabilities
> + *
> + * Returns: 0 on success or a negative error code on failure
> + */
> +int pwm_get_caps(const struct pwm_device *pwm, struct pwm_caps *caps)
> +{
> +	if (!pwm || !caps)
> +		return -EINVAL;
> +
> +	if (pwm->chip->ops->get_caps)
> +		return pwm->chip->ops->get_caps(pwm->chip, pwm, caps);
> +
> +	return pwm_get_default_caps(caps);

I'd drop pwm_get_default_caps (unless you introduce some more callers
later) and fold its implementation into pwm_get_caps.

> +}
> +EXPORT_SYMBOL_GPL(pwm_get_caps);
> [...]
> @@ -53,12 +75,14 @@ enum {
>   * @period: PWM period (in nanoseconds)
>   * @duty_cycle: PWM duty cycle (in nanoseconds)
>   * @polarity: PWM polarity
> + * @modebit: PWM mode bit
>   * @enabled: PWM enabled status
>   */
>  struct pwm_state {
>  	unsigned int period;
>  	unsigned int duty_cycle;
>  	enum pwm_polarity polarity;
> +	unsigned long modebit;

I fail to see the upside of storing the mode as 2^mode instead of a
plain enum pwm_mode. Given that struct pwm_state is visible for pwm
users a plain pwm_mode would at least be more intuitive.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
