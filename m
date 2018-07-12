Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_SIGNED,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0C9A07D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Jul 2018 12:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbeGLM7M (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Jul 2018 08:59:12 -0400
Received: from asm1.al.mt.gov.br ([200.199.203.3]:46487 "EHLO
        asm1.al.mt.gov.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbeGLM7M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jul 2018 08:59:12 -0400
X-Greylist: delayed 2122 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Jul 2018 08:59:08 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by asm1.al.mt.gov.br (Postfix) with ESMTP id 41RDpR3ZwVzCwhQ;
        Thu, 12 Jul 2018 07:53:03 -0400 (-04)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=al.mt.gov.br; h=
        x-mailer:content-transfer-encoding:content-type:content-type
        :mime-version:subject:subject:message-id:reply-to:from:from:date
        :date:received:received:received:received:received:received
        :received; s=dkim; t=1531396376; x=1533210777; bh=5Bmytc3xSGKits
        P+IHHjQ3hS6VqY0lAOw5E56yERU5I=; b=ijSCH+OXBRxpeysVTHAPr24EiUY6Hk
        wSVuqvbd/Yp1hHZrSxUH7yBNLlBGvGzhk4uBlx0qNnM5ERNOAiNn23qeOw5LbkOU
        DVQksIzExdhh962jf7XoL1yPtD4XhD+3EdpMUK1A+1FmzbSBaAYwfvQPlGJspkuz
        d7eqVkZieUCB9rSlQHfLSkvpOe6NXvyFd2lLZPwbh7XXK4BG29nH5JogfE7jXEtM
        o/OXMo/hMPWMsGpIcxn2XdNGJuJEj7fomJl3TONF4jqsl75IuCgbrAGHMzxpy49y
        s+9gM58C09AmdaW+I6PSv6tCm56WE1J7THKmS71BkoJYbK/9QNQFh3sQ==
X-Amavis-Modified: Mail body modified (using disclaimer) - asm1.al.mt.gov.br
Received: from asm1.al.mt.gov.br ([127.0.0.1])
        by localhost (asm1.al.mt.gov.br [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 8E2ZImC04NEZ; Thu, 12 Jul 2018 07:52:56 -0400 (-04)
Received: from serv09.al.mt.gov.br (unknown [192.168.20.12])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asm1.al.mt.gov.br (Postfix) with ESMTPS id 41RCRC4ggWzCxQf;
        Thu, 12 Jul 2018 06:51:19 -0400 (-04)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by serv09.al.mt.gov.br (Postfix) with ESMTP id 8743A9380C99;
        Thu, 12 Jul 2018 06:39:56 -0400 (AMT)
Received: from serv09.al.mt.gov.br ([127.0.0.1])
        by localhost (serv09.al.mt.gov.br [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id zhIOmMCm3QU7; Thu, 12 Jul 2018 06:39:56 -0400 (AMT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by serv09.al.mt.gov.br (Postfix) with ESMTP id 4F29BAACCA66;
        Thu, 12 Jul 2018 06:39:53 -0400 (AMT)
X-Virus-Scanned: amavisd-new at al.mt.gov.br
Received: from serv09.al.mt.gov.br ([127.0.0.1])
        by localhost (serv09.al.mt.gov.br [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id bNBEGEt5mNPh; Thu, 12 Jul 2018 06:39:53 -0400 (AMT)
Received: from serv09.al.mt.gov.br (serv09.al.mt.gov.br [192.168.20.12])
        by serv09.al.mt.gov.br (Postfix) with ESMTP id 1CE299380C99;
        Thu, 12 Jul 2018 06:39:52 -0400 (AMT)
Date:   Thu, 12 Jul 2018 06:39:52 -0400 (AMT)
From:   Jack <deposcarbezerra@al.mt.gov.br>
Reply-To: Jack <2936410069@qq.com>
Message-ID: <233208725.116556.1531391992062.JavaMail.zimbra@al.mt.gov.br>
Subject: Hello Beautiful
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.20.12]
X-Mailer: Zimbra 8.6.0_GA_1182 (zclient/8.6.0_GA_1182)
Thread-Topic: Hello Beautiful
Thread-Index: edxXMrR4sloHMCi+NcRiINoAfc+bJQ==
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Dear, my name is Jack and i am seeking for a relationship in which i will feel loved after a series of failed relationships. 

I am hoping that you would be interested and we could possibly get to know each other more if you do not mind. I am open to answering questions from you as i think my approach is a little inappropriate. Hope to hear back from you.

Jack.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
