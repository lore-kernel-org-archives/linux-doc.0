Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDD3C43217
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39C9861359
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235632AbhIPJBZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:01:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:36142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235360AbhIPJBW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:01:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A07561241;
        Thu, 16 Sep 2021 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631782802;
        bh=nNaeUlSwEFv+VPUbG93T21G4eNhmdRttUilMQiNdyfo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HxSk6yREic3yncomhI2OCa7Eebl/Ni/Ow2GKsjC+b0PhUuYWX7ALy7qhakX11D7Rz
         a0HZWEidQG/k3kBa2UsPoEUtVRyxDvvwnbjfaMqdVx8LbO9pkP/lgUQbIzE7D0aRKO
         5Bf+o6w0WsHiQezvAoBSQ1u83D86meWTvDqOqi3kifGSpgDsaWhu3jq/kMADZctw3r
         E0BeME2n4c8YzpodkzDIUb+jWpTGGdvkeNzW/IwInoJdMNyORCcr3T+p68tvVj8cmd
         SSBCj6HhsJmycMoublSo/k8LEcCJ0oHPgitIKsECMQmx7SZuuGXsGDWYDJVQhw8rBK
         d7moJQzTOtFSg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnFQ-001qjp-Ez; Thu, 16 Sep 2021 11:00:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/30] ABI: sysfs-class-tpm: use wildcards for pcr-* nodes
Date:   Thu, 16 Sep 2021 10:59:32 +0200
Message-Id: <4ab3fce91ea2bd7c36a07e6c646bf7bd6f4f8634.1631782432.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631782432.git.mchehab+huawei@kernel.org>
References: <cover.1631782432.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change how this expression is defined:

	/sys/class/tpm/tpmX/pcr-H/N

in order to allow get_abi.pl to convert it into this regex:

	/sys/class/tpm/tpmX/pcr-.*/.*

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/stable/sysfs-class-tpm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-class-tpm b/Documentation/ABI/stable/sysfs-class-tpm
index d897ecb9615f..411d5895bed4 100644
--- a/Documentation/ABI/stable/sysfs-class-tpm
+++ b/Documentation/ABI/stable/sysfs-class-tpm
@@ -195,7 +195,7 @@ Description:	The "tpm_version_major" property shows the TCG spec major version
 
 		  2
 
-What:		/sys/class/tpm/tpmX/pcr-H/N
+What:		/sys/class/tpm/tpmX/pcr-<H>/<N>
 Date:		March 2021
 KernelVersion:	5.12
 Contact:	linux-integrity@vger.kernel.org
-- 
2.31.1

