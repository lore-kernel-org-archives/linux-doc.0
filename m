Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 61AD57D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 03:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfDPD4v (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Apr 2019 23:56:51 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:45847 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfDPD4u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Apr 2019 23:56:50 -0400
Received: by mail-vk1-f196.google.com with SMTP id h127so4125268vkd.12
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2019 20:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6O1vt8zyWL7/vWWLrY3NNehV0EhKXQOq2R1IZBHsBM0=;
        b=I0zPpGeLyvzz+csxGqpsE7zsCViKtWZhQaelft8C+qhDNxi30FqHEvOz2fVzv5d1+M
         ssIe7zjb3ELGM0QBfLlIM3E4lc4GF4kTNNAJybOtOZLnBWfr2Hkzy457MNmC5ybMQk2E
         Ko1+7yx9uOJu+W4AQSdHiN2Grir4tOwuZCWDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6O1vt8zyWL7/vWWLrY3NNehV0EhKXQOq2R1IZBHsBM0=;
        b=mu2gLx+OXs8Q4ljrKZ6xyQOJ/QEFZ6u/4Zo1msvZOXdH8axgUXckSV+PfLW1qUj4kT
         9VeU4YwPgXLvg4PLE7A55gS4/aDXKPaSrYeB2lhznl/sRaxGKfrH8p1RPsKoRNqd9cCE
         QK/3ROHB/QXyehllC2BXxixj1yWobH+dc+hmRONTbz2e+NH1heSTy9/8tIVEz1iSJ9Zz
         fnp9hT6nx+YFbGzHVUgLhsPJnLmZUiGr2bblEEv9nm2gDpZeJYf22G911yndxJMNOo6Y
         SppNMqDOKrmnhcCO9BMbbIDOL3QgMqzUm6SBtG15j8zdlYolWdejK4I+koLvjp9cGTCi
         r4/Q==
X-Gm-Message-State: APjAAAWYbLZz97D0JGNsoinTLEMRhMoPhXY+rh97JGZCQUPrUoQhB2A4
        NYT1nqWNg9dS1QD8cHMiAPhEjYbE8Zw=
X-Google-Smtp-Source: APXvYqzVad/nGbXIP+Nnc57tp0XROy8Wp3V+ujSdbx7oP+cTkd2aUyVci/KeMYa5Ia3vaYuVolmyIw==
X-Received: by 2002:a1f:bf4b:: with SMTP id p72mr42400282vkf.77.1555387009510;
        Mon, 15 Apr 2019 20:56:49 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id l9sm8815561uae.1.2019.04.15.20.56.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 20:56:49 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id k32so6274748uae.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2019 20:56:49 -0700 (PDT)
X-Received: by 2002:ab0:154e:: with SMTP id p14mr3882445uae.48.1555386622555;
 Mon, 15 Apr 2019 20:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com> <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com> <20190415104109.64d914f3@gandalf.local.home>
In-Reply-To: <20190415104109.64d914f3@gandalf.local.home>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 15 Apr 2019 22:50:10 -0500
X-Gmail-Original-Message-ID: <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
Message-ID: <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel easier
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Joel Fernandes <joelaf@google.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Manoj Rao <linux@manojrajarao.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 15, 2019 at 9:41 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> I agree with this assessment. We shouldn't use config.gz as precedence
> for this solution. config.gz should have been in debugfs to begin with,
> but I don't believe debugfs was around when config.gz was introduced.
> (Don't have time to look into the history of the two).

I don't agree with this: /proc/config.gz is used by a lot of tools
that do sanity-check of running systems. This isn't _debugging_...
it's verifying correct kernel builds. It's a fancy version of checking
/proc/version.

-- 
Kees Cook
