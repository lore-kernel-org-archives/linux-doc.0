Return-Path: <SRS0=Nog0=5A=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C876C10DCE
	for <linux-doc@archiver.kernel.org>; Sun, 15 Mar 2020 19:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDEA6206B1
	for <linux-doc@archiver.kernel.org>; Sun, 15 Mar 2020 19:15:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="kttOKYuv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbgCOTPJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 15 Mar 2020 15:15:09 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:62002 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728608AbgCOTPJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 15 Mar 2020 15:15:09 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id D03E1DA2;
        Sun, 15 Mar 2020 20:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :message-id:date:date:subject:subject:from:from:received
        :received:received; s=dkim20160331; t=1584299706; x=1586114107;
         bh=bag8h3Bf6++qo4qUBbiROrtyTc+uXuSQ3/jdLqq3kGA=; b=kttOKYuvoKh8
        6ZiRaVlh10inSXP6fYEI7q9c+OqlBqQYy1lj0ubyvhmqHK/OTPqqNfovD3AvcBXV
        bjVOHIVu6of3qLnnFV60RNjrkb/zya6iCF09ME0vnI05QK0NO5UvYcJ/fV4sRLsr
        bgt3JbCeECY4h11cfFXpFBK51mG7Ye4Zb6CW884+BFlZj2dig8ZDNPqbQpqeeT2c
        Vp1cuduxntdOmQXSIExkJZ3kdyE1o4bqkXB9ic7aCYDRTGhfYKhsAf9Z6cvp2E47
        OUecFSncaCfZwG2NMETPHkgzWdbsK+BL+vMTo73mormdOgoaLrEJ1Hoqrrb2x2xk
        R14akKCq/jhE1MMii8frpcAPJLRlDrcYsII1vzt1IGWuvC8WmDAf7PCxHdEKHllO
        WT8OlS2FQRx71BZGlEV+I3i3yzkr7sjPX1RiBdfXf75QG175bcDiAhzRDWfT85Pm
        bVC3pQsk+ohwEk+New31vxc1nYGIT7HmgzCXpjImE6a91w0SU56TZrvo4xo1cZ1P
        i+Ct23Xx6JoOCa5TPiXWRkwOntuIX0UFJPGcX/9szZ2YJcMxVDxItdqS9a92S0qX
        Uk7vyr07mxH8f38tVIO85fBSBkTOoqHds0/8Pw2SajgULWc9M3k3sLT7WZkpzEJj
        E4E9Dc+MJIjdSah8oM8gDGR+juxgYpI=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 81KobMb9mNtI; Sun, 15 Mar 2020 20:15:06 +0100 (CET)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 0C3FE829;
        Sun, 15 Mar 2020 20:15:05 +0100 (CET)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id B622E2376;
        Sun, 15 Mar 2020 20:15:05 +0100 (CET)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Sphinx Use Of 'autosectionlabel'
Date:   Sun, 15 Mar 2020 20:15:04 +0100
Message-ID: <1651548.KylsOV6ox4@harkonnen>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

a while ago we had a chat about the sphinx option 
'sphinx.ext.autosectionlabel'

https://lkml.org/lkml/2019/11/24/85

I can't see this patch in "docs-next". Are you planning to apply it, or should 
I continue to use/add labels?


