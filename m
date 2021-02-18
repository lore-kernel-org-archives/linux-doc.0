Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19414C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 21:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A65F64EB6
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 21:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhBRV3V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Feb 2021 16:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhBRV3T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Feb 2021 16:29:19 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BABFC061756
        for <linux-doc@vger.kernel.org>; Thu, 18 Feb 2021 13:28:39 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id 189so2190279pfy.6
        for <linux-doc@vger.kernel.org>; Thu, 18 Feb 2021 13:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=id5tT4ESmyT6lrY6mObifI3QsSUG6ip0mvPxFPrOOmI=;
        b=m11mR6OWjN4t6FckBZ5UE25ivadkQMM674/ENF2MNH4Lw9gVEasRISqECcrQ1zv4X7
         xYzSmIk8rHaxBlNedJwUFghdcR9Gkk2qlXcKIQe5sxJvcHv0+ooDJWW1y/gUjyG+mWcg
         u4EsH2clFy20hvHfX4TG7YYLBGtlTrgou2hDHJuZ2aW7/1duxuXabwN1LXAmkcLNd9sT
         IaDWu1SKCKAzV5BRHAZRdGM/+ZyFcDPRL7svnHE9zss0EL1O8h7epJ1duxgYnEbTnGFl
         evKCnYt9Qk5aN/094DmLZKtupYHA25XCoTZXbenSZC88ThmT6Ig9v7T0bnHgoHsZYlEL
         xpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=id5tT4ESmyT6lrY6mObifI3QsSUG6ip0mvPxFPrOOmI=;
        b=iBgtnfgq+DY14U9albOTuyAj0xNz8u8NRwkXBjz0bgQAcqW87gsCe3qqZciVd2gR+O
         zVKGtsVcTPPwLBkFZztNOuHQpFUVqml5ouZ5a6toQoovz1GhHde2i9sKqjU8gcasDe90
         rCoS0hQCHWrD5QHtoNk0/gt97ZArPka4ZGp9CEEIyLE4E9UhqpLbYgtKO3R8xXmYBZ6J
         yotA/4cCnVXWcZrsXxTVWiFNPGtL1m9o8Awq5pEYsV6FZ/FrNADDXW4OWUcIol7UviBi
         FJI85wvOh+otGpxl8VUv5Db7dXP7i1skdieNsNsBu4jB45UEVda5oCBOUJWHUpG92p+F
         lk6w==
X-Gm-Message-State: AOAM532bgwr5B2midask59oE1xOJnsYKapi6QrJrySaXWaqxGOg9UgVy
        L8n6dDEgXtl58CJ3USlDOPtjBA==
X-Google-Smtp-Source: ABdhPJwskoLtuzoYEfz6cGqAZcAi1OKEWEMCulwvdfPAJL8LSlM1xuWCE67gb54SMmyi5jV4EhbHrw==
X-Received: by 2002:a65:4088:: with SMTP id t8mr5733623pgp.296.1613683718783;
        Thu, 18 Feb 2021 13:28:38 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x9sm6137929pjp.29.2021.02.18.13.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 13:28:38 -0800 (PST)
Date:   Thu, 18 Feb 2021 14:28:36 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com,
        yabinc@google.com, corbet@lwn.net, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/10] coresight: docs: Add documentation for
 CoreSight config
Message-ID: <20210218212836.GB3018315@xps15>
References: <20210128170936.9222-1-mike.leach@linaro.org>
 <20210128170936.9222-11-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128170936.9222-11-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Good day,

I have started to review this set and as usual comments will come over several
days.

On Thu, Jan 28, 2021 at 05:09:36PM +0000, Mike Leach wrote:
> Adds documentation for the CoreSight System configuration manager.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../trace/coresight/coresight-config.rst      | 244 ++++++++++++++++++
>  Documentation/trace/coresight/coresight.rst   |  16 ++
>  2 files changed, 260 insertions(+)
>  create mode 100644 Documentation/trace/coresight/coresight-config.rst

