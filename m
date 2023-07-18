Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCE2EB64DA
	for <linux-doc@archiver.kernel.org>; Tue, 18 Jul 2023 15:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbjGRPhv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Jul 2023 11:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbjGRPhr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jul 2023 11:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1A992
        for <linux-doc@vger.kernel.org>; Tue, 18 Jul 2023 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689694629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WFSYW0DOGpPster+jaAtGmVXakx425pOilKzR4Mqu7g=;
        b=EfC//0cZ6cnEK0lBopJvUYkG1OGCDzVR49B2g/aeZidcf9UQIarX+GxtYFLdpgZheP8L4O
        QqUHZAPAN4hCjCuSfqiT7kQ9jrDyWP0z6uN74AuSiEiOTX293V2eo4BFVX68vSWM0Tum9A
        peCMwxRR4Fo8ynvvQ7xazwNEBT6nyAY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-_CRBcH1EMVyfIyJDqGykzw-1; Tue, 18 Jul 2023 11:37:07 -0400
X-MC-Unique: _CRBcH1EMVyfIyJDqGykzw-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-39a9590f9fdso8008963b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Jul 2023 08:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689694625; x=1692286625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFSYW0DOGpPster+jaAtGmVXakx425pOilKzR4Mqu7g=;
        b=R9b5RbPiC8qfwuAOnrP54B9tY7MgIpJVzG6HULjDRfsdcrG4zJgLdulvXYVo9yKrIl
         UWSMdPEPYJV5ZZk1IovWs6XMnTzeIDX8TXRBDL71QeO+tXb/6BFtSCkU/jFKjMJos8ND
         EmkroRRT3eHKhGZcqs6opvQ4ceIBQi1y9pG3N+VDs2TCsHTVxeYp8cLJUC0ONj60sZFl
         Wj+PwhBaTdJsyMT8LRVQITKNTOA8URbPr9wMACIMyoRnXd7tLgaCtiKC78SCD9mY38E0
         Q0iFWkA5a5pE6+1QvGu039Hew+NrnQQEk1MsuSeYIr8tzyhkqM7FUOoW4thzT0kp5emn
         fURA==
X-Gm-Message-State: ABy/qLYtza7Lmn1gEDDeiE9VknHRSrW9oIQpysbV9vYnnmyUxyZBRjhi
        qIQHCJsTTouJhtEH/F2FHCK61Gj3oakqziKXzF6p1iUMieMx12Rju1J1yvDh+H3r5WeSaKAhQ4z
        mAgDHeLWevZ5fAOrGwteO8AhBOlfHP60eqwdd
X-Received: by 2002:a05:6808:8dc:b0:3a4:2941:6c4e with SMTP id k28-20020a05680808dc00b003a429416c4emr8358187oij.14.1689694625694;
        Tue, 18 Jul 2023 08:37:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEf9mgh2Nt7cWxiKa+uMA40DWO59oOanYv0EqBNuG6J62s4TTbWO3ymUHzb1Pts2sn8rpd/wCp6KZ9iqWw7z9M=
X-Received: by 2002:a05:6808:8dc:b0:3a4:2941:6c4e with SMTP id
 k28-20020a05680808dc00b003a429416c4emr8358177oij.14.1689694625367; Tue, 18
 Jul 2023 08:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <CADDUTFyArtN--_27xLWpqnBM2e_udmL+E6Ka7KgimTUOguWthg@mail.gmail.com>
 <87ilaiwsyl.fsf@meer.lwn.net>
In-Reply-To: <87ilaiwsyl.fsf@meer.lwn.net>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Tue, 18 Jul 2023 18:36:54 +0300
Message-ID: <CADDUTFyYxh6+-+uhiVYXcPvS+1qQ6XYG_y4J5Q9uLwhcuZp_4A@mail.gmail.com>
Subject: Re: confusing changes in the documentation table of contents
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, kernelnewbies@kernelnewbies.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

> By "table of contents" you're talking about the left column?
Yes, on the left. Now it is named "Contents".

>  I agree it's still far from ideal.
Do you have any prototypes as examples or in mind?

Costa,
Thank you

