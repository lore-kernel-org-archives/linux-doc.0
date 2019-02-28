Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 63EBC7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Feb 2019 15:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731358AbfB1P7d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Feb 2019 10:59:33 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40589 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729880AbfB1P7d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Feb 2019 10:59:33 -0500
Received: by mail-lf1-f66.google.com with SMTP id a8so9844643lfi.7
        for <linux-doc@vger.kernel.org>; Thu, 28 Feb 2019 07:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/yG045AjHlQzHVMpQbAAWO93fhU+A+guAM3BdQM2REU=;
        b=UvDkHkyBKXzR+vNwnTgp6d1dKeArFVIDTiSvm0o+ynbR3Ot9Whia0CXvVOFxv8JTZj
         ni2AAtm4KeE7NJIZS2cl1+NDoTGqRlT8Lp1qUF+dOYPMYPlkITm+s9OHa/PZMdV6Q1Eo
         yZplS1A4NxRRlsCgL9ZAotfh501RCW1BMcGHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/yG045AjHlQzHVMpQbAAWO93fhU+A+guAM3BdQM2REU=;
        b=GRgBso5PI8VOsDZScbIpSRBjw3J4HPeAKFVx1S8MSTtICSjAsHEkLJh71B53Y8e3kc
         s3Cpn0oG12heUGj+JaT1F/GU4znFYk7YsBtGN/9j+yIuls4qQKPM9NeI+PbgVXXGHJl9
         xryJHxgkhvJHw7D/f2yhuRkXk6fbq+tcnXP92vxITcd4C1s0a9TBPU6H/N6/KuQ/Crg6
         VWBpdJSWQVLl5/QIMglNw4QmAi7jIid5Hv6wpBEu+DOcslhVbilqumY/RyMQEIMhq1DM
         fze7XupXAXMJXsEL2Ci5A1pDeGNgw3xD3X/BggQVizyg+jQfyiV70Coa91Iud8xyIpsS
         G+vQ==
X-Gm-Message-State: APjAAAWTehlAhlJt3TLOlXQW6cqCKLJ5fsVgoaFzcC9yxmrXwkpNKMzH
        c33jmRsvkCFFO1zb9x/f2bRcqR6K3wVZyIck7xynUQ==
X-Google-Smtp-Source: APXvYqy8dwHBK38RCZWR3RQyf5zkFEA4bWHqaZ5cTaSdtbqCcr3pbQ75sXR8qJ5d5H7AMvUUltV+PZWS+9Ob9y9h7BE=
X-Received: by 2002:a19:c48a:: with SMTP id u132mr146841lff.16.1551369570963;
 Thu, 28 Feb 2019 07:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228173444.54403795211d80ba540b61cb@kernel.org> <20190228150054.GB156098@google.com>
 <20190228153026.GG8481@kroah.com> <20190228153741.GA168373@google.com> <20190228154513.GA12050@kroah.com>
In-Reply-To: <20190228154513.GA12050@kroah.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Thu, 28 Feb 2019 07:59:19 -0800
Message-ID: <CAEXW_YRa6bYpHcU-ovvvRYSrTC8JCVwa_wWHe_Krj44ompXroA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
        kernel-team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kselftest <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 28, 2019 at 7:45 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 28, 2019 at 10:37:41AM -0500, Joel Fernandes wrote:
> > In any case, it is not practical to provide headers for every kernel version on
> > the system image and maintain them, it will take up too much space and has to
> > be periodically packaged. Not to mention that there will be kernel versions
> > that are booting Android that simply don't have anyone maintaining headers
> > for. So the proposed solution is an easier path.
>
> I totally agree with this, and with your proposed patches, just wanting
> to clear up some potential anti-GPL-FUD before it got spread any further :)

Sure, no problem, thanks :)
 - Joel
