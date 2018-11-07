Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B1E27D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 18:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbeKHDxh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 22:53:37 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:37488 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbeKHDxg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 22:53:36 -0500
Received: by mail-ua1-f67.google.com with SMTP id u19so5159957uae.4
        for <linux-doc@vger.kernel.org>; Wed, 07 Nov 2018 10:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=QYUaHOK8vceZkSPfI0EfEH6FkTI2Ic5ANXg6IXsWYmc=;
        b=YC0wMXgD/6JkC3eFtRpoY8AcYg/O2fQU6GGWOAJcEVASz0v8EhaDijJ6+tNso/ndaS
         UhG7ghlec0rccuB/9cE59afXjOFEdgzJds3q2a8S2IkQp1eZWqvinQXoP7XmJTVrfrPa
         tqANjZ9HyIJVBsi2+8v7bsxVXUbV28aIFgPJmyENX1ExU+YEhkW9N7FwbJgLawr4htz3
         mN0TSDaCAXmHvCWmg7EMkJGzXZNIOEMNcY2EwIDJ/e+LF7sUsuAlT9BLk9T6yAlIsmNm
         uIXVob+16SlkjLoysy1drf5UbF/11n2aZXRDeO13wfDI4dbIVPYuj6/lrQKWqm+3XbwH
         m5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=QYUaHOK8vceZkSPfI0EfEH6FkTI2Ic5ANXg6IXsWYmc=;
        b=p54/BLU2XDFYtTkznLIzbBhksMKr8D7kP9ZHN9jQCY9L/jVIkpeKU2XRlxzJcR1kZr
         SYvhBzc21cJIQuXRoiq7jcTSv708RnHYGa6E9uLu3nUT1x4+r0IhBauvuSQYQZvcvoI6
         13jxwbryYcBxBkRQulj4m8ByxV3/PRpMOsZykJK0mv7nHLPq4nhpmsneAxIGQj5/N7/m
         8QMHw+F4AqSCUmu/qlIsPKjd8HRlTTT2gqVIabrSK+cHrBhg+JA/0Ge68H5hiJIUoZ/K
         YUMwMjF0LyTNrVPO441p/VGWQhnYRAWO4H7mFbDiiBP0hJTZy4gfSf1urG6Jf+d3Cj+l
         fUfw==
X-Gm-Message-State: AGRZ1gLXSGIBg6EGRDkAu3K7Vtha5mqPU06xsbjZBRwkmgJZAHKa+RlN
        XI3ypbORpiU/nGqkHoH+3AWAZ14omh07C4PSq2MIZQ==
X-Google-Smtp-Source: AJdET5cJ3YyoBa9PASXQjwTe9vA/PVGyjKkPxV2fXk1V9ONYIl+QZ2/FeF688dljQcEzH+tE+fEi0Cb6XOcowQeryks=
X-Received: by 2002:ab0:72a:: with SMTP id h39mr600663uah.11.1541614920550;
 Wed, 07 Nov 2018 10:22:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a67:f48d:0:0:0:0:0 with HTTP; Wed, 7 Nov 2018 10:21:59 -0800 (PST)
In-Reply-To: <20181107171644.GK3074@bombadil.infradead.org>
References: <20181031150625.147369-1-dancol@google.com> <20181105132205.138695-1-dancol@google.com>
 <20181106060113.GA4499@rapoport-lnx> <20181107171644.GK3074@bombadil.infradead.org>
From:   Daniel Colascione <dancol@google.com>
Date:   Wed, 7 Nov 2018 10:21:59 -0800
Message-ID: <CAKOZuet9KGHc9dAyC=-cMZNt39s2m9=YEu3R1-7ExWzaNzLzjA@mail.gmail.com>
Subject: Re: [PATCH v2] Document /proc/pid PID reuse behavior
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 7, 2018 at 9:16 AM, Matthew Wilcox <willy@infradead.org> wrote:
> On Tue, Nov 06, 2018 at 08:01:13AM +0200, Mike Rapoport wrote:
>> > diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
>> > index 12a5e6e693b6..0b14460f721d 100644
>> > --- a/Documentation/filesystems/proc.txt
>> > +++ b/Documentation/filesystems/proc.txt
>> > @@ -125,6 +125,13 @@ process running on the system, which is named after the process ID (PID).
>> >  The link  self  points  to  the  process reading the file system. Each process
>> >  subdirectory has the entries listed in Table 1-1.
>> >
>> > +Note that an open a file descriptor to /proc/<pid> or to any of its
>
> "open file descriptor" (the "a" is unnecessary)

Thanks for spotting that. I had to re-read that sentence three times
or so before even seeing that extra "a".

>> > +contained files or subdirectories does not prevent <pid> being reused
>> > +for some other process in the event that <pid> exits. Operations on
>> > +open /proc/<pid> file descriptors corresponding to dead processes
>> > +never act on any new process that the kernel may, through chance, have
>> > +also assigned the process ID <pid>. Instead, operations on these FDs
>> > +usually fail with ESRCH.
>
> The paragraph is a bit wordy.  More pithy:
>
> An open file descriptor for /proc/<pid> (or any of the files or
> subdirectories in it) does not prevent <pid> from being reused after
> the process exits.  Operations on a file descriptor referring to a dead
> process usually return ESRCH.  They do not act on any new process which
> has been assigned the same <pid>.

I'll send a new patch version --- unless we can just tweak the patch
when we merge it into the tree?
