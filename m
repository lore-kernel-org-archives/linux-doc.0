Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93125C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jan 2022 16:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241337AbiAFQnq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jan 2022 11:43:46 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:40777 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241308AbiAFQnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jan 2022 11:43:45 -0500
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Jan 2022 11:43:45 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1641487060;
    s=strato-dkim-0002; d=thson.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wAcftMYvpxNI2AzULy3ljKiRHW2rqgQ/ch64sBX3nsc=;
    b=r6e/tGpjew7UdqfJNL9/oiyOAekFl7ZyXuM2QhP19bSSmSu/O5oac+uLfLsw2Kz4hU
    oAIqxUOKD5pvLRWIN5O1c4rgbPocQ9DAsL9eSoerkGI4a1buiVu7izlmi4qv1CDQAeie
    tr/ECBg39zbJ6v5ZQp99ky9+vSrAK4Pyk9Rij1Eg2n4+sJgiynE/BjXYIXK+qOuZxPii
    I2I8WdLYbreLXRLEN+RFdDmVno1k1/y5tvR+tuys+YG2T6gkRthNbqbWFRo/V6ciHJ9E
    Q3cBDkYb/6HwofjKPK4EARqSWUzlA8D/d/ymmAeZ445+2gD+EihWP8AkXpqSM9dhTeUU
    g/6g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":PHkGeUmrW+uCZmxs998QJRUX30nOwJd7nOD9sw/xoauycprg5uef7cgCEpy7sPc="
X-RZG-CLASS-ID: mo00
Received: from USER-PC.fritz.box
    by smtp.strato.de (RZmta 47.37.4 DYNA|AUTH)
    with ESMTPSA id u2923ay06Gbe8Gt
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 6 Jan 2022 17:37:40 +0100 (CET)
From:   Thore Sommer <public@thson.de>
To:     dm-devel@redhat.com, agk@redhat.com, snitzer@redhat.com
Cc:     linux-doc@vger.kernel.org, tusharsu@linux.microsoft.com,
        Thore Sommer <public@thson.de>
Subject: [PATCH] dm ima: updates to grammar and some details in documentation
Date:   Thu,  6 Jan 2022 17:37:31 +0100
Message-Id: <20220106163731.165391-1-public@thson.de>
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
 .../admin-guide/device-mapper/dm-ima.rst      | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-ima.rst b/Documentation/admin-guide/device-mapper/dm-ima.rst
index a4aa50a828e0..fb6e4148b426 100644
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
+ dm-device-name := Name of the device. If it contains special characters like '\', ',', ';',"=",
                    they are prefixed with '\'.
- dm-device-uuid := UUID of the device. If it contains special characters like '\', ',', ';',
+ dm-device-uuid := UUID of the device. If it contains special characters like '\', ',', ';',"=",
                    they are prefixed with '\'.
 
  table_load_data := <target_data>
@@ -175,8 +178,9 @@ The IMA measurement log has the following format for 'dm_device_resume':
 ::
 
  EVENT_NAME := "dm_device_resume"
- EVENT_DATA := <dm_version_str> ";" <device_metadata> ";" <active_table_hash> ";" <current_device_capacity> ";"
+ EVENT_DATA := <dm_version_str> ";" device_data ";" <current_device_capacity> ";"
 
+ device_data := <device_metadata> ";" <active_table_hash> | device_resume_no_data
  dm_version_str := As described in the 'Table load' section above.
  device_metadata := As described in the 'Table load' section above.
  active_table_hash := "active_table_hash=" <table_hash_alg> ":" <table_hash>
@@ -189,6 +193,9 @@ The IMA measurement log has the following format for 'dm_device_resume':
                events for a given device, the hash is computed combining all the event data
                i.e. (<dm_version_str> ";" <device_metadata> ";" <table_load_data> ";")
                across all those events.
+ device_resume_no_data := "device_resume=no_data"
+                           If device metadata and hash for the active table do not exists this value gets measured.
+                           Note: the hash should always exist if the device metadata is present.
  current_device_capacity := "current_device_capacity=" <N>
 
  For instance, if a linear device is resumed with the following command,
@@ -213,10 +220,10 @@ The IMA measurement log has the following format for 'dm_device_remove':
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
@@ -225,6 +232,9 @@ The IMA measurement log has the following format for 'dm_device_remove':
                       The format is same as 'active_table_hash' described in the 'Device resume' section above.
  inactive_table_hash :=  Hash of the inactive table.
                          The format is same as 'active_table_hash' described in the 'Device resume' section above.
+ device_remove_no_data := "device_remove=no_data"
+                          If device metadata and hash for the active and inactive table do not exists this value gets measured.
+                          Note: the hash should always exist if the device metadata is present.
  remove_all := "remove_all=" <yes_no>
  yes_no := "y" | "n"
  current_device_capacity := "current_device_capacity=" <N>
@@ -254,9 +264,13 @@ The IMA measurement log has the following format for 'dm_table_clear':
 ::
 
  EVENT_NAME := "dm_table_clear"
- EVENT_DATA := <dm_version_str> ";" <device_inactive_metadata> ";" <inactive_table_hash> ";" <current_device_capacity> ";"
+ EVENT_DATA := <dm_version_str> ";" <device_data> ";" <current_device_capacity> ";"
 
  dm_version_str := As described in the 'Table load' section above.
+ device_data := <device_inactive_metadata> ";" <inactive_table_hash> | <table_clear_no_data>
+ table_clear_no_data := "table_clear=no_data"
+                        If device metadata and hash for the inactive table do not exists this value gets measured.
+                        Note: the hash should always exist if the device metadata is present.
  device_inactive_metadata := Device metadata that was captured during the load time inactive table being cleared.
                              The format is same as 'device_metadata' described in the 'Table load' section above.
  inactive_table_hash := Hash of the inactive table being cleared from the device.
-- 
2.34.1

