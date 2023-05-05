Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66738C7EE22
	for <linux-doc@archiver.kernel.org>; Fri,  5 May 2023 15:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbjEEPMP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 May 2023 11:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjEEPMO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 May 2023 11:12:14 -0400
Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1F52719
        for <linux-doc@vger.kernel.org>; Fri,  5 May 2023 08:12:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1683299532; x=1683306732; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=tS7xyyS1d338vedGR9uNdjyBtszw/bt2Ba9e0ooE/S4=;
 b=CmXrEbG9aE2zwsJwFmz7tPCHP1nowWCKF8VfgcFcX9e+ssFB96+U5OBTVY5y3POPtUFjYHAvpPrs2Do//lDYyABg4jQp9ieHGrbUfNZT/FU67TTd/goGM0OeOCIASr+nxqKcj6/bCZbIdtnuFP6jM8iyM6WxWM/Ef4inoZ6YG8cEF9LdTo1rrjeBOhLRftu469lHtnZadzxZl5+X2FeTnb41JAVFE/nW1/z87DwEYTCiQwXoLqWAr1dmr40bNCez34RptFUf15JM24yQwJVFtrHUhaGR1v36fpLidR3ALUQPQwSBwgGq/qsP5jfeOQsewoWMqgSb3eUYBrfri8X0Ig==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyIxNjU3YyIsImxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmciLCI5M2Q1YWIiXQ==
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by fd43d426ea96 with SMTP id
 64551ccce31b292e1f0659c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 May 2023 15:12:12 GMT
Sender: james@equiv.tech
Date:   Fri, 5 May 2023 08:12:11 -0700
From:   James Seo <james@equiv.tech>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 08/11] Documentation/hwmon: Revise userspace tools
 documentation
Message-ID: <ZFUcy9SLiE8SwOzR@equiv.tech>
References: <20230504075752.1320967-1-james@equiv.tech>
 <20230504075752.1320967-9-james@equiv.tech>
 <ZFSOIXLCnd01ofBv@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZFSOIXLCnd01ofBv@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 05, 2023 at 12:03:29PM +0700, Bagas Sanjaya wrote:
> On Thu, May 04, 2023 at 12:57:49AM -0700, James Seo wrote:
> > +If needed, sources may be found at https://hwmon.wiki.kernel.org/lm_sensors.
> > +Basic compilation, installation, and uninstallation may be accomplished with
> > +``make all``, ``make install``, and ``make uninstall``, respectively.
> > +
> 
> The sources is on GitHub:
> 
> ---- >8 ----
> diff --git a/Documentation/hwmon/userspace-tools.rst b/Documentation/hwmon/userspace-tools.rst
> index 79c932954e4af5..fd96ea92f72eea 100644
> --- a/Documentation/hwmon/userspace-tools.rst
> +++ b/Documentation/hwmon/userspace-tools.rst
> @@ -44,9 +44,9 @@ Most Linux distributions provide the ``lm-sensors`` suite as a package.
>  It is recommended that you use this package for ease of installation.
>  Please consult your Linux distribution's documentation for more information.
>  
> -If needed, sources may be found at https://hwmon.wiki.kernel.org/lm_sensors.
> -Basic compilation, installation, and uninstallation may be accomplished with
> -``make all``, ``make install``, and ``make uninstall``, respectively.
> +If the distribution package isn't available, sources can be obtained at
> +`GitHub <https://github.com/lm-sensors/lm-sensors>`_.
> +See ``INSTALL`` in the sources for how to build the suite.
>  
>  Usage
>  -----
> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara

The document previously mentioned the old official lm-sensors site,
so I thought I should mention the current one, which has a GitHub link
anyway. But I will change this and add a link to the current site
separately.

Thanks.

James
