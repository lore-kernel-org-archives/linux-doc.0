Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 960367E22F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 18:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1033887AbeCAS0I (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 13:26:08 -0500
Received: from mail-pl0-f68.google.com ([209.85.160.68]:46668 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033879AbeCAS0G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 13:26:06 -0500
Received: by mail-pl0-f68.google.com with SMTP id y8-v6so4114556pll.13;
        Thu, 01 Mar 2018 10:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=QPECcsEFMP0TZXAfjLT56jepeeSZ+C2UOM4VMTi89+E=;
        b=IPdlCWFIrrHIrhWe83j65KxBp/ESI/qcNNIdC/J7CrBxZtQ/tS8gtyj93iTjA8mTp5
         RFIEZY2d+Pi4A8oYrnlBTkBvKhFk4gHbFmP1tZ+wjQKT6c+SJcHBwCwE15kqBSztKjbp
         N0NmKGuU+pIRPDQWeLl7wps+9EJoFzwTjrTjBfABrS0INTdNln3tqALHEDRGXz8mtqUx
         T6BrV3XfUSnrPeT0JKqUa1AKq9hoEcH7nbCgq6sl8e6VwJ4s2HWuOD88KM5IR1TBkzaf
         PokUzdkzTkb++MBM0SBhCbTk5o2KKdDn+ngXOSVJ+yl0wkFp1wkEM1MCKi/wZe4aAlXI
         8GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=QPECcsEFMP0TZXAfjLT56jepeeSZ+C2UOM4VMTi89+E=;
        b=LlQrE4kzZ08MWOF6vFBlMwxAqTgS05r2R0rHwZps6oYnLlod3aTjmX52OPDkkiqG6f
         SvTbNpk+gdfMPUCr7xn9NcXrFIIH6uDSAlHOdgkQg3bodk0WCH46nTJVVjA6/aIMxqqK
         lfWWkwvpGAdQIQk7b7AlBUUuHWe45s3Sys+sl9rVuIxh3a9z0YiKiVfUvvANWLRgjPE4
         j5+hwizCNihDklh/EZ+xoipjfKKLulooYfqdPYQHG+rOLWfNu9Amaa+5GKjYsn/GKxRG
         k0vLanQvzWAoTDJiMbLkhLcb/2zBNtak3wp8NG6Re8M8K8WD4D7MxPpcm3N6oZGx5ejL
         dMNQ==
X-Gm-Message-State: APf1xPBCV1OAdv9cRhRj8wpwMnEXPmkN+aDakS/No0XHhmq/Ea3lV79Q
        TJsqg44LiS7wRjdd++pe0js=
X-Google-Smtp-Source: AG47ELukeT7KFyhsvnt8fl7ZdmQnCP26QgkaGRmkBBYPis3iGf1XcAsswl1Pl+na3r8ioWQmlPhRnA==
X-Received: by 2002:a17:902:8f97:: with SMTP id z23-v6mr2755762plo.162.1519928765584;
        Thu, 01 Mar 2018 10:26:05 -0800 (PST)
Received: from mordor.localdomain ([183.82.18.45])
        by smtp.gmail.com with ESMTPSA id e16sm5074150pfb.157.2018.03.01.10.26.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Mar 2018 10:26:04 -0800 (PST)
Date:   Thu, 1 Mar 2018 23:55:59 +0530
From:   Aishwarya Pant <aishpant@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org
Subject: [PATCH] char/bsr: add sysfs interface documentation
Message-ID: <20180301182559.GA32264@mordor.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Descriptions have collected from code comments and by reading through
code.

Signed-off-by: Aishwarya Pant <aishpant@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-bsr | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-bsr

diff --git a/Documentation/ABI/testing/sysfs-class-bsr b/Documentation/ABI/testing/sysfs-class-bsr
new file mode 100644
index 000000000000..7bf145d32cbc
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-bsr
@@ -0,0 +1,25 @@
+What:		/sys/class/bsr/bsr*/bsr_size
+Date:		Jul, 2008
+KernelVersion:	2.6.27
+Contact:	Arnd Bergmann <arnd@arndb.de>,
+		Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Description:
+		(RO) Size of the barrier-synchronization register (BSR)
+		register in bytes.
+
+What:		/sys/class/bsr/bsr*/bsr_length
+Date:		Jul, 2008
+KernelVersion:	2.6.27
+Contact:	Arnd Bergmann <arnd@arndb.de>,
+		Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Description:
+		(RO) The length of memory region that can be mapped in bytes.
+
+What:		/sys/class/bsr/bsr*/bsr_stride
+Date:		Jul, 2008
+KernelVersion:	2.6.27
+Contact:	Arnd Bergmann <arnd@arndb.de>,
+		Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Description:
+		(RO) The stride or the interval at which the allocated BSR bytes
+		repeat within the mapping.
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
