Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47A9EB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 07:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjFUHfs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 03:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjFUHfq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 03:35:46 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FFB10D2
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 00:35:42 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bcde2b13fe2so5632556276.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 00:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687332941; x=1689924941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QfPg8biobSiO4Iw8BSLMVhvdMva8krThBt2O+usO4aw=;
        b=bX77UtcA2nyb7j8whZhnYOCqstBL1nGhc4uwGxHF1NUqfR+71Jp0La6xgkEBq5TTkX
         xYQn/j0rEKxHoSk0OAAclqTz6/9tAb8n7gQ0mkMSQB+UD3ffZ8/xF69cdn/3+43ru/HZ
         xno+7e4v7wx0IAUutj5OVe3swkF08MTuyGLfzEGB0ZCPOB1+OVYoAJh7HvbWMzUhqbUI
         X8YDoSEVMYNmZoXSBZwnW+iEwPDFHWOlncGuMtFMxsgIMKHTTW4BsnBGjFGxV4ZEfmZo
         HXdGSdRPVI0MUm+oX7CUaqPiFqEVDmhINA+UPTENrXptLLukvICxTjpYNehBh3wivVg5
         ZbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332941; x=1689924941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfPg8biobSiO4Iw8BSLMVhvdMva8krThBt2O+usO4aw=;
        b=krpnVwo08+zKhX9yckWYOmjtx6lyo6DodCKm9qvKNncQ2bV1Km3ncCsTYa9Z3rovRl
         T25E6mXnH8rvNjgefAmb4v6qkr+GJIYHz/+tE4DmAObE4X83x6keINalGGx3dSaHTNmH
         JBd3ociWFnH/ON5RwwlgwXZsyCPQRWyVezImNRBho66UfkUYw/i/5lXDWWbmlFRq102k
         UvPTtkUMMDaO+0ivoITmVbGK40wlWLYIb6tNhnDrU195suXRrbtzD0P45L6kXg8+Q3br
         KhVTBjz1lIJnDnn6ECm9NgBFPAR8wRFyVGMAMq/icVEON2HvcVOhB04n6KpHSRZ73Rz+
         fFaQ==
X-Gm-Message-State: AC+VfDzFg7jWiHIkcKLoGvfbp/YAFnt7WkX2WuzAAnMMgRfeNieX+gia
        VO0HVKS5d3CApJUAYdC1rhOfCKJbPmxIpe2c++rm2mTapnWxux3zdmg=
X-Google-Smtp-Source: ACHHUZ6/TpAjJ1YSlx9kqjVyr3aBvRrTgkhV+H+sEMm5j+MWQR15Cr9/6KSslbDq3HRSvGWtiAzPR7ndZ0XVvpqO740=
X-Received: by 2002:a0d:d303:0:b0:565:e657:debe with SMTP id
 v3-20020a0dd303000000b00565e657debemr14293624ywd.23.1687332941625; Wed, 21
 Jun 2023 00:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230614072548.996940-1-linus.walleij@linaro.org>
 <3045029.CbtlEUcBR6@suse> <CACRpkdaDLuryeFwq0tKzDUoyWagRf_w7BfhOuC8K-o-mhk2g_g@mail.gmail.com>
 <13291493.dW097sEU6C@suse>
In-Reply-To: <13291493.dW097sEU6C@suse>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Jun 2023 09:35:29 +0200
Message-ID: <CACRpkdbGfVvFtTA_tcSsmj_1t6aiwPfzYp07UC1NSfSMBVYE+A@mail.gmail.com>
Subject: Re: [PATCH v5] Documentation/mm: Initial page table documentation
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Fabio!

thanks for your reply!

The ways of technical documentation are never easy, but what
we are using right now is the socratic method, dialogue at its best,
which is pretty much the best way I know.

WRT the problem of education:
In gloomy days I have been referring to something I tongue-in-cheek
call "the second software crisis" (not any established term)
so in contrast with the first software crisis which was about the
complexity of software development outgrowing hardware
development, the second software crisis is due to software
developers losing contact and knowledge of hardware, with big
white spots on their mental map so that is part of what I am
trying to fix here.

Best regards,
Linus Walleij
