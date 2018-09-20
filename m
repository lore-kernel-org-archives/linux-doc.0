Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E96E27D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 13:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731684AbeITTHK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 15:07:10 -0400
Received: from forward106o.mail.yandex.net ([37.140.190.187]:52071 "EHLO
        forward106o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727078AbeITTHK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 15:07:10 -0400
X-Greylist: delayed 435 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Sep 2018 15:07:09 EDT
Received: from mxback14j.mail.yandex.net (mxback14j.mail.yandex.net [IPv6:2a02:6b8:0:1619::90])
        by forward106o.mail.yandex.net (Yandex) with ESMTP id 62897784F34;
        Thu, 20 Sep 2018 16:16:25 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback14j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id GaB98ZwFZ1-GNo4qMjI;
        Thu, 20 Sep 2018 16:16:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1537449384;
        bh=MYBfTwjWA4AHfvuc97MWNycENPpRQRgZHw52eVXd3bI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:Message-Id;
        b=KZbn/MQwUtm0ueuebpNo4M6hO0pb/hG68Ru7DivELs3U9PCVuxUk85W2af6YOHa74
         yudiaTCRKOXxfZms7CduIh+i4RQK5c4jeBjxTRmSlXmj5Osp8CUWfMB7SF3oDwd3wM
         lSU294Do1dEZaRrneUf9FgV/NVQDIC44KYDb1zco=
Authentication-Results: mxback14j.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva2-6ec8f0a6115e.qloud-c.yandex.net with HTTP;
        Thu, 20 Sep 2018 16:16:23 +0300
From:   Evgeniy Polyakov <zbr@ioremap.net>
Envelope-From: drustafa@yandex.ru
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
In-Reply-To: <20180920131137.GA18628@kroah.com>
References: <20180912124419.10623-1-vz@mleia.com> <20180920131137.GA18628@kroah.com>
Subject: Re: [PATCH] Documentation: filesystems: remove reminiscences of POHMELFS
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Thu, 20 Sep 2018 16:16:23 +0300
Message-Id: <966051537449383@iva2-6ec8f0a6115e.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


20.09.2018, 16:11, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>:

>>  Since likely any delopment of the filesystem is halted, the change removes
>>  the abandoned POHMELFS documentation from the kernel tree.
>>
>>  Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>
> I've taken this through the staging tree as that is where this code used
> to live. Thanks for the cleanup.

Thank you for picking it up
