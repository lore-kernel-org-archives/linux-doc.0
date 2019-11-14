Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2B7F7D917
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 21:31:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfKNVb5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 16:31:57 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43877 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfKNVb5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Nov 2019 16:31:57 -0500
Received: by mail-pl1-f195.google.com with SMTP id a18so3228149plm.10
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2019 13:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65HSXQZZvC+/36nWRxi7ayh5ugCD+//ae3UvWO/bo+8=;
        b=q4IOaIOzI3BOqR8J3mgnWAzCjuGF5LCn2dxCiw71DBIgDFtoFob5dK6W8qNXuBQeMV
         +Ox2dlXddZ2j6huRmqLeRbtKhpFgeegQM3xNYX1GMOZOE+Rf+GU418VNhywe4YphoM2G
         APqF+9KV5t5AT4UOUgtM0U13evExmWdSqzXCjuLHg4qEAuz3xANyHYIXgqZLx1LzpZcO
         +d2ZsVhzbfwI6jReOak16+7Rm6BEEnNJu6IKo8oeVwyKW3xsrHo5IQbTkvcUtxkS3olx
         H3Q09DBHE/d8tQNNJ9QsOdmyMXdagEHo0jx9RI2U+jEssrnJVjiN6u0n1CknFjiqqTQ6
         3MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65HSXQZZvC+/36nWRxi7ayh5ugCD+//ae3UvWO/bo+8=;
        b=Xb/sswulw5fAzBoUiGjVzjXuuDpeZ9uK6qvvyZ0kgFuQ9YqvNArED0qcDn8+mxfAvG
         183w+6ELAMHWReqbaCPJ+UOq5D++bRitZ2SG9PzqTTAXjoXui1zIc5KjPjeamxAl6HCa
         RByP9zmyPRI6b/0XDfb//buohOfge0EEf/RiJaT4OpRTY2125M821LlAHSlKnzv8XCD8
         qtyiHrGFG4AI3wDTHAIEwsMssuvyliy+i/w3431Y5UvF64x0sVOgGUmwdPThtoDPqhgP
         oI3C8M9gZaqrfOXpMsc5aaCklNjKd9+nrUK2L6l7o4wcG2OSPzNQkzaMfJ0EdV6vU5bo
         iHmA==
X-Gm-Message-State: APjAAAV1hvgKoMya793WdK2c+rRrnYEy8WDGUCe1zFujAUXzJk2u7zBA
        7YDZ/MVRulujb6xUQh46BJAVym2bsTuhJ1Skm150nw==
X-Google-Smtp-Source: APXvYqxH+ifod/IWDxoHtYfouItz+Syp5fDryyAfjsq+05jmWRZli73E6kfn1cFSoo5LC65H6fwSX9rddOsVcBjCCZU=
X-Received: by 2002:a17:902:8c8a:: with SMTP id t10mr4760525plo.325.1573767114814;
 Thu, 14 Nov 2019 13:31:54 -0800 (PST)
MIME-Version: 1.0
References: <1571335639-21675-1-git-send-email-alan.maguire@oracle.com>
 <1571335639-21675-6-git-send-email-alan.maguire@oracle.com>
 <CAFd5g46s4eY4qEB5UZPeOKNdZXm4+sA9N=4g8gDYAhyhMahZKw@mail.gmail.com>
 <alpine.LRH.2.20.1911081520550.24027@dhcp-10-175-178-67.vpn.oracle.com>
 <CAFd5g44vYUkLQmJFq_vQ5ruvBC_1vrkSd9DeW3oQ_vLzrNcpgQ@mail.gmail.com>
 <20191114063815.9403820706@mail.kernel.org> <alpine.LRH.2.20.1911140750450.8907@dhcp-10-175-202-216.vpn.oracle.com>
In-Reply-To: <alpine.LRH.2.20.1911140750450.8907@dhcp-10-175-202-216.vpn.oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 14 Nov 2019 13:31:43 -0800
Message-ID: <CAFd5g46hMRR8L1Yd64ypWCqs5CpFpY_BCXfSCx0uc68ZzbiPzQ@mail.gmail.com>
Subject: Re: [PATCH v3 linux-kselftest-test 5/6] kunit: allow kunit to be
 loaded as a module
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

+kselftest and kunit lists to document this decision.

