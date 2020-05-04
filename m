Return-Path: <SRS0=VNB8=6S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D12C47247
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 12:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80434206A5
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 12:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="z72FOAdf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbgEDMNf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 May 2020 08:13:35 -0400
Received: from mx.kolabnow.com ([95.128.36.40]:4628 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726445AbgEDMNe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 May 2020 08:13:34 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 504DE65B;
        Mon,  4 May 2020 14:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1588594411; x=1590408812; bh=u926F2rhwyyWTtAsr0SzJILzFzbr8OSdjR3
        UwPi4Dcg=; b=z72FOAdfDlwoQg/0K/gheO/6A2cwFtzyI1bN8tKgKFeH/bhCzSh
        0dgGahLeGZ9qiOog8E1xxZSluAWplG1UKYOTltA5qIOsNUxMK5ca7zHLtsIj5YyL
        y9is2CSQf1FOvpwtU1ILyddxuZj/y3DC25glifJRA+l1r5nrCUwnfLTqW85SIpFi
        qG2DN4ciTaLuCaseDI1nBdJOp692QCYOY76z7Wlqv9TBDV4jbPnXwYJWE3HcRbSM
        lN5cmUkvtj4460X7+vBBEwGCfVKdlxLy7tIz1QiG63GNUF/S4s5fTeauLGX20RdR
        +qoXKGxwjAk0HBzzrp//Y69Saz9jhoY/1CZ6RUqj4cZAn5kDz7iMlTYjFCvuJOp/
        diLtZH4Yinqv8MAFKiDNeIOHIyAt5qhnx4FE8nqLQvHIP+5KFq7TIhtqlfHiO2oM
        3zNmCDErLqcDdxLhFHORyHFU9W/tFYIOF/+iTPFB9+N5nf04Y4kcdOiGF1WbV71N
        EHPEDYfJVdrkmcndcz65gHCbd7NvkSILMXjc7Dxd1i60FjjwIHSNELrAUSVcvomt
        TBf4FrcZNpKjy1y5BglNxZwkCGumxS2Nv3PDVwwJSeGvQ/+89g3AfWESHX8GW/JF
        maIGNa4dBBbTU6Y95yljipG3U/xV70Zq+v8096mc0y9K63JT6XpifrYU=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HhI7_ulcpZ56; Mon,  4 May 2020 14:13:31 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 26CC6AEE;
        Mon,  4 May 2020 14:13:30 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx003.mykolab.com (Postfix) with ESMTPS id 50541B05;
        Mon,  4 May 2020 14:13:30 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>,
        Martin Walch <walch.martin@web.de>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Eric Biggers <ebiggers@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mark Brown <broonie@kernel.org>, linux-doc@vger.kernel.org,
        Jiri Kosina <trivial@kernel.org>
Subject: Re: [PATCH] Documentation: Fix some broken references
Date:   Mon, 04 May 2020 14:13:26 +0200
Message-ID: <12511156.uLZWGnKmhe@harkonnen>
In-Reply-To: <2090819.vFx2qVVIhK@tacticalops>
References: <2090819.vFx2qVVIhK@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday, May 4, 2020 12:59:12 PM CEST Martin Walch wrote:
> From de5c61cdfe16218aaf133464eaec3ec88fdfe49f Mon Sep 17 00:00:00 2001
> From: Martin Walch <walch.martin@web.de>
> Date: Mon, 4 May 2020 12:31:15 +0200
> Subject: [PATCH] Documentation: Fix some broken references
> 
> filesystems/fsverity.rst:
> * device-mapper/verity.txt is now admin-guide/device-mapper/verity.rst
> 
> filesystems/ubifs-authentication.rst:
> * device-mapper has moved into admin-guide
> 
> process/submit-checklist.rst:
> translations/it_IT/process/submit-checklist.rst:
> translations/zh_CN/process/submit-checklist.rst:
> * ioctl has moved into userspace-api

these changes (submit-checklist) are already in the docs-next branch

> 
> Signed-off-by: Martin Walch <walch.martin@web.de>
> ---
>  Documentation/filesystems/fsverity.rst                        | 2 +-
>  Documentation/filesystems/ubifs-authentication.rst            | 4 ++--
>  Documentation/process/submit-checklist.rst                    | 2 +-
>  Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)




