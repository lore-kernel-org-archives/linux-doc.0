Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A15F07E22E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 17:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751292AbeDNRv3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 14 Apr 2018 13:51:29 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:40241 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751202AbeDNRv0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Apr 2018 13:51:26 -0400
Received: by mail-pf0-f195.google.com with SMTP id y66so8519236pfi.7;
        Sat, 14 Apr 2018 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t/h0kL0o8PmNUtEMT7DVFrsaIwvOm+m86JD810Q+6JU=;
        b=C9ulx+b+NYQGuVJODGrLQ/0gzhndpGDYKhkOZPLL4+E2IV0ekAfbm5uZft9n3uLV93
         TLYyV9Ywd0jbiQ7+04k+lbE26ZMG/KEdo3O900EzoSD8ywibkoDM34MWqs81KZtCk9XN
         n0JU9oJe+rw2vyUcpGPj8qwkesb+qpoZK1lfaxcIYOIaXGBv8r7oTvAkS7UxThdphkDe
         YIv+1+NAjfwr6uFlzBUT9vcm30Y8okf8BAfwznSzGyMPzxiImRGicQMnO8uMDt2zKGx+
         S17g79LUvlQmEdsjgR4f3WIJw/FHMG3a1qQVHQsGB8yYFmoePvAcz+riRJ9Ctmpo1fPa
         JDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=t/h0kL0o8PmNUtEMT7DVFrsaIwvOm+m86JD810Q+6JU=;
        b=eVjZaNkdN1sRIkVVLoku4tpNGSxFzF7/pn1xAW95Z0j0P2hnSdtk14Ybdur5s7nOYP
         BVjmdhPgdddlnM425GXYLE16Nu8YAo5og6vesJfNUCEBzsiDqHr1iYZSODQq0LPkh75N
         ZF0Z1XAq6bTelSqfTyqAPxki6fBpsgxSmLwRSdn/K7wrlFJj9ZpoHkGM4IcM8fw2qv/5
         ktw5luvIVUKPGSZBxYRyi8ldECQRgMy/lKIaNjbjhXC6Bkbz0CKVlgKXBIeAtb8uDc4K
         J5HoCJwfktDOn0QDxlTwOqVykxoVRV3c82wQZgLviBG0D64jB3GEUpuVeQENaBstesOg
         i3LA==
X-Gm-Message-State: ALQs6tDFE+wNCh3sCx8FXvo/gLMZh/7pJVZ4nonDGEtELXXfKqH3QTVK
        H1ux8zaWab062GmI00v88RY=
X-Google-Smtp-Source: AIpwx49a2unmv276h5Ek89lyPpk4/XdPWG6mQRvp9rCBrbkrzsJm1va40oxdP5IscBe3/Y9pW8lfFw==
X-Received: by 10.99.101.194 with SMTP id z185mr7778275pgb.337.1523728286228;
        Sat, 14 Apr 2018 10:51:26 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id j3sm17232638pfj.60.2018.04.14.10.51.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 14 Apr 2018 10:51:25 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-scsi@vger.kernel.org,
        target-devel@vger.kernel.org, linux-doc@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 2/4] target: target_core_transport.c: enable+fix kernel-doc
Date:   Sat, 14 Apr 2018 10:51:04 -0700
Message-Id: <20180414175106.13760-3-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414175106.13760-1-rd.dunlab@gmail.com>
References: <20180414175106.13760-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

For exported functions that already have near-kernel-doc notation,
fix them to begin with "/**" and make a few corrections so that they
don't have any kernel-doc warnings.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org
Cc: target-devel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 drivers/target/target_core_transport.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

--- linux-next-20180413.orig/drivers/target/target_core_transport.c
+++ linux-next-20180413/drivers/target/target_core_transport.c
@@ -1431,7 +1431,7 @@ transport_generic_map_mem_to_cmd(struct
 	return 0;
 }
 
-/*
+/**
  * target_submit_cmd_map_sgls - lookup unpacked lun and submit uninitialized
  * 			 se_cmd + use pre-allocated SGL memory.
  *
@@ -1441,7 +1441,7 @@ transport_generic_map_mem_to_cmd(struct
  * @sense: pointer to SCSI sense buffer
  * @unpacked_lun: unpacked LUN to reference for struct se_lun
  * @data_length: fabric expected data transfer length
- * @task_addr: SAM task attribute
+ * @task_attr: SAM task attribute
  * @data_dir: DMA data direction
  * @flags: flags for command submission from target_sc_flags_tables
  * @sgl: struct scatterlist memory for unidirectional mapping
@@ -1578,7 +1578,7 @@ int target_submit_cmd_map_sgls(struct se
 }
 EXPORT_SYMBOL(target_submit_cmd_map_sgls);
 
-/*
+/**
  * target_submit_cmd - lookup unpacked lun and submit uninitialized se_cmd
  *
  * @se_cmd: command descriptor to submit
@@ -1587,7 +1587,7 @@ EXPORT_SYMBOL(target_submit_cmd_map_sgls
  * @sense: pointer to SCSI sense buffer
  * @unpacked_lun: unpacked LUN to reference for struct se_lun
  * @data_length: fabric expected data transfer length
- * @task_addr: SAM task attribute
+ * @task_attr: SAM task attribute
  * @data_dir: DMA data direction
  * @flags: flags for command submission from target_sc_flags_tables
  *
@@ -2606,7 +2606,8 @@ int transport_generic_free_cmd(struct se
 }
 EXPORT_SYMBOL(transport_generic_free_cmd);
 
-/* target_get_sess_cmd - Add command to active ->sess_cmd_list
+/**
+ * target_get_sess_cmd - Add command to active ->sess_cmd_list
  * @se_cmd:	command descriptor to add
  * @ack_kref:	Signal that fabric will perform an ack target_put_sess_cmd()
  */
@@ -2800,7 +2801,8 @@ void target_show_cmd(const char *pfx, st
 }
 EXPORT_SYMBOL(target_show_cmd);
 
-/* target_sess_cmd_list_set_waiting - Flag all commands in
+/**
+ * target_sess_cmd_list_set_waiting - Flag all commands in
  *         sess_cmd_list to complete cmd_wait_comp.  Set
  *         sess_tearing_down so no more commands are queued.
  * @se_sess:	session to flag
@@ -2835,7 +2837,8 @@ void target_sess_cmd_list_set_waiting(st
 }
 EXPORT_SYMBOL(target_sess_cmd_list_set_waiting);
 
-/* target_wait_for_sess_cmds - Wait for outstanding descriptors
+/**
+ * target_wait_for_sess_cmds - Wait for outstanding descriptors
  * @se_sess:    session to wait for active I/O
  */
 void target_wait_for_sess_cmds(struct se_session *se_sess)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
