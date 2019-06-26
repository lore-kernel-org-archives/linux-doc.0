Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D08F7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Jun 2019 15:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfFZPVm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 26 Jun 2019 11:21:42 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44370 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbfFZPVl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jun 2019 11:21:41 -0400
Received: by mail-qk1-f196.google.com with SMTP id p144so1941815qke.11
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2019 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AqcyecsyR72Z800wF2DqV9Cha6bDH1l5BuA6pDWNwYs=;
        b=KfrqTafq5djpR60pvGLE24kaqVkohaB+1Fpu1qAbV1Z3UJnWWZHWEBXkU6CphviNT1
         omXIPfZ9zFPf4yGSgg17P5BQXYGiGGP+jB0FpgTBSR6f7jLWzuXvQnaH2UHQJ+jSUDQg
         FENMBf5dbkbQn1mv8JdGHmZlZR/hQfBJ25Vcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=AqcyecsyR72Z800wF2DqV9Cha6bDH1l5BuA6pDWNwYs=;
        b=QSq7xSLJKLu/Za3RJSpX7shGzDOMLZfVWEyj5YZd6fgnYsub6tzXFRUUdlISRu4J4r
         Md5b3MsDeQyjkV7G2BTTgPm2ioF0W6JxBhSLlwE8vL/AUBesLn0+O8z2VWRJBIQ4eMwy
         RquRSjYSe/9/2KG0wC87AerF1jcU7wJtRMc/lRSkrxl2B1EO4sLgOYKkTR/dvONaVEy+
         dkONGpsVOhvNe7raHzDKHZpTsfPmVyK06d86cHQFmBXgDWXg+D91HLS6ZQtf67YtWl3q
         G9VRE6IoIZ9Eqq/AZQxIaVdF9KMzp8JV0PcttDknKhlV7iKiHMRo9Th+q+t78IN46X6X
         AJ0w==
X-Gm-Message-State: APjAAAVxqtXess6NK4Eq5net7HHNPDXd/cpajv/jKaEIPu0wRqFY/e4j
        X27DladKvQNM96Bh+J93+sTblQ==
X-Google-Smtp-Source: APXvYqxzZ8iLSdr4K35JOc9DwvkixONaa8VxxhxUgn2Hu9TD/fRdCOA0eE8w19uDwLbWTvyFi2KN5A==
X-Received: by 2002:a05:620a:1292:: with SMTP id w18mr4442657qki.416.1561562501107;
        Wed, 26 Jun 2019 08:21:41 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id k33sm8995923qte.69.2019.06.26.08.21.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 08:21:40 -0700 (PDT)
Date:   Wed, 26 Jun 2019 11:21:38 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: On Nitrokey Pro's ECC support
Message-ID: <20190626152138.GA28688@chatter.i7.local>
Mail-Followup-To: Jonathan Corbet <corbet@lwn.net>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <c9c1e7f83a55bc5fb621e2e4e1dab90c5b3aac01.camel@iki.fi>
 <20190626082541.2cd5897c@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20190626082541.2cd5897c@lwn.net>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 26, 2019 at 08:25:41AM -0600, Jonathan Corbet wrote:
>On Wed, 26 Jun 2019 17:11:46 +0300
>Jarkko Sakkinen <jarkko.sakkinen@iki.fi> wrote:
>
>> I was getting myself a smartcard stick and looked for options from [1].
>> The documentation says that Nitrokey Pro does not support ECC while it
>> actually does [2]. I was already canceling my order when Jan Suhr, the
>> CEO of that company, kindly pointed out to me this.
>>
>> [1] https://www.kernel.org/doc/html/latest/process/maintainer-pgp-guide.html
>> [2] https://shop.nitrokey.com/shop/product/nitrokey-pro-2-3
>
>Maybe Konstantin (copied) might be willing to supply an update to the
>document to reflect this?

Hello:

I just sent a patch with updates that reflect ECC capabilities in newer 
devices.

Best,
-K
