Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE7F17D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Nov 2018 17:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbeK1EW1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Nov 2018 23:22:27 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:41705 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbeK1EW1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Nov 2018 23:22:27 -0500
Received: by mail-yw1-f68.google.com with SMTP id f65so9457410ywc.8
        for <linux-doc@vger.kernel.org>; Tue, 27 Nov 2018 09:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=n6seMOKNWMGgqtLXOXURwjfPrXhhZrHzuJwTTcAOgt8=;
        b=Zf5d5UwL3dzzZKGSxK0dPXmc3XILwkkUbG7PD1jnSmDhy/VHV1idkwhRgQiOH0meZC
         zLVR+YvGUx0vVNTN070bbXp/lweH+fJiWkV0TO1nH+9pOxtbotoEZEG9cXn4zNYBFxK8
         LJehoZ2nN/2ewpkNBM8DP2k/EdqI8nOk5iZng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=n6seMOKNWMGgqtLXOXURwjfPrXhhZrHzuJwTTcAOgt8=;
        b=f9EqTH7iCkyZfai0vu5eXW37BttE693cYsIY1R1VJCCMx1yAtNs6VYT8c4PQ0XhaC3
         9MTjF/51gqhPxgWA+yL5Z00gwcDIjegKOWgB0xQhMDvtHGoP5Zfwtk19Fs0EgvLWltMK
         ugWMa63IWNpHi+wOsZhcmlXtgkNz/RHgOpa3E1jpIioRzllVwCsMTMW9358XVODJH/hx
         aGV+tuvG6bu1uodL3pPzKEXy6koZgJ7SbnJY6zeagRF4XN5AyzXP9L0rHHzQS9ZqvoXk
         Faphp20tIFJfURQiG7ID+RmI0DxKao6aMnVwlYQdiOjnRnlkrhFFPDwadH6uLZ5ilm78
         3YgA==
X-Gm-Message-State: AGRZ1gIowU9eVUWI/RSXxp6L530eipoFibywGBTw/wjjCbkkpeoxXPv/
        1bAgIRbVj0c5GRXxZGNMeYl7SpTSSXg=
X-Google-Smtp-Source: AJdET5dAZH2o0eRzvAeIJ6PceLJJN7605FmQhY4Eu8PERPhvDjOAIfsadyk0WWrzJGkiACZMJPDQLg==
X-Received: by 2002:a81:a6d7:: with SMTP id d206-v6mr34562345ywh.188.1543339431372;
        Tue, 27 Nov 2018 09:23:51 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id h75sm1339360ywa.50.2018.11.27.09.23.50
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Nov 2018 09:23:51 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id h187-v6so9371115ybg.10
        for <linux-doc@vger.kernel.org>; Tue, 27 Nov 2018 09:23:50 -0800 (PST)
X-Received: by 2002:a25:2349:: with SMTP id j70-v6mr33856568ybj.137.1543339430107;
 Tue, 27 Nov 2018 09:23:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:b906:0:0:0:0:0 with HTTP; Tue, 27 Nov 2018 09:23:49
 -0800 (PST)
In-Reply-To: <abf0f0ec-15c5-59eb-8657-e1e0e1f396b6@linux.intel.com>
References: <feac7efa-df6f-cca1-e321-28d220bf0411@linux.intel.com> <abf0f0ec-15c5-59eb-8657-e1e0e1f396b6@linux.intel.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 27 Nov 2018 09:23:49 -0800
X-Gmail-Original-Message-ID: <CAGXu5jJWTyEzXODmeKkko5A212TAe1KSWGuONRvF7Tt+RY+5Sw@mail.gmail.com>
Message-ID: <CAGXu5jJWTyEzXODmeKkko5A212TAe1KSWGuONRvF7Tt+RY+5Sw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Documentation/admin-guide: update admin-guide index.rst
To:     Alexey Budankov <alexey.budankov@linux.intel.com>
Cc:     Jonatan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jann Horn <jannh@google.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Andi Kleen <ak@linux.intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 27, 2018 at 12:16 AM, Alexey Budankov
<alexey.budankov@linux.intel.com> wrote:
>
> Extend index.rst index file at admin-guide root directory with
> the reference to perf-security.rst file being introduced.
>
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
> ---
>  Documentation/admin-guide/index.rst | 1 +
>  1 file changed, 1 insertion(+)

Seems like this could just be folded into patch 1? I'm not sure Jon's
preference here, though.

-Kees

>
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index 965745d5fb9a..0a491676685e 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -76,6 +76,7 @@ configure specific aspects of kernel behavior to your liking.
>     thunderbolt
>     LSM/index
>     mm/index
> +   perf-security
>
>  .. only::  subproject and html



-- 
Kees Cook
