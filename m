Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5EBF47D048
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 22:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752405AbeFEWto (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 18:49:44 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:60822 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752365AbeFEWtn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Jun 2018 18:49:43 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 95F75346;
        Wed,  6 Jun 2018 00:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:date:date:subject:subject:from:from:received:received
        :received; s=dkim20160331; t=1528238980; x=1530053381; bh=FPeEo9
        4nC9AQx3DX4xU8qsXkFaA291jKqQgezgoOCKQ=; b=BEFlA3LRoRCuR9m+HoKGs0
        C9Ix1P9+IJJFYqb6JuRVx84asppyUxm7u/ghAMKpJXlDwGitSRQ7o6x4SWB2g8rD
        ClLBBifDz4TS19iSj/oz5fejPebVNE4cDN11VwCwLByDTlyQ8uhkcFPi36cz4wHF
        odyUXx2bemBVdngEeooMImuOUpN+W6ztunMR881eA3+BmQie6DwcOjKynydDD2Yq
        1wxYOhLdONalx6C0EXL72kHW+7FDJquVVBCkBs+MS5ELcoFtxxUr8usBIf+3QlId
        R832hD7kT+LafCI0XEwRE7sj3QZTiMq+ctT6sGJbd8i6Uomm9nGDSOWAs86NrDbX
        bj008kL5wJQvnMdZtfHRYXne13UteEriym3qyHw83wp0xDX+SehjfaUPqk59hbuR
        fZ7EUATyCecKMptGnPFxp3FiBxC70/WsAz00g6N93wbA7J0dxJUIA2Rwf9A3EjGn
        XMCSsNZhOEtsk/PMSRlfkvtJXQxnX43UMYrxzgoWm4jQZIUqm36r1XymN9d9JlAH
        /29F3D2gohpvrvJYRxxe23eNAjRyabuf7NmjyihhP1XBzag9cVJjyFE7+TE6R/XO
        Pm1RHZSw+GpNZI+cWvf8zBvg7DBBXO4FbRNGMFqOPd8qROongxmNPpD0E9F8aAOE
        GwI5EnVaC+tAvykC54h/8=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1YvDkhWXISjR; Wed,  6 Jun 2018 00:49:40 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id 8CDAE1A0;
        Wed,  6 Jun 2018 00:49:40 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx003.mykolab.com (Postfix) with ESMTPS id 4838EAE6;
        Wed,  6 Jun 2018 00:49:40 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: doc: Italian translations
Date:   Wed,  6 Jun 2018 00:48:57 +0200
Message-Id: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ciao Jon,

here again the doc-guide translated in Italian and the Italian
skeleton. This set of patches is a bit different than the privious
one. Main differences:

- I moved out translations from the main index
- I fixed the Italian translation for the kernel-doc.rst file
  because I noticed that you restructured it and simplify
  (my fault I did not check it before)
- I added my self as MAINTAINER of the Italian translation effort

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
