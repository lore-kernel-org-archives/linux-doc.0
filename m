Return-Path: <SRS0=nUK8=5W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767E9C2BA1E
	for <linux-doc@archiver.kernel.org>; Mon,  6 Apr 2020 18:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57F56206B8
	for <linux-doc@archiver.kernel.org>; Mon,  6 Apr 2020 18:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgDFSpL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Apr 2020 14:45:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44240 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgDFSpK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Apr 2020 14:45:10 -0400
Received: from mail-lf1-f70.google.com ([209.85.167.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1jLWk8-0006QO-MY
        for linux-doc@vger.kernel.org; Mon, 06 Apr 2020 18:45:08 +0000
Received: by mail-lf1-f70.google.com with SMTP id j9so1739246lfh.22
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2020 11:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=35u7sIzL2v+ZtiB13vYxkmAljAmMWY1VBaJPchGChPU=;
        b=lIw2d1dEY+DL6qrXrZcrNxqzh7SBB8I2E8OyB0NPgLgIexcEfR0xiDFrKCj+YG5fqO
         flrv2JvfPtZastdOJkRanBpoKxiKBjjeYOYldJLZMs6FH/tZyvceA9KCqHrznvkNdM7G
         dz4djay9bsRqoE5j5IqUI2imxHouPO5mOWRfbNpOJH/S/uMkVIeCoIkIdYvae1/3Dibj
         bPVs7AreZ1TfRng5wNzh1A7gPXaihcySL0FSTq1KbiGvcrklFuoxcdvskud+198zvxLb
         JONu7As0RZ1M8u2n9D+iIkQii0/bX1UEI8d9WKe36v+DArH0OC3cbwEZULSBZ8cckgSB
         q64w==
X-Gm-Message-State: AGi0PuadpJqcYtyTMI+LqhGqmcL1cWSnv9aG2ggPUciWYsJuLqHBruwb
        bBtXi+/qaFDNAGXRDnFpQ7hLDdmBiDrmHrkaLihlHrsEJ9QVa7DqfULYNpNqGo9zRsWFmT5nWN0
        JorvgfzwczqODiCN04ya+C7SpfoFYT8aiC1OCBu+pxa7oZLOmWmxcZQ==
X-Received: by 2002:a2e:85c6:: with SMTP id h6mr388506ljj.218.1586198707579;
        Mon, 06 Apr 2020 11:45:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypIfgUD0+Npj1fpuxcNsRprQ6GCvlWvrh7CigDE9Ba3M6ZRRFnD0WowMDyU8FhSHaePkKFsdLtJmDNIULbInyv4=
X-Received: by 2002:a2e:85c6:: with SMTP id h6mr388490ljj.218.1586198707394;
 Mon, 06 Apr 2020 11:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200327223646.20779-1-gpiccoli@canonical.com>
 <d4888de4-5748-a1d0-4a45-d1ecebe6f2a9@canonical.com> <202004060854.22F15BDBF1@keescook>
 <CAHD1Q_xwR4OqsF8n3VJXknZ5QgpLWPQ3YTuztTgn0GTMR0vgKA@mail.gmail.com> <202004061136.8029EF3@keescook>
In-Reply-To: <202004061136.8029EF3@keescook>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Mon, 6 Apr 2020 15:44:31 -0300
Message-ID: <CAHD1Q_y_qzn7=skyDiFnU0cKNMEjiiNSeyK-jqy8qmEdzUKmpg@mail.gmail.com>
Subject: Re: [PATCH V3] kernel/hung_task.c: Introduce sysctl to print all
 traces when a hung task is detected
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        mcgrof@kernel.org, Iurii Zaikin <yzaikin@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vlastimil Babka <vbabka@suse.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Awesome, no problem at all. And thanks for all the information and review =)
