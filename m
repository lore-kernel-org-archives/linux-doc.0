Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 823A07DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 17:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751087AbeDMRjo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 13:39:44 -0400
Received: from mail-ua0-f178.google.com ([209.85.217.178]:46043 "EHLO
        mail-ua0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751010AbeDMRjk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 13:39:40 -0400
Received: by mail-ua0-f178.google.com with SMTP id j18so6269792uae.12
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=aZvENRESSAzpRzTxa/jUJmZimHA6zTIm/E4z+zzpQ8I=;
        b=fNRk8DpMfyOhdcWiRqZUPlRBgMM42jxp/4etKwfZOtrgAZftv06IbxIwEdqaBCFia6
         DbyyVesFLF6UcJF/A8oxS+ybUH9MBgHh2jM4NPEcugpj0twI0AV/wvCtNS5VTo/GlbE1
         92p8FxzC9e9Tyu+z1CwlCEclsxT656tlPfYJVMm/HqExLObzfune0q+jAki0FvpcLMqM
         9r9vkHMf972p42yqR6DvqJMNktSPSgGVxsaoh4+sSDbxiCmr7sxH1qFkmoFZHWlL79wj
         +h1dlOADq4Xct/1jF1Mp4hkwrc0joiWwM5CLpxe3OgfQbY5lv7xfhEbqXZoyAWTDjsL5
         xG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=aZvENRESSAzpRzTxa/jUJmZimHA6zTIm/E4z+zzpQ8I=;
        b=e3pCJN0VFofzdgvWstOisECiXNaWgyTxHuJWtpBtsmSat8NAVPNLju6OuxV0IVczZU
         Lw9X5iL0wAQ8kFH4wUOgMsjElm5opj2nQyiKdpeELtozr5PY+SNopVSvpo7iSZ5ZNldF
         hvbCw68eQcJVgB+UP1FfFyY0/YjgHym+RPjDmVTDszOYVOCBh7NzJ+wv5GUdEuGIxgU0
         VfQ9+iGVroxsVwAGzmlH0hCuEcfln+tZK+LZCYSv1dhCxSkaB+wOPhA9tdOpa44CFUBi
         p9aH2GOMeMK8Q+ORoZH1VqPD4efuS668+N+y98g5pWrAY1G4J1aKUJAljwqw5jdYFJLs
         ralQ==
X-Gm-Message-State: ALQs6tDNXzOV9Cim6qBEvxmOPqvak0EEahYV2D2jh4dVmQNLPdlcHrnm
        yIH6hQF2KNob2WEWhhTqQtp1JWVWhQoQYZhM4kc4gg==
X-Google-Smtp-Source: AIpwx48kId1GOJCD5n9oZNwKYVC1nEclW+eS2cQBRQ9aj/yc6B98s6o7MTe23Y97ZVi9zAg4IR7TR3VUozWBA+w0Itg=
X-Received: by 10.176.94.74 with SMTP id a10mr292278uah.113.1523641179979;
 Fri, 13 Apr 2018 10:39:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.58.214 with HTTP; Fri, 13 Apr 2018 10:39:19 -0700 (PDT)
In-Reply-To: <20180413165000.2svg2j5ozdd2egbd@ninjato>
References: <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
 <20180413164405.127522-1-hansens@google.com> <20180413164405.127522-3-hansens@google.com>
 <20180413165000.2svg2j5ozdd2egbd@ninjato>
From:   Sam Hansen <hansens@google.com>
Date:   Fri, 13 Apr 2018 10:39:19 -0700
Message-ID: <CAP9bUy6_sGreanxger04mtyHAVSb0tyFe8Ji0+ocUUxTh9C+3Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Documentation/i2c: adopt kernel commenting style
 in examples
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 13, 2018 at 9:50 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> -  int adapter_nr = 2; /* probably dynamically determined */
>
> Such comments are actually OK.

Ah, gotcha.  Thanks for the correction.  Standby for revised patch set.

>
>> -    /* ERROR HANDLING; you can check errno to see what went wrong */
>
> Such as well.
>
>> -  /* Using I2C Write, equivalent of
>> -     i2c_smbus_write_word_data(file, reg, 0x6543) */
>> +  /*
>> +   * Using I2C Write, equivalent of
>> +   * i2c_smbus_write_word_data(file, reg, 0x6543).
>> +   */
>
> This is the only broken one AFAICT.
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
