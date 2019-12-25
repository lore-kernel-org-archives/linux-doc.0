Return-Path: <SRS0=2lNs=2P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2826C2D0DA
	for <linux-doc@archiver.kernel.org>; Wed, 25 Dec 2019 08:33:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B7E72072A
	for <linux-doc@archiver.kernel.org>; Wed, 25 Dec 2019 08:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfLYIdS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Dec 2019 03:33:18 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:27624 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfLYIdS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Dec 2019 03:33:18 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Dec 2019 03:33:17 EST
IronPort-SDR: q5qay+7xa4twN0fCClfbzsTOFjKuczpJV/23w4RvQyrMgU7qymgzuWWOe+CpJ7YA9OdKkOluTC
 FgylgRqePLOw==
IronPort-PHdr: =?us-ascii?q?9a23=3APvdeih9QxwjdYf9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B30+IcTK2v8tzYMVDF4r011RmVBN6dsagfwLWM+4nbGkU4qa6bt34DdJEeHz?=
 =?us-ascii?q?Qksu4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPER?=
 =?us-ascii?q?vjKwV1Ov71GonPhMiryuy+4ZLebxhGiTanf79+Mhu7oQrTu8UInIBvNrs/xh?=
 =?us-ascii?q?zVr3VSZu9Y33loJVWdnxb94se/4ptu+DlOtvwi6sBNT7z0c7w3QrJEAjsmNX?=
 =?us-ascii?q?s15NDwuhnYUQSP/HocXX4InRdOHgPI8Qv1Xpb1siv9q+p9xCyXNtD4QLwoRT?=
 =?us-ascii?q?iv6bpgRRn1gykFKjE56nnahMJwgqJBvhyvpAFxzIHIb4+aL/d+YqHQcs8GSW?=
 =?us-ascii?q?ZdQspdSSpMCZ68YYsVCOoBOP5VoY/nqFATtxW+HwisBObuyj9Uh3/2w7c12P?=
 =?us-ascii?q?kmHAHawQwgG84BsHXJo9rvL6cfSuW1w7PJzTXHdf9WxSny6IzWfRA5u/6DQa?=
 =?us-ascii?q?h8cdLNyUQ2EQ7Ok1aeqZT9Mj+Ly+gAsXKX4/duWO6zkWIrtQ58riKhy8osjI?=
 =?us-ascii?q?TCm5gbxUre9SpjxYY4Pdi4SElmbtG6CJZQrCSaN5duQsMlXmFopD42yr0Ytp?=
 =?us-ascii?q?6/eygH0JEnyATea/yDaYiH/BbjWPqeLDtimnJlf6+wiAy88UinzO3zSNO430?=
 =?us-ascii?q?hRriZdk9nMsG4C1wDL58SZV/dw/F2t1SuB2gzP8O1IP085mbDVJpMh2rIwk4?=
 =?us-ascii?q?AcsUXHHi/4gkX2i6qWe104+ui17+TofrTmqYKGOI9vkQz+N74hms27AegiLg?=
 =?us-ascii?q?gBQWyb9vqk1LL54UL1Wq1KjuEunqnDrJ/aPdgbprK+AwJN1oYj6hC/Dyqp0d?=
 =?us-ascii?q?gBgHYHK05KdQmZj4jmJV7OOur0DfShjFS2ljdk2fTGMqfmApXXIXiQ2IvmKL?=
 =?us-ascii?q?J87VNMjQY0xvhB6J9OTLIMOvT+Xgn2rtOLNBIhNx2IxLPDAZ1FzIIbWH6OHK?=
 =?us-ascii?q?bRZKfbqUWJ4+MzIveFaZQ9qjH9LP0s5vqogGJvynEHeqz8+ZJfUGq5G/V6Il?=
 =?us-ascii?q?uQKS7wn9MKEGsDpSI7Re3uzkGPVTNLbn30R75qtWJzM56vEYqWHtPlu7eGxi?=
 =?us-ascii?q?ruRpA=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GTKgBOHQNemCMYgtllgkQBGAEBgns?=
 =?us-ascii?q?3GyASk0JUBnUdihKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQU?=
 =?us-ascii?q?BAQEBAQUEAQECEAEBAQEBCAsLBimFSkIBDAGBayKEF4EDgSyDA4JTKa0XGgK?=
 =?us-ascii?q?FI4R1gTYBjBgaeYEHgUSCMoUCARIBbIUhBI1FIYhLYZd+gj4EljANgikBjDg?=
 =?us-ascii?q?DglSJEacigjdVgQuBCnFNOIFyGYEdTxgNjSyOLUCBFhACT4VAh1yCMgEB?=
X-IPAS-Result: =?us-ascii?q?A2GTKgBOHQNemCMYgtllgkQBGAEBgns3GyASk0JUBnUdi?=
 =?us-ascii?q?hKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQUBAQEBAQUEAQECE?=
 =?us-ascii?q?AEBAQEBCAsLBimFSkIBDAGBayKEF4EDgSyDA4JTKa0XGgKFI4R1gTYBjBgae?=
 =?us-ascii?q?YEHgUSCMoUCARIBbIUhBI1FIYhLYZd+gj4EljANgikBjDgDglSJEacigjdVg?=
 =?us-ascii?q?QuBCnFNOIFyGYEdTxgNjSyOLUCBFhACT4VAh1yCMgEB?=
X-IronPort-AV: E=Sophos;i="5.69,353,1571695200"; 
   d="scan'208";a="317906365"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 25 Dec 2019 09:27:57 +0100
Received: (qmail 32128 invoked from network); 25 Dec 2019 04:33:50 -0000
Received: from unknown (HELO 192.168.1.88) (seigo@[217.217.179.17])
          (envelope-sender <tulcidas@mail.telepac.pt>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-doc@vger.kernel.org>; 25 Dec 2019 04:33:50 -0000
Date:   Wed, 25 Dec 2019 05:33:41 +0100 (CET)
From:   La Primitiva <tulcidas@mail.telepac.pt>
Reply-To: La Primitiva <laprimitivaes@zohomail.eu>
To:     linux-doc@vger.kernel.org
Message-ID: <10447989.259353.1577248422215.JavaMail.javamailuser@localhost>
Subject: Take home 750,000 Euros this end of year
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Attn: Email User,

You have won, you are to reply back with your name and phone number for
claim.

La Primitiva




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

