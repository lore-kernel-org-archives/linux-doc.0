Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C18447E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 10:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756832AbeEJKrg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 06:47:36 -0400
Received: from forward1o.cmail.yandex.net ([37.9.109.84]:49426 "EHLO
        forward1o.cmail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756729AbeEJKrg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 06:47:36 -0400
X-Greylist: delayed 593 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 May 2018 06:47:35 EDT
Received: from mxback10j.mail.yandex.net (mxback10j.mail.yandex.net [IPv6:2a02:6b8:0:1619::113])
        by forward1o.cmail.yandex.net (Yandex) with ESMTP id D643821334;
        Thu, 10 May 2018 13:37:40 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback10j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id zrg2jPbRZ1-bdga3mMX;
        Thu, 10 May 2018 13:37:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1525948659;
        bh=lDcs/ZNz4R/nIoWEz209qGrR7Hc744zWRLN8rT7F48k=;
        h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
        b=j3ji1gltW+Mgncl0toCwifs46bIg+ZSMq1Rf7eFxwvjbLvxTghNGC+ppoQV+AxTWA
         Btdsh26PIpFcKx4rLn/Bey18silD0qxr/DYAWl8VLGXetorrwhxt4oGyFi6x0m/n65
         CrWsTcKnRSuoA2B3hmEd7lWeZXt5ZJyOvAoBrjq4=
Authentication-Results: mxback10j.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web4o.yandex.ru with HTTP;
        Thu, 10 May 2018 13:37:39 +0300
From:   Evgeniy Polyakov <zbr@ioremap.net>
Envelope-From: drustafa@yandex.ru
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <20180509071132.069a5d5d@lwn.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <cover.1525684985.git.mchehab+samsung@kernel.org>
        <cd5b6e6a8d51820ee158127cdd50e44645c44ee7.1525684985.git.mchehab+samsung@kernel.org>
        <702861525777419@web22j.yandex.ru>
        <20180509093218.5e566439@vento.lan> <20180509071132.069a5d5d@lwn.net>
Subject: Re: [PATCH 18/18] w1: w1_io.c: fix a kernel-doc warning
MIME-Version: 1.0
Message-Id: <351071525948659@web4o.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Thu, 10 May 2018 13:37:39 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi

09.05.2018, 16:11, "Jonathan Corbet" <corbet@lwn.net>:
> On Wed, 9 May 2018 09:32:18 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
>
>>  > Looks good to me, thank you!
>>  > What tree should this be forwarded to, or folks from linux doc will pick it up?
>>  >
>>  > Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
>>
>>  Jon prefers if this could go via the usual maintainer's tree.
>>
>>  So, could you send it via yours?
>
> With the ack I can pick it up, no worries. I somehow missed this when I
> went through the set.

Great, thank you!
Let me know if you want me to push it upstream via my tree.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
