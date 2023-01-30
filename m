Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACFDC54EED
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 16:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236058AbjA3QUe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236151AbjA3QUc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 11:20:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8C7A5FF
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 08:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675095584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dmuBGSidG6Nmq8f4XvQIj/jUDJBk2y6tQZ7DvgUNy9c=;
        b=CHtksrmrgs88cZF2kys1kS0mN9S5PA071dA8XqZuFIBaZ2X1TQLlqwlXHACR3JxQCOVpGj
        8/gnVfW9qGTa8YP/wNpUFPGdpbvfBGebJnKgfm5nO5iHFe6OnQY7P/yX7pd91jDq43lcz0
        3yCBQ5rCIjBIbfjEkA0kWdDWDk5YT6M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-DEhApBaDMHCSOB8Gy1IjMA-1; Mon, 30 Jan 2023 11:19:41 -0500
X-MC-Unique: DEhApBaDMHCSOB8Gy1IjMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3590382C96A;
        Mon, 30 Jan 2023 16:19:40 +0000 (UTC)
Received: from [10.18.17.153] (dhcp-17-153.bos.redhat.com [10.18.17.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6ACEF492B05;
        Mon, 30 Jan 2023 16:19:40 +0000 (UTC)
Message-ID: <a48ce53c-5510-b779-c42d-b2e7367a442e@redhat.com>
Date:   Mon, 30 Jan 2023 11:19:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] doc: locktorture fix
Content-Language: en-US
To:     Antonio Paolillo <antonio.paolillo@huawei.com>,
        peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        boqun.feng@gmail.com, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20230130125538.20359-1-antonio.paolillo@huawei.com>
From:   Waiman Long <longman@redhat.com>
In-Reply-To: <20230130125538.20359-1-antonio.paolillo@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 1/30/23 07:55, Antonio Paolillo wrote:
> The actual build option for rtmutex lock is `CONFIG_RT_MUTEXES`, not
> `CONFIG_RT_MUTEX`.
>
> Signed-off-by: Antonio Paolillo <antonio.paolillo@huawei.com>
> ---
>   Documentation/locking/locktorture.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/locking/locktorture.rst b/Documentation/locking/locktorture.rst
> index dfaf9fc883f4..3f7b44e2c070 100644
> --- a/Documentation/locking/locktorture.rst
> +++ b/Documentation/locking/locktorture.rst
> @@ -67,7 +67,7 @@ torture_type
>   
>   		     - "rtmutex_lock":
>   				rtmutex_lock() and rtmutex_unlock() pairs.
> -				Kernel must have CONFIG_RT_MUTEX=y.
> +				Kernel must have CONFIG_RT_MUTEXES=y.
>   
>   		     - "rwsem_lock":
>   				read/write down() and up() semaphore pairs.
Acked-by: Waiman Long <longman@redhat.com>

