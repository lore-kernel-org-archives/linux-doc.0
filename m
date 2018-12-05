Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C97277D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 02:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbeLECf0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Dec 2018 21:35:26 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41233 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbeLECf0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Dec 2018 21:35:26 -0500
Received: by mail-pf1-f196.google.com with SMTP id b7so9212736pfi.8
        for <linux-doc@vger.kernel.org>; Tue, 04 Dec 2018 18:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=byW6p4S4eM51fSS1xfZ9xzVN+oqvY4pZ3OBeX/tNsqM=;
        b=ATrCFX0AUw3N/t6K+D+lC4nB4fmUsKeq1RFks/SpheQPpkjHC6Z6CVITWp++RH2gdi
         bhuO2LU5WwxohVR983/iYAhPARSEcMbe/1NywaUFmz2I+Q5+LCrS1u6Zcx319/nyUbKD
         Rvq9/glWewozLqQvUXAoMF9eMq1ov4Kwgc5VxCb7PnO6zL5rMySEb/MB9Oftw0sD9Cfj
         +nue9qyZbyEfBFatQTtGrSq40KdkZ73XecHRBRgpMpWMyvcL7d8UbdkAU1bxI+7vshuQ
         D5ZWYyUPzZd3i1lNMke7wIKSONnf5juC8wicTHD8DQdA05lFx2MWVeoy/mEVqerZnYaO
         PIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=byW6p4S4eM51fSS1xfZ9xzVN+oqvY4pZ3OBeX/tNsqM=;
        b=nSik1+AYiqOS8CgUdGNl6Y15HNsxR/sNJzLg0NwJJxBUhq6fGEG3XsovLa2nQaCTG5
         SIrrfdaOHGiyXOtUKqdwe7/2mLaq4YvOGpSe4PXKGKtyaJGRlKEj/M12oMrkjrgx2xQJ
         3tmSnVk5PfMjd33e5Y+nq7Bd4lAhgwlFTNNOAV0Wkz6bfo7ubUfVkYUKErlFFWl9/FOv
         Jgh2xdviYR+gT8E2ezNSZG292XReWPy1okgD68RTMGBwwSFb4ZxhnUO1sDyNM/a2P7x5
         tb4TS/LVmPuyQiqdip5Hf5P9FSRr5+UNe87DXrkQpbt7MzI2Zh+yiSiThOl09qSC/Bum
         O5Dw==
X-Gm-Message-State: AA+aEWYxeFS20fS+TI+g6bTFXZWH9L5RLPWao+DWlt5QKuuh/WaGxYX/
        bZmGDD9MqQ6Wf9RX+Xtnik8=
X-Google-Smtp-Source: AFSGD/VZ460ddkmSWsEb1ZtVrfS9y8Y9IMIzLwBgweXpFQGuJwDn1pNI83oEFnMYDXs/iW68Hcno5Q==
X-Received: by 2002:a63:c10f:: with SMTP id w15mr18644758pgf.199.1543977325174;
        Tue, 04 Dec 2018 18:35:25 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id v9sm27454463pfg.144.2018.12.04.18.35.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 18:35:24 -0800 (PST)
From:   Wei Yang <richard.weiyang@gmail.com>
To:     david@redhat.com, mhocko@suse.com, osalvador@suse.de
Cc:     akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH 1/2] admin-guide/memory-hotplug.rst: remove locking internal part from admin-guide
Date:   Wed,  5 Dec 2018 10:34:25 +0800
Message-Id: <20181205023426.24029-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.15.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Locking Internal section exists in core-api documentation, which is more
suitable for this.

This patch removes the duplication part here.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 40 -------------------------
 1 file changed, 40 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 5c4432c96c4b..241f4ce1e387 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -392,46 +392,6 @@ Need more implementation yet....
  - Notification completion of remove works by OS to firmware.
  - Guard from remove if not yet.
 
-
-Locking Internals
-=================
-
-When adding/removing memory that uses memory block devices (i.e. ordinary RAM),
-the device_hotplug_lock should be held to:
-
-- synchronize against online/offline requests (e.g. via sysfs). This way, memory
-  block devices can only be accessed (.online/.state attributes) by user
-  space once memory has been fully added. And when removing memory, we
-  know nobody is in critical sections.
-- synchronize against CPU hotplug and similar (e.g. relevant for ACPI and PPC)
-
-Especially, there is a possible lock inversion that is avoided using
-device_hotplug_lock when adding memory and user space tries to online that
-memory faster than expected:
-
-- device_online() will first take the device_lock(), followed by
-  mem_hotplug_lock
-- add_memory_resource() will first take the mem_hotplug_lock, followed by
-  the device_lock() (while creating the devices, during bus_add_device()).
-
-As the device is visible to user space before taking the device_lock(), this
-can result in a lock inversion.
-
-onlining/offlining of memory should be done via device_online()/
-device_offline() - to make sure it is properly synchronized to actions
-via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online_type)
-
-When adding/removing/onlining/offlining memory or adding/removing
-heterogeneous/device memory, we should always hold the mem_hotplug_lock in
-write mode to serialise memory hotplug (e.g. access to global/zone
-variables).
-
-In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) in read
-mode allows for a quite efficient get_online_mems/put_online_mems
-implementation, so code accessing memory can protect from that memory
-vanishing.
-
-
 Future Work
 ===========
 
-- 
2.15.1

