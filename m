Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DC6687D048
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Jul 2018 22:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753707AbeGFWF6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Jul 2018 18:05:58 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:62222 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753688AbeGFWF5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Jul 2018 18:05:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id D07F55A2;
        Sat,  7 Jul 2018 00:05:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:date:date:subject:subject:from:from:received:received
        :received; s=dkim20160331; t=1530914754; x=1532729155; bh=gTQg2l
        viJDPNEkrU1AqH4Zs52eMXtWXvjmtXrKST9bw=; b=plFz+XmB1eh6+IWAS5r1So
        7Hvah3Z+BV4Al9pXKqmUBowYivCICiww/sCmBA+U4a9eVLxdrkXg8HeYHU5uLrUK
        UGOQYraZqtp7y4W8fx26hnixUUb+RjyQdOdfxLNTczRq6iPI/oUjt5Wv+Ox2HqVx
        IhuONpT2sV85maNEbx2y+7FH0tvLrON4bbwCiPivSe0sI5ElbMpqsdrV85tsETMK
        zmEZOLNgAEqBVbw19QAyabsag0TPk8C9VqXKCmD1QR27Rg/vOyp3HtSjuuGRY4d1
        Ostmy0TYt3lxTXNNXdHTMqkxeJCvYbgCrzpT06kpNm6Wrs16O6AuBLCvi9vJCQVl
        Lw4ELeWlov03qHLtCLiNShvG6v9NxvX8QNzPBZCru1nmd4I+EPfyh5vuiFrDrvVG
        uNCDsNzeF7HQCyD8AmmOyxV/KnlvN0GmqRB2+cOaAqHBHhKpiHDGU7L5U3LYPzxR
        qt8NmH83bfj2dTgGKN1G1wTfsCWfDxXudQRh7rJZ+JAh8WngK4B06iRen0UOW4Xw
        +cSnVDxH4MA4DSz6f93qE5F99KlWzZyfOgGDpGLABhj5Pwikv4gOSyPH82cFGLtc
        F/K6rB8wlCe9qmFQtHDtPHH2anrVAnmRStR4xYei0iaJVU7bVsdJKz8/XyBNEM+P
        z2uw6wMsHJg8R3FsSdoV8=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WkDMEQpGzl5L; Sat,  7 Jul 2018 00:05:54 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id C4778526;
        Sat,  7 Jul 2018 00:05:54 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 75719254F;
        Sat,  7 Jul 2018 00:05:54 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: doc:it_IT: kernel-hacking translation
Date:   Sat,  7 Jul 2018 00:05:15 +0200
Message-Id: <20180706220517.28623-1-federico.vaga@vaga.pv.it>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ciao Jon,

This small set of patches introduces the kernel-hacking translation in Italian
and fix the locking.rst internal links. I do not know if this is a problem
with **my** Sphinx environment but these links were not working.


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
