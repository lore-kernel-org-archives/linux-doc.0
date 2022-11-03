Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D17C4332F
	for <linux-doc@archiver.kernel.org>; Thu,  3 Nov 2022 23:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiKCX7K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Nov 2022 19:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiKCX7J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Nov 2022 19:59:09 -0400
Received: from mx0a-003ede02.pphosted.com (mx0a-003ede02.pphosted.com [205.220.169.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618152125F
        for <linux-doc@vger.kernel.org>; Thu,  3 Nov 2022 16:59:08 -0700 (PDT)
Received: from pps.filterd (m0286617.ppops.net [127.0.0.1])
        by mx0b-003ede02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A3Nx8Tn003669
        for <linux-doc@vger.kernel.org>; Thu, 3 Nov 2022 16:59:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=getcruise.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=ppemail; bh=ouJbkpR6+J4Encuu8K7QZ3Tg66Y2gZ1ROektz28aaQ8=;
 b=qNuSTQHrlG29WMBEKCzuEhwbZzxB6GY99xiOvuj5BHHRWga2x6p/B5hkz2cx60hHH75P
 6JgW+zYu7qrkQRFfopmZG6DydatjSDuk30xktVeUBzNWjOtNYU4efSalYV5Wy11vAkPP
 pO6Fnu/wBPXcqrC760wvGd90QU2jNam0+qw/NGPPS9CGtG5jMgWarrBKRAbf4eW2mj+V
 pNeDmiejgUciOLFV8xF9XLoxdfDXcV1BSaUo8A8VCiZaaAADZYtnfAqiU/iLCdPH+3w9
 EfYdDJgAblXO8Ckiqaj6Fcz3zM04HqSyNL4W+h+eFkOUevHtCpbavh2CgQywvydhxNSu tg== 
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
        by mx0b-003ede02.pphosted.com (PPS) with ESMTPS id 3kmptmr0db-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 03 Nov 2022 16:59:07 -0700
Received: by mail-pl1-f198.google.com with SMTP id z15-20020a170903018f00b0018862d520fbso490356plg.11
        for <linux-doc@vger.kernel.org>; Thu, 03 Nov 2022 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ouJbkpR6+J4Encuu8K7QZ3Tg66Y2gZ1ROektz28aaQ8=;
        b=OAKCB1UKkJMmowNucXL/9mtiqjd2rHIVEgvHyojJcdPvsFIoahcervOah+E2d6sia3
         J7XRoq3KFs7WCY5YF7n35fC5DipAjvx5leflRZQH5RegAef2zIVv2Zh+YewQhWUfoZhK
         kGJV6i6uHGrLGi/dwKivK+r9+hLARwnd6HR5RlUNarGUpNSpKvSd/lpQyaAbFqbrhtRR
         8JVPGW+JRo7kzYFgmUqrmO4OZhGIh+ccHoxeBfsmJiakVUl6d4kRc6SP1HOY4cg/Vuvh
         DjKGlJxGYUYy8uS9H8gc9BaZoUGsPtpiIjPuulUlaph5lWzGiZipll0Up0op302Btj+O
         05cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouJbkpR6+J4Encuu8K7QZ3Tg66Y2gZ1ROektz28aaQ8=;
        b=DAsZbTB9Se81nisXzHjsSnFyIKHdBSiR59XT/nOtE9//LRErx32GfKsKzHozQtp3dq
         PPRwh2NVfO8LyuQym55aJdKWVO/73vHz1JaopvG3wl2SCZ8rIg+wc3N5HAk3+oQdN6h+
         akSzaS8rlNZT7fefc1Z348KxvfmKi7alXtEkGoXLDMGpYqfQZ0XWkyLHrDxpvAe8X/8h
         8u1itOBtld2DzEDLXAiqb3oojYYcF2YtUM3tKEIDsbGxyE08FumvBYkw4Jqv7YRsCCZB
         tUJw1qJXLu7IGl+ngQpqfmOYLYwtF9Vjr93LEwqWUaMIImGakoBAx2aG2Hnyz5c3qVDQ
         /fuA==
X-Gm-Message-State: ACrzQf1ZJA8Fr5oSFMHC5ikrdAiVGmISQU1ZD/G2tzJ7z4A838hJ4Nl3
        tuixpATP3vJbQZof1ev6lZq/Mn48AWNkBgAtnWnkXS7y4wneCulTWJpkSL7n2ZuKUGj8/dWGR21
        ANUrUJsUyTqnAolZtILY=
X-Received: by 2002:a17:90b:152:b0:213:dfd6:3e5e with SMTP id em18-20020a17090b015200b00213dfd63e5emr24109791pjb.229.1667519947161;
        Thu, 03 Nov 2022 16:59:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7SppjLEvoSfBSakmBLmRXOSm7cpqMiL0FcJeujJFX7yxnb9wtBbX+fAhrpea0RWwUGxQoOYQ==
X-Received: by 2002:a17:90b:152:b0:213:dfd6:3e5e with SMTP id em18-20020a17090b015200b00213dfd63e5emr24109771pjb.229.1667519946882;
        Thu, 03 Nov 2022 16:59:06 -0700 (PDT)
Received: from 4VPLMR2-DT.corp.robot.car ([199.73.125.241])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c08600b00183ba0fd54dsm1152555pld.262.2022.11.03.16.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 16:59:06 -0700 (PDT)
From:   Andy Ren <andy.ren@getcruise.com>
To:     netdev@vger.kernel.org
Cc:     richardbgobert@gmail.com, davem@davemloft.net,
        wsa+renesas@sang-engineering.com, edumazet@google.com,
        petrm@nvidia.com, kuba@kernel.org, pabeni@redhat.com,
        corbet@lwn.net, andrew@lunn.ch, dsahern@gmail.com,
        sthemmin@microsoft.com, idosch@idosch.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        roman.gushchin@linux.dev, Andy Ren <andy.ren@getcruise.com>
Subject: [PATCH net-next] net/core: Allow live renaming when an interface is up
Date:   Thu,  3 Nov 2022 16:58:47 -0700
Message-Id: <20221103235847.3919772-1-andy.ren@getcruise.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Zwos7P-CsMYoo1N5TMaGQiQvNotSm4vL
X-Proofpoint-GUID: Zwos7P-CsMYoo1N5TMaGQiQvNotSm4vL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 mlxlogscore=851
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030163
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch allows a network interface to be renamed when the interface
is up.

Live renaming was added as a failover in the past, and there has been no
arising issues of user space breaking. Furthermore, it seems that this
flag was added because in the past, IOCTL was used for renaming, which
would not notify the user space. Nowadays, it appears that the user
space receives notifications regardless of the state of the network
device (e.g. rtnetlink_event()). The listeners for NETDEV_CHANGENAME
also do not strictly ensure that the netdev is up or not.

Hence, this patch seeks to remove the live renaming flag and checks due
to the aforementioned reasons.

The changes are of following:
- Remove IFF_LIVE_RENAME_OK flag declarations
- Remove check in dev_change_name that checks whether device is up and
if IFF_LIVE_RENAME_OK is set by the network device's priv_flags
- Remove references of IFF_LIVE_RENAME_OK in the failover module

Signed-off-by: Andy Ren <andy.ren@getcruise.com>
---
 include/linux/netdevice.h |  3 ---
 net/core/dev.c            | 16 ----------------
 net/core/failover.c       |  6 +++---
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 4b5052db978f..e2ff45aa17f5 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1655,7 +1655,6 @@ struct net_device_ops {
  * @IFF_FAILOVER: device is a failover master device
  * @IFF_FAILOVER_SLAVE: device is lower dev of a failover master device
  * @IFF_L3MDEV_RX_HANDLER: only invoke the rx handler of L3 master device
- * @IFF_LIVE_RENAME_OK: rename is allowed while device is up and running
  * @IFF_TX_SKB_NO_LINEAR: device/driver is capable of xmitting frames with
  *	skb_headlen(skb) == 0 (data starts from frag0)
  * @IFF_CHANGE_PROTO_DOWN: device supports setting carrier via IFLA_PROTO_DOWN
@@ -1691,7 +1690,6 @@ enum netdev_priv_flags {
 	IFF_FAILOVER			= 1<<27,
 	IFF_FAILOVER_SLAVE		= 1<<28,
 	IFF_L3MDEV_RX_HANDLER		= 1<<29,
-	IFF_LIVE_RENAME_OK		= 1<<30,
 	IFF_TX_SKB_NO_LINEAR		= BIT_ULL(31),
 	IFF_CHANGE_PROTO_DOWN		= BIT_ULL(32),
 };
@@ -1726,7 +1724,6 @@ enum netdev_priv_flags {
 #define IFF_FAILOVER			IFF_FAILOVER
 #define IFF_FAILOVER_SLAVE		IFF_FAILOVER_SLAVE
 #define IFF_L3MDEV_RX_HANDLER		IFF_L3MDEV_RX_HANDLER
-#define IFF_LIVE_RENAME_OK		IFF_LIVE_RENAME_OK
 #define IFF_TX_SKB_NO_LINEAR		IFF_TX_SKB_NO_LINEAR
 
 /* Specifies the type of the struct net_device::ml_priv pointer */
diff --git a/net/core/dev.c b/net/core/dev.c
index 2e4f1c97b59e..a2d650ae15d7 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1163,22 +1163,6 @@ int dev_change_name(struct net_device *dev, const char *newname)
 
 	net = dev_net(dev);
 
-	/* Some auto-enslaved devices e.g. failover slaves are
-	 * special, as userspace might rename the device after
-	 * the interface had been brought up and running since
-	 * the point kernel initiated auto-enslavement. Allow
-	 * live name change even when these slave devices are
-	 * up and running.
-	 *
-	 * Typically, users of these auto-enslaving devices
-	 * don't actually care about slave name change, as
-	 * they are supposed to operate on master interface
-	 * directly.
-	 */
-	if (dev->flags & IFF_UP &&
-	    likely(!(dev->priv_flags & IFF_LIVE_RENAME_OK)))
-		return -EBUSY;
-
 	down_write(&devnet_rename_sem);
 
 	if (strncmp(newname, dev->name, IFNAMSIZ) == 0) {
diff --git a/net/core/failover.c b/net/core/failover.c
index 864d2d83eff4..655411c4ca51 100644
--- a/net/core/failover.c
+++ b/net/core/failover.c
@@ -80,14 +80,14 @@ static int failover_slave_register(struct net_device *slave_dev)
 		goto err_upper_link;
 	}
 
-	slave_dev->priv_flags |= (IFF_FAILOVER_SLAVE | IFF_LIVE_RENAME_OK);
+	slave_dev->priv_flags |= IFF_FAILOVER_SLAVE;
 
 	if (fops && fops->slave_register &&
 	    !fops->slave_register(slave_dev, failover_dev))
 		return NOTIFY_OK;
 
 	netdev_upper_dev_unlink(slave_dev, failover_dev);
-	slave_dev->priv_flags &= ~(IFF_FAILOVER_SLAVE | IFF_LIVE_RENAME_OK);
+	slave_dev->priv_flags &= ~IFF_FAILOVER_SLAVE;
 err_upper_link:
 	netdev_rx_handler_unregister(slave_dev);
 done:
@@ -121,7 +121,7 @@ int failover_slave_unregister(struct net_device *slave_dev)
 
 	netdev_rx_handler_unregister(slave_dev);
 	netdev_upper_dev_unlink(slave_dev, failover_dev);
-	slave_dev->priv_flags &= ~(IFF_FAILOVER_SLAVE | IFF_LIVE_RENAME_OK);
+	slave_dev->priv_flags &= ~IFF_FAILOVER_SLAVE;
 
 	if (fops && fops->slave_unregister &&
 	    !fops->slave_unregister(slave_dev, failover_dev))
-- 
2.38.1

