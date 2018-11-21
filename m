Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 12C797D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Nov 2018 00:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbeKUKrv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Nov 2018 05:47:51 -0500
Received: from mx.kolabnow.com ([95.128.36.42]:2194 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726615AbeKUKrv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Nov 2018 05:47:51 -0500
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 5478B356;
        Wed, 21 Nov 2018 01:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1542759357; x=1544573758; bh=DEId5AHj2FCB+XFC/+dB9ESMSixO8tLTW9r
        Z/ff2x5M=; b=aHz5xcx8w80SCSOugKPtzBzzc33iBWvlyf+IXnecc4QZH9nBf74
        OQ98Ydzx/IAuIaYSmmYogIEIoKhn1s85aTiexfVq3AcJiq+eVDpUCp6UBScV1lH0
        nD8Of6eay8ZssN6oSnAAX5uxwVTJxA6J/DrjW6u5Qcyxbo8YlBbyBLrXyoAcULNo
        b894BSCO0o9gOFgc2cbpAWmtZ0TGeifG8yoCvQ/nI2CVn8OrWPPg2VqKscKHhYNQ
        eUJquUfB4v/A0LpTucfnwuh2tGS2ttj3ZAIcdMYSVfqcfOlGrbe7+9AyfBsBZ/Vz
        u1wVvNUt9vlwbZNspShJUOavB3nSog13gJjEhNHuaanI312O0fyF9vX+/jd4TjjP
        QGjjh/fdLXSA8r3HSlG//yUrBnR5N+NgHFYuIvJ4lUD66P+xaRj6V0Py/GxPK7NN
        C0MEb3VA/FDq4N6GP86Ql41JAeIPSemNfrF6XsjvkOLMO8fxNmgA+xHv90DQrLb3
        uOwE+BvWdLqHswJ3YYKPQ6iCdwr+vN7NDQqK2qnAM1MQJmAMwdM7h1y07rilnUKf
        zbSOKYOaWC5zeJUgFSxsl9py53twhqFFhuW2aOvOg2OwG6mIVund+wZZjr7yg1/t
        LH+UY9dMwc+c5jVf9y91qkArTKA0j8w4fYbsUw8ru247LWVRykHQsidI=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2276FHUAqDwa; Wed, 21 Nov 2018 01:15:57 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 66FD81AD;
        Wed, 21 Nov 2018 01:15:57 +0100 (CET)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id E7CFE28A;
        Wed, 21 Nov 2018 01:15:56 +0100 (CET)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] doc:process: add links where missing
Date:   Wed, 21 Nov 2018 01:15:55 +0100
Message-ID: <1946641.tM1jjfZjbW@harkonnen>
In-Reply-To: <20181121000445.7960-1-federico.vaga@vaga.pv.it>
References: <20181121000445.7960-1-federico.vaga@vaga.pv.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just one note. There is not any PATCH 2/2, right before sending it I realized 
that it was not correct and  I removed it but then I forgot to remove the 
enumeration from this patch.




