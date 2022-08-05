Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76EDC00140
	for <linux-doc@archiver.kernel.org>; Fri,  5 Aug 2022 08:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237631AbiHEI0F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Aug 2022 04:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiHEI0C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Aug 2022 04:26:02 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EEB2BDD
        for <linux-doc@vger.kernel.org>; Fri,  5 Aug 2022 01:26:00 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id j8so3706093ejx.9
        for <linux-doc@vger.kernel.org>; Fri, 05 Aug 2022 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=wfVbAncS7WlF/A72BpG5dEVApg68h3oEbY9bkWhBwIE=;
        b=2KkupbfExSKDu3R6RNaAW7L3Tqyowj8s9ZYiZSdorwwawRVl1ZHb9WeLRBrxivNuLl
         yBnqWfneQWaDS479UvTW4vAI767uZ/ej/m357WDKUuQwxz/AevLixHhhSXiDWB2ciJpn
         bhX7+i2tRH2TbPFffIpHxvGJrJuydtg0Xc5Gs1fmd/Z57b4KMK14mATnvkBtRuzlRyBB
         lmEzyIa5dxmZ6VYCU8LKDB8mV0i0xOOzuRklGoUy3LSi0uA/FrhyHilTUlN0dM4z3c44
         BM+15CrQRw9HIGPLoHM5Dq9QJyu/BlfcCHqN1QPsfi2VZnpP9luEtv3zcq6M9s6O7buv
         ub3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=wfVbAncS7WlF/A72BpG5dEVApg68h3oEbY9bkWhBwIE=;
        b=Qynvvn6D/V9V4nAqTgDkESlzRNcLKyMN/QmN4x4WZ7p6j+60N4H2M/WQgzN3091py8
         dhCkpsiZ2CQQQkFuYiyLuvLi7msBkvZwyprv6rAAF65mx3Qqz+FB8Rao/gkLlmcZGyO/
         XVZA8GvcF6pg7GL1dNuYt2UC42103+FAhQBK46sA3Og1AR/KYdhH+aizi51d0Isj/gJ2
         Xn1LoQVyjp7coIzKfImvssMD6lA8OsJKsAZTG+l5/hGS2WmFf3rflbMl+GS7cYXhbilg
         IZ8j+7VKxI9pJ1pOhSqxMEsGHUciFHnHDRaNZZtnIohSlT2wue8prWHe13ankSbtuj1n
         vkHg==
X-Gm-Message-State: ACgBeo200u5e21+ldwqtTIg4v7NBw85CiMXE73BRBpdryDWVn7ZRy9oM
        xDTlSZaPWNBwAMsixWvg6D/9Ug==
X-Google-Smtp-Source: AA6agR5cU3O/WEoX6T3Bwgc5k1iFz1ITG9sK47aEsSHSnT7ZY2L6zu/3Pd6WPag1yX/D/0tc3m29HA==
X-Received: by 2002:a17:907:69b0:b0:730:a1f0:63e7 with SMTP id ra48-20020a17090769b000b00730a1f063e7mr4460144ejc.364.1659687959091;
        Fri, 05 Aug 2022 01:25:59 -0700 (PDT)
Received: from localhost.localdomain (p200300d99703c2003e69dd231e074304.dip0.t-ipconnect.de. [2003:d9:9703:c200:3e69:dd23:1e07:4304])
        by smtp.googlemail.com with ESMTPSA id dc2-20020a170906c7c200b007306df330e5sm1349720ejb.12.2022.08.05.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 01:25:58 -0700 (PDT)
From:   Manfred Spraul <manfred@colorfullife.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>, linux-doc@vger.kernel.org
Cc:     Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
        Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH] Doc update: Correct magic values from nbd protocol, V2
Date:   Fri,  5 Aug 2022 10:25:32 +0200
Message-Id: <20220805082532.55131-1-manfred@colorfullife.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Manfred Spraul <manfred.spraul@de.bosch.com>

The magic number documentation refers to old values for
NBD_REQUEST_MAGIC and NBD_REPLY_MAGIC: The documented values were used
until Linux 2.1.116pre2.

Thus:
- Update the documentation.
- Update the header file: The authorative source for the nbd protocol
  is proto.md from the nbd package, thus mention this.
- Remove the historic values from the header file.
  The historic values are still documented in proto.md from the nbd
  package.

