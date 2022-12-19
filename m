Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B5AC10F1B
	for <linux-doc@archiver.kernel.org>; Mon, 19 Dec 2022 10:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbiLSKzE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Dec 2022 05:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiLSKyv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Dec 2022 05:54:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D7F24D
        for <linux-doc@vger.kernel.org>; Mon, 19 Dec 2022 02:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671447244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4Imi5FC0W/XbmzN8grqrA4Ol4u2Qy0loJjbLQN73juI=;
        b=Wty6e5D3SCOp0byzt13erDEERZE8ITWUTOT5XR/Vv7p6sXAIcqywjDCOYmtH+2jsFUVQQB
        CfZjC5WWtDa91QwKn6+ohvAv4CEWJgbICEWkwqYiSO9oMnNzg5kqUmMcC8WwZv6xOJte+S
        3JXc5aU3wbvvGdLUgzQVPOC6EFwaFg4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-sh7zNb-_PiWw-g-5JRjatA-1; Mon, 19 Dec 2022 05:54:01 -0500
X-MC-Unique: sh7zNb-_PiWw-g-5JRjatA-1
Received: by mail-qk1-f197.google.com with SMTP id bm30-20020a05620a199e00b006ff813575b1so7033795qkb.16
        for <linux-doc@vger.kernel.org>; Mon, 19 Dec 2022 02:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Imi5FC0W/XbmzN8grqrA4Ol4u2Qy0loJjbLQN73juI=;
        b=yNW9D2uzkVChFK/WWvzdWd1kKG9VUxeSiUvwEyOjxgeKGi7hazSXgPdjLm44DKC/J4
         4ocSWAzeUVVPdKH2d2dbQXL6OQ9sGM6ZPLXYm86b6bMMk0Gm3hoIJTNdskZyOuNkHLWF
         6ImPiHmwpq32KPY5p3xliCSNMo3x0cLuBf9DuDqsOJAk+DZYFKfcVDWb9tjjk/RMnfUc
         bqHmOGWwIRHziGgO74/UFe0REai6BhTboWMXgFANxfC+jfsxSJ//dbNTKdAFrQ2cR8ll
         /j/Tnsm5kNU8QA9vMmEgY2Q6BiQ0sqMRbwb/RFELFSOxjCTilB+FsWu7Chm5PGOyNp1U
         3ZXA==
X-Gm-Message-State: ANoB5pkpiUMXeHq+hoU0r5iD/UZqUQdfNAtnQO8vR9eoOWeH1i3Ltszs
        RJGYwoQWkEEVZvkV9oLDjmXuodN6EKrLC+DnHd0HZq2cWOjj82PbUPuXhWxn49Sfw2Pgog9pmON
        1jHgNoRTJTgeWh+Q/NjSA
X-Received: by 2002:a05:622a:4892:b0:3a6:8a50:b0ce with SMTP id fc18-20020a05622a489200b003a68a50b0cemr65550586qtb.45.1671447240695;
        Mon, 19 Dec 2022 02:54:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YwmDLlT/UzEDpwaDhnaCwbhcpgiN5ZDlP6ShyWxPIs1qJtENH5qo8kIuUPWHaLgIDUTN2Fw==
X-Received: by 2002:a05:622a:4892:b0:3a6:8a50:b0ce with SMTP id fc18-20020a05622a489200b003a68a50b0cemr65550572qtb.45.1671447240469;
        Mon, 19 Dec 2022 02:54:00 -0800 (PST)
Received: from redhat.com ([45.144.113.29])
        by smtp.gmail.com with ESMTPSA id f11-20020a05620a408b00b006f9ddaaf01esm1909733qko.102.2022.12.19.02.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 02:54:00 -0800 (PST)
Date:   Mon, 19 Dec 2022 05:53:54 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= 
        <ricardo.canuelo@collabora.com>, linux-doc@vger.kernel.org,
        corbet@lwn.net, cohuck@redhat.com,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
Message-ID: <20221219055347-mutt-send-email-mst@kernel.org>
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me>
 <87v8oqsq6k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
 <20221219011647-mutt-send-email-mst@kernel.org>
 <2c6e9afa-d162-3835-0b8f-633ae924af7e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c6e9afa-d162-3835-0b8f-633ae924af7e@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 19, 2022 at 03:38:11PM +0700, Bagas Sanjaya wrote:
> On 12/19/22 13:20, Michael S. Tsirkin wrote:
> > I think I agree with this comment.  This seems minor enough so I applied
> > the patch for now. Bagas would you like to post your suggestion as a patch on
> > top? Would be appreciated. Thanks!
> > 
> 
> I don't see the patch applied on your tree [1], or applied to where? Or
> even forget to push?
> 
> Thanks.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/

Here:

https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/log/?h=linux-next

> -- 
> An old man doll... just what I always wanted! - Clara

