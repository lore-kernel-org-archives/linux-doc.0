Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D9CC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jan 2022 16:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355362AbiALQvh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jan 2022 11:51:37 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:43457 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355356AbiALQve (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jan 2022 11:51:34 -0500
X-Greylist: delayed 7724 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Jan 2022 11:51:33 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1642006289;
    s=strato-dkim-0002; d=thson.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=J3CqP3XxbqvGVH2Ovn/72z94n2Ys62oWqz8aEN+JrTU=;
    b=G0EvUXwWsiSNpKLN+QEFh59iFQ04Ke54ol9+ilJxvXziVRM8Eqq4p0I2xRgCp8BNV+
    Niu0d5TxDq43u5am5fJWSj7vJtW4iolyZJskupazMhz3dR1B+RpWo/fhQhHU7uYlM+np
    hBFwp/jHkn8MgGJCtA9VOMHtuBjRfgrMs9QsOqw1aU4ht0WEKVTYd7CSpMIw01L6Npkk
    F+GCsK82Ys5Fhq5cyTz4YlzlOlvJvMvUZN1NiXMG9JWLyoL7dzY0jVJOnTc/0wkgaKYJ
    R+dwkuopvKwB2KO46B40aSoztevs+Zy7ObrAkNuMlst6mn+hLI8iUr5NTX7dzCkhBv4D
    A5hg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":PHkGeUmrW+uCZmxs998QJRUX30nOwJd7nOD9sw/xoauycprg5uef7cgCEpy7sPc="
X-RZG-CLASS-ID: mo00
Received: from USER-PC.fritz.box
    by smtp.strato.de (RZmta 47.37.6 DYNA|AUTH)
    with ESMTPSA id k3f463y0CGpTRQi
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 12 Jan 2022 17:51:29 +0100 (CET)
From:   Thore Sommer <public@thson.de>
To:     dm-devel@redhat.com, agk@redhat.com, snitzer@redhat.com
Cc:     linux-doc@vger.kernel.org, tusharsu@linux.microsoft.com,
        Thore Sommer <public@thson.de>
Subject: [PATCH v3] dm ima: updates to grammar and some details in documentation
Date:   Wed, 12 Jan 2022 17:51:17 +0100
Message-Id: <20220112165117.2030908-1-public@thson.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The grammar for the events dm_device_remove, device_resume and
dm_table_clear did not include the no_data entry when device data
and hash are missing.

For the device uuid or name "=" is also escaped with a "\".

Add a note that dm_table_load might split its target measurements over
multiple IMA events.

Signed-off-by: Thore Sommer <public@thson.de>
---
v3: fixed missing spaces
v2:
- include also device name and uuid in grammar for no_data
- fixed spelling mistakes

 .../admin-guide/device-mapper/dm-ima.rst      | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-ima.rst b/Documentation/admin-guide/device-mapper/dm-ima.rst
index a4aa50a828e0..b9f80c543350 100644
--- a/Documentation/admin-guide/device-mapper/dm-ima.rst
+++ b/Documentation/admin-guide/device-mapper/dm-ima.rst
@@ -100,6 +100,9 @@ When a new table is loaded in a device's inactive table slot,
 the device information and target specific details from the
 targets in the table are measured.
 
+Note that if there are too many targets to measure at once multiple IMA
+measurements will be generated.
+
 The IMA measurement log has the following format for 'dm_table_load':
 
 ::
@@ -118,9 +121,9 @@ The IMA measurement log has the following format for 'dm_table_load':
  device_minor := "minor=" <N>
  minor_count := "minor_count=" <N>
  num_device_targets := "num_targets=" <N>
- dm-device-name := Name of the device. If it contains special characters like '\', ',', ';',
+ dm-device-name := Name of the device. If it contains special characters like '\', ',', ';', '=',
                    they are prefixed with '\'.
- dm-device-uuid := UUID of the device. If it contains special characters like '\', ',', ';',
+ dm-device-uuid := UUID of the device. If it contains special characters like '\', ',', ';', '=',
                    they are prefixed with '\'.
 
  table_load_data := <target_data>
@@ -175,8 +178,9 @@ The IMA measurement log has the following format for 'dm_device_resume':
 ::
 
  EVENT_NAME := "dm_device_resume"
- EVENT_DATA := <dm_version_str> ";" <device_metadata> ";" <active_table_hash> ";" <current_device_capacity> ";"
+ EVENT_DATA := <dm_version_str> ";" <device_data> ";" <current_device_capacity> ";"
 
+ device_data := <device_metadata> ";" <active_table_hash> | <device_resume_no_data>
  dm_version_str := As described in the 'Table load' section above.
  device_metadata := As described in the 'Table load' section above.
  active_table_hash := "active_table_hash=" <table_hash_alg> ":" <table_hash>
@@ -189,6 +193,11 @@ The IMA measurement log has the following format for 'dm_device_resume':
                events for a given device, the hash is computed combining all the event data
                i.e. (<dm_version_str> ";" <device_metadata> ";" <table_load_data> ";")
                across all those events.
+ device_resume_no_data := <device_name> "," <device_uuid> ";" "device_resume=no_data"
+                           If device metadata and hash for the active table do not exists, this value gets measured.
+                           Note: the hash should always exist if the device metadata is present.
+ device_name := As described in the 'Table load' section above.
+ device_uuid := As described in the 'Table load' section above.
  current_device_capacity := "current_device_capacity=" <N>
 
  For instance, if a linear device is resumed with the following command,
@@ -213,10 +222,10 @@ The IMA measurement log has the following format for 'dm_device_remove':
 ::
 
  EVENT_NAME := "dm_device_remove"
- EVENT_DATA := <dm_version_str> ";" <device_active_metadata> ";" <device_inactive_metadata> ";"
-               <active_table_hash> "," <inactive_table_hash> "," <remove_all> ";" <current_device_capacity> ";"
+ EVENT_DATA := <dm_version_str> ";" <device_data> <remove_all> ";" <current_device_capacity> ";"
 
  dm_version_str := As described in the 'Table load' section above.
+ device_data := <device_active_metadata> ";" <device_inactive_metadata> ";" <active_table_hash> "," <inactive_table_hash> "," | <device_remove_no_data> ";"
  device_active_metadata := Device metadata that reflects the currently loaded active table.
                            The format is same as 'device_metadata' described in the 'Table load' section above.
  device_inactive_metadata := Device metadata that reflects the inactive table.
@@ -225,6 +234,11 @@ The IMA measurement log has the following format for 'dm_device_remove':
                       The format is same as 'active_table_hash' described in the 'Device resume' section above.
  inactive_table_hash :=  Hash of the inactive table.
                          The format is same as 'active_table_hash' described in the 'Device resume' section above.
+ device_remove_no_data := <device_name> "," <device_uuid> ";" "device_remove=no_data"
+                          If device metadata and hash for the active and inactive table do not exists, this value gets measured.
+                          Note: the hash should always exist if the device metadata is present.
+ device_name := As described in the 'Table load' section above.
+ device_uuid := As described in the 'Table load' section above.
  remove_all := "remove_all=" <yes_no>
  yes_no := "y" | "n"
  current_device_capacity := "current_device_capacity=" <N>
@@ -254,9 +268,15 @@ The IMA measurement log has the following format for 'dm_table_clear':
 ::
 
  EVENT_NAME := "dm_table_clear"
- EVENT_DATA := <dm_version_str> ";" <device_inactive_metadata> ";" <inactive_table_hash> ";" <current_device_capacity> ";"
+ EVENT_DATA := <dm_version_str> ";" <device_data> ";" <current_device_capacity> ";"
 
  dm_version_str := As described in the 'Table load' section above.
+ device_data := <device_inactive_metadata> ";" <inactive_table_hash> | <table_clear_no_data>
+ table_clear_no_data := <device_name> "," <device_uuid> ";" "table_clear=no_data"
+                        If device metadata and hash for the inactive table do not exists, this value gets measured.
+                        Note: the hash should always exist if the device metadata is present.
+ device_name := As described in the 'Table load' section above.
+ device_uuid := As described in the 'Table load' section above.
  device_inactive_metadata := Device metadata that was captured during the load time inactive table being cleared.
                              The format is same as 'device_metadata' described in the 'Table load' section above.
  inactive_table_hash := Hash of the inactive table being cleared from the device.
-- 
2.34.1

