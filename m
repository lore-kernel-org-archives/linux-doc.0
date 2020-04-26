Return-Path: <SRS0=kY26=6K=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944B5C54FCB
	for <linux-doc@archiver.kernel.org>; Sun, 26 Apr 2020 22:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C9802070A
	for <linux-doc@archiver.kernel.org>; Sun, 26 Apr 2020 22:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="GM+k7AmM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgDZWXO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Apr 2020 18:23:14 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:49416 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgDZWXN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 26 Apr 2020 18:23:13 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id A60AC6AA;
        Mon, 27 Apr 2020 00:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :message-id:date:date:subject:subject:from:from:received
        :received:received; s=dkim20160331; t=1587939790; x=1589754191;
         bh=3Giu35+pR21pJr4vwfLFJbFlLtRMLOnmuezFAyy8WaQ=; b=GM+k7AmM86iy
        10YqqxUcS1YQkiD6+Nt0vJySli93Nr0PHcq6pMIYI65ZzFFM+XrxFbB7wd+qmwLZ
        l37JgwFxdoBB7AUSFFow/szvHgSKWm73goYVk6xFZhSJM5G5GEueLDVCXdig00ot
        a/tkFJfnNen0oQpbM99uj6aoMzseNjYZ3tRMpinyDnVqvu2T97k3lw7uRC9FFIkh
        KxcT3I/hQxddWgeDhOTWTTe/Xlzadd4GCM4+//bl3LZuKirgVaEFb3FOlgEziYbt
        aYq9fKLxTN5Od6gsVne07ytQYwyrB92lJHwhpCerSxxZg+CnVh5lttozTL6fI2DS
        x4WztVEKYCn6thxWlYNG2b3qT02SEBKy38ihBeKRJiJP4htq/HOMY9qvRl2HlKZ3
        oQ6o/gWeR2RZadeEeNpK3O6ZAPUrzeMcp/RsOJNwcxLPJhXfX5J3cGmDBcMy8h5v
        klYkekhW6VwtcAiRWp+ltjs/yUZr36a+852Z5XvjAuh/IyPwvQh02AftT7PfdQm4
        iJFLR6PyNkuO6yYBGQ+CdQ0qpXz6tdp4O2sh2pE3TNU9mtzZoI/45TIbowyuBnNz
        mVhvGzp6uF6hMBPSg74A4ygcfhdp3JAxr9j8GeiNBNuDr13C4JCpeM/e+K9yB9nu
        OA7fNqlFzhWeAs0VuDggLeQvahJIiAo=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UmFLZMkR8ISW; Mon, 27 Apr 2020 00:23:10 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id 1B67414D;
        Mon, 27 Apr 2020 00:23:09 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx003.mykolab.com (Postfix) with ESMTPS id A939947BF;
        Mon, 27 Apr 2020 00:23:09 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [INFO] Documentation/RCU ReST format
Date:   Mon, 27 Apr 2020 00:23:08 +0200
Message-ID: <2106522.Q2ZRUUiV7S@harkonnen>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

is there a reason for not converting the .txt files in Documentation/RCU?


