Return-Path: <SRS0=Z3a9=6L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F69C55199
	for <linux-doc@archiver.kernel.org>; Mon, 27 Apr 2020 07:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DD90206B6
	for <linux-doc@archiver.kernel.org>; Mon, 27 Apr 2020 07:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="ULGukOzH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgD0HHQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Apr 2020 03:07:16 -0400
Received: from mx.kolabnow.com ([95.128.36.40]:4584 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbgD0HHQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 Apr 2020 03:07:16 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTP id 0C83F40410;
        Mon, 27 Apr 2020 09:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1587971232; x=1589785633; bh=KOul0JhjsNsr5gVqZ2Ua7WlRGFklfSdIDR9
        jODchJFE=; b=ULGukOzHhDCV80cEhmCx+XSBPQkI/Ml0WDCtm0lbBdb02mUlE8O
        OR0rLJszpKkrBT7Lye5wPBf7ni7ZPUL4HPzN3CFBOPpaMrSBNBNEMiGLRjHkA6IX
        UOHsa+LkQa74thf4sLaVctZXv4zQxur/xPNCxCUJXsvkgzLFlcfjBG+dJv8MQy+z
        DX2FGRAMYzBHjSLY1qc/cJOnMfkTvRnZusqAmA8m9Ppg+7bHhjuV7gvSPsnGpoRr
        10mvkNDLgFCE05iaiB38Y24yhNQWihhO4kDD3nxPOenUOo4pHpI3CBILlFN3Qk4v
        MIeRPeJ1B9vA1Zojb5P+tu+ACOHsNaJFYwTCnNVmg5BVn/x9Djby5SMrv+P5Vyhf
        w8FRo8yx2Vsr7Jy/i8B0TAQ3niQ8331O5zPrr0bax00bTSlvbRu2fX6FcixmPQNO
        0AmiOzt6ACllU2vRk1IRFR6jDlheUBYbZhZ4jXDO4zp2stChL0wE5d/Lnj5U/PFc
        Uq5PvYbFJyC+jL9vHBWnXxSQgemrgHkbhHe/amLpTX4gwtTNAwlPpQF7CsEUAn3d
        23hndfjDt/XOiiB+r/CCpX60+UKC6jLgUifaKrk89x2SLmOS5OsTsGifB1t7nx2N
        cYVFl1MpzukL90vZJjIWzyj+ZfPQ9RFtXdzzmOzwLZPZF9MFKwBCe6oc=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TOWl0PSb2oEO; Mon, 27 Apr 2020 09:07:12 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 81C7340381;
        Mon, 27 Apr 2020 09:07:12 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 2C72D30B0;
        Mon, 27 Apr 2020 09:07:12 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [INFO] Documentation/RCU ReST format
Date:   Mon, 27 Apr 2020 09:07:10 +0200
Message-ID: <2030968.IMgURSL4OB@harkonnen>
In-Reply-To: <918903f9-2cfc-b368-98a1-d81337d7fdf5@infradead.org>
References: <2106522.Q2ZRUUiV7S@harkonnen> <918903f9-2cfc-b368-98a1-d81337d7fdf5@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks I missed that

On Monday, April 27, 2020 12:36:01 AM CEST Randy Dunlap wrote:
> On 4/26/20 3:23 PM, Federico Vaga wrote:
> > Hi,
> > 
> > is there a reason for not converting the .txt files in Documentation/RCU?
> 
> Mauro sent this patch series last week for RCU.
> 
> https://lore.kernel.org/linux-doc/20200421175818.GS17661@paulmck-ThinkPad-P7
> 2/T/#m711283ef658e4c2c5acd4dcca0279f3532211cd6




