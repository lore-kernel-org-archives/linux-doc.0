Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BFEB27D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Feb 2019 03:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfBSDXO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Feb 2019 22:23:14 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42250 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfBSDXO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Feb 2019 22:23:14 -0500
Received: by mail-qk1-f195.google.com with SMTP id y140so11229143qkb.9
        for <linux-doc@vger.kernel.org>; Mon, 18 Feb 2019 19:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to:organization;
        bh=lTcyxmG4prkS5riKCUkqxeogt3Pv08ytXyGNonTbMhk=;
        b=isG73o+UjuCYsFra+acMSqEynnntPbCZ+VZxbcqzBs0nBenJ40uJe1fYT8+kv24L4C
         Jaj1zBYrIGIZAT6Qpva8kcFn/nAB9W/HpVdTnbEi66M1hFaIK5ryVuM5yYwS6weW2o+1
         9r4ct7W6wqIJW05pKxqUHpFFVHLcEZ9cAAVAUxSzrHP3cEAityYSB9oEWGZF6BPP0fR4
         WoDcTX8fSAOCSGmmD1ckRFu7rsMzogoQdte26zIuGDXq0dqBLGkEyGDKFZnQxrz5LXpm
         6zrP575SttYFE/k6Btq3gUpuIDNJC0aPBwnLr4pWDxkEg2T+Prfn1CEYIUab/18g0Yya
         vZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to:organization;
        bh=lTcyxmG4prkS5riKCUkqxeogt3Pv08ytXyGNonTbMhk=;
        b=im/ONk1yFfB+vAdsqQMKAj2ldjDBpagYQEGu6hpYuyvoqd1I1kfxKT9l475X2rofnM
         0SXLO/C3XJdWxIPpHk4+T/pnajFOqElyrKllV3YEdBB1z7eJztpPv6KDH6AXPx7tPNfY
         0iNGYeWEdztNbqv8C/NfCkFZGK5ODMIvRyHdVWShfbaXrRCiA7l5yw/MO1bq1I6x14lX
         +cVhM/HOH/nWHPoDA4m8Xb5ngXwAGxZGyOJLkQh0zUpPEgpNnt/jvaL7XXYSEtnqcNWn
         +R6UQoOAncapiiWDF8V4C/uPsw74Wfm7d0bTIRq87pq6lhbzu4EH3k/VUz/anFM/edJX
         Jc7g==
X-Gm-Message-State: AHQUAuZYIuF5a2pidHbqyYKCKYrwGtbp3MkOzKJDHiIm4eoqSE1GAIjJ
        AIYlTa34hBm+CwgEINh3+F0pqUdC
X-Google-Smtp-Source: AHgI3IbqLdYRjHMCJ/CcsBsJFlcGnGXE7PnRjIQT1FLawwTeiTGmmlA/QFphorXh3bqLQ1rBrFIEQQ==
X-Received: by 2002:a05:620a:109b:: with SMTP id g27mr18862719qkk.128.1550546593080;
        Mon, 18 Feb 2019 19:23:13 -0800 (PST)
Received: from kbl.fios-router.home (pool-96-233-42-17.bstnma.fios.verizon.net. [96.233.42.17])
        by smtp.gmail.com with ESMTPSA id l31sm205282qtb.20.2019.02.18.19.23.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 19:23:12 -0800 (PST)
From:   Len Brown <lenb@kernel.org>
X-Google-Original-From: Len Brown <len.brown@intel.com>
To:     linux-drivers-review@linux.intel.com
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH 02/11] topolgy: simplify cputopology.txt formatting and wording
Date:   Mon, 18 Feb 2019 22:22:50 -0500
Message-Id: <e13cb72d48bdaed80b681abf89bc77d58931db51.1550545163.git.len.brown@intel.com>
X-Mailer: git-send-email 2.18.0-rc0
In-Reply-To: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
References: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
Reply-To: Len Brown <lenb@kernel.org>
Organization: Intel Open Source Technology Center
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

No semantic changes.