Removing the historic values is intentional:
The values are stale for > 20 years, and this was not noticed.
My guess is that everyone used grep to confirm that the values are
still in use - and the historic values resulted that there were
still hits with grep, ...

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
Link: https://github.com/NetworkBlockDevice/nbd/commit/107356ee528eb30744d518a8ac1cb6d379da4868
Link: https://lore.kernel.org/all/20220318200446.14648-1-manfred@colorfullife.com/
Link: https://lists.debian.org/nbd/2022/01/msg00039.html
---
V2:
- more links added, especially a link to the commit for proto.md
- typo corrected in the commit summary

@Jonathan:
I've created one patch that updates the English text and the 3 translations
that contain magic-number.rst.
Is this the right approach? I could also split the patch into 4 changes.

 Documentation/process/magic-number.rst                    | 4 ++--
 Documentation/translations/it_IT/process/magic-number.rst | 4 ++--
 Documentation/translations/zh_CN/process/magic-number.rst | 4 ++--
 Documentation/translations/zh_TW/process/magic-number.rst | 4 ++--
 include/uapi/linux/nbd.h                                  | 3 ++-
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/process/magic-number.rst b/Documentation/process/magic-number.rst
index f5ba36e96461..133ecfa10607 100644
--- a/Documentation/process/magic-number.rst
+++ b/Documentation/process/magic-number.rst
@@ -96,11 +96,11 @@ USB_SERIAL_PORT_MAGIC 0x7301           usb_serial_port          ``drivers/usb/se
 CG_MAGIC              0x00090255       ufs_cylinder_group       ``include/linux/ufs_fs.h``
 LSEMAGIC              0x05091998       lse                      ``drivers/fc4/fc.c``
 RIEBL_MAGIC           0x09051990                                ``drivers/net/atarilance.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/linux/nbd.h``
 RED_MAGIC2            0x170fc2a5       (any)                    ``mm/slab.c``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
 ISDN_X25IFACE_MAGIC   0x1e75a2b9       isdn_x25iface_proto_data ``drivers/isdn/isdn_x25iface.h``
 ECP_MAGIC             0x21504345       cdkecpsig                ``include/linux/cdk.h``
+NBD_REQUEST_MAGIC     0x25609513       nbd_request              ``include/uapi/linux/nbd.h``
 LSOMAGIC              0x27091997       lso                      ``drivers/fc4/fc.c``
 LSMAGIC               0x2a3b4d2a       ls                       ``drivers/fc4/fc.c``
 WANPIPE_MAGIC         0x414C4453       sdla_{dump,exec}         ``include/linux/wanpipe.h``
@@ -129,12 +129,12 @@ M3_CARD_MAGIC         0x646e6f50       m3_card                  ``sound/oss/maes
 FW_HEADER_MAGIC       0x65726F66       fw_header                ``drivers/atm/fore200e.h``
 SLOT_MAGIC            0x67267321       slot                     ``drivers/hotplug/cpqphp.h``
 SLOT_MAGIC            0x67267322       slot                     ``drivers/hotplug/acpiphp.h``
+NBD_REPLY_MAGIC       0x67446698       nbd_reply                ``include/uapi/linux/nbd.h``
 LO_MAGIC              0x68797548       nbd_device               ``include/linux/nbd.h``
 M3_STATE_MAGIC        0x734d724d       m3_state                 ``sound/oss/maestro3.c``
 VMALLOC_MAGIC         0x87654320       snd_alloc_track          ``sound/core/memory.c``
 KMALLOC_MAGIC         0x87654321       snd_alloc_track          ``sound/core/memory.c``
 PWC_MAGIC             0x89DC10AB       pwc_device               ``drivers/usb/media/pwc.h``
-NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``
 ENI155_MAGIC          0xa54b872d       midway_eprom	        ``drivers/atm/eni.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
diff --git a/Documentation/translations/it_IT/process/magic-number.rst b/Documentation/translations/it_IT/process/magic-number.rst
index f452fafb1e84..17401994f2e8 100644
--- a/Documentation/translations/it_IT/process/magic-number.rst
+++ b/Documentation/translations/it_IT/process/magic-number.rst
@@ -102,11 +102,11 @@ USB_SERIAL_PORT_MAGIC 0x7301           usb_serial_port          ``drivers/usb/se
 CG_MAGIC              0x00090255       ufs_cylinder_group       ``include/linux/ufs_fs.h``
 LSEMAGIC              0x05091998       lse                      ``drivers/fc4/fc.c``
 RIEBL_MAGIC           0x09051990                                ``drivers/net/atarilance.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/linux/nbd.h``
 RED_MAGIC2            0x170fc2a5       (any)                    ``mm/slab.c``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
 ISDN_X25IFACE_MAGIC   0x1e75a2b9       isdn_x25iface_proto_data ``drivers/isdn/isdn_x25iface.h``
 ECP_MAGIC             0x21504345       cdkecpsig                ``include/linux/cdk.h``
