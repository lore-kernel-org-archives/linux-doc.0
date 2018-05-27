Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 440477D043
	for <lwn-linux-doc@archive.lwn.net>; Sun, 27 May 2018 14:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965484AbeE0O4b (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 27 May 2018 10:56:31 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:21872 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965011AbeE0O4a (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 27 May 2018 10:56:30 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTP id EB11E403BB;
        Sun, 27 May 2018 16:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:date:date:subject:subject:from:from:received:received
        :received; s=dkim20160331; t=1527432988; x=1529247389; bh=YyVYqL
        SvHeGhFMvffYbsfixWoiWhDuNi8ADutAmgpdY=; b=d9LH8Dpy05s5g5sH/kdySO
        +US7ZqzLn2Whw6PLEMaAciFqB5vsOm9o2E6X5gP+62pEDqfCg348ILt6pdTvtlhS
        prpZ9/XpG596TqN0/idBu2E3awijZj/kjIgkfFvAQk8/e9MctBOsuar/6vq/kRj7
        who2PcXAiVs8dyxiuClDItRYbsAv+f4vMPzlqXdl7qvCZXgiXSUKF8k6wVoZGn1E
        b7pAoK2h9nQimXTj9Z6pscq923TulKpJEV8gWaR9QrDYm/k+/ZJiGhboGrOxcUks
        bP0EzF3LTjzOzj049NDrQ2SkeZn3CiAfM0TPKkoTXeWYT5nhVmu2i87KkutsyGaB
        5mdUg1YNmNBsBplJZwcXEaLOyIqH+rpU+x9aCDwmmpJlFozqCpEJ0RsCO0zfeTV3
        tnLVbvD+9+rbQY4mcf10IsyuZ2o/mzcdV1A5ISC3zOmUPJiyLsltjP6KQwUsj7aI
        gGLZrNFRhZKXhipkZ5BpelVaG0qQeHrdYm7iQ2Xe2JobYj2/5QoCJGSZs4rbz2Gl
        5Jbg8Rj6IUFPkylH+u/L0OXJQUK+7jZw9LWpIdVgLIma0uGZDdi4AC7+ZWVyPSDr
        GFt4KJh3EOBYxvmdlC5UGRQ49yq3qwdoEeT7T4a6AOvooi6noD6enU3HMXR2V5VU
        mKyASozulXP7hFA3MhKpw=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sCdZGsOZ2RkC; Sun, 27 May 2018 16:56:28 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 456D940106;
        Sun, 27 May 2018 16:56:28 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id E9CAA2A3;
        Sun, 27 May 2018 16:56:27 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>
Subject: doc: Italian translation
Date:   Sun, 27 May 2018 16:55:55 +0200
Message-Id: <20180527145559.16411-1-federico.vaga@vaga.pv.it>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ciao Jonathan,

here the doc-guide translated in Italian. This set of patches includes
some minor changes to the main one. The idea of this first set of patches
is also to adjust the structure and our expectations.

We tried to translate everything in **Italian**; which means that we avoided
imported English words wherever there is the possibility to use the Italian
ones. Of course, this is not always possible, or worst doing the translation
make it less clear, for example the word "file".

Another point. I noticed that the disclaimer for other translations is
in English, so I did the same. But actually shouldn't be in Italian, since
that page will be read by Italian speakers?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
