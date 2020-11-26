Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8340BC56202
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 08:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B75020B80
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 08:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgKZIVb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 03:21:31 -0500
Received: from smtp.asem.it ([151.1.184.197]:52405 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728134AbgKZIVb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Nov 2020 03:21:31 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000631890.MSG 
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 09:21:28 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 26
 Nov 2020 09:21:26 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Thu, 26 Nov 2020 09:21:26 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Jonathan Corbet <corbet@lwn.net>
CC:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] docs/vm: hwpoison: fix spelling mistakes
Thread-Topic: [PATCH v1] docs/vm: hwpoison: fix spelling mistakes
Thread-Index: AQHWw0tZqIvTVMWGl0u6ElIkHqgF+qnZBWeAgAEMC5A=
Date:   Thu, 26 Nov 2020 08:21:26 +0000
Message-ID: <8475f7da06f7488d822553c3a62f24fa@asem.it>
References: <20201125165222.788910-1-f.suligoi@asem.it>
 <20201125101405.7ae6ff92@lwn.net>
In-Reply-To: <20201125101405.7ae6ff92@lwn.net>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A090211.5FBF6587.003B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

[PATCH v1] docs/vm: hwpoison: fix spelling mistakes
> 
> On Wed, 25 Nov 2020 17:52:22 +0100
> Flavio Suligoi <f.suligoi@asem.it> wrote:
> 
> > Actions:
> >
> > - fix spelling mistake
> > - reduce some double spaces to a single one
> 
> Please don't make changes like that last one; double spaces are not an
> error, and "fixing" them just adds noise to the history.

Thanks for your suggestions! I'm still learning!

> 
> Thanks,
> 
> jon

Best regards,

Flavio
