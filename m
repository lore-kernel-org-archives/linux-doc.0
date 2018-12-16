Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4EA967D089
	for <lwn-linux-doc@archive.lwn.net>; Sun, 16 Dec 2018 19:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730758AbeLPThf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 16 Dec 2018 14:37:35 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46236 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730746AbeLPThf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Dec 2018 14:37:35 -0500
Received: by mail-lf1-f67.google.com with SMTP id f23so7860215lfc.13
        for <linux-doc@vger.kernel.org>; Sun, 16 Dec 2018 11:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rhaHyVhc63MzSY3yf2QAnmgzLKrW87+qU0wix3hm9f0=;
        b=Deb/anuvet0KUnP1M84Olye3QqbZdP758tOHfAhXxvHnBYl+yOjd00ejqoeO7D0sa/
         m30wXMg5JEJ1O9/ANwXKZNH8uDiD3kpInAhIG1C3IqIwE4VT4bxCHfTJGWk9at9CcW5p
         qc3ToOJ58WyaVvT5JDFJnpbPxDEsP0OJPiorI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rhaHyVhc63MzSY3yf2QAnmgzLKrW87+qU0wix3hm9f0=;
        b=RpZeVihaltWLmvH3nWJQNYRdJ83P9i3SleiEteyT4wV8xepNaPvN2IeWM+/9B+0CX8
         Jx3DL8Oklqb/F1VUQoK6GO784NVxmVqzSSi+nLpbIgriGPu6+J17tYv7xp8mCKlZm8oT
         Bu4R1sJuWFc/GoypF28L5GDEjgvw5wY6iwLgYFdM4sLa6TNwWfVcL2KsblZdt63L3T+O
         LACWTh1XHFx4RGLYI15B5H4H9yz0NiHd+AChbzsmuQNWs4xyXIqZDsQqq7UC0Oe7ADGH
         xmyFjioAKdAos7I/e0PAPY+Urb25sCUGSOVqZRPAtzhy2jmj6q5WlwBSX2u/tGxgaQEr
         w6Eg==
X-Gm-Message-State: AA+aEWYRQBN1tl8x6pN2X5pvrlyYYsQEjSegqRNdLx1gK6UqBnSiZn2l
        Un+yWIF690yMUNLEBjSjFbH5pPMQNF0=
X-Google-Smtp-Source: AFSGD/WnIRaZYWITR63mfTqV1CksXZ++p4Ld2MsJcXJ2DrjTJ6FAVJjfHDfu8D32Y33Ykuae+09oEA==
X-Received: by 2002:a19:d486:: with SMTP id l128mr5506650lfg.114.1544989053074;
        Sun, 16 Dec 2018 11:37:33 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id q30sm2224292lfi.94.2018.12.16.11.37.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Dec 2018 11:37:32 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id l15-v6so9092577lja.9
        for <linux-doc@vger.kernel.org>; Sun, 16 Dec 2018 11:37:31 -0800 (PST)
X-Received: by 2002:a2e:9983:: with SMTP id w3-v6mr6413154lji.133.1544989051486;
 Sun, 16 Dec 2018 11:37:31 -0800 (PST)
MIME-Version: 1.0
References: <1544824384-17668-1-git-send-email-longman@redhat.com>
In-Reply-To: <1544824384-17668-1-git-send-email-longman@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 16 Dec 2018 11:37:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi-V7LjAAzFuxg+eLQAdp+Ay4WmVJdTNxgPjqKXaj-3Xw@mail.gmail.com>
Message-ID: <CAHk-=wi-V7LjAAzFuxg+eLQAdp+Ay4WmVJdTNxgPjqKXaj-3Xw@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 0/3] fs/dcache: Track # of negative dentries
To:     Waiman Long <longman@redhat.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-mm@kvack.org, linux-doc@vger.kernel.org, mcgrof@kernel.org,
        Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@kernel.org>, mszeredi@redhat.com,
        Matthew Wilcox <willy@infradead.org>, lwoodman@redhat.com,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        wangkai86@huawei.com, Michal Hocko <mhocko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 14, 2018 at 1:53 PM Waiman Long <longman@redhat.com> wrote:
>
> This patchset addresses 2 issues found in the dentry code and adds a
> new nr_dentry_negative per-cpu counter to track the total number of
> negative dentries in all the LRU lists.

The series looks sane to me. I'm assuming I'll get it either though
-mm or from Al..

            Linus
