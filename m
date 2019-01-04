Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 98AE47D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 21:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfADVxI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 16:53:08 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46546 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfADVxI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 16:53:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id v15-v6so33562096ljh.13
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 13:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/9Ago5C9GkcJzrX7l5Z9UbwLuhkKz8KiGZL09qBbgo=;
        b=gNfnMVnrGkuhBxedA0A1zxrefEmBH/t857lUT0wZnDU5Ezeb864O5WJQ8Y26n8gFnB
         xpzkrVqLzCbeZMPFCLsf41rOdpi4aaxSND1SzsXy9Dc+Yg+0ZX154ohs82+2vhVI1YOE
         5E+c4+3jZUXxZOhHwFZD3GT50UZdJoQxLj3hWboTzQSMj9LXHQmH1xavhSEyJYRx+CpY
         JhfYiz9qz+o7mnavJ67/Zbysb/b9cFjGcI7mNAStRDUjuJtHvH/QS9qcBMD9l+L6qiQO
         /HBkPmGOyYqJVi0Rca0vbWSMQpd3h2W+82l3wQtv+1uRbQAL2v8ugNd3mVC1FOsRu+I2
         giag==
X-Gm-Message-State: AA+aEWbMZrH1lYF+Q09LqC74ehKCBPQ5XBpXiHRIz5PBljJIESWnDxF6
        M8FZSdpnSboLRlJ1MzuWpqXTfac3UrlihTLAgsWFc/EqfM5yNQ==
X-Google-Smtp-Source: ALg8bN4Vw0IEsBVNXu60QqtnotLmuCvMKAgy3jImC0hB7Mrg1IcExUf5JRnfrJRigxPPMxAiGDyudZ/10U0tY2Pk/MI=
X-Received: by 2002:a2e:9f0b:: with SMTP id u11-v6mr25333201ljk.99.1546638785841;
 Fri, 04 Jan 2019 13:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20190104212856.28366-1-mcroce@redhat.com>
In-Reply-To: <20190104212856.28366-1-mcroce@redhat.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Fri, 4 Jan 2019 22:52:28 +0100
Message-ID: <CAGnkfhwi=TA0m5gCku0OA_+hKR5hJkP5ruYbaHkKDWm7b3BUxQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] documentation: fix typo
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 4, 2019 at 10:28 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Fix spelling mistake: "lenght" -> "length"
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>
> ---
>  Documentation/devicetree/bindings/usb/s3c2410-usb.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Hi,

this patch was pulled from a 12 patches series and sent alone, please
discard the "01/12" in the subject

--
Matteo Croce
per aspera ad upstream
