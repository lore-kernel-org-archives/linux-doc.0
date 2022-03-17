Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B7BC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 16:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236317AbiCQQFO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 12:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236316AbiCQQFO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 12:05:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D4E87DFD5D
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647533035;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pjpbf4xeM/d+LM74P4hgb4mVXuo4YOMoiMQxJouuPr4=;
        b=X0ChvJjlhVjqxMhjFT7LcHOMwfBGTky/v3uA1YaNuMJZtwxRmKAx4jivP/xiAJTPaeO6kk
        q0kplx0YrRSA1Cpg7TMew1OAh4bKu4P4zVF/gFeOoV7I9mCYLgY6Vt/nMKG0ulAUOgblvU
        F6AAFImM0qCfN8poK/a8nJuMzIeSFMo=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-vlz3KMyNN6CPoHLk4868JQ-1; Thu, 17 Mar 2022 12:03:54 -0400
X-MC-Unique: vlz3KMyNN6CPoHLk4868JQ-1
Received: by mail-io1-f71.google.com with SMTP id q137-20020a6b8e8f000000b006495204b061so1042002iod.14
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 09:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=pjpbf4xeM/d+LM74P4hgb4mVXuo4YOMoiMQxJouuPr4=;
        b=yCVoASVQg8S2HQ0K6ZWMFpdbmJd5YAnwJG2FJBfaiH8SxP5+dGOsXWdFh9PBpjEPWA
         wvvIegUiWXDByQn8Cgcf2eAhmV3CNBx2TxY+9mt1TF4ezSi1xE7ZiGsN41jA0BsZ8/F/
         iI4zy9tpYSRcvtECGdGkoJsReKHZNIjcJ7BUWUyMsj4XbDoTMk2gG2bS/M2U4mwNCdf/
         jEQyzdgnWJEc3LCqH0QkdU28JVrs7rxOYlsjoyS1gFg+2dWi61d063+LMtfz/7kV7oF3
         lwYRZpZBg68HXG+TELy3jsWXLKCQfGzJMxgdCx9lUlfeFNqmGleOGnfd3bir0DO3e11t
         tjiw==
X-Gm-Message-State: AOAM530MosomZwD6yf8OnTQ8ZQitv6+DUAnN5gd6cURgeztuZTGpmcnS
        2l/AnaFtua2esxQp0GcGxbXQ8qNWFi+EwRdEXV1EcX3J7fIJmdz6HcheiLzkONKmyRP3iYXlk3l
        rqjKkb7kZHOImrUhvTWsV
X-Received: by 2002:a92:3609:0:b0:2c6:3595:2a25 with SMTP id d9-20020a923609000000b002c635952a25mr2567385ila.233.1647533033509;
        Thu, 17 Mar 2022 09:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3aHgYME/n6/Qs0XoLrfeBnvVUU0JQGkqMW+0T1bGE3wtNnjJnVWb0pfCfy3PJe1ny3h/xrA==
X-Received: by 2002:a92:3609:0:b0:2c6:3595:2a25 with SMTP id d9-20020a923609000000b002c635952a25mr2567374ila.233.1647533033326;
        Thu, 17 Mar 2022 09:03:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id k4-20020a5e9304000000b00640dfe71dc8sm2873858iom.46.2022.03.17.09.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 09:03:53 -0700 (PDT)
Date:   Thu, 17 Mar 2022 10:03:51 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     alex.williamson@redhat.com, kvm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jgg@nvidia.com,
        shameerali.kolothum.thodi@huawei.com, kevin.tian@intel.com,
        yishaih@nvidia.com, linux-doc@vger.kernel.org, corbet@lwn.net,
        hch@infradead.org
Subject: Re: [PATCH v4] vfio-pci: Provide reviewers and acceptance criteria
 for variant drivers
Message-ID: <20220317100351.344e699a.alex.williamson@redhat.com>
In-Reply-To: <164736509088.181560.2887686123582116702.stgit@omen>
References: <164736509088.181560.2887686123582116702.stgit@omen>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Mar 2022 11:29:57 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> Device specific extensions for devices exposed to userspace through
> the vfio-pci-core library open both new functionality and new risks.
> Here we attempt to provided formalized requirements and expectations
> to ensure that future drivers both collaborate in their interaction
> with existing host drivers, as well as receive additional reviews
> from community members with experience in this area.
> 
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Yishai Hadas <yishaih@nvidia.com>
> Acked-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
...> 
>  Documentation/driver-api/index.rst                 |    1 +
>  .../vfio-pci-device-specific-driver-acceptance.rst |   35 ++++++++++++++++++++
>  .../maintainer/maintainer-entry-profile.rst        |    1 +
>  MAINTAINERS                                        |   10 ++++++
>  4 files changed, 47 insertions(+)
>  create mode 100644 Documentation/driver-api/vfio-pci-device-specific-driver-acceptance.rst

Applied to vfio next branch for v5.18 with Jason and Connie's sign-offs.
Thanks,

Alex

