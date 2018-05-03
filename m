Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 19ABF7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 20:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751278AbeECUsN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 16:48:13 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33485 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751103AbeECUsM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 16:48:12 -0400
Received: by mail-lf0-f68.google.com with SMTP id m18-v6so27954672lfb.0
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=gf6rEG65iq8aF4/6tNY3I3i+vBNOIcFPIhMuq0xJrgU=;
        b=ieEuCWNrboX6ks3pN+FcUzgHhqGkarKRKCV7ngIt+pMDwD62rPp61bKqWlKO89tXCD
         4hCPs1gxA1i8f0b+QQ8BtHLTcpxTwFvKQI8WNbPtkU63GacIuxuLWdW5O319OwB1W7U8
         /g2WOpagJMrzbYdoC2VcWiYZRlQ6DeueVh2Q1GxN/Fxcbrg7U5W1pGMxgeIWOODYZEeZ
         VJuWA9nF+BTX1KVGMOs+iE3o5ddqwVGmPFZh0WtDymDt08plDfT8P016yiemLKO80sYk
         bydh/IHUmBCgqyJJaRTwlXyuoIrcqoQbi7P+DDzgS80G7gnevFr3KlNQ9gfJmHBjIj6t
         0xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=gf6rEG65iq8aF4/6tNY3I3i+vBNOIcFPIhMuq0xJrgU=;
        b=j7YSyl4i1P8xEe/Djuoato4ARQyAIDC0GXJdYf6C+3QR8LNFzR0rPeyljF3ME9eyos
         DseCQk7s/Dd2hucIZ07AY19bPMBn+j2b3gqwGS7fiiUtdzkW6U40vYwRsEcbx9HreitS
         WD/vcjxYJfHSy7fWxSIsAeh2a5H1rbeiKfHBABYlLD3mkeqLQYQrvVInRJjgWTh2lu0V
         IhtPYFZypAQQs3u34vdTCjJHH8eoPWQed0sz4/OSMwIxZB+Ukp6uea0bEEW2PqqywtKM
         Y0ejzN4YK04Mtv3k/cs/4eT2bs5tI1f3KRKGqiuFGyPvv7qtgnTPBHJ422YjKTxrgjJH
         5PDw==
X-Gm-Message-State: ALQs6tA8o+HQJ6AZ0m+HNe8SmMMTYW5aOpho3hk6rs/7k7aavoipkWGX
        YFrd+o7AFkdCWPzvwCyFDGdbgTZhN30MNaC3QG9O
X-Google-Smtp-Source: AB8JxZpJWMC/bc06/onvQOSJOpCq0U9a8Y3kFdO7vINGxYc8UM7z84VRPPOFa+k2jTHCygCb1AqRX9YvtA1QnzJ+I4k=
X-Received: by 2002:a2e:8246:: with SMTP id j6-v6mr7911754ljh.72.1525380490243;
 Thu, 03 May 2018 13:48:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c78f:0:0:0:0:0 with HTTP; Thu, 3 May 2018 13:48:09 -0700 (PDT)
X-Originating-IP: [108.20.156.165]
In-Reply-To: <3241732.94y415NZZK@x2>
References: <1525276400-7161-1-git-send-email-tyhicks@canonical.com>
 <2193990.pCRMhOm3SD@x2> <CAHC9VhS69VD9+L=oN-uLZqvo7BCg+HOvEuT4mnv8Wy7qo2MLMA@mail.gmail.com>
 <3241732.94y415NZZK@x2>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 3 May 2018 16:48:09 -0400
Message-ID: <CAHC9VhSq=56twBxnzZ8T=APGvtZV39FrHFVqmDMiKOK=WeWJRA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] seccomp: Audit attempts to modify the
 actions_logged sysctl
To:     Steve Grubb <sgrubb@redhat.com>,
        Tyler Hicks <tyhicks@canonical.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, Eric Paris <eparis@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-audit@redhat.com,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 3, 2018 at 4:42 PM, Steve Grubb <sgrubb@redhat.com> wrote:
> On Thursday, May 3, 2018 4:18:26 PM EDT Paul Moore wrote:
>> On Wed, May 2, 2018 at 2:18 PM, Steve Grubb <sgrubb@redhat.com> wrote:
>> > On Wednesday, May 2, 2018 11:53:19 AM EDT Tyler Hicks wrote:
>> >> The decision to log a seccomp action will always be subject to the
>> >> value of the kernel.seccomp.actions_logged sysctl, even for processes
>> >> that are being inspected via the audit subsystem, in an upcoming patch.
>> >> Therefore, we need to emit an audit record on attempts at writing to the
>> >> actions_logged sysctl when auditing is enabled.
>> >>
>> >> This patch updates the write handler for the actions_logged sysctl to
>> >> emit an audit record on attempts to write to the sysctl. Successful
>> >> writes to the sysctl will result in a record that includes a normalized
>> >> list of logged actions in the "actions" field and a "res" field equal to
>> >> 0. Unsuccessful writes to the sysctl will result in a record that
>> >> doesn't include the "actions" field and has a "res" field equal to 1.
>> >>
>> >> Not all unsuccessful writes to the sysctl are audited. For example, an
>> >> audit record will not be emitted if an unprivileged process attempts to
>> >> open the sysctl file for reading since that access control check is not
>> >> part of the sysctl's write handler.
>> >>
>> >> Below are some example audit records when writing various strings to the
>> >> actions_logged sysctl.
>> >>
>> >> Writing "not-a-real-action", when the kernel.seccomp.actions_logged
>> >> sysctl previously was "kill_process kill_thread trap errno trace log",
>> >>
>> >> emits this audit record:
>> >>  type=CONFIG_CHANGE msg=audit(1525275273.537:130): op=seccomp-logging
>> >>  old-actions=kill_process,kill_thread,trap,errno,trace,log res=0
>> >>
>> >> If you then write "kill_process kill_thread errno trace log", this audit
>> >>
>> >> record is emitted:
>> >>  type=CONFIG_CHANGE msg=audit(1525275310.208:136): op=seccomp-logging
>> >>  actions=kill_process,kill_thread,errno,trace,log
>> >>  old-actions=kill_process,kill_thread,trap,errno,trace,log res=1
>> >>
>> >> If you then write the string "log log errno trace kill_process
>> >> kill_thread", which is unordered and contains the log action twice,
>> >>
>> >> it results in the same actions value as the previous record:
>> >>  type=CONFIG_CHANGE msg=audit(1525275325.613:142): op=seccomp-logging
>> >>  actions=kill_process,kill_thread,errno,trace,log
>> >>  old-actions=kill_process,kill_thread,errno,trace,log res=1
>> >>
>> >> No audit records are generated when reading the actions_logged sysctl.
>> >
>> > ACK for the format of the records.
>>
>> I just wanted to clarify the record format with you Steve ... the
>> "actions" and "old-actions" fields may not be included in the record
>> in cases where there is an error building the action value string, are
>> you okay with that or would you prefer the fields to always be
>> included but with a "?" for the value?
>
> A ? would be more in line with how other things are handled.

That's what I thought.

Would you mind putting together a v3 Tyler? :)

-- 
paul moore
www.paul-moore.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