At this time the content of the patch and how things have been laid out in
configfs look good to me.  Things can still change at some point in the future
but for now:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
> new file mode 100644
> index 000000000000..3a4aa7bfa131
> --- /dev/null
> +++ b/Documentation/trace/coresight/coresight-config.rst
> @@ -0,0 +1,244 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================================
> +CoreSight System Configuration Manager
> +======================================
> +
> +    :Author:   Mike Leach <mike.leach@linaro.org>
> +    :Date:     October 2020
> +
> +Introduction
> +============
> +
> +The CoreSight System Configuration manager is an API that allows the
> +programming of the CoreSight system with pre-defined configurations that
> +can then be easily enabled from sysfs or perf.
> +
> +Many CoreSight components can be programmed in complex ways - especially ETMs.
> +In addition, components can interact across the CoreSight system, often via
> +the cross trigger components such as CTI and CTM. These system settings can
> +be defined and enabled as named configurations.
> +
> +
> +Basic Concepts
> +==============
> +
> +This section introduces the basic concepts of a CoreSight system configuration.
> +
> +
> +Features
> +--------
> +
> +A feature is a named set of programming for a CoreSight device. The programming
> +is device dependent, and can be defined in terms of absolute register values,
> +resource usage and parameter values.
> +
> +The feature is defined using a descriptor. This descriptor is used to load onto
> +a matching device, either when the feature is loaded into the system, or when the
> +CoreSight device is registered with the configuration manager.
> +
> +The load process involves interpreting the descriptor into a set of register
> +accesses in the driver - the resource usage and parameter descriptions
> +translated into appropriate register accesses. This interpretation makes it easy
> +and efficient for the feature to be programmed onto the device when required.
> +
> +The feature will not be active on the device until the feature is enabled, and
> +the device itself is enabled. When the device is enabled then enabled features
> +will be programmed into the device hardware.
> +
> +A feature is enabled as part of a configuration being enabled on the system.
> +
> +
> +Parameter Value
> +~~~~~~~~~~~~~~~
> +
> +A parameter value is a named value that may be set by the user prior to the
> +feature being enabled that can adjust the behaviour of the operation programmed
> +by the feature.
> +
> +For example, this could be a count value in a programmed operation that repeats
> +at a given rate. When the feature is enabled then the current value of the
> +parameter is used in programming the device.
> +
> +The feature descriptor defines a default value for a parameter, which is used
> +if the user does not supply a new value.
> +
> +Users can update parameter values using the configfs API for the CoreSight
> +system - which is described below.
> +
> +The current value of the parameter is loaded into the device when the feature
> +is enabled on that device.
> +
> +
> +Configurations
> +--------------
> +
> +A configuration defines a set of features that are to be used in a trace
> +session where the configuration is selected. For any trace session only one
> +configuration may be selected.
> +
> +The features defined may be on any type of device that is registered
> +to support system configuration. A configuration may select features to be
> +enabled on a class of devices - i.e. any ETMv4, or specific devices, e.g. a
> +specific CTI on the system.
> +
> +As with the feature, a descriptor is used to define the configuration.
> +This will define the features that must be enabled as part of the configuration
> +as well as any preset values that can be used to override default parameter
> +values.
> +
> +
> +Preset Values
> +~~~~~~~~~~~~~
> +
> +Preset values are easily selectable sets of parameter values for the features
> +that the configuration uses. The number of values in a single preset set, equals
> +the sum of parameter values in the features used by the configuration.
> +
> +e.g. a configuration consists of 3 features, one has 2 parameters, one has
> +a single parameter, and another has no parameters. A single preset set will
> +therefore have 3 values.
> +
> +Presets are optionally defined by the configuration, up to 15 can be defined.
> +If no preset is selected, then the parameter values defined in the feature
> +are used as normal.
> +
> +
> +Operation
> +~~~~~~~~~
> +
> +The following steps take place in the operation of a configuration.
> +
> +1) In this example, the configuration is 'autofdo', which has an
> +   associated feature 'strobing' that works on ETMv4 CoreSight Devices.
> +
> +2) The configuration is enabled. For example 'perf' may select the
> +   configuration as part of its command line::
> +
> +    perf record -e cs_etm/autofdo/ myapp
> +
> +   which will enable the 'autofdo' configuration.
> +
> +3) perf starts tracing on the system. As each ETMv4 that perf uses for
> +   trace is enabled,  the configuration manager will check if the ETMv4
> +   has a feature that relates to the currently active configuration.
> +   In this case 'strobing' is enabled & programmed into the ETMv4.
> +
> +4) When the ETMv4 is disabled, any registers marked as needing to be
> +   saved will be read back.
> +
> +5) At the end of the perf session, the configuration will be disabled.
> +
> +
> +Viewing Configurations and Features
> +===================================
> +
> +The set of configurations and features that are currently loaded into the
> +system can be viewed using the configfs API.
> +
> +Mount configfs as normal and the 'coresight-syscfg' subsystem will appear::
> +
> +    $ ls /config
> +    coresight-syscfg  stp-policy
> +
> +This has two sub-directories::
> +
> +    $ cd coresight-syscfg/
> +    $ ls
> +    configurations  features
> +
> +The system has the configuration 'autofdo' built in. It may be examined as
> +follows::
> +
> +    $ cd configurations/
> +    $ ls
> +    autofdo
> +    $ cd autofdo/
> +    $ ls
> +    description   preset1  preset3  preset5  preset7  preset9
> +    feature_refs  preset2  preset4  preset6  preset8
> +    $ cat description
> +    Setup ETMs with strobing for autofdo
> +    $ cat feature_refs
> +    strobing
> +
> +Each preset declared has a preset<n> subdirectory declared. The values for
> +the preset can be examined::
> +
> +    $ cat preset1/values
> +    strobing.window = 0x1388 strobing.period = 0x2
> +    $ cat preset2/values
> +    strobing.window = 0x1388 strobing.period = 0x4
> +
> +The features referenced by the configuration can be examined in the features
> +directory::
> +
> +    $ cd ../../features/strobing/
> +    $ ls
> +    description  matches  nr_params  params
> +    $ cat description
> +    Generate periodic trace capture windows.
> +    parameter 'window': a number of CPU cycles (W)
> +    parameter 'period': trace enabled for W cycles every period x W cycles
> +    $ cat matches
> +    SRC_ETMV4
> +    $ cat nr_params
> +    2
> +
> +Move to the params directory to examine and adjust parameters::
> +
> +    cd params
> +    $ ls
> +    period  window
> +    $ cd period
> +    $ ls
> +    value
> +    $ cat value
> +    0x2710
> +    # echo 15000 > value
> +    # cat value
> +    0x3a98
> +
> +Parameters adjusted in this way are reflected in all device instances that have
> +loaded the feature.
> +
> +
> +Using Configurations in perf
> +============================
> +
> +The configurations loaded into the CoreSight configuration management are
> +also declared in the perf 'cs_etm' event infrastructure so that they can
> +be selected when running trace under perf::
> +
> +    $ ls /sys/devices/cs_etm
> +    configurations  format  perf_event_mux_interval_ms  sinks  type
> +    events  nr_addr_filters  power
> +
> +Key directories here are 'configurations' - which lists the loaded
> +configurations, and 'events' - a generic perf directory which allows
> +selection on the perf command line.::
> +
> +    $ ls configurations/
> +    autofdo
> +    $ cat configurations/autofdo
> +    0xa7c3dddd
> +
> +As with the sinks entries, this provides a hash of the configuration name.
> +The entry in the 'events' directory uses perfs built in syntax generator
> +to substitute the syntax for the name when evaluating the command::
> +
> +    $ ls events/
> +    autofdo
> +    $ cat events/autofdo
> +    configid=0xa7c3dddd
> +
> +The 'autofdo' configuration may be selected on the perf command line::
> +
> +    $ perf record -e cs_etm/autofdo/u --per-thread <application>
> +
> +A preset to override the current parameter values can also be selected::
> +
> +    $ perf record -e cs_etm/autofdo,preset=1/u --per-thread <application>
> +
> +When configurations are selected in this way, then the trace sink used is
> +automatically selected.
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 0b73acb44efa..0122d9bebf35 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -587,6 +587,20 @@ A separate documentation file is provided to explain the use of these devices.
>  (:doc:`coresight-ect`) [#fourth]_.
>  
>  
> +CoreSight System Configuration
> +------------------------------
> +
> +CoreSight components can be complex devices with many programming options.
> +Furthermore, components can be programmed to interact with each other across the
> +complete system.
> +
> +A CoreSight System Configuration manager is provided to allow these complex programming
> +configurations to be selected and used easily from perf and sysfs.
> +
> +See the separate document for further information.
> +(:doc:`coresight-config`) [#fifth]_.
> +
> +
>  .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
>  
>  .. [#second] Documentation/trace/stm.rst
> @@ -594,3 +608,5 @@ A separate documentation file is provided to explain the use of these devices.
>  .. [#third] https://github.com/Linaro/perf-opencsd
>  
>  .. [#fourth] Documentation/trace/coresight/coresight-ect.rst
> +
> +.. [#fifth] Documentation/trace/coresight/coresight-config.rst
> -- 
> 2.17.1
> 
