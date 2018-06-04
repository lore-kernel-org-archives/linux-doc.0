Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F0157D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 21:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751230AbeFDVKw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 17:10:52 -0400
Received: from ns.pmeerw.net ([84.19.176.117]:45894 "EHLO ns.pmeerw.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751213AbeFDVKw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Jun 2018 17:10:52 -0400
X-Greylist: delayed 524 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Jun 2018 17:10:51 EDT
Received: by ns.pmeerw.net (Postfix, from userid 113)
        id 7C3D3E05BE; Mon,  4 Jun 2018 23:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pmeerw.net; s=mail;
        t=1528146126; bh=eBTlC6eVUQmpmuKq3lQcUZa61MehJJ1WllSkbaFQt9M=;
        h=From:To:Cc:Subject:Date:From;
        b=AE/xEmVtsNmAc6qmwJzycbrXXsUJShBvqVpuuIXQSuieUyvsFp5xF7c2yjkIIS6MR
         alu2TmKlmscxfg/8X6uGI5jU6H2x/nepCoGd1g4UwYHTHwcjauLotohyodT0DnKZ55
         O18SDKqRz3C3hjBKjNfdkl60RJ6VhurrIK5SiwA0=
Received: from vps.pmeerw.net (ns.pmeerw.net [IPv6:2001:1b60:2:23:1033:103:0:1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmeerw@pmeerw.net)
        by ns.pmeerw.net (Postfix) with ESMTPSA id 27ED8E0106;
        Mon,  4 Jun 2018 23:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pmeerw.net; s=mail;
        t=1528146124; bh=eBTlC6eVUQmpmuKq3lQcUZa61MehJJ1WllSkbaFQt9M=;
        h=From:To:Cc:Subject:Date:From;
        b=khIEu6ewJKSlmWIQOAiOLFl+oOjeSq5ZcLk2o6P77FUnY+qFdIwm8CTZP+Cj6GOkP
         8vc3cmQmk8/cJzKhONAZtpna33q4HklzlN4/WUcfuzUBOyE3QfCQ2kBsiTqDOjx4SY
         NBOrrM9MopJ68rEibf8NfqLxjFWel+vdwj7/3JWg=
From:   Peter Meerwald-Stadler <pmeerw@pmeerw.net>
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: [PATCH] rfkill: Fix several typos in documentation
Date:   Mon,  4 Jun 2018 23:02:03 +0200
Message-Id: <20180604210203.29684-1-pmeerw@pmeerw.net>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
---
 Documentation/rfkill.txt | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/Documentation/rfkill.txt b/Documentation/rfkill.txt
index a289285d2412..7d3684e81df6 100644
--- a/Documentation/rfkill.txt
+++ b/Documentation/rfkill.txt
@@ -9,7 +9,7 @@ rfkill - RF kill switch support
 Introduction
 ============
 
-The rfkill subsystem provides a generic interface to disabling any radio
+The rfkill subsystem provides a generic interface for disabling any radio
 transmitter in the system. When a transmitter is blocked, it shall not
 radiate any power.
 
@@ -45,7 +45,7 @@ The rfkill subsystem is composed of three main components:
  * the rfkill drivers.
 
 The rfkill core provides API for kernel drivers to register their radio
-transmitter with the kernel, methods for turning it on and off and, letting
+transmitter with the kernel, methods for turning it on and off, and letting
 the system know about hardware-disabled states that may be implemented on
 the device.
 
@@ -54,7 +54,7 @@ ways for userspace to query the current states. See the "Userspace support"
 section below.
 
 When the device is hard-blocked (either by a call to rfkill_set_hw_state()
-or from query_hw_block) set_block() will be invoked for additional software
+or from query_hw_block), set_block() will be invoked for additional software
 block, but drivers can ignore the method call since they can use the return
 value of the function rfkill_set_hw_state() to sync the software state
 instead of keeping track of calls to set_block(). In fact, drivers should
@@ -65,7 +65,6 @@ keeps track of soft and hard block separately.
 Kernel API
 ==========
 
-
 Drivers for radio transmitters normally implement an rfkill driver.
 
 Platform drivers might implement input devices if the rfkill button is just
@@ -75,14 +74,14 @@ a way to turn on/off the transmitter(s).
 
 For some platforms, it is possible that the hardware state changes during
 suspend/hibernation, in which case it will be necessary to update the rfkill
-core with the current state is at resume time.
+core with the current state at resume time.
 
 To create an rfkill driver, driver's Kconfig needs to have::
 
 	depends on RFKILL || !RFKILL
 
 to ensure the driver cannot be built-in when rfkill is modular. The !RFKILL
-case allows the driver to be built when rfkill is not configured, which
+case allows the driver to be built when rfkill is not configured, in which
 case all rfkill API can still be used but will be provided by static inlines
 which compile to almost nothing.
 
@@ -91,7 +90,7 @@ rfkill drivers that control devices that can be hard-blocked unless they also
 assign the poll_hw_block() callback (then the rfkill core will poll the
 device). Don't do this unless you cannot get the event in any other way.
 
-RFKill provides per-switch LED triggers, which can be used to drive LEDs
+rfkill provides per-switch LED triggers, which can be used to drive LEDs
 according to the switch state (LED_FULL when blocked, LED_OFF otherwise).
 
 
@@ -114,7 +113,7 @@ a specified type) into a state which also updates the default state for
 hotplugged devices.
 
 After an application opens /dev/rfkill, it can read the current state of all
-devices. Changes can be either obtained by either polling the descriptor for
+devices. Changes can be obtained by either polling the descriptor for
 hotplug or state change events or by listening for uevents emitted by the
 rfkill core framework.
 
@@ -127,8 +126,7 @@ environment variables set::
 	RFKILL_STATE
 	RFKILL_TYPE
 
-The contents of these variables corresponds to the "name", "state" and
+The content of these variables corresponds to the "name", "state" and
 "type" sysfs files explained above.
 
-
 For further details consult Documentation/ABI/stable/sysfs-class-rfkill.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
