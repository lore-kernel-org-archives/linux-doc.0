Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7174FC4743D
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B811613B1
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234651AbhFHV0Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 17:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46498 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234430AbhFHV0O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 17:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623187460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UtZaABgHnos9vMp3MWj10mGev3U6+sZYnRtE5s2b9NI=;
        b=ddANR6EErXuOEp6h8wZqW2WHKMBjrxuHFGC3H8SjFAM5RbqaY7V6BmpKWkIxmhy+e4MmOf
        zk9R8a2DAO1nFND6gQTWGR1SvNsOnpQ3nIHcAPxmJjZ1ki/3CtVrT5exLMTRnvk51ammgs
        PpD6UPwQMUozmKJficB9XC98qg2uUH0=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-jmOrHNkHOoqY6LktnNcORQ-1; Tue, 08 Jun 2021 17:24:20 -0400
X-MC-Unique: jmOrHNkHOoqY6LktnNcORQ-1
Received: by mail-ot1-f70.google.com with SMTP id c10-20020a9d75ca0000b02903f63362f6f3so1804732otl.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 14:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UtZaABgHnos9vMp3MWj10mGev3U6+sZYnRtE5s2b9NI=;
        b=eB6qSR/50/eppV4+SGwpYjhfKSvSRCB7l4xowjh+YvreL+8X7skcQqAtggLbe2EGbQ
         mp3fdaZnOK5nqPB+tZ1bzYJl7njU6j/hASylZ25gpyg8cvEO8kjpiIa3KGWhxGN2o4CL
         CvRog2PZ3hv7tZQzy7Hj8DMicRYaPS4eO5XDgGEzBlTni6RBRmusuaAKIqx5ILwI2CvZ
         FEKQoJVOM6yyiLESD0wmSiuJNZQsAZuRrsRbTNiRNLjz5qilOncMlxM4QZMAVDGc7PGR
         40WFm/rkVN2TGhY8SQiUqle357VzxlvpeERZfBLJCQe2x8enTk9Umn3pNdfeIDeWbHjd
         z0sg==
X-Gm-Message-State: AOAM530H0LtY01MwOXDHj0QXQFTvsJ7OkGlc+GBAbrCzCc/dzOMB+Mjn
        YxHUofIwh+X8Bw5VNWtbPLAQ3RDx3CIV7s6RMuuuSHTHDSWnrudZKsxMvh/BAESuvm7k4T2zZEe
        cwfVEu6QjErkmrMZILoCw
X-Received: by 2002:a9d:d55:: with SMTP id 79mr932339oti.349.1623187458884;
        Tue, 08 Jun 2021 14:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqN6tH7UGv4x8Nrx6H0dkKbzUfaWR6ncTxAak2Ku8kma/JdWAv0IUB7utebAVWj8qtLvK4vA==
X-Received: by 2002:a9d:d55:: with SMTP id 79mr932311oti.349.1623187458704;
        Tue, 08 Jun 2021 14:24:18 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:18 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com,
        corbet@lwn.net, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
        grandmaster@al2klimov.de
Cc:     linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
        linux-staging@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH 07/11] fpga-mgr: change FPGA indirect article to an
Date:   Tue,  8 Jun 2021 14:23:46 -0700
Message-Id: <20210608212350.3029742-9-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/fpga-mgr.c       | 22 +++++++++++-----------
 include/linux/fpga/fpga-mgr.h |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index b85bc47c91a9a..ae21202105af7 100644
--- a/drivers/fpga/fpga-mgr.c
+++ b/drivers/fpga/fpga-mgr.c
@@ -26,7 +26,7 @@ struct fpga_mgr_devres {
 };
 
 /**
- * fpga_image_info_alloc - Allocate a FPGA image info struct
+ * fpga_image_info_alloc - Allocate an FPGA image info struct
  * @dev: owning device
  *
  * Return: struct fpga_image_info or NULL
@@ -50,7 +50,7 @@ struct fpga_image_info *fpga_image_info_alloc(struct device *dev)
 EXPORT_SYMBOL_GPL(fpga_image_info_alloc);
 
 /**
- * fpga_image_info_free - Free a FPGA image info struct
+ * fpga_image_info_free - Free an FPGA image info struct
  * @info: FPGA image info struct to free
  */
 void fpga_image_info_free(struct fpga_image_info *info)
