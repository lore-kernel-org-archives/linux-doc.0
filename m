Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDF3C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 16:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE5AF60E97
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 16:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhGWQOY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 12:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbhGWQOX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 12:14:23 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9A7C061757
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 09:54:56 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o3so1191883wms.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kWBYmHFzVaAtr0q3DL3loxqYVHyccUJehxRYe/jfvbg=;
        b=uE2ntdQh/tEb3bIcxEIoJ76VBZStVe8yqv5WJmb9+RzelKMXLrp12WAh9yMet82U+2
         5baS/436CZhQhk8o/IAhEhhDEGQs4PvuqEKv+rjpwf4CPGatb0nLIihGj2S77j+BrExL
         hVPTsVt0/Hu2nrnr+GUQoTwepBBQr9KV1/m0xQDxVPRffySsnQvyN52rcHgUdRSnJbK0
         65w8J1h/Po4Vw3HmmPwVn0VUOECcBJd0kGLDvgdQPAWFalRiEMTSBse4tN3xypwtWMYe
         nvjEgTIg6Vah93GuAwR4CDPJVoY0bGkpWA5TEo2EoKZcPkBEvlxx/nyhJNJ0j7bjJ7zt
         pkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kWBYmHFzVaAtr0q3DL3loxqYVHyccUJehxRYe/jfvbg=;
        b=bsSMxYg1xP66ZXGMEyOjBvDhMkaX5yhr6c/yBsHzEodw0RKPxIzBfeww6Vz1GBzgu5
         x36kYPDKxz2r26BwfuQAH0RhZFq10N7kzHxZ7iOPGf2ShTZfYlL9JHTgVkWcBqEaSlTT
         PO2OmGH4COeaaFjI5nHQeeg0jjVvyXvwiyMlsGO9r/NRlsu9MpidePwFmhwR4GRPdM09
         nLc/kGnRZ7QCspjxnaTwNLzc+xos5eIOgndxkbZ7q2rhNMbhqkBXb5cKfs3McneCHEWm
         VPOV+LihDJA488GVT7LmO8fEryLeidxrgHZHDaHEgJ2IMr4WcjMqL64ZTxprI2/sK0NB
         7A1g==
X-Gm-Message-State: AOAM530qK8vwYEJBdQghl16pMSbwO7XRqNTR/oeLnor7+l/6BzwZ4uCM
        qJ4huIzRDXrLe52rDGCcq0EVZw==
X-Google-Smtp-Source: ABdhPJz3FZ66DlcOwWMaJFQavyJ1NuHISRTOXBPeiWuM4urBD8dQswNPsqBOa0MqkmkUdVVfdQUHCA==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr5287192wmj.80.1627059294604;
        Fri, 23 Jul 2021 09:54:54 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6809:2201:fdab:eb9d:1515:bff3])
        by smtp.gmail.com with ESMTPSA id z11sm33193225wru.65.2021.07.23.09.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 09:54:54 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        mathieu.poirier@linaro.org, suzuki.poulose@arm.com
Cc:     yabinc@google.com, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v9 10/10] Documentation: coresight: Add documentation for CoreSight config
Date:   Fri, 23 Jul 2021 17:54:44 +0100
Message-Id: <20210723165444.1048-11-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723165444.1048-1-mike.leach@linaro.org>
References: <20210723165444.1048-1-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds documentation for the CoreSight System configuration manager.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 .../trace/coresight/coresight-config.rst      | 244 ++++++++++++++++++
 Documentation/trace/coresight/coresight.rst   |  16 ++
 2 files changed, 260 insertions(+)
 create mode 100644 Documentation/trace/coresight/coresight-config.rst

diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
new file mode 100644
index 000000000000..a4e3ef295240
--- /dev/null
+++ b/Documentation/trace/coresight/coresight-config.rst
@@ -0,0 +1,244 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+CoreSight System Configuration Manager
+======================================
+
+    :Author:   Mike Leach <mike.leach@linaro.org>
+    :Date:     October 2020
+
+Introduction
+============
+
+The CoreSight System Configuration manager is an API that allows the
+programming of the CoreSight system with pre-defined configurations that
+can then be easily enabled from sysfs or perf.
+
+Many CoreSight components can be programmed in complex ways - especially ETMs.
+In addition, components can interact across the CoreSight system, often via
+the cross trigger components such as CTI and CTM. These system settings can
+be defined and enabled as named configurations.
+
+
+Basic Concepts
+==============
+
+This section introduces the basic concepts of a CoreSight system configuration.
+
+
+Features
+--------
+
+A feature is a named set of programming for a CoreSight device. The programming
+is device dependent, and can be defined in terms of absolute register values,
+resource usage and parameter values.
+
+The feature is defined using a descriptor. This descriptor is used to load onto
+a matching device, either when the feature is loaded into the system, or when the
+CoreSight device is registered with the configuration manager.
+
+The load process involves interpreting the descriptor into a set of register
+accesses in the driver - the resource usage and parameter descriptions
+translated into appropriate register accesses. This interpretation makes it easy
+and efficient for the feature to be programmed onto the device when required.
+
+The feature will not be active on the device until the feature is enabled, and
+the device itself is enabled. When the device is enabled then enabled features
+will be programmed into the device hardware.
+
+A feature is enabled as part of a configuration being enabled on the system.
+
+
+Parameter Value
+~~~~~~~~~~~~~~~
+
+A parameter value is a named value that may be set by the user prior to the
+feature being enabled that can adjust the behaviour of the operation programmed
+by the feature.
+
+For example, this could be a count value in a programmed operation that repeats
+at a given rate. When the feature is enabled then the current value of the
+parameter is used in programming the device.
+
+The feature descriptor defines a default value for a parameter, which is used
+if the user does not supply a new value.
+
+Users can update parameter values using the configfs API for the CoreSight
+system - which is described below.
+
+The current value of the parameter is loaded into the device when the feature
+is enabled on that device.
+
+
+Configurations
+--------------
+
+A configuration defines a set of features that are to be used in a trace
+session where the configuration is selected. For any trace session only one
+configuration may be selected.
+
+The features defined may be on any type of device that is registered
+to support system configuration. A configuration may select features to be
+enabled on a class of devices - i.e. any ETMv4, or specific devices, e.g. a
+specific CTI on the system.
+
+As with the feature, a descriptor is used to define the configuration.
+This will define the features that must be enabled as part of the configuration
+as well as any preset values that can be used to override default parameter
+values.
+
+
+Preset Values
+~~~~~~~~~~~~~
+
+Preset values are easily selectable sets of parameter values for the features
+that the configuration uses. The number of values in a single preset set, equals
+the sum of parameter values in the features used by the configuration.
+
+e.g. a configuration consists of 3 features, one has 2 parameters, one has
+a single parameter, and another has no parameters. A single preset set will
+therefore have 3 values.
+
+Presets are optionally defined by the configuration, up to 15 can be defined.
+If no preset is selected, then the parameter values defined in the feature
+are used as normal.
+
+
+Operation
+~~~~~~~~~
+
+The following steps take place in the operation of a configuration.
+
+1) In this example, the configuration is 'autofdo', which has an
+   associated feature 'strobing' that works on ETMv4 CoreSight Devices.
+
+2) The configuration is enabled. For example 'perf' may select the
+   configuration as part of its command line::
+
+    perf record -e cs_etm/autofdo/ myapp
+
+   which will enable the 'autofdo' configuration.
+
+3) perf starts tracing on the system. As each ETMv4 that perf uses for
+   trace is enabled,  the configuration manager will check if the ETMv4
+   has a feature that relates to the currently active configuration.
+   In this case 'strobing' is enabled & programmed into the ETMv4.
+
+4) When the ETMv4 is disabled, any registers marked as needing to be
+   saved will be read back.
+
+5) At the end of the perf session, the configuration will be disabled.
+
+
+Viewing Configurations and Features
+===================================
+
+The set of configurations and features that are currently loaded into the
+system can be viewed using the configfs API.
+
+Mount configfs as normal and the 'cs-syscfg' subsystem will appear::
+
+    $ ls /config
+    cs-syscfg  stp-policy
+
+This has two sub-directories::
+
+    $ cd cs-syscfg/
+    $ ls
+    configurations  features
+
+The system has the configuration 'autofdo' built in. It may be examined as
+follows::
+
+    $ cd configurations/
+    $ ls
+    autofdo
+    $ cd autofdo/
+    $ ls
+    description   preset1  preset3  preset5  preset7  preset9
+    feature_refs  preset2  preset4  preset6  preset8
+    $ cat description
+    Setup ETMs with strobing for autofdo
+    $ cat feature_refs
+    strobing
+
+Each preset declared has a preset<n> subdirectory declared. The values for
+the preset can be examined::
+
+    $ cat preset1/values
+    strobing.window = 0x1388 strobing.period = 0x2
+    $ cat preset2/values
+    strobing.window = 0x1388 strobing.period = 0x4
+
+The features referenced by the configuration can be examined in the features
+directory::
+
+    $ cd ../../features/strobing/
+    $ ls
+    description  matches  nr_params  params
+    $ cat description
+    Generate periodic trace capture windows.
+    parameter 'window': a number of CPU cycles (W)
+    parameter 'period': trace enabled for W cycles every period x W cycles
+    $ cat matches
+    SRC_ETMV4
+    $ cat nr_params
+    2
+
+Move to the params directory to examine and adjust parameters::
+
+    cd params
+    $ ls
+    period  window
+    $ cd period
+    $ ls
+    value
+    $ cat value
+    0x2710
+    # echo 15000 > value
+    # cat value
+    0x3a98
+
+Parameters adjusted in this way are reflected in all device instances that have
+loaded the feature.
+
+
+Using Configurations in perf
+============================
+
+The configurations loaded into the CoreSight configuration management are
+also declared in the perf 'cs_etm' event infrastructure so that they can
+be selected when running trace under perf::
+
+    $ ls /sys/devices/cs_etm
+    configurations  format  perf_event_mux_interval_ms  sinks  type
+    events  nr_addr_filters  power
+
+Key directories here are 'configurations' - which lists the loaded
+configurations, and 'events' - a generic perf directory which allows
+selection on the perf command line.::
+
+    $ ls configurations/
+    autofdo
+    $ cat configurations/autofdo
+    0xa7c3dddd
+
+As with the sinks entries, this provides a hash of the configuration name.
+The entry in the 'events' directory uses perfs built in syntax generator
+to substitute the syntax for the name when evaluating the command::
+
+    $ ls events/
+    autofdo
+    $ cat events/autofdo
+    configid=0xa7c3dddd
+
+The 'autofdo' configuration may be selected on the perf command line::
+
+    $ perf record -e cs_etm/autofdo/u --per-thread <application>
+
+A preset to override the current parameter values can also be selected::
+
+    $ perf record -e cs_etm/autofdo,preset=1/u --per-thread <application>
+
+When configurations are selected in this way, then the trace sink used is
+automatically selected.
diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 169749efd8d1..7ec656c9f0dc 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -619,6 +619,20 @@ A separate documentation file is provided to explain the use of these devices.
 (:doc:`coresight-ect`) [#fourth]_.
 
 
+CoreSight System Configuration
+------------------------------
+
+CoreSight components can be complex devices with many programming options.
+Furthermore, components can be programmed to interact with each other across the
+complete system.
+
+A CoreSight System Configuration manager is provided to allow these complex programming
+configurations to be selected and used easily from perf and sysfs.
+
+See the separate document for further information.
+(:doc:`coresight-config`) [#fifth]_.
+
+
 .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
 
 .. [#second] Documentation/trace/stm.rst
@@ -626,3 +640,5 @@ A separate documentation file is provided to explain the use of these devices.
 .. [#third] https://github.com/Linaro/perf-opencsd
 
 .. [#fourth] Documentation/trace/coresight/coresight-ect.rst
+
+.. [#fifth] Documentation/trace/coresight/coresight-config.rst
-- 
2.17.1

