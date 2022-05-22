Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA67C433F5
	for <linux-doc@archiver.kernel.org>; Sun, 22 May 2022 00:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbiEVA6L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 May 2022 20:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbiEVA6L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 May 2022 20:58:11 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102B43981F
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 17:57:54 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id u15so10676450pfi.3
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 17:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VQk3iHJz5YzBOwbJjjMdVBcGwhylgMc6KxZSUtV2HhM=;
        b=RL9vEdRI10zeD9tpKZSen51zZf5gp50J0Li6VExFsC2/3ebQaRbetYRdsJDHjXi+ex
         cVQrPilTRoERO2nkLZMvKllEozvkswglCUz2lY5PvHZuvqoJCPMZZ078zSHqbzCaH255
         IHWFP7dZPuQudMCIxZd7PDvoO9Vn+lAJ9dW4TubQBtHxUe/UWHYwMfYMxtCvuPVrwcvv
         LUBQ9QF8TTJ1hAQ1aSo7FQxFH6iFRGd66IZBD6u62J45EZrWSR6jYrcV8XnEIYRr3Zs4
         JDRtARtOvz3c5rjK74eGykFPdI62L0Se0hahWQSpkL3bb4w+zJlu42iIaRyQWZ6HROkv
         K0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VQk3iHJz5YzBOwbJjjMdVBcGwhylgMc6KxZSUtV2HhM=;
        b=Muce9bIRq5dJyyOkgrj0VBcR60y0bMZAxQFUTb72TJFAmEBdavBDc3eSEXfjGWCBQ4
         XbTpRMMLl2KXzqwT6iCH41j9fQtAoAm1qAM/t04EBd6Z7TduuZXxcO1RcqsdrJRbNxSP
         s2fW8f8R174RCLjd2NPOs6a6tE1aUqNUjdo2DxDudKP5dnqIFpUw6sqd3WnMZJpbwb2n
         OOlbQMcLerSG5lqk5BK5H4KS+kZJzcb1tEEZICoddSPXCJibYL5UVgIhdeMW5qBoqGLm
         zz0sEwtPIfthkrGx1M6BfxrMuxhOiaPv7bCxNHn73F074OCcCh+ED7D6nWhOrO+U2K+R
         2i7Q==
X-Gm-Message-State: AOAM5323kOGAcGVYC0XuG9ifJO9UZnkWKEL34r9sf+2fVhKvdw+JTq9c
        sANNkkgLXYEJJZj8IoKrJuy1gjYDqf0=
X-Google-Smtp-Source: ABdhPJymHypptV0fqcP2FxXHTlHHvUwiwLbwhZhw7SZrWlZpEvINuaBjZbKEtB/B+aUQRMxjnGtxDA==
X-Received: by 2002:a63:581:0:b0:3f2:6b21:4733 with SMTP id 123-20020a630581000000b003f26b214733mr14654902pgf.90.1653181073535;
        Sat, 21 May 2022 17:57:53 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902768200b0015e8d4eb2cdsm2164375pll.279.2022.05.21.17.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 17:57:52 -0700 (PDT)
Message-ID: <6476f6e7-0fc9-a55a-cafc-7b2fc31f6d51@gmail.com>
Date:   Sun, 22 May 2022 09:57:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: "WARNING: Duplicate C declaration" from recent Sphinx (was Re:
 [PATCH] docs: sphinx/requirements: Limit jinja2<3.1)
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net> <20220330022534.10ac0a50@coco.lan>
 <ed2690db-84ae-5c85-f65d-e08021f5f562@gmail.com>
 <20220330190724.1596e01a@coco.lan>
 <edf80179-4776-773d-0c4a-e75a1824bfba@gmail.com>
 <564cbd05-8788-9223-1ecc-59e7fc41b46a@gmail.com>
 <20220521114629.6ee9fc06@coco.lan>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220521114629.6ee9fc06@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 21 May 2022 11:46:29 +0200,
Mauro Carvalho Chehab wrote:
[...]
> 
> Sphinx 4.0 and above: it is now possible to add a namespace. This allows
> fixing things like read() system calls that have different meanings on
> different subsystems.
> 
> On other words, only with Sphinx 4.0 and above, the cross-references
> for C domain symbols should all be OK.

So, I noticed there is a PR at https://github.com/sphinx-doc/sphinx/pull/8313
which is still open.

This PR is supposed to resolve "WARNING: Duplicate C declaration"
due to struct and function with the same name, isn't it?

Are you sure the issue is resolved in Sphinx 4.0 and later?

        Thanks, Akira