@@ -470,7 +470,7 @@ static int fpga_mgr_dev_match(struct device *dev, const void *data)
 }
 
 /**
- * fpga_mgr_get - Given a device, get a reference to a fpga mgr.
+ * fpga_mgr_get - Given a device, get a reference to an fpga mgr.
  * @dev:	parent device that fpga mgr was registered with
  *
  * Return: fpga manager struct or IS_ERR() condition containing error code.
@@ -487,7 +487,7 @@ struct fpga_manager *fpga_mgr_get(struct device *dev)
 EXPORT_SYMBOL_GPL(fpga_mgr_get);
 
 /**
- * of_fpga_mgr_get - Given a device node, get a reference to a fpga mgr.
+ * of_fpga_mgr_get - Given a device node, get a reference to an fpga mgr.
  *
  * @node:	device node
  *
@@ -506,7 +506,7 @@ struct fpga_manager *of_fpga_mgr_get(struct device_node *node)
 EXPORT_SYMBOL_GPL(of_fpga_mgr_get);
 
 /**
- * fpga_mgr_put - release a reference to a fpga manager
+ * fpga_mgr_put - release a reference to an fpga manager
  * @mgr:	fpga manager structure
  */
 void fpga_mgr_put(struct fpga_manager *mgr)
@@ -550,7 +550,7 @@ void fpga_mgr_unlock(struct fpga_manager *mgr)
 EXPORT_SYMBOL_GPL(fpga_mgr_unlock);
 
 /**
- * fpga_mgr_create - create and initialize a FPGA manager struct
+ * fpga_mgr_create - create and initialize an FPGA manager struct
  * @dev:	fpga manager device from pdev
  * @name:	fpga manager name
  * @mops:	pointer to structure of fpga manager ops
@@ -617,7 +617,7 @@ struct fpga_manager *fpga_mgr_create(struct device *dev, const char *name,
 EXPORT_SYMBOL_GPL(fpga_mgr_create);
 
 /**
- * fpga_mgr_free - free a FPGA manager created with fpga_mgr_create()
+ * fpga_mgr_free - free an FPGA manager created with fpga_mgr_create()
  * @mgr:	fpga manager struct
  */
 void fpga_mgr_free(struct fpga_manager *mgr)
@@ -641,7 +641,7 @@ static void devm_fpga_mgr_release(struct device *dev, void *res)
  * @mops:	pointer to structure of fpga manager ops
  * @priv:	fpga manager private data
  *
- * This function is intended for use in a FPGA manager driver's probe function.
+ * This function is intended for use in an FPGA manager driver's probe function.
  * After the manager driver creates the manager struct with
  * devm_fpga_mgr_create(), it should register it with fpga_mgr_register().  The
  * manager driver's remove function should call fpga_mgr_unregister().  The
@@ -674,7 +674,7 @@ struct fpga_manager *devm_fpga_mgr_create(struct device *dev, const char *name,
 EXPORT_SYMBOL_GPL(devm_fpga_mgr_create);
 
 /**
- * fpga_mgr_register - register a FPGA manager
+ * fpga_mgr_register - register an FPGA manager
  * @mgr: fpga manager struct
  *
  * Return: 0 on success, negative error code otherwise.
@@ -706,10 +706,10 @@ int fpga_mgr_register(struct fpga_manager *mgr)
 EXPORT_SYMBOL_GPL(fpga_mgr_register);
 
 /**
- * fpga_mgr_unregister - unregister a FPGA manager
+ * fpga_mgr_unregister - unregister an FPGA manager
  * @mgr: fpga manager struct
  *
- * This function is intended for use in a FPGA manager driver's remove function.
+ * This function is intended for use in an FPGA manager driver's remove function.
  */
 void fpga_mgr_unregister(struct fpga_manager *mgr)
 {
diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
index 3a32b8e201857..474c1f5063070 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -75,7 +75,7 @@ enum fpga_mgr_states {
 #define FPGA_MGR_COMPRESSED_BITSTREAM	BIT(4)
 
 /**
- * struct fpga_image_info - information specific to a FPGA image
+ * struct fpga_image_info - information specific to an FPGA image
  * @flags: boolean flags as defined above
  * @enable_timeout_us: maximum time to enable traffic through bridge (uSec)
  * @disable_timeout_us: maximum time to disable traffic through bridge (uSec)
-- 
2.26.3

