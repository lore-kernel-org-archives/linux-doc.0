Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E49207D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 08:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbfCHI4S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Mar 2019 03:56:18 -0500
Received: from smtp2-4.goneo.de ([85.220.129.36]:53547 "EHLO smtp2-4.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbfCHI4S (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Mar 2019 03:56:18 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id D81B9240549;
        Fri,  8 Mar 2019 09:56:15 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mzxTP7Gys4Gj; Fri,  8 Mar 2019 09:56:14 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-091-248-065-152.ewe-ip-backbone.de [91.248.65.152])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 46D6123FF57;
        Fri,  8 Mar 2019 09:56:14 +0100 (CET)
Subject: Re: undefined label
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20190307091734.GB9152@eros.localdomain>
 <c24a75bf-5bd5-aca8-7764-e05a03495e01@darmarit.de>
 <20190307203041.GC21937@eros.localdomain>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <f0891518-ae90-904b-1001-477c122f1abb@darmarit.de>
Date:   Fri, 8 Mar 2019 09:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307203041.GC21937@eros.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tobin,

Am 07.03.19 um 21:30 schrieb Tobin C. Harding:
> On Thu, Mar 07, 2019 at 10:58:07AM +0100, Markus Heiser wrote:
[...]
>> If there is any interest in, I can implement a RFC for this.
> 
> Cool!  I think this would be super useful, I for one like using
> SPHINXDIRS when developing docs incrementally so removing false warnings
> would be nice.  I doubt I'm the only one to be baffled about Sphinx
> references.  I'd be happy to review and test your RFC if you CC me.

Intersphinx has also drawbacks. E.g.:

 >> To close such cross-books links we can use intersphinx [1] and map to e.g.
 >>
 >>    intersphinx_mapping = {
 >>        'kernel': ('https://www.kernel.org/doc/html/latest/', None)}

This requires online access while building the output.  Anyway, as soon as
I have some time to spare I will send a RFC with more explanation about
(you will receive it in CC).

-- Markus --

> 
> thanks,
> Tobin.
> 