On Wed, Nov 13, 2019 at 11:54 PM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> On Wed, 13 Nov 2019, Stephen Boyd wrote:
>
> > Quoting Brendan Higgins (2019-11-11 13:41:38)
> > > +Stephen Boyd - since he is more of an expert on the hung task timer than I am.
> > >
> > > On Fri, Nov 8, 2019 at 7:30 AM Alan Maguire <alan.maguire@oracle.com> wrote:
> > > >
> > > > On Thu, 7 Nov 2019, Brendan Higgins wrote:
> > > >
> > > > > On Thu, Oct 17, 2019 at 11:09 AM Alan Maguire <alan.maguire@oracle.com> wrote:
> > > > > > +MODULE_LICENSE("GPL");
> > > > > > diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> > > > > > index 1c1e9af..72fc8ed 100644
> > > > > > --- a/lib/kunit/try-catch.c
> > > > > > +++ b/lib/kunit/try-catch.c
> > > > > > @@ -31,6 +31,8 @@ static int kunit_generic_run_threadfn_adapter(void *data)
> > > > > >         complete_and_exit(try_catch->try_completion, 0);
> > > > > >  }
> > > > > >
> > > > > > +KUNIT_VAR_SYMBOL(sysctl_hung_task_timeout_secs, unsigned long);
> > > > >
> > > > > Can you just export sysctl_hung_task_timeout_secs?
> > > > >
> > > > > I don't mean to make you redo all this work for one symbol twice, but
> > > > > I thought we agreed on just exposing this symbol, but in a namespace.
> > > > > It seemed like a good use case for that namespaced exporting thing
> > > > > that Luis was talking about. As I understood it, you would have to
> > > > > export it in the module that defines it, and then use the new
> > > > > MODULE_IMPORT_NS() macro here.
> > > > >
> > > >
> > > > Sure, I can certainly look into that, though I wonder if we should
> > > > consider another possibility - should kunit have its own sysctl table for
> > > > things like configuring timeouts? I can look at adding a patch for that
> > >
> > > So on the one hand, yes, I would like to have configurable test
> > > timeouts for KUnit, but that is not what the parameter check is for
> > > here. This is to make sure KUnit times a test case out before the hung
> > > task timer does.
> > >
> > > > prior to the module patch so the issues with exporting the hung task
> > > > timeout would go away. Now the reason I suggest this isn't as much a hack
> > > > to solve this specific problem, rather it seems to fit better with the
> > > > longer-term intent expressed by the comment around use of the field (at
> > > > least as I read it, I may be wrong).
> > >
> > > Not really. Although I do agree that adding configurability here might
> > > be a good idea, I believe we would need to clamp such a value by
> > > sysctl_hung_task_timeout_secs regardless since we don't want to be
> > > killed by the hung task timer; thus, we still need access to
> > > sysctl_hung_task_timeout_secs either way, and so doing what you are
> > > proposing would be off topic.
> > >
> > > > Exporting the symbol does allow us to piggy-back on an existing value, but
> > > > maybe we should support out our own tunable "kunit_timeout_secs" here?
> > > > Doing so would also lay the groundwork for supporting other kunit
> > > > tunables in the future if needed. What do you think?
> > >
> > > The goal is not to piggy back on the value as I mentioned above.
> > > Stephen, do you have any thoughts on this? Do you see any other
> > > preferable solution to what Alan is trying to do?
> >
> > One idea would be to make some sort of process flag that says "this is a
> > kunit task, ignore me with regards to the hung task timeout". Then we
> > can hardcode the 5 minute kunit timeout. I'm not sure we have any more
> > flags though.
> >
> > Or drop the whole timeout clamping logic, let the hung task timeout kick
> > in and potentially oops the kernel, but then continue to let the test
> > run and maybe sometimes get the kunit timeout here. This last option
> > doesn't sound so bad to me given that this is all a corner case anyway
> > where we don't expect to actually ever hit this problem so letting the
> > hung task detector do its job is probably fine. This nicely avoids
> > having to export this symbol to modules too.
> >
>
> Thanks for suggestions! This latter approach seems fine to me; presumably
> something has gone wrong if we are tripping the hung task timeout anyway,
> so having an oops to document that seems fine. Brendan, what do you think?

If Stephen thinks it is fine to drop the clamping logic, I think it is
fine too. I think it would probably be good to replace it with a
comment under the TODO that explains that a hung test *can* cause an
oops if the hung task timeout is less than the kunit timeout value. It
would probably be good to also select a timeout value that is less
than the default hung task timeout. We might also want to link to this
discussion. I fully expect that the timeout logic will get more
attention at some point in the future.

One more thing: Alan, can you submit the commit that drops the
clamping logic in its own commit? I would prefer to make sure that it
is easy to spot in the commit history.

Cheers!