Signed-off-by: Len Brown <len.brown@intel.com>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Len Brown <len.brown@intel.com>
---
 Documentation/cputopology.txt | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/cputopology.txt b/Documentation/cputopology.txt
index c6e7e9196a8b..2698da7e4f49 100644
--- a/Documentation/cputopology.txt
+++ b/Documentation/cputopology.txt
@@ -3,76 +3,76 @@ How CPU topology info is exported via sysfs
 ===========================================
 
 Export CPU topology info via sysfs. Items (attributes) are similar
-to /proc/cpuinfo output of some architectures:
+to /proc/cpuinfo output of some architectures.  They reside in
+/sys/devices/system/cpu/cpuX/topology/:
 
-1) /sys/devices/system/cpu/cpuX/topology/physical_package_id:
+physical_package_id:
 
 	physical package id of cpuX. Typically corresponds to a physical
 	socket number, but the actual value is architecture and platform
 	dependent.
 
-2) /sys/devices/system/cpu/cpuX/topology/core_id:
+core_id:
 
 	the CPU core ID of cpuX. Typically it is the hardware platform's
 	identifier (rather than the kernel's).  The actual value is
 	architecture and platform dependent.
 
-3) /sys/devices/system/cpu/cpuX/topology/book_id:
+book_id:
 
 	the book ID of cpuX. Typically it is the hardware platform's
 	identifier (rather than the kernel's).	The actual value is
 	architecture and platform dependent.
 
-4) /sys/devices/system/cpu/cpuX/topology/drawer_id:
+drawer_id:
 
 	the drawer ID of cpuX. Typically it is the hardware platform's
 	identifier (rather than the kernel's).	The actual value is
 	architecture and platform dependent.
 
-5) /sys/devices/system/cpu/cpuX/topology/thread_siblings:
+thread_siblings:
 
 	internal kernel map of cpuX's hardware threads within the same
 	core as cpuX.
 
-6) /sys/devices/system/cpu/cpuX/topology/thread_siblings_list:
+thread_siblings_list:
 
 	human-readable list of cpuX's hardware threads within the same
 	core as cpuX.
 
-7) /sys/devices/system/cpu/cpuX/topology/core_siblings:
+core_siblings:
 
 	internal kernel map of cpuX's hardware threads within the same
 	physical_package_id.
 
-8) /sys/devices/system/cpu/cpuX/topology/core_siblings_list:
+core_siblings_list:
 
 	human-readable list of cpuX's hardware threads within the same
 	physical_package_id.
 
-9) /sys/devices/system/cpu/cpuX/topology/book_siblings:
+book_siblings:
 
 	internal kernel map of cpuX's hardware threads within the same
 	book_id.
 
-10) /sys/devices/system/cpu/cpuX/topology/book_siblings_list:
+book_siblings_list:
 
 	human-readable list of cpuX's hardware threads within the same
 	book_id.
 
-11) /sys/devices/system/cpu/cpuX/topology/drawer_siblings:
+drawer_siblings:
 
 	internal kernel map of cpuX's hardware threads within the same
 	drawer_id.
 
-12) /sys/devices/system/cpu/cpuX/topology/drawer_siblings_list:
+drawer_siblings_list:
 
 	human-readable list of cpuX's hardware threads within the same
 	drawer_id.
 
-To implement it in an architecture-neutral way, a new source file,
-drivers/base/topology.c, is to export the 6 to 12 attributes. The book
-and drawer related sysfs files will only be created if CONFIG_SCHED_BOOK
-and CONFIG_SCHED_DRAWER are selected.
+Architecture-neutral, drivers/base/topology.c, exports these attributes.
+However, the book and drawer related sysfs files will only be created if
+CONFIG_SCHED_BOOK and CONFIG_SCHED_DRAWER are selected, respectively.
 
 CONFIG_SCHED_BOOK and CONFIG_DRAWER are currently only used on s390, where
 they reflect the cpu and cache hierarchy.
-- 
2.18.0-rc0

