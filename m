Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA504C7EE2F
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 13:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjE3NXD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 09:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjE3NXB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 09:23:01 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918C8B0
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 06:22:59 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6af6d8687faso3449289a34.3
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685452979; x=1688044979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MaKm3OkrYm3ffEnUF3bIEtKrMYvCJUWRE4ejQF6bOxM=;
        b=kE5ti0X/mrift+8Pf9KI2pGnO3Xw60WttWdj3ssey2ROTgCl2bG/e1Y8b1ZQHGjt3c
         Ks+Ek6ey5qwEyjBaxPenK7cHfsrC6bg44+eg9N3dOdV5yQzmLlq6FBhpTnQ6YHYc9G0h
         XFuPiDqBlhUldoZQ3GwUu7i5G0mHsqxtYEx0Jr6OV39FLZJpL04fd4HduismrxyxhLMT
         Pn7rIdeO6hQc5iEaEBSuST+M/3AdznuzNFI2AaKsJu5bZds1f2Z9msBoVLpAoOYO3iK2
         yQm/gukhtbAkftMgVZRC9orGD5y6H5eLTuBV3jr2TlIQ9Y1a4eGt7LmVkeDJMOENaq4i
         E5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452979; x=1688044979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaKm3OkrYm3ffEnUF3bIEtKrMYvCJUWRE4ejQF6bOxM=;
        b=LRiSykjpkDmd+NYChuwyPhqPCQTGNe9gvXF0FGxnuHpXZ6OFWgvc+f5k5yKeh0FpG7
         dKlsfbFO6x1SxOuoXN5KSR/nBl7h9+WAYOJb/6/wHJgpZlPSG2g3I41B6aGZUZ/xUsRA
         0N3ROMQkMqit6HLkCDshD4E7rFSlqqsOxXUvqaQxAmJToJmjsgUpxt7mpvyilJgenxu0
         /eYvmyZ9k7cS9pbDHjpsZLCU6uNRuYUX8uZnRGWWscXY4f/Dq477rdw8VNUt2VcjpgEa
         kDjjNc1XRm//hWbK7RV3bdE0QPDM3H6EWuQnnbEhbu4pQvTDP4DbKa3cQ5yy43AO2iwt
         Pjmg==
X-Gm-Message-State: AC+VfDwlsD5LrR9ielz/jHGvKLM5Ju+o7Dy+lR7DHAYtmbCLWTEJJwd8
        sBQ4C0DOOZN1bshtT9vA26H2yoHCVqf63UDdd16m7w==
X-Google-Smtp-Source: ACHHUZ67RbR3lr9W+CdbQTIvItTYn0BF1JkwzV5z5qMEIWe12DhLoZzVrl7NU81GngciN/LqEorqqTTtGAZA9zL2cc0=
X-Received: by 2002:a05:6830:1e6c:b0:69f:7b9b:473e with SMTP id
 m12-20020a0568301e6c00b0069f7b9b473emr909908otr.38.1685452978924; Tue, 30 May
 2023 06:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230526145519.2282062-1-vineeth@bitbyteword.org>
 <20230526172959.5440b9dd@nowhere> <CAO7JXPgLFgXANqXY7L-YLbijxJCOgUKmd8nUQizb62JorOXGhA@mail.gmail.com>
 <CAO7JXPit6snFM2oW-uSs-mtbmKr9wpbX2exqAUF0iAiaAO6hOg@mail.gmail.com>
 <CAO7JXPgf9ffVQ3n9iD8-1abuDSAZHWAZmz56BmM68uJZ7uy+Uw@mail.gmail.com> <e9ea284d-3a8b-b9ef-d179-b67628771bf4@redhat.com>
In-Reply-To: <e9ea284d-3a8b-b9ef-d179-b67628771bf4@redhat.com>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Tue, 30 May 2023 09:22:48 -0400
Message-ID: <CAO7JXPjn1AKMsngPi_LMPEhN0=+eV-L+HCM3SqC=fTcteQFZZQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] sched/deadline: Fix bandwidth reclaim equation in GRUB
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        youssefesmat@google.com,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, luca abeni <luca.abeni@santannapisa.it>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> On 5/26/23 18:15, Vineeth Remanan Pillai wrote:
> > I have just sent the fix as a reply to the initial patch. I shall send a
> > v5 if needed. Please let me know.
>
> Please, send a v5... so we avoid mixing up patches on testing.
>
Sure, Will send it soon..

Thanks,
Vineeth
