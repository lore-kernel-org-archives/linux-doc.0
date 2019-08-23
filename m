Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 17F507D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Aug 2019 18:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404694AbfHWS0T (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Aug 2019 14:26:19 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46384 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404575AbfHWS0T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Aug 2019 14:26:19 -0400
Received: by mail-qk1-f193.google.com with SMTP id p13so8964734qkg.13
        for <linux-doc@vger.kernel.org>; Fri, 23 Aug 2019 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=ic2bPmp49U9Rzy6H/8n3XKjawc1Iamf9LKy2R4QYjC4=;
        b=mO/cdfSTCGvxNm2hVxTmeIbX0z4BjuwXIq6RV0OAHvNarrv95AY3v6XTpi594yhY7S
         nnFEF3KccvUWxhxFvScJaeI9PnFW2xJ98Jd/fuoDQn7iHZFgebh6kb6aB1dG+RQRleTr
         3cF8R5qmY5UOTyBgHbXDpsAbiDO6f+AvesizVil3iL7UvRwwTpiBygPvp8NPZPmTxRoe
         D14SSsf/8C+gP8HKcsNinJX/VW/+2knO4W5WzBevX+2DtVg+57qJxmbnlmn00cg6gyz3
         9nLWqnfHI8QALNp4gNuOQzI3zYXz1o3lOEEjml7HSPSuEKfG+ZaHWzebMVg6yyVYcmmD
         R9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=ic2bPmp49U9Rzy6H/8n3XKjawc1Iamf9LKy2R4QYjC4=;
        b=fKVtZNeUPImpyNrorvT3uIIT1rMh51fIt2z3w9vFWOFVPQsO6Lfd02xZERx6xL/FIa
         iVcOmfL+7pLplkXPBDz0n790ZXC2rsvWM7noj3rZxMFVCygxOdmX3pIGfGkn/aAmKlkG
         iqgDXRObQB3XMr2K83kkHDdmm5nmWVL8NYLsFDxMnPRnZOP4u7dJlrN9f9TQeCOEw0Kq
         89QJwuyYKA4HZzEjmGT1JmKdapWsVr4DJpV8OPazU720bYSdjODCzbjLL8JTj+8dRqOl
         xiUrJQ5dQx3t1n81YIVBnANPczmdWskUicb61BfIOro/M5P1WCxI1q5URfO+L7dSoGtB
         0Qqw==
X-Gm-Message-State: APjAAAViPSmvRd1zfLMlElz5hXAxoqldFexd3ltW2tvwkA39QX5n6qRs
        iOlC7z/BKQEJqzkPuw/zWMiQTss5Bi8=
X-Google-Smtp-Source: APXvYqw3QqHpmr1xJ3t7APG0/UNZ+q0SyFowdckejxy7PLJHI93b8EoUiwSpx4co8S43qM2s7LTC+g==
X-Received: by 2002:a05:620a:6cf:: with SMTP id 15mr5273647qky.98.1566584778139;
        Fri, 23 Aug 2019 11:26:18 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id x69sm1820881qkb.4.2019.08.23.11.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 11:26:18 -0700 (PDT)
Date:   Fri, 23 Aug 2019 11:26:07 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Vlad Buslov <vladbu@mellanox.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "jhs@mojatatu.com" <jhs@mojatatu.com>,
        "xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>,
        "jiri@resnulli.us" <jiri@resnulli.us>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "pablo@netfilter.org" <pablo@netfilter.org>,
        Jiri Pirko <jiri@mellanox.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next 03/10] net: sched: refactor block offloads
 counter usage
Message-ID: <20190823112607.1b4a69bf@cakuba.netronome.com>
In-Reply-To: <vbfftls17yl.fsf@mellanox.com>
References: <20190822124353.16902-1-vladbu@mellanox.com>
        <20190822124353.16902-4-vladbu@mellanox.com>
        <20190822155358.0171852c@cakuba.netronome.com>
        <vbfftls17yl.fsf@mellanox.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 23 Aug 2019 10:39:50 +0000, Vlad Buslov wrote:
> >> +/* Destroy filter and decrement block offload counter, if filter was previously
> >> + * offloaded.
> >> + */
> >> +  
> >
> > hm.. is this gap between comment and function it pertains to
> > intentional?  
> 
> Majority of function comments in cls_api.c have newline after them (not
> all of them though). I don't have any strong opinions regarding this.
> You suggest it is better not to have blank lines after function
> comments?

Ah, you're right. I think it's pretty strange to have a new line after
a comment which pertains only to the function which is immediately
following it. Often the new line is used as a separation, when the
comment describes whole section of the file..

I kind of wish kdoc allowed none of the parameters to be described.
Often you want to document the function but the parameters are kind 
of obvious.

Anyway... feel free to leave this as is.
