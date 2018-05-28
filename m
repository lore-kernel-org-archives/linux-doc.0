Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 49AC77DF8C
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 13:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1165337AbeE1NWH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 09:22:07 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:1982 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1165311AbeE1NWG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 28 May 2018 09:22:06 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 5B7181B0F;
        Mon, 28 May 2018 15:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1527513721; x=1529328122; bh=TXfz/SW/qhq1DkOvuPw3L3+OKz8uyXb/nbR
        KZvUuzw0=; b=mGQEnvanhvfdx3kAQlBz3wOlOnIhiLF4wcSwVumQETlpNDhRIVT
        DvyFORk8slMKULILyMnPjiMgf1Jt1hPr2ZmGOSL7Kpdjd9XnJr5zpaz6emCC1+R5
        MlMq5Me7T4XDtSWCQ6gRehT+k8S4mv5bwD4iMGZzV9c8jTKnpEtm9B1Id10b++o5
        y3wbDi8R9wEiB1YWZ0IJ6juduTjXzfYub+nUpXi8ot3ITxgIfDQXCNW4o1Eu4yeu
        UIcq8fETKsVdD7dwY1IoicyhCEE7Mv7jtAc7E0Lbivu0SnfiMIEI9oyRwsJHdj8E
        6WPzD6zUY/B64Ve6UoXtXB26C9zykK79aWDglBxnSSYsKFozgwkHmfXISBR4ALbl
        4VXFsU9gaRm7KFj0n/Z/b9FzreiIzznOcC+DvZub+a9h4voo8xk2i4TWJ5HNS9OF
        PqbkhVk4ayW93Mof2fDHp75V5OiumUWgknMStWw8SY1XGAgsnpIDOZQgO0iLJXHY
        TyHi+g/ZURljf+FGWN86sJGbSvzNzrMn7ZpierGdAFMNf10ZaBahpAyEdb3pimbU
        gLtXsdJZyuLGPTRfFsIFn9Aj7PeKVJHxm3VBycEhEt/tQpscOlcZWxvaC80LfDRp
        EWaElaIQ1B55ddmRThOYZ+8v7WxM6E4MsF5YPCky9xwUSaz05XMAH7ZI=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4edI4l8vJ08m; Mon, 28 May 2018 15:22:01 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id DCC20D01;
        Mon, 28 May 2018 15:22:01 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 7DAE51C71;
        Mon, 28 May 2018 15:22:01 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>
Subject: Re: doc: Italian translation
Date:   Mon, 28 May 2018 15:22:00 +0200
Message-ID: <4469233.YSvUztRfSp@pcbe13614>
In-Reply-To: <20180528070828.3a3c7287@lwn.net>
References: <20180527145559.16411-1-federico.vaga@vaga.pv.it> <20180528070828.3a3c7287@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday, 28 May 2018 15:08:28 CEST Jonathan Corbet wrote:
> On Sun, 27 May 2018 16:55:55 +0200
> 
> Federico Vaga <federico.vaga@vaga.pv.it> wrote:
> > here the doc-guide translated in Italian. This set of patches
> > includes some minor changes to the main one. The idea of this
> > first set of patches is also to adjust the structure and our
> > expectations.
> 
> I've only done a quick scan so far.  It looks reasonable, but I have
> a couple of requests:
> 
>  - Please include a proper changelog with each patch describing what
> the patch does and why.  Otherwise I'll have to fill them in, and
> that makes me grumpy...:)

Ok

>  - You might as well add a MAINTAINERS entry.  The other
> translations don't have them, but they should.

Ok

>  - For extra credit: it's time to move the translations out of the
>    top-level index into an index.rst in the translations directory. 
> Then the top-level file can have a single pointer to the
> translations.

I completely agree on this point. I can prepare a patch that does it.

> > We tried to translate everything in **Italian**; which means that
> > we avoided imported English words wherever there is the
> > possibility to use the Italian ones. Of course, this is not
> > always possible, or worst doing the translation make it less
> > clear, for example the word "file".
> 
> "We"?  Is there somebody else's work represented here too?  If so,
> they should appear in the signoff chain (or as a Co-developed-by
> credit).

I did, in patch 3/5 and 4/5 there is Alessia as "signed-off" (in CC 
here).

> > Another point. I noticed that the disclaimer for other
> > translations is in English, so I did the same. But actually
> > shouldn't be in Italian, since that page will be read by Italian
> > speakers?
> 
> Perhaps, though part of the idea is to give the English speakers,
> too, some vague clue of what they're looking at.

Make sense. I will keep it like this then.

Thanks

> 
> Thanks,
> 
> jon


-- 
Federico Vaga
http://www.federicovaga.it/


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