+NBD_REQUEST_MAGIC     0x25609513       nbd_request              ``include/uapi/linux/nbd.h``
 LSOMAGIC              0x27091997       lso                      ``drivers/fc4/fc.c``
 LSMAGIC               0x2a3b4d2a       ls                       ``drivers/fc4/fc.c``
 WANPIPE_MAGIC         0x414C4453       sdla_{dump,exec}         ``include/linux/wanpipe.h``
@@ -135,12 +135,12 @@ M3_CARD_MAGIC         0x646e6f50       m3_card                  ``sound/oss/maes
 FW_HEADER_MAGIC       0x65726F66       fw_header                ``drivers/atm/fore200e.h``
 SLOT_MAGIC            0x67267321       slot                     ``drivers/hotplug/cpqphp.h``
 SLOT_MAGIC            0x67267322       slot                     ``drivers/hotplug/acpiphp.h``
+NBD_REPLY_MAGIC       0x67446698       nbd_reply                ``include/uapi/linux/nbd.h``
 LO_MAGIC              0x68797548       nbd_device               ``include/linux/nbd.h``
 M3_STATE_MAGIC        0x734d724d       m3_state                 ``sound/oss/maestro3.c``
 VMALLOC_MAGIC         0x87654320       snd_alloc_track          ``sound/core/memory.c``
 KMALLOC_MAGIC         0x87654321       snd_alloc_track          ``sound/core/memory.c``
 PWC_MAGIC             0x89DC10AB       pwc_device               ``drivers/usb/media/pwc.h``
-NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``
 ENI155_MAGIC          0xa54b872d       midway_eprom	        ``drivers/atm/eni.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 YAM_MAGIC             0xF10A7654       yam_port                 ``drivers/net/hamradio/yam.c``
diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/process/magic-number.rst
index 42f0635ca70a..1b376fe087b5 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/process/magic-number.rst
@@ -86,11 +86,11 @@ CG_MAGIC              0x00090255       ufs_cylinder_group       ``include/linux/
 LSEMAGIC              0x05091998       lse                      ``drivers/fc4/fc.c``
 GDTIOCTL_MAGIC        0x06030f07       gdth_iowr_str            ``drivers/scsi/gdth_ioctl.h``
 RIEBL_MAGIC           0x09051990                                ``drivers/net/atarilance.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/linux/nbd.h``
 RED_MAGIC2            0x170fc2a5       (any)                    ``mm/slab.c``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
 ISDN_X25IFACE_MAGIC   0x1e75a2b9       isdn_x25iface_proto_data ``drivers/isdn/isdn_x25iface.h``
 ECP_MAGIC             0x21504345       cdkecpsig                ``include/linux/cdk.h``
+NBD_REQUEST_MAGIC     0x25609513       nbd_request              ``include/uapi/linux/nbd.h``
 LSOMAGIC              0x27091997       lso                      ``drivers/fc4/fc.c``
 LSMAGIC               0x2a3b4d2a       ls                       ``drivers/fc4/fc.c``
 WANPIPE_MAGIC         0x414C4453       sdla_{dump,exec}         ``include/linux/wanpipe.h``
@@ -119,12 +119,12 @@ M3_CARD_MAGIC         0x646e6f50       m3_card                  ``sound/oss/maes
 FW_HEADER_MAGIC       0x65726F66       fw_header                ``drivers/atm/fore200e.h``
 SLOT_MAGIC            0x67267321       slot                     ``drivers/hotplug/cpqphp.h``
 SLOT_MAGIC            0x67267322       slot                     ``drivers/hotplug/acpiphp.h``
+NBD_REPLY_MAGIC       0x67446698       nbd_reply                ``include/uapi/linux/nbd.h``
 LO_MAGIC              0x68797548       nbd_device               ``include/linux/nbd.h``
 M3_STATE_MAGIC        0x734d724d       m3_state                 ``sound/oss/maestro3.c``
 VMALLOC_MAGIC         0x87654320       snd_alloc_track          ``sound/core/memory.c``
 KMALLOC_MAGIC         0x87654321       snd_alloc_track          ``sound/core/memory.c``
 PWC_MAGIC             0x89DC10AB       pwc_device               ``drivers/usb/media/pwc.h``
-NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``
 ENI155_MAGIC          0xa54b872d       midway_eprom	        ``drivers/atm/eni.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 DPMEM_MAGIC           0xc0ffee11       gdt_pci_sram             ``drivers/scsi/gdth.h``
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/process/magic-number.rst
index ae321a9aaece..ff385a369c7b 100644
--- a/Documentation/translations/zh_TW/process/magic-number.rst
+++ b/Documentation/translations/zh_TW/process/magic-number.rst
@@ -89,11 +89,11 @@ CG_MAGIC              0x00090255       ufs_cylinder_group       ``include/linux/
 LSEMAGIC              0x05091998       lse                      ``drivers/fc4/fc.c``
 GDTIOCTL_MAGIC        0x06030f07       gdth_iowr_str            ``drivers/scsi/gdth_ioctl.h``
 RIEBL_MAGIC           0x09051990                                ``drivers/net/atarilance.c``
-NBD_REQUEST_MAGIC     0x12560953       nbd_request              ``include/linux/nbd.h``
 RED_MAGIC2            0x170fc2a5       (any)                    ``mm/slab.c``
 BAYCOM_MAGIC          0x19730510       baycom_state             ``drivers/net/baycom_epp.c``
 ISDN_X25IFACE_MAGIC   0x1e75a2b9       isdn_x25iface_proto_data ``drivers/isdn/isdn_x25iface.h``
 ECP_MAGIC             0x21504345       cdkecpsig                ``include/linux/cdk.h``
+NBD_REQUEST_MAGIC     0x25609513       nbd_request              ``include/uapi/linux/nbd.h``
 LSOMAGIC              0x27091997       lso                      ``drivers/fc4/fc.c``
 LSMAGIC               0x2a3b4d2a       ls                       ``drivers/fc4/fc.c``
 WANPIPE_MAGIC         0x414C4453       sdla_{dump,exec}         ``include/linux/wanpipe.h``
@@ -122,12 +122,12 @@ M3_CARD_MAGIC         0x646e6f50       m3_card                  ``sound/oss/maes
 FW_HEADER_MAGIC       0x65726F66       fw_header                ``drivers/atm/fore200e.h``
 SLOT_MAGIC            0x67267321       slot                     ``drivers/hotplug/cpqphp.h``
 SLOT_MAGIC            0x67267322       slot                     ``drivers/hotplug/acpiphp.h``
+NBD_REPLY_MAGIC       0x67446698       nbd_reply                ``include/uapi/linux/nbd.h``
 LO_MAGIC              0x68797548       nbd_device               ``include/linux/nbd.h``
 M3_STATE_MAGIC        0x734d724d       m3_state                 ``sound/oss/maestro3.c``
 VMALLOC_MAGIC         0x87654320       snd_alloc_track          ``sound/core/memory.c``
 KMALLOC_MAGIC         0x87654321       snd_alloc_track          ``sound/core/memory.c``
 PWC_MAGIC             0x89DC10AB       pwc_device               ``drivers/usb/media/pwc.h``
-NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``
 ENI155_MAGIC          0xa54b872d       midway_eprom	        ``drivers/atm/eni.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 DPMEM_MAGIC           0xc0ffee11       gdt_pci_sram             ``drivers/scsi/gdth.h``
diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
index 20d6cc91435d..88752b20e6c8 100644
--- a/include/uapi/linux/nbd.h
+++ b/include/uapi/linux/nbd.h
@@ -11,6 +11,8 @@
  *            Cleanup PARANOIA usage & code.
  * 2004/02/19 Paul Clements
  *            Removed PARANOIA, plus various cleanup and comments
+ *
+ * See doc/proto.md of the nbd package for more details on the protocol.
  */
 
 #ifndef _UAPILINUX_NBD_H
@@ -63,7 +65,6 @@ enum {
 
 #define NBD_REQUEST_MAGIC 0x25609513
 #define NBD_REPLY_MAGIC 0x67446698
-/* Do *not* use magics: 0x12560953 0x96744668. */
 
 /*
  * This is the packet used for communication between client and
-- 
2.37.1

