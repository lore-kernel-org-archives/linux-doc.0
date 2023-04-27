Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A9CC77B73
	for <linux-doc@archiver.kernel.org>; Thu, 27 Apr 2023 14:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243276AbjD0OjY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Apr 2023 10:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244130AbjD0OjW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Apr 2023 10:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84450423E
        for <linux-doc@vger.kernel.org>; Thu, 27 Apr 2023 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682606316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n38a/ap8JEojwB1X8Ga+6cVJFz2FjJPXkJ9o2gq99yI=;
        b=iRRmQzwt2MClDW8xZP4tMfLyXzO1MuZGmU5/AT4D+zAA568N6kMy+DSN9AOgwX4BHuP7Tz
        +9zHPh9aZVCsj98TL400ex6yz0mBDvI4FilkMAzZs0ttbmujFTcRDojIrWrPG0leLmf3KD
        AF+aJjbQ8HpK/FUnvK8U0LLlZVwpSB0=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-jbWBZQekMvytWMmjWuSVFQ-1; Thu, 27 Apr 2023 10:38:33 -0400
X-MC-Unique: jbWBZQekMvytWMmjWuSVFQ-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5464cf41fbdso5727229eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Apr 2023 07:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682606312; x=1685198312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n38a/ap8JEojwB1X8Ga+6cVJFz2FjJPXkJ9o2gq99yI=;
        b=LgInPgYsNhzJdj+zaiLN0mbsx718/k7hAf53TUTdLpxx6pbt9Rd5b3hFrwks58fB65
         RFsz9jyS078UHFFDAPisLOk5po/P8aYAQOS7TR9cylW6ZXViHY1l9rc0G9FTrZt9YFEh
         HX1In1YkUx8ySrOBO8auNUE0OX3RkULUfjeUap8lW9LidP2VW9SnYWeT3zl3wXKCpSNM
         cVLG9v2z0k284+lwbqJiucgUkoEVXObaWLGnMvTLBqudGjbSnXYcwEHPvUz3qBqwv0kH
         aTaHY7Z1HrgnrGSI1vch9EtkY+IJgkIINwwFoBrGGH7aBZuJ/WFB/sC/6Rr57EZ6bfpD
         zxLw==
X-Gm-Message-State: AC+VfDz6rd1bvV6goIVdkmG2QGcdyB5i1wPIQwQ+Vv1QLFBAMd//PKi3
        v4mzVj0dbDTezfTFreh5MCnwAAhXUH7sLxXA63eeluwKpxIlW9gknxXiSMYaJBraTYos/5aM+2e
        LP8VN41BtnaEEQ+xTWdv2YNtQKibh2KYgfaDv
X-Received: by 2002:a05:6820:502:b0:547:5593:d6 with SMTP id m2-20020a056820050200b00547559300d6mr1327449ooj.5.1682606311908;
        Thu, 27 Apr 2023 07:38:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5C8xnwX/1ZRGPFzQnse0x6PxyxWI9ZUENosmWDrP95UdVMWcVgBQdD9vv1aM8F2y4SEzeyrs/y39WXiyX3poY=
X-Received: by 2002:a05:6820:502:b0:547:5593:d6 with SMTP id
 m2-20020a056820050200b00547559300d6mr1327440ooj.5.1682606311705; Thu, 27 Apr
 2023 07:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230427101241.1273752-1-costa.shul@redhat.com>
 <87ildhfobe.fsf@meer.lwn.net> <CADDUTFwGHytziCux07cXO0eYDUXYh3Scp=Qm96N+1wAX3ELDeg@mail.gmail.com>
 <87a5ytflht.fsf@meer.lwn.net>
In-Reply-To: <87a5ytflht.fsf@meer.lwn.net>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Thu, 27 Apr 2023 17:38:20 +0300
Message-ID: <CADDUTFzkFmY9y=Yr5mbyGNF4mY4LOJyTe159UT+NhmTV8svsZQ@mail.gmail.com>
Subject: Re: [PATCH] docs: redirect from old arch to the new one
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> is there an actual problem needing to be solved here?

There is not an actual problem. Only a potential.

Thanks,
Costa

