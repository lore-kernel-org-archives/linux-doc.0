Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8CEC4727E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 16:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45C422076B
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 16:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbgI3Qse (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgI3Qse (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 12:48:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C817C061755;
        Wed, 30 Sep 2020 09:48:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 40CC129CD44
Subject: Re: [PATCH v4 38/52] docs: block: typec_bus.rst: get rid of :c:type
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Jens Axboe <axboe@kernel.dk>, Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
 <c54f21c6406b86099b537fdde1b0ab35b0ea770d.1601467849.git.mchehab+huawei@kernel.org>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <c6ee0141-f339-f8aa-d557-db8c1d2e37a5@collabora.com>
Date:   Wed, 30 Sep 2020 13:48:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c54f21c6406b86099b537fdde1b0ab35b0ea770d.1601467849.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/30/20 10:25 AM, Mauro Carvalho Chehab wrote:
> The :c:type macros are not used properly there, as reported
> by Sphinx 3:
> 
> 	./Documentation/block/blk-mq.rst:112: WARNING: Unparseable C cross-reference: 'hctx->dispatch'
> 	Invalid C declaration: Expected end of definition. [error at 4]
> 	  hctx->dispatch
> 	  ----^
> 
> Also, they won't be generating any cross references.
> 
> So, replace them by a literal markup.

Your commit message says "docs: block: typec_bus.rst: ...", but the name
of this file is "blk-mq.rst".

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

After solving the issue above:

Reviewed-by: André Almeida <andrealmeid@collabora.com>

> ---
>  Documentation/block/blk-mq.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/block/blk-mq.rst b/Documentation/block/blk-mq.rst
> index 86a632af02b0..a980d23af48c 100644
> --- a/Documentation/block/blk-mq.rst
> +++ b/Documentation/block/blk-mq.rst
> @@ -110,9 +110,9 @@ block layer removes requests from the associated software queues and tries to
>  dispatch to the hardware.
>  
>  If it's not possible to send the requests directly to hardware, they will be
> -added to a linked list (:c:type:`hctx->dispatch`) of requests. Then,
> +added to a linked list (``hctx->dispatch``) of requests. Then,
>  next time the block layer runs a queue, it will send the requests laying at the
> -:c:type:`dispatch` list first, to ensure a fairness dispatch with those
> +``dispatch`` list first, to ensure a fairness dispatch with those
>  requests that were ready to be sent first. The number of hardware queues
>  depends on the number of hardware contexts supported by the hardware and its
>  device driver, but it will not be more than the number of cores of the system.
> 

