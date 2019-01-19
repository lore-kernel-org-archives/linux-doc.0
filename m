Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 910D37D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 19 Jan 2019 16:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbfASQ10 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 19 Jan 2019 11:27:26 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42925 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfASQ1Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Jan 2019 11:27:25 -0500
Received: by mail-qk1-f195.google.com with SMTP id 68so9774972qke.9
        for <linux-doc@vger.kernel.org>; Sat, 19 Jan 2019 08:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y6F2rJwo7Os6XO76tOiHQ4GfbbU2zmNPL4N85CKP08E=;
        b=kOoT1lyQc1o3M9OVOvjd1YGks7zbF2+nkMORGWI+k58DneHbv1/fM4zNaT1XjMgx7I
         M86ZoCWjXxrMvSYFaluPMpnV1MeZ62RtmUkz//yp+v5afhiWcr3S+4zLXNqkTRlGWaKD
         3u/N2bcnP67uYr3c9ZmHFdqynnp3wH9TQfUjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y6F2rJwo7Os6XO76tOiHQ4GfbbU2zmNPL4N85CKP08E=;
        b=uSrdr4vtIEVSC5GAfXuOddNgQ08TsGjh/DEY+rJA/1qqNN1WOVhxa/j3rJAkLcEYyq
         ewBCSDkhfVAvQNqy3BZY8ciT1SvILh6Yalp5T+Rabph4VwxQ6ENlyvC+VrnkX/NdWVlP
         6+R0yuzXko1vxq1PEF1VQx19F8gvX8Dm1ZYhnqgJiuFtoi/WZzt4V2TeA+bvy3ma++DB
         aH4fQmA9NkW+XJ8a1Y8hA/fkwvR3tFR+TKfBQV8QGSwyySg6FH5SovgvmDwVqWvNDQKl
         TXrwOM+vrOgswXA2wruiRsVPjUC5ywG447gTMOu4pmos1fD42jcqxxj5vBYTzqRXcKW2
         fbgA==
X-Gm-Message-State: AJcUukeJHJjfAiuv1pb1y6ykIL26NA46c47lcKLKL0bT/MNvwLHyrM7A
        Yo6byKtKe4q/dgA40nyLD0upqQ==
X-Google-Smtp-Source: ALg8bN4rIC3vb5s/HB2a2LJ1VGLqrvU712iRgF658NLs//o/ZapiE3GBfVhCNqmd94SP5O7wK0JfoQ==
X-Received: by 2002:a37:34f:: with SMTP id 76mr19111701qkd.347.1547915244641;
        Sat, 19 Jan 2019 08:27:24 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id z18sm21667328qkz.96.2019.01.19.08.27.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Jan 2019 08:27:23 -0800 (PST)
Date:   Sat, 19 Jan 2019 11:27:23 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, Borislav Petkov <bp@alien8.de>,
        dancol@google.com, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        paulmck@linux.vnet.ibm.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        rdunlap@infradead.org, rostedt@goodmis.org,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        yhs@fb.com
Subject: Re: [RFC] Provide in-kernel headers for making it easy to extend the
 kernel
Message-ID: <20190119162723.GB231277@google.com>
References: <20190118225543.86996-1-joel@joelfernandes.org>
 <20190119082604.GB9004@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190119082604.GB9004@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 19, 2019 at 09:26:04AM +0100, Greg KH wrote:
> On Fri, Jan 18, 2019 at 05:55:43PM -0500, Joel Fernandes wrote:
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -549,6 +549,16 @@ config IKCONFIG_PROC
> >  	  This option enables access to the kernel configuration file
> >  	  through /proc/config.gz.
> >  
> > +config IKHEADERS_PROC
> > +	tristate "Enable kernel header artifacts through /proc/kheaders.tgz"
> > +	select BUILD_BIN2C
> > +	depends on PROC_FS
> > +	help
> > +	  This option enables access to the kernel header and other artifacts that
> > +          are generated during the build process. These can be used to build kernel
> > +          modules, and other in-kernel programs such as those generated by eBPF
> > +          and systemtap tools.
> > +
> 
> Minor nit, say what the module name here is if you pick the option as a
> module?

Sure, will add the name of the module in the help text. thanks!

 - Joel

