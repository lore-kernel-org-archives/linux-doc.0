Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD3F77D085
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 21:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751074AbeEUVC0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 17:02:26 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:13340 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750909AbeEUVCZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 May 2018 17:02:25 -0400
X-Greylist: delayed 483 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 May 2018 17:02:25 EDT
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTP id A75D9403F1;
        Mon, 21 May 2018 22:54:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :organization:message-id:date:date:subject:subject:from:from
        :received:received:received; s=dkim20160331; t=1526936060; x=
        1528750461; bh=t4XSfFF/BZeofSbJ+SX7zd8Ui4XT/RcGn/4m6ZVS+hA=; b=d
        dBPXwarCnzLJDg9n7Jwhe3U8dRfJjfNCqRXrDp6y42wKHN185hmGro5V/VqS35Om
        YGVpgSGkdspJaYvfX7iRF+8+4k7ELMgchpywsyY3QUa+LrP4m+9Zypn+1vHrVf8R
        kuXm/vldCmpn3OxQsyfyI4amCmNrI8Gt0RtVi1fIOgwuyEGQH/O4lg+q15a73hnF
        Rf+2fl75EPsUoCKFBZAMIP9iZ8RabCmvcCCiY/IdKl8I9X1zP03COFlyFycZWi9G
        8bm4wpBJmKtfXi5FLRunARM/ZL0y+fIaxNXlPMDzOHEobe3UFX5B/KLzxVOKQF/N
        v3y91sFVowCW9M3qLA5pLZJcDR71EglyXXPWIYdlrsAFCoeXjHL8vvhG7q2Uv/yI
        gvYtBHG/aeyqtZ8wDYwNfQ6Cpdxfox+2KAHMIvnei1F8pHyzNM+c2j7i3/h+MIiK
        VcwmD0ZiAFV8t3XatTX1Pv1BdYmULLTrx82EaKIK02NyZcdUdgEFnu+gaiYUQxfq
        fUB5fXFawaGwophcEDA162nmStJiFEznFrxuSqIzx0K48akWdPdSP5fLfwNFZPIB
        E0bZ6jd4O3sHEYF62emL3Jx1WD/BeOgearVEv2sRkX7I2bpCfdgBMqFQAHwtk8Zh
        Z4O+tDQcYFdGVa7TGx2JhknpXel7ioT8ERtH9Xh6L0=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8hvIfMZQoTpl; Mon, 21 May 2018 22:54:20 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 891C3401F7;
        Mon, 21 May 2018 22:54:20 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 461E511C;
        Mon, 21 May 2018 22:54:20 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     amantegazza@vaga.pv.it
Subject: Documentation/translations: Italian
Date:   Mon, 21 May 2018 22:54:18 +0200
Message-ID: <152696186.kHulSgLgWb@harkonnen>
Organization: VAGA
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

I'm writing you because I would like to start an effort to translate the 
Documentation in Italian. I would like also to express the idea of providing 
guide lines for translations.

A looked a bit in the archive but I did not find anything about these two 
topics (Italian translation, guide lines for translations).

I know that there are already translations for Asian languages but I am not 
able to find the history of them. I do not know if translations in European 
languages are going to be accepted (perhaps there is the assumption that 
everyone knows English in the European continent and it is a waste of energy 
to do translations[?]). For example, even if French and Germans are quite 
active there are not translations yet in their language: is there a particular 
reason or simply nobody did it?

Why
===
There is nothing better for understanding than our own mother tongue, and 
reading Documentation is one of those activities where it is important to 
understand its message rather than learning a different language (there are 
dedicated books and courses for that). This is especially true for young 
developers and new-comers who are really focused on understanding Linux and a 
different language can be an obstacle sometimes. I personally had a couple of 
experiences where I pointed people to the documentation and I had to explain 
English rather than Linux. Very competent people but they were not used to use 
English every day.

I put myself in this list of people who prefer the mother tongue language when 
it is time to really understand something. I work for an international 
organization in a country that is not mine with people coming from all around 
the European continent and our common tongue is bad-English with all its 
dialects and accents: true-English (with its own dialects), spaghetti-English, 
kartoffel-English, paella-English, formage-English and more. Misunderstanding 
is not rare, and sometimes express ourselves takes more time than needed. This 
is another reason why I believe that for understanding purposes is good to 
read in our own mother tongue.

Plan
====
If you agree with the need to support different translations, I would like to 
do the Italian one. But first I would like to open a little discussion about 
translations  "how to write translations"; this discussion should produce a 
document (in English) with guide lines for translator (e.g. Documentation/
translation/howto.rst): what to translate first, what to NOT translate, how to 
structure it.
Once this is defined I will start the Italian translation (I already have some 
documents translated).

How to do translations (IMHO)
-----------------------------
Here my personal guide lines for translations

- Translate only sphinx-ready documents, do not translate documents which are 
not yet sphinx. We should avoid useless double work; at some point, I guess, 
everything will be sphinx.
- Include in all documents a disclaimer saying that English is the main 
reference (use sphinx directive 'include' to include it).
- Include in all documents a reference to the English version. So it will be 
easy jump to the original document.
- Translate in order: non-technical documents (they are stable, useful for a 
wider group of people (developers and managers): process/, doc-guide/ ), 
technical documents about key concepts (they are stable, and important for 
new-comers), subsystems (the big picture is stable, typically they do not 
describe all little details that may change), and then other documents
- avoid scattered translations: try to finish one "topic" before translating 
something else

Probably there is much more, that's why I would like to have a little 
discussion about it.


Thanks for reading everything :)

-- 
Federico Vaga
http://www.federicovaga.it/


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
