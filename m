Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A68E7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Fri, 24 Aug 2018 11:52:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbeHXP0d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 24 Aug 2018 11:26:33 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:4972 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727043AbeHXP0d (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 24 Aug 2018 11:26:33 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id A4BF7205;
        Fri, 24 Aug 2018 13:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :reply-to:from:from:received:received:received; s=dkim20160331;
         t=1535111532; x=1536925933; bh=Miiq9ZhIo5Q77jAK7MEI7y0MLBK37x4f
        gpSQ6eY6YVA=; b=dE/ifOyZKIof8NXmNtL8Yej1xS2qEIRhYq5enBOUV/dITCj2
        2mUDU88YbyVAgwH+VhmhcL1AjmvNjDZs6JKxkQDJA3KDgjd7ZOFV0n15Nqe/WWhO
        GhMi+ZO/lMNgBqriT3sDjFidE0N7xAE4qM4wTHO9xkTs41gHCZfE1zW8r4ED6iQF
        ynp1ancRKdWDr6aQ2C0kF/ctXBMlBGjB+YK2OK9Du3HvhJox/ieK/6RxWQX/bRg5
        1tE0w5Rd/jHenihzUG6NtQROtQZHSxc6pQB4RXBsH/Ui/i4SFwmK9o/3qWuIrixj
        GUf8k3eXC3U+4K+CtDeaOPVFql7YhyO6ITB/UUTLyMe+wbH06UdUfprprD/Av9L4
        EGz/eJjIOguCk06OgM3bdJm+Zd8IDDlQ8bZafFc6PmbZfSI+OECYPNytqQ3jGe4x
        qTIbE1dIxlid2RuzL3xwiGSJAbRdIk0hml7r4LlVbUAFdWiLXf5JJyyZn/OIzdXC
        2b1WX+q9SS3oUqI5BKYb1plB1zAtNPgmsHvrbGjy+UUIj9ua8Zm3kWDFbcjS0254
        Kt12S9cfQNApNx6nE1Y2YRJPXF99BaasF+IK2rHWBZxImDF9vFWkzgQtLdZOT3VN
        Vtzp3boWYeZelMa1ZKWlwiHP1VYAuEr1DoqBMtJjoa7sDafGj4pAdNmET5A=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BSNbM-ft-m20; Fri, 24 Aug 2018 13:52:12 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 773371D0;
        Fri, 24 Aug 2018 13:52:12 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 35A9B138;
        Fri, 24 Aug 2018 13:52:12 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Reply-To: Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     amantegazza@vaga.pv.it, linux-doc@vger.kernel.org
Subject: Re: Italian translations and broken links
Date:   Fri, 24 Aug 2018 13:52:10 +0200
Message-ID: <1597989.Xf6Rdde8CB@pcbe13614>
In-Reply-To: <3898461.lmkq0IsokZ@pcbe13614>
References: <3898461.lmkq0IsokZ@pcbe13614>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Answer to this email address, I did a mistake :)

On Friday, August 24, 2018 1:51:18 PM CEST Federico Vaga wrote:
> Hi Jon,
> 
> just one question about how do you prefer us to proceed. We are translating
> the process directory.
> My idea was to complete it and then push it. This because the documents in
> here have links to other documents in the same directory. In order to
> cleanly build it I wanted to translate the full directory and then propose
> a patch.
> 
> Since there are many documents, this take time and perhaps we can already
> push the ones which are ready.
> 
> My big dilemma is (which is more general): what about broken references? Do
> we keep broken links which we know they will be correct in the future? Or,
> do we remove all broken links and we add them back only when they work (if
> we remember)?
> 
> Thanks :)




