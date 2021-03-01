Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3441EC433E0
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 13:57:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04D5E64E62
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 13:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236022AbhCAN4n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 08:56:43 -0500
Received: from z11.mailgun.us ([104.130.96.11]:49756 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235919AbhCAN4h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Mar 2021 08:56:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614606980; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5chAGnRHCOOOUrB3J0BqyQXRH/pOl11LjS7ONh8V23k=;
 b=Mym6ZbaVdlDUEzBCjOK4+YeUPkMitr58xPeJvJuWDXtzgbGff5MZHCsARLgGtkO6MqMvHWqH
 XZXCihDAUku2vJxLsPREcBBYRQgwByZ4Hpdmlrr0ZOMEOC/TZ1TxBHOswI8FvF05TfmhWXSq
 CWPg+r4Rle9X4IzEI9qrPinrkR4=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyIzNjUxMiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 603cf26475e4458f08af5709 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 13:55:48
 GMT
Sender: pintu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E555BC43461; Mon,  1 Mar 2021 13:55:47 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pintu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 43ABDC433C6;
        Mon,  1 Mar 2021 13:55:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 01 Mar 2021 19:25:47 +0530
From:   pintu@codeaurora.org
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, jaewon31.kim@samsung.com,
        yuzhao@google.com, shakeelb@google.com, guro@fb.com,
        mchehab+huawei@kernel.org, xi.fengfei@h3c.com,
        lokeshgidra@google.com, hannes@cmpxchg.org, nigupta@nvidia.com,
        famzheng@amazon.com, andrew.a.klychkov@gmail.com,
        bigeasy@linutronix.de, ping.ping@gmail.com, vbabka@suse.cz,
        yzaikin@google.com, keescook@chromium.org, mcgrof@kernel.org,
        corbet@lwn.net, pintu.ping@gmail.com
Subject: Re: [PATCH] mm: introduce clear all vm events counters
In-Reply-To: <20210301121342.GP2723601@casper.infradead.org>
References: <1614595766-7640-1-git-send-email-pintu@codeaurora.org>
 <20210301121342.GP2723601@casper.infradead.org>
Message-ID: <38eb8e74f10a9ca0b7e390223edb9b91@codeaurora.org>
X-Sender: pintu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021-03-01 17:43, Matthew Wilcox wrote:
> On Mon, Mar 01, 2021 at 04:19:26PM +0530, Pintu Kumar wrote:
>> +EXPORT_SYMBOL_GPL(clear_all_vm_events);
> 
> What module uses this function?

oh sorry, I will remove the EXPORT
Thanks for the review.


Regards,
Pintu
