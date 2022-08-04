Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F52C19F29
	for <linux-doc@archiver.kernel.org>; Thu,  4 Aug 2022 02:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbiHDCqR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 22:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbiHDCqQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 22:46:16 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C1B1EC48
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 19:46:16 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so4119302pjf.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Aug 2022 19:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=hGKRP8UNqcFPNg5a90gkDBGnc7uWYMhavYlP8ulyk5g=;
        b=DCwqhPxH3RcRKSAKMhtQd3g0vdiM14pKukNoEg32wWOGKj81X6nfx+CvOZeobM/z/f
         pUUUI//JaLmrtGUdJxA6L6OYd7kvw4dGbJKdzt/O+U72c8Q3KNeKgMTHMS74b296gk0S
         rJMbheJ329y1Qy82CI+E01OYRa3x4pE1y5zWaaeVMW4pmt7JbxjU5PwNOBdZ1J8bLghl
         6SdRY7VZjYwZPYqKfpm0Zcbtidq5K/Xy7CB8vEPzsp1Mn69kyUo/1iv5bC/6JCy7Wgoh
         G1LZLTw23hAiyu5m1DL98jnfS/lUCKmRWyMJI3tS2Z/DWivL9p7dpY9MBTQx5qVy0Vip
         tesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=hGKRP8UNqcFPNg5a90gkDBGnc7uWYMhavYlP8ulyk5g=;
        b=2Y5aIFjtzSfKLS1/OvUNBchOe87oPmseoz2dgwp3gH4Ke3eL1qzcxj3NpLHEQ72qfy
         0s251ZgGWZjnCqNbabN4zhtuiOqZJHS4JpYu1im14NyBpDVNnH2zZRot5Mnjefch0oAz
         m7ay7+4EWweZesHQ3Q7cHJYtwiyOXTuftVa8H8lVdOH7D0ciKSY6Jum7RH27L/cgn/US
         mQugUKyTwho9qSxFjiNJkp8oC1VQzkNJGbHXIIgroOZpwAyDF8fCRu7qx9ZNuU/bhbcH
         B4sZ8XgxDrPxhEmfypvh6st3ScdEnOQv5FrUAwL216hwcE+x8xaPZbNqNxFdCboovozQ
         eX0w==
X-Gm-Message-State: ACgBeo0wQNNJjZOko+rC45W8uKcx2rEHoMOHMfaO4nQCHQzi7gncv2Oq
        ODA25TiGQeXt1QrRIm/WIty/jAMIwJw=
X-Google-Smtp-Source: AA6agR6gyvBgMJmAWJ8IQRXSSeh6NIpBbMSqiRTQgrAPAia0Zzsqo/Zc0EMg9DQoTQejRWduA3QT0w==
X-Received: by 2002:a17:902:780e:b0:16d:ae4a:eed3 with SMTP id p14-20020a170902780e00b0016dae4aeed3mr29315829pll.129.1659581175405;
        Wed, 03 Aug 2022 19:46:15 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-2.three.co.id. [180.214.233.2])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902bd4300b0016e8178aa9csm2639935plx.210.2022.08.03.19.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 19:46:14 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 1123210381F; Thu,  4 Aug 2022 09:46:10 +0700 (WIB)
Date:   Thu, 4 Aug 2022 09:46:10 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
Message-ID: <Yusy8hX02IsYPEbr@debian.me>
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 02, 2022 at 02:42:22PM +0200, Ricardo Cañuelo wrote:
> Basic doc about Virtio on Linux and a short tutorial on Virtio drivers.
> Minor fixes to existing virtio kerneldocs.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

The documentation (htmldocs) with this patch builds successfully without
new warnings.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
