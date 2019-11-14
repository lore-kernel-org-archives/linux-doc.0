Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 499C27D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 08:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfKNIf1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 03:35:27 -0500
Received: from mx.kolabnow.com ([95.128.36.41]:63344 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbfKNIf1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Nov 2019 03:35:27 -0500
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id DC14855A4;
        Thu, 14 Nov 2019 09:35:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1573720524; x=1575534925; bh=EEBOfkrdo4Q/l9fAQqE3uKEVlGWmlUZzsv4
        zFuOuCjs=; b=GCiCigYqXctWM2Lxt/9aie1A9+tqe0tZPNwod2A9mbMVuvLEfek
        g7k4Dgxeotrd6/rkjNs8PZhHJtevbZru2GvW6B44m5GicuRSXutnj+wdvhvapVrT
        +o7/vUi8z+k3O2crB+H8gV0YT65SbJ/E7SI7wsDb/VdLXeygNaLfnM3G0ckHZsiE
        KyutCRzo8ZReGv1zONZ4d2ShvxkSL+l59lcG8uK0+DbiZLeJWOVChDnuthMnXkDT
        YqwEYQCwgIKyGrZJPOgBuKTkAKyBqTESnHREql8V+aEtQNaRPxqRfojilOl9nDcY
        1egcFsnEXjuK0IeZpLk96TYVKlHago2JXo7g4HoxOVPaUTEk3MyOxuGjOzgMvecm
        x3L6ahjYuNoGyKpHatxsJ9p+4bKOEnslbVtUgsTua18i1dsInTeC9QJP202yYW5l
        +8PFxAeGEe44nCJAEdW5ivwdkpfGA/2xJiCD3cz9HE0RjQ72/AYuhOdWx5IzsWSa
        tD2J/BxAypTmefr+Rm6ydXIfU3lj65ucjyY+S/FJ6wDVoQ6Jb9LjQUJ6lJ/o6mH/
        C1qpMsygjJwQfN8vtGOxkzgRPxuWD3DPhNyHObqfyqBLqw3gKlPGX/u5blVbdHMT
        5v9CoIiBVUB/XlZrtAoJVGsn1djYKXb0R3MggPToFXHo0VOZfFLfqids=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fvB8Kf3rz9BV; Thu, 14 Nov 2019 09:35:24 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id 4D4AAA36;
        Thu, 14 Nov 2019 09:35:24 +0100 (CET)
Received: from int-subm002.mykolab.com (unknown [10.9.37.2])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id E37182747;
        Thu, 14 Nov 2019 09:35:23 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 14 Nov 2019 09:35:23 +0100
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
In-Reply-To: <CANiq72kKDiuYcyY+djHPsUJ3AFG6LqT1O=4FT8E+-ifnbKv9Gg@mail.gmail.com>
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
 <87a79141s3.fsf@intel.com> <20191112084257.4cca2d4c@lwn.net>
 <871rud3x2e.fsf@intel.com>
 <CANiq72kKDiuYcyY+djHPsUJ3AFG6LqT1O=4FT8E+-ifnbKv9Gg@mail.gmail.com>
Message-ID: <1a1c57ed248b6cc4622278b079726587@vaga.pv.it>
X-Sender: federico.vaga@vaga.pv.it
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2019-11-14 01:54, Miguel Ojeda wrote:
> On Tue, Nov 12, 2019 at 4:59 PM Jani Nikula 
> <jani.nikula@linux.intel.com> wrote:
>> 
>> Sphinx also has some i18n support which I believe we aren't using, and
>> it would stand to reason this is covered there. But that probably 
>> needs
>> some dedication from Someone(tm) to figure out.
> 
> The docs say not to go overboard with the reStructuredText markup, so
> I am not sure if we should avoid going overboard with Sphinx features
> too :)

In addition, I do not know if it worth the effort of doing i18n in 
Sphinx.
Which problem is going to solve? If we are talking about this mistake, 
it is
a more general mistake, unrelated with translations: a label has been 
used
twice in the documentation. These labels need to become local in the 
document
or replaced with inline links (I prefer this as I already wrote in 
another mail).
A global label "gcc" is likely to give some trouble at some point 
because too
generic.

> Cheers,
> Miguel

-- 
Federico Vaga
http://www.federicovaga.it/
