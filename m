Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C9A6C7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 Oct 2019 06:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729889AbfJHGPZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 Oct 2019 02:15:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46339 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbfJHGPZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Oct 2019 02:15:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id o18so17798827wrv.13
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2019 23:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E71giQmMij00dVZC1MhajR7ZkRCMhyeEhHHekrYHzJo=;
        b=e6B88wfiaQtJEuGtwLFB2tp0DVFW7RKkM9KtSuOw3IUwN5tbCGQUZqOpRgWdrdMytw
         02KEDRLZWYQCJBbf9SAxYvBMiTjb4ktnqWEqK/FtHHJO2VtvWoTxJ2JLVTgJUp546nc8
         Z6B7tlotl/P4XNsDSHq11NKHRspsUuwGwOro2pZXJYCtYrJ1MdSKYRwUlImCzOEtPefk
         J1s8mVNHj4EhOwh/jQQjmdw30UfJbi8qBVY/W2BHXf3JPXDwCPq3gmm8EmTNdZiT0iQN
         xdfIfYamgHXcmYsVg0ZnLgThiaHPu8KKtpgZn0cgCN76Wu0Js2IkORzU7uwkPPhHEtQ2
         bvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E71giQmMij00dVZC1MhajR7ZkRCMhyeEhHHekrYHzJo=;
        b=rPDAMuFHBDXPjDyZRja4CjZM68Mggg2ZRwL41rcmvwnmX5gGwXYWvpsERSWki0pkHR
         sMIzMAJsAuodj9Aetl94KnPcNxKaLOROqRFdZxl79r6gUd+1jp+yzkdKNnhGonKzqBLI
         p3dA4fY0s2Gzry1ena9BkdefVb6hx2O7vGDWPoExe8PtNNEmBZkl9Z+PBqygWfbquaDq
         EPm62bV32RfrJzAABsE3X8UJ1ZqcVB2yxXaxL/sCOR63+2UeM3pHA1J0Yjr6NANOKwJk
         rb30LfL94M66SW3dNySiuNr63NFXZ1zmGxxC5zCcSCA05P4j0R9SF1JTby++wk/0CVpa
         miyw==
X-Gm-Message-State: APjAAAVFHBjjRzJXOMhUZhKdFp2GtTWS+Fn0BzgsbEZ7VKm/oHwad90v
        8TAN+jaPbTXa++h56Qs1B4e+QA==
X-Google-Smtp-Source: APXvYqzonXSfQ3IqovyLtUkcieMOHhIx076yuyqJl6GycLQeI3fTH5SSWCjKL4p7JInVnQ0wY+gAMA==
X-Received: by 2002:a5d:6052:: with SMTP id j18mr15168796wrt.40.1570515322804;
        Mon, 07 Oct 2019 23:15:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id t83sm3247995wmt.18.2019.10.07.23.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 23:15:22 -0700 (PDT)
Date:   Tue, 8 Oct 2019 07:15:21 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jessica Yu <jeyu@kernel.org>,
        Adam Zerella <adam.zerella@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: move namespaces.rst from kbuild/ to core-api/
Message-ID: <20191008061521.GD23938@google.com>
References: <20191008031009.17364-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191008031009.17364-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 08, 2019 at 12:10:09PM +0900, Masahiro Yamada wrote:
>We discussed a better location for this file, and agreed that
>core-api/ is a good fit. Rename it to symbol-namespaces.rst
>for disambiguation, and also add it to index.rst and MAINTAINERS.

Acked-by: Matthias Maennich <maennich@google.com>

Thank you!

Cheers,
Matthias
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> Documentation/core-api/index.rst                                 | 1 +
> .../{kbuild/namespaces.rst => core-api/symbol-namespaces.rst}    | 0
> MAINTAINERS                                                      | 1 +
> 3 files changed, 2 insertions(+)
> rename Documentation/{kbuild/namespaces.rst => core-api/symbol-namespaces.rst} (100%)
>
>diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
>index fa16a0538dcb..ab0eae1c153a 100644
>--- a/Documentation/core-api/index.rst
>+++ b/Documentation/core-api/index.rst
>@@ -38,6 +38,7 @@ Core utilities
>    protection-keys
>    ../RCU/index
>    gcc-plugins
>+   symbol-namespaces
>
>
> Interfaces for kernel debugging
>diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
>similarity index 100%
>rename from Documentation/kbuild/namespaces.rst
>rename to Documentation/core-api/symbol-namespaces.rst
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 55199ef7fa74..a0ca64057b0d 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -11547,6 +11547,7 @@ NSDEPS
> M:	Matthias Maennich <maennich@google.com>
> S:	Maintained
> F:	scripts/nsdeps
>+F:	Documentation/core-api/symbol-namespaces.rst
>
> NTB AMD DRIVER
> M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>-- 
>2.17.1
>
