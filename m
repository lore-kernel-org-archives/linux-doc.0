Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C80C6FD1C
	for <linux-doc@archiver.kernel.org>; Mon, 13 Mar 2023 03:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjCMDFb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 12 Mar 2023 23:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjCMDFR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Mar 2023 23:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46901A4AE
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 20:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678676673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AQANVrvaj9/B2WSrHSzaItV2LmCoP7qwGr+9zKi06ow=;
        b=Ss/jhcn3qWPpcxYmqzgzaoYjnbq8HhXtlLbI9G7K3oV2uzv4qKVZwiLwip6+W9jO/0bryx
        SSRUK9qB9Hdt49/b+Iwn31haN3jFLZy751aycCZPP//eNMRVLtRSkRP+NL8kuIJI1YonKy
        JZpdKWxtncu6DTtjHzR7MQnskZuRbo0=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-yGi9CtCqNmOyfOmsOywiiw-1; Sun, 12 Mar 2023 23:04:31 -0400
X-MC-Unique: yGi9CtCqNmOyfOmsOywiiw-1
Received: by mail-ua1-f72.google.com with SMTP id q72-20020a9f37ce000000b0074555fb6330so2288794uaq.15
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 20:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678676671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQANVrvaj9/B2WSrHSzaItV2LmCoP7qwGr+9zKi06ow=;
        b=a5cxq5ygdOGz9x1GI433A/sHtU21PyFb12C00rGkpClv3nxuYJRUcCGzIgZ95wQxkC
         tpUfjTHTnPXdjKmKWjZS0y+5o/+FNoOdgubBLgSWpQ4t4/J6JC2aczjJTXRyXqQUX60b
         Cc7aEWarutqNRNU31T6yViq6VL1y7MTc1Jfw5LqcYAr/xgL8ogE0KtUoZkvaZhCPL+z2
         3Tz7Nk9h/67Z6VH4ZAkaKRj6Waj2kNQATpXkNifvqDhzzPjmnhiacuxsj/HdgfKxPxMY
         kFC4FE7PBjtnTcy33pkR3l33DiVbapCfpTH3SDuFF2xb7dejuPPVuf4axzHzg8n0k/nr
         eviQ==
X-Gm-Message-State: AO0yUKWJPiJ147UYcHxbdN+uxS5mQvatGKUTRHg45A5vKQJh8f9FggU2
        hB283ETpkbdsYfkDtVHH1RkCQXmby4XxDytQ+SeNSZ3MlUQ8o/z2qSy8VRyNEHwlZot3fKIu02k
        KnHa0rKv88HNjJtZkOJOSnWxEkMzXiSL47lVM
X-Received: by 2002:a1f:4b01:0:b0:401:8898:ea44 with SMTP id y1-20020a1f4b01000000b004018898ea44mr18555385vka.3.1678676671153;
        Sun, 12 Mar 2023 20:04:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set83d8dKkzLeJ9M1ow+hnonqiyLfMHFAS+UySCvJj8sJK2fNKWzzVwX2uSVj8vcnI9W5BAG2+1uG1juFgoNFqic=
X-Received: by 2002:a1f:4b01:0:b0:401:8898:ea44 with SMTP id
 y1-20020a1f4b01000000b004018898ea44mr18555374vka.3.1678676670837; Sun, 12 Mar
 2023 20:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230310201525.2615385-1-eblake@redhat.com> <20230310201525.2615385-2-eblake@redhat.com>
In-Reply-To: <20230310201525.2615385-2-eblake@redhat.com>
From:   Ming Lei <ming.lei@redhat.com>
Date:   Mon, 13 Mar 2023 11:04:19 +0800
Message-ID: <CAFj5m9JmwYn9BTYEWWFykC_20rDVXfENKRbD2A=G=DmM4ni1-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] uapi nbd: improve doc links to userspace spec
To:     Eric Blake <eblake@redhat.com>
Cc:     josef@toxicpanda.com, linux-block@vger.kernel.org,
        nbd@other.debian.org, philipp.reisner@linbit.com,
        lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Mar 11, 2023 at 4:17=E2=80=AFAM Eric Blake <eblake@redhat.com> wrot=
e:
>
> The uapi <linux/nbd.h> header intentionally documents only the NBD
> server features that the kernel module will utilize as a client.  But
> while it already had one mention of skipped bits due to userspace
> extensions, it did not actually direct the reader to the canonical
> source to learn about those extensions.
>
> While touching comments, fix an outdated reference that listed only
> READ and WRITE as commands.
>
> The documentation file also had a stale link to sourceforge; nbd
> ditched that several years ago in favor of github.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

