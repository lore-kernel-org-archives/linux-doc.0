Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F964C48BE0
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 13:43:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F06B861404
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 13:43:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhFKNp3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 09:45:29 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:34290 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhFKNp2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Jun 2021 09:45:28 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 170BAC08;
        Fri, 11 Jun 2021 15:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1623419005; x=1625233406; bh=1kJogRoiDVsAnB9QZik9yfmQC0b6wq5/Kh+
        3aY136+E=; b=DKFPvei7IPRvWsQKuPxQXvuANVDcTIDU8MrcC3+eOn+K9uSklN6
        b5gFgN6d3GfOVRY3/8JXZ+LERbmH7Gu51ynhqJPK6W7j739/19FiqV/y7S1mI4ou
        JOCY8EUCPvMi2qCc/Hv5VqKS60JumeXF/UG3XptIl35KZKXkKR/JPsEiHg4QiWqX
        IZTDbIaUH9A4SuIc6WJne7Vsw5uOjvwKQfqjukQstcBsRaY/wqQFInVDcKQEZrCZ
        0WggE0QdUQAq3B8X0KqRlZOA0UoR71l6sstYsshmmHDKvZZRUTgpvdJej7tS39Ma
        +WPr2asp1FYhxam6KQlUjV25ADtXYEJfl8tB0tHn711KLNcq5Fvj8FlEG9MTEl2d
        /RJitvQg5FTay+OXoz1MjRbPDOcenE4yb5QySdNDHBK4Xrg2L6/JSZe+B7HNqK5j
        rFXUhk0h8QVAnjGGa8OFofFtTIgZkpwP5GqgpZejpURqSLbqkaAPCZej0sS9UgO/
        XEbzGLZ0ScWb+h6n5C0X/w9C+e5A2Rs3918mgBxzyKFUDsfrfczkocWTIk4yl+m8
        J/I2uG81Aql2IktA/xygk8KWuEVXhNJPr1yiRPRey6z53m2AZJrJcIn3I75sTeQQ
        umiQUZ7V/rsanz8LgZ1X0CEBZ0/ciEC7hyor2Cs99u9OrcDEP4/rytgQ=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JBeVJ31EBijM; Fri, 11 Jun 2021 15:43:25 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id B269A6A8;
        Fri, 11 Jun 2021 15:43:25 +0200 (CEST)
Received: from int-subm002.mykolab.com (unknown [10.9.37.2])
        by int-mx003.mykolab.com (Postfix) with ESMTPS id 9AB5A4E20;
        Fri, 11 Jun 2021 15:43:23 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Jun 2021 15:43:21 +0200
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        Alex Shi <alexs@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 1/3] Documentation/translations/it_IT: switch LWN links to
 https
In-Reply-To: <69693d32.AM4AAKVPb68AAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgvu7-@mailjet.com>
References: <69693d32.AM4AAKVPb68AAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgvu7-@mailjet.com>
Message-ID: <b7dee70d419f7d48e186a5b8ff3a0acb@vaga.pv.it>
X-Sender: federico.vaga@vaga.pv.it
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021-06-08 06:15, Sanjeev Gupta wrote:
> Links have been checked to ensure that the old and new URL
> return the same page.
> 
> Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
> ---
>  Documentation/translations/it_IT/process/2.Process.rst      | 2 +-
>  Documentation/translations/it_IT/process/3.Early-stage.rst  | 4 ++--
>  Documentation/translations/it_IT/process/4.Coding.rst       | 2 +-
>  .../translations/it_IT/process/7.AdvancedTopics.rst         | 2 +-
>  Documentation/translations/it_IT/process/8.Conclusion.rst   | 6 +++---
>  .../it_IT/process/volatile-considered-harmful.rst           | 4 ++--
>  6 files changed, 10 insertions(+), 10 deletions(-)
> 

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

-- 
Federico Vaga
