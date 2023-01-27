Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50790C54EAA
	for <linux-doc@archiver.kernel.org>; Fri, 27 Jan 2023 17:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjA0RqP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Jan 2023 12:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234436AbjA0RqP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 12:46:15 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FDF7D99F;
        Fri, 27 Jan 2023 09:46:11 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-50e7a0f0cc8so14727657b3.2;
        Fri, 27 Jan 2023 09:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uUu2KO9bEKoTKPVOPQNCA+OUNOYtt2vrrIeIXcxAbgQ=;
        b=gI8l6+ZUQrnG03kH+WEMNzXsrKTH/1v2bBhRIsTUGk7Pr5tACVsMOOvS6IzYFspMgU
         LjFyX6++l3ptne8adH/plO/4tks1jBSlOu601JqQzLnmr6r7/XYRCkfsmmQCcYfd+d5C
         ezcMwTTx8jpDdreJPWvwBmRPgE3qEERkoYLauYVTK5NDAfiY2QBMjQfeLJqGbdU6/0fk
         c69xE9+JHpCMmJPkgQck0/UfmwRv0Etdw5oL7+138cBgVYwxmAuMnfO6ZpGZp8tjHTpK
         aESscc04YKKSTAVbGDC7/ADid/SIy7i7+MEYDObgMmPLDshGNJGS8VXv3jv+rZMyv3Em
         LvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUu2KO9bEKoTKPVOPQNCA+OUNOYtt2vrrIeIXcxAbgQ=;
        b=KYjZGki10tZ0KBfCdJd71ePo0na3LV40gb/RwEhsVKjqUd3pQrZBNO33kTla/UrAXK
         zEDxqte9FG52sCWajOy+7kEAo3QOr9YqQoQKIX8b6XO3n/jkhzDUPwll1JEgnoeMLPLw
         pTECjmjdmDYcLefnLQaT+VS4r0ugoAdtEnXjsCyMJvWvQDKM11y2tZ5mGcvHfPCcNTlg
         rlVKOOCNEh/PWZlEx7EoP3KMCt/ufQZEn4ZnOPmGVsqPVOda9dVuzhaYB6MXKOmyvfHC
         4LgKnEvc+Tvdo6G1V08oz2KB9Jcq8Gu/eqP81dO9bWgRH9FwDsF0GDv9IUHYrn95EO/D
         Ub1g==
X-Gm-Message-State: AFqh2kpQaEbDBcr/8JzpoCZ8bQ2iaI/h3f1BFQy/6dbnVKG2czHTBNDp
        Dr4ysZRlxNyWCkNYt2zXzVt6K3l4o792gghRqPk=
X-Google-Smtp-Source: AMrXdXsU7ChWpHDOvJIzoG4Oou90rg/wfs/TrCukzz6kM7fEPhmVAa/3AftlVd3IETy2sYZSboRCMqku2bP0EYiCewU=
X-Received: by 2002:a0d:d086:0:b0:4fa:78d8:efbf with SMTP id
 s128-20020a0dd086000000b004fa78d8efbfmr4314739ywd.247.1674841571239; Fri, 27
 Jan 2023 09:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20230127064005.1558-1-rdunlap@infradead.org> <20230127064005.1558-36-rdunlap@infradead.org>
In-Reply-To: <20230127064005.1558-36-rdunlap@infradead.org>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Fri, 27 Jan 2023 09:45:59 -0800
Message-ID: <CAMo8BfJCe_tj9PVotJYL7G6vLX9a0h0BcpLTNRO6qRFj8mu1sw@mail.gmail.com>
Subject: Re: [PATCH 35/35] Documentation: xtensa: correct spelling
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Chris Zankel <chris@zankel.net>,
        linux-xtensa@linux-xtensa.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 26, 2023 at 10:40 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Correct spelling problems for Documentation/xtensa/ as reported
> by codespell.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/xtensa/atomctl.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
