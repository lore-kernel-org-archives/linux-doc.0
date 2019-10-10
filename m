Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F30937D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Oct 2019 04:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfJJEIp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Oct 2019 00:08:45 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37541 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfJJEIp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Oct 2019 00:08:45 -0400
Received: by mail-pf1-f194.google.com with SMTP id y5so3021081pfo.4;
        Wed, 09 Oct 2019 21:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:user-agent:date:from:to:cc:cc:subject:references
         :mime-version:content-disposition;
        bh=AgybdBW7OMpmZCFTkaCbVtzTa2aJQm+p47OtJIDsfsI=;
        b=AkfsBAgynWb2iVv4TLdWVgUPTpQTzatkJcTau8JP+t2UcDK44uqvWPLQa/sd3RPhHy
         VzoeORcG0QRQjVEAP/CVxjYGQgpaF4Pc108Fd0K7eauuj3vVFIthnQNXhyBaPTpvAKdf
         M4IWJjyiPm/k/iCICTdN8MjMc7DskhqjPevLS8PMcwavfbZIse4usKWAeunLRC3pLNI9
         e/RlVsijzdX1dTElE6zFcVScPuhCQ8i1yWaUmiSns7HQ3GGIQ6YHERTViPCZ9XLjZhc5
         4VicvC7aWOSAYtYTfc9Qn7S+KdA4krWNeRaGqFSDNtuV0q1niDWUfcfKhOATKBQ8q169
         E3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:user-agent:date:from:to:cc:cc:subject
         :references:mime-version:content-disposition;
        bh=AgybdBW7OMpmZCFTkaCbVtzTa2aJQm+p47OtJIDsfsI=;
        b=HbeQrSmGAqMeGUyZMB6Jvu7JeisAp3xWbZEXsBoKQZrqYgRF0iObhzCaDlDURnXR2O
         6y/Y+CiPEzmwZUtjzaCh+nC5XZkLW0moY35cWwNlQpLJWqfP+79o2vd2WA1yZuvhFfDX
         pWMxFrJkZL+/kC+s2uGISgK89CcLfq50ddc9ogKOIpN64zaxRsu3JH+DCEX5TAMt/DuH
         qCBGg25Ea9W9RSVRDcm4i30TZTydF8ne9QSZXZJ89NUJ5SRx3ZCyJfSvGqKVPa5nwpKF
         2M/lXF0unF4WAe+P9GntGZmVFoPfgndcVS0lH9KSShB7V2CiK1e2t+4NIAxTd5HJ317m
         2Zhw==
X-Gm-Message-State: APjAAAWXuAR6nRa2hrP1yNOa99QUnyJcBa2/+xSk54dn3BsFRlZQYQ+r
        OSDXForZkW7rEFRXHhgFEL2rRQp1
X-Google-Smtp-Source: APXvYqwGLdNSTlpVw8oAEElTgsYSIPHC1sL2smA5ebO4uDWVvDT1Q5qiwo19Dc8l5PRkBcq5K7Ewtg==
X-Received: by 2002:a17:90a:2484:: with SMTP id i4mr8624819pje.117.1570680524354;
        Wed, 09 Oct 2019 21:08:44 -0700 (PDT)
Received: from localhost ([2601:1c0:6280:3f0::9ef4])
        by smtp.gmail.com with ESMTPSA id 126sm3927928pgg.10.2019.10.09.21.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 21:08:43 -0700 (PDT)
Message-Id: <20191010035239.695604406@gmail.com>
User-Agent: quilt/0.65
Date:   Wed, 09 Oct 2019 20:52:41 -0700
From:   rd.dunlab@gmail.com
To:     linux-rdma@vger.kernel.org
Cc:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>, linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 02/12] infiniband: fix core/ipwm_util.h kernel-doc warnings
References: <20191010035239.532908118@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=007-iband-core-hdr001.patch
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix kernel-doc warnings and expected formatting.

../drivers/infiniband/core/iwpm_util.h:219: warning: Function parameter or member 'a_sockaddr' not described in 'iwpm_compare_sockaddr'
../drivers/infiniband/core/iwpm_util.h:219: warning: Function parameter or member 'b_sockaddr' not described in 'iwpm_compare_sockaddr'
../drivers/infiniband/core/iwpm_util.h:280: warning: Function parameter or member 'iwpm_pid' not described in 'iwpm_send_hello'

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Doug Ledford <dledford@redhat.com>
Cc: Jason Gunthorpe <jgg@mellanox.com>
Cc: linux-doc@vger.kernel.org
---
 drivers/infiniband/core/iwpm_util.h |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20191009.orig/drivers/infiniband/core/iwpm_util.h
+++ linux-next-20191009/drivers/infiniband/core/iwpm_util.h
@@ -210,8 +210,10 @@ int iwpm_mapinfo_available(void);
 
 /**
  * iwpm_compare_sockaddr - Compare two sockaddr storage structs
+ * @a_sockaddr: first sockaddr to compare
+ * @b_sockaddr: second sockaddr to compare
  *
- * Returns 0 if they are holding the same ip/tcp address info,
+ * Return: 0 if they are holding the same ip/tcp address info,
  * otherwise returns 1
  */
 int iwpm_compare_sockaddr(struct sockaddr_storage *a_sockaddr,
@@ -272,6 +274,7 @@ void iwpm_print_sockaddr(struct sockaddr
  * iwpm_send_hello - Send hello response to iwpmd
  *
  * @nl_client: The index of the netlink client
+ * @iwpm_pid: The pid of the user space port mapper
  * @abi_version: The kernel's abi_version
  *
  * Returns 0 on success or a negative error code


