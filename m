Return-Path: <SRS0=kJSq=5I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4E0C54FCE
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 18:23:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 329222051A
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 18:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="FH2qRmBS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbgCWSXw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Mar 2020 14:23:52 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39568 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbgCWSXv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Mar 2020 14:23:51 -0400
Received: by mail-qt1-f194.google.com with SMTP id f20so12592844qtq.6
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2020 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F/E2v/x0pD9S4co1rTwzqU5wtimX1Afhqg2gi2bulTI=;
        b=FH2qRmBSbSJZwB+BSXSQMYNKeGdg7FKsSXSb1K9JlVNhBvCRpF35Y1/cWbC8uK2uBj
         sxGBJGFMVlcJsfQa8mZ95ubQaEtjdmQCqtEE3Q92O2nL8F41seejAlpR8I49wXqAeU/B
         eqkpUOGxjScSYfB1LTpqwq4PRjJgwkCS4B5OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F/E2v/x0pD9S4co1rTwzqU5wtimX1Afhqg2gi2bulTI=;
        b=BPUeu+yl9i9MH6TKvzSjGa/fxlg8ZEOkRMSynXMrSBH+Cy4IGEqQFLt3Y+swR6idwN
         80YiPwF0ntsII2nAex2dXVASVdK8M3q3wvlE4r3NQGkAK00s5Fc4WRWNzCZ71SAOjtJ5
         WSWKJsRU1hA7Tctid82yibuXvdCq9OcPfWxpFy9t4JOEhaqehQgINVT5IBa26fCaLor3
         kJAu0aqs6OHaD+HgIqB2WdnXD76FFjI4TatHW6vQw4Fkt6r/cVtvCgvncYEkFifgYo1k
         m9bWGKnm0dUMERmNyrNadxZCafFVFcZRmASDLMiGWjTGW8VA0m5DBR8OrdQmvzDNbntm
         BTLg==
X-Gm-Message-State: ANhLgQ0CCXnK+fIUCV+9VzQHWv3mhksvTZxnbA1RqsF3swbthnH+Gqjk
        4Jn+5FXH4QOgP1h5YJBdjASITQ==
X-Google-Smtp-Source: ADFU+vva33T81FQrImBGAaIoEJK5Y8QnH9XQzRThIpIuh9LK6narFxQkMI+JxtK3VLi/dxYocOD3FA==
X-Received: by 2002:ac8:140e:: with SMTP id k14mr22547629qtj.222.1584987830199;
        Mon, 23 Mar 2020 11:23:50 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id 85sm9774863qke.128.2020.03.23.11.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 11:23:49 -0700 (PDT)
Date:   Mon, 23 Mar 2020 14:23:49 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        Oleg Nesterov <oleg@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Documentation: Clarify better about the rwsem non-owner
 release issue
Message-ID: <20200323182349.GA203600@google.com>
References: <20200322021938.175736-1-joel@joelfernandes.org>
 <87a748khlo.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a748khlo.fsf@kamboji.qca.qualcomm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 22, 2020 at 08:51:15AM +0200, Kalle Valo wrote:
> "Joel Fernandes (Google)" <joel@joelfernandes.org> writes:
> 
> > Reword and clarify better about the rwsem non-owner release issue.
> >
> > Link: https://lore.kernel.org/linux-pci/20200321212144.GA6475@google.com/
> >
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> There's something wrong with your linux-pci and linux-usb addresses:
> 
> 	"linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
> 
> 
> 	"linux-usb@vger.kernel.org Kalle Valo" <kvalo@codeaurora.org>,

Not sure. It appears fine in the archive. Thomas, let me know if you wanted
me to resend the diff patch. Hopefully it squashed fine into your original
patch.

thanks,

 - Joel

