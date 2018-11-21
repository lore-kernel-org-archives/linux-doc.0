Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD34E7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Nov 2018 20:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbeKVHO1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Nov 2018 02:14:27 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40291 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731116AbeKVHO1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Nov 2018 02:14:27 -0500
Received: by mail-vs1-f66.google.com with SMTP id z3so4072363vsf.7
        for <linux-doc@vger.kernel.org>; Wed, 21 Nov 2018 12:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bm0cmdW8xHtpvw83SANYUh6MFHRfj/MqEyWJqmXjk1w=;
        b=MvzMR9dDj7CZG/+mAlO7e9BG7xnEPolUnFhZu5OvKAqWr17r0buX+UZI16KXbm2PWk
         A9UMWcctar1IJgq1+Xz5SJ7QBFUgVZm3lIU5CpBSlaWNEhCphP2zbnzKFbWdRE+E+zbR
         u7eaW5Uq2tYvToY2OwypWA5BERtcPAJmhYDEykA2FIEdKOiS21WBbBIYCI2uqKGQZlkj
         R/HP7D+LNfPlCPVGlNhn9sUkD9iFY0+Y2PPAWjo8DzI5ARu8Oa9JiZquTcvFpyOh5Urf
         xdW7XUynKpn4HE64/hWr2vbvoi3ojIfsFV5ucxH51AAmO9aiWeCB/ov0GW6jtc269XNE
         mDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bm0cmdW8xHtpvw83SANYUh6MFHRfj/MqEyWJqmXjk1w=;
        b=qCMclhVEIi5GB3vweB3i0HCt0rwV/dFdP5yLkoPvIJBwu0BjQFBsbOoKYE9TuxDEkN
         N0m2AwYSlSMgCP9mGAEf63GyYc1Qwkbf8mttG0/+hzNVHH4lamoUowj3g6tjXcQm3dQn
         N3uliJguM7FZ7FLtBwmRR8oGNbfXlpZbnMfS0X3kcd2rUjVhJYPVAYA/QftPRAJdKwds
         694pJp5Mo3zfhPdBiOW9ydzbEKKxSqK+LYx4atFXkMqtK42jksObnHUktvhVSZF8p2Ok
         rB66woChn8e14U66TrtZFKdvy6pG6en6ywSPtGj6PWJKvFamOKrokwsDJPIJT4+36r7X
         098Q==
X-Gm-Message-State: AGRZ1gLX2m5WfJo3i3ZrEePo5e0eIq8PbBHMit7RfLJykTqyCA3GxqQM
        ON5nXPax1Jgg2XHz7mQlJF1t3Zk12gjD5IrpQugZaQ==
X-Google-Smtp-Source: AJdET5dRtd2lSrxJi2t49sQUZqBKQepu8B5K395JPeQdkDeEmtDX5hhSXCo3xzLWknDmEVPoPC6Muf8ZJHy8szHRJko=
X-Received: by 2002:a67:6346:: with SMTP id x67mr3386449vsb.114.1542832712373;
 Wed, 21 Nov 2018 12:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20181121201452.77173-1-dancol@google.com> <20181121203150.GK3065@bombadil.infradead.org>
In-Reply-To: <20181121203150.GK3065@bombadil.infradead.org>
From:   Daniel Colascione <dancol@google.com>
Date:   Wed, 21 Nov 2018 12:38:20 -0800
Message-ID: <CAKOZueuCYOsaHZzoz5nNPr8Jb-fEiHTR4MektaJx8vuUXcrKCQ@mail.gmail.com>
Subject: Re: [PATCH] Add /proc/pid_generation
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        Primiano Tucci <primiano@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Roman Gushchin <guro@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>, rostedt@goodmis.org,
        tglx@linutronix.de, mingo@kernel.org, linux@dominikbrodowski.net,
        pasha.tatashin@oracle.com, jpoimboe@redhat.com,
        ard.biesheuvel@linaro.org, Michal Hocko <mhocko@suse.com>,
        David Howells <dhowells@redhat.com>, ktsanaktsidis@zendesk.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 21, 2018 at 12:31 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Nov 21, 2018 at 12:14:44PM -0800, Daniel Colascione wrote:
> > This change adds a per-pid-namespace 64-bit generation number,
> > incremented on PID rollover, and exposes it via a new proc file
> > /proc/pid_generation. By examining this file before and after /proc
> > enumeration, user code can detect the potential reuse of a PID and
> > restart the task enumeration process, repeating until it gets a
> > coherent snapshot.
> >
> > PID rollover ought to be rare, so in practice, scan repetitions will
> > be rare.
>
> Then why does it need to be 64-bit?

[Resending because of accidental HTML. I really need to switch to a
better email client.]

Because 64 bits is enough for anyone. :-) A u64 is big enough that
we'll never observe an overflow on a running system, and PID
namespaces are rare enough that we won't miss the four extra bytes we
use by upgrading from a u32.  And after reading about some security
problems caused by too-clever handling of 32-bit rollover, I'd rather
the code be obviously correct than save a trivial amount of space.
