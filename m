Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6EE3B7D8A4
	for <lwn-linux-doc@archive.lwn.net>; Sun,  5 May 2019 13:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbfEEN01 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 5 May 2019 09:26:27 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35616 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfEEN01 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 May 2019 09:26:27 -0400
Received: by mail-qk1-f196.google.com with SMTP id b7so6320507qkl.2
        for <linux-doc@vger.kernel.org>; Sun, 05 May 2019 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VMs3ZDG4UTtB7mWeq9fogx8Im6FYMW4NfffNVZ0T6g0=;
        b=Wx8/Qn4lhOzjepZEXkLBZ+w8/WHG8jhLCLZePQswk3nuOkWjV3N5eH3aZKCgdybogp
         7/TReM/N6U6Lw8RYN3lD4pnUWUG8h7F81NJCRUMPZDWBZMOfV4oc9MoHAgMWetH1nZpI
         OHyXUY0uszNgLft1e5rlQxJbPefuA34AZXXgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VMs3ZDG4UTtB7mWeq9fogx8Im6FYMW4NfffNVZ0T6g0=;
        b=iM1mquDuvky9+isRvET0yf5bHQaITDLC3M0EyRJpJrwzW1Q4o3a+7DzXEaXziLm3c/
         9eFXTbefjmqaLAzjIFbMOp2QaAOK6I6M0a5Zv0cXol5P/jAo3xfeDBnwWRA5mRk2IULM
         FfHkKevAIkafXSs4pctrMqAIP6/u57S1mdzqbm0Xtfvp+qUtpj9pzJiEXP5Cz5e0aowq
         G1vITNzKe+7EeCaxL10FF2q+rAh6SAOsxYEayXBEhKJYmF982+3g2bbu0YRwlgEDwJab
         4ynNJZT7Sbc1WeUeOAOByUAc6Jy96OT+NIVhrsttg8LGLYWfRzRAY8aJETHSXpr12t7p
         VZWw==
X-Gm-Message-State: APjAAAWxnMOfJMM+Iiz9r21aiOf3k40vRqk17SrdKPZZ2hqyAj3rqgyz
        zdphaOfneCOiqELzUIM+480kWg==
X-Google-Smtp-Source: APXvYqzN3LNC9F4r23JL3m1ARyAewSM1naLPRx+StaQtVcEsebbIkaf5I9yTOOJzVD+6xM/cfuUBLQ==
X-Received: by 2002:ae9:df43:: with SMTP id t64mr15613710qkf.250.1557062786462;
        Sun, 05 May 2019 06:26:26 -0700 (PDT)
Received: from localhost (c-73-216-90-110.hsd1.va.comcast.net. [73.216.90.110])
        by smtp.gmail.com with ESMTPSA id k127sm4921838qkb.96.2019.05.05.06.26.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2019 06:26:25 -0700 (PDT)
Date:   Sun, 5 May 2019 13:26:23 +0000
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, atishp04@gmail.com,
        bpf@vger.kernel.org, Brendan Gregg <bgregg@netflix.com>,
        Brendan Gregg <brendan.d.gregg@gmail.com>, dancol@google.com,
        Daniel Borkmann <daniel@iogearbox.net>,
        Dan Williams <dan.j.williams@intel.com>,
        dietmar.eggemann@arm.com, duyuchao <yuchao.du@unisoc.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manjo Raja Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        =?utf-8?Q?Micha=C5=82?= Gregorczyk <michalgr@fb.com>,
        Michal Gregorczyk <michalgr@live.com>,
        Mohammad Husain <russoue@gmail.com>,
        Olof Johansson <olof@lixom.net>, qais.yousef@arm.com,
        rdunlap@infradead.org, Shuah Khan <shuah@kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Tamir Carmeli <carmeli.tamir@gmail.com>, yhs@fb.com
Subject: Re: [PATCH v2] kheaders: Move from proc to sysfs
Message-ID: <20190505132623.GA3076@localhost>
References: <20190504121213.183203-1-joel@joelfernandes.org>
 <20190504122158.GA23535@kroah.com>
 <20190504123650.GA229151@google.com>
 <20190505091030.GA25646@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190505091030.GA25646@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, May 05, 2019 at 11:10:30AM +0200, Greg KH wrote:
> On Sat, May 04, 2019 at 08:36:50AM -0400, Joel Fernandes wrote:
> > > But, you should change S_IRUGO to the correct octal number, checkpatch
> > > should have barfed on this change.
> > 
> > fixed, below is the updated patch inline, thanks!
> 
> Please resend as a "real" submission, doing so in this format is a bit
> more difficult to apply.

git am --scissors can do it, but no problem I will send as a formal
submission. Thanks a lot.


> 
> thanks,
> 
> greg k-h
