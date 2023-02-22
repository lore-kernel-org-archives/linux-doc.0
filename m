Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F92C636D6
	for <linux-doc@archiver.kernel.org>; Wed, 22 Feb 2023 23:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjBVX2V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 18:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjBVX2U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 18:28:20 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C8542BC0
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 15:28:19 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id pt11so11504890pjb.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 15:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hmqLmVCFveyVWfGCsXciPEe114ZcHPqqek/SRZLwjE=;
        b=L+VwIAKQ/9/Nlnz7BD8fGocbtGbKoIoGAyjiiXXeuOuddacmeYh2YLiZLdZQ+H402C
         uTBkxD33AzWnAn7ccatrNOv7AuktSvhOXwFDIURnuB0U9NbEhRQ31y6VsBhxTOBwqmhP
         7m9SM/Iys47gES9gtsmJDfp8IUxMeMAXpfawxfnRqSqrJnE+3K87bKnCy568Klq59FLp
         iwagrf39PLbmqfH3RrExF2L4/ii1yi9aIoH8Ta/R/LB4QWcrUollHm6a5O8d3rxYta8R
         AqInHa4Mbm/NjwFirRdvCHiwbylpAP2YHPCZkYsz7WPdoXAEQS0FlqkhwoLEBMrvai7O
         ndTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hmqLmVCFveyVWfGCsXciPEe114ZcHPqqek/SRZLwjE=;
        b=AORb42PiO3hgWV6k/mXppYCVQ7KQTzy2IdCVG6m7aChifu7B0nouTEDjQJCNFv9vh6
         SPmPUWj2i1MXxPKxX26/G7wYqoy1/OCfFyF/0vewr3X3otXV5q4rmUwjcvfE8nBYcR5n
         0GN8YuzEhdCt9hM+m/o40WuvMtGwuO9nDtxlLan73rVpfYtQYO2BgRA7XSGN4wvY3tps
         gJQo/GPq7Fze30AWGmRL8HIPPOxI/o1Oudx3JqSFVj72VrHey0xpd8Bb7Pxo/JuKT6+L
         dZvd3H2GUNMa2hGYZBiyrEcYYQetIu9cM8qaqVYRsuiUn2RmEwMJPd3qMHUlvwMTFOv8
         prMg==
X-Gm-Message-State: AO0yUKW7wHPXivX8YOlqp7itchbqcHSyDjaMLhEB4y/hKGqEsilpg8kp
        Z44myzAD5PVsmN1IBI6PxsyFL1sjzDZ5qNpe
X-Google-Smtp-Source: AK7set+9dF4fyJjYfq6f93AwnRIKV0uFr8niAWks8RPTXmNPHN5CZHjrlJrcvL8FJjHhDnWshANLlg==
X-Received: by 2002:a05:6a20:3a96:b0:c0:1faa:9b69 with SMTP id d22-20020a056a203a9600b000c01faa9b69mr1765669pzh.58.1677108498066;
        Wed, 22 Feb 2023 15:28:18 -0800 (PST)
Received: from harsh-Lenovo-IdeaPad-S340-14API.dlink.router ([45.115.190.184])
        by smtp.gmail.com with ESMTPSA id h191-20020a6383c8000000b004fba32949c3sm5761027pge.16.2023.02.22.15.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 15:28:17 -0800 (PST)
From:   Harsh Mishra <hmisraji07@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Harsh Mishra <hmisraji07@gmail.com>, skhan@linuxfoundation.org
Subject: [PATCH] Fixed the Warning: Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst:92: WARNING: Unexpected indentation.
Date:   Thu, 23 Feb 2023 04:57:58 +0530
Message-Id: <20230222232759.12599-1-hmisraji07@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

------

Dear Maintainers and Mentors,
I have successfully compeleted the task "Documentation Task" under "Linux Kernel Bug Fixing Spring 2023" Mentee Application. 
I have also solved a minor documentation warning in Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst .
Please have a look into it 
Regards,
Harsh Mishra



Signed-off-by: Harsh Mishra <hmisraji07@gmail.com>
---
 Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst b/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
index ec6e9f5bcf9e..d0fd6cf44911 100644
--- a/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
+++ b/Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst
@@ -88,5 +88,4 @@ capability to override those interceptions, but since this is not common, the
 mitigation that covers this path is not enabled by default.
 
 The mitigation for the KVM_CAP_X86_DISABLE_EXITS capability can be turned on
-using the boolean module parameter mitigate_smt_rsb, e.g.:
-        kvm.mitigate_smt_rsb=1
+using the boolean module parameter mitigate_smt_rsb, e.g.: kvm.mitigate_smt_rsb=1
-- 
2.34.1

