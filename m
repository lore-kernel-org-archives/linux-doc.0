Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D99E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 21:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfADV3A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 16:29:00 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37512 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfADV3A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 16:29:00 -0500
Received: by mail-wm1-f65.google.com with SMTP id g67so2423905wmd.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 13:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nVxjv/ZxMmfnJEt/WIIhh1/2TrdDKPrGPVLRv316t2A=;
        b=sotTzJxy3QCrPSDdT6bV7RM684rvKQmAlhEqY/KY99e3xRupnGm+RYQ21KJloOFKvq
         pEoJzCmcLbIGBgUWbRVXR6iV/+REtfsoCr2oCxeEZodxPSwC0Qp4+fx/qTW8ur0flQbD
         A1vnEY/O8+MsA9Et7p6pt7kyINISw/EC+HtKuF1We9dM3bgPs7mVqeeXXyIYL4YdVr1H
         q0llUqxM/zWfKliebnw0mBQ33n8LA/axiS0IhbKqX14Y9xZ8EzD7l4SQ9tTOo9DPhbSj
         ozvWSUHg5F36incPPTrzVPK3N6pn89VAGgCrpQgXDlQ68MnpGDd9t4yte9jc7K7hmTgE
         SatA==
X-Gm-Message-State: AJcUukd6xNib/iqAXD2go40c9VCulSlob3Z+xSFCFBCcIPOCuCluoVRX
        HcJPAYDNr1+suYEa7AIPgSHDZmo0+7M=
X-Google-Smtp-Source: ALg8bN4sNlXEzMOd8FSO7KjQ/urijM9lMms5+Fwx52uSp5aRPIMIRLIPAeOx23XGcn8X9SZBeMJO/g==
X-Received: by 2002:a1c:7409:: with SMTP id p9mr2579511wmc.136.1546637338707;
        Fri, 04 Jan 2019 13:28:58 -0800 (PST)
Received: from mcroce-redhat.redhat.com (host177-2-dynamic.16-87-r.retail.telecomitalia.it. [87.16.2.177])
        by smtp.gmail.com with ESMTPSA id e9sm40034754wro.16.2019.01.04.13.28.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jan 2019 13:28:58 -0800 (PST)
From:   Matteo Croce <mcroce@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH 01/12] documentation: fix typo
Date:   Fri,  4 Jan 2019 22:28:56 +0100
Message-Id: <20190104212856.28366-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix spelling mistake: "lenght" -> "length"

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 Documentation/devicetree/bindings/usb/s3c2410-usb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
index e45b38ce2986..26c85afd0b53 100644
--- a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
+++ b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
@@ -4,7 +4,7 @@ OHCI
 
 Required properties:
  - compatible: should be "samsung,s3c2410-ohci" for USB host controller
- - reg: address and lenght of the controller memory mapped region
+ - reg: address and length of the controller memory mapped region
  - interrupts: interrupt number for the USB OHCI controller
  - clocks: Should reference the bus and host clocks
  - clock-names: Should contain two strings
-- 
2.20.1

