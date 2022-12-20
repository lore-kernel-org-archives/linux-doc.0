Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3021EC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 20 Dec 2022 08:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbiLTINi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Dec 2022 03:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiLTINh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Dec 2022 03:13:37 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90516557
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 00:13:36 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id a14so8008838pfa.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 00:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1EQymdtjlCoxL9r8aLyN1oCsrvmTzwqgwp3gEtwRyVw=;
        b=Xe3YOjIJ98z7Xp3xQZ51pH4ZYd9VohE13ROPjTeMfWv7bZ2Oxk4mWDaAOp7TBFO11T
         NKxxLXb0Lazp7dIgDbkNbq16g+xVQDePifOjVWNiXh7MMXr89QUt7wlVRpA2qaf/SNH5
         os4PN1XWuS+NUqWXgq20K6EbgSy3ewIr8oiMERRfwUZKz5qdfoH845SFtUJ5U4eq+Cv3
         Zn2hhMgKojX2/rcJx5i+By63/RxbzWNj0r85h9JsrYvZB7tWsjZkf6ctMRNgtjukqpB/
         ozX039qbfi1R/iWtgeX4YQGHt0hbZkPINCG71n+XABlsSs2+wdVnQY+NECTrY6dNiYdD
         j0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1EQymdtjlCoxL9r8aLyN1oCsrvmTzwqgwp3gEtwRyVw=;
        b=hNvLSU02SOXAEWKiROaRMERiHVzO53SgF2P8VBVYmcIP/a+tgSWrLlrd6NNTipu2Y9
         yJxBTH4Aw5UMy6MF8nlwfg7ItDvzQS19SU5Uw/Zu6pF+v1M449+RnVEBxBm5jWCFWDh/
         Y/3dJ6An5kDrb+Dei87EpI7FKM2Km4fey4ORKHPdWPS52CG81IMcLsjku5i90SRkU5X0
         eWeM0APNUXXBpu6fUgifUUx4WT1MB1bL8oTyRMb15H/vR9z40mg6uLk4NB+ccYYRuMYJ
         odppxRIoMEia2ticXmFfM/xOdD9V/D6Xn1xEheFhIAscRpd1RBsfdNNXSxdJuZ2EqvB3
         FpSA==
X-Gm-Message-State: ANoB5pnNqKGiQBFNQ3Dx3zAwoX1FIcM05SA52B3c8Ex8jsp4hxLHAnWs
        kLlpCtHo6jhT1+e/bHdW1t4=
X-Google-Smtp-Source: AA0mqf6gHZiq0X90g0az8TINtNqoiR+40u6usSs3QUdKrGEFfE7vGCLkbGNUw+bGW0x3zxWFz93O9A==
X-Received: by 2002:a62:584:0:b0:574:251b:c5fe with SMTP id 126-20020a620584000000b00574251bc5femr36820179pff.20.1671524016398;
        Tue, 20 Dec 2022 00:13:36 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-8.three.co.id. [180.214.233.8])
        by smtp.gmail.com with ESMTPSA id 12-20020a62150c000000b00574f83c5d51sm7951935pfv.198.2022.12.20.00.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 00:13:35 -0800 (PST)
Message-ID: <97a75127-ece8-7dbc-77a9-04d91a952a27@gmail.com>
Date:   Tue, 20 Dec 2022 15:13:31 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org, corbet@lwn.net, cohuck@redhat.com,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me>
 <87v8oqsq6k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
 <20221219011647-mutt-send-email-mst@kernel.org>
 <2c6e9afa-d162-3835-0b8f-633ae924af7e@gmail.com>
 <20221219055347-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221219055347-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/19/22 17:53, Michael S. Tsirkin wrote:
> Here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/log/?h=linux-next
> 

OK, fetched. Thanks.

-- 
An old man doll... just what I always wanted! - Clara

