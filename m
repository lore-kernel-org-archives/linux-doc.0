Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5228EC04A94
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 08:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbjHNIYh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 04:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbjHNIYZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 04:24:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BF719A3
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 01:24:01 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3159d5e409dso2972221f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1692001423; x=1692606223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMhlr43d/Qp9tXUHH7fu45zclcsuiyst2c7+t2VJMps=;
        b=a/PVHvQcUZ0aoWATIrNy26CLPt3DLdNG3dcT9Z463ZHwD9+yQmZ3OE6XaXIM3YIUlT
         Nxh0Z3Fr+I8HfM5snfwWlEIm/kELk1ovElwKgoW+Bmqt1VpXFN29Fi/ds5AR0PEcdfGR
         jM1fsxXH+T6sLMF5gk5nZA/wHZHanp1f25QfKBmZ8yYGYpG0p9Y7Ws/4BFSOL2mVevua
         vr5g0auft0uJAboYZFzMOWaS+MGnYcn3SdXp94d+2E6FgIfk2Q50x2I2ZL41Atk6mOx9
         k0SMyP6uabW0jwVWt5YRTRH2LlSbXW9n1WUtT5SFrhrMHdreoP1QAsI7fG1YdadKEYC1
         7vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692001423; x=1692606223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMhlr43d/Qp9tXUHH7fu45zclcsuiyst2c7+t2VJMps=;
        b=LSrKlWCf8pcKxxb5N69GJBnDaL/dwVJIlGCQHuVLCT3E1xzzWvj+F75h0srSq9dDqD
         WbsgLbZBMdDGyy3HORd9u65n+BZoHBB8KNyBEasZCzKd+qKYm35KUqjV6YnQfMUZn8IM
         oxCP4ilstl/TcfNnSBnkkuInK7aMPfgd/ftgeqC8DBIgsGI2xQpwDwrs01ef4TW8eRL/
         IeFRJAZ1vDrP1XZoOb4+Pk5Wpw9Sc9RLm7OkDlvbPUHCtV8FaRVB+aMu5zvQKOe4KmSQ
         OJVkcrDK85QZHKcUY5H+F9GbDnfOiDFu1pu0154s3n5Ub20iaYjmFscSAuea7GMAy5tX
         L/tw==
X-Gm-Message-State: AOJu0Yz24a00g/jPPvXYC/4ihrIm9IdMD4SqTNNc2cf9puCD23Lh76F4
        U1BjP4A4laEmYeq43EZ2Rc63iRVEa5tn+E5U+Ys=
X-Google-Smtp-Source: AGHT+IFKoFLLI6EyfZXMV14ggl2qpQfX7S60ysCHOUNV2TqVyX8HDQKThNqS1iZuyX//HsuaL1bmmw==
X-Received: by 2002:a5d:5390:0:b0:319:55d8:5d51 with SMTP id d16-20020a5d5390000000b0031955d85d51mr8289906wrv.30.1692001423167;
        Mon, 14 Aug 2023 01:23:43 -0700 (PDT)
Received: from snaipe-arista.aristanetworks.com ([2a01:e0a:267:60d0:1a56:80ff:fe33:cdc7])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d6b09000000b0031759e6b43fsm13716583wrw.39.2023.08.14.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:23:42 -0700 (PDT)
From:   Snaipe <snaipe@arista.com>
To:     hughd@google.com
Cc:     ovt@google.com, corbet@lwn.net, akpm@linux-foundation.org,
        brauner@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Snaipe <snaipe@arista.com>
Subject: Re: [PATCH] shmem: add support for user extended attributes
Date:   Mon, 14 Aug 2023 10:23:39 +0200
Message-ID: <20230814082339.2006418-1-snaipe@arista.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <9b8d38f0-fd22-3f98-d070-16baf976ecb5@google.com>
References: <9b8d38f0-fd22-3f98-d070-16baf976ecb5@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Your sending this patch does help to raise the priority for my
> sending that patch: thank you; but I cannot promise when that will be.

Hey Hugh,

Just as an additional data point, if it helps with priority :)

The lack of support of user xattrs on tmpfs our last remaining blocker for
using unprivileged overlayfs mounts that use a tmpfs for the upper dir & work
dir. Not that it isn't possible to use unprivileged overlayfs mounts in general,
but not having this option means that use-cases for discardable upper layer
changes are harder to clean up correctly when not on an tmpfs mount whose
lifetime is bound to a mount namespace.

I don't think there's any rush; we can live with rmdir failing with EIO for now,
but it'd be great to see this fixed rather than having to implement expensive
cleanup routines that have to remove the upper+work dirs recursively with
CAP_DAC_OVERRIDE.

Cheers,

-- 
Snaipe
