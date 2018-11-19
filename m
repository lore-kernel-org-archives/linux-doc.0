Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA4A97D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 16:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbeKTCsM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 21:48:12 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38854 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729922AbeKTCsJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 21:48:09 -0500
Received: by mail-vs1-f65.google.com with SMTP id x64so18104928vsa.5
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 08:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=b/dNaTvz6Bhl24QHJ1GX7PHoKH/Ynzj09/enaeXKn6k=;
        b=L6mQaLBx1jcDiwBhZpdROTnuyCRBdcapfT7uRtrNPM99BCVmZlEH+5YGsDBrT079HI
         bA15jwju7thTg33v0zQusbxauwrGKIlbqfvAZ/Pgujx2RhN65agYakrPWUl33eX5w7E7
         CypPXjaEtWtUTJ4I8QQGi50rvp+EOoBuUquBhcg51U0C+c8Yr4+ls0FgV7H3PbtFU0l7
         cWSSHrhn9h5ZIYVwskRfET1FeFKF3EbqCLTJ3YYDT+bvdyOvHMRXUx7TfcSeBZJqR8M6
         9s67GrBsr0FUz9aA7Kr6/NFZcCVAYnUrHrG+sypCZoTXQF9e8l+LUfVvW8wVK9cv1glG
         RPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=b/dNaTvz6Bhl24QHJ1GX7PHoKH/Ynzj09/enaeXKn6k=;
        b=CDubdkrDwipomgq9X0H2wvMNDozq7BOi/wYEocnwFl9vSgPl2LgOb1kUWL6wbkoWKA
         aXSjKtn1Y8ZCQNXPgU0+js79auQ+jN5vjciGy+UXC/GXFU85KhSF7M8JFaB+wmvbSzjM
         yNLu6JjNwWHzc5S0W7eETHMjCjSfc54bbKXqXsn8HWko/wkcXK1Y+AsGX2nfmYZHc2dj
         +s1aPVNvrjWqFrHpH6KhOaKVFPiqlFNBcgR4dGnbq5eyCeIHOfzWfdpgfAwtYmwpZ96J
         xv6XVEuM3BbHAYewUc0pdA/VtFgQNDvgx0hIy/S+9bah0wvT5laptm2DFIMe+ZxzRizh
         KxJw==
X-Gm-Message-State: AGRZ1gKmEYErl1Ms/jrz6990YmjUHxYmSBRB6gMNxkZWUiVfaFC83lGs
        Ds0aZG9FwRgVJ6Qr065ymQGs490JAvEgrKGYHg+TIg==
X-Google-Smtp-Source: AJdET5fuwC9FemPQeEUsmu4GvOG/IMwUzq8xLVs/+keTmXetuxjRRdTqKDFUiH4dn895owhJUx2eL5CF4E5+kC98GnA=
X-Received: by 2002:a67:6346:: with SMTP id x67mr9209047vsb.114.1542644643395;
 Mon, 19 Nov 2018 08:24:03 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a67:f48d:0:0:0:0:0 with HTTP; Mon, 19 Nov 2018 08:24:02
 -0800 (PST)
In-Reply-To: <20181119105426.GD28607@amd>
References: <20181031150625.147369-1-dancol@google.com> <20181105132205.138695-1-dancol@google.com>
 <20181119105426.GD28607@amd>
From:   Daniel Colascione <dancol@google.com>
Date:   Mon, 19 Nov 2018 08:24:02 -0800
Message-ID: <CAKOZueu3RQF4hOSg-0LCNVzJsJ=D_yfXg_uun2tqXW8aSkKykw@mail.gmail.com>
Subject: Re: [PATCH v2] Document /proc/pid PID reuse behavior
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Tim Murray <timmurray@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 2:54 AM, Pavel Machek <pavel@ucw.cz> wrote:
> On Mon 2018-11-05 13:22:05, Daniel Colascione wrote:
>> State explicitly that holding a /proc/pid file descriptor open does
>> not reserve the PID. Also note that in the event of PID reuse, these
>> open file descriptors refer to the old, now-dead process, and not the
>> new one that happens to be named the same numeric PID.
>>
>> Signed-off-by: Daniel Colascione <dancol@google.com>
>> ---
>>  Documentation/filesystems/proc.txt | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> Moved paragraphed to start of /proc/pid section; added signed-off-by.
>>
>> diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
>> index 12a5e6e693b6..0b14460f721d 100644
>> --- a/Documentation/filesystems/proc.txt
>> +++ b/Documentation/filesystems/proc.txt
>> @@ -125,6 +125,13 @@ process running on the system, which is named after the process ID (PID).
>>  The link  self  points  to  the  process reading the file system. Each process
>>  subdirectory has the entries listed in Table 1-1.
>>
>> +Note that an open a file descriptor to /proc/<pid> or to any of its
>> +contained files or subdirectories does not prevent <pid> being reused
>> +for some other process in the event that <pid> exits. Operations on
>
> "does not" -> "may not"?
>
> We want to leave this unspecified, so that we can change it in future.

No. "Does not". I'm sick and tired of procfs behavior being vague and
unspecified to the point where even kernel developers have an
incorrect mental model of how it all works. With Christian Brauner's
good work in place and hopefully my own work to follow, we're moving
firmly in the direction of procfs handles being struct pid references.
Instead of waffling further, let's just buy into this model and do the
best job we can of making it work well.
