Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AC8917D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 21:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfCRVLu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 17:11:50 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34014 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfCRVLu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 17:11:50 -0400
Received: by mail-qt1-f195.google.com with SMTP id k2so19788466qtm.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 14:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opersys-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1ILkhe+5q0I/7urwS/c27Sb5MLAkf2cAYnZZe/oHvpY=;
        b=HgRNpAAXOValLWiEzXBr2h4DoilkHB94eMqRxjGOwSrmQkmV4w39e5zzlIUmouFBc/
         UOycXHf/qOD2bJ4WS3lnnMWdDOfjGceesEpS0qb4JxW/5lSFxZLVsfXHKScGoha2qY2U
         2QE3i2lluRirfFpqkcXfhDePjlFfyESm1H0KzLGs6KJLQX9PJMya4ME2KwwMLh8F5cUT
         liZWsyMET3CXrWX21liCCet+zljQiLp0JOANWvok0r9hf3BSDZsL9tNLq3ZXS/AMP2/P
         NC3KO9nL8bPj413LNfG6idarNgcES+CN4vaiHFe5E84rW4JCrIJkW6fCuUKQhRQGb3AG
         5Hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1ILkhe+5q0I/7urwS/c27Sb5MLAkf2cAYnZZe/oHvpY=;
        b=ZWYuG1Lg3W5j/Wc7pUJzbMJ+Lg+jj1hZzOT2dLIyqpwROE6iqHRHuA56lVb97IkaIT
         zXhUuaSZnRHdKCagXoAkR8pVLCvQ/9tH9QtDzw7gS4jlda4E/lMrwFfj21Ne68pIQXom
         9FzcLKMQilXbFpmLfW/RI2m91k2WPmXe0J1RtQ8oZgmXN5gRNEIzdn0TaquEEaoDlC0Q
         8BgqySXCXehyJ1bbhl1VsGMClBKTYpCFDY3V6d255ofrSASlEQPVoqZOSnAAnY+4gjjo
         vnbOpjcB8B3inrNpl885IE5i/uV134nBcI0yiT6E3ZasSvoRG6fWt5RYIkEKs8YIzBQg
         DFZQ==
X-Gm-Message-State: APjAAAWQtPPZUKbX38X1h/WHfEGfl8lCsIo0sC3AcQDt7XUd8fQ88T0e
        64CH4I9BU3vzWi5LwF2R3yh15A==
X-Google-Smtp-Source: APXvYqz1wQxoKXBlvbvNpLHP3GqpTeS3Bpn7XQy4uiM6ZW5SFnrgwJqRFGfCa/s4e2IxXieOgKMBfQ==
X-Received: by 2002:a0c:ad93:: with SMTP id w19mr14737015qvc.25.1552943508863;
        Mon, 18 Mar 2019 14:11:48 -0700 (PDT)
Received: from [192.168.202.103] (modemcable170.15-70-69.static.videotron.ca. [69.70.15.170])
        by smtp.googlemail.com with ESMTPSA id t35sm3333553qtc.10.2019.03.18.14.11.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2019 14:11:47 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
To:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Joel Fernandes <joel@joelfernandes.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>, atishp04@gmail.com,
        dancol@google.com, Dan Williams <dan.j.williams@intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Android Kernel Team <kernel-team@android.com>,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, qais.yousef@arm.com,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>, yhs@fb.com
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com> <20190307152303.GA9819@kroah.com>
 <20190318185742.109dee5c@alans-desktop>
From:   Karim Yaghmour <karim.yaghmour@opersys.com>
Message-ID: <989e8a5c-28a6-856b-5a69-8d84189bcad5@opersys.com>
Date:   Mon, 18 Mar 2019 17:11:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190318185742.109dee5c@alans-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi Alan,

On 3/18/19 2:57 PM, Alan Cox wrote:
>> I think the compressed tarball is much simpler/easier overall.  If
>> someone really wants the filesystem, they just uncompress it into a
>> tmpfs mount.  It's much less moving kernel code to worry about.
> 
> There is an even simpler approach. The people who want this for whatever
> strange reason are Android folks. Android lives on flash, so all they have
> to do is put the headers in a flash file system that is updated with the
> kernel and mount it wherever they like. Simple matter of a bit of
> devicetree no ?

The Android use-case scenario might indeed have been the one to best 
crystallize the requirement, but that doesn't mean that all use-cases of 
eBPF wouldn't benefit from this -- which in fact they would, see 
instructions here for example on the need for kernel headers:
https://github.com/iovisor/bcc/blob/master/INSTALL.md

Just a quick $PREFERRED_SEARCH_ENGINE search returns interesting 
exchanges such as this one taken from a discussion thread on LWN 
covering an introduction to eBPF:
https://lwn.net/Articles/741348/
Effectively this person had to be hand-held in understanding that they 
needed a good set of kernel headers to make the tool work. Their comment 
after being shown that this was needed was:
"It looks like the headers package you need on Ubuntu is 
linux-headers-$(uname -r), which contains the entire kernel source tree, 
and is specific to the running kernel."

Surely having Joel's patch in the kernel would obviate the issue for all 
Linux kernel users, not just Android.

Cheers,

-- 
Karim Yaghmour
CEO - Opersys inc. / www.opersys.com
http://twitter.com/karimyaghmour
